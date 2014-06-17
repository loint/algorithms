type
max=0..15;
mang=array[max] of longint;
var
q:array[max] of boolean;
h:array[max] of longint;
gt:array[max] of longint;
n:byte; k:longint;
//-----------------------
procedure lamA(k:longint; var h:mang); {so ra hoan vi}
var i,j:byte;
begin
for i:=1 to n do q[i]:=true;
for i:=1 to n do
begin
for j:=1 to n do
if q[j] then
if k>gt[n-i] then k:=k-gt[n-i]
else break;
h[i]:=j;
q[j]:=false;
end;
end;
//--------------------------
procedure lamB(h:mang;var k:longint); {hoan vi ra so}
var i,j:byte;
begin
for i:=1 to n do q[i]:=true;
k:=1;
for i:=1 to n do
begin
for j:=1 to h[i]-1 do
if q[j] then k:=k+gt[n-i];
q[h[i]]:=false;
end;
end;
//----------------------
procedure doc;
var i:byte;
begin
i:=0;
while not seekeoln do
begin
inc(i);
read(h[i]);
end;
n:=i;
gt[0]:=1;
for i:=1 to n do gt[i]:=gt[i-1]*i;
lamB(h,k);
writeln(k);
read(k);
lamA(k,h);
for i:=1 to n do write(h[i],' ');
end;
//------------------
begin
   doc;
end.
