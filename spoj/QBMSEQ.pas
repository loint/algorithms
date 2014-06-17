Program QBMSEQ;
var n,i,tam1,tam2,max,dem,k,u:longint;
//---------------
begin
      readln(n);
      for i:=1 to n do
         begin
            readln(tam1); u:=trunc(sqrt(tam1 shl 1));
            if u*(u+1)=tam1 shl 1 then
               begin
                 if (tam1>=tam2) then
                     begin
                         inc(dem);
                         if max<dem then max:=dem;
                     end else dem:=1;
                  tam2:=tam1;
               end else begin dem:=0; tam2:=0; end ;
         end;
   writeln(max);
end.