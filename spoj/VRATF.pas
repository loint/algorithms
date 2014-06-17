Program Kon_duong_bao_quanh_nong_trang;
var k,dem:longint;
stack:array[1..50] of longint;
t,n:longint;
//-----------------
procedure push(v:longint);
begin
   inc(t);
   stack[t]:=v;
end;
//-----------------
function pop:longint;
begin
   pop:=Stack[t];
   dec(t);
end;
//-----------------
procedure Device;
var x,y:longint;
begin
push(n);
while t>0 do
   begin
      n:=pop;
      x:=(n-k) div 2;
      y:=n-x;
        if (x>0) and (y>0) then
            begin
               if abs(x-y)<k then inc(dem) else
               if abs(x-y)=k then
                   begin
                       push(x); // ben trai
                       push(y);  // ben phai
                   end else inc(dem);
            end else inc(dem);
   end;
end;
//-----------------
procedure Init;
begin
dem:=0;
    readln(n,k);
    device;
writeln(dem);
end;
//-----------------
begin
      Init;
end.