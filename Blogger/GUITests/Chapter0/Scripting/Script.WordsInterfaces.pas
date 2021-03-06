unit Script.WordsInterfaces;

interface

uses
 Core.Obj,
 Script.Interfaces
 ;

type
 TscriptContext = class(TCoreObject)
  private
   f_Log : IscriptLog;
  protected
   procedure Cleanup; override;
  public
   constructor Create(const aLog: IscriptLog);
   procedure Log(const aString: String);
    {* - ������� ��������� � ���. }
 end;//TscriptContext

 TscriptCompileContext = class(TscriptContext)
 end;//TscriptCompileContext

 IscriptWord = interface
  procedure DoIt(aContext: TscriptContext);
   {* - ���������� ��������� ��� ���������� ����� �������. }
 end;//IscriptWord

implementation

constructor TscriptContext.Create(const aLog: IscriptLog);
begin
 inherited Create;
 f_Log := aLog;
end;

procedure TscriptContext.Log(const aString: String);
 {* - ������� ��������� � ���. }
begin
 if (f_Log <> nil) then
  f_Log.Log(aString);
end;

procedure TscriptContext.Cleanup;
begin
 f_Log := nil;
 inherited;
end;

end.
