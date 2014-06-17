{$H+}
const
    maxn = 200001;
var
    n:longint;
    greater,smaller:boolean;
    a,b,s,a1,b1,x1,x2,res,x:string;
    d,d2,d3:array['0'..'9'] of longint;
    f:array[1..maxn+1,'0'..'9'] of longint;

procedure enter;
begin
    readln(n);
    readln(a);
    readln(b);
    readln(s);
end;

function checking(vt:longint;c:char):boolean;
var
    i,count,count2:longint;
    vt1,vt2,kt,kt2:char;
    tm,ok:boolean;
begin
    d2:=d;
    dec(d2[c]);
    ok:=false; tm:=greater;
    if c > x1[vt] then tm:=true;
    for i:=vt + 1 to n do
        begin
            if tm then break;
            kt2:=chr(ord(x1[i]) + 1);
            for kt:='9' downto kt2 do
                if d2[kt] > 0 then
                    begin
                        tm:=true;
                        break;
                    end;
            if tm then break;
            if d2[x1[i]] = 0 then exit(false);
            dec(d2[x1[i]]);
        end;
    if not tm then exit(false);
    d2:=d;
    dec(d2[c]);
    for i:=n downto vt + 1 do
        begin
            kt2:=chr(ord(x2[i]) - 1);
            for kt:=kt2 downto '0' do
                if d2[kt] > 0 then
                    begin
                        ok:=true;
                        break;
                    end;
            if ok then break;
            if d2[x2[i]] = 0 then exit(false);
            dec(d2[x2[i]]);
        end;
    if (ok) and (tm) then exit(true);
    count:=0;
    res:=res+c;
    for i:=vt downto 1 do
        if res[i] > x2[i] then
            begin
                delete(res,length(res),1);
                exit(false);
            end
        else if res[i] < x2[i] then
            begin
                delete(res,length(res),1);
                exit(true);
            end;
    delete(res,length(res),1);
    checking:=false;
end;

procedure solve;
var
    i,t:longint;
    j:char;
    ok:boolean;
    count:longint;
    c:char;
begin
    a1:=''; b1:='';
    for i:=n downto 1 do a1:=a1 + a[i];
    for i:=n downto 1 do b1:=b1 + b[i];
    for i:=1 to n do inc(d[s[i]]);
    greater:=false;
    res:='';
    if a > b then x1:=a else x1:=b;
    if a1 > b1 then x2:=b1 else x2:=a1;
    x:=x2;
    for i:=1 to n do x2[i]:=x[n-i+1];
    for i:=1 to n do
        begin
            if greater then
                begin
                    ok:=false;
                    for c:='0' to '9' do
                        if d[c] > 0 then
                            begin
                                if checking(i,c) then
                                    begin
                                        ok:=true;
                                        res:=res+c;
                                        dec(d[c]);
                                        break;
                                    end;
                            end;
                    if not ok then
                        begin
                            writeln(-1);
                            exit;
                        end;
                end
            else begin
                    ok:=false;
                    for c:=x1[i] to '9' do
                        if d[c] > 0 then
                            begin
                                if checking(i,c) then
                                    begin
                                        ok:=true;
                                        res:=res + c;
                                        dec(d[c]);
                                        break;
                                    end;
                            end;
                    if c > x1[i] then greater:=true;
                    if not ok then
                        begin
                            writeln(-1);
                            exit;
                        end;
                 end;
        end;
    writeln(res);
end;

begin
    enter;
    solve;
end.
