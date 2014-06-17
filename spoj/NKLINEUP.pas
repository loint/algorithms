Program Interval_tree;
type diem=record
              x,y:longint;
          end;
const maxN=200000;
     maxC=2000000;
var add,n,m,maxTree,time:longint;
treemin,treemax,cha:array[1..maxN] of longint;
d:array[1..200001] of diem;
kmax,kmin:longint;
//-------------------
procedure Init;
var i:longint;
begin
readln(n,m);
   maxTree:=1;
      for i:=1 to 18 do
         if maxTree<n then maxTree:=maxTree*2 else break;
         if maxTree<n then maxTree:=maxTree*2;

      maxTree:=maxTree*2;
      dec(maxTree);  Add:=maxtree-n;

   for i:=add+1 to maxTree do readln(treemin[i]);
   treemax:=treemin;
for i:=1 to m do with d[i] do
  readln(x,y);

end;
//--------------------
function min(i,j:longint):longint;
begin
   if i<j then min:=i else min:=j;
end;
//--------------------
function max(i,j:longint):longint;
begin
   if i>j then max:=i else max:=j;
end;
//--------------------
procedure Get(L,R:longint);
var i:longint;
begin
   while L<>1 do
      begin
      i:=L;
         repeat
              if i>=R then break;
                 cha[i]:=i div 2;
                 cha[i+1]:=i div 2;
                 treemin[i div 2]:=min(treemin[i],treemin[i+1]);
                 treemax[i div 2]:=max(treemax[i],treemax[i+1]);
                 inc(i,2);
        until false;
        R:=L; L:=L div 2;
      end;
end;
//--------------------
procedure Cal(L,R:longint);
var sonut:longint;
begin
if (cha[L]=cha[R]) and (L<>R) then begin L:=cha[L]; R:=cha[R]; end;

    if L=R then
       begin
           kmax:=max(kmax,treemax[L]);
           kmin:=min(kmin,treemin[L]);
           exit
       end else
       begin
          if L mod 2<>0 then
                   begin
                       kmax:=max(kmax,treemax[L]);
                       kmin:=min(kmin,treemin[L]);
                       inc(L);
                   end;
          if R mod 2=0 then
              begin
                   kmax:=max(kmax,treemax[R]);
                   kmin:=min(kmin,treemin[R]);
                   dec(R);
              end;
          sonut:=(R-L+1);
       // Xong thao tac chuan hoa
       if sonut>=2 then
          begin
             if (cha[L]<>cha[R]) then
                 begin
                     L:=cha[L];
                     R:=cha[R];
                 end;
             Cal(L,R);
          end;
     end;
end;
//--------------------
Procedure Process;
var i,cout,j:longint;
begin
   for i:=1 to m do
      begin
         kmax:=0;
         kmin:=maxC;
            Cal(d[i].x+add,d[i].y+add);
         writeln(kmax-kmin);
      end;
end;
//--------------------
begin
       Init;
       Get(maxTree div 2+1,maxTree);
       Process;
end.

