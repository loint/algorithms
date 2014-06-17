const maxn=10000+10;
      maxm=100000+10;
var
    n,m,s,t,res:longint;
    h:array[1..maxn*2]of longint;
    a,x,y:array[1..maxm*4]of longint;
    vs:array[1..maxn*2]of boolean;
    q:array[1..maxn*4]of longint;
    first,last:longint;
    p,pre:array[0..maxn*2]of longint;
    np:longint;

procedure scan;
var i,u,v:longint;
begin
    fillchar(h,sizeof(h),0);
    readln(n,m,s,t);

    for i:=1 to m do
      begin
      readln(u,v);
      inc(h[u]);
      x[i]:= u; y[i]:= v;
      end;

    for i:=2 to n+1 do h[i]:= h[i]+ h[i-1];

    for i:=1 to m do
      begin
      u:= x[i]; v:= y[i];
      a[ h[u] ]:= v;
      dec(h[u]);
      end;
end;

procedure print;
begin
    writeln(res);
end;


procedure init;
var i,u,v:longint;
begin
    fillchar(h,sizeof(h),0);

    for i:=1 to n do inc(h[i*2]);


    for i:=1 to m do
      begin
      u:= x[i]; v:= y[i];
      inc( h[u*2+1] );
      end;

    for i:=2 to 2*n+2 do h[i]:= h[i]+ h[i-1];

    for i:=1 to m do
      begin
      u:= x[i]; v:= y[i];
      a[ h[u*2+1] ]:= v*2;
      dec(h[u*2+1]);
      end;

    for i:=1 to n do
      begin
      a[ h[i*2] ]:= i*2+1;
      dec(h[i*2]);
      end;

end;

procedure push(u:longint);
begin
    inc(last);
    q[last]:= u;
end;

function pop:longint;
begin
    pop:= q[first];
    inc(first);
end;

procedure bfs(s:longint);
var u,iv,v:longint;
begin
    first:=1; last:=1;
    q[1]:= s;
    fillchar(pre,sizeof(pre),0);

    pre[s]:= n+1; pre[0]:= n+1;

    while first<= last do
      begin
      u:= pop; vs[u]:= true;
      for iv:=h[u]+1 to h[u+1] do
        begin
        v:= a[iv]; if pre[v]<>0 then continue;
        pre[v]:= u;
        push(v);
        end;
      end;
end;



procedure bfs1(s:longint);
var u,iv,v:longint;
begin
    first:=1; last:=1;
    q[1]:= s;

    pre[s]:= n+1; pre[0]:= n+1;

    while first<= last do
      begin
      u:= pop; vs[u]:= true;
      for iv:=h[u]+1 to h[u+1] do
        begin
        v:= a[iv]; if pre[v]<>0 then continue;
        pre[v]:= u;
        push(v);
        end;
      end;
end;


procedure trace(u:longint);
begin
    if u=s*2+1 then
      begin
      inc(np);
      p[np]:= u;
      exit;
      end;
    trace(pre[u]);
    inc(np);
    p[np]:= u;
end;

procedure solve;
var u,v,iv,i:longint;
begin
    init;
    bfs(s*2+1);
    np:= 0;
    trace(t*2+1);
    p[0]:= 0;

    for i:=1 to np-1 do
      begin
      u:= p[i];
        for iv:= h[u]+1 to h[u+1] do
          if a[iv]=p[i+1] then
            begin
            a[iv]:= p[i-1];
            break;
            end;
      end;

    fillchar(pre,sizeof(pre),0);
    bfs1(s*2+1);
    res:= 0;
    for i:=2 to np-2 do
      if pre[ p[i] ]=0 then
        begin
        inc(res);
        bfs1(p[i+1]);
        end;
end;

begin
scan;
solve;
print;
end.
