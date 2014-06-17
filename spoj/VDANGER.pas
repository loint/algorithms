Program Nguyhiem;
const maxN=150;
      maxC=1000000000;
var c:array[1..maxN,1..maxN] of int64;
way:array[1..maxN*100] of longint;
n,m:longint;
//-----------------
procedure Load;
var i,j:longint;
begin
    readln(n,m);
    for i:=1 to m do readln(way[i]);

    for i:=1 to n do
       for j:=1 to n do
           read(c[i,j]);
end;
//-----------------
procedure Process;
var i,j,k:longint;
sum:qword;
begin
     for k:=1 to n do
        for i:=1 to n do
           for j:=1 to n do
       if c[i,j]>c[i,k]+c[k,j] then
           c[i,j]:=c[i,k]+c[k,j];

sum:=0;
for i:=2 to m do
   sum:=sum+c[way[i-1],way[i]];
writeln(sum);
end;
//-----------------
begin
       Load;
       Process;
end.
