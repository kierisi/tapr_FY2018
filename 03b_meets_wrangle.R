
# initial meets dataset ---------------------------------------------------
meets <- meets[c("CAMPUS", 
           # 2016 all math numerator
           "CA00AM04216N",
           # 2016 ell math numerator
           "CL00AM04216N",
           # 2016 low ses math numerator
           "CE00AM04216N",
           # 2016 all reading numerator
           "CA00AR04216N",
           # 2016 ell reading numerator
           "CL00AR04216N",
           # 2016 low ses reading numerator
           "CE00AR04216N",
           # 2016 all math denominator
           "CA00AM04216D",
           # 2016 ell math denominator
           "CL00AM04216D",
           # 2016 low ses math denominator
           "CE00AM04216D",
           # 2016 all reading denominator
           "CA00AR04216D",
           # 2016 ell reading denominator
           "CL00AR04216D",
           # 2016 low ses reading denominator
           "CE00AR04216D",
           # 2017 all math numerator
           "CA00AM04217N",
           # 2017 ell math numerator
           "CL00AM04217N",
           # 2017 low ses numerator
           "CE00AM04217N",
           # 2017 all reading numerator
           "CA00AR04217N",
           # 2017 ell reading numerator
           "CL00AR04217N",
           # 2017 low ses reading numerator
           "CE00AR04217N",
           # 2017 all math denominator
           "CA00AM04217D",
           # 2017 ell math denominator
           "CL00AM04217D",
           # 2017 low ses math denominator
           "CE00AM04217D",
           # 2017 all reading denominator
           "CA00AR04217D",
           # 2017 ell reading denominator
           "CL00AR04217D",
           # 2017 low ses reading denominator
           "CE00AR04217D")]

# removing NAs that are coded as -1
meets[meets == -1] <- NA


# gather() and spread() ---------------------------------------------------

# need to get column headers (except for CAMPUS) into rows, and then separate into meetopriate columns
meet_staar <- meets %>%
  # gathering all columns except for the CAMPUS column
  gather("meets", "student_count", names(meets)[names(meets) != "CAMPUS"]) %>% 
  # remove NA's 
  na.omit() %>% 
  mutate(header = stringr::str_replace_all(meets, 
                                                c("CA00" = "all ",
                                                  "CE00" = "low_ses ",
                                                  "CL00" = "ell ",
                                                  "AR042" = "ela ",
                                                  "AM042" = "math ",
                                                  "16" = 2016,
                                                  "17" = 2017,
                                                  "N" = " num",
                                                  "D" = " denom"))) %>% 
  separate(header, into = c("students", "subject", "year", "data_type"), sep = " ") %>% 
  spread(data_type, student_count) 

head(meet_staar)
sample_n(meet_staar, 25)


# merging with campus and mobility datasets -------------------------------

meet_staar <- inner_join(meet_staar, campus, by = "CAMPUS")
meet_staar <- inner_join(meet_staar, mobility, by = "CAMPUS")

head(meet_staar)
sample_n(meet_staar, 25, replace = TRUE)


# numerator and denominator mini-tibbles ----------------------------------
colnames(meet_staar)
meet_staar_num <- 
  meet_staar %>% 
  # filter all rows where there is data IN the 'num' column
  filter(!is.na(num)) %>% 
  # group the data by all variables except for 'num'
  group_by(CAMPUS, students, subject, year, DISTRICT, 
           CAMPNAME, COUNTY, DISTNAME, CAD_READ, CAD_MATH, CAD_GAP, 
           CAD_PROGRESS, GRDTYPE, all_mobility, bilingual_mobility, low_ses_mobility) %>% 
  # add together all of the values in 'num' within the grouping
  mutate(new_num = sum(num))

colnames(meet_staar_num)
# selecting columns for final tibble
meet_staar_num <- meet_staar_num[c("CAMPUS", "students", "subject", 
                                   "year", "DISTRICT", "CAMPNAME", 
                                   "COUNTY", "DISTNAME", "CAD_READ", "CAD_MATH", "CAD_GAP",
                                   "CAD_PROGRESS", "GRDTYPE", "all_mobility", "bilingual_mobility", "low_ses_mobility",
                                   "new_num")]
# removing duplicates final n = 75092
meet_staar_num <- distinct(meet_staar_num)

# testing to check campus duplications - expect a maximum of 12 instances for a single campus
m_num_test <- meet_staar_num %>% 
  group_by(CAMPUS) %>% 
  summarise(n = n())

# name of denominator mini-tibble
meet_staar_denom <-
  meet_staar %>% 
  # keep all rows that have data IN the 'denom' column
  filter(!is.na(denom)) %>% 
  # group by everything except for 'denom'
  group_by(CAMPUS, students, subject, year, DISTRICT, 
           CAMPNAME, COUNTY, DISTNAME, CAD_READ, CAD_MATH, CAD_GAP, 
           CAD_PROGRESS, GRDTYPE, all_mobility, bilingual_mobility, low_ses_mobility) %>% 
  # add together all of the values for 'denom' within the specific grouping
  mutate(new_denom = sum(denom))  

colnames(meet_staar_denom)
# create final mini-tibble with only the columns needed
meet_staar_denom <- meet_staar_denom[c("CAMPUS", "students", "subject", 
                                       "year", "DISTRICT", "CAMPNAME", 
                                       "COUNTY", "DISTNAME", "CAD_READ", "CAD_MATH", "CAD_GAP",
                                       "CAD_PROGRESS", "GRDTYPE", "all_mobility", "bilingual_mobility", "low_ses_mobility",
                                       "new_denom")]
# remove duplicates. n = 75092, which matches the 'meet_staar_num' mini-tibble
meet_staar_denom <- distinct(meet_staar_denom)

# creating final tibble ---------------------------------------------------
# use inner_join to combine the two mini-tibbles into the final tibble that we'll be working with
# number of observations = 100264, so no reason to think anything went wrong on the join
meet_staar_comp <- inner_join(meet_staar_num, meet_staar_denom, by = c("CAMPUS", "students",
                                                                       "subject", "year", "DISTRICT", "CAMPNAME", 
                                                                       "COUNTY", "DISTNAME", "CAD_READ", "CAD_MATH",
                                                                       "CAD_GAP", "CAD_PROGRESS", "GRDTYPE",
                                                                       "all_mobility", "bilingual_mobility", 
                                                                       "low_ses_mobility"))
# n = 75092 - everything still looking good!
# checking out the data
head(meet_staar_comp, 20)


# calculating rates -------------------------------------------------------
meet_staar_comp <- 
  meet_staar_comp %>% 
  # create a new variable, 'rate', by dividing the numerator by the denominator, and multiplying by 100
  mutate(rate = 100 * (new_num / new_denom))

# checking rate data - expect values to be between 0 - 100
# data checks out - rate ranges from 1.597 - 100.00
summary(meet_staar_comp)

# calculating YOY growth  -------------------------------------------------
# growth % from 2016 to 2017
# again going to create mini-tibbles and use inner_join. there's definitely a better way to do this!

meet_2016 <- 
  meet_staar_comp %>% 
  filter(year == "2016") %>% 
  rename(`2016` = year,
         num_2016 = new_num,
         denom_2016 = new_denom,
         rate_2016 = rate)
head(meet_2016, 10)

meet_2017 <- 
  meet_staar_comp %>% 
  filter(year == "2017") %>% 
  rename(`2017` = year,
         num_2017 = new_num,
         denom_2017 = new_denom,
         rate_2017 = rate)
head(meet_2017, 10)

colnames(meet_2017)

# creating final tibble for meetoaches data
m_yoy_growth <- 
  inner_join(meet_2016, meet_2017, by = c("CAMPUS", "students", "subject", 
                                          "DISTRICT", "CAMPNAME", "COUNTY", "DISTNAME", "CAD_READ",
                                          "CAD_MATH", "CAD_GAP", "CAD_PROGRESS", "GRDTYPE",
                                          "all_mobility", "bilingual_mobility", "low_ses_mobility"))
head(m_yoy_growth)
colnames(m_yoy_growth)

# creating new column for growth rate
meet_yoy_growth <- m_yoy_growth %>% 
  mutate(growth_rate = rate_2017 - rate_2016)

# the average growth across all TX schools for students meetoaching grade level was 1.1 percentage points
summary(meet_yoy_growth)

