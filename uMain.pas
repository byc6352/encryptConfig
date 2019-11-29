unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,shlobj,shellapi,FileCtrl,
  aes,uZip,uConfig;

type
  TfMain = class(TForm)
    Panel1: TPanel;
    btnSelectDir: TButton;
    btnClose: TButton;
    btnEncrypt: TButton;
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    editConfigDir: TEdit;
    GroupBox2: TGroupBox;
    memoInfo: TMemo;
    procedure btnSelectDirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEncryptClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
    mRootDir:string; //D:\works\delphi\phone\myphone\Win32\Debug\Config\showphone\config
    configdir,configfile,encryptfile: string; // 用户选定后的目录
  public
    { Public declarations }
  end;

var
  fMain: TfMain;

implementation

{$R *.dfm}

procedure TfMain.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfMain.btnEncryptClick(Sender: TObject);
begin
  configfile:= configdir+'\'+uconfig.CONFIG_FILE;
  encryptfile:= extractfiledir(configdir)+'\'+uconfig.CRYPTED_FILE;
  uzip.DirectoryCompression(configdir,configfile);
  memoInfo.Lines.Add('压缩完成：'+configfile);
  aes.EncryptFile(configfile,encryptfile,CONFIG_KEY);
  memoInfo.Lines.Add('加密完成：'+encryptfile);
  ShellExecute(Handle,pchar('open'), pchar('explorer.exe'), pchar('/select,'+encryptfile), nil, SW_SHOW);
end;

procedure TfMain.btnSelectDirClick(Sender: TObject);

begin
  configdir := editConfigDir.Text;
  if (SelectDirectory('请选择要加密的文件目录', mRootDir, configdir)) then
  begin
    editConfigDir.Text := configdir;
  end;
end;

procedure TfMain.FormShow(Sender: TObject);
begin
  mRootDir:='';
end;

end.
