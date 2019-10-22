Program LAB_6;
  uses crt;
  const x1='0001111111100100000000000000000000000000000000000000000000000000';
        x2='1010000000101000000000000000000000000000000000000000000000000000';
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

  Function ERROR(a:string):boolean;
    var i,n:integer;
  begin
    ERROR:=FALSE;
    n:=length(a);
    if n<>64 then ERROR:=TRUE
    else for i:=1 to length(a) do
           if (a[i]<>'1')and(a[i]<>'0') then ERROR:=TRUE;
  end;

  function Multiplication(a,b:string):string;
    var i,j:integer;
        a1,b1,M,m1:string;
  begin
    if a[1]=b[1] then m1:='0'
      else m1:='1';
    (*A*)  a1:=copy(a,2,11);
           a1:=concat('0000',a1);
           delete(a,1,11);
           a[1]:='1';
    (*B*)    b1:=copy(b,2,11);
             b1:=concat('0000',b1);
             delete(b,1,11);
             b[1]:='1';
             insert('0000000000000000000000000000000000000000000000000000',b,54);
             b:=concat('0',b);
    SUM(b1,a1,15);
    SUM('011100000000001',a1,15);
    M:='0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
    for i:=53 downto 1 do
      begin
        if a[i]='1' then SUM(b,M,106);
        delete(M,106,1);
        M:=concat('0',M);
      end;
    i:=pos('1',M);
    M:=copy(M,i+1,64);
    while length(M)<>64 do M:=concat(M,'0');
    Multiplication:=concat(m1,a1,M);
  end;

Begin
clrscr;
  a:=x1;
  b:=x2;
  Writeln(a);
  Writeln(b);
  Writeln(Multiplication(a,b));
readkey;
End.