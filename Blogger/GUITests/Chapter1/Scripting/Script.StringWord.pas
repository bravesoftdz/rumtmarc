unit Script.StringWord;

interface

uses
 Script.WordsInterfaces,
 Script.Word
 ;

type
 TscriptStringWord = class(TscriptWord)
  private
   f_String : String;
  protected
   procedure DoIt(aContext: TscriptContext); override;
  public
   constructor Create(const aString: String);
   class function Make(const aString: String): IscriptWord;
 end;//TscriptStringWord

implementation

constructor TscriptStringWord.Create(const aString: String);
begin
 inherited Create;
 f_String := aString;
end;

class function TscriptStringWord.Make(const aString: String): IscriptWord;
begin
 Result := Create(aString);
end;

procedure TscriptStringWord.DoIt(aContext: TscriptContext);
begin
 aContext.Log('������: "' + Self.f_String + '"');
 aContext.PushString(Self.f_String);
end;

end.
