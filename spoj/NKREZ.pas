Program Hoi_Truong;
const MaxN=10001;
type loai=record
             d,c:longint;
             p:longint;
          end;
var a:array[1..maxN] of loai;
best:array[1..maxN] of longint;
n:longint;
{---------------------------------}
procedure init;
var i:longint;
begin
    readln(n);
       for i:=1 to n do with a[i] do
          begin
             readln(d,c);
             p:=c-d;
          end;
end;
{---------------------------------}
procedure QuickSort;
    procedure Partion(L,H:longint);
    var i,j,key:longint;
    y:loai;
       begin
           i:=L; j:=H; key:=a[(L+H) div 2].d;
             repeat
                 while a[i].d<key do inc(i);
                 while a[j].d>key do dec(j);
                    if i<=j then
                       begin
                           y:=a[i];
                           a[i]:=a[j];
                           a[j]:=y;
                              inc(i);
                              dec(j);
                       end;
             until i>j;
           if j>L then Partion(L,j);
           if i<H then Partion(i,H);
       end;
begin
   Partion(1,n);
end;
{---------------------------------}
procedure process;
var i,j:longint;
max:longint;
begin
QuickSort;
for i:=1 to n do best[i]:=a[i].p;
    for i:=1 to n do
       for j:=i-1 downto 1 do
          if (a[i].d>=a[j].c) and (best[i]<best[j]+a[i].p) then
                 best[i]:=best[j]+a[i].p;
max:=-maxint;
for i:=1 to n do
   if best[i]>max then max:=best[i];
writeln(max);
end;
{---------------------------------}
begin
 
    init;
    process;
end.
