unit Script.WordsInterfaces;

interface

uses
 System.Generics.Collections,
 Core.Obj,
 Script.Interfaces
 ;

type
 TscriptValueType = (script_vtUnknown, script_vtString, script_vtObject);

 TscriptValue = record
  public
   rValueType : TscriptValueType;
  private
   rAsString : String;
   rAsObject : TObject;
  public
   constructor Create(const aString: String); overload;
   constructor Create(anObject: TObject); overload;
   function AsString: String;
   function AsObject: TObject;
 end;//TscriptValue

 TscriptValuesStack = TList<TscriptValue>;

 TscriptContext = class(TCoreObject)
  private
   f_Log : IscriptLog;
   f_Stack : TscriptValuesStack;
  protected
   procedure Cleanup; override;
  public
   constructor Create(const aLog: IscriptLog);
   procedure Log(const aString: String);
    {* - ������� ��������� � ���. }
   function PopString: String;
   procedure PushString(const aString: String);
   function PopObject: TObject;
   procedure PushObject(const anObject: TObject);
 end;//TscriptContext

 IscriptCompiler = interface;

 TscriptCompileContext = class(TscriptContext)
  private
   f_Parser : IscriptParser;
   f_Compiler : IscriptCompiler;
  protected
   procedure Cleanup; override;
  public
   constructor Create(const aLog      : IscriptCompileLog;
                      const aParser   : IscriptParser;
                      const aCompiler : IscriptCompiler);
   property Parser: IscriptParser
    read f_Parser;
   property Compiler: IscriptCompiler
    read f_Compiler;
 end;//TscriptCompileContext

 TscriptRunContext = class(TscriptContext)
  public
   constructor Create(const aLog: IscriptRunLog);
 end;//TscriptRunContext

 IscriptWord = interface
  {* - ����� ���������� ������. }
  procedure DoIt(aContext: TscriptContext);
   {* - ���������� ��������� ��� ���������� ����� �������. }
 end;//IscriptWord

 IscriptCode = interface
  {* - ��������������� ��� ���������� ������. }
  procedure Run(aContext : TscriptRunContext);
   {* - ��������� ��������������� ���. }
 end;//IscriptCode

 IscriptCompiler = interface
  {* - ���������� ���� ���������� ������. }
   procedure CompileWord(const aWord: IscriptWord);
    {* - ����������� ��������� ����� � ���. }
   function CompiledCode: IscriptCode;
    {* - ���������������� ��� }
 end;//IscriptCompiler

implementation

uses
 System.SysUtils
 ;

// TscriptValue

constructor TscriptValue.Create(const aString: String);
begin
 inherited;
 rValueType := script_vtString;
 rAsString := aString;
end;

constructor TscriptValue.Create(anObject: TObject);
begin
 inherited;
 rValueType := script_vtObject;
 rAsObject := anObject;
end;

function TscriptValue.AsString: String;
begin
 Assert(rValueType = script_vtString);
 Result := rAsString;
end;

function TscriptValue.AsObject: TObject;
begin
 Assert(rValueType = script_vtObject);
 Result := rAsObject;
end;

// TscriptContext

constructor TscriptContext.Create(const aLog: IscriptLog);
begin
 inherited Create;
 f_Log := aLog;
 f_Stack := TscriptValuesStack.Create;
end;

procedure TscriptContext.Log(const aString: String);
 {* - ������� ��������� � ���. }
begin
 if (f_Log <> nil) then
  f_Log.Log(aString);
end;

function TscriptContext.PopString: String;
begin
 Assert(f_Stack.Count > 0);
 Result := f_Stack.Last.AsString;
 f_Stack.Delete(f_Stack.Count - 1);
end;

procedure TscriptContext.PushString(const aString: String);
begin
 f_Stack.Add(TscriptValue.Create(aString));
end;

function TscriptContext.PopObject: TObject;
begin
 Assert(f_Stack.Count > 0);
 Result := f_Stack.Last.AsObject;
 f_Stack.Delete(f_Stack.Count - 1);
end;

procedure TscriptContext.PushObject(const anObject: TObject);
begin
 f_Stack.Add(TscriptValue.Create(anObject));
end;

procedure TscriptContext.Cleanup;
begin
 f_Log := nil;
 FreeAndNil(f_Stack);
 inherited;
end;

// TscriptCompileContext

constructor TscriptCompileContext.Create(const aLog      : IscriptCompileLog;
                                         const aParser   : IscriptParser;
                                         const aCompiler : IscriptCompiler);
begin
 Assert(aParser <> nil);
 Assert(aCompiler <> nil);
 inherited Create(aLog);
 f_Parser := aParser;
 f_Compiler := aCompiler;
end;

procedure TscriptCompileContext.Cleanup;
begin
 f_Parser := nil;
 f_Compiler := nil;
 inherited;
end;

// TscriptRunContext

constructor TscriptRunContext.Create(const aLog: IscriptRunLog);
begin
 inherited Create(aLog);
end;

end.
