 uses crt;
 var A1,A2,D,S:string;
     i:word;

procedure checking(A1,A2:string);
 var i:word;
 begin
  i:=0;
 repeat
  inc(i);
  if (length(A1)<>8) or (length(A2)<>8) or
     ((A1[i] <> '0') and (A1[i] <> '1')) or
     ((A2[i] <> '0') and (A2[i] <> '1'))
   then
    begin
     writeln('Wrong number!');
     writeln('Try again!');
     writeln;
     write('Write your first number - ');readln(A1);
     write('Write your second number - ');readln(A2);
     i:=0;
    end;
  until (i>=length(A1)) or (i>=length(A2));
 end;

function sym(var D:string;A1:string;k:word):string;
 var f:boolean;
     j:integer;
     S:string;
begin
 S:='';
 f:=false;
      for j:=k downto 1 do
       begin
        if f=true
         then
          if (A1[j]='1') and (D[j]='1')
           then
             begin
              S:=concat('1',S);
              f:=true;
             end
           else
            if (A1[j]='0') and (D[j]='0')
             then
               begin
                S:=concat('1',S);
                f:=false;
               end
             else
               begin
                S:=concat('0',S);
                f:=true;
               end
         else
          if (A1[j]='1') and (D[j]='1')
           then
             begin
              S:=concat('0',S);
              f:=true;
             end
           else
            if (A1[j]='0') and (D[j]='0')
             then
               begin
                S:=concat('0',S);
                f:=false;
               end
             else
               begin
                S:=concat('1',S);
                f:=false;
               end;
       end;
 if f=true
  then S:=concat('1',S);
 sym:=S;
end;

procedure DK_PR(var S:string);
 var j,i:integer;
begin
 j:=length(S);
 if S[1]='1'
  then
   begin
    S[1]:='0';
    while  (S[j]='0') and (j>=1) do dec(j);
    for i:=2 to 8 do
     if i<j
      then
       if S[i]='1'
        then S[i]:='0'
        else S[i]:='1';
    end;
end;

procedure PR_DK(var S:string);
 var i,j:word;
begin
 j:=length(S);
 while  (S[j]='0') and (j>=1) do dec(j);
 for i:=1 to 8 do
  if i<j
   then
    if S[i]='1'
     then S[i]:='0'
     else S[i]:='1';
end;

procedure PSDob(A1,A2:string);
 var i:word;
begin
 A1:=concat(A1,'00000000');
 D:='0000000000000000';
 for i:=1 to 8 do
  begin
   delete(A1,16,1);
   A1:=concat('0',A1);
   if A2[i] = '1'
    then D:=sym(D,A1,16);
  end;
end;

procedure Result(A1,A2:string);
begin
 if (A1[1]='0') and (A2[1]='0')
  then writeln('Result - ',D)
  else
   if (A1[1]='1') and (A2[1]='1')
    then
     begin
      DK_PR(A1);
      DK_PR(a2);
      S:=sym(A1,A2,8);
      S:=concat(S,'00000000');
      S:=sym(D,S,16);
      Delete(S,1,1);
      writeln('Result - ',S);
     end
    else
     if (A1[1]='1') and (A2[1]='0')
      then
       begin
        PR_DK(A2);
        A2:=concat(A2,'00000000');
        S:=sym(D,A2,16);
        writeln('Result - ',S);
       end
    else
     begin
      PR_DK(A1);
      A1:=concat(A1,'00000000');
      S:=sym(D,A1,16);
      writeln('Result - ',S);
     end;
end;

begin
 clrscr;
 write('Write your first number - ');readln(A1);
 write('Write your second number - ');readln(A2);
 checking(A1,A2);
 PSDob(A1,A2);
 Result(A1,A2);
 readkey;
end.