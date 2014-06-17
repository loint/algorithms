const
          maxn      =       200 ;
          maxc      =       1000000000 ;

var       n , P     :       integer ;
          c         :       array[1..maxn]         of longint ;
          d         :       array[1..maxn,1..maxn] of longint ;
          a         :       array[1..maxn,1..maxn] of boolean ;
          trace     :       array[1..maxn,1..maxn] of byte    ;

procedure visit( u : longint ) ;
var
     v , i , j : integer ;
begin
     d[u,1] := c[u] ;
     for v := 1 to n do
         if a[u,v] then begin
            a[v,u] := false ;
            visit( v ) ;
            for i := P downto 1 do
                for j := 1 to i - 1 do
                    if d[u,i] < d[u,j] + d[v,i-j] then begin
                       d[u,i]     := d[u,j] + d[v,i-j] ;
                       trace[v,i] := i - j ;
                    end ;
         end ;
end ;

procedure truy_vet( u , P : integer ) ;
var
     v : integer ;
begin
     for v := n downto 1 do
         if a[u,v] and ( trace[v,P] > 0 ) then begin
            truy_vet( v , trace[v,P] ) ;
            dec( P , trace[v,P] ) ;
         end ;
     write(u ,' ' ) ;
end ;

procedure process ;
var
     vt , u : integer ;
begin
     visit( 1 ) ;
     vt := 1 ;
     for u := 2 to n do
         if d[u,P] > d[vt,P] then vt := u ;
     truy_vet( vt , P ) ;
end ;

procedure init ;
var
     u , k : integer ;
begin
     for u := 1 to n do
         for k := 1 to P do d[u,k] := - maxc ;
end ;

procedure Load ;
var
     i , u , v : longint ;
begin
     read(n , P ) ;
     for i := 1 to n do read( c[i] ) ;
     for i := 1 to n - 1 do begin
         read( u , v ) ;
         a[u,v] := true ;
         a[v,u] := true ;
     end ;
end ;

BEGIN
     Load ;
     Init;
     Process;
END.
