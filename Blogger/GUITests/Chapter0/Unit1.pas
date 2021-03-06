unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Rtti, System.Classes,
  System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs,
  FMX.StdCtrls, FMX.Edit, FMX.Layouts, FMX.Memo,
  Script.Interfaces
  ;

type
  TForm1 = class(TForm, IscriptLog)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Run: TButton;
    TokensLog: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure RunClick(Sender: TObject);
  private
    { Private declarations }
   procedure Log(const aString: String);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
 Script.Engine
 ;

{$R *.fmx}

procedure TForm1.Log(const aString: String);
begin
 TokensLog.Lines.Add(aString);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 Edit1.Text := (Sender As TButton).Text;
end;

procedure TForm1.RunClick(Sender: TObject);
begin
 TScriptEngine.RunScript('FirstScript.script', Self);
end;

end.
