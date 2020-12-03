 ## correlates of state public policy project data download

 ## politicaldata download

# download the NOMINATE scores for the 116th House
house_ideo <- get_house_nominate(congress = 116)

# download the NOMINATE scores for the Senate in the 116th Congress
senate_ideo <- get_senate_nominate(congress = 116)

# take a look with dplyr::head()
head(house_ideo[1:5])

res <- voteview_search("Iraq")
names(res)

res[1:5,1:5]

## Get a rollcall object using the ids, please limit to a few ids for now
rc <- voteview_download(res$id[1:10])

summary(rc)


## Voteview search with options
res <- voteview_search(
  "Iraq", 
  chamber = "House",
  congress = 110:112,
  enddate = "2013-04-20")
#> Query '(Iraq) AND (enddate:2013-04-20) AND (congress:110 111 112) AND (chamber:house)' returned 49 rollcalls...
res[1:5, 1:5]

# print out the exact query that the function builds using all of these arguments by retrieving the 'qstring' attribute of the returned data frame
attr(res, "qstring")

# We can assemble and use these complex queries ourselves. 
# Here's one example where we look for all roll calls with the key words "estate", "death", or "tax" and was held in the 100th to the 114th Congress.

## Voteview search with options
res <- voteview_search("(alltext:estate death tax congress:[100 to 114])")
#> Query '(alltext:estate death tax congress:[100 to 114])' returned 2035 rollcalls...
res[1:5, 1:5]

# You can also search for member data using the member_search function.
res <- member_search("Paul", state = "KY")

##  A list of functions:

# get_house_nominate() returns DW-NOMINATE ideology scores for each member of the U.S. House of Representatives for a specified congress, else every Representative ever.
# get_senate_nominate() returns DW-NOMINATE ideology scores for each member of the U.S. Senate for a specified congress, else every Senator ever.
# trump_approval_polls_538() returns a dataset of approval polls aggregated by the folks over at FiveThirtyEight.
# get_cap_mip() returns a historical dataset of the aggregated responses to Gallup’s Most Important Problem questions, coded by major topic. Part of a suite of functions for obtaining data from the Comparative Agendas Project.

# A list of datasets:

# house_116 is a saved copy of the output from get_house_nominate(congress=116) run on the last day the package was updated (and thus should only be used for demos, unless you want outdated data).
# senate_116 is the same as the above, bur for the Senate. Downloaded via get_senate_nominate(congress=116).
# us_polls_history is a dataset of US presidential election polling from the 1980 through 2016 elections.
# house_results is a dataset of results for elections to the US House of Representatives that occurred from 1976 to 2018
# pres_results_by_cd is a dataset of results for presidential elections broken down by congressional district from 1990 to 2016
