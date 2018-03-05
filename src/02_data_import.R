# GOAL: import all relevant data for analysis of % approaching and % meeting
# most student achievement data will have data locked into headers

# CAMPUS information ------------------------------------------------------
# corresponding key:
## Campus Name, District Name, County Name, Region Number...

# importing campus-level data and selecting for columns of interest
# all columns are imported as character columns by default
campus <- read_csv(here("data/raw", "CREF.csv")) %>% 
  select("CAMPUS", "CAMPNAME", "DISTRICT", "DISTNAME", "GRDTYPE")


# APPROACHES, MEETS, & MASTERS by school level -------------------------------------------------- 
# corresponding keys:
## Campus STAAR Data - Approaches Grade Level or Above (All Grades)
## Campus STAAR Data - Meets Grade Level (All Grades)
## Campus STAAR Data - Masters Grade Level (All Grades)

# importing all student achievement data - not selecting for columns of interest at this point
# all columns are imported as character columns by default
achievement <- read_csv(here("data/raw", "CAMPSTAAR2.csv"))
