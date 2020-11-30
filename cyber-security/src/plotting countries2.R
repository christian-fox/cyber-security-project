library(ProjectTemplate)
setwd("H:/cyber-security")                             # for uni computers
#create.project("cyber-security")
load.project(load_libraries = TRUE)
#read.csv("cyber-security-1_enrolments.csv")


# NOTE: The code from the munging file runs automatically from the function 'load.project' before this following code;


sum(cse$fully_participated_at != "")   # amount of students that did NOT fully participate
sum(cse$unenrolled_at != "")           # amount of students that did NOT unenroll


#########################
# Origional plot - saving to graphs folder
# histogram plot for all countries
pdf(file = paste("H:/cyber-security/graphs/all_countries"))  #saving plot to graphs directory
library(ggplot2)
g = ggplot(data=cse, aes(x=detected_country)) +
    geom_bar(colour="black", fill="white")
g
dev.off()
g # displaying histogram in RStudio
#########################


message("the total number of students = ", sum(count.df$Freq))
count.df[count.df$list_of_countries=="--",]$Freq # gives number of students with unknown country
count.df[count.df$list_of_countries=="--",]$Freq*100 /sum(count.df$Freq) # % of students with no detedcted country


########################################
# Histogram x axis countries unreadable.
# omit countries with a frequency < 100
# using the 'which' function:
countries_over_100 = count.df[which(count.df$Freq >= 100 & count.df$list_of_countries != "--"),]$list_of_countries 
# this is in array/list form. # just add the data.frame() function if needed (for easier view).
########################################


# histogram plot for only significant countries
pdf(file = paste("H:/cyber-security/graphs/sgfnt_countries"))  #saving plot to graphs directory
#g = ggplot(data=cse, aes(x=detected_country)) +                                # this works but as soon as i try implement a subset it breaks.
g1 = ggplot(subset(cse, cse$detected_country %in% countries_over_100), aes(x=detected_country)) +    # took the 'data=' out and it magically worked.
     geom_bar(colour="black", fill="white")
g1
dev.off()
g1     # loading new plot into RStudio




# next step could be to go backwards in the CRISP-DM cycle to data understanding/data preperation 
# and take out any students who unenrolled/didnt fully participate.