#include <stdio.h>
#define maxN 1005
int n,m,i,j,x,y,a[maxN],b[maxN],f[maxN][maxN];
int main(){
	scanf("%d%d",&n,&m);
		++n;++m;		
		for (i=2;i<=n;i++) scanf("%d",&a[i]);
		for (i=2;i<=m;i++) scanf("%d",&b[i]);
		for (i=2;i<=n;i++)
 			for (j=2;j<=m;j++)
			{
				x=i-1;y=j-1;	
				f[i][j]=a[i]==b[j]?f[x-1][y-1]+1:f[x][j]>f[i][y]?f[x][j]:f[i][y];
			}
	printf("%d",f[n][m]);
	return 0;
}