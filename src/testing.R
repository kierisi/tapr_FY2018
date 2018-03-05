### WARNING: variable names may not be updated to reflect variables used in final wrangling and analysis

# file for all testing scenarios


# too few values on new gather() with campus and mobility data add --------
head(appr_staar)
# specific columns: 431293:431312 (total: 61299 locations with "too few values")
appr_staar %>% 
  slice(431293:431300)
# the issue is that more than one column needs to be held constant - currently only have CAMPUS not undergoing gather()

# gather() and mutate() testing in approaches_wrangle -------------------------------------------

# working on gather() and mutate() in order to get the data in a usable format
# work with a small subset
test <- data[c(1:5),] 
test <- test[1:5]
test[test == -1] <- NA
test

# works
test %>% 
  gather(CA03ARE1016D, key = "specific_category", value = "student_count")  %>% # works up to here
  mutate(key = stringr::str_replace_all(specific_category, "CA", "all_students ")) %>% 
  separate(key, into = c("type", "other_stuff"), sep = " ")

# need to gather multiple columns and replace coded values with text descriptions  
# works
test %>% 
  gather_("test", "student_count", names(test)[names(test) != "CAMPUS"]) %>% 
  na.omit() %>% 
  mutate(key = stringr::str_replace_all(test, "CA03ARE1016D", "all_std ES reading 2016 denom"))

# gather multiple columns and replace multiple coded values
test %>% 
  gather_("test", "student_count", names(test)[names(test) != "CAMPUS"]) %>% 
  na.omit() %>% 
  mutate(header_code = stringr::str_replace_all(test, 
                                                c("CA03ARE1016D" = "all_std ES reading 2016 denom", 
                                                  "CA03ARE1S16N" = "all_std ES reading 2016 num"))) %>% 
  separate(header_code, into = c("students", "school_level", "subject", "year", "data_type"), sep = " ")

# need more data points in order to test out rate calculations

test2 <- data[c(1:50),] 
test2 <- test2[1:150]
test2[test2 == -1] <- NA
test2





# high duplicate campuses (max = 169) in approaches_wrangle -------------------------------------

# evaluate staar_complt due to downstream issues with campuses being represented multiple times
colnames(staar_complt)
# 8757 campuses represented
# should lead to 17514 - 315252 campuses post manipulation
# are there duplicates?
campus_count <- staar_complt %>% 
  group_by(CAMPUS) %>% 
  summarise(n = n())
# every campus is only represented once, suggesting that the error is occuring in gather()

staar3 <- staar_complt %>% 
  gather_("staar_complt", "student_count", names(staar_complt)[names(staar_complt) != "CAMPUS"]) %>% 
  na.omit()

campus_count3 <- staar3 %>% 
  group_by(CAMPUS) %>% 
  summarise(n = n())
summary(campus_count3) # YUUUUP! The problem is here.

# none of the rows disappear - need to get in and look at individual data points for high duplicate schools
# need to sum certain rows because they are *all* ES/MS/HS
staar3 <- distinct(staar3)

# high duplicate school: 57806101
test <- staar_complt %>% 
  filter(CAMPUS == 57806101)

test <- test %>% 
  gather(test, student_count, names(staar_complt)[names(staar_complt) != "CAMPUS"])

testing <- staar2_st %>% 
  group_by(CAMPUS) %>% 
  summarise(n = n()) # some campuses have an n of 168

troubleshoot <- staar2 %>% 
  group_by(CAMPUS, students, school_level, subject, year) %>% 
  summarise(n = n())

# expect two per school - one for numerator and one for denominator
# instead getting a range of 2 - 6. what's happening?
# issue upstream of separate()
summary(troubleshoot)



# checking rate calculations in approaches_wrangle ----------------------------------------------

staar_test <- data[c("CAMPUS", "CA03AMA1S17N", "CA03AMA1017D", "CA03AMA1S17R", "CA04AMA1S17N", "CA04AMA1017D", "CA04AMA1S17R",  "CA05AMA1S17N", "CA05AMA1017D", "CA05AMA1S17R")]

head(staar_test)

# ran the following on the CAMPSTAAR1 and CREF datasets at import
# staar_test[] <- lapply(staar_test, function(x) as.numeric(as.character(x)))
# need to convert characters to numeric
# shamelessly stolen from stack overflow: https://stackoverflow.com/questions/23915131/change-all-columns-from-factor-to-numeric-in-r
# introduces NAs by coercion - this is OK, as it removes the "dots"

rate_check <- staar_test %>% 
  na.omit() %>% 
  mutate(calculated_rate_3rd = 100 * (CA03AMA1S17N / CA03AMA1017D)) %>% 
  mutate(difference = calculated_rate_3rd - CA03AMA1S17R)

summary(rate_check$difference)
# expected a zero here - instead getting a fair amount of variance
# state data has -1's coded into it - these should be NA (cannot have a negative student)
staar_test[staar_test == -1] <- NA

# re-ran rate_check - all values are within 0.5 points. a spot-check revealed that the difference is due to standard rounding. OK with this discrepancy.

# of course the below doesn't work - you're taking an average of averages
rate_check2 <- staar_test %>% 
  na.omit() %>% 
  mutate(es_ama_num = CA03AMA1S17N + CA04AMA1S17N + CA05AMA1S17N) %>% 
  mutate(es_ama_denom = CA03AMA1017D + CA04AMA1017D + CA05AMA1017D) %>% 
  mutate(es_ama_rate_pre = (CA03AMA1S17R + CA04AMA1S17R + CA05AMA1S17R)/3) %>% 
  mutate(es_ama_rate_calc = es_ama_num/es_ama_denom)




# years not joining correctly in approaches_wrangle -----------------------

# while appr_2016 and appr_2017 total 100264, they are not evenly split
# this is most likely due to schools being created/starting staar testing in 2017, with no 2016 record
# use setdiff to investigate discrepancies

setdiff(appr_2017, appr_2016)
# campus 1902001 shows up with four observations - all math/ela, low_ses math/ela
# what's in our original data set for 1902001? 16 observations, containing data for 2016 and 2017
appr_staar %>% 
  filter(CAMPUS == 1902001)
