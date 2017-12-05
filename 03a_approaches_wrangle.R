
# creating initial dataset ------------------------------------------------
# Create a tibble from the 'approaches' dataset, using only the columns needed
staar_complt <- approaches[c("CAMPUS",
                     # 3rd math 2016
                     "CA03AMA1S16N", "CA03AMA1016D",
                     # 3rd reading 2016
                     "CA03ARE1S16N", "CA03ARE1016D",
                     # 4th math 2016
                     "CA04AMA1S16N", "CA04AMA1016D",
                     # 4th reading 2016
                     "CA04ARE1S16N", "CA04ARE1016D",
                     # 5th math 2016
                     "CA05AMA1S16N", "CA05AMA1016D",
                     # 5th reading 2016
                     "CA05ARE1S16N", "CA05ARE1016D",
                     # 6th math 2016
                     "CA06AMA1S16N", "CA06AMA1016D",
                     # 6th reading 2016
                     "CA06ARE1S16N", "CA06ARE1016D",
                     # 7th math 2016
                     "CA07AMA1S16N", "CA07AMA1016D",
                     # 7th reading 2016
                     "CA07ARE1S16N", "CA07ARE1016D",
                     # 8th math 2016
                     "CA08AMA1S16N", "CA08AMA1016D",
                     # 8th reading 2016
                     "CA08ARE1S16N", "CA08ARE1016D",
                     # HS math (algebra I) 2016
                     "CA00AA11S16N", "CA00AA11016D",
                     # HS english I 2016
                     "CA00AR11S16N", "CA00AR11016D",
                     # 3rd math 2017
                     "CA03AMA1S17N", "CA03AMA1017D",
                     # 3rd reading 2017
                     "CA03ARE1S17N", "CA03ARE1017D",
                     # 4th math 2017
                     "CA04AMA1S17N", "CA04AMA1017D",
                     # 4th reading 2017
                     "CA04ARE1S17N", "CA04ARE1017D",
                     # 5th math 2017
                     "CA05AMA1S17N", "CA05AMA1017D",
                     # 5th reading 2017
                     "CA05ARE1S17N", "CA05ARE1017D",
                     # 6th math 2017
                     "CA06AMA1S17N", "CA06AMA1017D",
                     # 6th reading 2017
                     "CA06ARE1S17N", "CA06ARE1017D",
                     # 7th math 2017
                     "CA07AMA1S17N", "CA07AMA1017D",
                     # 7th reading 2017
                     "CA07ARE1S17N", "CA07ARE1017D",
                     # 8th math 2017
                     "CA08AMA1S17N", "CA08AMA1017D",
                     # 8th reading 2017
                     "CA08ARE1S17N", "CA08ARE1017D",
                     # HS math (algebra I) 2017
                     "CA00AA11S17N", "CA00AA11017D",
                     # HS english I 2017
                     "CA00AR11S17N", "CA00AR11017D",
                     # 3rd math 2016 ELL
                         "CL03AMA1S16N", "CL03AMA1016D",
                         # 3rd reading 2016 ELL
                         "CL03ARE1S16N", "CL03ARE1016D",
                         # 4th math 2016 ELL
                         "CL04AMA1S16N", "CL04AMA1016D",
                         # 4th reading 2016 ELL
                         "CL04ARE1S16N", "CL04ARE1016D",
                         # 5th math 2016 ELL
                         "CL05AMA1S16N", "CL05AMA1016D",
                         # 5th reading 2016 ELL
                         "CL05ARE1S16N", "CL05ARE1016D",
                         # 6th math 2016 ELL
                         "CL06AMA1S16N", "CL06AMA1016D",
                         # 6th reading 2016 ELL
                         "CL06ARE1S16N", "CL06ARE1016D",
                         # 7th math 2016 ELL
                         "CL07AMA1S16N", "CL07AMA1016D",
                         # 7th reading 2016 ELL
                         "CL07ARE1S16N", "CL07ARE1016D",
                         # 8th math 2016 ELL
                         "CL08AMA1S16N", "CL08AMA1016D",
                         # 8th reading 2016 ELL
                         "CL08ARE1S16N", "CL08ARE1016D",
                         # HS math (algebra I) 2016 ELL
                         "CL00AA11S16N", "CL00AA11016D",
                         # HS english I 2016 ELL
                         "CL00AR11S16N", "CL00AR11016D",
                         # 3rd math 2017 ELL
                         "CL03AMA1S17N", "CL03AMA1017D",
                         # 3rd reading 2017 ELL
                         "CL03ARE1S17N", "CL03ARE1017D",
                         # 4th math 2017 ELL
                         "CL04AMA1S17N", "CL04AMA1017D",
                         # 4th reading 2017 ELL
                         "CL04ARE1S17N", "CL04ARE1017D",
                         # 5th math 2017 ELL
                         "CL05AMA1S17N", "CL05AMA1017D",
                         # 5th reading 2017 ELL
                         "CL05ARE1S17N", "CL05ARE1017D",
                         # 6th math 2017 ELL
                         "CL06AMA1S17N", "CL06AMA1017D",
                         # 6th reading 2017 ELL
                         "CL06ARE1S17N", "CL06ARE1017D",
                         # 7th math 2017 ELL
                         "CL07AMA1S17N", "CL07AMA1017D",
                         # 7th reading 2017 ELL
                         "CL07ARE1S17N", "CL07ARE1017D",
                         # 8th math 2017 ELL
                         "CL08AMA1S17N", "CL08AMA1017D",
                         # 8th reading 2017 ELL
                         "CL08ARE1S17N", "CL08ARE1017D",
                         # HS math (algebra I) 2017 ELL
                         "CL00AA11S17N", "CL00AA11017D",
                         # HS english I 2017 ELL
                         "CL00AR11S17N", "CL00AR11017D",
                     # 3rd math 2016 SES
                         "CE03AMA1S16N", "CE03AMA1016D",
                         # 3rd reading 2016 SES
                         "CE03ARE1S16N", "CE03ARE1016D",
                         # 4th math 2016 SES
                         "CE04AMA1S16N", "CE04AMA1016D",
                         # 4th reading 2016 SES
                         "CE04ARE1S16N", "CE04ARE1016D",
                         # 5th math 2016 SES
                         "CE05AMA1S16N", "CE05AMA1016D",
                         # 5th reading 2016 SES
                         "CE05ARE1S16N", "CE05ARE1016D",
                         # 6th math 2016 SES
                         "CE06AMA1S16N", "CE06AMA1016D",
                         # 6th reading 2016 SES
                         "CE06ARE1S16N", "CE06ARE1016D",
                         # 7th math 2016 SES
                         "CE07AMA1S16N", "CE07AMA1016D",
                         # 7th reading 2016 SES
                         "CE07ARE1S16N", "CE07ARE1016D",
                         # 8th math 2016 SES
                         "CE08AMA1S16N", "CE08AMA1016D",
                         # 8th reading 2016 SES
                         "CE08ARE1S16N", "CE08ARE1016D",
                         # HS math (algebra I) 2016 SES
                         "CE00AA11S16N", "CE00AA11016D",
                         # HS english I 2016 SES
                         "CE00AR11S16N", "CE00AR11016D",
                     # 3rd math 2017 SES
                         "CE03AMA1S17N", "CE03AMA1017D",
                         # 3rd reading 2017 SES
                         "CE03ARE1S17N", "CE03ARE1017D",
                         # 4th math 2017 SES
                         "CE04AMA1S17N", "CE04AMA1017D",
                         # 4th reading 2017 SES
                         "CE04ARE1S17N", "CE04ARE1017D",
                         # 5th math 2017 SES
                         "CE05AMA1S17N", "CE05AMA1017D",
                         # 5th reading 2017 SES
                         "CE05ARE1S17N", "CE05ARE1017D",
                         # 6th math 2017 SES
                         "CE06AMA1S17N", "CE06AMA1017D",
                         # 6th reading 2017 SES
                         "CE06ARE1S17N", "CE06ARE1017D",
                         # 7th math 2017 SES
                         "CE07AMA1S17N", "CE07AMA1017D",
                         # 7th reading 2017 SES
                         "CE07ARE1S17N", "CE07ARE1017D",
                         # 8th math 2017 SES
                         "CE08AMA1S17N", "CE08AMA1017D",
                         # 8th reading 2017 SES
                         "CE08ARE1S17N", "CE08ARE1017D",
                         # HS math (algebra I) 2017 SES
                         "CE00AA11S17N", "CE00AA11017D",
                         # HS english I 2017 SES
                         "CE00AR11S17N", "CE00AR11017D"
                         )]
# NAs are also coded as -1 and need to be removed
staar_complt[staar_complt == -1] <- NA




# gather() and mutate() ---------------------------------------------------
# need to get column headers (except for CAMPUS) into rows, and then separate into appropriate columns
# creating appr_staar dataset
appr_staar <- staar_complt %>%
  # gathering all columns except for the CAMPUS column
  gather("staar_complt", "student_count", names(staar_complt)[names(staar_complt) != "CAMPUS"]) %>% 
  # remove NA's 
  na.omit() %>% 
  mutate(header_code = stringr::str_replace_all(staar_complt, 
                                              c("CA01" = "all es ",
                                                "CA02" = "all es ",
                                                "CA03" = "all es ",
                                                "CA04" = "all es ",
                                                "CA05" = "all es ",
                                                "CE01" = "low_ses es ", 
                                                "CE02" = "low_ses es ", 
                                                "CE03" = "low_ses es ", 
                                                "CE04" = "low_ses es ", 
                                                "CE05" = "low_ses es ",
                                                "CL01" = "ell es ", 
                                                "CL02" = "ell es ", 
                                                "CL03" = "ell es ", 
                                                "CL04" = "ell es ", 
                                                "CL05" = "ell es ",
                                                "CA06" = "all ms ", 
                                                "CA07" = "all ms ", 
                                                "CA08" = "all ms ",
                                                "CE06" = "low_ses ms ",
                                                "CE07" = "low_ses ms ", 
                                                "CE08" = "low_ses ms ",
                                                "CL06" = "ell ms ", 
                                                "CL07"  = "ell ms ", 
                                                "CL08" = "ell ms ",
                                                "CA00" = "all hs ",
                                                "CE00" = "low_ses hs ",
                                                "CL00" = "ell hs ",
                                                "AMA" = "math ",
                                                "ARE" = "ela ",
                                                "AA1" = "math ",
                                                "AR1" = "ela ",
                                                "1016" = 2016,
                                                "1S16" = 2016,
                                                "1017" = 2017,
                                                "1S17" = 2017,
                                                "N" = " num",
                                                "D" = " denom"))) %>% 
  separate(header_code, into = c("students", "school_level", "subject", "year", "data_type"), sep = " ") %>% 
  spread(data_type, student_count) 

slice(appr_staar, 17397:17404)
sample_n(appr_staar, 25)

# merging appr_staar with mobility and campus datasets --------------------
# need to maintain 431292 observations
head(appr_staar)
interim <- inner_join(appr_staar, campus, by = "CAMPUS")
# visually inspecting data to ensure that the inner_join correctly matched information(school types with school types, etc.)
head(interim, 25)
sample_n(interim, 25, replace = TRUE)

# adding in mobility data
interim <- inner_join(interim, mobility, by = "CAMPUS")
head(interim, 25)
sample_n(interim, 25, replace = TRUE)
# everything checks out
# revert dataset naming
appr_staar <- interim

# creating numerator and denominator mini-tibbles -------------------------
colnames(appr_staar)
# expect to get 215646 observations
appr_staar_num <- 
  appr_staar %>% 
  # filter all rows where there is data IN the 'num' column
  filter(!is.na(num)) %>% 
  # group the data by all variables except for 'num'
  group_by(CAMPUS, students, school_level, subject, year, DISTRICT, 
           CAMPNAME, COUNTY, DISTNAME, CAD_READ, CAD_MATH, CAD_GAP, 
           CAD_PROGRESS, GRDTYPE, all_mobility, bilingual_mobility, low_ses_mobility) %>% 
  # add together all of the values in 'num' within the grouping
  mutate(new_num = sum(num))

colnames(appr_staar_num)
# selecting columns for final tibble
appr_staar_num <- appr_staar_num[c("CAMPUS", "students", "school_level", "subject", 
                                   "year", "DISTRICT", "CAMPNAME", 
                                   "COUNTY", "DISTNAME", "CAD_READ", "CAD_MATH", "CAD_GAP",
                                   "CAD_PROGRESS", "GRDTYPE", "all_mobility", "bilingual_mobility", "low_ses_mobility",
                                   "new_num")]
# removing duplicates final n = 100264
appr_staar_num <- distinct(appr_staar_num)

# testing to check campus duplications - expect a maximum of 36 instances for a single campus
num_test <- appr_staar_num %>% 
  group_by(CAMPUS) %>% 
  summarise(n = n())

# name of denominator mini-tibble
appr_staar_denom <-
  appr_staar %>% 
  # keep all rows that have data IN the 'denom' column
  filter(!is.na(denom)) %>% 
  # group by everything except for 'denom'
  group_by(CAMPUS, students, school_level, subject, year, DISTRICT, 
           CAMPNAME, COUNTY, DISTNAME, CAD_READ, CAD_MATH, CAD_GAP, 
           CAD_PROGRESS, GRDTYPE, all_mobility, bilingual_mobility, low_ses_mobility) %>% 
  # add together all of the values for 'denom' within the specific grouping
  mutate(new_denom = sum(denom))  

colnames(appr_staar_denom)
# create final mini-tibble with only the columns needed
appr_staar_denom <- appr_staar_denom[c("CAMPUS", "students", "school_level", "subject", 
                                       "year", "DISTRICT", "CAMPNAME", 
                                       "COUNTY", "DISTNAME", "CAD_READ", "CAD_MATH", "CAD_GAP",
                                       "CAD_PROGRESS", "GRDTYPE", "all_mobility", "bilingual_mobility", "low_ses_mobility",
                                       "new_denom")]
# remove duplicates. n = 100264, which matches the 'appr_staar_num' mini-tibble
appr_staar_denom <- distinct(appr_staar_denom)

# creating final tibble ---------------------------------------------------
# use inner_join to combine the two mini-tibbles into the final tibble that we'll be working with
# number of observations = 100264, so no reason to think anything went wrong on the join
appr_staar_comp <- inner_join(appr_staar_num, appr_staar_denom, by = c("CAMPUS", "students", "school_level", 
                                                                       "subject", "year", "DISTRICT", "CAMPNAME", 
                                                                       "COUNTY", "DISTNAME", "CAD_READ", "CAD_MATH",
                                                                       "CAD_GAP", "CAD_PROGRESS", "GRDTYPE",
                                                                       "all_mobility", "bilingual_mobility", 
                                                                       "low_ses_mobility"))
# n = 100264 - everything still looking good!
# checking out the data
head(appr_staar_comp, 20)


# calculating rates -------------------------------------------------------
appr_staar_comp <- 
  appr_staar_comp %>% 
  # create a new variable, 'rate', by dividing the numerator by the denominator, and multiplying by 100
  mutate(rate = 100 * (new_num / new_denom))

# checking rate data - expect values to be between 0 - 100
# data checks out - rate ranges from 8.451 - 100.00
summary(appr_staar_comp)

# calculating YOY growth  -------------------------------------------------
# growth % from 2016 to 2017
# again going to create mini-tibbles and use inner_join. there's definitely a better way to do this!

appr_2016 <- 
  appr_staar_comp %>% 
  filter(year == "2016") %>% 
  rename(`2016` = year,
         num_2016 = new_num,
         denom_2016 = new_denom,
         rate_2016 = rate)
head(appr_2016, 10)

appr_2017 <- 
  appr_staar_comp %>% 
  filter(year == "2017") %>% 
  rename(`2017` = year,
         num_2017 = new_num,
         denom_2017 = new_denom,
         rate_2017 = rate)
head(appr_2017, 10)

colnames(appr_2017)

# creating final tibble for approaches data
yoy_growth <- 
  inner_join(appr_2016, appr_2017, by = c("CAMPUS", "students", "school_level", "subject", 
                                          "DISTRICT", "CAMPNAME", "COUNTY", "DISTNAME", "CAD_READ",
                                          "CAD_MATH", "CAD_GAP", "CAD_PROGRESS", "GRDTYPE",
                                          "all_mobility", "bilingual_mobility", "low_ses_mobility"))
head(yoy_growth)
colnames(yoy_growth)

# creating new column for growth rate
appr_yoy_growth <- yoy_growth %>% 
  mutate(growth_rate = rate_2017 - rate_2016)

# the average growth across all TX schools for students approaching grade level was 1.1 percentage points
summary(appr_yoy_growth)
