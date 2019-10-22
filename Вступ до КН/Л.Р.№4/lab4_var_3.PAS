Program LAB_4;
  uses crt;
  var a,b,c,s,a1,b1:string;
      i,j,R:integer;

  Procedure OBMIN(var aa:string);
    var i:integer;
  Begin
    i:=length(aa);
    while aa[i]<>'1' do dec(i);
    for i:=i-1 downto 1 do if aa[i]='0' then aa[i]:='1'
          else aa[i]:='0';
   end;

  Function SUM(var b,a:string):string;
    var j:integer;  c:string;
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
  readln(a);
  readln(b);
  if (ERROR(a))and(ERROR(b)) then
    begin
       if (a[1]='1') and (b[1]='1') then s:='0' else
         if (a[1]='0') and (b[1]='0') then s:='0' else s:='1';
       a1:=a[1];
       b1:=b[1];
       delete(a,1,1);
       delete(b,1,1);
       if a1='1' then Obmin(a);
       if b1='1' then Obmin(b);
       for i:=1 to 7 do
         if a[i]='1' then break;
       for j:=1 to 7 do
         if b[j]='1' then break;
       i:=j-i;
       for j:=1 to i do begin
         insert('0',b,8);
         delete(b,1,1);
       end;
       c:='0000000';
       for j:=1 to i+1 do begin
           OBMIN(b);
           a:=Sum(a,b);
           OBMIN(b);
          if a[1]='0' then begin
              insert('1',c,8);
              delete(c,1,1);
          end  else begin
              insert('0',c,8);
              delete(c,1,1);
              a:=Sum(a,b);
          end;
          insert('0',b,0);
          delete(b,8,1);
       end;
      Obmin(b);
      a:=Sum(a,b);
      Obmin(c);
      writeln;
      writeln('c=',s,c);
      writeln;
      writeln('a=',a);
    end
   else writeln('Pomulka!');
readkey;
end.
