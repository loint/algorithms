n=int(raw_input())
sum=int(raw_input())
so1=0
so2=0
x=range(2,n)
for i in x:
	tam=int(raw_input())
	sum=sum+tam;
	if i==n-1:tam=0
	so=so1 if so1>so2+tam else so2+tam
	so2=so1
	so1=so	
print sum-so1