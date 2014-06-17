input=raw_input()
n=int(input)
input=raw_input()
f=input.split(' ')
cong=int(f[0])
tru=0
x=range(2,n+1)
for i in x: 
	a=int(f[i-1])
	if tru<cong-a:
		tru=cong-a
	if cong<tru+a:
		cong=tru+a 
else:print cong