program Duongdi_co_tong_lon_nhat;
const maxN=101;
maxC=100000;
var c:array[0..maxN,0..maxN] of longint;
n,m:longint;
//------------------
procedure Init;
var i,j:longint;
begin
  readln(m,n);
     for i:=1 to m do
        begin
           for j:=1 to n do
              read(c[i,j]);
              readln;
        end;
end;
//-------------------
function max(i,j,k:longint):longint;
var tam:longint;
begin
tam:=i;
   if j>tam then tam:=j;
   if k>tam then tam:=k;
max:=tam;
end;
//-------------------
procedure process;
var i,j:longint;
begin
for i:=0 to n do c[0,i]:=-maxC;
for i:=0 to m do c[i,0]:=-maxC;
for i:=0 to n do
   c[m+1,i]:=-maxC;

    for j:=2 to n  do
       for i:=1 to m do
         c[i,j]:=c[i,j]+max(c[i,j-1],c[i-1,j-1],c[i+1,j-1]);
end;
//-------------------
procedure print;
var i,max:longint;
begin
max:=-maxint;
   for i:=1 to m do
     if c[i,n]>max then max:=c[i,n];
writeln(max);
end;
//-------------------
begin
      Init;
      Process;
      Print;
end.
