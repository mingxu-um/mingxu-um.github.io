load("plastics.RData")

#plots total consumption vs. population
n_country=dim(consumption)[3]
n_year=dim(consumption)[1]
color=rainbow(n_country)
plot(socioeconomic[,1,1],consumption[,7,1],xlim=c(100,max(socioeconomic[,1,])),ylim=c(0.01,max(consumption[,7,])),col=color[1],log="xy",xlab="population",ylab="total plastic consumption",type = "l")
for (i in c(2:n_country)){
  points(socioeconomic[,1,i],consumption[,7,i],col=color[i],type="l")
  text(socioeconomic[n_year,1,i],consumption[n_year,7,i],dimnames(consumption)[[3]][i])
  # if (dimnames(consumption)[[3]][i]=="United States of America"){
  #   text(socioeconomic[n_year,1,i],consumption[n_year,7,i],"USA")
  # }
  # if (dimnames(consumption)[[3]][i]=="China"){
  #   text(socioeconomic[n_year,1,i],consumption[n_year,7,i],"China")
  # }
}

#plot plastic consumption in 1950 vs. population in 1950
plot(socioeconomic[1,1,],consumption[1,7,],xlim=c(100,max(socioeconomic[,1,])),ylim=c(0.01,max(consumption[,7,])),col=color[1],log="xy",xlab="population-1950",ylab="total plastic consumption-1950")

#plot plastic consumption/person in 1950 vs population in 1950
plot(socioeconomic[1,1,],consumption[1,7,]/socioeconomic[1,1,],log="xy", col=color[1],xlab="population-1950",ylab="total plastic consumption/capita-1950")
for (i in c(1:n_country)){
  text(socioeconomic[1,1,i],consumption[1,7,i]/socioeconomic[1,1,i],dimnames(consumption)[[3]][i])
}
summary(consumption[1,7,]/socioeconomic[1,1,])

#plot plastic consumtion/person vs. population
plot(socioeconomic[,1,1],consumption[,7,1]/socioeconomic[,1,1],xlim=c(100,max(socioeconomic[,1,])),ylim=c(0.00001,max(consumption[,7,]/socioeconomic[,1,])),col=color[1],log="xy",xlab="population",ylab="total plastic consumption/capita",type = "l")
for (i in c(2:n_country)){
  points(socioeconomic[,1,i],consumption[,7,i]/socioeconomic[,1,i],col=color[i],type="l")
  text(socioeconomic[n_year,1,i],consumption[n_year,7,i]/socioeconomic[n_year,1,i],dimnames(consumption)[[3]][i])
}
summary(as.vector(consumption[,7,]/socioeconomic[,1,]))