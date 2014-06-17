Program NKLetter;
var s1,s2:string;
so1,so2:integer;
//-----------------
procedure Init;
var k,i:integer;
begin
  readln(s1);
    readln(s2);
so1:=length(s1);
so2:=length(s2);
end;
//-----------------
function min(i,j:integer):integer;
begin
   if i>j then min:=j else min:=i;
end;
//-----------------
procedure Process;
var m,n,i:integer;
xau1,xau2:string;
long:integer;
begin
n:=length(s1);
m:=length(s2);
  if n>m then
     begin
        for i:=1 to n-m do
           s2:=s2+'*';
     end else
  if m>n then
     begin
        for i:=1 to m-n do
           s1:='*'+s1;
     end;
n:=length(s1);
long:=0;
for i:=1 to n do
  begin
  xau1:=copy(s1,i,n-i+1);
  xau2:=copy(s2,1,n-i+1);
   if xau1=xau2 then
      begin
      long:=n-i+1;
         break;
      end;
  end;
writeln(so1+so2-long);
end;
//-----------------
begin
        Init;
        Process;
end.

