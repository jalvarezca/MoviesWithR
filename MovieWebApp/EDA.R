## Exploratory Data Analysis For WPI Data

## Required libraries

require(data.table)
require(dplyr)
require(DT)
require(readr)


## Data Source Variables
DocName <- "movie_metadata.csv"       # Document Name with extension
MyData <- paste0("./data/",DocName)   # Path for Data Source
Dtframe <- read.csv(MyData)           # Creation of Data Frame

movitable <- setDT(Dtframe)
getwd()

# Exploratory data analysis

# Extracting the Head
DT_HEAD <- head(Dtframe)

# Column Names
DT_ColumnNames <- colnames(Dtframe)
# Number of rows 
NumberOfRows <- length(Dtframe$director_name) 
# Number of Directors
length(unique(Dtframe$"director_name")) 
# Number of Actors 1
length(unique(Dtframe$"actor_1_name")) 
# Number of Languages
length(unique(Dtframe$"language")) 
# Minimun Duration
MinDuration <- min(Dtframe$"duration") 
# Maximun Duration
MaxDuration <- max(Dtframe$"duration")
# All Years
MovieYear <- sort(unique(Dtframe$"title_year"))
# All Directors per Movie
countOfDirectorsXMov <- table(Dtframe$director_name)
sortDirector <- sort(countOfDirectorsXMov, decreasing = TRUE)

countOfGenresXMov <- sort(table(Dtframe$genres), decreasing = TRUE)


#############################

# Plot Example

plot(sortDirector)

# Graph cars using blue points overlayed by a line 
plot(sortDirector, type="o", col="blue")
pie(head(sortDirector))

