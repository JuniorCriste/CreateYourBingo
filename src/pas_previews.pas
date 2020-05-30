unit pas_previewS;

{$mode objfpc}{$H+}

interface


uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TpreviewS }

  TpreviewS = class(TForm)
    b: TImage;
    i: TImage;
    n: TImage;
    g: TImage;
    o: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  previewS: TpreviewS;        
  rock: array[1..99] of integer;
  procedure defBingo;

implementation

{$R *.lfm}

{ TpreviewS }


procedure defNmb();
var
  i, j: integer;
 rockAUX:  array[1..99] of integer;
  begin
    for i := 1 to 99 do
    begin
    randomize;
    rock[i] := random(75)
    end;
  end;

 procedure defBingo();
var
objN: TPanel;
objI: TImage;
adrss: string;
countN, posiX, posiY, i: integer;
begin
 posiX := 20;
 posiY := 70;
 i:= 1;
  for countN := 2 to 26 do
  begin
  if countN <> 14 then
  begin
  objN := TPanel.create(previewS);
  objN.parent := previewS;
  objN.name := 'obj' + IntToStr(countN - 1);
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
   objI := TImage.create(previewS);
   objI.parent := previewS;
   objI.name := 'imgLG';
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

 procedure TpreviewS.FormShow(Sender: TObject);
 begin   
  defNmb;
  defBingo;
 end;

end.

