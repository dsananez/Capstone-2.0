#Set Working Directory to the folder im using for the project
wd <- "C:/Users/Daniel/Google Drive/Coursera/Data Science Spec/Capstone 2.0"
setwd(wd)

#Read the raw data
blogs <- readLines("data/raw-data/final/en_US/en_US.blogs.txt", skipNul=T, encoding = "UTF-8")
news <- file("data/raw-data/final/en_US/en_US.news.txt", open="rb")
news <- readLines(news, skipNul=T, encoding = "UTF-8")
tweets <- readLines("data/raw-data/final/en_US/en_US.twitter.txt", skipNul=T, encoding = "UTF-8")

#Line Count
length(blogs)
length(news)
length(tweets)

#Word Count
sum(sapply(gregexpr("\\W+", blogs), length) + 1)    #total: 39,121,566 avg: 43.50282
sum(sapply(gregexpr("\\W+", news), length) + 1)     #total: 36,721,104 avg: 36.34882
sum(sapply(gregexpr("\\W+", tweets), length) + 1)   #total: 32,793,432 avg: 13.89465

#Characters Count
sum(nchar(blogs))    #total 206,824,505 avg: 229.987   avg/w: 5.286713
sum(nchar(news))     #total 203,223,159 avg: 201.1628  avg/w: 5.534233
sum(nchar(tweets))   #total 162,096,241 avg: 68.68054  avg/w: 4.942948

#For an advanced analysis, Ill use a sample of the data
unigram <- readRDS("data/tokens/trainUnigram.rds")

#Table with words frequencies
unifreq <- table(unigram)[order(table(unigram), decreasing = T)]

#clean <S>  <N>  <HASH>  <T>  <NN>  <D>  <URL>  <ON>  <PN>  <YN>  <EMAIL>  <TW>
unifreq <- unifreq[!grepl("<", names(unifreq))]
unifreq[1:15]

#lets make a wordcloud and save it as PNG in a new directory
library(wordcloud)

dir.create("graphs")

png(filename="graphs/wordcloud.png")
wordcloud(names(unifreq), unifreq, scale = c(6,1), max.words=200, colors=brewer.pal(6,"Dark2"),random.order=FALSE)
dev.off()

#Bigrams frequencies
bigram <- readRDS("data/tokens/trainBigram.rds")
bifreq <- table(bigram)[order(table(bigram), decreasing = T)]
bifreq <- bifreq[!grepl("<", names(bifreq))]
bifreq[1:15]

#Trigrams frequencies
trigram <- readRDS("data/tokens/trainTrigram.rds")
trifreq <- table(trigram)[order(table(trigram), decreasing = T)]
trifreq <- trifreq[!grepl("<", names(trifreq))]
trifreq[1:15]

#Fourgrams frequencies
fourgram <- readRDS("data/tokens/trainFourgram.rds")
fourfreq <- table(fourgram)[order(table(fourgram), decreasing = T)]
fourfreq <- fourfreq[!grepl("<", names(fourfreq))]
fourfreq[1:15]

#How many words 
sum(unifreq[1:125]*100/sum(unifreq)) #Top 125 words account for 50% of the frequencies