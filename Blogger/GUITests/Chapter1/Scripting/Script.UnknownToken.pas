unit Script.UnknownToken;

interface

uses
 Script.WordsInterfaces,
 Script.Word
 ;

type
 TscriptUnknownToken = class(TscriptWord)
  private
   f_String : String;
  protected
   procedure DoIt(aContext: TscriptContext); override;
  public
   constructor Create(const aString: String);
   class function Make(const aString: String): IscriptWord;
 end;//TscriptUnknownToken

implementation

constructor TscriptUnknownToken.Create(const aString: String);
begin
 inherited Create;
 f_String := aString;
end;

class function TscriptUnknownToken.Make(const aString: String): IscriptWord;
begin
 Result := Create(aString);
end;

procedure TscriptUnknownToken.DoIt(aContext: TscriptContext);
begin
 aContext.Log('Unknown token: ' + Self.f_String);
end;

end.
