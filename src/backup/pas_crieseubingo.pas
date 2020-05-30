unit pas_crieseubingo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, ExtDlgs, pas_previewS;

type

  { TmainS }

  TmainS = class(TForm)
    act: TButton;
    actlg: TButton;
    backS: TImage;
    lg: TImage;
    openlg: TOpenPictureDialog;
    procedure actClick(Sender: TObject);
    procedure actlgClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  mainS: TmainS;

implementation

{$R *.lfm}

{ TmainS }

procedure TmainS.actlgClick(Sender: TObject);
begin
  try
    openlg.Execute;
    lg.Picture.LoadFromFile(openlg.FileName);
  except

  end;
end;

procedure TmainS.FormCreate(Sender: TObject);
begin

end;

procedure TmainS.actClick(Sender: TObject);
begin
  lg.Picture.SaveToFile(ExtractFileDir(GetCurrentDir) + 'img_lg.png');
  previewS.show;
end;

end.

