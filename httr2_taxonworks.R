#the first step is to extrapolate the identifiers of the identified species
#I try with the package httr2
# https://httr2.r-lib.org/articles/wrapping-apis.html
# https://www.tidyverse.org/blog/2023/11/httr2-1-0-0/
## let's try in sandfly
## token to be done only once
## a key is generated
library(httr2)
key <- secret_make_key()
#encripte token
secret_scrambled <- secret_encrypt("qUEQWyR8_8MGxM9GGQxM4w", key) #what is my token? I read it from my account dashboard

#From this point it is instead to be done every time
library(httr2)
token <- secret_decrypt(secret_scrambled, key)

#I try to make a function to extrapolate taxon_names identifiers
taxon_names_id <- function(...) {
  request("https://sandfly.taxonworks.org/api/v1") |> 
    req_url_path_append("/taxon_names/filter.json") |>
    req_headers(Authorization = paste("token", token)) |>
    req_url_query(...) |> 
    req_perform() |> 
    resp_body_json()
}
taxon_names_id(name="Eurytoma%20morio")
#Result: 
##Error in `req_perform()`:
##! HTTP 401 Unauthorized.
#where did I go wrong? Is the project ID missing? I don't think so, it should already be included in the token
