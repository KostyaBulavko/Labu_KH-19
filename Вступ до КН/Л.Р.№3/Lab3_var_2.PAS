program zadacha;
uses crt;
var r,a,b,e:string; i,c,g:integer; t:boolean;
function suma(f,d:string):string;
var c,l:integer;
begin
l:=0;
for c:=32 downto 1 do
if ((f[c]='1') and (d[c]='1') and (l=0)) or
   ((f[c]='1') and (d[c]='0') and (l=1)) or
   ((f[c]='0') and (d[c]='1') and (l=1)) then begin
                                              suma[c]:='0';
                                              l:=1;
                                              end
else if ((f[c]='1') and (d[c]='0') and (l=0)) or
        ((f[c]='0') and (d[c]='1') and (l=0)) or
        ((f[c]='0') and (d[c]='0') and (l=1)) then begin
                                                   suma[c]:='1';
                                                   l:=0;
                                                   end
      else if ((f[c]='1') and (d[c]='1') and (l=1)) then begin
                                                         suma[c]:='1';
                                                         l:=1;
                                                         end
           else begin
                suma[c]:='0';
                l:=0;
                end;
end;
procedure dodat(var a:string);
var i:integer;
begin
i:=length(a);
while a[i]<>'1' do i:=i-1;
for i:=(i-1) downto 1 do
if a[i]='1' then a[i]:='0'
else a[i]:='1';
a:=concat(a,'0000000000000000');
end;
begin clrscr;
writeln('vvedite 1 mnognik'); readln(a); t:=true;
writeln('vvedite 2 mnognik'); readln(b);
if (length(a)<>16) or (length(b)<>16) then t:=false
                                      else for i:=1 to 16 do
                                      if ((a[i]<>'1') and (a[i]<>'0')) or ((b[i]<>'1') and (b[i]<>'0')) then t:=false;
if t=false then writeln('wrong chislo')
           else begin
                b:=concat('0000000000000000',b);
                e:='00000000000000000000000000000000';
                for i:=1 to 16 do if a[i]='0' then begin
                                                  for c:=1 to 31 do e[c]:=e[c+1];
                                                  e[32]:='0';
                                                  end
                                              else begin
                                                   for c:=1 to 31 do e[c]:=e[c+1];
                                                   e[32]:='0';
                                                   e:=suma(b,e);
                                                   end;
                delete(b,1,16);
                if (a[1]='0') and (b[1]='1') then begin
                                                  dodat(a);
                                                  e:=suma(a,e);
                                                  end
                      else if (a[1]='1') and (b[1]='0') then begin
                                                              dodat(b);
                                                              e:=suma(b,e);
                                                              end
                            else if (a[1]='1') and (b[1]='1') then begin
                                                                   dodat(a);
                                                                   dodat(b);
                                                                   a:=suma(a,b);
                                                                   e:=suma(a,e);
                                                                   end;
                 end;
writeln(e);
end.