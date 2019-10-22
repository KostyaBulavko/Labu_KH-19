Program LAB_4;
  uses crt;
  var a,b,c:string;

  procedure SUM(var b,c:string);
  var j,r1,r2,f,s:integer;
  begin
    r1:=0;  f:=0; r2:=0;
    for j:=8 downto 1 do
      begin
      r1:=ord(b[j])-48;
      r2:=ord(c[j])-48;
      s:=r1+r2+f;
      case s of
         1:
            begin
                c[j]:='1';
                f:=0;
            end;
         2:
            begin
                c[j]:='0';
                f:=1;
            end;
         3:
            begin
                c[j]:='1';
                f:=1;
            end;
         0: begin
                c[j]:='0';
                f:=0;
            end
      end;
      end;
  end;

 function dodKod(b:string):string;
    var i:integer;
        a:string;
  Begin
    a:=b;
    for i:=length(a) downto 1 do
       if a[i]='1' then break;
    for i:=i-1 downto 1 do if a[i]='0' then a[i]:='1'
      else a[i]:='0';
    dodKod:=a;
  end;

  function ERROR(a:string):boolean;
    var i:integer;
  begin
    ERROR:=FALSE;
    if length(a)<>8 then ERROR:=TRUE
      else for i:=1 to length(a) do if (a[i]<>'1')and(a[i]<>'0') then ERROR:=TRUE;
  end;

  function zsyv(a:string):string;
  var i:byte;
  begin
    for i:=2 to 7 do a[i]:=a[i+1];
    a[i+1]:='0';
    zsyv:=a;
  end;

  procedure znak(var a:string; var a1:char);
  begin
    a1:=a[1];
    a[1]:='0';
  end;

  Procedure Division(var a:string; b:string; var c:string);
    var j,n:integer;
        a1,b1:char;
        bd:string;
  begin
    Znak(a,a1);
    Znak(b,b1);
    j:=2;
    n:=1;
    while (a[j]<>'1')and(j<8) do inc(j);
    while (b[j]<>'1')and(n<=8) do
      begin
        b:=Zsyv(b);
        inc(n);
      end;
    if n < 7 then
      begin
        for j:=1 to n do
        begin
          bd:=dodKod(b);
          Sum(bd,a);
          if a[1]='1' then
            begin
              Sum(b,a);
              c:=concat(c,'0');
            end
            else c:=concat(c,'1');
          b:=concat('0',b);
          delete(b,9,1);
        end;
      end;
    for j:=1 to 7-n do insert('0',c,2);
    if a1='1' then a:=dodKod(a);
    if a1<>b1 then c:=dodKod(c);
  end;

  Function ERROR_0(a:string):boolean;
    var i:integer;
  begin
    ERROR_0:=TRUE;
    for i:=2 to 8 do if a[i]='1' then ERROR_0:=FALSE;
  end;

Begin
clrscr;
  write('A --> ');
  readln(a);
  if Error(a) then writeln('error')
    else
     begin
       write('B --> ');
       readln(b);
       if Error(b) then writeln('ERROR')
         else If ERROR_0(b) then writeln('Division by 0')
           else
             begin
               c:='0';
               Division(a,b,c);
               writeln('Chastka A/B = ',c);
               writeln('Ostacha A/B = ',a);
             end;
     end;
readkey;
End.