Program V11WATER;
const maxN=100001;
var L,R,f:array[0..maxN] of longint;
n:longint;
//----------------
procedure Init;
var i:longint;
begin
    readln(n);
       for i:=1 to n do
          read(f[i]);
end;
//----------------
function max(i,j:int64):int64;
begin
   if i>j then exit(i) else exit(j);
end;
//----------------
function min(i,j:int64):int64;
begin
   if i>j then exit(j) else exit(i);
end;
//----------------
procedure Process;
var i:longint;
sum,tam:int64;
begin
L[0]:=-maxlongint; L[n+1]:=-maxlongint;
R[0]:=-maxlongint; R[n+1]:=-maxlongint;

   for i:=1 to n do
      begin
         L[i]:=max(L[i-1],f[i]);
         R[n-i+1]:=max(R[n-i+2],f[n-i+1]);
      end;
sum:=0;
   for i:=1 to n do
      begin
         tam:=min(R[i],L[i])-f[i];
         if tam>0 then inc(sum,tam);
      end;
writeln(sum);
end;
//----------------
begin
      Init;
      Process;
end.


