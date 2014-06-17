Program Nuoc_lanh;
const maxN=100000;
type link=^node;
     node=record
             dinh:longint;
             next:link;
          end;
var pt,z,sum,n,m:longint;
d,sau,truoc:array[1..maxN] of longint;
ke:array[1..maxN] of link;
//----------------
procedure Load;
var i,u,v,c:longint;
t:link;
begin
    readln(n,m);
       for i:=1 to n do
          begin
             new(ke[i]);
             ke[i]^.next:=nil;
          end;
       for i:=1 to m do
          begin
             readln(u,v,c);
             new(t);
             t^.dinh:=v;
             t^.next:=ke[u];
             ke[u]:=t;
             new(t);
             t^.dinh:=c;
             t^.next:=ke[u];
             ke[u]:=t;
          end;
end;
//---------------
procedure nap(i:longint);
var t:link;
begin
t:=ke[i];
   while t^.next<>nil do
     begin
        d[t^.dinh]:=sum;
        inc(z);
        sau[z]:=t^.dinh;
        t:=t^.next;
     end;
end;
//---------------
procedure process;
var i:longint;
begin
d[1]:=1;
sum:=1;
truoc[1]:=1;
pt:=1;

while pt<>0 do
   begin
   inc(sum);
       z:=0;
       for i:=1 to pt do nap(truoc[i]);
       truoc:=sau;
       pt:=z;
   end;

for i:=1 to n do
  writeln(d[i]);
end;
//---------------
begin
    Load;
     Process;
end.
