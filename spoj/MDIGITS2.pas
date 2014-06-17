Program FirstNumber;
var st,xau,num:ansistring;
//--------------
procedure Init;
var i,n:longint;
begin
xau:=' ';
st:='';
readln(n);
str(n,num);
   for i:=1 to 100000 do
      begin
         str(i,xau);
         st:=st+xau;
      end;
   for i:=1 to length(st) do
     begin
        if st[i]=num[1] then
          begin
             xau:=copy(st,i,length(num));
             if xau=num then
                begin
                   writeln(i);
                   break;
                end;
          end;
     end;
end;
//---------------
begin
      Init;
end.
