 uses crt;
 var j,i:longint;
     S:string;
begin
 clrscr;
 i:=0;
 write('Write your number B(2) - ');readln(S);
 repeat
  inc(i);
  if (S[i]<>'0') and (S[i]<>'1')
   then
    begin
     writeln('Wrong number!');
     writeln('Try again!');
     writeln;
     write('Write your number B(2) - ');readln(S);
     i:=0;
    end;
  until i>=length(S);
 j:=length(S);
 if S[1]='0'
  then write('Result - ',S)
  else
   begin
    while  (S[j]='0') and (j>=1) do dec(j);
    for i:=2 to 8 do
     if i<j
      then
       if S[i]='1'
        then S[i]:='0'
        else S[i]:='1';
     writeln('Result - ',S);
    end;
 readkey;
end.

