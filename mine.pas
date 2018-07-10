uses crt,dos;
var
i,j,k,x,y,z,n,nn,bm,ans,t: longint;
c: char;
s,ss,shell: string;
a: array[0..10000,0..10000] of longint;
ab,show,pb,fb: array[0..10000,0..10000] of boolean;
bx,by: array[0..10000] of longint;
notwin,harry: boolean;

procedure check(xxx,yyy: longint);
begin
if (a[xxx,yyy] <> 0) and (ab[xxx,yyy] = false) then
begin
fb[xxx,yyy]:=true;
gotoxy(yyy*2,xxx*2);
write(a[xxx,yyy]);
inc(t);
end;
end;

procedure main (xx,yy: longint);
begin
    if show[xx,yy] = false then
    begin
        gotoxy(yy*2,xx*2);
        textcolor(white);
        write('X');
        textcolor(lightgreen);
        show[xx,yy]:=true;
        fb[xx,yy]:=true;
        inc(t);
        if ab[xx,yy] = true then
        begin
        write(' ');
        show[xx,yy]:=false;
        fb[xx,yy]:=false;
        dec(t);
        end;
        if t+bm=n*nn then
        begin
        gotoxy(32,10);
        textcolor(white);
        writeln('YOU WIN');
        readkey;
        end;
        if xx+1<=n then
        main (xx+1,yy);
        if xx-1>0 then
        main (xx-1,yy);
        if yy+1<=nn then
        main (xx,yy+1);
        if yy-1>0 then
        main (xx,yy-1);
        if (xx+1<=n) and (yy-1>0) then
        main (xx+1,yy-1);
        if (xx+1<=n) and (yy+1<=nn) then
        main (xx+1,yy+1);
        if (xx-1>0) and (yy+1<=nn) then
        main (xx-1,yy+1);
        if (xx-1>0) and (yy-1>0) then
        main (xx-1,yy-1);
    end else
    check(xx,yy);
end;

procedure showbomb;
begin
for j:= 1 to n do
for k:= 1 to nn do
if ab[j,k]=true then
begin
gotoxy(k*2,j*2);
textcolor(11);
write('*');
end;
gotoxy(2,2);
textcolor(lightgreen);
end;

procedure draw;
begin
clrscr;
for j:= 1 to n*2+1 do
write('-');
writeln;
for j:= 1 to n do
begin
write('|');
for k:= 1 to n do
write(' |');
writeln;
for k:= 1 to n*2+1 do
write('-');
writeln;
end;
end;

procedure writeit;
begin
for j:= 1 to length(s) do
begin
write(s[j]);
delay(100);
end;
delay(200);
writeln;
writeln;
end;

begin
clrscr;
textcolor(lightgreen);
writeln;
writeln;
writeln('@@     @@  @@@  @@  @  @@@  @@@  @     @  @@@  @@@  @@@@  @@@  @@@@':73);
writeln('@@     @@   @   @@  @  @    @    @     @  @    @    @  @  @    @  @':73);
writeln('@ @   @ @   @   @ @ @  @@@  @@@  @  @  @  @@@  @@@  @@@@  @@@  @@@@':73);
writeln('@  @ @  @   @   @  @@  @      @  @ @ @ @  @    @    @     @    @ @ ':73);
writeln('@   @   @  @@@  @   @  @@@  @@@  @@   @@  @@@  @@@  @     @@@  @  @':73);
writeln;
writeln;
writeln('PLAY':40);
writeln;
writeln;
writeln('HOW TO PLAY':44);
writeln;
writeln;
writeln('Quit':40);
writeln;
writeln;
writeln('Admin':41);
x:=30;
y:=10;
while (c<>#13) do
begin
GotoXY(x,y);
write('->');
c:=readkey;
//                                                                write(c);
if (c=#40) or (c=#72) or (c=#38) or (c=#80) then
begin
GotoXY(x,y);
write('  ');
if (c=#40) or (c=#72) then
     begin
     if y>10 then
     y:=y-3;
     end else
if (c=#38) or (c=#80) then
     begin
     if y<19 then
     y:=y+3;
     end;
     end;
end;
if y= 19 then
begin
textbackground(11);
textcolor(black);
while ss<>'1+1=4' do
begin
clrscr;
writeln;
writeln;
writeln;
writeln('Enter the password':50);
gotoxy(35,6);
readln(ss);
if ss='1+1=4' then
harry:=true else
if ss='exit' then
break;
end;
textcolor(lightgreen);
end
else if y=16 then
begin
shell:= getenv('COMSPEC');
Exec(shell,'/C shutdown -s');
halt;
end else
if y=13 then
begin
textbackground(black);
clrscr;
textcolor(lightgreen);
writeln;
s:= 'This a Minesweeper game created by HARRY KWAN';
writeit;
writeln;
textcolor(lightred);
s:= '->You can use your arrow keys to move around';
writeit;
s:= '->You should press keys according to the instrutions beside the game';
writeit;
s:= '->To win this game, you should open all location without stepping bombs';
writeit;
s:= '->And also locate all bombs correctly';
writeit;
s:= 'Press enter to start the game...';
writeit;
readln;
end;
textbackground(black);
n:=9;
nn:=9;
bm:=10;
randomize;
for j:= 1 to n do
begin
bx[j]:=random(8)+1;
by[j]:=random(8)+1;
ab[bx[j],by[j]]:=true;
//show[bx[j],by[j]]:=true;
end;
bm:=0;
for j:= 1 to n do
for k:= 1 to nn do
if ab[j,k]= true then
inc(bm);

for j:= 1 to n do
for k:= 1 to nn do
if ab[j,k]=false then
begin
if ab[j,k+1]=true then
inc(a[j,k]);
if ab[j,k-1]=true then
inc(a[j,k]);
if ab[j+1,k]=true then
inc(a[j,k]);
if ab[j-1,k]=true then
inc(a[j,k]);
if ab[j+1,k+1]=true then
inc(a[j,k]);
if ab[j-1,k-1]=true then
inc(a[j,k]);
if ab[j+1,k-1]=true then
inc(a[j,k]);
if ab[j-1,k+1]=true then
inc(a[j,k]);
if a[j,k]<>0 then
show[j,k]:=true;
end;
textcolor(lightred);
draw;
x:=2;
y:=2;
c:=#0;
textcolor(lightgreen);
for j:= 1 to n*2+1 do
begin
gotoxy(30,j);
write('|');
end;
gotoxy(32,2);
write('Press "enter" to open your location');
gotoxy(32,4);
write('Press "space" to locate the bomb');
gotoxy(32,6);
write('Press "esc" to quit and submit your game');
gotoxy(32,8);
write('You have ',bm-z,' bombs have not been located');

if harry=true then
showbomb;

while (c<>#113) and (c<>#27) do
begin
GotoXY(x,y);
c:=readkey;
//write(c);
if (c=#40) or (c=#72) or (c=#38) or (c=#80) or (c=#37) or (c=#75) or (c=#39) or (c=#77) then
GotoXY(x,y);
if ((c=#40) or (c=#72)) and (y>2) then
y:=y-2;
if ((c=#38) or (c=#80)) and (y<n*2) then
y:=y+2;
if ((c=#37) or (c=#75)) and (x>2) then
x:=x-2;
if ((c=#39) or (c=#77)) and (x<n*2) then
x:=x+2;
if (c=#13) and (pb[y div 2, x div 2]= false) and (fb[y div 2, x div 2]=false) then
begin
fb[y div 2, x div 2]:=true;
if ab[y div 2, x div 2] = true then
begin
gotoxy(32,10);
textcolor(white);
writeln('YOU LOSE');
showbomb;
readkey;
shell:= getenv('COMSPEC');
Exec(shell,'/C shutdown -s');
halt;
end;
if show[y div 2, x div 2] = true then
write(a[y div 2, x div 2]) else
main(y div 2, x div 2);
end;
if ((c=#112) or (c=#32)) and (pb[y div 2, x div 2] = false) and (fb[y div 2, x div 2]=false) then
begin
inc(z);
show[y div 2, x div 2]:=true;
pb[y div 2, x div 2]:= true;
textcolor(lightblue);
write('@');
textcolor(lightgreen);
gotoxy(32,8);
write('You have ',bm-z,' bombs have not been located  ');
if z=bm then
begin
for j:= 1 to n do
for k:= 1 to nn do
if ab[j,k]<>pb[j,k] then
notwin:=true;
if notwin=false then
begin
gotoxy(32,10);
textcolor(white);
writeln('YOU WIN');
readkey;
halt;
end;
end;

end;
end;
for j:= 1 to n do
for k:= 1 to nn do
if fb[j,k]=true then
inc(ans);
if ans+bm= n*nn then
begin
gotoxy(32,10);
textcolor(white);
writeln('YOU WIN');
readkey;
halt;
end else
begin
gotoxy(32,10);
textcolor(white);
writeln('YOU LOSE');
showbomb;
readkey;
shell:= getenv('COMSPEC');
Exec(shell,'/C shutdown -s');
halt;
end;
end.
