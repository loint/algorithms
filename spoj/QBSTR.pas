Program LNACS;
const maxN=1000;
var f:array[-1..maxN,-1..maxN] of longint;
a,b:ansistring;
n,m,i,j:longint;
//--------------
function max(i,j:longint):longint;
begin
   if i>j then exit(i) else exit(j);
end;
//--------------
begin
   readln(a); n:=length(a);
   readln(b); m:=length(b);
      for i:=1 to n do
         for j:=1 to m do
            if a[i]=b[j] then f[i,j]:=f[i-1,j-1]+1 else f[i,j]:=max(f[i-1,j],f[i,j-1]);
      writeln(f[n,m]);
end.
