Program LAB_3;
  uses crt;
  var a,b,c,b1:string;
      i,j:integer;

  Procedure SWAP(var a:string);
    var i:integer;
  Begin
    i:=length(a);
    while a[i]<>'1' do dec(i);
    for i:=i-1 downto 1 do if a[i]='0' then a[i]:='1'
      else a[i]:='0';
    insert('00000000',a,9);
  end;

  procedure SUM(var b,c:string);
    var j,r:integer;
  begin
    r:=0;
    for j:=16 downto 1 do
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
    var i:integer;
  begin
    ERROR:=TRUE;
    if length(a)<>8 then ERROR:=FALSE
      else for i:=1 to length(a) do if (a[i]<>'1')and(a[i]<>'0') then ERROR:=false;
  end;

Begin
clrscr;
  writeln('A,B-?');
  readln(b);
  readln(a);
  b1:=b;
  if (ERROR(a))and(ERROR(b)) then
    begin
      insert('0000000',b,9);
      insert('0',b,1);
      c:='0000000000000000';
      for i:=8 downto 1 do
        begin
          insert('0',c,0);
          delete(c,17,1);
          if a[i]='1' then SUM(b,c);
        end;
      if (a[1]='1')and(b1[1]='1') then
        begin
          SWAP(a);
          SWAP(b1);
          sum(a,b1);
          SUM(b1,c);
        end
        else if (a[1]='1')or(b1[1]='1') then
          begin
            if a[1]='1' then a:=b1;
            swap(a);
            SUM(a,c);
          end;
      writeln(c);
    end
    else writeln('FATTAL ERROR');
readkey;
end.