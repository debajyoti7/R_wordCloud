library(tm)
txt <- Corpus(DirSource("poems/"))


#txt <- tm_map(txt, stripWhitespace)
txt <- tm_map(txt, content_transformer(tolower))
txt <- tm_map(txt, removeWords, stopwords("english"))
txt <- tm_map(txt, removePunctuation)

txt <- tm_map(txt, stemDocument)

library(wordcloud)
wordcloud(txt, scale=c(5,0.5), max.words = 100, random.order=FALSE, 
    rot.per=0.35, use.r.layout=FALSE, colors=brewer.pal(8, "Dark2"))
