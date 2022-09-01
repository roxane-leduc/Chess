unit complement;

interface

uses Initialisation, Jeu, Verification, Crt, keyboard;

var petitRoqueBlancPossible,petitRoqueNoirPossible,grandRoqueBlancPossible,grandRoqueNoirPossible: boolean;

procedure roquePossible (e: T_echiquier; var petitRoqueBlancPossible,petitRoqueNoirPossible,grandRoqueBlancPossible,grandRoqueNoirPossible: Boolean);
procedure roque (joueur:T_couleur;petitRoqueBlancPossible,petitRoqueNoirPossible,grandRoqueBlancPossible,grandRoqueNoirPossible: Boolean; var e: T_echiquier;var aJoue:boolean);
procedure promotion (coordA: coordonnees;joueur:T_couleur; var e: T_echiquier);
procedure priseEnPassantRealisable (coordD, coordA: coordonnees;joueur:T_couleur;e: T_echiquier; var coordPriseEnPassant:coordonnees;var priseEnPassantPossible: boolean);
function priseEnPassantRealise(priseEnPassantPossible: boolean; coordD,coordA,coordPriseEnPassant: coordonnees;joueur:T_couleur; e:T_echiquier):boolean;
function priseEnPassant (e: T_echiquier;joueur:T_couleur;coordD, coordA: Coordonnees): T_echiquier;

Implementation

//ROQUE

procedure roquePossible (e: T_echiquier; var petitRoqueBlancPossible,petitRoqueNoirPossible,grandRoqueBlancPossible,grandRoqueNoirPossible: Boolean);

begin;
if ((e[8][1].pion<>'t') or (e[5][1].pion<>'k')) then petitRoqueBlancPossible:=false;
if ((e[1][1].pion<>'t') or (e[5][1].pion<>'k')) then grandRoqueBlancPossible:=false;
if ((e[8][8].pion<>'T') or (e[5][8].pion<>'K')) then petitRoqueNoirPossible:=false;
if ((e[1][8].pion<>'T') or (e[5][8].pion<>'K')) then grandRoqueNoirPossible:=false;
end;


procedure roque (joueur:T_couleur;petitRoqueBlancPossible,petitRoqueNoirPossible,grandRoqueBlancPossible,grandRoqueNoirPossible: Boolean; var e: T_echiquier;var aJoue:boolean);

var k:Tkeyevent;
var touche:String;
var y: Integer;

begin;

//1)roques du joueur blanc
if (joueur=blanc) then
begin
//a)petit
if ((petitRoqueBlancPossible) and (e[6][1].pion=' ') and (e[7][1].pion=' ')and (aJoue=false)) then
begin
gotoxy(22,5);
writeln('Voulez vous faire un petit roque ?');
gotoxy(22,6);
writeln('-Oui');
gotoxy(22,7);
writeln('-Non');
y:=6;
gotoxy(22,y);
InitKeyboard();
	repeat
		K := GetKeyEvent();
		K := TranslateKeyEvent(K);
		touche := KeyEventToString(K);
		if (touche = 'Up')and (y>6) then y:=y-1;
		if (touche = 'Down') and (y<7) then y:=y+1;
		gotoxy(22,y);
		
	until touche = ' ';
if y=6 then
	begin
e[6][1].pion:='t';
e[7][1].pion:='k';
e[8][1].pion:=' ';
e[5][1].pion:=' ';
e[6][1].c:=blanc;
e[7][1].c:=blanc;
e[8][1].c:=neutre;
e[5][1].c:=neutre;
aJoue:=true;
	end;
end;
//b)grand
if ((grandRoqueBlancPossible) and (e[2][1].pion=' ') and (e[3][1].pion=' ') and (e[4][1].pion=' ') and (aJoue=false)) then
begin
gotoxy(22,5);
writeln('Voulez vous faire un grand roque ?');
gotoxy(22,6);
writeln('-Oui');
gotoxy(22,7);
writeln('-Non');
y:=6;
gotoxy(22,y);
InitKeyboard();
	repeat
		K := GetKeyEvent();
		K := TranslateKeyEvent(K);
		touche := KeyEventToString(K);
		if (touche = 'Up')and (y>6) then y:=y-1;
		if (touche = 'Down') and (y<7) then y:=y+1;
		gotoxy(22,y);
		
	until touche = ' ';
if y=6 then
	begin
e[4][1].pion:='t';
e[3][1].pion:='k';
e[1][1].pion:=' ';
e[5][1].pion:=' ';
e[4][1].c:=blanc;
e[3][1].c:=blanc;
e[1][1].c:=neutre;
e[5][1].c:=neutre;
aJoue:=true;
	end;
end;
end;
//2)roques du joueur noir
if (joueur=noir) then
begin
//a)petit
if ((petitRoqueNoirPossible) and (e[6][8].pion=' ') and (e[7][8].pion=' ')and (aJoue=false)) then
begin
gotoxy(22,5);
writeln('Voulez vous faire un petit roque ?');
gotoxy(22,6);
writeln('-Oui');
gotoxy(22,7);
writeln('-Non');
y:=6;
gotoxy(22,y);
InitKeyboard();
	repeat
		K := GetKeyEvent();
		K := TranslateKeyEvent(K);
		touche := KeyEventToString(K);
		if (touche = 'Up')and (y>6) then y:=y-1;
		if (touche = 'Down') and (y<7) then y:=y+1;
		gotoxy(22,y);
		
	until touche = ' ';
if y=6 then
	begin
e[6][8].pion:='T';
e[7][8].pion:='K';
e[8][8].pion:=' ';
e[5][8].pion:=' ';
e[6][8].c:=noir;
e[7][8].c:=noir;
e[8][8].c:=neutre;
e[5][8].c:=neutre;
aJoue:=true;
	end;
end;
//b)grand
if ((grandRoqueNoirPossible) and (e[2][8].pion=' ') and (e[3][8].pion=' ') and (e[4][8].pion=' ') and (aJoue=false)) then
begin
gotoxy(22,5);
writeln('Voulez vous faire un grand roque ?');
gotoxy(22,6);
writeln('-Oui');
gotoxy(22,7);
writeln('-Non');
y:=6;
gotoxy(22,y);
InitKeyboard();
	repeat
		K := GetKeyEvent();
		K := TranslateKeyEvent(K);
		touche := KeyEventToString(K);
		if (touche = 'Up')and (y>6) then y:=y-1;
		if (touche = 'Down') and (y<7) then y:=y+1;
		gotoxy(22,y);
		
	until touche = ' ';
if y=6 then
	begin
e[4][8].pion:='T';
e[3][8].pion:='K';
e[1][8].pion:=' ';
e[5][8].pion:=' ';
e[4][8].c:=noir;
e[3][8].c:=noir;
e[1][8].c:=neutre;
e[5][8].c:=neutre;
aJoue:=true;
	end;
end;
end;
end;

//PROMOTION

procedure promotion (coordA: coordonnees;joueur:T_couleur; var e: T_echiquier);

var k:Tkeyevent;
var touche:String;
var y: Integer;
var b:String;

begin
if ((coordA.y=1) and (joueur=noir) and (e[coordA.x][coordA.y].pion='P')) or ((coordA.y=8) and (joueur=blanc) and (e[coordA.x][coordA.y].pion='p')) then
	begin

ClrScr;
writeln('La promotion - Par quoi remplacer votre pion ?');
writeln('1-Dame');
writeln('2-Tour');
writeln('3-Fou');
writeln('4-Cavalier');
y:=2;
gotoxy(1,y);
InitKeyboard();
	repeat
		K := GetKeyEvent();
		K := TranslateKeyEvent(K);
		touche := KeyEventToString(K);
		if (touche = 'Up')and (y>2) then y:=y-1;
		if (touche = 'Down') and (y<5) then y:=y+1;
		gotoxy(1,y);
		
	until touche = ' ';
	
if(y=2) and (joueur=noir) then b:='Q';
if(y=3) and (joueur=noir) then b:='T';
if(y=4) and (joueur=noir) then b:='F';
if(y=5) and (joueur=noir) then b:='C';

if(y=2) and (joueur=blanc) then b:='q';
if(y=3) and (joueur=blanc) then b:='t';
if(y=4) and (joueur=blanc) then b:='f';
if(y=5) and (joueur=blanc) then b:='c';
e[coordA.x][coordA.y].c:=joueur;
e[coordA.x][coordA.y].pion:=b;
	end;
end;

//PRISE EN PASSANT

//prise en passant possible et case ou elle peut se faire

procedure priseEnPassantRealisable (coordD, coordA: coordonnees;joueur:T_couleur;e: T_echiquier; var coordPriseEnPassant:coordonnees;var priseEnPassantPossible: boolean);

begin
priseEnPassantPossible:=false;
if (((e[coordA.x][coordA.y].pion='p') or (e[coordA.x][coordA.y].pion='P'))and((coordA.y=coordD.y+2) or (coordA.y=coordD.y-2))) then
begin
priseEnPassantPossible:=true;
coordPriseEnPassant.x:=coordD.x;

if joueur=noir then
coordPriseEnPassant.y:=coordD.y+1;

if joueur=blanc then
coordPriseEnPassant.y:=coordD.y-1;
end;
end;

//prise en passant realise

function priseEnPassantRealise(priseEnPassantPossible: boolean; coordD,coordA,coordPriseEnPassant: coordonnees;joueur:T_couleur; e:T_echiquier):boolean;

begin
priseEnPassantRealise:=false;
if ((priseEnPassantPossible) and (coordPriseEnPassant.x=coordA.x) and (coordPriseEnPassant.y=coordA.y)) then
	begin
	//realise par le joueur noir
		if joueur=noir then
			begin
				if ((e[coordD.x][coordD.y].pion='P') and (coordD.y=coordPriseEnPassant.y+1) and ((coordD.x=coordPriseEnPassant.x+1)or(coordD.x=coordPriseEnPassant.x-1))) then 
					begin
						priseEnPassantRealise:=true;
						
					end;
			end;
	//realise par le joueur blanc
		if joueur=blanc then
			begin
if ((e[coordD.x][coordD.y].pion='p') and (coordD.y=coordPriseEnPassant.y-1) and ((coordD.x=coordPriseEnPassant.x+1)or(coordD.x=coordPriseEnPassant.x-1))) then 
					begin
						priseEnPassantRealise:=true;
						
					end;
			end;
	end;
end;

//prise en passant

function priseEnPassant (e: T_echiquier;joueur:T_couleur;coordD, coordA: Coordonnees): T_echiquier;

var a:String;
var b:T_couleur;

begin
//deplacementpion
a:=e[coordD.x][coordD.y].pion;
e[coordA.x][coordA.y].pion:=a;
e[coordD.x][coordD.y].pion:=' ';
if joueur=noir then e[coordA.x][coordA.y+1].pion:=' ';
if joueur=blanc then e[coordA.x][coordA.y-1].pion:=' ';

//deplacement couleurs
b:=e[coordD.x][coordD.y].c;
e[coordA.x][coordA.y].c:=b;
e[coordD.x][coordD.y].c:=neutre;
if joueur=noir then e[coordA.x][coordA.y+1].c:=neutre;
if joueur=blanc then e[coordA.x][coordA.y-1].c:=neutre;

priseEnPassant:=e;
end;


end.

