# Preprocessing script.

("H:/cyber-security/data/FutureLearn MOOC Dataset")       # load.project function should automatically load things in data file.
                                                               # have to set new wd here maybe because of the intermediate file FutureLearn MOOC Dataset
cse = data.frame(read.table('cyber-security-1_enrolments.csv', header=TRUE, sep=','))




# Creating a 'count'/frequency & country data frame
list_of_countries = cse$detected_country                       # naming variable here so the use of $ doesnt get too complicated.
count.df = as.data.frame(table(list_of_countries))














