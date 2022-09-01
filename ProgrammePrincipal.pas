program ProgrammePrincipal;

uses Initialisation, Jeu, Verification, Crt, Sauvegarde, complement, Keyboard, MiseEnEchec;

var e: T_echiquier;
var coordD, coordA, coordPriseEnPassant, coordR: Coordonnees;
var joueur: T_couleur;
var valide1,valide2: boolean;
var x,y: Integer;
var aJoue:Boolean;
var priseEnPassantPossible: boolean;
var priseEnPassantEnCours: boolean;
var newGame, fin, misEnEchec :boolean;
var coups: Integer;

begin
repeat
begin
//Initialisation des variables
ClrScr;
joueur:=noir;
coordD.x:=0;
coordD.y:=0;
coordA.x:=0;
coordA.y:=0;
petitRoqueBlancPossible:=true;
petitRoqueNoirPossible:=true;
grandRoqueBlancPossible:=true;
grandRoqueNoirPossible:=true;
coups:=0;
newGame:=nouvellePartie ();
ClrScr;

//Choix entre faire une nouvelle partie ou continuer la partie précédente 


if newGame=true then InitialisationEchiquier(e) else initialisationSauvegarde(e,joueur,petitRoqueBlancPossible,petitRoqueNoirPossible,grandRoqueBlancPossible,grandRoqueNoirPossible,coups);
Affichage(e);


//JEU
repeat


//Début du tour du joueur
joueur:=couleurJoueur(joueur);
if joueur=blanc then coups:=coups+1;
TextColor(7);
roquePossible (e,petitRoqueBlancPossible,petitRoqueNoirPossible,grandRoqueBlancPossible,grandRoqueNoirPossible);
priseEnPassantRealisable (coordD, coordA,joueur,e,coordPriseEnPassant,priseEnPassantPossible);
writeln('C''est au joueur ',joueur,' de jouer');

//Affichage de la mise en echec
writeln();
coordonneesDuRoi (e,joueur,coordR);
misEnEchec:=testMiseEnEchec(e, joueur,coordR);
if misEnEchec then writeln('/!\ Vous etes mis en echec');


	repeat
		begin
		
		//Si le joueur peut et fait un roque:
		aJoue:=false;
		roque(joueur,petitRoqueBlancPossible,petitRoqueNoirPossible,grandRoqueBlancPossible,grandRoqueNoirPossible,e,aJoue);
		if aJoue=true then
			begin
		valide2:=true;
		valide1:=true;
			end;
		//Sinon	
		if Ajoue=false then
		//le joueur choisit son deplacement
			begin
		saisirDepart (e,joueur,coordD, coordA, x, y);
		saisirArrivee (e,joueur,x,y,coordD, coordA);
		priseEnPassantEncours:=priseEnPassantRealise(priseEnPassantPossible,coordD,coordA,coordPriseEnPassant,joueur,e);
			//Le joueur peut faire une prise en passant
				if priseEnPassantEnCours then
					begin
					valide2:=true;
					valide1:=true;
					aJoue:=true;
					end;
			//Sinon on vérifie si son déplacement est valide
				if priseEnPassantEnCours=false then
					begin
					valide2:=deplacementValide(e,joueur,coordD,coordA);
					valide1:=trajectoireLibre(e,coordD,coordA);
					end;
			end;
		end;
	until (valide1) and (valide2);
//Déplacement du pion avec respect des options	
if priseEnPassantEnCours then e:=priseEnPassant (e,joueur,coordD, coordA) ;
if aJoue=false then e:=deplacementPiece(e,coordD, coordA);
promotion (coordA,joueur,e);

sauvegardeEchiquier(e,joueur,petitRoqueBlancPossible,petitRoqueNoirPossible,grandRoqueBlancPossible,grandRoqueNoirPossible,coups);



//Nouvel affichage
ClrScr;
Affichage(e);
coordonneesDuRoi (e,joueur,coordR);
misEnEchec:=testMiseEnEchec(e, joueur,coordR);

until misEnEchec;
//Victoire
if misEnEchec then joueur:=couleurJoueur(joueur);
writeln('Bravo, victoire du joueur ',joueur,' en ', coups,' coups !');
//Remise à zero de la sauvegarde
joueur:=noir;
coordD.x:=0;
coordD.y:=0;
coordA.x:=0;
coordA.y:=0;
petitRoqueBlancPossible:=true;
petitRoqueNoirPossible:=true;
grandRoqueBlancPossible:=true;
grandRoqueNoirPossible:=true;
InitialisationEchiquier(e);
sauvegardeEchiquier(e,joueur,petitRoqueBlancPossible,petitRoqueNoirPossible,grandRoqueBlancPossible,grandRoqueNoirPossible,coups );

delay(10000);

ClrScr;
fin:=finDePartie;

end;
until not fin;



end.

