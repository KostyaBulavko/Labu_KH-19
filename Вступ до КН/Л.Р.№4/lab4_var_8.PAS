uses crt;
var S1,S2,s,F:string;k1:boolean;
   p,K,i,h:integer;
function nuli(G:string):integer;
var L,j:integer;
    S:string;
begin
 j:=1;
 while (j<=length(G)) and (G[j]='0') do
  begin
   S:=G[j];
   inc(j);
  end;
 nuli:=j;
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
function summa(var D:string;A1:string;k:word):string;
 var f:boolean;
     j:integer;
     S:string;
begin
 S:='';
 f:=false;
      for j:=k downto 1 do
       begin
        if f=true then
          if (A1[j]='1') and (D[j]='1') then
                                         begin
                                          S:=concat('1',S);
                                          f:=true;
                                         end
        else if (A1[j]='0') and (D[j]='0') then
                                            begin
                                             S:=concat('1',S);
                                             f:=false;
                                            end
        else begin
              S:=concat('0',S);
              f:=true;
             end
        else if (A1[j]='1') and (D[j]='1') then
                                            begin
                                             S:=concat('0',S);
                                             f:=true;
                                            end
        else if (A1[j]='0') and (D[j]='0') then
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
 if f=true then S:=concat('1',S);
 if length(S)>14 then delete(S,1,1);
 summa:=S;
end;
procedure Pereved(var S:string);
 var i,j:word;
begin
 j:=length(S);
 while  (S[j]='0') and (j>=1) do dec(j);
 for i:=1 to 14 do
  if i<j
   then
    if S[i]='1'
     then S[i]:='0'
     else S[i]:='1';
end;
function vid(var D1,D2:string):string;
begin
 Pereved(D2);
 vid:=summa(D1,D2,14);
 if length(D1)>16
  then delete(D1,1,1);
end;
begin
 clrscr;
 writeln('                           $');
 write('String_1 - ');readln(S1);
 write('String_2 - ');readln(S2);
 if (S1[1]='1') or (S2[1]='1') then k1:=false;
 delete(s1,1,2);
 delete(s2,1,2);
 h:=nuli(S2)-nuli(S1);
 delete(S2,nuli(S1),h);
 F:='';
 for i:=1 to h do
   S2:=concat(S2,'0');
 for i:=1 to h+1 do
  begin
    S:=S2;
    S1:=vid(S1,S);
    if S1[1]='1'
     then
      begin
       S1:=summa(S1,S2,16);
       F:=concat(F,'0');
      end
     else F:=concat(F,'1');
     delete(S2,16,1);
     S2:=concat('0',S2);
  end;
 if f='' then f:='0000000000000000';

 p:=length (S1) - length (F);
 for i:=p downto 1 do
 F:='0'+F;
  if not (k1) then F:='1'+F else F:='0'+F;
 writeln('Resultat = ',F);
 writeln('Ostacha vid dil. = ',S1);
 readkey;
end.