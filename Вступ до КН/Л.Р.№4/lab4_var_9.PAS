program zadacha;
uses crt;
var a,b,d,c,h:string; k1,k,i,n:integer; t:boolean;
function suma(f,d:string):string;
var c,l:integer;
begin
l:=0;
suma:='0000000';
for c:=7 downto 1 do
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
function dodat(e:string):string;
var i:integer;
begin
i:=length(e);
while e[i]<>'1' do i:=i-1;
for i:=(i-1) downto 1 do
if e[i]='1' then e[i]:='0'
            else e[i]:='1';
dodat:=e;
end;
begin clrscr;
writeln('vvedite dilene'); readln(a); t:=true;
writeln('vvedite dilnik'); readln(b);
if (length(a)<>8) or (length(b)<>8) then t:=false
                                      else begin
                                           for i:=1 to 8 do
                                           if ((a[i]<>'1') and (a[i]<>'0')) then t:=false;
                                           for i:=1 to 8 do
                                           if ((b[i]<>'1') and (b[i]<>'0')) then t:=false;
                                           end;
if t=false then writeln('wrong chislo')
           else begin
                if a[1]=b[1] then h:='0'
                             else h:='1';
                delete(a,1,1);
                delete(b,1,1);
                k:=0;
                i:=1;
                while a[i]<>'1' do begin
                                   k:=k+1;
                                   i:=i+1;
                                   end;
                k1:=0;
                i:=1;
                while b[i]<>'1' do begin
                                   k1:=k1+1;
                                   i:=i+1;
                                   end;
                if k>k1 then begin
                             writeln('chastka=0');
                             writeln('ostacha=',a);
                             end
                        else begin
                             delete(b,1,k1-k);
                             for i:=1 to k1-k do b:=concat(b,'0');
                             k:=k1-k;
                             d:=dodat(b);
                             a:=suma(a,d);
                             c:='0000000';
                             for i:=1 to k do begin
                                              for n:=7 downto 2 do b[n]:=b[n-1];
                                              b[1]:='0';
                                              for n:=1 to 6 do c[n]:=c[n+1];
                                              if a[1]='1' then c[7]:='0'
                                                          else c[7]:='1';
                                              if a[1]='0'then begin
                                                              d:=dodat(b);
                                                              a:=suma(a,d);
                                                              end
                                                         else a:=suma(a,b);
                                              end;
                             for n:=1 to 6 do c[n]:=c[n+1];
                             if a[1]='1' then c[7]:='0'
                                         else c[7]:='1';
                             t:=true;
                             for n:=1 to 7 do if a[n]<>'0' then t:=false;
                             if t=false then if a[1]='0' then begin
                                                              d:=dodat(b);
                                                              a:=suma(a,d);
                                                              end
                                                         else a:=suma(a,b)
                                        else for n:=1 to 7 do a[n]:='0';
                             end;
                end;
c:=concat(h,c);
if a[1]='1' then a:=dodat(a);
a:=concat('0',a);
writeln('chastka=',c);
writeln('ostacha=',a);
end.