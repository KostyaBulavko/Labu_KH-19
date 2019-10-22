Program LAB_5;
  uses crt;
  const x1='01000010101000110100000000000000';
        x2='0100000001001000001100000000000000000000000000000000000000000000';
  var a,b:string;
      f:boolean;

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
    for i:=i-1 downto 2 do if a[i]='0' then a[i]:='1'
      else a[i]:='0';
    DOD:=a;
  end;

  Function ERROR(a:string):boolean;
    var i:integer;
  begin
    ERROR:=FALSE;
    for i:=1 to length(a) do if (a[i]<>'1')and(a[i]<>'0') then ERROR:=TRUE;
  end;

  Function Plus(a,b:string):string;
    var a1,b1,c:string;
  begin
  (*A*)    a1:=copy(a,2,8);
           insert('000',a1,1);
           sum('01110000000',a1,11);
           delete(a,2,8);
           insert('0000000000000000000000000000',a,25);
           insert('01',a,2);
  (*B*)      b1:=copy(b,2,11);
             delete(b,2,11);
             insert('01',b,2);
    if a1<b1 then
      begin
        c:=a1;
        a1:=b1;
        b1:=c;
        c:=a;
        a:=b;
        b:=c;
      end;
    while a1<>b1 do
      begin
        Sum('00000000001',b1,11);
        insert('0',b,2);
        delete(b,55,1);
      end;
    if a[1]='1' then a:=DOD(a);
    if b[1]='1' then b:=DOD(b);
    sum(b,a,55);
    if a[1]='1' then DOD(a);
(* Normalizazzia *)    if a[2]='1' then
                         begin
                           delete(a,2,1);
                           delete(a,53,1);
                           sum('00000000001',a1,11);
                         end
                         else
                           begin
                             while (a[3]<>'1')and(a1>'00000000000') do
                               begin
                                 delete(a,2,1);
                                 insert('0',a,55);
                                 sum('11111111111',a1,11);
                               end;
                             delete(a,2,2);
                           end;
    insert(a1,a,2);
    Plus:=a;
  end;

  Procedure Input(var a,b:string;var f:boolean);
    var k:char;
  begin
    writeln('1| Vvodutu v rychny');
    writeln('2| Vvodutu yak konstanty');
    k:=readkey;
    f:=True;
    case k of
    '1' : begin
            Write('A --> '); readln(a);
              if (Error(a))or(length(a)<>32) then
                begin
                  writeln('Ne pravulno!');
                  f:=False;
                end
                  else
                    begin
                      Write('B --> '); Readln(b);
                      if (Error(b))or(length(b)<>64) then
                        begin
                          writeln('Ne pravulno!');
                          f:=False;
                        end;
                    end;
          end
    else begin
            a:=x1;
            b:=x2;
          end;
    end;
  end;

begin
clrscr;
  Input(a,b,f);
  if f then writeln(plus(a,b));
readkey;
end.