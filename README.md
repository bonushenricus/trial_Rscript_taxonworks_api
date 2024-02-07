# trial of R script to use taxonworks_api to extrapolate biological associations from UCD
the goal is to have a draft of host-parasitoid relationships referenced to UCD project biological association data in taxonworks, starting with a csv with a list of species identified by Malaise trap and period
- A_httr2_taxonworks_sandfly_taxon_names.R: it runs. First step: search the taxon_name_id of a taxon name
- B_httr2_taxonworks_sandfly_biological_association.R: it runs. Second step: search the biological association of a taxon_name_id.
