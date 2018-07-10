uses crt;
var
i,j,k,z1,z2,b1,b2,fx,fy,dt,d: longint;
c,c1,c2: char;
b: boolean;
a1,a2: array[0..100,0..100] of boolean;
x1,y1,x2,y2,ranx,rany: array[0..10000] of longint;

procedure writepo;
begin
textcolor(lightred);
gotoxy(y1[z1],x1[z1]);
writeln(c1);
textcolor(lightblue);
gotoxy(y2[z2],x2[z2]);
writeln(c2);
end;

procedure left(player: longint);
begin
if player=1 then
begin
gotoxy(y1[z1],x1[z1]);
textcolor(lightred);
if a1[y1[z1],x1[z1]]=false then
write(' ') else
write('@');
if x1[z1]>2 then
dec(x1[z1]) else
x1[z1]:=23;
end else

if player=2 then
begin
gotoxy(y2[z2],x2[z2]);
textcolor(lightblue);
if a2[y2[z2],x2[z2]]=false then
write(' ') else
write('@');
if x2[z2]>2 then
dec(x2[z2]) else
x2[z2]:=23;
end;
end;

procedure right(player: longint);
begin
if player=1 then
begin
gotoxy(y1[z1],x1[z1]);
textcolor(lightred);
if a1[y1[z1],x1[z1]]=false then
write(' ') else
write('@');
if x1[z1]<23 then
inc(x1[z1]) else
x1[z1]:=2;
end else

if player=2 then
begin
gotoxy(y2[z2],x2[z2]);
textcolor(lightblue);
if a2[y2[z2],x2[z2]]=false then
write(' ') else
write('@');
if x2[z2]<23 then
inc(x2[z2]) else
x2[z2]:=2;
end;
end;

procedure down(player: longint);
begin
if player=1 then
begin
gotoxy(y1[z1],x1[z1]);
textcolor(lightred);
if a1[y1[z1],x1[z1]]=false then
write(' ') else
write('@');
if y1[z1]<55 then
inc(y1[z1]) else
y1[z1]:=2;
end else

if player=2 then
begin
gotoxy(y2[z2],x2[z2]);
textcolor(lightblue);
if a2[y2[z2],x2[z2]]=false then
write(' ') else
write('@');
if y2[z2]<55 then
inc(y2[z2]) else
y2[z2]:=2;
end;
end;

procedure up(player: longint);
begin
if player=1 then
begin
gotoxy(y1[z1],x1[z1]);
textcolor(lightred);
if a1[y1[z1],x1[z1]]=false then
write(' ') else
write('@');
if y1[z1]>2 then
dec(y1[z1]) else
y1[z1]:=55;
end else

if player=2 then
begin
gotoxy(y2[z2],x2[z2]);
textcolor(lightblue);
if a2[y2[z2],x2[z2]]=false then
write(' ') else
write('@');
if y2[z2]>2 then
dec(y2[z2]) else
y2[z2]:=55;
end;
end;

procedure food;
var n,ran: longint;
begin
inc(dt);
//gotoxy(1,1);
//writeln(dt,' ',d);
n:=0;
for j:= 2 to 55 do
for k:= 2 to 23 do
if (a1[j,k]=false) and (a2[j,k]=false) and 
((j<>y1[z1]) or (k<>x1[z1])) and ((j<>y2[z2]) or (k<>x2[z2])) then
begin
inc(n);
ranx[n]:=j;
rany[n]:=k;
end;
randomize;
ran:=random(n)+1;
fx:=ranx[ran];
fy:=rany[ran];
textcolor(7);
gotoxy(fx,fy);
if dt=d then
write('&') else
write('$');
gotoxy(1,1);
end;

procedure start;
begin
dt:=0;
randomize; d:=random(10)+3;
c1:='*'; c2:='*';
b1:=10; b2:=10;
for j:= 1 to 100 do
for k:= 1 to 100 do
begin
a1[j,k]:=false;
a2[j,k]:=false;
end;
clrscr;
textcolor(lightgreen);
gotoxy(1,1);
for j:= 1 to 67 do
write('@');
gotoxy(1,24);
for j:= 1 to 67 do
write('@');
for j:= 1 to 24 do
begin
gotoxy(1,j);
write('@');
gotoxy(67,j);
write('@');
gotoxy(56,j);
write('@');
end;
textcolor(lightgreen);
gotoxy(58,3);
write('Player1:');
gotoxy(58,4);
textcolor(7);
write('10       ');
gotoxy(58,6);
textcolor(lightgreen);
write('Player2:');
gotoxy(58,7);
textcolor(7);
write('10       ');
textcolor(lightgreen);
gotoxy(58,20);
write('restart:');
gotoxy(58,21);
write('esc');
z1:=1; z2:=1;
randomize;
x1[1]:=random(20)+2;
y1[1]:=random(20)+2;
x2[1]:=random(20)+2;
y2[1]:=random(20)+2;
while (x1[1]=x2[1]) and (y1[1]=y2[1]) do
begin
x2[1]:=random(10)+1;
y2[1]:=random(10)+1;
end;
writepo;
food;
end;

procedure win(n: longint);
var jj,kk: longint;
begin
if n=2 then
begin
for j:= 0 to 55 do
begin
textcolor(lightblue);
for k:= y1[z1]-j to y1[z1]+j do
if (k in [2..55]) and ((x1[z1]+j) in [2..23]) then
begin
gotoxy(k,x1[z1]+j);
write('#');
end;
for k:= x1[z1]+j downto x1[z1]-j do
if (k in [2..23]) and ((y1[z1]+j) in [2..55]) then
begin
gotoxy(y1[z1]+j,k);
write('#');
end;
for k:= y1[z1]+j downto y1[z1]-j do
if (k in [2..55]) and ((x1[z1]-j) in [2..23]) then
begin
gotoxy(k,x1[z1]-j);
write('#');
end;
for k:= x1[z1]-j to x1[z1]+j do
if (k in [2..23]) and ((y1[z1]-j) in [2..55]) then
begin
gotoxy(y1[z1]-j,k);
write('#');
end;
if j>2 then
delay(10) else
delay(100);
end;
end else

if n=1 then
begin
for j:= 0 to 55 do
begin
textcolor(lightred);
for k:= y2[z2]-j to y2[z2]+j do
if (k in [2..55]) and ((x2[z2]+j) in [2..23]) then
begin
gotoxy(k,x2[z2]+j);
write('#');
end;
for k:= x2[z2]+j downto x2[z2]-j do
if (k in [2..23]) and ((y2[z2]+j) in [2..55]) then
begin
gotoxy(y2[z2]+j,k);
write('#');
end;
for k:= y2[z2]+j downto y2[z2]-j do
if (k in [2..55]) and ((x2[z2]-j) in [2..23]) then
begin
gotoxy(k,x2[z2]-j);
write('#');
end;
for k:= x2[z2]-j to x2[z2]+j do
if (k in [2..23]) and ((y2[z2]-j) in [2..55]) then
begin
gotoxy(y2[z2]-j,k);
write('#');
end;
if j>2 then
delay(10) else
delay(100);
end;
end;
//clrscr;
delay(100);
textcolor(7);
gotoxy(20,10);
writeln('Player',n,' win :)');
gotoxy(20,12);
writeln('press esc to play again');
while c<>#27 do
c:=readkey;
start;
end;

begin
clrscr;
textcolor(lightgreen);
writeln;
writeln;
writeln;
writeln('       ***********************************************');
writeln('       ***** ** ** ** ***    ***  **  ***  *    ******');
writeln('       ***** ** ** * **** ***** ** * * * * * *********');
writeln('       *****    **  ***** *   *    * * * * *    ******');
writeln('       ***** ** ** * **** ** ** ** * * * * * *********');
writeln('       ***** ** ** ** ***    ** ** * ** ** *    ******');
writeln('       ***********************************************');
writeln;
writeln('                          Play');
writeln('                       How to play');
gotoxy(40,12);
write('<-');

while c<>#13 do
begin
c:=readkey;
if (c=#80) and (b=false) then
begin
b:=true;
gotoxy(40,12);
write('  ');
gotoxy(40,13);
write('<-');
end else
if (c=#72) and (b) then
begin
b:=false;
gotoxy(40,13);
write('  ');
gotoxy(40,12);
write('<-');
end;
end;

clrscr;
if b then
begin
writeln('It is a multiplayer game.');
writeln;
textcolor(lightred);
writeln('Player one: ');
writeln('You are the red one');
writeln('press < > ^ v for going left right upward and downward');
writeln('press space to place a bomb');
writeln;
textcolor(lightblue);
writeln('player two: ');
writeln('you are the blue one');
writeln('press a d w s for going left right upward and downward');
writeln('press tab to place a bomb');
writeln;
textcolor(7);
writeln('How to win:');
writeln('when someone is trapped by your bomb, you win');
c:=readkey;
clrscr;
end;

start;

while true do
begin
c:=readkey;
if c=#75 then up(1)
else if c=#77 then down(1)
else if c=#72 then left(1)
else if c=#80 then right(1)
else if c=#97 then up(2)
else if c=#100 then down(2)
else if c=#119 then left(2)
else if c=#115 then right(2)
else if c=#32 then
begin
if (b1>0) and (a1[y1[z1],x1[z1]]=false) then 
begin
a1[y1[z1],x1[z1]]:=true;
dec(b1);
gotoxy(58,4);
write('      ');
gotoxy(58,4);
textcolor(7);
write(b1);
end;
end
else if c=#9 then
begin
if (b2>0) and (a2[y2[z2],x2[z2]]=false) then
begin
a2[y2[z2],x2[z2]]:=true;
dec(b2);
gotoxy(58,7);
write('      ');
gotoxy(58,7);
textcolor(7);
write(b2);
end;
end
else if c=#27 then
start;
//gotoxy(1,1);
//writeln(a2[y1[z1],x1[z1]]);
if (a2[y1[z1],x1[z1]]=true) then
if c1='*' then
win(2) else
begin
a2[y1[z1],x1[z1]]:=false;
c1:='*';
end;
if (a1[y2[z2],x2[z2]]=true) then
if c2='*' then
win(1) else
begin
c2:='*';
a1[y2[z2],x2[z2]]:=false;
end;
if (y1[z1]=fx) and (x1[z1]=fy) then
if dt=d then
begin
c1:='&';
dt:=0;
d:=random(10)+3;
food;
end else
begin
inc(b1);
gotoxy(58,4);
textcolor(7);
write(b1);
food;
end;
if (y2[z2]=fx) and (x2[z2]=fy) then
if dt=d then
begin
c2:='&';
dt:=0;
d:=random(10)+3;
food;
end else
begin
inc(b2);
gotoxy(58,7);
textcolor(7);
write(b2);
food;
end;
writepo;
end;



end.