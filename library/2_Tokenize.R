#Set Working Directory to the folder im using for the project
wd <- "C:/Users/Daniel/Google Drive/Coursera/Data Science Spec/Capstone 2.0"
setwd(wd)

#Read general functions and libraries from general.R file
source("library/general.R")

#Read the normalized training and testing files
training <- readRDS("data/clean/trainingNormal.rds")
testing <- readRDS("data/clean/testingNormal.rds")
devtesting <- readRDS("data/clean/devtestingNormal.rds")

#Files need to be shrinked before tokenization
set.seed(2015); training <- sample(training, length(training)/20)
set.seed(2015); testing <- sample(testing, length(testing)/20)
set.seed(2015); devtesting <- sample(devtesting, length(devtesting)/20)

#Java parameters
options(java.parameters = "-Xmx1024m")

#Use custom tokenizer functions from general.R to make uni, bi, tri and fourgrams tokens.
# * Training dataset
trainUnigram <- unigramTokenizer(training)
trainBigram <- bigramTokenizer(training)
trainTrigram <- trigramTokenizer(training)
trainFourgram <- fourgramTokenizer(training)

# * Testing dataset
testUnigram <- unigramTokenizer(testing)
testBigram <- bigramTokenizer(testing)
testTrigram <- trigramTokenizer(testing)
testFourgram <- fourgramTokenizer(testing)

# * Devtesting dataset
devtestUnigram <- unigramTokenizer(devtesting)
devtestBigram <- bigramTokenizer(devtesting)
devtestTrigram <- trigramTokenizer(devtesting)
devtestFourgram <- fourgramTokenizer(devtesting)

#Save as RDS in a new directory
dir.create("data/tokens")

saveRDS(trainUnigram, "data/tokens/trainUnigram.rds")
saveRDS(trainBigram, "data/tokens/trainBigram.rds")
saveRDS(trainTrigram, "data/tokens/trainTrigram.rds")
saveRDS(trainFourgram, "data/tokens/trainFourgram.rds")

saveRDS(testUnigram, "data/tokens/testUnigram.rds")
saveRDS(testBigram, "data/tokens/testBigram.rds")
saveRDS(testTrigram, "data/tokens/testTrigram.rds")
saveRDS(testFourgram, "data/tokens/testFourgram.rds")

saveRDS(devtestUnigram, "data/tokens/devtestUnigram.rds")
saveRDS(devtestBigram, "data/tokens/devtestBigram.rds")
saveRDS(devtestTrigram, "data/tokens/devtestTrigram.rds")
saveRDS(devtestFourgram, "data/tokens/devtestFourgram.rds")
