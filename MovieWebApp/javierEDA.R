
require(data.table)
require(dplyr)
require(DT)
require(readr)
require(ggplot2)

## Data Source Variables
DocName <- "movie_metadata.csv"       # Document Name with extension
MyData <- paste0("./data/",DocName)   # Path for Data Source
MoviesDf <- read.csv(MyData)  

#Select only needed columns
t1 <- select(
  .data = MoviesDf,
  director_name,
  gross,
  genres,
  movie_title,
  budget,
  country,
  title_year
  )

#filter, remove blank director names
t2 <- filter(
  .data = t1,
  director_name != ""
)

#mutate, create new column profit
t3 <- mutate(
  .data = t2,
  profit = as.numeric(gsub('[$,]', '', gross)) -
            as.numeric(gsub('[$,]', '', budget))
)

head(t3)

#group by director name
t4 <- group_by(
  .data = t3,
  director_name
)

head(t4)

#Aggregate base on groups
t5 <- summarize(
  .data = t4,
  total_movies =n(),
  total_profit = sum(profit)
  )
  

#Order by total of movies in descendent order
t6 <- arrange(t5,desc(total_movies))

ggplot(data = head(t6,10)) +
  geom_bar(mapping = aes(x = director_name, y = total_movies , fill=director_name), stat = "identity")


ggplot(data = head(t6,10)) +
  geom_point(mapping = aes(x = director_name, y = total_movies , fill=director_name), stat = "identity")


       
  