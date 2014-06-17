Program Bag;
uses crt;
const maxN=1000;
var w:array[1..maxN] of longint;
f:array[0..20,0..50000] of longint;
m:longint;
n:byte;
{----------------------------}
procedure init;
var i:longint;
begin
    readln(m,n);
       for i:=1 to n do
           readln(w[i]);
end;
{----------------------------}
procedure process;
var i,j:longint;
begin
fillchar(f[0],sizeof(f[0]),0); // Khoi tao co so quy hoach
   for i:=1 to n do
      for j:=1 to m do
         begin
              f[i,j]:=f[i-1,j]; // Gia su khong chon vat i
      if (j>=w[i]) and (f[i,j]<f[i-1,j-W[i]]+W[i]) then
      f[i,j]:=f[i-1,j-W[i]]+W[i]; // Dat lai neu thay loi hon
         end;
writeln(f[n,m]);
end;
{----------------------------}
begin
   init;
   process;
end.
