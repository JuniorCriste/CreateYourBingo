program crieseubingo;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, pas_crieseubingo, pas_previewS
  { you can add units after this };

{$R *.res}

begin
  Application.Title:='Crie Seu Bingo';
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(TmainS, mainS);
  Application.CreateForm(TpreviewS, previewS);
  Application.Run;
end.

