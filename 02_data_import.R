
# CAMPUS information ------------------------------------------------------
# importing campus-level data
# corresponding key: Reference - Campus Name, District Name, Country Name, Region Number
campus_data_raw <- read_csv("CREF.csv")
campus_data <- campus_data_raw

head(campus_data)
# CAMPUS information:
## character
## two leading zeroes
campus_data$CAMPUS <- as.numeric(campus_data$CAMPUS)
# strip leading zeroes from CAMPUS column
campus_data <- lapply(campus_data, function(y) sub('^0+(?=[1-9])', '', y, perl=TRUE))
# convert campus data to a tibble instead of a list
campus_data <- as_tibble(campus_data)
# convert CAMPUS column to numeric
campus_data$CAMPUS = as.numeric(campus_data$CAMPUS)
# select only the columns of interest
campus <- campus_data[c("CAMPUS", "DISTRICT", "CAMPNAME", "COUNTY", "DISTNAME", 
                        "CAD_READ", "CAD_MATH", "CAD_GAP", "CAD_PROGRESS", "GRDTYPE")]
head(campus)



# APPROACHES grade level --------------------------------------------------
# corresponding keys:
## Campus STAAR Data - Approaches Grade Level or Above (Grades 3, 4, & 5) Primary Student Groups
## Campus STAAR Data - Approaches Grade Level or Above (Grades 6, 7, & 8) Primary Student Groups
## Campus STAAR Data - Approaches Grade Level or Above (Grades End of Course) Primary Student Groups
app_data_raw <- read_csv("CAMPSTAAR1.csv")
approaches <- app_data_raw
# converts data to numeric
# introduces NAs by coercion - this is OK, as it removes the "dots"
approaches[] <- lapply(approaches, function(x) as.numeric(as.character(x)))

head(approaches)
# CAMPUS information:
## character
## no leading zeroes
colnames(approaches)



# MEETS grade level -------------------------------------------------------
# corresponding key:
## Campus STAAR Data - Meets Grade Level (All Grades) Primary Student Groups
meet_data_raw <- read_csv("CAMPSTAAR2.csv")
meets <- meet_data_raw
meets[] <- lapply(meets, function(x) as.numeric(as.character(x)))

head(meets)
# CAMPUS information:
# numeric
# no leading zeroes


# MOBILITY data -----------------------------------------------------------
# mobility from CSTUD data set
mobility_raw <- read_csv("CSTUD.csv")
mobility <- mobility_raw
# converts data to numeric
mobility[] <- lapply(mobility, function(x) as.numeric(as.character(x)))
# mobility$CAMPUS <- as.character(mobility$CAMPUS)
  
head(mobility)
# CAMPUS information
# character
# no leading zeroes
# note - mobility reflects campus-level mobility!
colnames(mobility)
mobility <- mobility[c("CAMPUS", "CPEMALLP", "CPETBILP", "CPETECOP")]
names(mobility) <- c("CAMPUS", "all_mobility", "bilingual_mobility", "low_ses_mobility")
