library(ProjectTemplate)
#create.project("cyber-security")
load.project(load_libraries = TRUE)



# NOTE: The code from the munging file runs automatically from the function 'load.project' before this following code;


sum(cse$fully_participated_at != "")   # amount of students that did NOT fully participate
sum(cse$unenrolled_at != "")           # amount of students that did NOT unenroll


#########################
# Origional plot - saving to graphs folder
# histogram plot for all countries
pdf(file = paste("graphs/all_countries ",cohort))  #saving plot to graphs directory
library(ggplot2)
g = ggplot(data=cse, aes(x=detected_country)) +
    geom_bar(colour="black", fill="white")
g
dev.off()
g # displaying histogram in RStudio
#########################


message("the total number of students = ", sum(count.df$Freq))
message("1% of students = ", sum(count.df$Freq)/100)
message("number of students with no detected country = ", count.df[count.df$list_of_countries=="--",]$Freq)
message("% of students with no detected country = ", count.df[count.df$list_of_countries=="--",]$Freq*100 /sum(count.df$Freq))


########################################
# Histogram x axis countries unreadable.
# omit countries with a frequency < 1% of total students
# using the 'which' function:
countries_over_100 = count.df[which(count.df$Freq >= sum(count.df$Freq)/100 & count.df$list_of_countries != "--"),]$list_of_countries 
# this is in array/list form. # just add the data.frame() function if needed (for easier view).
########################################


# histogram plot for only significant countries
pdf(file = paste("graphs/sgfnt_countries ",cohort))  #saving plot to graphs directory
#g = ggplot(data=cse, aes(x=detected_country)) +                                # this works but as soon as i try implement a subset it breaks.
g1 = ggplot(subset(cse, cse$detected_country %in% countries_over_100), aes(x=detected_country)) +    # took the 'data=' out and it magically worked.
     geom_bar(colour="black", fill="white")
g1
dev.off()
g1     # loading new plot into RStudio




# next step could be to go backwards in the CRISP-DM cycle to data understanding/data preperation 
# and take out any students who unenrolled/didnt fully participate.