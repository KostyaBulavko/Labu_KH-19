uses crt;
var d1,d2,ch,z1,z2,p,z:string; i,k,k1,k2:word;

function perevod(m:string):string;
var s,p,j:string; n,k,l,i,t:word;
begin
p:='';
if m[1]='-' then
  begin
  j:='1'; delete(m,1,1);
  end
   else j:='0';
s:=''; val(m,n,k);
repeat
begin
l:=n mod 2;
s:=concat(chr(l+48),s);
n:=n div 2;
end;
until (n div 2)<1;
s:=concat(chr(n+48),s);
p:=concat(s,p);  t:=length(s);
for i:=2 to 8-t do
p:=concat('0',p);
p:=concat(j,p);
writeln('V 2-y s-me: ',s,'  ');
writeln('Pryamoy kod: ',p);
perevod:=p;
end;

function code(p:string):string;
var  a,b:integer; d,d1:string;
begin
d:='';
 for a:=length(p) downto 1 do
  if p[a]='1' then
  begin
  b:=a;break;
  end;
 for a:=length(p) downto b do
 d:=concat(p[a],d);
 for a:=b-1 downto 1 do
  begin
  if p[a]='0' then d1:=chr(ord(p[a])+1)
   else d1:=chr(ord(p[a])-1);
  d:=concat(d1,d);
  end;
 code:=d;
end;

function dopol(p1:string):string;
var  i,j:integer; dop,dop1:string;
begin
dop:='';
if p1[1]='1' then
 begin
 for i:=length(p1) downto 1 do
  if p1[i]='1' then
  begin
  j:=i;break;
  end;
 for i:=length(p1) downto j do
 dop:=concat(p1[i],dop);
 for i:=j-1 downto 2 do
  begin
  if p1[i]='0' then dop1:=chr(ord(p1[i])+1)
   else dop1:=chr(ord(p1[i])-1);
  dop:=concat(dop1,dop);
  end;
 dop:=concat(p1[1],dop);
 dopol:=dop;
 end
  else
    dopol:=p1;
end;

function symma(a1:string;a2:string):string;
 var f:boolean; j:integer; s:string;
begin
 s:='';
 f:=false;
 for j:=7 downto 1 do
  begin
   if f=true then
     if (a1[j]='1') and (a2[j]='1') then
      begin
      s:=concat('1',s);
      f:=true;
      end
       else
         if (a1[j]='0') and (a2[j]='0') then
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
      if (a1[j]='1') and (a2[j]='1') then
       begin
       s:=concat('0',s);
       f:=true;
       end
        else
          if (a1[j]='0') and (a2[j]='0') then
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
 symma:=s;
end;

begin
clrscr;
write('Vvedite 1-e chislo:'); readln(d1);
d1:=perevod(d1);
write('Vvedite 2-e chislo:'); readln(d2);
d2:=perevod(d2);
z1:=copy(d1,1,1);
z2:=copy(d2,1,1);
delete(d1,1,1);
delete(d2,1,1);
writeln('Dilene - ',d1);
for i:=1 to length(d1) do
 if d1[i]='1' then
  begin
  k1:=i;
  break;
  end;
for i:=1 to length(d2) do
 if d2[i]='1' then
  begin
  k2:=i;
  break;
  end;
if k1>k2 then
 begin
 ch:='0';
 d1:=d1;
 end
   else
    begin
    k:=k2-k1;
    delete(d2,k1,k);
    for i:=1 to k do
     d2:=concat(d2,'0'); writeln('Dilnuk - ',d2);
     d2:=code(d2);
    ch:='0000000';
    for i:=1 to k+1 do
     begin
      p:=d1;
      d1:=symma(d1,d2);
      if length(d1)>7 then delete(d1,1,1);
      if d1[1]='0' then
       begin
        delete(ch,1,1);
        ch:=concat(ch,'1');
       end
        else
         begin
          delete(ch,1,1);
          ch:=concat(ch,'0');
          d1:=p;
         end;
      delete(d2,7,1);
      d2:=concat('1',d2);
     end;
     if (z1='0') and(z2='0') then
       z:='0'
        else
         if ((z1='1') and(z2='0'))or ((z1='0') and(z2='1')) then
           z:='1'
            else z:='0';
     d1:=concat(z,d1); writeln('Ostatok - ',d1);  d1:=dopol(d1);
     ch:=concat(z,ch); writeln('Chastka - ',ch);  ch:=dopol(ch);
    end;
writeln('Chastka v dodatkovomy codi - ',ch);
writeln('Ostatok v dodatkovomy codi - ',d1);
readkey;
end.