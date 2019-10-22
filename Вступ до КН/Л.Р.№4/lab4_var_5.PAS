Program LAB_4;
  uses crt;
  var a,b,c:string;

  procedure SUM(var b,c:string);
    var j,r:integer;
  begin
    r:=0;
    for j:=32 downto 1 do
      begin
        if ord(b[j])+ord(c[j])-96+r>1 then
          begin
            if ord(b[j])+ord(c[j])-96+r>2 then c[j]:='1'
              else c[j]:='0';
            r:=1;
          end
          else
            begin
              if ord(b[j])+ord(c[j])-96+r=1 then c[j]:='1'
                else c[j]:='0';
              r:=0;
            end;
      end;
  end;

  Function DOD(b:string):string;
    var i:integer;
        a:string;
  Begin
    a:=b;
    i:=length(a);
    while a[i]<>'1' do dec(i);
    for i:=i-1 downto 1 do if a[i]='0' then a[i]:='1'
      else a[i]:='0';
    DOD:=a;
  end;

  Function ERROR(a:string):boolean;
    var i:integer;
  begin
    ERROR:=FALSE;
    if length(a)<>32 then ERROR:=TRUE
      else for i:=1 to length(a) do if (a[i]<>'1')and(a[i]<>'0') then ERROR:=TRUE;
  end;

  Function Zsyv(a:string):string;
  begin
    delete(a,2,1);
    Zsyv:=concat(a,'0');
  end;

  procedure Znak(var a:string; var a1:char);
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
    while a[j]<>'1' do inc(j);
    while b[j]<>'1' do
      begin
        b:=Zsyv(b);
        inc(n);
      end;
    for j:=1 to n do
      begin
        bd:=dod(b);
        Sum(bd,a);
        if a[1]='1' then
          begin
            Sum(b,a);
            c:=concat(c,'0');
          end
          else c:=concat(c,'1');
        b:=concat('0',b);
        delete(b,33,1);
      end;
    For j:=1 to 31-n do insert('0',c,2);
    if a1='1' then a:=Dod(a);
    if a1<>b1 then c:=Dod(c);
  end;

Begin
clrscr;
  write('A --> ');
  readln(a);
  if Error(a) then writeln('FATAL ERROR')
    else
      begin
        write('B --> ');
        readln(b);
        if Error(b) then writeln('FATAL ERROR')
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