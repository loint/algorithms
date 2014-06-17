// INTERVAL TREE PROBLEM
#define maxN 200005
struct diem{int x,y;}; 
int Tmax[maxN],Tmin[maxN],Parent[maxN],i,n,m,maxT=1,kmax,kmin,add,sonut,tmp;
struct diem d[maxN];
int min(int a,int b) {return a>b?b:a;}
int max(int a,int b) {return a>b?a:b;}
Init() {
        scanf("%d%d",&n,&m);
        while (maxT<=n*2) maxT*=2;        
        --maxT; add=maxT-n;
        for (i=add+1;i<=maxT;i++) {scanf("%d",&Tmin[i]); Tmax[i]=Tmin[i];}
        for (i=1;i<=m;i++) scanf("%d%d",&d[i].x,&d[i].y);
} 
Get (int L,int R) {
      while (L!=1) {
             i=L;
             do {
                      if (i>=R) break;
                      tmp=i/2;
                      Parent[i]=tmp;
                      Parent[i+1]=tmp;
                      Tmin[tmp]=min(Tmin[i],Tmin[i+1]);
                      Tmax[tmp]=max(Tmax[i],Tmax[i+1]);
                      i+=2;
              } while (1);
              R=L; L/=2; 
      }
}
Cal (int L,int R) {
        if ((Parent[L]==Parent[R]) && (L!=R)) { L=Parent[L]; R=Parent[R]; }
        if (L==R) {
                kmax=max(kmax,Tmax[L]);
                kmin=min(kmin,Tmin[L]);
                return;
        } else {
                if (L%2!=0) {
                        kmax=max(kmax,Tmax[L]);
                        kmin=min(kmin,Tmin[L]);
                        ++L;
                }
                if (R%2==0) {
                        kmax=max(kmax,Tmax[R]);
                        kmin=min(kmin,Tmin[R]);
                        --R;
                }
                sonut=R-L+1;
                if (sonut>=2) {
                        if (Parent[L]!=Parent[R]) {
                                L=Parent[L];
                                R=Parent[R];
                        }
                        Cal(L,R);
                }
       }
}
Process() {
        for (i=1;i<=m;i++) {
                kmax=0;
                kmin=maxN*100;
                Cal(d[i].x+add,d[i].y+add);
                printf("%d\n",kmax-kmin);
        }                 
}
int main() {
        Init();
        Get (maxT/2+1,maxT);
        Process(); 
        return 0;
}