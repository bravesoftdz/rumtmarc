unit Script.Word.Buttons;

interface

uses
 Script.WordsInterfaces,
 Script.Word
 ;

type
 TkwFindComponent = class(TscriptWord)
  protected
   procedure DoIt(aContext: TscriptContext); override;
 end;//TkwFindComponent

 TkwButtonClick = class(TscriptWord)
  protected
   procedure DoIt(aContext: TscriptContext); override;
 end;//TkwButtonClick

 implementation

uses
 System.Classes,

 Script.Engine,

 FMX.Controls,
 FMX.StdCtrls,
 FMX.Forms
 ;

// TkwFindComponent

procedure TkwFindComponent.DoIt(aContext: TscriptContext);
var
 l_Name : String;
 l_Component : TComponent;
begin
 aContext.Log(ClassName);
 l_Name := aContext.PopString;
 Assert(l_Name <> '');
 l_Component := Screen.ActiveForm.FindComponent(l_Name);
 Assert(l_Component <> nil);
 aContext.PushObject(l_Component);
end;

// TkwButtonClick

type
 TControlAccess = class(TControl)
 end;//TControlAccess

procedure TkwButtonClick.DoIt(aContext: TscriptContext);
var
 l_Component : TComponent;
begin
 aContext.Log(ClassName);
 l_Component := aContext.PopObject As TComponent;
 Assert(l_Component Is TButton);
 TControlAccess(l_Component).Click;
end;

initialization
 TscriptEngine.RegisterKeyWord('FindComponent', TkwFindComponent);
 TscriptEngine.RegisterKeyWord('ButtonClick', TkwButtonClick);

end.
