uses crt;
var
score,i,j,k,n,x,y,z,zz,r,h,o: longint;
a: array[0..10,0..10] of longint;
aa: array[0..10,0..10] of boolean;
ax,ay: array[0..1000] of longint;
word: array[0..100000] of string;
c,cc: char;
s: string;
b,admin,lo:boolean;

procedure g(xx,yy: longint);
begin
gotoxy((yy-1)*6+2,xx*2);
end;

procedure w;
var jj,kk: longint;
begin
for jj:= 1 to 4 do
for kk:= 1 to 4 do
begin
g(jj,kk);
write('     ');
g(jj,kk);
if a[jj,kk]>0 then
if admin then
write(word[a[jj,kk]]) else
write(a[jj,kk]);
end;
gotoxy(12,11);
write('              ');
gotoxy(12,11);
write(score);
if score>h then
h:=score;
gotoxy(12,12);
write('              ');
gotoxy(12,12);
write(h);
gotoxy(21,13);
end;

procedure ran;
var xx,yy: longint;
begin
zz:=0;
for xx:= 1 to 4 do
for yy:= 1 to 4 do
if a[xx,yy]=0 then
begin
inc(zz);
ax[zz]:=xx;
ay[zz]:=yy;
end;
randomize;
i:= random(zz)+1;
x:=ax[i];
y:=ay[i];
z:=(random(2)+1)*2;
a[x,y]:=z;
w;
end;

begin
textcolor(lightred);
clrscr;
writeln;
writeln;
writeln;
writeln;
writeln('       **********************************************');
writeln('       **********************************************');
writeln('       *******     ***      **** * ****      ********');
writeln('       *********** *** **** *** ** **** **** ********');
writeln('       *******     *** **** **       **      ********');
writeln('       ******* ******* **** ****** **** **** ********');
writeln('       *******     ***      ****** ****      ********');
writeln('       **********************************************');
writeln('       **********************************************');
readln(s); r:=1;
if s='harrykwan' then
for j:= 1 to 11 do
begin
admin:=true;
r:=r*2;
repeat
write(r,' = ');
readln(s);
until length(s) in [1..5];
word[r]:=s;
end else 
if s='chem' then
begin
admin:=true;
word[2]:='H';
word[4]:='He';
word[8]:='Li';
word[16]:='Be';
word[32]:='B';
word[64]:='C';
word[128]:='N';
word[256]:='O';
word[512]:='F';
word[1024]:='Ne';
word[2048]:='Na';
word[4096]:='Mg';
end else
if s='roman' then
begin
admin:=true;
word[2]:='I';
word[4]:='II';
word[8]:='III';
word[16]:='IV';
word[32]:='V';
word[64]:='VI';
word[128]:='VII';
word[256]:='VIII';
word[512]:='IX';
word[1024]:='X';
word[2048]:='XI';
word[4096]:='XII';
end else
if s='eng' then
for cc:='A' to 'L' do
begin
admin:=true;
r:=r*2;
word[r]:=cc;
end;

clrscr;
writeln('-------------------------');
writeln('|     |     |     |     |');
writeln('-------------------------');
writeln('|     |     |     |     |');
writeln('-------------------------');
writeln('|     |     |     |     |');
writeln('-------------------------');
writeln('|     |     |     |     |');
writeln('-------------------------');
writeln;
writeln('Score:              ');
writeln('Highscore:          ');
writeln('press esc to restart');
textcolor(lightgreen);
ran; 
ran;
while true do
begin
for j:= 1 to 4 do
for k:= 1 to 4 do
aa[j,k]:=false;
b:=false;
c:=readkey;

//left;
if c=#75 then
for k:= 2 to 4 do
for j:= 1 to 4 do
if a[j,k]>0 then
begin
for n:=k-1 downto 0 do
if a[j,n]>0 then
break;
if (a[j,n]=a[j,k]) and (aa[j,n]=false) then
begin
a[j,n]:=a[j,n]+a[j,k];
score:=score+a[j,n];
aa[j,n]:=true;
a[j,k]:=0;
b:=true;
end else
if n+1<>k then
begin
a[j,n+1]:=a[j,k];
a[j,k]:=0;
b:=true;
end;
end;

//right;
if c=#77 then
for k:= 3 downto 1 do
for j:= 1 to 4 do
if a[j,k]>0 then
begin
for n:=k+1 to 5 do
if a[j,n]>0 then
break;
if (a[j,n]=a[j,k]) and (aa[j,n]=false) then
begin
a[j,n]:=a[j,n]+a[j,k];
score:=score+a[j,n];
aa[j,n]:=true;
a[j,k]:=0;
b:=true;
end else
if n-1<>k then
begin
a[j,n-1]:=a[j,k];
a[j,k]:=0;
b:=true;
end;
end;

//up;
if c=#72 then
for j:= 2 to 4 do
for k:= 1 to 4 do
if a[j,k]>0 then
begin
for n:=j-1 downto 0 do
if a[n,k]>0 then
break;
if (a[n,k]=a[j,k]) and (aa[n,k]=false) then
begin
a[n,k]:=a[n,k]+a[j,k];
score:=score+a[n,k];
aa[n,k]:=true;
a[j,k]:=0;
b:=true;
end else
if n+1<>j then
begin
a[n+1,k]:=a[j,k];
a[j,k]:=0;
b:=true;
end;
end;

//down;
if c=#80 then
for j:= 3 downto 1 do
for k:= 1 to 4 do
if a[j,k]>0 then
begin
for n:=j+1 to 5 do
if a[n,k]>0 then
break;
if (a[n,k]=a[j,k]) and (aa[n,k]=false) then
begin
a[n,k]:=a[n,k]+a[j,k];
score:=score+a[n,k];
aa[n,k]:=true;
a[j,k]:=0;
b:=true;
end else
if n-1<>j then
begin
a[n-1,k]:=a[j,k];
a[j,k]:=0;
b:=true;
end;
end;

for j:= 1 to 4 do
for k:= 1 to 4 do
if a[j,k]>=2048 then
begin
gotoxy(1,14);
writeln('YOU WIN');
end;

o:=0;
for j:= 1 to 4 do
for k:= 1 to 4 do
if a[j,k]=0 then
inc(o);

if o=0 then
begin
lo:=false;
for j:= 1 to 4 do
for k:= 1 to 4 do
if (a[j,k]=a[j,k+1]) or (a[j,k]=a[j+1,k]) then
lo:=true;
if lo=false then
begin
gotoxy(1,14);
writeln('YOU LOSE');
end;
end;

if c=#27 then
begin
score:=0;
for j:= 1 to 4 do
for k:= 1 to 4 do
a[j,k]:=0;
gotoxy(1,14);
writeln('          ');
ran;
ran;
end;

if b then
ran;

end;
end.

