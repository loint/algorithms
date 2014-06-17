Program Dijkstra_heap;
const maxN=100000;
      maxC=10000000000;
type link=^node;
     node=record
                dinh,value:longint;
                next:link;
           end;
mang=array[1..maxN] of longint;
var pos,trace,heap:mang;
d:array[1..maxN] of int64;
ke:array[1..maxN] of link;
free:array[1..maxn] of boolean;
nHeap,n,m:longint;
//--------------
procedure Load;
var u,v,c,i:longint;
t:link;
begin
    readln(n,m);
       for i:=1 to n do begin new(ke[i]); ke[i]^.next:=nil; end;
         for i:=1 to m do
            begin
               readln(u,v,c);
               new(t);
               t^.dinh:=v;
               t^.value:=c;
               t^.next:=ke[u];
               ke[u]:=t;
                   new(t);
                   t^.dinh:=u;
                   t^.value:=c;
                   t^.next:=ke[v];
                   ke[v]:=t;
            end;
end;
//---------------
procedure Init;
var i:longint;
begin
   for i:=2 to n do d[i]:=maxC; d[1]:=0;
   fillchar(trace,sizeof(trace),0);
   fillchar(free,sizeof(free),true);
   nHeap:=0;
end;
//---------------
procedure Update(v:longint);
var cha,con:longint;
begin
   con:=pos[v];
   if con=0 then
      begin
         inc(nHeap);
         con:=nHeap;
      end;
   cha:=con shr 1;
   while (cha>0) and (d[heap[cha]]>d[v]) do
      begin
         heap[con]:=heap[cha];
         pos[heap[con]]:=con;
         con:=cha;
         cha:=con shr 1;
      end;
   heap[con]:=v;
   pos[v]:=con;
end;
//---------------
function Pop:longint;
var key,k,root:longint;
begin
   Pop:=Heap[1];
   key:=Heap[nHeap];
   dec(nHeap);
   root:=1;
      while root shl 1<=nHeap do
         begin
         k:=root shl 1;
            if (k<nHeap) and (d[heap[k+1]]<d[heap[k]]) then inc(k);
            if (d[key]<=d[heap[k]]) then break;
            heap[root]:=heap[k];
            pos[heap[root]]:=root;
            root:=k;
         end;
      heap[root]:=key;
      pos[key]:=root;
end;
//---------------
procedure Dijkstra;
var u,v,j,k:longint;
t:link;
begin
Update(1);
   for k:=1 to n do
      begin
      u:=pop;
      free[u]:=false;
      t:=ke[u];
         while t^.next<>nil do
            begin
             v:=t^.dinh;
               if free[v] and (d[v]>t^.value) then
                      begin
                          d[v]:=t^.value;
                          trace[v]:=u;
                          Update(v);
                      end;
               t:=t^.next;
           end;
      end;
end;
//---------------
procedure Print;
var i:longint;
w:longint;
t:link;
begin
w:=0;
  for i:=1 to n do
     begin
     t:=ke[i];
        while t^.next<>nil do
           begin
              if t^.dinh=trace[i] then
                    begin
                        w:=w+t^.value; break
                    end;
              t:=t^.next;
           end;
     end;
writeln(w);
end;
//---------------
begin
        Load;
        Init;
        Dijkstra;
        Print;
end.

