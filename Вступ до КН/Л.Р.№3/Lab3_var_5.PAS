Uses Crt;
Var x1,x2,zn,xr:string; n,i,j,x,k:integer;
begin
     ClrScr;
     Write(' Input x1 '); readln(x1);
     zn:=x1[1];
     for i:=1 to 16 do
      x1:=concat('0',x1);
     Write(' Input x2 '); readln(x2);
     for i:=1 to 32 do
      xr:=concat('0',xr); j:=16;  k:=0;
     repeat
      x:=0;
      If x2[j]='1' then
      for n:=32 downto 1 do
      begin
       If ((ord(xr[n])+ord(x1[n])+x)=96) then
        begin
         xr[n]:='0'; x:=0;
        end else
       If ((ord(xr[n])+ord(x1[n])+x)=97) then
        begin
         xr[n]:='1'; x:=0;
        end else
       If ((ord(xr[n])+ord(x1[n])+x)=98) then
        begin
         xr[n]:='0'; x:=1;
        end else
        begin
         xr[n]:='1'; x:=1;
        end;
      end;
      for i:=16-k to 32-k do
       x1[i-1]:=x1[i];
       x1[32-k]:='0';
       j:=j-1; x:=0; k:=k+1;
      until j<1;
      If (x2[1]=zn[1]) then xr[1]:='0' else xr[1]:='1';
      Write('     xr = ',xr);
      Readkey;
end.
