unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, dbf, FileUtil, IdFTPServer, Forms, Controls, Graphics,
  Dialogs, StdCtrls, ComCtrls, DBGrids, DbCtrls, Buttons, ExtCtrls,
  IdCustomTCPServer, IdContext, IdFTP, IdReply, IdServerInterceptLogFile,
  IdFTPListOutput, IdFTPList, IdCommandHandlers, IdCompressorZLib, db;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    dbfuser: TDbf;
    DBGrid1: TDBGrid;
    dsuser: TDatasource;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    IdCompressorZLib1: TIdCompressorZLib;
    IdFTPServer1: TIdFTPServer;
    IdServerInterceptLogFile1: TIdServerInterceptLogFile;
    Image1: TImage;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Memo1: TMemo;
    PageControl1: TPageControl;
    SelectDirectoryDialog1: TSelectDirectoryDialog;
    SpeedButton1: TSpeedButton;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure IdFTP1Connected(Sender: TObject);
    procedure IdFTPServer1AfterBind(Sender: TObject);
    procedure IdFTPServer1AfterUserLogin(ASender: TIdFTPServerContext);
    procedure IdFTPServer1ChangeDirectory(ASender: TIdFTPServerContext;
      var VDirectory: TIdFTPFileName);
    procedure IdFTPServer1ClientID(ASender: TIdFTPServerContext;
      const AID: String);
    procedure IdFTPServer1CommandHandlers0Command(ASender: TIdCommand);
    procedure IdFTPServer1Connect(AContext: TIdContext);
    procedure IdFTPServer1DeleteFile(ASender: TIdFTPServerContext;
      const APathName: TIdFTPFileName);
    procedure IdFTPServer1GetFileSize(ASender: TIdFTPServerContext;
      const AFilename: TIdFTPFileName; var VFileSize: Int64);
    procedure IdFTPServer1Greeting(ASender: TIdFTPServerContext;
      AGreeting: TIdReply);
    procedure IdFTPServer1ListDirectory(ASender: TIdFTPServerContext;
      const APath: TIdFTPFileName; ADirectoryListing: TIdFTPListOutput;
      const ACmd: String; const ASwitches: String);
    procedure IdFTPServer1MakeDirectory(ASender: TIdFTPServerContext;
      var VDirectory: TIdFTPFileName);
    procedure IdFTPServer1RemoveDirectory(ASender: TIdFTPServerContext;
      var VDirectory: TIdFTPFileName);
    procedure IdFTPServer1RenameFile(ASender: TIdFTPServerContext;
      const ARenameFromFile, ARenameToFile: TIdFTPFileName);
    procedure IdFTPServer1RetrieveFile(ASender: TIdFTPServerContext;
      const AFileName: TIdFTPFileName; var VStream: TStream);
    procedure IdFTPServer1StoreFile(ASender: TIdFTPServerContext;
      const AFileName: TIdFTPFileName; AAppend: Boolean; var VStream: TStream);
    procedure IdFTPServer1UserAccount(ASender: TIdFTPServerContext;
      const AUsername, APassword, AAcount: string; var AAuthenticated: Boolean);
    procedure IdFTPServer1UserLogin(ASender: TIdFTPServerContext;
      const AUsername, APassword: string; var AAuthenticated: Boolean);
    procedure Label10Click(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { private declarations }
    function TransLatePath( const APathname, homeDir: string ) : string;
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation
uses inifiles, LCLIntf;
{$R *.lfm}

{ TForm1 }

function StartsWith( const str, substr: string ) : boolean;

begin

  result := copy( str, 1, length( substr ) ) = substr;

end;



function BackSlashToSlash( const str: string ) : string;

var

  a: dword;

begin

  result := str;

  for a := 1 to length( result ) do

    if result[a] = '\' then

      result[a] := '/';

end;



function SlashToBackSlash( const str: string ) : string;

var

  a: dword;

begin

  result := str;

  for a := 1 to length( result ) do

    if result[a] = '/' then

      result[a] := '\';

end;



function TForm1.TransLatePath( const APathname, homeDir: string ) : string;

var

  tmppath: string;

begin

  result := SlashToBackSlash( homeDir ) ;

  tmppath := SlashToBackSlash( APathname ) ;

  if homedir = '/' then

  begin

    result := tmppath;

    exit;

  end;



  if length( APathname ) = 0 then

    exit;

  if result[length( result ) ] = '\' then

    result := copy( result, 1, length( result ) - 1 ) ;

  if tmppath[1] <> '\' then

    result := result + '\';

  result := result + tmppath;

end;



function GetSizeOfFile( const APathname: string ) : int64;

begin

  result := FileSize( APathname ) ;

end;



function GetNewDirectory( old, action: string ) : string;

var

  a: integer;

begin

  if (action = '../') or (action = '..') then

  begin

    if old = '/' then

    begin

      result := old;

      exit;

    end;

    a := length( old ) - 1;

    while ( old[a] <> '\' ) and ( old[a] <> '/' ) do

      dec( a ) ;

    result := copy( old, 1, a ) ;

    exit;

  end;


  if ( action[1] = '/' ) or ( action[1] = '\' ) then

    result := action

  else

    result := old + action;

end;






procedure TForm1.IdFTPServer1Connect(AContext: TIdContext);
begin

end;

procedure TForm1.IdFTPServer1DeleteFile(ASender: TIdFTPServerContext;
  const APathName: TIdFTPFileName);
begin
  DeleteFile( pchar( TransLatePath( ASender.CurrentDir + '/' + APathname, ASender.HomeDir ) ) ) ;
end;

procedure TForm1.IdFTPServer1GetFileSize(ASender: TIdFTPServerContext;
  const AFilename: TIdFTPFileName; var VFileSize: Int64);
begin
   VFileSize := GetSizeOfFile( TransLatePath( AFilename, ASender.HomeDir ) ) ;
end;

procedure TForm1.IdFTPServer1Greeting(ASender: TIdFTPServerContext;
  AGreeting: TIdReply);
begin

end;

procedure TForm1.IdFTPServer1ListDirectory(ASender: TIdFTPServerContext;
  const APath: TIdFTPFileName; ADirectoryListing: TIdFTPListOutput;
  const ACmd: String; const ASwitches: String);

  procedure AddlistItem( aDirectoryListing: TIdFTPListOutput; Filename: string; ItemType: TIdDirItemType; size: int64; date: tdatetime ) ;

    var

      listitem: TIdFTPListItem;

    begin

      listitem:=TIdFTPListItem.Create(nil);
      listitem := aDirectoryListing.Add;

      listitem.ItemType := ItemType;

      listitem.FileName := Filename;

//      listitem.OwnerName := 'anonymous';

//      listitem.GroupName := 'all';

//      listitem.OwnerPermissions := '---';

//      listitem.GroupPermissions := '---';

//      listitem.UserPermissions := '---';

      listitem.Size := size;

      listitem.ModifiedDate := date;

    end;



  var

    f: tsearchrec;

    a: integer;

  begin

//    ADirectoryListing. := apath;
      ADirectoryListing.Output:=apath;


    a := FindFirst( TransLatePath( apath, ASender.HomeDir ) + '*.*', faAnyFile, f ) ;

    while ( a = 0 ) do

    begin

      if ( f.Attr and faDirectory > 0 ) then

        AddlistItem( ADirectoryListing, f.Name, ditDirectory, f.size, FileDateToDateTime( f.Time ) )

      else

        AddlistItem( ADirectoryListing, f.Name, ditFile, f.size, FileDateToDateTime( f.Time ) ) ;

      a := FindNext( f ) ;

    end;



    FindClose( f ) ;




end;

procedure TForm1.IdFTPServer1MakeDirectory(ASender: TIdFTPServerContext;
  var VDirectory: TIdFTPFileName);
begin
   MkDir( TransLatePath( VDirectory, ASender.HomeDir ) ) ;
end;

procedure TForm1.IdFTPServer1RemoveDirectory(ASender: TIdFTPServerContext;
  var VDirectory: TIdFTPFileName);
begin
  RmDir( TransLatePath( VDirectory, ASender.HomeDir ) ) ;
end;

procedure TForm1.IdFTPServer1RenameFile(ASender: TIdFTPServerContext;
  const ARenameFromFile, ARenameToFile: TIdFTPFileName);
begin
  if not RenameFile( pchar( TransLatePath( ARenameFromFile, ASender.HomeDir ) ) , pchar( TransLatePath( ARenameToFile, ASender.HomeDir ) ) ) then

  {$IFDEF FPC}

    RaiseLastOsError;

  {$ELSE}

    RaiseLastWin32Error;

  {$ENDIF}
end;

procedure TForm1.IdFTPServer1RetrieveFile(ASender: TIdFTPServerContext;
  const AFileName: TIdFTPFileName; var VStream: TStream);
begin
  VStream := TFileStream.create( translatepath( AFilename, ASender.HomeDir ) , fmopenread or fmShareDenyWrite ) ;
end;

procedure TForm1.IdFTPServer1StoreFile(ASender: TIdFTPServerContext;
  const AFileName: TIdFTPFileName; AAppend: Boolean; var VStream: TStream);
begin
   if FileExists( translatepath( AFilename, ASender.HomeDir ) ) and AAppend then

  begin

    VStream := TFileStream.create( translatepath( AFilename, ASender.HomeDir ) , fmOpenWrite or fmShareExclusive ) ;

    VStream.Seek( 0, soFromEnd ) ;

  end

  else

    VStream := TFileStream.create( translatepath( AFilename, ASender.HomeDir ) , fmCreate or fmShareExclusive ) ;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  memo1.Lines.Add(datetimetostr(now)+' - Arresto server...');
   idftpserver1.Active:=false;
   memo1.Lines.Add(datetimetostr(now)+' - Avvio server...');
   idftpserver1.Active:=true;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  memo1.Lines.Add(datetimetostr(now)+' - Arresto server...');
   idftpserver1.Active:=false;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if dbfuser.State in [dsedit, dsInsert] then dbfuser.Post;
end;

procedure TForm1.FormCreate(Sender: TObject);
var ini: Tinifile;
begin
  memo1.Lines.Add(datetimetostr(now)+' - Carico informazioni utenti');
  dbfuser.Close;
  dbfuser.TableName:='./dokuserveruser.dbf';
  dbfuser.Open;

  memo1.Lines.Add(datetimetostr(now)+' - Carico configurazione');
  ini:= TINIfile.Create(extractfilepath(application.ExeName)+'dokuserver.ini');
  idftpserver1.DefaultPort:=ini.ReadInteger('Server','Porta',8383);
  idftpserver1.DefaultDataPort:= idftpserver1.DefaultPort;
  memo1.Lines.Add(datetimetostr(now)+' - Avvio server...');
  Button1Click(sender);

end;

procedure TForm1.IdFTP1Connected(Sender: TObject);
begin
  memo1.Lines.Add(datetimetostr(now)+' - Client connesso');
end;

procedure TForm1.IdFTPServer1AfterBind(Sender: TObject);
begin
  memo1.Lines.Add(datetimetostr(now)+' - Server attivo sulla porta '+inttostr(idftpserver1.DefaultPort));
end;

procedure TForm1.IdFTPServer1AfterUserLogin(ASender: TIdFTPServerContext);
begin
    if asender.Authenticated then
    asender.HomeDir:=dbfuser.FieldByName('homedir').AsString;       //'./home/';
//    memo1.Lines.Add('Utente '+asender.Username+', impostata home su '+asender.HomeDir);
      memo1.Lines.Add(datetimetostr(now)+' - Connesso utente: '+asender.Username);
end;

procedure TForm1.IdFTPServer1ChangeDirectory(ASender: TIdFTPServerContext;
  var VDirectory: TIdFTPFileName);
begin
  VDirectory := GetNewDirectory( ASender.CurrentDir, VDirectory ) ;
  //if ASender.CurrentDir='/' then VDirectory:='/';
end;

procedure TForm1.IdFTPServer1ClientID(ASender: TIdFTPServerContext;
  const AID: String);
begin
  memo1.Lines.Add(datetimetostr(now)+' - ID client: '+AID);
end;

procedure TForm1.IdFTPServer1CommandHandlers0Command(ASender: TIdCommand);
begin
  ASender.Reply.Code:='700';
  ASender.Reply.Text.Add('candeldir='+dbfuser.FieldByName('candeldir').AsString);
  ASender.Reply.Text.Add('candelfile='+dbfuser.FieldByName('candelfile').AsString);
  ASender.Reply.Text.Add('cancreadir='+dbfuser.FieldByName('cancreadir').AsString);
  ASender.Reply.Text.Add('canupload='+dbfuser.FieldByName('canupload').AsString);
  ASender.Reply.Text.Add('candownl='+dbfuser.FieldByName('candownl').AsString);
  ASender.Reply.Text.Add('canchgdir='+dbfuser.FieldByName('canchgdir').AsString);


end;

procedure TForm1.IdFTPServer1UserAccount(ASender: TIdFTPServerContext;
  const AUsername, APassword, AAcount: string; var AAuthenticated: Boolean);
begin

end;

procedure TForm1.IdFTPServer1UserLogin(ASender: TIdFTPServerContext;
  const AUsername, APassword: string; var AAuthenticated: Boolean);
begin


       if (dbfuser.Locate('username',AUsername,[loCaseInsensitive])) and  (APassword = dbfuser.FieldByName('password').asstring)
       then AAuthenticated:=true else AAuthenticated:=false;
//    if (ausername<>'test') and (apassword<>'test') then aauthenticated := false else aauthenticated := true;
    if aauthenticated = true then memo1.Lines.Add(datetimetostr(now)+' - Utente: '+AUsername+' autenticato con successo') else memo1.Lines.Add(datetimetostr(now)+' - Utente: '+AUsername+' non autenticato');
end;

procedure TForm1.Label10Click(Sender: TObject);
begin
  OpenURL('http://www.fasttools.it');
end;

procedure TForm1.Label7Click(Sender: TObject);
begin
  OpenURL('http://www.rinorusso.it');
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  if selectdirectorydialog1.Execute then begin
    if dbfuser.State = dsBrowse then dbfuser.Edit;
     dbfuser.FieldByName('homedir').asstring:=selectdirectorydialog1.FileName;

  end;
end;

end.

