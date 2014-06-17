free=[0 for i in range(100005)]
n,k=map(int,raw_input().split())
if k>0:
    f=map(int,raw_input().split())
    for i in f:
        free[i]=1
so1=0
so2=1
so3=0
for i in range(1,n):
    so3=(so1+so2)%14062008 if free[i+1]==0 else 0
    so1=so2
    so2=so3
print so3