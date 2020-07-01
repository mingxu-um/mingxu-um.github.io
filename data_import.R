library("abind")
mydata = read.table(file="clipboard",sep="\t", header=TRUE)
# clipboard includes data with headers: 2856 x 9
col_name=names(mydata)[3:9]
size=dim(mydata)
n_year=68
n_country=size[1]/n_year #42
mylist=list()

row_name=c() #years
for(j in c(1:n_year)){
  row_name[j]=toString(mydata[j,2])
}

t_name=c() #countries

for (i in c(1:n_country)) {
  t_name[i]=toString(mydata[(1+(i-1)*n_year),1])
  m1=data.matrix(mydata[(1+(i-1)*n_year):(i*n_year),3:9])
  mylist[[i]]=m1
}
stock=abind(mylist,along=3)
dimnames(stock)=list(row_name,col_name,t_name)
#update stock for other variables