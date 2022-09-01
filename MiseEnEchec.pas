unit MiseEnEchec;

Interface

uses Initialisation, Jeu, Verification, Crt;

function testMiseEnEchec(e: T_echiquier; joueur:T_couleur; coordR:Coordonnees):boolean;
procedure coordonneesDuRoi (e: T_echiquier; joueur:T_couleur; var coordR:Coordonnees);

Implementation

var 
i, j: Integer;

procedure coordonneesDuRoi (e: T_echiquier; joueur:T_couleur; var coordR:Coordonnees);

begin
//determination coordonnes du roi
	for i := 1 to 8 do
	begin
		for j := 1 to 8 do
		begin
			if (e[i][j].pion = 'k') and (joueur = blanc) then
			begin
			coordR.x := i;
			coordR.y := j;
			end;
			if (e[i][j].pion = 'K') and (joueur = noir) then
			begin
			coordR.x := i;
			coordR.y := j;
			end;
		end;
	end;
end;

function testMiseEnEchec(e: T_echiquier; joueur:T_couleur; coordR:Coordonnees):boolean;
var i,j:Integer;

begin
testMiseEnEchec:= false;

//MISE EN ECHEC PAR UN PION

if joueur=blanc then
begin
if ((e[coordR.x+1][coordR.y+1].pion='P') or (e[coordR.x-1][coordR.y+1].pion='P')) then testMiseEnEchec := True;
end;
if joueur=noir then
begin
if ((e[coordR.x+1][coordR.y-1].pion='p') or (e[coordR.x-1][coordR.y-1].pion='p')) then testMiseEnEchec := True;
end; 

//MISE EN ECHEC PAR UN CAVALIER

if joueur=blanc then
begin
		if ((coordR.x > 1) and (coordR.y > 2)) and (e[coordR.x-1][coordR.y-2].pion = 'C') then testMiseEnEchec := True;
		if ((coordR.x > 2) and (coordR.y > 1)) and (e[coordR.x-2][coordR.y-1].pion = 'C') then testMiseEnEchec := True;
		if ((coordR.x < 8) and (coordR.y > 2)) and (e[coordR.x+1][coordR.y-2].pion = 'C') then testMiseEnEchec := True;
		if ((coordR.x < 7) and (coordR.y > 1)) and (e[coordR.x+2][coordR.y-1].pion = 'C') then testMiseEnEchec := True;
		if ((coordR.x < 7) and (coordR.y < 8)) and (e[coordR.x+2][coordR.y+1].pion = 'C') then testMiseEnEchec := True;
		if ((coordR.x < 8) and (coordR.y < 7)) and (e[coordR.x+1][coordR.y+2].pion = 'C') then testMiseEnEchec := True;
		if ((coordR.x > 1) and (coordR.y < 7)) and (e[coordR.x-1][coordR.y+2].pion = 'C') then testMiseEnEchec := True;
		if ((coordR.x > 2) and (coordR.y < 8)) and (e[coordR.x-2][coordR.y+1].pion = 'C') then testMiseEnEchec := True;
end;
if joueur=noir then
begin
		if ((coordR.x > 1) and (coordR.y > 2)) and (e[coordR.x-1][coordR.y-2].pion = 'c') then testMiseEnEchec := True;
		if ((coordR.x > 2) and (coordR.y > 1)) and (e[coordR.x-2][coordR.y-1].pion = 'c') then testMiseEnEchec := True;
		if ((coordR.x < 8) and (coordR.y > 2)) and (e[coordR.x+1][coordR.y-2].pion = 'c') then testMiseEnEchec := True;
		if ((coordR.x < 7) and (coordR.y > 1)) and (e[coordR.x+2][coordR.y-1].pion = 'c') then testMiseEnEchec := True;
		if ((coordR.x < 7) and (coordR.y < 8)) and (e[coordR.x+2][coordR.y+1].pion = 'c') then testMiseEnEchec := True;
		if ((coordR.x < 8) and (coordR.y < 7)) and (e[coordR.x+1][coordR.y+2].pion = 'c') then testMiseEnEchec := True;
		if ((coordR.x > 1) and (coordR.y < 7)) and (e[coordR.x-1][coordR.y+2].pion = 'c') then testMiseEnEchec := True;
		if ((coordR.x > 2) and (coordR.y < 8)) and (e[coordR.x-2][coordR.y+1].pion = 'c') then testMiseEnEchec := True;
end;
//MISE EN ECHEC EN LIGNE DROITE Q+T
//Verif haut
i:=coordR.y-1;
while ((i>1) and (e[coordR.x][i].pion=' ')) do i:=i-1 ;
if i=0 then i:=1;
if ((joueur=blanc) and ((e[coordR.x][i].pion='Q') or (e[coordR.x][i].pion='T'))) then testMiseEnEchec := True;
if ((joueur=noir) and ((e[coordR.x][i].pion='q') or (e[coordR.x][i].pion='t'))) then testMiseEnEchec := True;

//Verif bas
i:=coordR.y+1;
while ((i<8) and (e[coordR.x][i].pion=' ')) do i:=i+1 ;
if i=9 then i:=8;
if ((joueur=blanc) and ((e[coordR.x][i].pion='Q') or (e[coordR.x][i].pion='T'))) then testMiseEnEchec := True;
if ((joueur=noir) and ((e[coordR.x][i].pion='q') or (e[coordR.x][i].pion='t'))) then testMiseEnEchec := True;

//Verif gauche
i:=coordR.x-1;
while ((i>1) and (e[i][coordR.y].pion=' ')) do i:=i-1;
if i=0 then i:=1;
if ((joueur=blanc) and ((e[i][coordR.y].pion='Q') or (e[i][coordR.y].pion='T'))) then testMiseEnEchec := True;
if ((joueur=noir) and ((e[i][coordR.y].pion='q') or (e[i][coordR.y].pion='t'))) then testMiseEnEchec := True;

//Verif droite
i:=coordR.x+1;
while ((i<8) and (e[i][coordR.y].pion=' ')) do i:=i+1;
if i=9 then i:=8;
if ((joueur=blanc) and ((e[i][coordR.y].pion='Q') or (e[i][coordR.y].pion='T'))) then testMiseEnEchec := True;
if ((joueur=noir) and ((e[i][coordR.y].pion='q') or (e[i][coordR.y].pion='t'))) then testMiseEnEchec := True;

//MISE EN ECHEC EN DIAGONALE Q+F

//bas droite
i:=coordR.x+1;
j:=coordR.y+1;
while ((i<8) and (j<8) and (e[i][j].pion=' ')) do 
begin
i:=i+1;
j:=j+1;
end;
if i=9 then i:=8;
if j=9 then j:=8;
if ((joueur=blanc) and ((e[i][j].pion='Q') or (e[i][j].pion='F'))) then testMiseEnEchec := True;
if ((joueur=noir) and ((e[i][j].pion='q') or (e[i][j].pion='f'))) then testMiseEnEchec := True;

//bas gauche
i:=coordR.x-1;
j:=coordR.y+1;
while ((i>1) and (j<8) and (e[i][j].pion=' ')) do 
begin
i:=i-1;
j:=j+1;
end;
if i=0 then i:=1;
if j=9 then j:=8;
if ((joueur=blanc) and ((e[i][j].pion='Q') or (e[i][j].pion='F'))) then testMiseEnEchec := True;
if ((joueur=noir) and ((e[i][j].pion='q') or (e[i][j].pion='f'))) then testMiseEnEchec := True;

//haut gauche
i:=coordR.x-1;
j:=coordR.y-1;
while ((i>1) and (j>1) and (e[i][j].pion=' ')) do 
begin
i:=i-1;
j:=j-1;
end;
if i=0 then i:=1;
if j=0 then j:=1;
if ((joueur=blanc) and ((e[i][j].pion='Q') or (e[i][j].pion='F'))) then testMiseEnEchec := True;
if ((joueur=noir) and ((e[i][j].pion='q') or (e[i][j].pion='f'))) then testMiseEnEchec := True;

//haut droite
i:=coordR.x+1;
j:=coordR.y-1;
while ((i<8) and (j>1) and (e[i][j].pion=' ')) do 
begin
i:=i+1;
j:=j-1;
end;
if i=9 then i:=8;
if j=0 then j:=1;
if ((joueur=blanc) and ((e[i][j].pion='Q') or (e[i][j].pion='F'))) then testMiseEnEchec := True;
if ((joueur=noir) and ((e[i][j].pion='q') or (e[i][j].pion='f'))) then testMiseEnEchec := True;
end;

end.
