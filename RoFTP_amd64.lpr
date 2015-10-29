program RoFTP_amd64;

{$mode objfpc}{$H+}

uses
  {$DEFINE UseCThreads}
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, unit1client, about, pl_indycomp, rx, dbflaz, sdflaz, layout, connlist
  { you can add units after this };

{$R *.res}

begin
  Application.Title:='fast RoFTP';
  RequireDerivedFormResource := True;
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm_srv, Form_srv);
  Application.Run;
end.
