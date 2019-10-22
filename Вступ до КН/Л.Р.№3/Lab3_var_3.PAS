uses crt;
var x,y,dob,z,w,q,g,h:string; i:word;

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
if p[1]='1' then
 begin
 for a:=length(p) downto 1 do
  if p[a]='1' then
  begin
  b:=a;break;
  end;
 for a:=length(p) downto b do
 d:=concat(p[a],d);
 for a:=b-1 downto 2 do
  begin
  if p[a]='0' then d1:=chr(ord(p[a])+1)
   else d1:=chr(ord(p[a])-1);
  d:=concat(d1,d);
  end;
 d:=concat(p[1],d);
 code:=d;
 end
  else
    code:=p;
end;

function symma(s3:string;s1:string):string;
 var f:boolean; j:integer; s:string;
begin
 s:='';
 f:=false;
 for j:=16 downto 1 do
  begin
   if f=true then
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
 if f=true then s:=concat('1',s);
 symma:=s;
end;

begin
clrscr;
write('Vvedite 1-e chislo:'); readln(x);
q:=perevod(x); z:=code(q); writeln('Dopolnitelnuy kod: ',z); writeln;
write('Vvedite 2-e chislo:'); readln(y);
g:=perevod(y); w:=code(g); writeln('Dopolnitelnuy kod: ',w);
z:=concat('00000000',z);
dob:='0000000000000000';
 for i:=length(w) downto 1 do
  begin
  if w[i]='1' then
   dob:=symma(dob,z);
  delete(z,1,1);
  z:=concat(z,'0');
  end;
writeln('Result ymnogeniya: ',dob);
writeln;
writeln('Korekziya rezyltata:');
if (x[1]<>'-')and(y[1]<>'-') then
 begin
 writeln(' 1-e>0, ¨ 2-e>0:');
 writeln('Result ymnogeniya: ',dob);
 end;
if (x[1]='-')and(y[1]<>'-') then
 begin
 writeln(' 1-e<0, a 2-e>0:');
 writeln('K resultaty + -2*',y);
 w[1]:='1'; w:=code(w);
 delete(w,1,1);
 w:=concat('0',w,'00000000');
 dob:=symma(dob,w);
 if dob[1]='0' then dob[1]:='1';
 writeln('Polychaem: ',dob);
 end;
if (y[1]='-')and(x[1]<>'-') then
 begin
 writeln(' 1-e>0, a 2-e<0:');
 writeln('K resultaty + -2*',x);
 z[1]:='1'; z:=code(z);
 delete(z,1,1);
 z:=concat('0',z,'00000000');
 dob:=symma(dob,z);
 if dob[1]='0' then dob[1]:='1';
 writeln('Polychaem: ',dob);
 end;
if (y[1]='-')and(x[1]='-') then
 begin
 writeln(' 1-e<0, ¨ 2-e<0:');
 writeln('K resultaty + 2*(|',x,'|+|',y,'|)');
 q[1]:='0'; g[1]:='0';
 q:=concat(q,'00000000');
 g:=concat(g,'00000000');
 h:=symma(q,g);
 writeln('symma',h);
 delete(h,1,1);
 h:=concat('0',h,'00000000');
 dob:=symma(dob,h);
 delete(dob,1,1);
 writeln('Polychaem: ',dob);
 end;
readkey;
end.