library(ProjectTemplate)
setwd("H:/cyber-security")    # for uni computers
#create.project("cyber-security")
load.project(load_libraries = TRUE)
#read.csv("cyber-security-1_enrolments.csv")


# NOTE: The code from the munging file runs automatically from the function 'load.project' before this following code;


sum(cse$fully_participated_at != "")
sum(cse$unenrolled_at != "")


#######################################

# omit the countries that appear less than [100] times
# what about: if sum(cse$countries[])
#                     ^ extract array of all countries
# then: find a way to count how many times a certain string appears in this list of countries. 



list_of_countries = cse$detected_country
# now find the 'count'/frequency of each country
count.df = as.data.frame(table(list_of_countries))   # data frame for countries and frequency.

#######################################




#plot for countries
library(ggplot2)
g = ggplot(data=cse, aes(x=detected_country)) +
  geom_bar(colour="black", fill="white")
 g

#(sum(cse$detected_country == "GB")) # why does this not work?
# need to find a way to omit the countries that have < 100 participants











