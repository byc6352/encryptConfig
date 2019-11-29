program encryptConfig;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {fMain},
  AES in 'AES.pas',
  uConfig in 'uConfig.pas',
  uZip in 'uZip.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfMain, fMain);
  Application.Run;
end.
