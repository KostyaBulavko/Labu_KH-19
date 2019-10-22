Program LAB_3;
  uses crt;
  var a,b,c,b1,c1:string;
      i,j:integer;

  Procedure OBMIN(var aa:string);
    var i:integer;
  Begin
    i:=length(aa);
    while aa[i]<>'1' do dec(i);
    for i:=i-1 downto 2 do if aa[i]='0' then aa[i]:='1'
          else aa[i]:='0';
     insert('00000000',aa,1);
     aa[1] := aa[9];
     aa[9] := '0';
   end;

  Procedure Korect(var aa:string);
    var i:integer;
  Begin
    i:=length(aa);
    while aa[i]<>'1' do dec(i);
    for i:=i-1 downto 1 do if aa[i]='0' then aa[i]:='1'
          else aa[i]:='0';
     delete(aa,1,1);
     insert('0',aa,1);
     insert('00000000',aa,9);
  end;

  Function SUM(var b,a:string):string;
    var j,r:integer;  c:string;
  begin
    r:=0;  c:=a;
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
      Sum:=c;
  end;

 Function ERROR(a:string):boolean;
    var i:integer;
  begin
    ERROR:=TRUE;
    if length(a)<>8 then ERROR:=FALSE
      else for i:=1 to length(a) do if (a[i]<>'1')and(a[i]<>'0') then
       ERROR:=false;
  end;
                                                                              
Begin
  clrscr;                                                                    
  writeln('A,B-?');                                                           
  readln(b);
  readln(a);
 b1:=b;
  if (ERROR(a))and(ERROR(b)) then
    begin
      insert('00000000',b,0);
      c:='0000000000000000';
      for i:=8 downto 1 do begin
               if a[i]='1' then c:=SUM(b,c);
               insert('0',b,17);
               delete(b,1,1);
      end;
      c1:=c;
      if (a[1]='1')and(b1[1]='1') then
        begin
          OBMIN(a);
          OBMIN(b1);
          a[1]:='0';
          b1[1]:='0';
          c1:=sum(a,b1);
          delete(c1,1,8);
          insert('00000000',c1,7);
          c1:=sum(c,c1);
        end
        else    if a[1]='1' then
           begin
             Korect(b1);
             b1[1]:='1';
             c1:=SUM(b1,c1);
           end
             else
               if b1[1]='1' then
                 begin
                  Korect(a);
                  a[1]:='1';
                  c1:=SUM(a,c1);
                 end;
      writeln(c1);
    end
   else writeln('Pomulka!');
readkey;
end.
