unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ShellAPI;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Button1: TButton;
    GroupBox2: TGroupBox;
    Button2: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    ListBox1: TListBox;
    Edit3: TEdit;
    Button3: TButton;
    Button4: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Label2: TLabel;
    Edit4: TEdit;
    Button5: TButton;
    Edit2: TEdit;
    Label3: TLabel;
    Button6: TButton;
    Button7: TButton;
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
{$R *.dfm}
uses ComObj, ActiveX, ShlObj, Registry;

const
  { Registry key where Folder information is kept }
  SFolderKey = '\Software\Microsoft\Windows\CurrentVersion\' +
    'Explorer\Shell Folders';



function GetFolderLocation(const FolderType: string): string;
{ Retrieves from registry path to folder indicated in FolderType }
begin
  with TRegistry.Create do
  try
    RootKey := HKEY_CURRENT_USER;
    if not OpenKey(SFolderKey, False) then
      { open key where shell folder information is kept. }
      raise ERegistryException.CreateFmt('Folder key "%s" not found',
        [SFolderKey]);
    { Get path for specified folder }
    Result := ReadString(FolderType);
    if Result = '' then
      raise ERegistryException.CreateFmt('"%s" item not found in registry',
        [FolderType]);
    CloseKey;
  finally
    Free;
  end;
end;

procedure MakeLNK(AppName:string);
var
  SL: IShellLink;
  PF: IPersistFile;
  LnkName: WideString;
begin
  OleCheck(CoCreateInstance(CLSID_ShellLink, nil, CLSCTX_INPROC_SERVER,
    IShellLink, SL));
  { IShellLink implementers are required to implement IPersistFile }
  PF := SL as IPersistFile;
  OleCheck(SL.SetPath(PChar(AppName))); // set link path to proper file
  { create a path location and filename for link file }
  LnkName := GetFolderLocation('Desktop') + '\' +
    ChangeFileExt(ExtractFileName(AppName), '.lnk');
  PF.Save(PWideChar(LnkName), True); // save link file
end;

function CreateDirEx(Dir: string): boolean;
var
  i, L  : integer;
  CurDir: string;
begin
  if ExcludeTrailingBackslash(Dir) = '' then
    exit;
  Dir   := IncludeTrailingBackslash(Dir);
  L     := length(Dir);
  for i := 1 to L do
  begin
    CurDir := CurDir + Dir[i];
    if Dir[i] = '\' then
    begin
      if not DirectoryExists(CurDir) then
        if not CreateDir(CurDir) then
          exit;
    end;
  end;
  result := true;
end;

function CopyFile(FromPath, ToPath: string): integer;
var
  F1        : file;
  F2        : file;
  NumRead   : integer;
  NumWritten: integer;
  Buf       : pointer;
   BufSize: longint;
  Totalbytes: longint;
  TotalRead : longint;
begin
  result := 0;
  Assignfile(F1, FromPath);
  Assignfile(F2, ToPath);
  Reset(F1, 1);
  Totalbytes := Filesize(F1);
  Rewrite(F2, 1);
  // BufSize := 16384;
  GetMem(Buf, Bufsize);
  TotalRead := 0;
  repeat
    BlockRead(F1, Buf^, Bufsize, NumRead);
    inc(TotalRead, NumRead);
    BlockWrite(F2, Buf^, NumRead, NumWritten);
    Application.ProcessMessages;
  until (NumRead = 0) or (NumWritten <> NumRead);
  if (NumWritten <> NumRead) then
  begin
    // ошибка
    result := -1;
  end;
  Closefile(F1);
  Closefile(F2);
end;

Procedure ListFileDir(Path: string; FileList: TStrings; mask: string);
var
  SR: TSearchRec;
begin
  if FindFirst(Path + mask, faAnyFile, SR) = 0 then
  begin
    repeat
      if (SR.Attr <> faDirectory) then
      begin
        FileList.Add(Path + SR.Name);
      end;
    until FindNext(SR) <> 0;
    FindClose(SR);
  end;
end;

Function OpenFolder(form1: tform): string;
var
  TitleName  : string;
  lpItemID   : PItemIDList;
  BrowseInfo : TBrowseInfo;
  DisplayName: array [0 .. MAX_PATH] of char;
  TempPath   : array [0 .. MAX_PATH] of char;
begin
  FillChar(BrowseInfo, sizeof(TBrowseInfo), #0);
  BrowseInfo.hwndOwner      := form1.handle;
  BrowseInfo.pszDisplayName := @DisplayName;
  TitleName                 := 'Выберите папку ';
  BrowseInfo.lpszTitle      := PChar(TitleName);
  BrowseInfo.ulFlags        := BIF_RETURNONLYFSDIRS;
  lpItemID                  := SHBrowseForFolder(BrowseInfo);
  if lpItemID <> nil then
  begin
    SHGetPathFromIDList(lpItemID, TempPath);
    // ShowMessage(TempPath);
    GlobalFreePtr(lpItemID);
  end;
  OpenFolder := TempPath;
end;


function ExecAndWait(aCmd: string; WaitTimeOut: cardinal = INFINITE): cardinal;
var
  si : STARTUPINFO;
  pi : PROCESS_INFORMATION;
  res: BOOL;
  r  : cardinal;
begin
  with si do
  begin
    cb          := sizeof(si);
    lpReserved  := nil;
    lpDesktop   := nil;
    lpTitle     := PChar('External program "' + aCmd + '"');
    dwFlags     := 0;
    cbReserved2 := 0;
    lpReserved2 := nil;
  end;
  res := CreateProcess(nil, PChar(aCmd), nil, nil, false, 0, nil, nil, si, pi);
  if res then
    WaitForSingleObject(pi.hProcess, WaitTimeOut);
  GetExitCodeProcess(pi.hProcess, r);
  result := r;
end;

procedure TForm1.Button1Click(Sender: TObject);
 var
  s,p,pk:string;
  i:integer;
  f,fi:textfile;
begin
p:=extractfilepath(paramstr(0))+'\'+'TMP';
CreateDirEx(p);
Savedialog1.InitialDir:=p+'\';



  // тут мы собственно выполняем все действия по формированию пакета

     assignfile(f,extractfilepath(paramstr(0))+'\install.stp');
     rewrite(f);
     assignfile(fi,extractfilepath(paramstr(0))+'\install.lst');
     rewrite(fi);
     Writeln(f,extractfilename(edit3.text));
     //Writeln(f,edit4.text);
     for I := 0 to ListBox1.Items.Count-1 do
     begin
      Copyfile(ListBox1.Items[i],p+'\'+extractfilename(ListBox1.Items[i]));
      Writeln(f,extractfilename(ListBox1.Items[i]));
      Writeln(fi,extractfilepath(paramstr(0))+'TMP\'+extractfilename(ListBox1.Items[i]));
     end;
     // запаковать и сложить в папку
     //ExecAndWait(extractfilepath(paramstr(0)+'\make.cmd'));
     ShellExecute(Form1.Handle, 'open', PChar(extractfilepath(paramstr(0))+'\make.cmd'), PChar(''), nil, SW_HIDE);
     closefile(f);
     closefile(fi);
    //end;
    // помещаем штсталлятор вцелевую папку
    CreateDirEx(edit4.text);
    //Copyfile(extractfilepath(paramstr(0))+'\install.exe',edit4.text+'\install.exe');
    Copyfile(extractfilepath(paramstr(0))+'\install.rar',edit4.text+'\install.rar');
    Copyfile(extractfilepath(paramstr(0))+'\install.stp',edit4.text+'\install.stp');
    Copyfile(extractfilepath(paramstr(0))+'\rar.exe',edit4.text+'\rar.exe');
    Copyfile(extractfilepath(paramstr(0))+'\restore.cmd',edit4.text+'\restore.cmd');
  ShowMessage('Пакет создан!');
end;

procedure TForm1.Button2Click(Sender: TObject);
var
 p, pd,s,ls:string;
 f, fi:textfile;
begin
  if OpenDialog1.Execute  then
  begin
   EDit1.TExt:=OpenDialog1.FileName;
   p:=extractfilepath(Edit2.Text);
   ShellExecute(Form1.Handle, 'open', PChar(extractfilepath(paramstr(0))+'\restore.cmd'), PChar(''), nil, SW_HIDE);
   CreateDirEx(Edit1.Text);
   assignfile(fi,Edit1.Text);
   reset(fi);
   ReadLn(fi,ls);

   while not eof(fi)  do
    begin
     ReadLn(fi,s);
     Copyfile(extractfilepath(paramstr(0))+'\'+s,edit2.text+'\'+s);
    end;



   Closefile(fi);
   MakeLNK(EDit2.TExt+'\'+ls);
   ShowMessage('Пакет установлен!');
  end
  else Edit1.TExt:='';
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
 if OpenDialog1.Execute  then
  begin
   EDit3.TExt:=OpenDialog1.FileName;
  end
  else Edit3.TExt:='';
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
 if OpenDialog1.Execute  then
  begin
  ListBox1.Items.Clear;
   ListBox1.Items:=OpenDialog1.Files;
  end;

end;

procedure TForm1.Button5Click(Sender: TObject);
begin
 Edit4.TExt:= OpenFolder(form1);

end;

procedure TForm1.Button6Click(Sender: TObject);
begin
 Edit2.TExt:= OpenFolder(form1);
end;

end.
