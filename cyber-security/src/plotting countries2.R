library(ProjectTemplate)
setwd("/Desktop/FutureLearn MOOC Dataset")
#create.project("cyber-security")
#load.project("cyber-security", library=TRUE)
#read.csv("cyber-security-1_enrolments.csv")
cse = read.table('cyber-security-1_enrolments.csv', header=TRUE, sep=',')

data.frame(cse)

sum(cse$fully_participated_at != "")   # amount of students that did NOT fully participate
sum(cse$unenrolled_at != "")           # amount of students that did NOT unenroll


# histogram plot for all countries
pdf(file = paste("H:/cyber-security/graphs/all_countries"))  #saving plot to graphs directory
library(ggplot2)
g = ggplot(data=cse, aes(x=detected_country)) + 
  geom_bar(colour="black", fill="white")
g
dev.off()


########################################
# Histogram x axis countries unreadable.
# omit countries with a frequency less than [25%]? (of total)
# first create data frame with countries and frequency:

list_of_countries = cse$detected_country
# now find the 'count'/frequency of each country
count.df = as.data.frame(table(list_of_countries))
list_of_countries[1:2]

# ggplot(data=count.df, aes(x=list_of_countries)) + geom_boxplot(colour="black", fill="white") 
# or just find lower quartile by dividing total number by 4..
message("the total number of students = ", sum(count.df$Freq))
message("the lower quartile = ", sum(count.df$Freq)/4)
# this seems quite large, therefore maybe just try omitting the countries with < 100 people.
#######################################
# omitting the countries with < 100 students/frequency
sgfnt_countries=c()
for (i in count.df$Freq) {
  if (i-100>=0) {sgfnt_countries = append(sgfnt_countries,count.df[count.df$Freq==i,]$list_of_countries)}
}
sgfnt_countries # this is printing the countries' place in the array. need the actual names of the countries
# Dont know why this code doesnt work.
################
# a different way to omit the countries using the which function 
which(count.df$Freq >= 100)
new_countries = count.df[which(count.df$Freq >= 100),]$list_of_countries # just add the data.frame() function if needed.


#######################################



# histogram plot for significant countries
library(ggplot2)
pdf(file = paste("H:/cyber-security/graphs/sgfnt_countries"))  #saving plot to graphs directory
#g = ggplot(data=cse, aes(x=detected_country)) +                                # this works but as soon as i try implement a subset it breaks.
 g1 = ggplot(subset(cse, cse$detected_country %in% new_countries), aes(x=detected_country)) +    # took the 'data=' out and it magically worked.
   geom_bar(colour="black", fill="white")
g1
dev.off()





# next step could be to go backwards in the CRISP-DM cycle to data understanding/data preperation 
# and take out any students who unenrolled/didnt fully participate.





