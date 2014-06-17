Program Lo_co;
const maxN=1002;
var n:longint;
best,c:array[0..maxN] of longint;
//---------------------------
procedure Load;
var i:longint;
begin
    readln(n);
       for i:=1 to n do
          begin
              read(c[i]);
              best[i]:=1;
          end;
end;
//----------------------------
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
          Partion(L,j);  Partion(i,H);
        end;
begin
   Partion(1,n);
end;
//-----------------------
function max(x,y:longint):longint;
begin
  if x>y then max:=x else max:=y;
end;
//-----------------------
function tim(x:longint; m:integer):longint;
var i,j,t:longint;
begin
i:=1; j:=m;
    while i<j do
       begin
          t:=(i+j) div 2;
       if j-i=1 then break;
    if x>=c[t] then i:=t else j:=t;
       end;
if c[t]=x then tim:=t else
if c[t+1]=x then tim:=t+1 else
if c[t-1]=x then tim:=t-1 else tim:=-maxint;
end;
//--------------------------
procedure process;
var i,j,k:longint;
maxO:longint;
begin
QuickSort;
maxO:=-maxlongint;
    for i:=3 to n do
       begin
           for j:=i-1 downto 2 do
              begin
                 k:=tim(c[i]-c[j],j);
                 if k>0 then best[i]:=max(best[i],max(best[j],best[k])+1);
              end;
           if best[i]>maxO then maxO:=best[i];
       end;
writeln(maxO);
end;
//-------------------------
begin
    Load;
    Process;
end.
