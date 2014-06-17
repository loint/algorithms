Program LINEGAME;
var cong,tru:int64;
n:longint;
//-------------------
procedure Solve;
var i,a:longint;
begin
    readln(n);
    read(cong);
    tru:=0;
    for i:=2 to n do
          begin
          read(a);
             if tru<cong-a then tru:=cong-a;
             if cong<tru+a then cong:=tru+a;
          end;
    writeln(cong);
end;
//-------------------
begin
          Solve;

end.

