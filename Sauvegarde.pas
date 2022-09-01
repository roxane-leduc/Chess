unit Sauvegarde;

interface

uses Initialisation, Jeu, keyboard,complement, crt;

function nouvellePartie ():boolean;
procedure sauvegardeEchiquier(e: T_echiquier;joueur:T_couleur; petitRoqueBlancPossible,petitRoqueNoirPossible,grandRoqueBlancPossible,grandRoqueNoirPossible: boolean;coups:Integer);
procedure initialisationSauvegarde(var e: T_echiquier;var joueur:T_couleur;var petitRoqueBlancPossible,petitRoqueNoirPossible,grandRoqueBlancPossible,grandRoqueNoirPossible: Boolean; var coups:Integer);
function finDePartie ():boolean;

implementation

function nouvellePartie ():boolean;

var k:Tkeyevent;
var touche:String;
var y: Integer;

begin

writeln('Bienvenue dans notre jeu d''echec que souhaitez vous faire ?');
writeln('1-Nouvelle Partie');
writeln('2-Charger sauvegarde');

y:=2;
gotoxy(1,y);
InitKeyboard();
repeat
		K := GetKeyEvent();
		K := TranslateKeyEvent(K);
		touche := KeyEventToString(K);
		if (touche = 'Up')and (y>2) then y:=y-1;
		if (touche = 'Down') and (y<3) then y:=y+1;
		gotoxy(1,y);
		
	until touche = ' ';
if y=2 then nouvellePartie :=true else nouvellePartie :=false;

end;

function finDePartie ():boolean;

var k:Tkeyevent;
var touche:String;
var y: Integer;

begin

writeln('Voulez-vous continuer a jouer ?');
writeln('1-Oui');
writeln('2-Non');

y:=2;
gotoxy(1,y);
InitKeyboard();
repeat
		K := GetKeyEvent();
		K := TranslateKeyEvent(K);
		touche := KeyEventToString(K);
		if (touche = 'Up')and (y>2) then y:=y-1;
		if (touche = 'Down') and (y<3) then y:=y+1;
		gotoxy(1,y);
		
	until touche = ' ';
if y=2 then finDePartie:=true else finDePartie:=false;

end;

procedure sauvegardeEchiquier(e: T_echiquier;joueur:T_couleur; petitRoqueBlancPossible,petitRoqueNoirPossible,grandRoqueBlancPossible,grandRoqueNoirPossible: boolean;coups:Integer);

var f: Text;
var i,j: Integer;

begin
Assign(f,'sauvegarde.txt');
rewrite(f);
//sauvegarde de l'echiquier
for j:=1 to 8 do
	begin
		for i :=1 to 8 do
		writeln (f,e[i][j].pion);
	end;
//sauvegarde du joueur
if joueur=blanc then writeln (f,'blanc') else writeln (f,'noir');
//sauvegarde des roques
if petitRoqueBlancPossible then writeln(f,'possible') else writeln (f,'impossible');
if grandRoqueBlancPossible then writeln(f,'possible') else writeln (f,'impossible');
if petitRoqueNoirPossible then writeln(f,'possible') else writeln (f,'impossible');
if grandRoqueNoirPossible then writeln(f,'possible') else writeln (f,'impossible');
writeln(f,coups);
Close (f); 
 end;

procedure initialisationSauvegarde(var e: T_echiquier;var joueur:T_couleur;var petitRoqueBlancPossible,petitRoqueNoirPossible,grandRoqueBlancPossible,grandRoqueNoirPossible: Boolean; var coups:Integer);


var i,j : Integer;
var t :String;
var f: Text;
var a:integer;

begin
Assign (f,'sauvegarde.txt');
reset (f);
while not eof (f) do
begin
	for j:=1 to 8 do
	begin
		for i:=1 to 8 do
		begin
			readln (f,t);
			e[i][j].pion:=t;
			if t=' ' then e[i][j].c:=neutre;
			if ord(t[1])>=97 then e[i][j].c:=blanc;
			if (ord(t[1])<=90) and(ord(t[1])>=65) then e[i][j].c:=noir;
		end;
	end;
readln(f,t);
if t='blanc' then joueur:=blanc else joueur:=noir;
//application du roque
readln(f,t);
if t='impossible' then petitRoqueBlancPossible:=false;
readln(f,t);
if t='impossible' then grandRoqueBlancPossible:=false;
readln(f,t);
if t='impossible' then petitRoqueNoirPossible:=false;
readln(f,t);
if t='impossible' then grandRoqueNoirPossible:=false;
readln(f,a);
coups:=a;
end;
Close (f);
end;
end.
