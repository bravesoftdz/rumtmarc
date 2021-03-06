unit evQueryCardEditorHotSpot;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest"
// �����: ����� �.�.
// ������: "w:/common/components/gui/Garant/Everest/evQueryCardEditorHotSpot.pas"
// �����: 30.09.2008 16:44
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi::Everest::QueryCard::TevQueryCardEditorHotSpot
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\Everest\evDefine.inc}

interface

uses
  nevTools,
  evEditorWindowHotSpot,
  nevBase
  ;

type
 TevQueryCardEditorHotSpot = class(TevEditorWindowHotSpot)
 private
 // private fields
   f_CursorPoint : InevBasePoint;
    {* ������� ������� �� ������ ���������}
 protected
 // overridden protected methods
   procedure DoBeforeSelection(const aView: InevControlView); override;
     {* ���������� ����� ������ ��������� }
   function NeedSelectCursor(const aView: InevControlView;
    const aPt: TnevPoint): Boolean; override;
     {* ��������� ������������ ��������� ��� �������� ���� �, ����
             ��������� ������������� �� ��������� ���������-�������, ��
             ������������ � ����������� � DoBeforeSelection ����� }
   function CheckCursorPos(const aView: InevView): Boolean; override;
     {* ���������� ��� �������� ���������������� ������� �/��� ���������
             ���������. ����������� ����� ���������� ������ ����, ����
             ���������� �� ���� ����������� ����� �������� }
   function DoLButtonDoubleClick(const aView: InevControlView;
    const Keys: TevMouseState;
    var Effect: TevMouseEffect): Boolean; override;
   function DoLButtonDown(const aView: InevControlView;
    const aKeys: TevMouseState;
    var Effect: TevMouseEffect): Boolean; override;
 end;//TevQueryCardEditorHotSpot

implementation

uses
  k2Tags,
  evControlParaConst,
  SysUtils,
  evQueryCardInt,
  evdTypes,
  evQueryCardEditor,
  l3Interfaces
  ;

// start class TevQueryCardEditorHotSpot

procedure TevQueryCardEditorHotSpot.DoBeforeSelection(const aView: InevControlView);
//#UC START# *48E4A900029B_48E2366202B9_var*
//#UC END# *48E4A900029B_48E2366202B9_var*
begin
//#UC START# *48E4A900029B_48E2366202B9_impl*
 f_CursorPoint := (Owner As TevQueryCardEditor).Selection.Cursor.ClonePoint(aView);
//#UC END# *48E4A900029B_48E2366202B9_impl*
end;//TevQueryCardEditorHotSpot.DoBeforeSelection

function TevQueryCardEditorHotSpot.NeedSelectCursor(const aView: InevControlView;
  const aPt: TnevPoint): Boolean;
//#UC START# *48E4A93300A9_48E2366202B9_var*
var
 l_Point: InevBasePoint;
//#UC END# *48E4A93300A9_48E2366202B9_var*
begin
//#UC START# *48E4A93300A9_48E2366202B9_impl*
 with (Owner As TevQueryCardEditor), Selection do
 begin
   l_Point := Cursor.ClonePoint(aView);
   inherited NeedSelectCursor(aView, aPt);
   Result := TevControlType(Cursor.MostInner.Obj.IntA[k2_tiType]) in evEditControls;
   if not Result then
    InevSelection(Selection).SelectPoint(l_Point, False);
 end;//with (Owner As TevQueryCardEditor).Selection do
//#UC END# *48E4A93300A9_48E2366202B9_impl*
end;//TevQueryCardEditorHotSpot.NeedSelectCursor

function TevQueryCardEditorHotSpot.CheckCursorPos(const aView: InevView): Boolean;
//#UC START# *48E4A96000D4_48E2366202B9_var*
var
 l_CursorTag: PInevObject;
 l_ParaType: TevControlType;
 l_Para: IevControlFriend;
 l_Field : IevEditorControlField;
 l_Cal: IevEditorCalendarField;
//#UC END# *48E4A96000D4_48E2366202B9_var*
begin
//#UC START# *48E4A96000D4_48E2366202B9_impl*
 try
  with (Owner As TevQueryCardEditor) do
  begin
   l_CursorTag := Selection.Cursor.MostInner.Obj;
   l_ParaType := TevControlType(l_CursorTag.IntA[k2_tiType]);
   if (f_CursorPoint <> nil) and
    not (l_ParaType in evEditControls) then
   begin
    InevSelection(Selection).SelectPoint(f_CursorPoint, False);
    //SetFlag(ev_uwfCursor);
    Update;
    Result := False;
   end
   else
   if Assigned(f_CursorPoint) and not l_CursorTag.IsSame(f_CursorPoint.MostInner.Obj^) and
    l_CursorTag.QT(IevControlFriend, l_Para, Processor) and Assigned(l_Para) and
    Supports(l_Para.GetControl, IevEditorControlField, l_Field) and l_Field.SelectAllOnFocus then
   begin
    InevSelection(Selection).SelectPoint(l_Para.MakePoint, False);
    InevSelection(Selection).Unselect;
    if (l_ParaType <> ev_ctCalEdit) or (Supports(l_Field, IevEditorCalendarField, l_Cal) and not l_Cal.IsBlank) then
    begin
     InevSelection(Selection).Select(l_Para.SubRange(aView, 0, MaxInt), false);
    end;
     Result := False;
    end
   else Result := True;
  end;
 finally
  f_CursorPoint := nil;
 end;
//#UC END# *48E4A96000D4_48E2366202B9_impl*
end;//TevQueryCardEditorHotSpot.CheckCursorPos

function TevQueryCardEditorHotSpot.DoLButtonDoubleClick(const aView: InevControlView;
  const Keys: TevMouseState;
  var Effect: TevMouseEffect): Boolean;
//#UC START# *48E4A976007D_48E2366202B9_var*
//#UC END# *48E4A976007D_48E2366202B9_var*
begin
//#UC START# *48E4A976007D_48E2366202B9_impl*
 Result := inherited DoLButtonDoubleClick(aView, Keys, Effect);
 Effect.rNeedAsyncLoop := False; //�� �����, �.�. ���������� ������ �������� �� �������
 //� ������� ����� �������� ������ �� ������� ������������ � ��������
 //������������ �����.
 // !!! LAW �� �� �������� �� ��� � ����, ��� � ��� ������� - ����� ������� �������� ���������� ������ ���������?
//#UC END# *48E4A976007D_48E2366202B9_impl*
end;//TevQueryCardEditorHotSpot.DoLButtonDoubleClick

function TevQueryCardEditorHotSpot.DoLButtonDown(const aView: InevControlView;
  const aKeys: TevMouseState;
  var Effect: TevMouseEffect): Boolean;
//#UC START# *48E4A99D02A2_48E2366202B9_var*
var
 l_QueryEditor: IevQueryCardEditor;
//#UC END# *48E4A99D02A2_48E2366202B9_var*
begin
//#UC START# *48E4A99D02A2_48E2366202B9_impl*
 if Supports(Il3ToolOwner(f_Owner), IevQueryCardEditor, l_QueryEditor) then
  l_QueryEditor.NotifyEmptySpace;
 Result := inherited DoLButtonDown(aView, aKeys, Effect);
//#UC END# *48E4A99D02A2_48E2366202B9_impl*
end;//TevQueryCardEditorHotSpot.DoLButtonDown

end.