program RoFTP;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms,
  { you can add units after this }
  unit1client, about, pl_indycomp, rx, sdflaz, layout, connlist;

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

