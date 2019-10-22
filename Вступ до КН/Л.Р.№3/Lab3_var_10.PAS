 uses crt;
 var x,y,dob,z,w,q,g,h:string; i:word;

function symma(s3:string;s1:string):string;
  var f,z:boolean; j:integer; s:string;
begin
{ z:=False;
 if s1[1]='1' then
   begin
     z:=True;
     s1[1]:='0';
   end;    }
 s:='';
 f:=false;
 for j:=32 downto 1 do
  begin
   if f then
     if (s1[j]='1') and (s3[j]='1') then
      begin
      s:=concat('1',s);
      f:=true;
      end
       else
         if (s1[j]='0') and (s3[j]='0') then
          begin
          s:=concat('1',s);
          f:=false;
          end
           else
             begin
             s:=concat('0',s);
             f:=true;
             end
    else
      if (s1[j]='1') and (s3[j]='1') then
       begin
       s:=concat('0',s);
       f:=true;
       end
        else
          if (s1[j]='0') and (s3[j]='0') then
           begin
           s:=concat('0',s);
           f:=false;
           end
            else
              begin
              s:=concat('1',s);
              f:=false;
              end;
  end;
 if f then s:=concat('1',s);
{ if z then s[1]:='1'; }
 symma:=s;
end;


begin
clrscr;
write('Vvedite 1-e chislo:'); readln(x);
write('Vvedite 2-e chislo:'); readln(y);
if ((x[1] = '0') and (y[1] = '1')) or ((x[1] = '1') and (y[1] = '0'))
then z := '1'
else z := '0';
x[1] := '0';
y[1] := '0';
x := '0000000000000000' + x;
dob := '00000000000000000000000000000000';
for i := 16 downto 1 do
begin
  if y[16] = '1' then
  begin
    if (i <> 16) then
    begin
      delete(x,1,1);
      x := x + '0';
    end;
    dob := symma(x, dob);
  end;
  delete(y,16,1);
  y := '0' + y;
end;
 dob[1] := z[1];
 writeln('Polychaem: ',dob);
 readkey;
end.