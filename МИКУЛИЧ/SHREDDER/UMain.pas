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
    f: file of byte;
    Size: Longint;
    i: Longint;
    c: byte;
begin
    { ���� ���������� ��� �������: �� ������ ���� ����������
      ������������������� �� ������� ���,
      � �� ������ � ��������� �������������������. }
    Randomize;
    AssignFile(f, Edit1.Text);
    ProgressBar1.min := 0;
    Reset(f);
    Size := Filesize(f);
    ProgressBar1.Max := 2;
    ProgressBar1.Position := 0;
    c := 0;
    For i := 0 to Size - 1 do
    begin
        seek(f, i);
        write(f, c);
    end;
    ProgressBar1.Position := 1;
    Application.ProcessMessages;
    For i := 0 to Size - 1 do
    begin
        seek(f, i);
        c := Random(255);
        write(f, c);
    end;
    ProgressBar1.Position := 2;
    Application.ProcessMessages;
    CloseFile(f);
end;

procedure TForm1.Method3;
var
    f: file of byte;
    Size: Longint;
    i: Longint;
    c: byte;
begin
    { ������ ������ �������������� ���� ������������������� �����. }
    AssignFile(f, Edit1.Text);
    ProgressBar1.min := 0;
    Reset(f);
    Size := Filesize(f);
    ProgressBar1.Max := 1;
    ProgressBar1.Position := 0;
    c := 0;
    For i := 0 to Size - 1 do
    begin
        seek(f, i);
        write(f, c);
    end;
    ProgressBar1.Position := 1;
    Application.ProcessMessages;
    CloseFile(f);
end;

procedure TForm1.Method4;
var
    f: file of byte;
    Size: Longint;
    i, j: Longint;
    c: byte;
begin
    { �������������� ��������. ������� �����������
      ��� ������� � ���������������� ����� ��������
      � ���������� ��������������������. ����� ���
      ��� ������� ����������� ��� ��� ����.
      � ������� ������ �� ��������� ������������������. }
    Randomize;
    AssignFile(f, Edit1.Text);
    ProgressBar1.min := 0;
    Reset(f);
    Size := Filesize(f);
    ProgressBar1.Max := 7;
    ProgressBar1.Position := 0;
    for j := 1 to 3 do
    begin
        c := 0;
        For i := 0 to Size - 1 do
        begin
            seek(f, i);
            write(f, c);
        end;
        ProgressBar1.Position := ProgressBar1.Position + 1;
        Application.ProcessMessages;
        c := 255;
        For i := 0 to Size - 1 do
        begin
            seek(f, i);
            write(f, c);
        end;
        ProgressBar1.Position := ProgressBar1.Position + 1;
        Application.ProcessMessages;
    end;
    For i := 0 to Size - 1 do
    begin
        seek(f, i);
        c := Random(255);
        write(f, c);
    end;
    ProgressBar1.Position := ProgressBar1.Position + 1;
    Application.ProcessMessages;
    CloseFile(f);

end;

procedure TForm1.Method5;
var
    f: file of byte;
    Size: Longint;
    i, j: Longint;
    c: byte;
begin
    { ����� �������������� ��������.
      ?	������ ������ � ���������� ����� ������������������� ������� ���.
      ?	������ ������ ����������� ����� ������������������� ��������� ���.
      ?	������� � 3 �� 7 � ���������� ��������� �������������������.
    }

    Randomize;
    AssignFile(f, Edit1.Text);
    ProgressBar1.min := 0;
    Reset(f);
    Size := Filesize(f);
    ProgressBar1.Max := 7;
    ProgressBar1.Position := 0;

    begin
        c := 0;
        For i := 0 to Size - 1 do
        begin
            seek(f, i);
            write(f, c);
        end;
        ProgressBar1.Position := ProgressBar1.Position + 1;
        Application.ProcessMessages;
        c := 255;
        For i := 0 to Size - 1 do
        begin
            seek(f, i);
            write(f, c);
        end;
        ProgressBar1.Position := ProgressBar1.Position + 1;
        Application.ProcessMessages;
        for j := 1 to 4 do
            For i := 0 to Size - 1 do
            begin
                seek(f, i);
                c := Random(255);
                write(f, c);
            end;
        ProgressBar1.Position := ProgressBar1.Position + 1;
        Application.ProcessMessages;
    end;
    CloseFile(f);

end;

procedure TForm1.Method6;
const
a:array[5..31] of byte=($55,$AA,$92,$49,$24,$00,$11,$22,$33,$44,$55,$66,$77,
$88,$99,$AA,$BB,$CC,$DD,$EE,$FF,$92,$49,$24,$6D,$B6,$DB);
var
    f: file of byte;
    Size: Longint;
    i, j: Longint;
    c: byte;
begin
 {
  � ������ ������ ������� ������������ �������� ��������� ������� � ������ ���� ������� �������,
  � 5 �� 31 ������ ���������� ������ ������������ ������������������ �������� �� ����������� �������,
   � ��������� 4 ������� ����� ������������ �������� ��������� �������.

5 	01010101 01010101 01010101 	55 55 55
6 	10101010 10101010 10101010 	AA AA AA
7 	10010010 01001001 00100100 	92 49 24
8 	01001001 00100100 10010010 	49 24 92
9 	00100100 10010010 01001001 	24 92 49
10 	00000000 00000000 00000000 	00 00 00
11 	00010001 00010001 00010001 	11 11 11
12 	00100010 00100010 00100010 	22 22 22
13 	00110011 00110011 00110011 	33 33 33
14 	01000100 01000100 01000100 	44 44 44
15 	01010101 01010101 01010101 	55 55 55
16 	01100110 01100110 01100110 	66 66 66
17 	01110111 01110111 01110111 	77 77 77
18 	10001000 10001000 10001000 	88 88 88
19 	10011001 10011001 10011001 	99 99 99
20 	10101010 10101010 10101010 	AA AA AA
21 	10111011 10111011 10111011 	BB BB BB
22 	11001100 11001100 11001100 	CC CC CC
23 	11011101 11011101 11011101 	DD DD DD
24 	11101110 11101110 11101110 	EE EE EE
25 	11111111 11111111 11111111 	FF FF FF
26 	10010010 01001001 00100100 	92 49 24
27 	01001001 00100100 10010010 	49 24 92
28 	00100100 10010010 01001001 	24 92 49
29 	01101101 10110110 11011011 	6D B6 DB
30 	10110110 11011011 01101101 	B6 DB 6D
31 	11011011 01101101 10110110 	DB 6D B6
 }
 Randomize;
    AssignFile(f, Edit1.Text);
    ProgressBar1.min := 0;
    Reset(f);
    Size := Filesize(f);
    ProgressBar1.Max := 35;
    ProgressBar1.Position := 0;

        for j := 1 to 4 do begin
        c := 0;
        For i := 0 to Size - 1 do
        begin
            seek(f, i);
                c := Random(255);
                write(f,c);
        end;
        ProgressBar1.Position := ProgressBar1.Position + 1;
        Application.ProcessMessages;
        end;

        for j := 5 to 31 do begin
        c := a[j];
        For i := 0 to Size - 1 do
        begin
            seek(f, i);
            write(f, c);
        end;
        ProgressBar1.Position := ProgressBar1.Position + 1;
        Application.ProcessMessages;
        end;

        for j := 1 to 4 do
        begin
            For i := 0 to Size - 1 do
            begin
                seek(f, i);
                c := Random(255);
                write(f, c);
            end;
        ProgressBar1.Position := ProgressBar1.Position + 1;
        Application.ProcessMessages;
       end;
    CloseFile(f);



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
