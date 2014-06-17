Program Day_kon_don_dieu_tang_dai_nhat_NlogN;
const maxN=30000;
type mang=array[1..maxN] of longint;
var trace,c:^mang;
L:mang;
n,d:integer;
//-----------------
procedure Init;
var i:integer;
begin
new(c);
fillchar(c^,sizeof(c^),0);
    readln(n);
       for i:=1 to n do read(c^[i]);
end;
//-----------------
procedure Process;
var i,k,j,t:integer;
begin
new(trace);
   fillchar(L,sizeof(L),0);
   fillchar(trace^,sizeof(trace^),0);
   L[1]:=1;
   d:=1;
//------
for k:=2 to n do
   begin
      if c^[k]<c^[L[1]] then
          begin
             L[1]:=k;
             trace^[k]:=0;
          end else
      if c^[k]>c^[L[d]] then
          begin
              trace^[k]:=L[d];
              inc(d);
              L[d]:=k;
          end else
          begin
              i:=1; j:=d;
                 while i<j do
                    begin
                       t:=(i+j) div 2;
                       if c^[k]>=c^[L[t]] then i:=t+1 else j:=t;
                    end;
                   t:=(i+j) div 2;
                   trace^[k]:=L[t-1];
                   L[t]:=k;
          end;
      end;
k:=L[d];
fillchar(L,sizeof(L),0);
writeln(d);
end;
//-----------------
begin
         Init;
         Process;

end.
