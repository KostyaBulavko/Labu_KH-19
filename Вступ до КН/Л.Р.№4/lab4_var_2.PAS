program division;

procedure disum(var s:string; d1,d2:string; var p:boolean);
var i,j,a:integer;
begin
 s:={000000000000000000000000}'00000000';
 i:=8;
 p:=false;
 while i>0 do
 begin
  a:=ord(d1[i])-ord(d2[i]);
  if a=0 then
   s[i]:='0'
  else
   if a=1 then
    s[i]:='1'
   else
   if a=-1 then
   begin
    s[i]:='1';
    j:=i;
    while (d1[j]<>'1')and(j>0) do
    begin
     d1[j]:='1';
     j:=j-1;
    end;
    if j=0 then
     p:=true
    else
     d1[j]:='0';
   end;
  i:=i-1;
 end;
end;

procedure sum(var s:string; d1,d2:string; var p:boolean);
var a,b,i:integer;
begin
 b:=0;
 s:={000000000000000000000000}'00000000';
 i:=length(d1);
 p:=true;
 while i>0 do
 begin
  a:=ord(d2[i])+ord(d1[i])-96+b;
  if a=0 then
  begin
   s[i]:='0';
   b:=0;
  end
  else
   if a=1 then
   begin
    s[i]:='1';
    b:=0;
   end
   else
    if a=2 then
    begin
     s[i]:='0';
     b:=1;
    end
    else
     if a=3 then
     begin
      s[i]:='1';
      b:=1;
     end;
  i:=i-1;
 end;
 if b=1 then
  p:=false;
end;

procedure divis(var s,d1:string; d2:string);
var i,j,k,l:integer;
    p:boolean;
    s1:string;
begin
 s:={000000000000000000000000}'00000000';
 i:=1;
 k:=0;
 while (d1[i]<>'1')and(i<=8) do
 begin
  k:=k+1;
  i:=i+1;
 end;
 i:=1;
 l:=0;
 while (d2[i]<>'1')and(i<=8) do
 begin
  l:=l+1;
  i:=i+1;
 end;
 if l>k then
 begin
  delete(d2,1,l-k);
  d2:=d2+copy(s,1,l-k);
 end;
 p:=true;
 for i:=l-k+1 downto 1 do
 begin
  if (s[8]='1')or(i=(l-k+1)) then
   disum(s1,d1,d2,p)
  else
   sum(s1,d1,d2,p);
  d1:=s1;
  if i<>1 then
  begin
   delete(d2,8,1);
   d2:='0'+d2;
  end;
  if p then
  begin
   delete(s,1,1);
   s:=s+'0';
  end
  else
  begin
   delete(s,1,1);
   s:=s+'1';
  end;
 end;
 if p then
 begin
  sum(s1,d1,d2,p);
  d1:=s1;
 end;
end;

var s,d1,d2:string;
    b:boolean;

begin
 repeat
  write('d1=');
  readln(d1);
  write('d2=');
  readln(d2);
 until (length(d1)=8)and(length(d2)=8);
 divis(s,d1,d2);
 writeln;
 writeln('Chastka ',s);
 writeln('Ostacha ',d1);
end.




