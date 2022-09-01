unit Jeu;

Interface

uses Initialisation, Crt, keyboard;

Type Coordonnees = record
    x, y : Integer;
end;

function deplacementPiece(e: T_echiquier;coordD, coordA: Coordonnees):T_echiquier;
function couleurJoueur(joueur: T_couleur):T_couleur;
procedure saisirDepart (e: T_echiquier;joueur:T_couleur ;var coordD, coordA: Coordonnees ;var x,y:Integer);
procedure saisirArrivee (e: T_echiquier;joueur:T_couleur;x,y: Integer ; var coordD, coordA: Coordonnees);

Implementation


procedure saisirDepart (e: T_echiquier;joueur:T_couleur ; var coordD, coordA: Coordonnees; var x,y:integer);
var k:Tkeyevent;
var touche:String;

begin
InitKeyboard();
gotoxy(1,13);
writeln('Selectionnez avec les fleches et la touche espace la piece a bouger');
repeat
x:=10;
y:=6;
if joueur=noir then x:=12;
if joueur=noir then y:=7;
gotoxy(x,y);
	repeat
		K := GetKeyEvent();
		K := TranslateKeyEvent(K);
		touche := KeyEventToString(K);
		if (touche = 'Right')and (x<18) then x:=x+2;
		if (touche = 'Left') and (x>4) then x:=x-2;
		if (touche = 'Up')and (y>3) then y:=y-1;
		if (touche = 'Down') and (y<10) then y:=y+1;
		gotoxy(x,y);
		
	until touche = ' ';

coordD.x:=(x-2) div 2;
coordD.y:=y-2;
until (e[coordD.x][coordD.y].c=joueur);
end;

procedure saisirArrivee (e: T_echiquier;joueur:T_couleur;x,y: Integer ; var coordD, coordA: Coordonnees);
var k:Tkeyevent;
var touche:String;
begin
gotoxy(1,13);
writeln('Selectionnez avec les fleches et la touche espace la case d''arrivee');
gotoxy(x,y);
repeat
	repeat
		K := GetKeyEvent();
		K := TranslateKeyEvent(K);
		touche := KeyEventToString(K);
		if (touche = 'Right')and (x<18) then x:=x+2;
		if (touche = 'Left') and (x>4) then x:=x-2;
		if (touche = 'Up')and (y>3) then y:=y-1;
		if (touche = 'Down') and (y<10) then y:=y+1;
		gotoxy(x,y);
		
	until touche = ' ';

coordA.x:=(x-2) div 2;;
coordA.y:=y-2;
until (e[coordA.x][coordA.y].c<>joueur);
end;



function deplacementPiece(e: T_echiquier;coordD, coordA: Coordonnees): T_echiquier;

var a:String;
var b:T_couleur;

begin
//deplacement pion
a:=e[coordD.x][coordD.y].pion;
e[coordA.x][coordA.y].pion:=a;
e[coordD.x][coordD.y].pion:=' ';
//deplacement couleur
b:=e[coordD.x][coordD.y].c;
e[coordA.x][coordA.y].c:=b;
e[coordD.x][coordD.y].c:=neutre;
deplacementPiece:=e;
end;

function couleurJoueur(joueur: T_couleur):T_couleur;

begin
if joueur=blanc then joueur:=noir
else joueur:=blanc;
couleurJoueur:=joueur;
end;





end.
