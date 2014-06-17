Program GHEPSO;
const maxN=100;
var a:array[1..maxN] of string;
n:integer;
//---------------
procedure Init;
begin
n:=0;
   while not EOF do
      begin
         inc(n);
         readln(a[n]);
      end;
end;
//----------------
function max(a,b:string):boolean;
var k,i,erro,x,y:integer;
begin
if a=b then begin max:=false; exit end;
if length(a)>length(b) then k:=length(a) else k:=length(b);
inc(k);
for i:=length(a) to k do a:=a+' ';
for i:=length(b) to k do b:=b+' ';

    for i:=1 to k do
       begin
       if a[i]=' ' then begin max:=true; exit end;
       if b[i]=' ' then begin max:=false; exit end;
           val(a[i],x,erro);
           val(b[i],y,erro);
           if x>y then
              begin
                 max:=true;
                 exit;
              end else
             if x<y then begin max:=false; exit end;
       end;
    max:=false;
end;
//---------------
function min(a,b:string):boolean;
var x,y,erro,k,i,j:integer;
begin
if a=b then begin min:=false; exit end;
if length(a)>length(b) then k:=length(a) else k:=length(b);
inc(k);
for i:=length(a) to k do a:=a+' ';
for i:=length(b) to k do b:=b+' ';

    for i:=1 to k do
       begin
        if a[i]=' ' then begin min:=false; exit end;
        if b[i]=' ' then begin min:=true; exit end;
           val(a[i],x,erro);
           val(b[i],y,erro);
           if x<y then
              begin
                 min:=true;
                 exit;
              end else
           if x>y then begin min:=false; exit end;
       end;
    min:=false;
end;
//---------------
procedure QuickSort;
    procedure Partion(L,H:integer);
    var i,j:integer;
    y,key:string;
    begin
       if L>H then exit;
       i:=L; j:=H;
       key:=a[(L+H) div 2];
          repeat
             while max(a[i],key) do inc(i);
             while min(a[j],key) do dec(j);
                if i<=j then
                   begin
                       y:=a[i];
                       a[i]:=a[j];
                       a[j]:=y;
                          inc(i);
                          dec(j);
                   end;
             Partion(L,j); Partion(i,H);
          until i>j;
    end;
begin
    Partion(1,n);
end;
//---------------
procedure Process;
var i:integer;
begin
QuickSort;
  for i:=1 to n do
      write(a[i]);
end;
//---------------
begin
       Init;
       Process;
end.
