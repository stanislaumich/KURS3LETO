unit UMain;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
    Vcl.ExtCtrls, GIFImg,
    Vcl.ComCtrls;

type
    TForm1 = class(TForm)
        Label1: TLabel;
        GroupBox1: TGroupBox;
        RadioButton1: TRadioButton;
        RadioButton2: TRadioButton;
        RadioButton3: TRadioButton;
        RadioButton4: TRadioButton;
        RadioButton5: TRadioButton;
        RadioButton6: TRadioButton;
        Edit1: TEdit;
        OpenDialog1: TOpenDialog;
        BitBtn1: TBitBtn;
        BitBtn2: TBitBtn;
        Image1: TImage;
        Timer1: TTimer;
        ProgressBar1: TProgressBar;
        procedure BitBtn1Click(Sender: TObject);
        procedure BitBtn2Click(Sender: TObject);
        procedure Method1;
        procedure Method2;
        procedure Method3;
        procedure Method4;
        procedure Method5;
        procedure Method6;
    private
        Gif: TGifImage;
    public
        { Public declarations }
    end;

var
    Form1: TForm1;

implementation

{$R *.dfm}

// ----------------------------
procedure TForm1.Method1;
var
    f: file of byte;
    Size: Longint;
    i: Longint;
    c: byte;
begin
    {
      ��� ������� �� �����.
      � ������ ��� ���� ���������������� �������� ������,
      ������ � ���������� ������,
      ������ - ��������� ������������������� �� ����� � ������.
    }
    Randomize;
    AssignFile(f, Edit1.Text);
    ProgressBar1.min := 0;
    Reset(f);
    Size := Filesize(f);
    ProgressBar1.Max := 3;
    ProgressBar1.Position := 0;
    c := 0;
    For i := 0 to Size - 1 do
    begin
        seek(f, i);
        write(f, c);
    end;
    ProgressBar1.Position := 1;
    Application.ProcessMessages;
    c := 255;
    For i := 0 to Size - 1 do
    begin
        seek(f, i);
        write(f, c);
    end;
    ProgressBar1.Position := 2;
    Application.ProcessMessages;

    For i := 0 to Size - 1 do
    begin
        seek(f, i);
        c := Random(255);
        write(f, c);
    end;
    ProgressBar1.Position := 3;
    Application.ProcessMessages;
    CloseFile(f);
end;

procedure TForm1.Method2;
var
    f: file;
begin
    If OpenDialog1.Execute() then
        Edit1.Text := OpenDialog1.FileName;
end;

procedure TForm1.Method3;
var
    f: file;
begin
    If OpenDialog1.Execute() then
        Edit1.Text := OpenDialog1.FileName;
end;

procedure TForm1.Method4;
var
    f: file;
begin
    If OpenDialog1.Execute() then
        Edit1.Text := OpenDialog1.FileName;
end;

procedure TForm1.Method5;
var
    f: file;
begin
    If OpenDialog1.Execute() then
        Edit1.Text := OpenDialog1.FileName;
end;

procedure TForm1.Method6;
var
    f: file;
begin
    If OpenDialog1.Execute() then
        Edit1.Text := OpenDialog1.FileName;
end;

// -------------------------------------------
procedure TForm1.BitBtn1Click(Sender: TObject);
begin
    If OpenDialog1.Execute() then
        Edit1.Text := OpenDialog1.FileName;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
    If RadioButton1.Checked then
        Method1;
    If RadioButton2.Checked then
        Method2;
    If RadioButton3.Checked then
        Method3;
    If RadioButton4.Checked then
        Method4;
    If RadioButton5.Checked then
        Method5;
    If RadioButton6.Checked then
        Method6;
    ShowMessage('��������� ����� ��������� �������');
end;

end.
