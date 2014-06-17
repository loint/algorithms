Program _Kruskal;
const maxN=10000;
type cay=record
             u,v,c:integer;
             mark:boolean;
         end;
var E:array[1..maxN] of cay;
n,m:integer;
Lab:array[1..maxN] of integer;
connect:boolean;
//----------------------
procedure Load;
var x:integer;
begin
    readln(n,m);
       for x:=1 to m do
          with e[x] do readln(u,v,c);
end;
//----------------------
procedure Init;
var i:integer;
begin
   for i:=1 to n do Lab[i]:=-1;
   for i:=1 to m do E[i].mark:=false;
end;
//----------------------
function GetRoot(v:integer):integer;
begin
     while Lab[v]>0 do v:=Lab[v];
     Getroot:=v;
end;
//----------------------
procedure Union(r1,r2:integer); // Hop nhat 2 cay
var x:integer;
begin
x:=Lab[r1]+Lab[r2];

   if Lab[r1]>Lab[r2] then
     begin
         Lab[r1]:=r2;
         Lab[r2]:=x;
     end else
     begin
        Lab[r2]:=r1;
        Lab[r1]:=x;
     end;
end;
//----------------------
procedure Adjust(root,endnode:integer);
var key:cay;
k:integer;
begin
   key:=E[root];
      while root shl 1 <=endnode do
         begin
             k:=root shl 1;
             if (k<endnode) and (e[k].c>e[k+1].c) then inc(k);
             if key.c<=e[k].c then break;
             e[root]:=e[k]; root:=k;
         end;
     e[root]:=key;
end;
//----------------------
procedure Kruskal;
var cout,i,r1,r2,a:integer;
tam:cay;
begin
cout:=0;
     connect:=false;
       for i:=m shr 1 downto 1 do adjust(i,m);
       for i:=m downto 2 do
           begin
                tam:=e[1];
                e[1]:=e[i];
                e[i]:=tam;
                   adjust(1,i-1);
                   r1:=getroot(e[i].u);
                   r2:=getroot(e[i].v);
                if r1<>r2 then
                    begin
                        e[i].mark:=true;
                        inc(cout);
                        if cout=n-1 then
                           begin
                              connect:=true;
                              exit;
                           end;
                        Union(r1,r2);
                    end;
           end;

end;
//----------------------
procedure print;
var i,max,cout:integer;
begin
cout:=0;
 max:=-maxint;
  for i:=1 to m do
     with e[i] do
        if Mark then
            begin
            if c>max then max:=c;
               inc(cout);
                 if cout=n-1 then break;
            end;
  writeln(max);
end;
//----------------------
begin
        Load;
        Init;
        Kruskal;
        Print;
end.
