#reference: https://httr2.r-lib.org/articles/wrapping-apis.html - https://www.tidyverse.org/blog/2023/11/httr2-1-0-0/ - https://github.com/melissavanbussel/YouTube-Tutorials/blob/main/httr2/httr2_examples.R

library(httr2)
library(tidyverse)

#Define access token
access_token_taxonworks_sandfly = "qUEQWyR8_8MGxM9GGQxM4w"
project_token_taxonworks_sandfly = "mVY5aWD-vLsfAxDGQeWaJA"

#Define base urls
base_url_taxonworks_sandfly = "https://sandfly.taxonworks.org/api/v1"

#find biological association data for the id
#Define endpoints
endpoint_bioass = "/biological_associations" #second objectives: get the biological association of a taxon_id of a taxon name

#Define request
req_bioass_sandfly = request(base_url_taxonworks_sandfly) %>% 
  req_url_path_append(endpoint_bioass) %>%
  req_url_query(project_token=project_token_taxonworks_sandfly) #the project_token is necessary to authorize the request

#Define query
#Define query
req_bioass_sandfly_query = req_bioass_sandfly %>%
  req_url_query(
    "subject_taxon_name_id[]"=474243) %>%
  req_url_query(
    "biological_relationship_id[]"=13) %>% #13 is the "parasitoid host relationship"
  req_url_query(
    taxon_name_id_mode="true")
#title of integer array in httr2 into ""

#Provide access token via header
req_bioass_sandfly_query_auth = req_bioass_sandfly_query %>%
  req_headers(
    'Authorization'=paste0('Token ',access_token_taxonworks_sandfly)
  )

#Perform response
resp_perform_bioass_sandfly = req_bioass_sandfly_query_auth %>%
  req_perform()
resp_perform_bioass_sandfly_json = resp_perform_bioass_sandfly |> 
  resp_body_json()

resp_perform_bioass_sandfly_string = resp_perform_bioass_sandfly |> 
  resp_body_string()

#Transform to dataframe
library(jsonlite)
resp_perform_bioass_sandfly_dataframe = fromJSON(resp_perform_bioass_sandfly_string) %>% as.data.frame()
