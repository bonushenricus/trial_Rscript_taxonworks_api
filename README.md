# trial of R script to use taxonworks_api to extrapolate biological associations from UCD
the goal is to have a draft of host-parasitoid relationships referenced to UCD project biological association data in taxonworks, starting with a csv with a list of species identified by Malaise trap and period
- A_httr2_taxonworks_sandfly_biological_association.R: it runs. First step: search the taxon_name_id of a taxon name
- B_httr2_taxonworks_sandfly_taxon_names.R: it doesn't run. Second step: search the biological association of a taxon_name_id. I have problem with query configuration of integer arrays in httr2. I createe an issue in httr2: https://github.com/r-lib/httr2/issues/436
