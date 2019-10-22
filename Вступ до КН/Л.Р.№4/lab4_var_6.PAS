PROGRAM LABA_4;
var
a,b,c,d,n,m,i,l,r,e:integer;
s,s1,s2,s3,s4,s5,s6,s7,s8,s9,s_ogo,s_ika,s_cha:string;
procedure zsuv;
  var
    sa,sb,sc:string;
  var
   a,b,c,p:integer;
  begin
    a:=pos('1',s_ogo);
    b:=pos('1',s_ika);
    b:=b-a;
    delete(s_ika,1,b);
    for i:=1 to b do
      s_ika:=s_ika+'0';
  end;
function minus(sa,sb:string):boolean;
  var
  j,i,k,l,m:integer;
  sc,sd:string;
  begin
    sc:='uuuuuuuuuuuuuuuu';
    sd:='0000000000000000';
    for j:=length(sa) downto 1 do
        begin
          if sb[j]='0' then sc[j]:=sa[j]
          else
            if sa[j]=sb[j] then sc[j]:='0'
            else
              begin
                sc[j]:='1';
                k:=j-1;
                repeat
                  if sa[k]='1' then
                  begin
                  sa[j]:='1';
                  sa[k]:='0'; end
                  else sa[k]:='1';
                  k:=k-1;
                until (sa[j]='1') or (k=0);
                end;
        end;
      s_ogo:=sc;
  end;
procedure plus(var s_ogo:string);
        var
           a,b,c,d,e,i,k:integer;
        var
          s3,s4,s5:string;
        begin
          k:=0;
          s5:='';
          c:=0;
          for i:=16 downto 1 do
            begin
              val(s_ika[i],a,e); val(s_ogo[i],b,e);
              c:=a+b+k;
              if c= 0 then begin c:=0; k:=0; end else
              if c= 1 then begin c:=1; k:=0; end else
              if c= 2 then begin c:=0; k:=1; end else
              if c= 3 then begin c:=1; k:=1; end;
              str(c,s4);
              s5:=copy(s4,1,1)+s5;
            end;
            S3:=COPY(S5,1,16);
            s_ogo:=s3;
        end;
BeGIN
writeln('vvedite dilene Ta dil`nuk  16 simvolov!!!');
readln(s_ogo);
readln(s_ika);
if length(s_ogo)<> 16 then writeln('error 1');
if length(s_ika)<> 16 then writeln('error 1');
s_cha:='0000000000000000';
s:='0000000000000000';
val(s_ogo[1],l,e); val(s_ika[1],r,e);
writeln(l,r);
s_ika[1]:='0';
s_ogo[1]:='0';
writeln('    Dil`ne             Dil`nuk             chastka');
write(s_ogo,' | ');
write(s_ika,' | ');
write(s_cha);
writeln;
    a:=pos('1',s_ogo);
    b:=pos('1',s_ika);
    b:=b-a;
    n:=b+1;
zsuv;
repeat
writeln;
minus(s_ogo,s_ika);
if s_ogo[1]='1' then
begin
  delete(s_cha,1,1);
  s_cha:=s_cha+'0';
  plus(s_ogo);
  delete(s_ika,16,1);
  s_ika:='0'+s_ika;
end
else
  begin
  delete(s_cha,1,1);
  s_cha:=s_cha+'1';
  delete(s_ika,16,1);
  s_ika:='0'+s_ika;
  end;
n:=n-1;
until n=0;
if (l=1) or (r=1) then
s_cha[1]:='1';
writeln(s_ogo,' | ',s_ika,' | ',s_cha);
s5:=s_ogo;
s6:=s_ika;
s7:=s_cha;
READLN;
END.