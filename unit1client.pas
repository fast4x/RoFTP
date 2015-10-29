unit unit1client;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, MRUList, IdLogEvent, IdFTP,
  Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, ComCtrls, Menus,
  ShellCtrls, Buttons, ButtonPanel, DBGrids, IdComponent, IdAntiFreeze, types,
  dbf, SdfData, db, BufDataset, IdFTPList, IdFTPCommon, IdCompressorZLib,
  IdCoderMIME, IdCoderXXE, IdServerInterceptLogFile;

type

  { TMainForm }

  TMainForm = class(TForm)
    Back2: TMenuItem;
    ComboConn: TComboBox;
    CommandPanel: TPanel;
    ConnectButton: TButton;
    CurrentDirEdit: TComboBox;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DebugListBox: TListBox;
    Delete2: TMenuItem;
    DirectoryListView: TListView;
    FileListView: TListView;
    FilePopupMenu: TPopupMenu;
    Downloadfile: TMenuItem;
    GroupBox1: TGroupBox;
    IdAntiFreeze1: TIdAntiFreeze;
    IdCompressorZLib1: TIdCompressorZLib;
    IdFTP1: TIdFTP;
    IdLogEvent1: TIdLogEvent;
    ImageList1: TImageList;
    Download1: TMenuItem;
    Delete1: TMenuItem;
    Back1: TMenuItem;
    largeImageList2: TImageList;
    Label2: TLabel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    MenuItem_pl: TMenuItem;
    Panel_updo: TPanel;
    Panel3: TPanel;
    Panel_status: TPanel;
    Popupconn: TPopupMenu;
    Popup_flocal: TPopupMenu;
    ProgressBar1: TProgressBar;
    chdirbutton: TSpeedButton;
    dbfiles: TSdfDataSet;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Splitter2: TSplitter;
    Splitter6: TSplitter;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton_con: TToolButton;
    ToolButton_de: TToolButton;
    ToolButton_pr: TToolButton;
    ToolButton_pl: TToolButton;
    usepassive: TMenuItem;
    tracecheckbox: TMenuItem;
    N2: TMenuItem;
    Panel_remoto: TPanel;
    Panel_locale: TPanel;
    Panel5: TPanel;
    ShellListView1: TShellListView;
    ShellTreeView1: TShellTreeView;
    Splitter1: TSplitter;
    Splitter3: TSplitter;
    Splitter4: TSplitter;
    Splitter5: TSplitter;
    Upload1: TMenuItem;
    N1: TMenuItem;
    DirectoryPopupMenu: TPopupMenu;
    SaveDialog1: TSaveDialog;
    Upload2: TMenuItem;
    UploadOpenDialog1: TOpenDialog;
    procedure AbortButtonClick(Sender: TObject);
    procedure BackButtonClick(Sender: TObject);
    procedure CmdUserRightsButtonClick(Sender: TObject);
    procedure ChDirButtonClick(Sender: TObject);
    procedure ConnectButtonClick(Sender: TObject);
    procedure CreateDirButtonClick(Sender: TObject);
    procedure CurrentDirEditKeyPress(Sender: TObject; var Key: char);
    procedure DebugListBoxDrawItem(Control: TWinControl; Index: Integer;
      ARect: TRect; State: TOwnerDrawState);
    procedure Delete2Click(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure DirectoryListBoxClick(Sender: TObject);
    procedure DirectoryListBoxDblClick(Sender: TObject);
    procedure DirectoryListBoxDrawItem(Control: TWinControl; Index: Integer;
      ARect: TRect; State: TOwnerDrawState);
    procedure DirectoryListViewDblClick(Sender: TObject);
    procedure Download1Click(Sender: TObject);
    procedure DownloadButtonClick(Sender: TObject);
    procedure DownloadfileClick(Sender: TObject);
    procedure FileListBoxDblClick(Sender: TObject);
    procedure FileListViewDblClick(Sender: TObject);
    procedure FileListViewDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure FileListViewDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure FileListViewStartDrag(Sender: TObject; var DragObject: TDragObject
      );
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDropFiles(Sender: TObject; const FileNames: array of String);
    procedure IdFTP1AfterClientLogin(Sender: TObject);
    procedure IdFTP1Disconnected(Sender: TObject);
    procedure IdFTP1Status(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: string);
    procedure IdFTP1Work(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure IdFTP1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure IdFTP1WorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure IdLogEvent1Received(ASender: TComponent; const AText,
      AData: string);
    procedure IdLogEvent1Sent(ASender: TComponent; const AText, AData: string);
    procedure Label3Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure MenuItem11Click(Sender: TObject);
    procedure MenuItem15Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
    procedure MenuItem_plClick(Sender: TObject);

    procedure Panel1Click(Sender: TObject);
    procedure ShellListView1Change(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure ShellListView1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ShellListView1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure ShellTreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure ShellTreeView1CustomDrawItem(Sender: TCustomTreeView;
      Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure SpeedButton3Click(Sender: TObject);
    procedure ToolBar1Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure ToolButton_conClick(Sender: TObject);
    procedure ToolButton_deClick(Sender: TObject);
    procedure ToolButton_plClick(Sender: TObject);
    procedure ToolButton_prClick(Sender: TObject);
    procedure TraceCheckBoxClick(Sender: TObject);
    procedure UploadButtonClick(Sender: TObject);
    procedure UsePassiveClick(Sender: TObject);
    procedure MenuItemConnectClick(Sender: TObject);
    procedure SetAppTitle(Title: string);
    procedure CustomExceptionHandler(Sender: TObject; E: Exception);
    procedure DownloadFolder(AFTP: TIdFtp; ARemotePath, ALocalPath:string);
  private
    { private declarations }
    AbortTransfer: Boolean;

    TransferrignData: Boolean;

    BytesToTransfer: LongWord;

    STime: TDateTime;
    CanDelDir, CanDelFile, CanCreaDir, CanUpload, CanDownl, CanChgDir: boolean;

    procedure ChageDir(DirName: String);

    procedure SetFunctionButtons(AValue: Boolean);

    procedure SaveFTPHostInfo(Datatext, iheader: String);

    function GetHostInfo(iheader: String): String;

    procedure PutToDebugLog(Operation, S1: String);

    procedure AddDirToMRUList(DirName: string);



  public
    { public declarations }
  end;

var
  MainForm: TMainForm;

implementation
Uses
  IniFiles, LCLIntf,connlist;


Var

  AverageSpeed: Double = 0;


{$R *.lfm}

{ TMainForm }


procedure TMainForm.CustomExceptionHandler(Sender: TObject; E: Exception);
begin

  if e.ClassNameIs('EIdReplyRFCError') then begin
    debuglistbox.Items.Add(e.Message);
    debuglistbox.Itemindex:=debuglistbox.Items.Count-1;


//  showmessage(e.ClassType.ClassName);
  end;

//  if not e.ClassNameIs('EIdReplyRFCError') then
//  Halt; // End of program execution
end;



procedure TMainForm.SetAppTitle(Title: string);
begin
  caption:='fast RoFTP '+title;
end;

procedure TMainForm.MenuItemConnectClick(Sender: TObject);
var cName,cap:string;
begin
  cap:=TMenuItem(sender).Caption;
  cName:=copy(cap,0,pos('@',cap)-1);
  form_srv.dbsrv.First;
  showmessage(cName);
  while not form_srv.dbsrv.EOF do begin

    if lowercase(form_srv.dbsrv.FieldByName('descr').asstring)=lowercase(cName) then begin
//       showmessage(lowercase(form_srv.dbsrv.FieldByName('descr').asstring)+'/'+lowercase(cName) );
//      showmessage('trovato');
      idftp1.disconnect;
      ConnectButtonClick(Sender);
      SetAppTitle('- '+form_srv.dbsrv.FieldByName('descr').asstring);
      break;
      end;
      form_srv.dbsrv.next;
  end;

end;

procedure TMainForm.AddDirToMRUList(DirName: string);
begin
    currentdiredit.Text:=Dirname;
    if currentdiredit.Items.IndexOf(DirName) < 0 then
         currentdiredit.Items.Insert(0,DirName);

end;

procedure TMainForm.SetFunctionButtons(AValue: Boolean);

Var

  i: Integer;

begin

  with CommandPanel do

    for i := 0 to ControlCount - 1 do

      if (Controls[i].Name <> 'AbortButton')  then Controls[i].Enabled := AValue;



  with DirectoryPopupMenu do

    for i := 0 to Items.Count - 1 do Items[i].Enabled := AValue;


 ConnectButton.Enabled:=true;
(*
 delete1.Enabled:= CanDelDir;
 delete2.Enabled:= CanDelFile;
 CreateDirButton.Enabled:=CanCreaDir;
 upload1.Enabled:=CanUpload;
 upload2.Enabled:=CanUpload;
 uploadbutton.Enabled:=CanUpload;
 downloadfile.Enabled:=CanDownl;
 downloadbutton.Enabled:=CanDownl;
 currentdiredit.Enabled:=CanChgDir;
 chdirbutton.Enabled:=CanChgDir;
 backbutton.Enabled:=CanChgDir;
 groupbox3.Visible:=CanChgDir;
 *)

end;


procedure TMainForm.ConnectButtonClick(Sender: TObject);
var ini:tinifile;
begin

  shelltreeview1.Root:=Form_srv.dbsrv.FieldByName('localdir').asstring;
  ConnectButton.Enabled := false;
  ToolButton_con.ImageIndex:=7;
  ToolButton_con.Down:=false;
  SetAppTitle('');
//  progressbar1.Style:=pbstMarquee;

    if IdFTP1.Connected then try

      if TransferrignData then IdFTP1.Abort;

      IdFTP1.Quit;
(*
       CanDelDir:=false;
      CanDelFile:=false;
      CanCreaDir:=false;
      CanUpload:=false;
      CanDownl:=false;
      CanChgDir:=false;
*)

    finally
      panel_remoto.Enabled:=false;
      panel_updo.Enabled:=false;
      //CurrentDirEdit.Text := '/';
      AddDirToMRUList('/');

//      DirectoryListBox.Items.Clear;
//      FileListBox.Items.Clear;
      DirectoryListView.Items.Clear;
      FileListView.Items.Clear;


  //    SetFunctionButtons(false);

      ConnectButton.Caption := 'Connetti';

      ConnectButton.Enabled := true;

      ConnectButton.Default := true;

      setapptitle('');
      progressbar1.Style:=pbstNormal;

    end


    else with IdFTP1 do try

//      progressbar1.Style:=pbstMarquee;

(*
      ini:= TINIfile.Create(extractfilepath(application.ExeName)+'/dokuclient.ini');

      Username := ini.ReadString('DokuServer','Utente','');

      Password := ini.ReadString('DokuServer','Password','');

      Host := ini.ReadString('DokuServer','Server','127.0.0.1');

      Port := ini.ReadInteger('DokuServer','Porta',8383);
*)

      Username:=Form_srv.dbsrv.FieldByName('user').asstring;
      Password:=Form_srv.dbsrv.FieldByName('pass').asstring;
      Host:=Form_srv.dbsrv.FieldByName('serverurl').asstring;
      Port:=Form_srv.dbsrv.FieldByName('port').asinteger;
      Passive:= Form_srv.dbsrv.FieldByName('passive').asboolean;


      Connect;

      //Self.ChageDir(CurrentDirEdit.Text);
      Self.ChageDir(Form_srv.dbsrv.FieldByName('remotedir').asstring );

      SetFunctionButtons(true);

//      SaveFTPHostInfo(FtpServerEdit.Text, 'FTPHOST');

    finally

      ConnectButton.Enabled := true;

      if Connected then begin


        ConnectButton.Caption := 'Disconnetti';

        ConnectButton.Default := false;

        panel_remoto.Enabled:=true;
        panel_updo.Enabled:=true;

          ToolButton_con.ImageIndex:=8;
            ToolButton_con.Down:=true;
            SetAppTitle('- '+form_srv.dbsrv.FieldByName('descr').asstring);
                  progressbar1.Style:=pbstNormal;

      end;

    end;
end;

procedure TMainForm.CreateDirButtonClick(Sender: TObject);

  Var

    S: String;

  begin

    S := InputBox('Crea una nuova cartella', 'Nome da assegnare', '');

    if S <> '' then

      try

        SetFunctionButtons(false);

        IdFTP1.MakeDir(S);

        ChageDir(CurrentDirEdit.Text);

      finally

        SetFunctionButtons(true);

      end;
end;

procedure TMainForm.CurrentDirEditKeyPress(Sender: TObject; var Key: char);
begin
    if key=#13 then ChDirButtonClick(sender);
end;

procedure TMainForm.DebugListBoxDrawItem(Control: TWinControl; Index: Integer;
  ARect: TRect; State: TOwnerDrawState);
begin
(*
  if Pos('>>', DebugListBox.Items[index]) > 1 then

      DebugListBox.Canvas.Font.Color := clRed

    else

      DebugListBox.Canvas.Font.Color := clBlue;



    if odSelected in State then begin

      DebugListBox.Canvas.Brush.Color := $00895F0A;

      DebugListBox.Canvas.Font.Color := clWhite;

    end

    else

      DebugListBox.Canvas.Brush.Color := clWindow;



    DebugListBox.Canvas.FillRect(Rect);



    DebugListBox.Canvas.TextOut(Rect.Left, Rect.Top, DebugListBox.Items[index]);

*)
end;

procedure TMainForm.Delete2Click(Sender: TObject);
  Var  dName: String;
       a:word;

  begin

     if MessageDlg('Eliminazione files', 'Intendi eliminare i files selezionati?', mtConfirmation,
   [mbNo, mbYes],0) = mrNo
  then  exit;


    if not IdFTP1.Connected then exit;

    //dName :=  IdFTP1.DirectoryListing.Items[DirectoryListBox.ItemIndex].FileName;
    if FileListView.ItemIndex < 0 then exit;
//    showmessage(dname);

  (*  if FileListBox.Items.Count > 0 then begin
      showmessage('Impossibile rimuovere la cartella perchè contiene documenti.');
      exit;
    end;
  *)
   // if IdFTP1.DirectoryListing.Items[DirectoryListBox.ItemIndex].ItemType = ditDirectory then



   try

      for a:=0 to FileListView.Items.Count-1 do begin
          if FileListView.Items[a].Checked=true then begin
          dName :=  currentdiredit.Text+'/'+FileListView.Items[a].Caption;

      SetFunctionButtons(false);

      idftp1.Delete(dName);
     // showmessage(idftp1.LastCmdResult.Text[0]);

     // PutToDebugLog('DELETE FILE ', idftp1.LastCmdResult.Text[0]);
     DebugListBox.Items.Add(idftp1.LastCmdResult.Text[0]);
     // showmessage('chagedir');

    end
       end;

    finally
      ChageDir(idftp1.RetrieveCurrentDir);

   end;
  (*
    else

    try

      SetFunctionButtons(false);

      idftp1.Delete(dName);

      ChageDir(idftp1.RetrieveCurrentDir);

    finally

    end;
  *)
  end;


procedure TMainForm.AbortButtonClick(Sender: TObject);
begin
  AbortTransfer := true;
end;

procedure TMainForm.BackButtonClick(Sender: TObject);
begin
   if not IdFTP1.Connected then exit;

  try

    ChageDir('..');

  finally end;
end;

procedure TMainForm.CmdUserRightsButtonClick(Sender: TObject);
begin
   if idFtp1.SendCmd('GETUSERRIGHT') <> -1 then
   begin
//     if (idFtp.LastCmdResult.TextCode = '250') then

//      showmessage(idftp1.LastCmdResult.Text.CommaText);
     if idftp1.LastCmdResult.Text.IndexOf('candeldir=True') <> -1 then CanDelDir:=true else CanDelDir:=false;
     if idftp1.LastCmdResult.Text.IndexOf('candelfile=True') <> -1 then CanDelFile:=true else CanDelFile:=false;
     if idftp1.LastCmdResult.Text.IndexOf('cancreadir=True') <> -1 then CanCreaDir:=true else CanCreaDir:=false;
     if idftp1.LastCmdResult.Text.IndexOf('canupload=True') <> -1 then CanUpload:=true else CanUpload:=false;
     if idftp1.LastCmdResult.Text.IndexOf('candownl=True') <> -1 then CanDownl:=true else CanDownl:=false;
     if idftp1.LastCmdResult.Text.IndexOf('canchgdir=True') <> -1 then CanChgDir:=true else CanChgDir:=false;

   end;

end;

procedure TMainForm.ChDirButtonClick(Sender: TObject);
begin
  SetFunctionButtons(false);

  ChageDir(CurrentDirEdit.Text);

  SetFunctionButtons(true);
end;

procedure TMainForm.DeleteButtonClick(Sender: TObject);
Var  dName: String;
     a: word;

begin

       if MessageDlg('Eliminazione cartelle', 'Intendi eliminare le cartelle selezionate?', mtConfirmation,
   [mbNo, mbYes],0) = mrNo
  then  exit;

  if not IdFTP1.Connected then exit;


  if DirectoryListView.ItemIndex > -1 then
     dName :=  DirectoryListView.Items[DirectoryListView.ItemIndex].Caption
  else exit;


 try

         for a:=0 to DirectoryListView.Items.Count-1 do begin
          if DirectoryListView.Items[a].Checked=true then begin
          dName :=  currentdiredit.Text+'/'+DirectoryListView.Items[a].Caption;

      SetFunctionButtons(false);

      idftp1.RemoveDir(dName);

     DebugListBox.Items.Add(idftp1.LastCmdResult.Text[0]);

    end
       end;








  finally
    ChageDir(idftp1.RetrieveCurrentDir);
  end
(*
  else

  try

    SetFunctionButtons(false);

    idftp1.Delete(dName);

    ChageDir(idftp1.RetrieveCurrentDir);

  finally

  end;
*)
end;

procedure TMainForm.DirectoryListBoxClick(Sender: TObject);
begin
  if not IdFTP1.Connected then exit;

(*
  if DirectoryListBox.ItemIndex > -1 then begin

  if IdFTP1.DirectoryListing.Items[DirectoryListBox.ItemIndex].ItemType = ditDirectory then DownloadButton.Caption := 'Change dir'

    else DownloadButton.Caption := 'Download';

  end;
*)
end;

procedure TMainForm.DirectoryListBoxDblClick(Sender: TObject);
Var

  bName{, Line}: String;

begin

  if not IdFTP1.Connected then exit;

  //Line := DirectoryListBox.Items[DirectoryListBox.ItemIndex];

  //bName := IdFTP1.DirectoryListing.Items[DirectoryListBox.ItemIndex].FileName;
  if DirectoryListView.ItemIndex > -1 then
  bName := DirectoryListView.Items[DirectoryListView.ItemIndex].Caption
  else exit;

//  if IdFTP1.DirectoryListing.Items[DirectoryListBox.ItemIndex].ItemType = ditDirectory then begin

    // Change directory

//    SetFunctionButtons(false);

    ChageDir(bName);

//    SetFunctionButtons(true);

//  end
(*
  else begin

    try

      SaveDialog1.FileName := bName;

      if SaveDialog1.Execute then begin

        SetFunctionButtons(false);



        IdFTP1.TransferType := ftBinary;

        BytesToTransfer := IdFTP1.Size(bName);



        if FileExists(bName) then begin

          case MessageDlg('File aready exists. Do you want to resume the download operation?',

            mtConfirmation, mbYesNoCancel, 0) of

            mrYes: begin

              BytesToTransfer := BytesToTransfer - FileSize(bName);

              IdFTP1.Get(bName, SaveDialog1.FileName, false, true);

            end;

            mrNo: begin

              IdFTP1.Get(Name, SaveDialog1.FileName, true);

            end;

            mrCancel: begin

              exit;

            end;

          end;

        end

        else begin

          IdFTP1.Get(bName, SaveDialog1.FileName, false);

        end;

      end;

    finally

      SetFunctionButtons(true);

    end;

  end;
  *)
end;

procedure TMainForm.DirectoryListBoxDrawItem(Control: TWinControl; Index: Integer;
  ARect: TRect; State: TOwnerDrawState);

(*
  Const Widths : array[0..5] of integer = (70,20,40,40,40,50);



  function getWidth (x:integer):integer;



  begin

   {$IFDEF FPC}

      Result:=Widths[x];

   {$ELSE}



      Result:=HeaderControl1.Sections.Items[i].Width;

  {$ENDIF}



  end;

  Var

    R: TRect;
*)
  begin
(*
    if odSelected in State then begin

      DirectoryListBox.Canvas.Brush.Color := $00895F0A;

      DirectoryListBox.Canvas.Font.Color := clWhite;

    end

    else

      DirectoryListBox.Canvas.Brush.Color := clWindow;



    if Assigned(IdFTP1.DirectoryListing) and (IdFTP1.DirectoryListing.Count > Index) then begin

      DirectoryListBox.Canvas.FillRect(Rect);

      with IdFTP1.DirectoryListing.Items[Index] do begin

        DirectoryListBox.Canvas.TextOut(Rect.Left, Rect.Top, FileName);

        R := Rect;



        R.Left := Rect.Left + getWidth (0);

        R.Right := R.Left + getWidth (1);



        DirectoryListBox.Canvas.FillRect(R);

        DirectoryListBox.Canvas.TextOut(R.Left, Rect.Top, IntToStr(Size));



        R.Left := R.Right;

        R.Right := R.Left + getWidth (2);

        DirectoryListBox.Canvas.FillRect(R);



        if ItemType = ditDirectory then begin

          DirectoryListBox.Canvas.TextOut(R.Left, Rect.Top, 'Directory');

        end

        else

          DirectoryListBox.Canvas.TextOut(R.Left, Rect.Top, 'File');



        R.Left := R.Right;

        R.Right := R.Left + getWidth (3);

        DirectoryListBox.Canvas.FillRect(R);

        DirectoryListBox.Canvas.TextOut(R.Left, Rect.Top, FormatDateTime('mm/dd/yyyy hh:mm', ModifiedDate));



        R.Left := R.Right;

        R.Right := R.Left + getWidth (4);

        DirectoryListBox.Canvas.FillRect(R);

        DirectoryListBox.Canvas.TextOut(R.Left, Rect.Top, GroupName);



        R.Left := R.Right;

        R.Right := R.Left + getWidth (5);

        DirectoryListBox.Canvas.FillRect(R);

        DirectoryListBox.Canvas.TextOut(R.Left, Rect.Top, OwnerName);



        R.Left := R.Right;

        R.Right := R.Left + getWidth (6);

        DirectoryListBox.Canvas.FillRect(R);

        DirectoryListBox.Canvas.TextOut(R.Left, Rect.Top, OwnerPermissions + GroupPermissions + UserPermissions);

      end;

    end;
*)
end;

procedure TMainForm.DirectoryListViewDblClick(Sender: TObject);
Var

  bName{, Line}: String;

begin

  if not IdFTP1.Connected then exit;

  //Line := DirectoryListBox.Items[DirectoryListBox.ItemIndex];

  //bName := IdFTP1.DirectoryListing.Items[DirectoryListBox.ItemIndex].FileName;

  if DirectoryListView.ItemIndex > -1 then
  bName := DirectoryListView.Items[DirectoryListView.ItemIndex].Caption
  else exit;

//  if IdFTP1.DirectoryListing.Items[DirectoryListBox.ItemIndex].ItemType = ditDirectory then begin

    // Change directory

    SetFunctionButtons(false);

    ChageDir(bName);

    SetFunctionButtons(true);

//  end
(*
  else begin

    try

      SaveDialog1.FileName := bName;

      if SaveDialog1.Execute then begin

        SetFunctionButtons(false);



        IdFTP1.TransferType := ftBinary;

        BytesToTransfer := IdFTP1.Size(bName);



        if FileExists(bName) then begin

          case MessageDlg('File aready exists. Do you want to resume the download operation?',

            mtConfirmation, mbYesNoCancel, 0) of

            mrYes: begin

              BytesToTransfer := BytesToTransfer - FileSize(bName);

              IdFTP1.Get(bName, SaveDialog1.FileName, false, true);

            end;

            mrNo: begin

              IdFTP1.Get(Name, SaveDialog1.FileName, true);

            end;

            mrCancel: begin

              exit;

            end;

          end;

        end

        else begin

          IdFTP1.Get(bName, SaveDialog1.FileName, false);

        end;

      end;

    finally

      SetFunctionButtons(true);

    end;

  end;
  *)

end;

procedure TMainForm.Download1Click(Sender: TObject);
var locpath:string;
begin
//     showmessage(currentdiredit.Text+directorylistview.Items[directorylistview.ItemIndex].Caption);
//     showmessage('download in: '+shelltreeview1.GetSelectedNodePath+'/'+directorylistview.Items[directorylistview.ItemIndex].Caption);
locpath:=shelltreeview1.GetSelectedNodePath+'/'+directorylistview.Items[directorylistview.ItemIndex].Caption;
     DownloadFolder(idftp1, currentdiredit.Text+directorylistview.Items[directorylistview.ItemIndex].Caption, locpath);
end;

procedure TMainForm.DownloadButtonClick(Sender: TObject);
begin

end;

procedure TMainForm.DownloadfileClick(Sender: TObject);
Var

  bName{, Line}: String;

begin

  if not IdFTP1.Connected then exit;

  //Line := DirectoryListBox.Items[DirectoryListBox.ItemIndex];

  //bName := IdFTP1.DirectoryListing.Items[DirectoryListBox.ItemIndex].FileName;
  if DirectoryListView.ItemIndex > -1 then
  bName := DirectoryListView.Items[DirectoryListView.ItemIndex].Caption
  else exit;

//  if IdFTP1.DirectoryListing.Items[DirectoryListBox.ItemIndex].ItemType = ditDirectory then begin

    // Change directory

    SetFunctionButtons(false);

    ChageDir(bName);

    SetFunctionButtons(true);

//  end
(*
  else begin

    try

      SaveDialog1.FileName := bName;

      if SaveDialog1.Execute then begin

        SetFunctionButtons(false);



        IdFTP1.TransferType := ftBinary;

        BytesToTransfer := IdFTP1.Size(bName);



        if FileExists(bName) then begin

          case MessageDlg('File aready exists. Do you want to resume the download operation?',

            mtConfirmation, mbYesNoCancel, 0) of

            mrYes: begin

              BytesToTransfer := BytesToTransfer - FileSize(bName);

              IdFTP1.Get(bName, SaveDialog1.FileName, false, true);

            end;

            mrNo: begin

              IdFTP1.Get(Name, SaveDialog1.FileName, true);

            end;

            mrCancel: begin

              exit;

            end;

          end;

        end

        else begin

          IdFTP1.Get(bName, SaveDialog1.FileName, false);

        end;

      end;

    finally

      SetFunctionButtons(true);

    end;

  end;
  *)
end;


procedure TMainForm.FileListBoxDblClick(Sender: TObject);
var bName:string;
begin
   if not IdFTP1.Connected then exit;

//  bName := IdFTP1.DirectoryListing.Items[FileListBox.ItemIndex].FileName;

   if FileListView.ItemIndex > -1 then
   bName:= FileListView.items[FileListView.ItemIndex].Caption
   else exit;

    try

      SaveDialog1.FileName := bName;

      if SaveDialog1.Execute then begin

        SetFunctionButtons(false);



        IdFTP1.TransferType := ftBinary;

        BytesToTransfer := IdFTP1.Size(bName);



        if FileExists(bName) then begin

          case MessageDlg('Il file esiste già. Lo vuoi scaricare di nuovo?',

            mtConfirmation, mbYesNoCancel, 0) of

            mrYes: begin

              BytesToTransfer := BytesToTransfer - FileSize(bName);

              IdFTP1.Get(bName, SaveDialog1.FileName, false, true);

            end;

            mrNo: begin

              IdFTP1.Get(bName, SaveDialog1.FileName, true);

            end;

            mrCancel: begin

              exit;

            end;

          end;

        end

        else begin

          IdFTP1.Get(bName, SaveDialog1.FileName, false);

        end;

      end;

    finally

      SetFunctionButtons(true);

    end;



end;

procedure TMainForm.FileListViewDblClick(Sender: TObject);
var bName:string;
begin

//  if not CanDownl then exit;

   if not IdFTP1.Connected then exit;

//  bName := IdFTP1.DirectoryListing.Items[FileListBox.ItemIndex].FileName;

   if FileListView.ItemIndex > -1 then begin
   bName:= FileListView.items[FileListView.ItemIndex].Caption;

   if bName='..' then  begin
     ChageDir(bName);
     exit;
   end;
   end
   else exit;

    try

      SaveDialog1.FileName := bName;

      if SaveDialog1.Execute then begin

        SetFunctionButtons(false);



        IdFTP1.TransferType := ftBinary;

        BytesToTransfer := IdFTP1.Size(bName);



        if FileExists(savedialog1.FileName) then begin

          case MessageDlg('Nella cartella c''è già un file con lo stesso nome, lo sovrascrivo?',

            mtConfirmation, mbYesNo, 0) of
(*
            mrYes: begin

            //  BytesToTransfer := BytesToTransfer - FileSize(SaveDialog1.FileName);

              IdFTP1.Get(bName, SaveDialog1.FileName, false, true);

            end;
*)
            mrYes: begin

              IdFTP1.Get(bName, SaveDialog1.FileName, true);

            end;

            mrNo: begin

              exit;

            end;

          end;

        end

        else begin

          IdFTP1.Get(bName, SaveDialog1.FileName, false);

        end;

      end;

    finally

      SetFunctionButtons(true);

    end;



end;

procedure TMainForm.FileListViewDragDrop(Sender, Source: TObject; X, Y: Integer
  );
(*
var
  files: TStringList;
  slv : TShellListView;
  cnt: Integer;
  *)
begin
        if Source is TShellListView then  MenuItem9Click(Sender);
  //  showmessage(source.ClassName);

(*
  slv := TShellListView(Source);

  files := TStringList.Create;
  try
    if NOT slv.MultiSelect then
      files.Add(slv.Selected.Caption)
    else //multiselect
    begin
      for cnt := 0 to -1 + slv.Items.Count do
      begin

        if slv.Items[cnt].Selected  then
          files.Add(slv.items[cnt].Caption);
        end;
    end;

    //display selected files in memo
//    memoSelectedFiles.Lines.Assign(files);

      showmessage(files.Text);

  finally
    files.Free;
  end;
  *)
end;





procedure TMainForm.FileListViewDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
     //showmessage(source.ClassName);
  Accept := true;
end;

procedure TMainForm.FileListViewStartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin

end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  CurrentDirEdit.Items.SaveToFile('./recentdir.txt');
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin

//Application.OnException := @CustomExceptionHandler;

  progressbar1.BarShowText:=false;

  shelltreeview1.Root:='/';
  ShellTreeView1Change(nil,nil);
  (*
      CanDelDir:=false;
      CanDelFile:=false;
      CanCreaDir:=false;
      CanUpload:=false;
      CanDownl:=false;
      CanChgDir:=false;
   *)
  //SetFunctionButtons(false);


//  FtpServerEdit.Text := GetHostInfo('FTPHOST');



 // ProgressBar1.Top := 4;



  //ProgressBar1.Align := alClient;
//  AbortButton.Parent:=StatusBar1;
//  AbortButton.Align:=alRight;

  if fileexists('./recentdir.txt') then CurrentDirEdit.Items.LoadFromFile('./recentdir.txt');

  dbfiles.Open;

  ToolButton_plClick(sender);
    ToolButton_prClick(sender);
      ToolButton_deClick(sender);
      ToolButton8Click(Sender);

end;

procedure TMainForm.FormDropFiles(Sender: TObject;
  const FileNames: array of String);
var
  i: Integer;
begin
  for i := Low(FileNames) to High(FileNames) do showmessage(FileNames[i]);

end;

procedure TMainForm.IdFTP1AfterClientLogin(Sender: TObject);
begin
  //CmdUserRightsButtonClick(Sender);
end;

procedure TMainForm.IdFTP1Disconnected(Sender: TObject);
begin
  Panel_status.caption := 'Disconnesso.';
end;

procedure TMainForm.IdFTP1Status(ASender: TObject; const AStatus: TIdStatus;
  const AStatusText: string);
begin
  DebugListBox.ItemIndex := DebugListBox.Items.Add(aStatusText);

  Panel_status.caption := aStatusText;
end;

procedure TMainForm.IdFTP1Work(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
Var

  S: String;

  TotalTime: TDateTime;

//  RemainingTime: TDateTime;

  H, M, Sec, MS: Word;

  DLTime: Double;

begin

  TotalTime :=  Now - STime;

  DecodeTime(TotalTime, H, M, Sec, MS);

  Sec := Sec + M * 60 + H * 3600;

  DLTime := Sec + MS / 1000;

  if DLTime > 0 then

    AverageSpeed := {(AverageSpeed + }(AWorkCount / 1024) / DLTime{) / 2};



  if AverageSpeed > 0 then begin

    Sec := Trunc(((ProgressBar1.Max - AWorkCount) / 1024) / AverageSpeed);



    S := Format('%2d:%2d:%2d', [Sec div 3600, (Sec div 60) mod 60, Sec mod 60]);



    S := 'Tempo rimanente ' + S;

  end

  else S := '';



  S := FormatFloat('0.00 kb/s ', AverageSpeed) + ' ' + S;

  case AWorkMode of

    wmRead: Panel_status.caption := 'Velocità download ' + S;

    wmWrite: Panel_status.caption := 'Velocità upload ' + S;

  end;



  if AbortTransfer then IdFTP1.Abort;



  ProgressBar1.Position := AWorkCount;

  AbortTransfer := false;

  application.ProcessMessages;

end;

procedure TMainForm.IdFTP1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
  TransferrignData := true;

//    AbortButton.Visible := true;

    AbortTransfer := false;

    STime := Now;

    if AWorkCountMax > 0 then ProgressBar1.Max := AWorkCountMax

    else ProgressBar1.Max := BytesToTransfer;

    AverageSpeed := 0;

    application.ProcessMessages;
end;

procedure TMainForm.IdFTP1WorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
//  AbortButton.Visible := false;

    Panel_status.caption := 'Transferimento completo.';

    BytesToTransfer := 0;

    TransferrignData := false;

    ProgressBar1.Position := 0;

    AverageSpeed := 0;

    application.ProcessMessages;
end;

procedure TMainForm.IdLogEvent1Received(ASender: TComponent; const AText,
  AData: string);
begin
   PutToDebugLog('<<- ', AData);
end;

procedure TMainForm.IdLogEvent1Sent(ASender: TComponent; const AText, AData: string
  );
begin
    PutToDebugLog('->> ', AData);
end;

procedure TMainForm.Label3Click(Sender: TObject);
begin
    OpenURL('http://www.rinorusso.it');
end;

procedure TMainForm.Label6Click(Sender: TObject);
begin
    OpenURL('http://www.fasttools.it');
end;

procedure TMainForm.MenuItem11Click(Sender: TObject);
begin
  form_srv.Showmodal;
end;

procedure TMainForm.MenuItem15Click(Sender: TObject);
begin
  MenuItem9Click(Sender);
end;

procedure TMainForm.MenuItem2Click(Sender: TObject);
begin
  close;
end;

procedure TMainForm.MenuItem9Click(Sender: TObject);
var a,t,u:word;
begin
//  showmessage(shelllistview1.Root);
//  showmessage(shelllistview1.Root+'/'+shelllistview1.Items[shelllistview1.ItemIndex].Caption);
//  exit;
    if IdFTP1.Connected then begin

       try

//          SetFunctionButtons(false);

         IdFTP1.TransferType := ftBinary;


         if shelllistview1.SelCount=1 then begin
         u:=shelllistview1.ItemIndex;
         t:=u;
         end else begin
           u:=shelllistview1.Items.Count-1;
           t:=0;
           end;

         for a:=t to u do begin

           if shelllistview1.items[a].Selected then begin
            BytesToTransfer := filesize(shelllistview1.Root+'/'+shelllistview1.Items[a].Caption);
            IdFTP1.Put(shelllistview1.Root+'/'+shelllistview1.Items[a].Caption, ExtractFileName(shelllistview1.Items[a].Caption));

(*
         BytesToTransfer := filesize(shelllistview1.Root+'/'+shelllistview1.Items[shelllistview1.ItemIndex].Caption);
         IdFTP1.Put(shelllistview1.Root+'/'+shelllistview1.Items[shelllistview1.ItemIndex].Caption, ExtractFileName(shelllistview1.Items[shelllistview1.ItemIndex].Caption));
*)
         ChageDir(idftp1.RetrieveCurrentDir);
             end;
           end;

         //end

        finally

//          SetFunctionButtons(true);

        end;

      end;
end;

procedure TMainForm.MenuItem_plClick(Sender: TObject);
begin


end;



procedure TMainForm.Panel1Click(Sender: TObject);
begin

end;

procedure TMainForm.ShellListView1Change(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin

end;

procedure TMainForm.ShellListView1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     if Button = mbLeft then   {check if left mouse button was pressed}
    ShellListView1.BeginDrag(true);  {starting the drag operation}
end;

procedure TMainForm.ShellListView1SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin

end;

procedure TMainForm.ShellTreeView1Change(Sender: TObject; Node: TTreeNode);
var t:word;
begin
  if ShellListView1.Items.Count > 0 then
  for t:= 0 to ShellListView1.Items.Count-1 do
     ShellListView1.Items[t].ImageIndex := 1;
end;

procedure TMainForm.ShellTreeView1CustomDrawItem(Sender: TCustomTreeView;
  Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
   Node.ImageIndex:=0;
end;

procedure TMainForm.SpeedButton3Click(Sender: TObject);
begin
  MenuItem9Click(Sender);
end;

procedure TMainForm.ToolBar1Click(Sender: TObject);
begin

end;

procedure TMainForm.ToolButton1Click(Sender: TObject);
begin
  form_srv.ShowModal;
end;

procedure TMainForm.ToolButton4Click(Sender: TObject);
begin
  if MessageDlg('Conferma uscita', 'Intendi uscire da fast RoFTP ?', mtConfirmation,
   [mbNo, mbYes],0) = mrYes
  then  close;
end;

procedure TMainForm.ToolButton8Click(Sender: TObject);
begin
     if toolbutton8.Down then groupbox1.show else groupbox1.hide;
end;

procedure TMainForm.ToolButton_conClick(Sender: TObject);
begin
    if toolbutton_con.Down then idftp1.Disconnect else ConnectButtonClick(Sender);
end;

procedure TMainForm.ToolButton_deClick(Sender: TObject);
begin
     if toolbutton_de.Down then debuglistbox.show else debuglistbox.hide;
end;

procedure TMainForm.ToolButton_plClick(Sender: TObject);
begin
      if toolbutton_pl.Down then panel_locale.show else panel_locale.hide;
end;

procedure TMainForm.ToolButton_prClick(Sender: TObject);
begin
      if toolbutton_pr.Down then panel_remoto.show else panel_remoto.hide;
end;

procedure TMainForm.TraceCheckBoxClick(Sender: TObject);
begin
  if TraceCheckBox.Checked then

    IdFtp1.Intercept := IdLogEvent1

  else

    IdFtp1.Intercept := nil;



//  LogGroupBox.Visible := TraceCheckBox.Checked;

//  if LogGroupBox.Visible then Splitter1.Top := DebugListBox.Top + 5;
end;

procedure TMainForm.UploadButtonClick(Sender: TObject);
begin
    if IdFTP1.Connected then begin

        if UploadOpenDialog1.Execute then try

          SetFunctionButtons(false);

         IdFTP1.TransferType := ftBinary;



          IdFTP1.Put(UploadOpenDialog1.FileName, ExtractFileName(UploadOpenDialog1.FileName));

          ChageDir(idftp1.RetrieveCurrentDir);

        finally

          SetFunctionButtons(true);

        end;

      end;
end;

procedure TMainForm.ChageDir(DirName: String);

Var

  LS: TStringList;
  t:word;
  nitem, nitem1 :tlistitem;

begin

//  progressbar1.Style:=pbstMarquee;

 // LS := TStringList.Create;

//  if (DirName='..') and (not CanChgDir) then exit;

  try

    SetFunctionButtons(false);

    if DirName='..' then IdFTP1.ChangeDirUp else IdFTP1.ChangeDir(DirName);

//    showmessage(idftp1.LastCmdResult.Code);

    IdFTP1.TransferType := ftASCII;



    //CurrentDirEdit.Text := IdFTP1.RetrieveCurrentDir;
    AddDirToMRUList(IdFTP1.RetrieveCurrentDir);


//    DirectoryListBox.Items.Clear;
//    FileListBox.Items.Clear;
    FileListView.Items.clear;
    DirectoryListView.Items.clear;

    //IdFTP1.List(LS);
    IdFTP1.List;

    // inserisce gli item per tornare alla directory precedente

            nitem:=TListItem.Create(DirectoryListView.Items);
            nitem.Caption:='..';
            nitem.ImageIndex:=0;
            DirectoryListView.Items.AddItem(nitem);

             nitem1:=TListItem.Create(FileListView.Items);
            nitem1.Caption:='..';
            nitem1.ImageIndex:=0;
            FileListView.Items.AddItem(nitem1);

    for t:=0 to IdFTP1.DirectoryListing.count -1 do begin
       if IdFTP1.DirectoryListing.Items[t].ItemType = ditDirectory then begin
           // DirectoryListBox.Items.Add(IdFTP1.DirectoryListing.Items[t].FileName);

            if (IdFTP1.DirectoryListing.Items[t].FileName <> '.')  then begin
            nitem:=TListItem.Create(DirectoryListView.Items);
            nitem.Caption:=IdFTP1.DirectoryListing.Items[t].FileName;
            nitem.ImageIndex:=0;
            DirectoryListView.Items.AddItem(nitem);
           // nitem.Free;
            end;


       end
       else begin
           // FileListBox.Items.Add(IdFTP1.DirectoryListing.Items[t].FileName);
            nitem1:=TListItem.Create(FileListView.Items);

            nitem1.Caption:=IdFTP1.DirectoryListing.Items[t].FileName;
            nitem1.SubItems.Add(inttostr(IdFTP1.DirectoryListing.Items[t].Size div 1024)+ ' Kb');
            nitem1.SubItems.Add(datetimetostr(IdFTP1.DirectoryListing.Items[t].ModifiedDate));
            nitem1.ImageIndex:=1;
            FileListView.Items.AddItem(nitem1);
           // nitem1.Free;

       end;
    end;

    //DirectoryListBox.Items.Assign(LS);
    //end;

 //   if DirectoryListBox.Items.Count > 0 then

 //     if AnsiPos('total', DirectoryListBox.Items[0]) > 0 then DirectoryListBox.Items.Delete(0);


  finally

    SetFunctionButtons(true);

    progressbar1.Style:=pbstNormal;

 //   LS.Free;

  end;

  progressbar1.Style:=pbstNormal;
  progressbar1.Update;

end;

procedure TMainForm.UsePassiveClick(Sender: TObject);
begin
  IdFTP1.Passive := UsePassive.Checked;
end;


procedure TMainForm.SaveFTPHostInfo(Datatext, iheader: String);

var

  ServerIni: TIniFile;

begin

  ServerIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'FtpHost.ini');

  ServerIni.WriteString('Server', iheader, Datatext);

  ServerIni.UpdateFile;

  ServerIni.Free;

end;



function TMainForm.GetHostInfo(iheader: String): String;

var

  ServerName: String;

  ServerIni: TIniFile;

begin

  ServerIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'FtpHost.ini');

  ServerName := ServerIni.ReadString('Server', iheader, iheader);



  ServerIni.Free;

  result := ServerName;

end;



procedure TMainForm.PutToDebugLog(Operation, S1: String);

Var

  S: String;

begin

  while Length(S1) > 0 do begin

    if Pos(#13, S1) > 0 then begin

      S := Copy(S1, 1, Pos(#13, S1) - 1);

      Delete(S1, 1, Pos(#13, S1));

      if S1[1] = #10 then Delete(S1, 1, 1);

    end

    else

      S := S1;



    DebugListBox.ItemIndex := DebugListBox.Items.Add(Operation + S);

  end;

end;

procedure TMainForm.DownloadFolder(AFTP: TIdFtp; ARemotePath, ALocalPath:string);
var
I: Integer;
begin
AFTP.ChangeDir('/');

ALocalPath := IncludeTrailingPathDelimiter(ALocalPath);
showmessage(Alocalpath);
ForceDirectories(ALocalPath);
if ARemotePath[Length(ARemotePath)] <>'/' then
ARemotePath := ARemotePath + '/';


showmessage(Aremotepath);

AFTP.ChangeDir(Aremotepath);

{ Get the directory listing }
try
AFTP.List;
except
end;
{ Download files }
for I:=0 to Pred(AFTP.DirectoryListing.Count) do
if AFTP.DirectoryListing[i].ItemType = ditFile then  begin
showmessage(AFTP.DirectoryListing[i].FileName+ ' download in '+ALocalPath +
AFTP.DirectoryListing[i].FileName);

AFTP.Get( AFTP.DirectoryListing[i].FileName, ALocalPath + AFTP.DirectoryListing[i].FileName,true);
end;

{ Explore subfolders }
for I:=0 to Pred(AFTP.DirectoryListing.Count) do
if AFTP.DirectoryListing[i].ItemType = ditDirectory then
begin
{ Call DownloadFolder recursively }
DownloadFolder(AFTP, ARemotePath + AFTP.DirectoryListing[i].FileName,
ALocalPath + AFTP.DirectoryListing[i].FileName);
{ Re-set old directory as current directory }
//AFTP.ChangeDir(ARemotePath);
end;

end;

end.

