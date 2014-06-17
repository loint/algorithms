var     i , n , j , best : longint ;
        a , f : array[1..1000] of longint ;

BEGIN
     readln( n ) ;
     best := 0 ;
     for i := 1 to n do
        begin
           read( a[i] ) ;
           f[i] := 1 ;
           for j := 1 to i - 1 do
          if ( a[i] > a[j] )and( f[i] < f[j] + 1 ) then f[i] := f[j] + 1 ;
            if f[i] > best then best := f[i] ;
     end ;
     writeln( best ) ;
END.