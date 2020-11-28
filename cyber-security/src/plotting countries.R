library(ProjectTemplate)
setwd("/Desktop/FutureLearn MOOC Dataset")
#create.project("cyber-security")
#load.project("cyber-security", library=TRUE)
#read.csv("cyber-security-1_enrolments.csv")
cse = read.table('cyber-security-1_enrolments.csv', header=TRUE, sep=',')

 data.frame(cse)

sum(cse$fully_participated_at != "")
sum(cse$unenrolled_at != "")

#######################################
# # for loop to get only countries with count>100.
# # chris=0
# countries=c("START") # array for all countries # put a placeholder in there to get the loop started
# for (count in cse$detected_country) { # 
#   # country_element = FALSE
#   # chris=chris + 1
#   # print(chris)
#   # print(count)
#   for (i in unique(countries)) { # check each value in the array of each unique country
#     
#    
#     if (count == i) { # the country is already part of the array/list
#       country_element = TRUE
#       message("ommited")
#     }
#     
#   }
#   if (country_element == FALSE) { # adding this country to the countries list(array)
#     countries = append(countries, count)
#   }
# }
# countries
## this is going on a tangent ###
#######################################
#######################################

# Thinking there must be an easier way to do this.. all im after is to omit the countries that appear less than [100] times
# what about: if sum(cse$countries[])
#                     ^ extract array of all countries
# then: find a way to count how many times a certain string appears in this list of countries. 



list_of_countries = cse$detected_country
# now find the 'count'/frequency of each country
count.df = as.data.frame(table(list_of_countries))
list_of_countries[1:2]
# IDEA !!!!!!!!!!!!!!!!!!!!!!!!!!! Make BOX PLOT # then making decision to omit all countries that fall outside the lower quartile.
# ggplot(data=count.df, aes(x=list_of_countries)) + geom_boxplot(colour="black", fill="white") 
# or just find lower quartile by dividing total number by 4..
# message("the total number of students = ", sum(count.df$freq))
# is.integer(count.df$Freq)
# length(count.df$freq)
# count.df[, c("freq")]

# Wasnt using capital F in freq..............................

#######################################




#plot for countries
library(ggplot2)
g = ggplot(data=cse, aes(x=detected_country)) +
  geom_bar(colour="black", fill="white")
 g

#(sum(cse$detected_country == "GB")) # why does this not work?
# need to find a way to omit the countries that have < 100 participants











