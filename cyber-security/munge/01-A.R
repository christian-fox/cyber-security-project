# Preprocessing script.

cohort = 1    # this is the different years of data, ranging from 1-7.
cse = data.frame(read.table(paste('data/cyber-security-',cohort,'_enrolments.csv', sep=""), header=TRUE, sep=','))




# Creating a 'count'/frequency & country data frame
list_of_countries = cse$detected_country                       # naming variable here so the use of $ doesnt get too complicated.
count.df = as.data.frame(table(list_of_countries))














