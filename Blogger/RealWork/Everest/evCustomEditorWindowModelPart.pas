unit evCustomEditorWindowModelPart;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest"
// �����: ����� �.�.
// ������: "w:/common/components/gui/Garant/Everest/evCustomEditorWindowModelPart.pas"
// �����: 03.06.2009 14:30
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<GuiControl::Class>> Shared Delphi::Everest::Editors::TevCustomEditorWindowModelPart
//
// ����� TevCustomEditorWindow, ����������� �� ������
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\Everest\evDefine.inc}

interface

uses
  Messages,
  nevTools,
  evCustomEditorWindow,
  Classes
  ;

type
 TevCustomEditorWindowModelPart = class(TevCustomEditorWindow)
  {* ����� TevCustomEditorWindow, ����������� �� ������ }
 private
 // private fields
   f_ActiveElement : InevActiveElement;
    {* ���� ��� �������� ActiveElement}
   f_ForceDrawFocusRect : Boolean;
    {* ���� ��� �������� ForceDrawFocusRect}
   f_PersistentSelection : Boolean;
    {* ���� ��� �������� PersistentSelection}
 private
 // private methods
   procedure WMNCMouseLeave(var Msg: TMessage); message WM_NCMouseLeave;
   procedure WMNCMouseMove(var Msg: TWMNCMouseMove); message WM_NCMouseMove;
 protected
 // property methods
   procedure pm_SetActiveElement(const aValue: InevActiveElement);
   function pm_GetForceDrawFocusRect: Boolean; virtual;
   procedure pm_SetForceDrawFocusRect(aValue: Boolean); virtual;
   function pm_GetPersistentSelection: Boolean;
   procedure pm_SetPersistentSelection(aValue: Boolean);
 protected
 // overridden property methods
   function pm_GetActiveElementPrim: InevActiveElement; override;
   function pm_GetForceDrawFocusRectPrim: Boolean; override;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* ������� ������� ����� �������. }
   procedure MakeCursor; override;
   procedure MouseMove(Shift: TShiftState;
    X: Integer;
    Y: Integer); override;
   procedure ClearFields; override;
 protected
 // protected methods
   procedure ClearUpper; virtual;
     {* �������� ���������� � ��������� ���� � HotSpot }
 public
 // public properties
   property ActiveElement: InevActiveElement
     read f_ActiveElement
     write pm_SetActiveElement;
   property ForceDrawFocusRect: Boolean
     read pm_GetForceDrawFocusRect
     write pm_SetForceDrawFocusRect;
     {* �������� �� ����� ������ ��������� ��������� }
   property PersistentSelection: Boolean
     read pm_GetPersistentSelection
     write pm_SetPersistentSelection;
     {* "����������" ��������� }
 end;//TevCustomEditorWindowModelPart

implementation

uses
  nevGUIInterfaces,
  SysUtils,
  l3Base,
  Windows,
  l3MinMax
  ;

const
   { TrackMouseEventDefs }
  TME_NONCLIENT = $00000010;

// start class TevCustomEditorWindowModelPart

procedure TevCustomEditorWindowModelPart.pm_SetActiveElement(const aValue: InevActiveElement);
//#UC START# *4A27C6400137_4A26509001EAset_var*
var
 l_ActiveElementPara,
 l_ActiveElementParaNew: InevActiveElement{InevPara};
//#UC END# *4A27C6400137_4A26509001EAset_var*
begin
//#UC START# *4A27C6400137_4A26509001EAset_impl*
 if (f_ActiveElement <> aValue) then
 begin
  if (f_ActiveElement = nil) OR not f_ActiveElement.IsSame(aValue) then
  begin
   if (f_ActiveElement <> nil)
    then l_ActiveElementPara := f_ActiveElement{.Para}
    else l_ActiveElementPara := nil;

   f_ActiveElement := aValue;

   if (f_ActiveElement <> nil)
    then l_ActiveElementParaNew := f_ActiveElement{.Para}
    else l_ActiveElementParaNew := nil;

   if Assigned(l_ActiveElementPara) then
    l_ActiveElementPara.Invalidate{([])};

   if Assigned(l_ActiveElementParaNew) then
    if not l_ActiveElementParaNew.IsSame(l_ActiveElementPara) then
     l_ActiveElementParaNew.Invalidate{([])};

   Update;
  end//f_ActiveElement = nil
  else
   f_ActiveElement := aValue;
 end;//f_ActiveElement <> aValue
//#UC END# *4A27C6400137_4A26509001EAset_impl*
end;//TevCustomEditorWindowModelPart.pm_SetActiveElement

function TevCustomEditorWindowModelPart.pm_GetForceDrawFocusRect: Boolean;
//#UC START# *4B59AB0F0338_4A26509001EAget_var*
//#UC END# *4B59AB0F0338_4A26509001EAget_var*
begin
//#UC START# *4B59AB0F0338_4A26509001EAget_impl*
 if fl_Capture then
  Result := false
 else
  Result := f_ForceDrawFocusRect;
//#UC END# *4B59AB0F0338_4A26509001EAget_impl*
end;//TevCustomEditorWindowModelPart.pm_GetForceDrawFocusRect

procedure TevCustomEditorWindowModelPart.pm_SetForceDrawFocusRect(aValue: Boolean);
//#UC START# *4B59AB0F0338_4A26509001EAset_var*
//#UC END# *4B59AB0F0338_4A26509001EAset_var*
begin
//#UC START# *4B59AB0F0338_4A26509001EAset_impl*
 if (f_ForceDrawFocusRect <> aValue) OR aValue then
 begin
  f_ForceDrawFocusRect := aValue;
  Invalidate;
  Update;
 end;//f_ForceDrawFocusRect <> aValue
//#UC END# *4B59AB0F0338_4A26509001EAset_impl*
end;//TevCustomEditorWindowModelPart.pm_SetForceDrawFocusRect

function TevCustomEditorWindowModelPart.pm_GetPersistentSelection: Boolean;
//#UC START# *4BDAAF0A0285_4A26509001EAget_var*
//#UC END# *4BDAAF0A0285_4A26509001EAget_var*
begin
//#UC START# *4BDAAF0A0285_4A26509001EAget_impl*
 if (Selection = nil) then
  Result := f_PersistentSelection
 else
  Result := Selection.Persistent;
//#UC END# *4BDAAF0A0285_4A26509001EAget_impl*
end;//TevCustomEditorWindowModelPart.pm_GetPersistentSelection

procedure TevCustomEditorWindowModelPart.pm_SetPersistentSelection(aValue: Boolean);
//#UC START# *4BDAAF0A0285_4A26509001EAset_var*
//#UC END# *4BDAAF0A0285_4A26509001EAset_var*
begin
//#UC START# *4BDAAF0A0285_4A26509001EAset_impl*
 f_PersistentSelection := aValue;
 if (Selection <> nil) then
  Selection.Persistent := aValue;
//#UC END# *4BDAAF0A0285_4A26509001EAset_impl*
end;//TevCustomEditorWindowModelPart.pm_SetPersistentSelection

procedure TevCustomEditorWindowModelPart.ClearUpper;
//#UC START# *4A265562032B_4A26509001EA_var*
//#UC END# *4A265562032B_4A26509001EA_var*
begin
//#UC START# *4A265562032B_4A26509001EA_impl*
 ActiveElement := nil;
//#UC END# *4A265562032B_4A26509001EA_impl*
end;//TevCustomEditorWindowModelPart.ClearUpper

procedure TevCustomEditorWindowModelPart.WMNCMouseLeave(var Msg: TMessage);
//#UC START# *4C0CBB3B028A_4A26509001EA_var*
var
 l_Event: TTrackMouseEvent;
//#UC END# *4C0CBB3B028A_4A26509001EA_var*
begin
//#UC START# *4C0CBB3B028A_4A26509001EA_impl*
 inherited;
 CancelHint;
 l_Event.cbSize := SizeOf(l_Event);
 l_Event.dwFlags := TME_NONCLIENT or TME_CANCEL;
 l_Event.hwndTrack := Handle;
 l_Event.dwHoverTime := HOVER_DEFAULT;
 TrackMouseEvent(l_Event);
//#UC END# *4C0CBB3B028A_4A26509001EA_impl*
end;//TevCustomEditorWindowModelPart.WMNCMouseLeave

procedure TevCustomEditorWindowModelPart.WMNCMouseMove(var Msg: TWMNCMouseMove);
//#UC START# *4C0CC2FC0272_4A26509001EA_var*
var
 l_Info: TScrollBarInfo;
 l_Point: Integer;
 l_Event: TTrackMouseEvent;
//#UC END# *4C0CC2FC0272_4A26509001EA_var*
begin
//#UC START# *4C0CC2FC0272_4A26509001EA_impl*
 inherited;
 if (not (csDesigning in ComponentState)) and
   (Msg.HitTest = HTVSCROLL) then
 begin
  l_Info.cbSize := SizeOf(l_Info);
  GetScrollBarInfo(Handle, Longint(OBJID_VSCROLL), l_Info);
  l_Point := Msg.YCursor - l_Info.rcScrollBar.Top;
  l_Event.cbSize := SizeOf(l_Event);
  l_Event.dwFlags := TME_NONCLIENT;
  l_Event.hwndTrack := Handle;
  l_Event.dwHoverTime := HOVER_DEFAULT;
  l_Info.xyThumbBottom := Max(l_Info.dxyLineButton + l_Info.xyThumbTop, l_Info.xyThumbBottom);
  if (l_Point >= l_Info.xyThumbTop) and
     (l_Point <= l_Info.xyThumbBottom) then
  begin
   ShowHint := False;
   if (View <> nil) AND (View.TopAnchor <> nil) then
   // http://mdp.garant.ru/pages/viewpage.action?pageId=290267544
   begin
    Hint := GetVScrollerHint(View.TopAnchor.ClonePoint(View));
    ActivateHint;
    TrackMouseEvent(l_Event);
   end//View <> nil
   else
   begin
    l_Event.dwFlags := l_Event.dwFlags or TME_CANCEL;
    TrackMouseEvent(l_Event);
    CancelHint;
   end;//View <> nil..
  end//l_Point >= l_Info.xyThumbTop..
  else
  begin
   l_Event.dwFlags := l_Event.dwFlags or TME_CANCEL;
   TrackMouseEvent(l_Event);
   CancelHint;
  end;//l_Point >= l_Info.xyThumbTop
 end;
//#UC END# *4C0CC2FC0272_4A26509001EA_impl*
end;//TevCustomEditorWindowModelPart.WMNCMouseMove

procedure TevCustomEditorWindowModelPart.Cleanup;
//#UC START# *479731C50290_4A26509001EA_var*
//#UC END# *479731C50290_4A26509001EA_var*
begin
//#UC START# *479731C50290_4A26509001EA_impl*
 f_ActiveElement := nil;
 inherited;
//#UC END# *479731C50290_4A26509001EA_impl*
end;//TevCustomEditorWindowModelPart.Cleanup

procedure TevCustomEditorWindowModelPart.MakeCursor;
//#UC START# *482BFA9401ED_4A26509001EA_var*
//#UC END# *482BFA9401ED_4A26509001EA_var*
begin
//#UC START# *482BFA9401ED_4A26509001EA_impl*
 inherited;
 if (Selection <> nil) then
  Selection.Persistent := f_PersistentSelection;
//#UC END# *482BFA9401ED_4A26509001EA_impl*
end;//TevCustomEditorWindowModelPart.MakeCursor

procedure TevCustomEditorWindowModelPart.MouseMove(Shift: TShiftState;
  X: Integer;
  Y: Integer);
//#UC START# *48E22B250241_4A26509001EA_var*
var
 l_HotSpot   : IevHotSpot;
 l_Control   : IevMouseMoveHandler;
 l_Translate : Boolean;
 l_Keys      : TevMouseState;
 l_ActiveElement : InevActiveElement;
//#UC END# *48E22B250241_4A26509001EA_var*
begin
//#UC START# *48E22B250241_4A26509001EA_impl*
 inherited;
 l_Translate := False;
 if GetHotspotOnPoint(Point(X, Y), l_HotSpot, false) then
  try
   if Supports(l_HotSpot, IevMouseMoveHandler, l_Control) then
   try
    if (Shift = []) then
    begin
     l3FillChar(l_Keys, SizeOf(l_Keys), 0);
     l_Keys.rInitialPoint := MousePos;
     l_Keys.rPoint := l_Keys.rInitialPoint;
     l_Keys.rKeys := Shift;
     if l_Control.TransMouseMove(View, l_Keys, l_ActiveElement) then
      ActiveElement := l_ActiveElement
     else
      ActiveElement := nil;
     l_Translate := True;
    end;//Shift = []
   finally
    l_Control := nil;
   end;
  finally
   l_HotSpot := nil;
  end;
 if not l_Translate then
  ClearUpper;
//#UC END# *48E22B250241_4A26509001EA_impl*
end;//TevCustomEditorWindowModelPart.MouseMove

function TevCustomEditorWindowModelPart.pm_GetActiveElementPrim: InevActiveElement;
//#UC START# *4A27CF530106_4A26509001EAget_var*
//#UC END# *4A27CF530106_4A26509001EAget_var*
begin
//#UC START# *4A27CF530106_4A26509001EAget_impl*
 Result := ActiveElement;
//#UC END# *4A27CF530106_4A26509001EAget_impl*
end;//TevCustomEditorWindowModelPart.pm_GetActiveElementPrim

function TevCustomEditorWindowModelPart.pm_GetForceDrawFocusRectPrim: Boolean;
//#UC START# *4B59AA4700E5_4A26509001EAget_var*
//#UC END# *4B59AA4700E5_4A26509001EAget_var*
begin
//#UC START# *4B59AA4700E5_4A26509001EAget_impl*
 Result := ForceDrawFocusRect;
//#UC END# *4B59AA4700E5_4A26509001EAget_impl*
end;//TevCustomEditorWindowModelPart.pm_GetForceDrawFocusRectPrim

procedure TevCustomEditorWindowModelPart.ClearFields;
 {-}
begin
 ActiveElement := nil;
 inherited;
end;//TevCustomEditorWindowModelPart.ClearFields

end.