Program SEQGame;
const maxN=100000;
type mang=array[1..maxN] of longint;
var c:mang;
time,n:longint;
//--------------------------
procedure init;
var i:longint;
begin
    readln(n);
       for i:=1 to n do read(c[i]); readln;
end;
//--------------------------
procedure QuickSort;
   procedure Partion(L,H:longint);
   var i,j,key,y:longint;
   begin
      if L>=H then exit;
      i:=L; j:=H; key:=c[L+Random(H-L+1)];
         repeat
             while c[i]<key do inc(i);
             while c[j]>key do dec(j);
                if i<=j then
                   begin
                      y:=c[i];
                      c[i]:=c[j];
                      c[j]:=y;
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
//--------------------------
function next(x:longint):longint;
var i,j,t:longint;
begin
i:=1; j:=n;
    while i<j do
       begin
         if j-i=1 then
            if abs(x+c[i])>=abs(x+c[j]) then
               begin
                  t:=j;
                  break;
               end else begin t:=i; break end;
           t:=(i+j) div 2;
       if ((-x)>=c[t]) then i:=t else j:=t;
       end;
next:=c[t];
end;
//--------------------------
procedure process;
var i,min,k,x:longint;
begin
QuickSort;
min:=maxlongint;
   for i:=1 to n do
      begin
      read(x);
          k:=abs(next(x)+x);
            if k<min then min:=k;
      end;
writeln(min);
end;
//--------------------------
begin
        Init;
        Process;
end.

