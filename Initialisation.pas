unit Initialisation;

interface

uses Crt;



Type T_couleur=(blanc,noir,neutre);

Type CaseEchiquier= Record
pion : String;
c: T_couleur;
end;

Type T_echiquier=array [1..8,1..8] of CaseEchiquier;

procedure InitialisationEchiquier(var e: T_echiquier);
procedure Affichage(e: T_echiquier);

implementation

procedure InitialisationEchiquier(var e: T_echiquier);

var i, j: Integer;

begin
//Initialisation Camp blanc
e[1][1].pion:='t';
e[2][1].pion:='c';
e[3][1].pion:='f';
e[4][1].pion:='q';
e[5][1].pion:='k';
e[6][1].pion:='f';
e[7][1].pion:='c';
e[8][1].pion:='t';
for i :=1 to 8 do
e[i][2].pion:='p';

//initialisation Milieu

for i:=3 to 6 do
	begin
		for j:=1 to 8 do
		e[j][i].pion:=' ';
		
	end;
//Initialisation Camp Noir
e[1][8].pion:='T';
e[2][8].pion:='C';
e[3][8].pion:='F';
e[4][8].pion:='Q';
e[5][8].pion:='K';
e[6][8].pion:='F';
e[7][8].pion:='C';
e[8][8].pion:='T';
for i :=1 to 8 do
e[i][7].pion:='P';

//Initialisation couleur blanche

for i:=1 to 8 do
e[i][1].c:=blanc;
for i:=1 to 8 do
e[i][2].c:=blanc;

//Initialisation couleur Neutre

for i:=3 to 6 do
	begin
		for j:=1 to 8 do
		e[j][i].c:=neutre;
	end;

//Initialisation couleur noir

for i:=1 to 8 do
e[i][7].c:=noir;
for i:=1 to 8 do
e[i][8].c:=noir;

end;

procedure Affichage(e: T_echiquier);
var i,j : Integer;


begin


TextColor(4);
writeln('*-----------------*');
writeln('| |a|b|c|d|e|f|g|h|');
for i:=1 to 8 do
begin
	write('|',i,'|');
	for j:=1 to 8 do
		begin
			if e[j][i].c=noir then TextColor(1) else TextColor(3);
			if ((j mod 2 =0) and (i mod 2=1))or((i mod 2 =0) and (j mod 2=1)) then TextBackground(15) else TextBackground(0);
			write(e[j][i].pion);
			TextColor(13);
			TextBackground(0);
			write('|');
			TextColor(4);
		end;
	writeln();
end;
writeln('*-----------------*');
TextColor(15);
end;


end.
