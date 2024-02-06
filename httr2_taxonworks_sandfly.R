library(httr2)
library(tidyverse)

#Define access token
access_token_taxonworks_sandfly = "qUEQWyR8_8MGxM9GGQxM4w"
project_token_taxonworks_sandfly = "mVY5aWD-vLsfAxDGQeWaJA"

#Define base urls
base_url_taxonworks_sandfly = "https://sandfly.taxonworks.org/api/v1"

#Define endpoints
endpoint_taxonworks = "/taxon_names"

#Define request
req_taxonworks_sandfly = request(base_url_taxonworks_sandfly) %>% 
  req_url_path_append(endpoint_taxonworks) %>%
  req_url_query(project_token=project_token_taxonworks_sandfly)

req_taxonworks_sandfly_query = req_taxonworks_sandfly %>%
  req_url_query(name="Eurytoma morio")

#Provide access token via header
headers_taxonworks = req_taxonworks_sandfly_query %>%
  req_headers(
    'Authorization'=paste0('Token ',access_token_taxonworks_sandfly)
  )

#Perform response
resp_perform_taxonworks_sandfly = headers_taxonworks %>%
  req_perform()
resp_perform_taxonworks_sandfly |> resp_raw()
#It runs!!! Yuppie!!!!
