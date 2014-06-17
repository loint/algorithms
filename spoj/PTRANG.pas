Program PTRANG_;
const maxN=15000;
var g,c:array[0..maxN] of longint;
n,m:longint;
//-------------------
procedure Init;
var i,j:integer;
begin
    readln(n,m);
       for i:=1 to n do
          readln(c[i]);
end;
//-------------------
function min(i,j:longint):longint;
begin
   if i>j then min:=j else min:=i;
end;
//-------------------
function max(i,j:longint):longint;
begin
   if i>j then max:=i else max:=j;
end;
//-------------------
procedure Process;
var i,j:longint;
begin

   for i:=1 to n do
      begin
          c[i]:=c[i]+c[i-1];
          g[i]:=0;
      end;
c[0]:=0;
   for i:=1 to n do
       begin
       g[i]:=maxlongint;
           for j:=i-1 downto 0 do
              begin
                 if c[i]-c[j]>m then break;
                 g[i]:=min(g[i],max(g[j],m-(c[i]-c[j])));
              end;
       end;
writeln(g[n]);
end;
//-------------------
begin
    
        Init;
        Process;

end.