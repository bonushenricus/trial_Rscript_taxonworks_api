#reference: https://httr2.r-lib.org/articles/wrapping-apis.html - https://www.tidyverse.org/blog/2023/11/httr2-1-0-0/ - https://github.com/melissavanbussel/YouTube-Tutorials/blob/main/httr2/httr2_examples.R

library(httr2)
library(tidyverse)

#Define access token
access_token_taxonworks_sandfly = TAXONWORKS_TOKEN
project_token_taxonworks_sandfly = TAXONWORKS_PROJECT_TOKEN

#Define base urls
base_url_taxonworks_sandfly = "https://sandfly.taxonworks.org/api/v1"

#Define endpoints
endpoint_taxonnames = "/taxon_names" #first objectives: get the taxon_id of a taxon name

#Define request
req_taxonnames_sandfly = request(base_url_taxonworks_sandfly) %>% 
  req_url_path_append(endpoint_taxonnames) %>%
  req_url_query(project_token=project_token_taxonworks_sandfly) #the project_token is necessary to authorize the request

#Define query
req_taxonnames_sandfly_query = req_taxonnames_sandfly %>%
  req_url_query(
    validity="true",
    name_exact="true",
    name="Eurytoma morio")

#Provide access token via header
req_taxonnames_sandfly_query_auth = req_taxonnames_sandfly_query %>%
  req_headers(
    'Authorization'=paste0('Token ',access_token_taxonworks_sandfly)
  )

#Perform response
resp_perform_taxonnames_sandfly = req_taxonnames_sandfly_query_auth %>%
  req_perform()
resp_perform_taxonnames_sandfly_json = resp_perform_taxonnames_sandfly |> 
  resp_body_json()

resp_perform_taxonnames_sandfly_string = resp_perform_taxonnames_sandfly |> 
  resp_body_string()

#Transform to dataframe
library(jsonlite)
resp_perform_taxonnames_sandfly_dataframe = fromJSON(resp_perform_taxonnames_sandfly_string) %>% as.data.frame()


