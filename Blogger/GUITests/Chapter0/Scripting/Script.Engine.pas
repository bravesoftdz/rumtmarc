unit Script.Engine;

interface

uses
 Script.Interfaces
 ;

type
 TscriptEngine = class
   public
    class procedure RunScript(const aFileName: String; const aLog: IscriptLog);
 end;//TscriptEngine

implementation

uses
 System.SysUtils,
 Script.Parser,
 Testing.Engine,
 Script.Code,
 Script.WordsInterfaces
;

class procedure TscriptEngine.RunScript(const aFileName: String; const aLog: IscriptLog);
var
 l_Parser : TscriptParser;
 l_Context : TscriptCompileContext;
begin
 TtestEngine.StartTest(aFileName);
 try
  l_Context := TscriptCompileContext.Create(aLog);
  try
   l_Parser := TscriptParser.Create(aFileName);
   try
    while not l_Parser.EOF do
    begin
     l_Parser.NextToken;
     if (aLog <> nil) then
      aLog.Log(l_Parser.TokenString)
    end;//while not l_Parser.EOF
   finally
    FreeAndNil(l_Parser);
   end;//try..finally
  finally
   FreeAndNil(l_Context);
  end;//try..finally
 finally
  TtestEngine.StopTest;
 end;//try..finally
end;

end.
