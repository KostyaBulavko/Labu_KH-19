Uses CRT;
Var s,s1,s2,sz:string;
    z1,z2,z:char;
    i:byte;
Function check:boolean;
         Function check0(s_in:string):boolean;
         Var i_f:integer;
         Begin
              check0:=false;
              For i_f:=1 to 16 do if (s_in[i_f]<>'0') and (s_in[i_f]<>'1') then check0:=true;
         End;
Begin
     If (length(s1)<>16) or (length(s2)<>16) or check0(s1) or check0(s2) then
     Begin
          Textcolor(12); Write('Error in input data!');Textcolor(15);
          Readkey;Halt;
     End;
End;

Function Sum(f1,f2:string;x:byte):string;
         Function bin2dec(in_str:string):longint;
         Var p2to10,q:longint;i_f,str_l:byte;

         Begin
              q:=1;str_l:=length(in_str);p2to10:=0;
              for i_f:=str_l downto 1 do
              Begin
                   p2to10:=p2to10+(ord(in_str[i_f])-ord('0'))*q;
                   q:=q*2;
              End;
              bin2dec:=p2to10;
         End;

         Function dec2bin(in_in:longint):string;
         Var s_tmp,stmp:string;
             mod_x,i_d:byte;
         Begin
              s_tmp:='';
              While (in_in>0) do
              Begin
                   mod_x:=in_in mod 2;
                   Str(mod_x,Stmp);
                   s_tmp:=stmp+s_tmp;
                   in_in:=in_in div 2;
              End;
              if s_tmp='' then s_tmp:='0';
              While length(s_tmp)<x do s_tmp:='0'+s_tmp;
              dec2bin:=s_tmp;
         End;

Begin
     sum:=dec2bin(bin2dec(f2)+bin2dec(f1));
End;

BEGIN
     clrscr; textcolor(15);
     writeln('Enter first number in ordinary code (must contain 16 bits)');
     Readln(s1);
     writeln('Enter second number in ordinary code (must contain 16 bits)');
     Readln(s2);
     Check;
     z1:=s1[1]; z2:=s2[1]; s:='000000000000000000000000000000';
     s1:=copy(s1,2,15)+'000000000000000'; s2:=copy(s2,2,15);
     Writeln('<============= Initial state =============>');
     Writeln('2nd operand  ','               ',s2);
     Writeln('1st operand  ',s1);
     Writeln('Sum          ',s);
     sz:=sum(z1,z2,2);z:=sz[2];
     s2:='0'+s2;
     For i:=1 to 15 do
     Begin
          readkey;
          s2:=copy(s2,2,15)+'0';
          s1:='0'+copy(s1,1,29);
          If s2[1]='1' then s:=SUM(s,s1,30);
          Writeln('<=============    STEP   #',i,'   =============>');
          Writeln('2nd operand  ','              ',s2);
          Writeln('1st operand  ',s1);
          Writeln('Sum          ',s);
     End;
     Textcolor(14);
     Writeln('Final sum=',s);
     Writeln('Sign=',z);
     Textcolor(10);
     s:=SUM(copy(s,1,15),s[16],15);
     Write('Sum=');
     If (z='1') and (s<>'000000000000000') then write('-');
     Write(s[1],'.',Copy(s,2,15));
     readkey;
END.