Program LAB_7;
  uses crt;
  const x1=(*250*)'0100000001101111010000000000000000000000000000000000000000000000';
        x2=(*050*)'1100000001001001000000000000000000000000000000000000000000000000';
  var a,b:string(*DOUBLE*);

  procedure SUM(b:string; var c:string;n:integer);
    var j,r:integer;
  begin
    r:=0;
    for j:=n downto 1 do
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

  Function Division(a,b:string):String;
    var i:integer;
        a1,b1,m1,M:string;
  begin
    m:='';
    if a[1]=b[1] then m1:='0'
      else m1:='1';
    (*A*)  a1:=copy(a,2,11);
           delete(a,2,11);
           insert('01',a,2);
           a[1]:='0';
    (*B*)    b1:=copy(b,2,11);
             delete(b,2,11);
             insert('01',b,2);
             b[1]:='0';
    SUM(dod(b1),a1,11);
    delete(a1,1,3);
    SUM('01111111',a1,8);
    Sum(dod(b),a,55);
    while a[1]<>'0' do
      begin
        delete(a,1,1);
        a:=concat(a,'0');
        Sum('11111111',a1,8);
        SUM(b,a,55);
      end;
    while length(m)<22 do
      begin
        delete(a,2,1);
        a:=concat(a,'0');
        if a[1]='0' then Sum(dod(b),a,55)
          else Sum(b,a,55);
        If a[1]='0' then m:=concat(m,'1')
          else m:=concat(m,'0');
      end;
    Division:=concat(m1,a1,m);
  end;

Begin
clrscr;
  a:=x1;
  b:=x2;
  Writeln(a);
  Writeln(b);
  Writeln(Division(a,b));
readkey;
End.