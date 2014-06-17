Program Bai_co_rat_ngon;
const maxN=103;
var c:array[0..maxN,0..maxN] of 0..1;
free:array[0..maxN,0..maxN] of boolean;
m,n:integer;
//-------------------
procedure Init;
var i,j:integer;
p:char;
begin
    readln(m,n);
    for i:=1 to m do
      begin
         for j:=1 to n do
            begin
              read(p);
              if p='.' then c[i,j]:=0 else c[i,j]:=1;
              free[i,j]:=true;
            end;
         readln;
      end;
end;
//-------------------
procedure Process;
var i,j:integer;
begin
    // loai tru
       for i:=1 to m do
          for j:=1 to n do
            if free[i,j] then
               if c[i,j]=1 then
                  begin
                      free[i,j-1]:=false;
                      free[i+1,j]:=false;
                      free[i,j+1]:=false;
                  end;

end;
//-------------------
procedure print;
var i,j,cout:integer;
begin
cout:=0;
   for i:=1 to m do
      for j:=1 to n do
        if (free[i,j]) and (c[i,j]=1) then inc(cout);
   writeln(cout);
end;
//-------------------
begin
      Init;
      process;
      print;
end.
