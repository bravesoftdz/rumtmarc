unit MouseMoveSelectionTest;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Abstract Tests"
// ������: "w:/common/components/rtl/Garant/Abstract_Tests/MouseMoveSelectionTest.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<TestCase::Class>> Shared Delphi Tests::Abstract Tests::EditorTests::TMouseMoveSelectionTest
//
// ��������� � ������� �������� ����.
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\Abstract_Tests\TestDefine.inc.pas}

interface

{$If defined(nsTest) AND not defined(NoScripts)}
uses
  Classes
  {$If defined(nsTest) AND not defined(NoVCM)}
  ,
  TextViaEditorProcessor
  {$IfEnd} //nsTest AND not NoVCM
  ,
  evCustomEditorWindow,
  l3Units,
  nevTools
  {$If defined(nsTest) AND not defined(NoVCM)}
  ,
  PrimTextLoad_Form
  {$IfEnd} //nsTest AND not NoVCM
  
  ;
{$IfEnd} //nsTest AND not NoScripts

{$If defined(nsTest) AND not defined(NoScripts)}
type
 _ClipboardOperations_Parent_ = TTextViaEditorProcessor;
 {$Include w:\common\components\rtl\Garant\ScriptEngine\ClipboardOperations.imp.pas}
 _Para2Point_Parent_ = _ClipboardOperations_;
 {$Include w:\common\components\rtl\Garant\EditorUsers\Para2Point.imp.pas}
 TMouseMoveSelectionTest = {abstract} class(_Para2Point_)
  {* ��������� � ������� �������� ����. }
 protected
 // realized methods
   {$If defined(nsTest) AND not defined(NoVCM)}
   procedure Process(aForm: TPrimTextLoadForm); override;
     {* ���������� ������� ��������� ������ }
   {$IfEnd} //nsTest AND not NoVCM
 protected
 // overridden protected methods
   function GetFolder: AnsiString; override;
     {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
     {* ������������� �������� ������, ������� ��������� ���� }
 protected
 // protected fields
   f_StartPoint : Boolean;
 end;//TMouseMoveSelectionTest
{$IfEnd} //nsTest AND not NoScripts

implementation

{$If defined(nsTest) AND not defined(NoScripts)}
uses
  nevGUIInterfaces,
  TestFrameWork,
  l3Base,
  evOp,
  l3InternalInterfaces
  ;
{$IfEnd} //nsTest AND not NoScripts

{$If defined(nsTest) AND not defined(NoScripts)}

{$Include w:\common\components\rtl\Garant\ScriptEngine\ClipboardOperations.imp.pas}

{$Include w:\common\components\rtl\Garant\EditorUsers\Para2Point.imp.pas}

// start class TMouseMoveSelectionTest

{$If defined(nsTest) AND not defined(NoVCM)}
procedure TMouseMoveSelectionTest.Process(aForm: TPrimTextLoadForm);
//#UC START# *4BE13147032C_4D3D40C70045_var*
const
 cnSelectionStep = 500;
var
 l_X             : Integer;
 l_Map           : InevMap;
 l_l3Pt          : Tl3Point;
 l_Keys          : TevMouseState;
 l_Effect        : TevMouseEffect;
 l_FinishX       : Integer;
 l_EditorHotSpot : IevHotSpot;
//#UC END# *4BE13147032C_4D3D40C70045_var*
begin
//#UC START# *4BE13147032C_4D3D40C70045_impl*
 aForm.Text.Repaint;
 f_StartPoint := True;
 l_l3Pt := TranslatePara2Point(aForm.Text);
 l_EditorHotSpot := aForm.Text.HotSpotClass.Make(aForm.Text, nil);
 try
  // ������� ����� �������...
  l3FillChar(l_Effect, SizeOf(l_Effect), 0);
  l_Effect.rNeedAsyncLoop := True;
  l3FillChar(l_Keys, SizeOf(l_Keys), 0);
  l_Keys.rKeys := [];
  l_Keys.rInitialPoint := l_l3Pt;
  l_Keys.rPoint := l_l3Pt;
  l_EditorHotSpot.LButtonDown(aForm.Text.View, l_Keys, l_Effect);
  // �������� ����...
  f_StartPoint := False;
  l_X := l_l3Pt.X;
  l_l3Pt := TranslatePara2Point(aForm.Text);
  l_FinishX := l_l3Pt.X;
  l_Keys.rInMove := true;
  while l_X < l_FinishX do
  begin
   l_Keys.rPoint := l3Point(l_X, l_l3Pt.Y);
   l_EditorHotSpot.MouseMove(aForm.Text.View, l_Keys);
   Inc(l_X, cnSelectionStep);
  end; // while l_X < l_FinishX do
  l_EditorHotSpot.LButtonUp(aForm.Text.View, l_Keys);
 finally
  l_EditorHotSpot := nil;
 end;
 CopyAndPaste2DocumentBottom(aForm.Text);
//#UC END# *4BE13147032C_4D3D40C70045_impl*
end;//TMouseMoveSelectionTest.Process
{$IfEnd} //nsTest AND not NoVCM

function TMouseMoveSelectionTest.GetFolder: AnsiString;
 {-}
begin
 Result := 'EditorTests';
end;//TMouseMoveSelectionTest.GetFolder

function TMouseMoveSelectionTest.GetModelElementGUID: AnsiString;
 {-}
begin
 Result := '4D3D40C70045';
end;//TMouseMoveSelectionTest.GetModelElementGUID

{$IfEnd} //nsTest AND not NoScripts

end.