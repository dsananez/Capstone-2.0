#Set Working Directory to the folder im using for the project
wd <- "C:/Users/Daniel/Google Drive/Coursera/Data Science Spec/Capstone 2.0"
setwd(wd)

#Read general functions and libraries from general.R file
source("library/general.R")

#Read training and testing files
training <- readRDS("data/raw-data/training.rds")
testing <- readRDS("data/raw-data/testing.rds")
devtesting <- readRDS("data/raw-data/devtesting.rds")

## preprocess a single chunk of text:
# * normalization
# * remove non ascii characters: apostrophes, quotes, punctuation, etc.
# * introduce end of sentence marks
# * replace numbers, dates, times, emails, urls, hashtags with special marks
# * remove genitive marks, but let 's for verbs

training <- cleanText(training)
testing <- cleanText(testing)
devtesting <- cleanText(devtesting)

#Save as RDS in a new directory
dir.create("data/clean")
saveRDS(training, "data/clean/trainingNormal.rds")
saveRDS(testing, "data/clean/testingNormal.rds")
saveRDS(devtesting, "data/clean/devtestingNormal.rds")
