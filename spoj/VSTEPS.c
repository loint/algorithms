int free[100000];
int main() {
        int n,k ,tmp,i;
        scanf("%d%d",&n,&k);
        for (i=1;i<=k;i++) {              
              scanf("%d",&tmp);
              free[tmp]=1;
        }        
        int so1=0,so2=1,so3=0;              
        for (i=2;i<=n;i++) {
                so3=free[i]==0?(so1+so2)%14062008:0; 
                so1=so2; so2=so3;
        }
        printf("%d",so3);   
        return 0;
}