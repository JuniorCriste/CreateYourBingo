unit pas_previewS;

{$mode objfpc}{$H+}

interface


uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type

  { TpreviewS }

  TpreviewS = class(TForm)
    b: TImage;
    i: TImage;
    n: TImage;
    g: TImage;
    o: TImage;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  previewS: TpreviewS;
  i, universal, ac: integer;
  rock: array of integer;
  rockAux: array of integer;
  procedure defBingo;

implementation

{$R *.lfm}

{ TpreviewS }


procedure defNmb();
var
  j: integer;
begin
 j:= 1;

 for i:= 1 to universal do
 begin
 rock[i] := random(universal) + 1;

 for j := 1 to universal do
 begin

 if rock[i] = rockAux[j] then
  begin
  repeat
  rock[i] := random(universal) + 1;

  until rock[i] <> rock[j];
 end;
 end;
 rockAux[i] := rock[i];
 end;

 end;

 procedure defBingo();
var
objN: TPanel;
objI: TImage;
adrss: string;
countN, posiX, posiY: integer;
begin
 posiX := 20;
 posiY := 70;
 i:= 1;
  for countN := 2 to 26 do
  begin
  if countN <> 14 then
  begin
  ac := ac + 1;
  objN := TPanel.create(previewS);
  objN.parent := previewS;
  objN.name := 'obj' + IntToStr(ac);
  objN.left := posiX;
  objN.top := posiY;
  objN.width := 100;
  objN.height := 100;
  objN.caption := IntToStr(rock[i]);
  objN.Font.Size:= 30;
  objN.color := clCream;
  posiX := posiX  + 110;
  i := i + 1;

   if (countN mod 5 = 1) then
   begin
     posiY := posiY + 110;
     posiX := 20;
   end;
   end;

  if countN = 14 then
   begin
   ac := ac + 1;
   objI := TImage.create(previewS);
   objI.parent := previewS;
   objI.name := 'imgLG' + IntToStr(ac);
   objI.left := posiX;
   objI.top := posiY;
   objI.width := 100;
   objI.height := 100;
   posiX := posiX  + 110;
   adrss := ExtractFileDir(GetCurrentDir);
   objI.Picture.LoadFromFile(adrss + '/img_lg.png');
   objI.visible:= true;
   objI.proportional:= true;
   objI.center:= true;

   end;


  end;


end;

 procedure TpreviewS.FormCreate(Sender: TObject);
 begin

 end;

procedure TpreviewS.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin

end;

 procedure zera();
 begin
  for i := 1 to 75 do
  begin
  rock[i] := 0;
  rockAux[i] := 0;
  end;

 end;

 procedure TpreviewS.FormShow(Sender: TObject);
 begin 
  universal := 75;
  zera;
  randomize;
  defNmb;
  defBingo;
 end;

end.

