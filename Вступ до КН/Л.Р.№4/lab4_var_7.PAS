uses crt;
var S1,S2,s,F,K:string;
    i,h:integer;

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

function f_num(G:string):integer;
var L,j:integer;
    S:string;
begin
 j:=1;
 while (j<=length(G)) and (G[j]='0') do
  begin
   S:=G[j];
   inc(j);
  end;
 f_num:=j;
end;

function L_num(G:string):integer;
var L,j:integer;
    S:string;
begin
 L:=0;
 j:=length(G);
 while (j>1) or (S='0') do
  begin
   S:=G[j];
   dec(j);
   inc(L);
  end;
 L_num:=L;
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
 if length(S)>7
        then delete(S,1,1);
 sym:=S;
end;

procedure PR_DOD(var S:string);
 var i,j:word;
begin
 j:=length(S);
 while  (S[j]='0') and (j>=1) do dec(j);
 for i:=1 to 16 do
  if i<j
   then
    if S[i]='1'
     then S[i]:='0'
     else S[i]:='1';
end;

function vid(var D1,D2:string):string;
begin
 PR_DOD(D2);
 vid:=sym(D1,D2,7);
 if length(D1)>7
  then delete(D1,1,1);
end;

begin
 clrscr;
 write('String_1 - ');readln(S1);
 write('String_2 - ');readln(S2);
 checking(S1,S2);
 if S1[1]=S2[1]
  then K[1]:='0'
  else k[1]:='1';
 delete(S1,1,1);
 delete(S2,1,1);
 h:=f_num(S2)-f_num(S1);
 delete(S2,f_num(S1),h);
 F:='00000000';
 for i:=1 to h do
   S2:=concat(S2,'0');
 for i:=1 to h+1 do
  begin
    S:=S2;
    S1:=vid(S1,S);
    if S1[1]='1'
     then
      begin
       S1:=sym(S1,S2,7);
       F:=concat(F,'0');
       delete(F,1,1);
      end
     else
      begin
       F:=concat(F,'1');
       delete(F,1,1);
      end;
     delete(S2,7,1);
     S2:=concat('0',S2);
  end;
 F[1]:=K[1];
{ PR_DOD(F);
 PR_DOD(S1);    }
 writeln('Result = ',F);
 writeln('Ostacha = ',S1);
 readkey;
end.