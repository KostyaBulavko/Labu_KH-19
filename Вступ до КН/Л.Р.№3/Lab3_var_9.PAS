uses crt;
var a,sum1:string[16];
    e:boolean;
    i,k,l,y,t:integer;
    b,s:string[30];
    d,p:array[1..30] of integer;                                                    sum:string[32];
    begin
     clrscr;
     write('a=',a);
     readln(a);
     write('b=',b);
     readln(b);
     s:=('000000000000000000000000000000');
     e:=false;
     for i:=1 to length(a) do
      if not((a[i]='0')or (a[i]='1')) then
       begin
        e:=true;
        break;
       end;
       for i:=1 to length(b) do
        if not((b[i]='0')or (b[i]='1')) then
         begin
          e:=true;
          break;
          end;
          if not e then
           if a[1]=b[1] then
            sum1:='0'
           else sum1:='1';
           delete(a,1,1);
           delete(b,1,1);
           for i:=1 to length(b) do
            b:=concat(b,'0');
           for l:=1  to length(a) do
           if a[l]='0' then
            begin
             for i:=length(b) downto l do
              b[i]:=b[i-1];
              b[l]:='0'
            end
           else if
            a[l]='1' then
            begin
             for i:=length(b) downto l do
              b[i]:=b[i-1];
             b[l]:='0';
             for i:=1 to 30 do
              begin
               if s[i]='0' then
                d[i]:=0;
                if s[i]='1' then
                 d[i]:=1;
                if b[i]='0' then
                 p[i]:=0;
                if b[i]='1' then
                 p[i]:=1;
              end;
              sum:='';
              for i:=30 downto 1 do
              begin
               y:=y+d[i]+p[i];
                begin
                 if y=0  then
                  begin
                   y:=0;
                   sum:=concat('0',sum);
                  end;
                  if y=1 then
                   begin
                    y:=0;
                    sum:=concat('1',sum);
                   end;
                   if y=2 then
                    begin
                     y:=1;
                     sum:=concat('0',sum);
                    end;
                    if y=3 then
                     begin
                      y:=1;
                      sum:=concat('1',sum);
                     end;
                     s:=sum;
                end;
              end;
            end;
            insert(sum1,sum,1);
            write('sum=',sum);
  readkey;
end.
