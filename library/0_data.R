#Set Working Directory to the folder im using for the project
wd <- "C:/Users/Daniel/Google Drive/Coursera/Data Science Spec/Capstone 2.0"
setwd(wd)

#Download the Data
dir.create("data")
dir.create("data/raw-data")
name <- "data/raw-data/Coursera-SwiftKey.zip"
url <- "http://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip".
download.file(url, destfile = name)

#Unzip the file
unzip(name, exdir = "data/raw-data")

#Load sub files (en_US)
blogs <- readLines("data/raw-data/final/en_US/en_US.blogs.txt", skipNul=T, encoding = "UTF-8")
news <- file("data/raw-data/final/en_US/en_US.news.txt", open="rb")
news <- readLines(news, skipNul=T, encoding = "UTF-8")
tweets <- readLines("data/raw-data/final/en_US/en_US.twitter.txt", skipNul=T, encoding = "UTF-8")

#Merge the 3 files
data <- c(blogs, news, tweets)

#Get training and test datasets
set.seed(2015); sub <- sample(length(data), length(data)*0.5)
training <- data[sub]
test <- data[-sub]
set.seed(2015); sub2 <- sample(length(testing), length(testing)*0.5)
testing <- test[sub2]
devtesting <- test[-sub2]

#Save as RDS
saveRDS(training, "data/raw-data/training.rds")
saveRDS(testing, "data/raw-data/testing.rds")
saveRDS(devtesting, "data/raw-data/devtesting.rds")