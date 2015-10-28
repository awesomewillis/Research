xvs =sample(rep(c(1:10),length=nrow(data)))
xval=rep(0,length=nrow(data))
for(i in 1:10){
  train=data[xvs!=i,]
  test =data[xvs==i,]
  #
  nesttre = randomForest(as.factor(Nest)~., data=data, ntree=500000,
                         sampsize=0.05*nrow(data), maxnodes=6)
  xval[xvs==i]=predict(nesttre, test, type="class")
  #
}
ldaAccuracy <- class.sum(nest$Nest, xval)







nestrf.4 <- randomForest(as.factor(Nest)~., data=data, ntree=500000,
                         sampsize=0.05*nrow(data), maxnodes=6)
rfPrediction.4 <- predict(nestrf.4)
rfAccuracy.4 <- class.sum(nest$Nest, as.numeric(rfPrediction.4)); rfAccuracy.4
