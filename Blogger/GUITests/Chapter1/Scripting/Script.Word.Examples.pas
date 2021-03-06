unit Script.Word.Examples;

interface

uses
 Script.WordsInterfaces,
 Script.Word
 ;

type
 TscriptWordExample1 = class(TscriptWord)
  protected
   procedure DoIt(aContext: TscriptContext); override;
 end;//TscriptWordExample1

 TscriptWordExample2 = class(TscriptWord)
  protected
   procedure DoIt(aContext: TscriptContext); override;
 end;//TscriptWordExample2

implementation

uses
 Script.Engine
 ;

// TscriptWordExample1

procedure TscriptWordExample1.DoIt(aContext: TscriptContext);
begin
 aContext.Log('Example 1');
end;

// TscriptWordExample2

procedure TscriptWordExample2.DoIt(aContext: TscriptContext);
begin
 aContext.Log('Example 2');
end;

initialization
 TscriptEngine.RegisterKeyWord('DoNothing', TscriptWordExample1);
 TscriptEngine.RegisterKeyWord('DoNothing2', TscriptWordExample2);

end.
