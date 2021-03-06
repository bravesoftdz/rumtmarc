program VCLProject;

uses
  Vcl.Forms,
  Script.Engine in 'Scripting\Script.Engine.pas',
  Script.Parser in 'Scripting\Script.Parser.pas',
  Script.Interfaces in 'Scripting\Script.Interfaces.pas',
  Core.Obj in 'Core\Core.Obj.pas',
  Testing.Engine in 'Testing\Testing.Engine.pas',
  Script.WordsInterfaces in 'Scripting\Script.WordsInterfaces.pas',
  Script.Code in 'Scripting\Script.Code.pas',
  Script.Dictionary in 'Scripting\Script.Dictionary.pas',
  Script.Word in 'Scripting\Script.Word.pas',
  Script.StringWord in 'Scripting\Script.StringWord.pas',
  Script.UnknownToken in 'Scripting\Script.UnknownToken.pas',
  Script.Axiomatics in 'Scripting\Script.Axiomatics.pas',
  Script.Word.Examples in 'Scripting\Script.Word.Examples.pas',
  Script.Word.Buttons in 'Scripting\Script.Word.Buttons.pas',
  VCLForm1 in 'VCLForm1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
