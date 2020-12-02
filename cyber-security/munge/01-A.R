# Preprocessing script.

cohort = 1    # this is the different years of data, ranging from 1-7.
cse = data.frame(read.table(paste('data/cyber-security-',cohort,'_enrolments.csv', sep=""), header=TRUE, sep=","))




# Creating a 'count'/frequency & country data frame
list_of_countries = cse$detected_country                       # naming variable here so the use of $ doesnt get too complicated.
count.df = as.data.frame(table(list_of_countries))


# Adding continent and continent freq. columns to this data frame^
# no quick way to do this. 
# use if conditional to assign each country to its continent
# first figure out how to add a column to the existing data frame

cca.df = as.data.frame(Country.and.corresponding.Continent.Sheet1) # setting country codes as a dataframe in R so i can work with it
# intersect(cca.df$list_of_countries, count.df$list_of_countries) # neat function to find common elements in 2 vectors


useless_countries = setdiff(cca.df$list_of_countries, count.df$list_of_countries) # all irrelevant countries
useless_countries_rownumbers = c()
for (i in useless_countries){    # useless countries row number
  useless_countries_rownumbers = c(useless_countries_rownumbers,rownames(cca.df[cca.df$list_of_countries == i,]))
  #cca.df = cca.df[-rownames(cca.df[cca.df$list_of_countries == i,]),]
}

useless_countries_rownumbers = as.integer(useless_countries_rownumbers)
clean.df <- cca.df[-useless_countries_rownumbers, ]


# merging data frames: cca.df and count.df
continent_count.df = merge(clean,count.df)













