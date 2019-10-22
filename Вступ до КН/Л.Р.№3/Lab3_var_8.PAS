uses crt;
type mas=array [1..17] of integer;
var
  _1:mas;
  _2:mas;
  Sym:mas;
  i,s,k:integer;
  y,x:string;
procedure BBecTu(a:string; var b:mas;i:integer;k:integer);
  begin
    if (a[i-8]='0') then b[k]:=0;
    if (a[i-8]='1') then b[k]:=1;
  end;

procedure z_right;
  var k:integer;
  begin
    for k:=17 downto 9 do
      begin
        _2[k+1]:=_2[k];
      end;
      _2[9]:=0;
    for k:=1 to 17 do
      write(_2[k]);
    writeln;
  end;

procedure z_left;
  var k:integer;
  begin
    for k:=1 to 16 do
      begin
        _1[k]:=_1[k+1];
        write(_1[k]);
      end;
    writeln;
    _1[16]:=0;
  end;

procedure summ;
  var k:integer;
  begin
  for k:=16 downto 1 do
    begin
      s:=sym[k]+_1[k]+s;
      if s=2 then begin
                    S:=1;
                    sym[k]:=0;
                  end
      else if s=3 then begin
                         s:=1;
                         sym[k]:=1;
                       end
      else if s=0 then
                      begin
                         s:=0;
                         sym[k]:=0;
                       end
     else if s=1 then begin
                         s:=0;
                         sym[k]:=1;
                       end;
    end;
  for k:=1 to 16 do
    write(sym[k]);
  writeln;
  end;
begin
  clrscr;
  for i:=1 to 16 do
    sym[i]:=0;
  writeln('BBeDiT" perwuy mno*nuk doB*unoyu 8 pozr"adiv');
  readln(y);
  k:=8;
  for i:=9 to 16 do
    begin
      inc(k);
      BBectu(y,_1,i,k);
    end;
  writeln('BBeDiT" dryguy mno*nuk doB*unoyu 8 pozr"adiv');
  readln(x);
  k:=8;
  for i:=9 to 16 do
    begin
      inc(k);
      BBectu(x,_2,i,k);
    end;
  writeln;
  for i:=1 to 8 do
    begin
      s:=0;
      if i=1 then begin
                    z_right;
                    if _2[17]=1 then summ;
                  end
      else  begin
              z_right;
              z_left;
              if _2[17]=1 then summ;
            end;
      writeln;
    end;
  write('REZALT: ');
  for i:=1 to 16 do
    write(sym[i]);
readkey;
end.
