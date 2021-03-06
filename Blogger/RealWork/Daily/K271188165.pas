unit K271188165;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "DailyTest"
// �����: ����� �.�.
// ������: "w:/common/components/rtl/Garant/Daily/K271188165.pas"
// �����: 02.11.2011 12:39
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<TestCase::Class>> Shared Delphi Tests::DailyTest::7.7 Lulin::K271188165
//
// {RequestLink:271188165}
// {RequestLink:296625527}
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\Daily\TestDefine.inc.pas}

interface

{$If defined(nsTest) AND not defined(NoScripts)}
uses
  ScrollByArrowAndCheckShapesTest,
  Types
  {$If defined(nsTest) AND not defined(NoVCM)}
  ,
  PrimTextLoad_Form
  {$IfEnd} //nsTest AND not NoVCM
  ,
  evCustomEditorWindow
  ;
{$IfEnd} //nsTest AND not NoScripts

{$If defined(nsTest) AND not defined(NoScripts)}
type
 TK271188165 = class(TScrollByArrowAndCheckShapesTest)
  {* [RequestLink:271188165]
[RequestLink:296625527] }
 protected
 // realized methods
   function GetScrollCount: Integer; override;
 protected
 // overridden protected methods
   {$If defined(nsTest) AND not defined(NoVCM)}
   function WebStyle: Boolean; override;
   {$IfEnd} //nsTest AND not NoVCM
   {$If defined(nsTest) AND not defined(NoVCM)}
   function FormExtent: TPoint; override;
     {* ������� ����� }
   {$IfEnd} //nsTest AND not NoVCM
   function GetFolder: AnsiString; override;
     {* ����� � ������� ������ ���� }
   {$If defined(nsTest) AND not defined(NoVCM)}
   function QFLike: Boolean; override;
     {* ������� �����-�������� ��� ������ � ��. }
   {$IfEnd} //nsTest AND not NoVCM
   {$If defined(nsTest) AND not defined(NoVCM)}
   procedure DoBeforeDrawing(aForm: TPrimTextLoadForm); override;
     {* ���������� �����-������ �������� ����� ����������. }
   {$IfEnd} //nsTest AND not NoVCM
   function GetModelElementGUID: AnsiString; override;
     {* ������������� �������� ������, ������� ��������� ���� }
   procedure DoRepaint(aText: TevCustomEditorWindow); override;
 end;//TK271188165
{$IfEnd} //nsTest AND not NoScripts

implementation

{$If defined(nsTest) AND not defined(NoScripts)}
uses
  evOp,
  l3InternalInterfaces,
  Windows,
  Messages,
  TestFrameWork
  ;
{$IfEnd} //nsTest AND not NoScripts

{$If defined(nsTest) AND not defined(NoScripts)}

// start class TK271188165

function TK271188165.GetScrollCount: Integer;
//#UC START# *4D80BB670151_4EB1018F0204_var*
//#UC END# *4D80BB670151_4EB1018F0204_var*
begin
//#UC START# *4D80BB670151_4EB1018F0204_impl*
 Result := 9;
//#UC END# *4D80BB670151_4EB1018F0204_impl*
end;//TK271188165.GetScrollCount

{$If defined(nsTest) AND not defined(NoVCM)}
function TK271188165.WebStyle: Boolean;
//#UC START# *4C08CF4300BE_4EB1018F0204_var*
//#UC END# *4C08CF4300BE_4EB1018F0204_var*
begin
//#UC START# *4C08CF4300BE_4EB1018F0204_impl*
 Result := true;
//#UC END# *4C08CF4300BE_4EB1018F0204_impl*
end;//TK271188165.WebStyle
{$IfEnd} //nsTest AND not NoVCM

{$If defined(nsTest) AND not defined(NoVCM)}
function TK271188165.FormExtent: TPoint;
//#UC START# *4C08CF700318_4EB1018F0204_var*
//#UC END# *4C08CF700318_4EB1018F0204_var*
begin
//#UC START# *4C08CF700318_4EB1018F0204_impl*
 Result.X := 421;
 Result.Y := 213;
 //Result.X := 597;
 //Result.Y := 150{338};
//#UC END# *4C08CF700318_4EB1018F0204_impl*
end;//TK271188165.FormExtent
{$IfEnd} //nsTest AND not NoVCM

function TK271188165.GetFolder: AnsiString;
 {-}
begin
 Result := '7.7 Lulin';
end;//TK271188165.GetFolder

{$If defined(nsTest) AND not defined(NoVCM)}
function TK271188165.QFLike: Boolean;
//#UC START# *4CA0947C03CE_4EB1018F0204_var*
//#UC END# *4CA0947C03CE_4EB1018F0204_var*
begin
//#UC START# *4CA0947C03CE_4EB1018F0204_impl*
 Result := true;
//#UC END# *4CA0947C03CE_4EB1018F0204_impl*
end;//TK271188165.QFLike
{$IfEnd} //nsTest AND not NoVCM

{$If defined(nsTest) AND not defined(NoVCM)}
procedure TK271188165.DoBeforeDrawing(aForm: TPrimTextLoadForm);
//#UC START# *4CAC45AE011E_4EB1018F0204_var*
var
 l_Index : Integer;
//#UC END# *4CAC45AE011E_4EB1018F0204_var*
begin
//#UC START# *4CAC45AE011E_4EB1018F0204_impl*
 inherited;
 if not Il3CommandTarget(aForm.Text).ProcessCommand(ev_ocCharLeft, True, 1) then
  Assert(false);
 if not Il3CommandTarget(aForm.Text).ProcessCommand(ev_ocCharLeft, True, 1) then
  Assert(false);
 if not Il3CommandTarget(aForm.Text).ProcessCommand(ev_ocCharLeft, True, 1) then
  Assert(false);
 if not Il3CommandTarget(aForm.Text).ProcessCommand(ev_ocCharRight, True, 1) then
  Assert(false);
 for l_Index := 0 to 12 do
  aForm.Text.Perform(WM_VScroll, SB_LINEDOWN, 0);
 aForm.Text.Repaint;
//#UC END# *4CAC45AE011E_4EB1018F0204_impl*
end;//TK271188165.DoBeforeDrawing
{$IfEnd} //nsTest AND not NoVCM

function TK271188165.GetModelElementGUID: AnsiString;
 {-}
begin
 Result := '4EB1018F0204';
end;//TK271188165.GetModelElementGUID

procedure TK271188165.DoRepaint(aText: TevCustomEditorWindow);
//#UC START# *4EB100CE0160_4EB1018F0204_var*
const
 cDelta = 30;
var
 R : TRect;
//#UC END# *4EB100CE0160_4EB1018F0204_var*
begin
//#UC START# *4EB100CE0160_4EB1018F0204_impl*
 R.Left := 0;
 R.Right := cDelta * 2 {FormExtent.X div 2};
 R.Top := FormExtent.Y div 2 - cDelta;
 R.Bottom := R.Top + cDelta * 2 + cDelta;
 InvalidateRect(aText.Handle, @R, false);
 aText.Update;
//#UC END# *4EB100CE0160_4EB1018F0204_impl*
end;//TK271188165.DoRepaint

{$IfEnd} //nsTest AND not NoScripts

initialization
 TestFramework.RegisterTest(TK271188165.Suite);

end.