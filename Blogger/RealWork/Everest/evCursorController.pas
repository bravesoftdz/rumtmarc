unit evCursorController;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest"
// �����: ����� �.�.
// ������: "w:/common/components/gui/Garant/Everest/evCursorController.pas"
// �����: 09.12.1998 16:17
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi::Everest::Editors::TevCursorController
//
// ������ �� ��������.
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\Everest\evDefine.inc}

interface

uses
  nevBase,
  l3_Base,
  nevTools,
  l3IID
  ;

type
 TevCursorController = class(Tl3_Base, InevSelection, InevPointListner)
  {* ������ �� ��������. }
 private
 // private fields
   f_NeedSetTop : Boolean;
   f_View : InevInputView;
    {* ���� ��� �������� View}
   f_Cursor : InevLinkedPoint;
    {* ���� ��� �������� Cursor}
   f_LockCaret : Integer;
    {* ���� ��� �������� LockCaret}
 protected
 // property methods
   function pm_GetDocument: InevTag;
   procedure pm_SetDocument(const aValue: InevTag);
 protected
 // realized methods
   function pm_GetPoint: InevLinkedPoint;
   function pm_GetIsMulti: Boolean;
   function Select(const aSource: InevRange;
     AllowAddToMulty: Boolean): Boolean;
     {* ����������� ���� ��������� �������. }
   procedure SelectPt(const Value: TnevPoint;
     aNeedUpdate: Boolean);
     {* ������������� ������� ��������� (� ������� �����������). }
   function SelectPoint(const aPoint: InevBasePoint;
     aNeedSetTop: Boolean;
     aNeedShowCaret: Boolean = true;
     aDiff: Integer = 0): Boolean;
     {* �������� aNeedSetTop �������� ������������ �� ������� ���� ������ ��� ������
���� false, �� ������ ������ ���������� � ����� ����� ������
� ���� true - �� ����� ������ }
   function AddBlock(const aStart: InevBasePoint;
     const aFinish: InevBasePoint): Boolean;
     {* ��������� ������� ���������. }
   function Unselect: Boolean;
     {* ����� ���������. }
   function GetBlock: InevRange;
     {* �������� ������� ������ ���������. }
   function Contains(const C: InevBasePoint): Boolean;
     {* ��������� �������� �� ��������� ������. }
   procedure CursorChanged(const aCursor: InevBasePoint);
     {* ������ aCursor ���������. }
   procedure ParaChanged(const aCursor: InevBasePoint);
     {* ������� �������� ���������. }
   function pm_GetView: InevView;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* ������� ������� ����� �������. }
   function COMQueryInterface(const IID: Tl3GUID;
    out Obj): Tl3HResult; override;
     {* ���������� ������� ���������� }
   procedure ClearFields; override;
 protected
 // protected methods
   function DoGetBlock(const aDocument: InevObject): InevRange; virtual;
   function GetIsMulti: Boolean; virtual;
   function DoAddBlock(const aStart: InevBasePoint;
    const aFinish: InevBasePoint): Boolean; virtual;
   function GetContains(const C: InevBasePoint): Boolean; virtual;
   procedure DoCursorChanged(const aCursor: InevBasePoint); virtual;
   procedure DoAssignSel(const aView: InevView;
    const aSource: InevRange;
    AllowAddToMulty: Boolean); virtual;
   function Processor: InevProcessor;
   function DocumentPara: InevObject;
   procedure DoSetDocument(const OldDocument: InevTag;
    const Value: InevTag); virtual;
   function NeedUnselectOnSelectPoint(const aPoint: InevBasePoint): Boolean; virtual;
     {* ����� �� ���������� ��������� � SelectPoint }
   function DoUnselect: Boolean; virtual;
     {* ����� ��������� }
   procedure FreeCursor(var C: InevLinkedPoint); overload; 
   procedure FreeCursor(var C: InevPoint); overload; 
   function CheckCursor(var C: InevLinkedPoint): InevLinkedPoint; overload; 
   function CheckCursor(var C: InevPoint): InevPoint; overload; 
   function CheckCursor: InevLinkedPoint; overload; 
   procedure FreeCursor(var C: InevBasePoint); overload; 
 public
 // public methods
   procedure ForceStore; virtual;
   constructor Create(const aView: InevInputView); reintroduce;
   procedure Lock; virtual;
     {* ��������� ����������� �� ���������� }
   procedure Unlock; virtual;
     {* ��������� ����������� �� ���������� }
   procedure LinkView(const aView: InevInputView);
 public
 // public properties
   property View: InevInputView
     read f_View;
   property Cursor: InevLinkedPoint
     read f_Cursor;
     {* ������� ������� � ��������� }
   property Document: InevTag
     read pm_GetDocument
     write pm_SetDocument;
   property LockCaret: Integer
     read f_LockCaret;
 end;//TevCursorController

implementation

uses
  k2Base,
  evMsgCode,
  evOp,
  k2TagGen,
  l3InternalInterfaces,
  evDocumentPartGenerator,
  SysUtils,
  nevNavigation,
  l3InterfacesMisc,
  evdStyles,
  LeafPara_Const,
  k2Tags
  ;

// start class TevCursorController

procedure TevCursorController.ForceStore;
//#UC START# *4D9476CA029F_487B5D2D004E_var*
//#UC END# *4D9476CA029F_487B5D2D004E_var*
begin
//#UC START# *4D9476CA029F_487B5D2D004E_impl*
 if (f_Cursor <> nil) then
  f_Cursor.ForceStore;
//#UC END# *4D9476CA029F_487B5D2D004E_impl*
end;//TevCursorController.ForceStore

function TevCursorController.pm_GetDocument: InevTag;
//#UC START# *48E272D70333_487B5D2D004Eget_var*
//#UC END# *48E272D70333_487B5D2D004Eget_var*
begin
//#UC START# *48E272D70333_487B5D2D004Eget_impl*
 if (f_Cursor <> nil) then
  Result := f_Cursor.Obj^
 else
  Result := k2NullTag;
//#UC END# *48E272D70333_487B5D2D004Eget_impl*
end;//TevCursorController.pm_GetDocument

procedure TevCursorController.pm_SetDocument(const aValue: InevTag);
//#UC START# *48E272D70333_487B5D2D004Eset_var*
var
 D : InevTag;
//#UC END# *48E272D70333_487B5D2D004Eset_var*
begin
//#UC START# *48E272D70333_487B5D2D004Eset_impl*
 if (f_Cursor <> nil) then
  D := f_Cursor.Obj^
 else
  D := nil;
 if (D = nil) OR not D.IsSame(aValue) OR
    ((f_Cursor <> nil) AND not f_Cursor.HasInner) then
    // - ��� ����, ����� ����������� ������ ������� ����������.
  DoSetDocument(D, aValue);
//#UC END# *48E272D70333_487B5D2D004Eset_impl*
end;//TevCursorController.pm_SetDocument

function TevCursorController.DoGetBlock(const aDocument: InevObject): InevRange;
//#UC START# *48E252D40298_487B5D2D004E_var*
//#UC END# *48E252D40298_487B5D2D004E_var*
begin
//#UC START# *48E252D40298_487B5D2D004E_impl*
 Result := nil;
//#UC END# *48E252D40298_487B5D2D004E_impl*
end;//TevCursorController.DoGetBlock

constructor TevCursorController.Create(const aView: InevInputView);
//#UC START# *48E2710F0006_487B5D2D004E_var*
//#UC END# *48E2710F0006_487B5D2D004E_var*
begin
//#UC START# *48E2710F0006_487B5D2D004E_impl*
 inherited Create;
 f_View := aView;
//#UC END# *48E2710F0006_487B5D2D004E_impl*
end;//TevCursorController.Create

function TevCursorController.GetIsMulti: Boolean;
//#UC START# *48E271320180_487B5D2D004E_var*
//#UC END# *48E271320180_487B5D2D004E_var*
begin
//#UC START# *48E271320180_487B5D2D004E_impl*
 Result := false;
//#UC END# *48E271320180_487B5D2D004E_impl*
end;//TevCursorController.GetIsMulti

function TevCursorController.DoAddBlock(const aStart: InevBasePoint;
  const aFinish: InevBasePoint): Boolean;
//#UC START# *48E2719C019C_487B5D2D004E_var*
//#UC END# *48E2719C019C_487B5D2D004E_var*
begin
//#UC START# *48E2719C019C_487B5D2D004E_impl*
 Result := false;
//#UC END# *48E2719C019C_487B5D2D004E_impl*
end;//TevCursorController.DoAddBlock

function TevCursorController.GetContains(const C: InevBasePoint): Boolean;
//#UC START# *48E271FC0130_487B5D2D004E_var*
//#UC END# *48E271FC0130_487B5D2D004E_var*
begin
//#UC START# *48E271FC0130_487B5D2D004E_impl*
 Result := false;
//#UC END# *48E271FC0130_487B5D2D004E_impl*
end;//TevCursorController.GetContains

procedure TevCursorController.DoCursorChanged(const aCursor: InevBasePoint);
//#UC START# *48E27228010F_487B5D2D004E_var*
//#UC END# *48E27228010F_487B5D2D004E_var*
begin
//#UC START# *48E27228010F_487B5D2D004E_impl*
//#UC END# *48E27228010F_487B5D2D004E_impl*
end;//TevCursorController.DoCursorChanged

procedure TevCursorController.DoAssignSel(const aView: InevView;
  const aSource: InevRange;
  AllowAddToMulty: Boolean);
//#UC START# *48E274CF007B_487B5D2D004E_var*
//#UC END# *48E274CF007B_487B5D2D004E_var*
begin
//#UC START# *48E274CF007B_487B5D2D004E_impl*
 Assert(false);
//#UC END# *48E274CF007B_487B5D2D004E_impl*
end;//TevCursorController.DoAssignSel

function TevCursorController.Processor: InevProcessor;
//#UC START# *48E274F90393_487B5D2D004E_var*
//#UC END# *48E274F90393_487B5D2D004E_var*
begin
//#UC START# *48E274F90393_487B5D2D004E_impl*
 Assert((View <> nil) AND (View.Control <> nil));
 if (View = nil) OR (View.Control = nil) then
  Result := nil
 else
  Result := View.Control.Processor;
//#UC END# *48E274F90393_487B5D2D004E_impl*
end;//TevCursorController.Processor

function TevCursorController.DocumentPara: InevObject;
//#UC START# *48E27545028B_487B5D2D004E_var*
//#UC END# *48E27545028B_487B5D2D004E_var*
begin
//#UC START# *48E27545028B_487B5D2D004E_impl*
 if (View.Control = nil) then
  Result := nil
 else
  Result := View.Control.Data;
//#UC END# *48E27545028B_487B5D2D004E_impl*
end;//TevCursorController.DocumentPara

procedure TevCursorController.Lock;
//#UC START# *48E275700381_487B5D2D004E_var*
//#UC END# *48E275700381_487B5D2D004E_var*
begin
//#UC START# *48E275700381_487B5D2D004E_impl*
//#UC END# *48E275700381_487B5D2D004E_impl*
end;//TevCursorController.Lock

procedure TevCursorController.Unlock;
//#UC START# *48E27580037A_487B5D2D004E_var*
//#UC END# *48E27580037A_487B5D2D004E_var*
begin
//#UC START# *48E27580037A_487B5D2D004E_impl*
//#UC END# *48E27580037A_487B5D2D004E_impl*
end;//TevCursorController.Unlock

procedure TevCursorController.DoSetDocument(const OldDocument: InevTag;
  const Value: InevTag);
//#UC START# *48E276B10286_487B5D2D004E_var*
var
 l_Para : InevObject;  
//#UC END# *48E276B10286_487B5D2D004E_var*
begin
//#UC START# *48E276B10286_487B5D2D004E_impl*
 FreeCursor(f_Cursor);
 if (Value <> nil) AND Value.IsValid then
 begin
  if Value.QT(InevObject, l_Para, Processor) then
   f_Cursor := l_Para.MakePoint.LinkedPoint
  else
   Assert(False);
  f_Cursor.LinkListner(Self);
  try
   f_Cursor.ToBottomChild(View);
  except
   on EAbort do;
   // - <K>: 121160862
   on EnevMaybeBaseSwitched do;
   // http://mdp.garant.ru/pages/viewpage.action?pageId=200085315
   on EnevMaybePreviewCancelled do;
   // http://mdp.garant.ru/pages/viewpage.action?pageId=200085315
  end;//try..except
 end;//Value.IsValid
//#UC END# *48E276B10286_487B5D2D004E_impl*
end;//TevCursorController.DoSetDocument

function TevCursorController.NeedUnselectOnSelectPoint(const aPoint: InevBasePoint): Boolean;
//#UC START# *48E276D90043_487B5D2D004E_var*
//#UC END# *48E276D90043_487B5D2D004E_var*
begin
//#UC START# *48E276D90043_487B5D2D004E_impl*
 Result := not Contains(aPoint);
//#UC END# *48E276D90043_487B5D2D004E_impl*
end;//TevCursorController.NeedUnselectOnSelectPoint

function TevCursorController.DoUnselect: Boolean;
//#UC START# *48E2771B024F_487B5D2D004E_var*
//#UC END# *48E2771B024F_487B5D2D004E_var*
begin
//#UC START# *48E2771B024F_487B5D2D004E_impl*
 Result := false;
//#UC END# *48E2771B024F_487B5D2D004E_impl*
end;//TevCursorController.DoUnselect

procedure TevCursorController.FreeCursor(var C: InevLinkedPoint);
//#UC START# *48E3427700D1_487B5D2D004E_var*
//#UC END# *48E3427700D1_487B5D2D004E_var*
begin
//#UC START# *48E3427700D1_487B5D2D004E_impl*
 if (C <> nil) then
  C.UnlinkListner(Self);
 C := nil;
//#UC END# *48E3427700D1_487B5D2D004E_impl*
end;//TevCursorController.FreeCursor

procedure TevCursorController.FreeCursor(var C: InevPoint);
//#UC START# *48E342870254_487B5D2D004E_var*
//#UC END# *48E342870254_487B5D2D004E_var*
begin
//#UC START# *48E342870254_487B5D2D004E_impl*
 C := nil;
//#UC END# *48E342870254_487B5D2D004E_impl*
end;//TevCursorController.FreeCursor

function TevCursorController.CheckCursor(var C: InevLinkedPoint): InevLinkedPoint;
//#UC START# *48E345050300_487B5D2D004E_var*
var
 l_P : InevPoint;
//#UC END# *48E345050300_487B5D2D004E_var*
begin
//#UC START# *48E345050300_487B5D2D004E_impl*
 if (C = nil) then
 begin
  l_P := DocumentPara.MakePoint;
  if (l_P <> nil) then
  begin
   C := l_P.LinkedPoint;
   if (C <> nil) then
   begin
    C.LinkListner(Self);
    C.ToBottomChild(View);
   end;//C <> nil
  end;//l_P <> nil
 end;//C = nil
 Result := C;
//#UC END# *48E345050300_487B5D2D004E_impl*
end;//TevCursorController.CheckCursor

function TevCursorController.CheckCursor(var C: InevPoint): InevPoint;
//#UC START# *48E34510015D_487B5D2D004E_var*
//#UC END# *48E34510015D_487B5D2D004E_var*
begin
//#UC START# *48E34510015D_487B5D2D004E_impl*
 if (C = nil) then
 begin
  C := DocumentPara.MakePoint;
  if (C <> nil) then
   C.ToBottomChild(View);
 end;//C = nil
 Result := C;
//#UC END# *48E34510015D_487B5D2D004E_impl*
end;//TevCursorController.CheckCursor

function TevCursorController.CheckCursor: InevLinkedPoint;
//#UC START# *48E34B2B0284_487B5D2D004E_var*
//#UC END# *48E34B2B0284_487B5D2D004E_var*
begin
//#UC START# *48E34B2B0284_487B5D2D004E_impl*
 Result := CheckCursor(f_Cursor);
//#UC END# *48E34B2B0284_487B5D2D004E_impl*
end;//TevCursorController.CheckCursor

procedure TevCursorController.LinkView(const aView: InevInputView);
//#UC START# *48E34C5E01F7_487B5D2D004E_var*
//#UC END# *48E34C5E01F7_487B5D2D004E_var*
begin
//#UC START# *48E34C5E01F7_487B5D2D004E_impl*
 if (f_View <> aView) then
 begin
  f_View := aView;
  if f_NeedSetTop then
  begin
   f_NeedSetTop := false;
   if (View <> nil) then
    View.TopAnchor.AssignPoint(View, f_Cursor);
  end;//f_NeedSetTop
 end;//f_View <> aView
//#UC END# *48E34C5E01F7_487B5D2D004E_impl*
end;//TevCursorController.LinkView

procedure TevCursorController.FreeCursor(var C: InevBasePoint);
//#UC START# *4A5C4A78037F_487B5D2D004E_var*
//#UC END# *4A5C4A78037F_487B5D2D004E_var*
begin
//#UC START# *4A5C4A78037F_487B5D2D004E_impl*
 C := nil;
//#UC END# *4A5C4A78037F_487B5D2D004E_impl*
end;//TevCursorController.FreeCursor

function TevCursorController.pm_GetPoint: InevLinkedPoint;
//#UC START# *47C5BA6C03DF_487B5D2D004Eget_var*
//#UC END# *47C5BA6C03DF_487B5D2D004Eget_var*
begin
//#UC START# *47C5BA6C03DF_487B5D2D004Eget_impl*
 Result := f_Cursor;
//#UC END# *47C5BA6C03DF_487B5D2D004Eget_impl*
end;//TevCursorController.pm_GetPoint

function TevCursorController.pm_GetIsMulti: Boolean;
//#UC START# *47C5BA850240_487B5D2D004Eget_var*
//#UC END# *47C5BA850240_487B5D2D004Eget_var*
begin
//#UC START# *47C5BA850240_487B5D2D004Eget_impl*
 Result := GetIsMulti;
//#UC END# *47C5BA850240_487B5D2D004Eget_impl*
end;//TevCursorController.pm_GetIsMulti

function TevCursorController.Select(const aSource: InevRange;
  AllowAddToMulty: Boolean): Boolean;
//#UC START# *47C5BA930025_487B5D2D004E_var*
//#UC END# *47C5BA930025_487B5D2D004E_var*
begin
//#UC START# *47C5BA930025_487B5D2D004E_impl*
 Result := true;
 DoAssignSel(View, aSource, AllowAddToMulty);
//#UC END# *47C5BA930025_487B5D2D004E_impl*
end;//TevCursorController.Select

procedure TevCursorController.SelectPt(const Value: TnevPoint;
  aNeedUpdate: Boolean);
//#UC START# *47C5BC1E0201_487B5D2D004E_var*
var
 l_Pack  : InevOp;
 l_Point : InevBasePoint;
//#UC END# *47C5BC1E0201_487B5D2D004E_var*
begin
//#UC START# *47C5BC1E0201_487B5D2D004E_impl*
 if (View <> nil) AND (f_Cursor <> nil) then
 begin
  l_Point := View.PointByPt(Value, True);
  if (l_Point <> nil) then
  begin
   l_Pack := Processor.StartOp(ev_msgMove);
   try    
    f_Cursor.AssignPoint(View, l_Point);
    if aNeedUpdate AND (View.Control <> nil) then
     View.Control.ViewArea.Update;
   finally
    l_Pack := nil;
   end;//try..finally
  end;//l_Point <> nil
 end;//View <> nil..
//#UC END# *47C5BC1E0201_487B5D2D004E_impl*
end;//TevCursorController.SelectPt

function TevCursorController.SelectPoint(const aPoint: InevBasePoint;
  aNeedSetTop: Boolean;
  aNeedShowCaret: Boolean = true;
  aDiff: Integer = 0): Boolean;
//#UC START# *47C5BC32005E_487B5D2D004E_var*
var
 l_Point : InevBasePoint;
 l_Doc   : InevObject;
 l_Para  : InevPara;
 l_Prev  : InevPara;
 l_FI    : TnevFormatInfoPrim;
 l_Line  : Integer;
//#UC END# *47C5BC32005E_487B5D2D004E_var*
begin
//#UC START# *47C5BC32005E_487B5D2D004E_impl*
 Result := false;
 if (aPoint <> nil) then
 begin
  l_Doc := DocumentPara;
  if (l_Doc <> nil) AND l_Doc.IsValid then
  begin
   if aDiff > 0 then
    l_Point := aPoint.ClonePoint(View)
   else
    l_Point := aPoint;
   l_Point := l_Point.PointToParent(l_Doc);
   if (l_Point = nil) then
    Exit;
   Result := true;
   Lock;
   try
    if not aNeedShowCaret then
     Inc(f_LockCaret);
    try
     // ���� aPoint �� ����� � ��������� � ��������� ����������� - ������ ���
     if aDiff > 0 then
     begin
      l_Line := -aDiff;
      l_Point.IncLine(View, l_Line, True);
     end; // if aDiff > 0 then
     if NeedUnselectOnSelectPoint(l_Point) then
      Unselect;
     with l_Point.MostInner do
     begin
      if (View = nil) then
       l_FI := nil
      else
       l_FI := View.FormatInfoByPara(Obj);
      if (l_FI <> nil) and l_FI.IsHidden(false, true) then
       // �������� ��������� ��������� ��� http://mdp.garant.ru/pages/viewpage.action?pageId=88081570
       Move(View, ev_ocParaDown);
     end;
     CheckCursor(f_Cursor).AssignPoint(View, l_Point);
(*     with f_Cursor.MostInner do
      if (View <> nil) AND
         Obj.IsHiddenPrim(View.Metrics,
                          View.FormatInfoByPara(Obj),
                          View.Metrics.HiddenStyles,
                          true) then
       // �������� ��������� ��������� ��� http://mdp.garant.ru/pages/viewpage.action?pageId=88081570
       Move(View, ev_ocParaDown);*)
    finally
     if not aNeedShowCaret then
      Dec(f_LockCaret);
    end;//try..finally
    if aNeedSetTop then
    begin
     if (View = nil) OR (View.TopAnchor = nil) then
      f_NeedSetTop := true
     else
     if not View.IsDocumentTailVisible OR not View.IsCaretVisible then
     begin
      View.ClearPointToShow;
      l_Point := f_Cursor;
      with f_Cursor.MostInner.Obj^ do
       if InheritsFrom(k2_idLeafPara) AND
          (IntA[k2_tiStyle] <> ev_saVersionInfo) then
       begin
        if not QT(InevPara, l_Para) then
         Assert(false);
        while true do
        begin
         l_Prev := l_Para.Prev;
         if (l_Prev = nil) OR
            not l_Prev.IsValid OR
            not l_Prev.InheritsFrom(k2_idLeafPara) OR
            not (l_Prev.IntA[k2_tiStyle] = ev_saVersionInfo) then
          break;
         l_Para := l_Prev;
        end;//while true
        if not IsSame(l_Para) then
         l_Point := l_Para.MakePoint.PointToParent(l_Doc);
       end;//InheritsFrom(k2_idLeafPara)
      View.TopAnchor.AssignPoint(View, l_Point);
     end;//not View.IsDocumentTailVisible..
    end;//aNeedSetTop
   finally
    Unlock;
   end;//try..finally
   if (View <> nil) and (View.Control <> nil) then
    View.Control.ParaChanged;
  end;//l_Doc.IsValid
 end;//aPoint <> nil
//#UC END# *47C5BC32005E_487B5D2D004E_impl*
end;//TevCursorController.SelectPoint

function TevCursorController.AddBlock(const aStart: InevBasePoint;
  const aFinish: InevBasePoint): Boolean;
//#UC START# *47C5BC510038_487B5D2D004E_var*
//#UC END# *47C5BC510038_487B5D2D004E_var*
begin
//#UC START# *47C5BC510038_487B5D2D004E_impl*
 Result := DoAddBlock(aStart, aFinish);
//#UC END# *47C5BC510038_487B5D2D004E_impl*
end;//TevCursorController.AddBlock

function TevCursorController.Unselect: Boolean;
//#UC START# *47C5BC640314_487B5D2D004E_var*
//#UC END# *47C5BC640314_487B5D2D004E_var*
begin
//#UC START# *47C5BC640314_487B5D2D004E_impl*
 Result := DoUnselect;
//#UC END# *47C5BC640314_487B5D2D004E_impl*
end;//TevCursorController.Unselect

function TevCursorController.GetBlock: InevRange;
//#UC START# *47C5BC78024B_487B5D2D004E_var*
var
 l_D : InevObject;
//#UC END# *47C5BC78024B_487B5D2D004E_var*
begin
//#UC START# *47C5BC78024B_487B5D2D004E_impl*
 l_D := DocumentPara;
 if (l_D <> nil) AND l_D.IsValid then
  Result := DoGetBlock(l_D)
 else
  Result := nil;
//#UC END# *47C5BC78024B_487B5D2D004E_impl*
end;//TevCursorController.GetBlock

function TevCursorController.Contains(const C: InevBasePoint): Boolean;
//#UC START# *47C5BC880398_487B5D2D004E_var*
//#UC END# *47C5BC880398_487B5D2D004E_var*
begin
//#UC START# *47C5BC880398_487B5D2D004E_impl*
 Result := GetContains(C);
//#UC END# *47C5BC880398_487B5D2D004E_impl*
end;//TevCursorController.Contains

procedure TevCursorController.CursorChanged(const aCursor: InevBasePoint);
//#UC START# *47C67D810122_487B5D2D004E_var*
//#UC END# *47C67D810122_487B5D2D004E_var*
begin
//#UC START# *47C67D810122_487B5D2D004E_impl*
 DoCursorChanged(aCursor);
//#UC END# *47C67D810122_487B5D2D004E_impl*
end;//TevCursorController.CursorChanged

procedure TevCursorController.ParaChanged(const aCursor: InevBasePoint);
//#UC START# *47C67D93010E_487B5D2D004E_var*
//#UC END# *47C67D93010E_487B5D2D004E_var*
begin
//#UC START# *47C67D93010E_487B5D2D004E_impl*
 if (aCursor <> nil) AND l3IEQ(aCursor.TopParentPoint, f_Cursor) then
  if (View <> nil) and (View.Control <> nil) then
   View.Control.ParaChanged;
//#UC END# *47C67D93010E_487B5D2D004E_impl*
end;//TevCursorController.ParaChanged

function TevCursorController.pm_GetView: InevView;
//#UC START# *47FCD3A4038C_487B5D2D004Eget_var*
//#UC END# *47FCD3A4038C_487B5D2D004Eget_var*
begin
//#UC START# *47FCD3A4038C_487B5D2D004Eget_impl*
 Result := View;
//#UC END# *47FCD3A4038C_487B5D2D004Eget_impl*
end;//TevCursorController.pm_GetView

procedure TevCursorController.Cleanup;
//#UC START# *479731C50290_487B5D2D004E_var*
//#UC END# *479731C50290_487B5D2D004E_var*
begin
//#UC START# *479731C50290_487B5D2D004E_impl*
 f_View := nil;
 Document := nil;
 inherited;
//#UC END# *479731C50290_487B5D2D004E_impl*
end;//TevCursorController.Cleanup

function TevCursorController.COMQueryInterface(const IID: Tl3GUID;
  out Obj): Tl3HResult;
//#UC START# *4A60B23E00C3_487B5D2D004E_var*
var
 l_Parent : InevBasePoint;
 l_Sub    : IevSub;
//#UC END# *4A60B23E00C3_487B5D2D004E_var*
begin
//#UC START# *4A60B23E00C3_487B5D2D004E_impl*
 Assert(not IID.EQ(Il3InfoCanvas));
 Assert(not IID.EQ(IevMarkersSource));
 Result.SetOk;
 if IID.EQ(InevProcessor) then
 begin
  InevProcessor(Obj) := Processor;
  if (InevProcessor(Obj) = nil) then
   Result.SetNoInterface;
 end//InevProcessor
 else
 if IID.EQ(InevLinkedPoint) then
 begin
  InevLinkedPoint(Obj) := Cursor;
  if (InevLinkedPoint(Obj) = nil) then
   Result.SetNoInterface;
 end//IID.EQ(InevLinkedPoint)
 else
 if IID.EQ(InevPoint) then
 begin
  InevPoint(Obj) := Cursor;
  if (InevPoint(Obj) = nil) then
   Result.SetNoInterface;
 end//IID.EQ(InevPoint)
 else
 if IID.EQ(Ik2TagGeneratorWrap) then
 begin
  Assert(false, '��� ��� ��������� ��� ��������?');
  Result.SetNoInterface;
  //Ik2TagGeneratorWrap(Obj) := TevDocumentPartGenerator.Make(View, Cursor, Processor.StartOp);
 end//IID.EQ(Ik2TagGeneratorWrap)
 else
 if IID.EQ(IevSub) then
 begin
  l_Parent := Cursor.MostInner;
  while (l_Parent <> nil) do
  begin
   if Supports(l_Parent, IevSub, l_Sub) AND
      l_Sub.Exists then
    Break
   else
    l_Sub := nil;
   if (l_Parent.ParentPoint <> nil) then
    l_Parent := l_Parent.ParentPoint
   else
    Break;
   if (l_Parent.Position > 1) then
    Break;
  end;//while (l_Parent <> nil)
  if (l_Sub = nil) then
   Result.SetNoInterface
  else
  begin
   IevSub(Obj) := l_Sub;
   l_Sub := nil;
  end;//l_Sub = nil
 end//IID.EQ(IevSub)
 else
 if (f_Cursor <> nil) AND
    IID.EQ(IevHyperlink) then
 begin
  if not Supports(f_Cursor, IID.IID, Obj) then
   Result.SetNoInterface;
 end//..IevHyperlink..
 else
  Result := inherited COMQueryInterface(IID, Obj);
//#UC END# *4A60B23E00C3_487B5D2D004E_impl*
end;//TevCursorController.COMQueryInterface

procedure TevCursorController.ClearFields;
 {-}
begin
 f_View := nil;
 f_Cursor := nil;
 inherited;
end;//TevCursorController.ClearFields

end.