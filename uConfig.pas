unit uConfig;

interface
uses
  Vcl.Forms,System.SysUtils,windows;
const
  APP_NAME='�Ա�Զ��Э���ֻ�ϵͳ(���ù���)';
  APP_VERSION='1.00';
  WORK_DIR:string='config'; //_DIR:string='setphone';
  LOG_NAME:string='configLog.txt';
  CONFIG_FILE:string='config.dat'; //�����ļ�
  CRYPTED_FILE:string='config_en.dat'; //�����ļ�
  CONFIG_KEY:ansiString='154.221.19.215';

var
  workdir:string;//����Ŀ¼
  isInit:boolean=false;
  procedure init();

implementation
procedure init();
var
    me:String;
begin
  isInit:=true;
  me:=application.ExeName;
  workdir:=extractfiledir(me)+'\'+WORK_DIR;
  if(not DirectoryExists(workdir))then ForceDirectories(workdir);

end;

begin
  init();
end.