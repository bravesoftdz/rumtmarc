unit nevTableRowBaseLine4Anchor;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest"
// ������: "w:/common/components/gui/Garant/Everest/nevTableRowBaseLine4Anchor.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi::Everest::Cursors::TnevTableRowBaseLine4Anchor
//
// ������� ����� ��� �����
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
  nevTools,
  nevBasePointList,
  k2TagPointer,
  k2Interfaces,
  l3Interfaces,
  l3Core
  ;

type
 {$Include ..\Everest\nevTableRowBaseLineCommon.imp.pas}
 TnevTableRowBaseLine4Anchor = class(_nevTableRowBaseLineCommon_)
  {* ������� ����� ��� ����� }
 private
 // private fields
   f_FirstItem : Integer;
    {* ��������� ������� �������������}
   f_LastItem : Integer;
    {* �������� ������� �������������}
 private
 // private methods
   function GetBottomIndex(const aView: InevView): Integer;
   function GoToNextRow(const aView: InevView;
     const aPoint: InevBasePoint;
     var aDiff: Integer;
     aMoveUp: Boolean): Boolean;
     {* ���������� ����� �� ������������ ������ � "���������" �� �������� ������. }
   function GetStartPoint4RemoveDiff(const aView: InevView;
     aHeadCell: Boolean;
     anIndex: Integer;
     var aMoveUp: Boolean): InevBasePoint;
   function CalcDiff4CenterAlign(const aView: InevView;
     const aPoint: InevBasePoint;
     aMoveUp: Boolean): Integer;
     {* ������������ ������ (������ ��� �����) ��� ������ � ������������� �� ��������� ���������. }
   procedure RemoveDiff(const aView: InevView;
     aHeadCell: Boolean;
     const aTestPoint: InevBasePoint;
     const aMaxPoint: InevBasePoint;
     var aMaxFI: TnevFormatInfoPrim;
     anIndex: Integer;
     anHeadIndex: Integer = -1);
 protected
 // realized methods
   function DoDiff(const aView: InevView;
    const aPoint: InevBasePoint;
    aMap: TnevFormatInfoPrim): Integer; override;
   function CheckMaxID(aMaxID: Integer): InevBasePoint; override;
   function SimpleMode: Boolean; override;
   function GetInner4SimpleMode: InevBasePoint; override;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* ������� ������� ����� �������. }
   procedure DoFire(const anEvent: Tk2Event;
    const anOp: Ik2Op); override;
   function NeedEvents: Boolean; override;
     {* ����� �� ������������� �� ������� ����� }
   procedure DoBottom(const aView: InevView); override;
   function DoIncLine(const aView: InevView;
    var theLine: Integer;
    aByLine: Boolean): Integer; override;
   function DoInnerTop(const aChild: InevObject): InevBasePoint; override;
   procedure DoAddInner(const aView: InevView;
    const anInner: InevBaseLine4Anchor;
    anIndex: Integer;
    var aFirst: Boolean;
    aMode: TnevAddInnerMode); override;
   procedure DoCompareWithOtherInner(const aView: InevView); override;
   procedure DoInitBaseLineInner(const aView: InevView;
    const anItem: InevPara); override;
   procedure DoInitByCursor(const aView: InevView;
    const anInnerPoint: InevBasePoint); override;
   procedure DoAddHeadInner(const aHeadInner: InevBasePoint); override;
 public
 // public methods
   constructor Create(const aRow: InevTag); reintroduce;
   class function Make(const aRow: InevTag): InevPoint; reintroduce;
 end;//TnevTableRowBaseLine4Anchor

implementation

uses
  nevAfterEndPoint,
  evTableCellUtils,
  evConst,
  l3MinMax,
  nevFacade,
  evOp,
  Math,
  nevBeforeStartPoint,
  evCursorTools,
  evdTypes,
  k2Tags,
  l3Base,
  SysUtils
  ;

type _Instance_R_ = TnevTableRowBaseLine4Anchor;

{$Include ..\Everest\nevTableRowBaseLineCommon.imp.pas}

// start class TnevTableRowBaseLine4Anchor

function TnevTableRowBaseLine4Anchor.GetBottomIndex(const aView: InevView): Integer;
//#UC START# *4DDBDE21011A_4DD77A73036E_var*
var
 l_RowFI: TnevFormatInfoPrim;
//#UC END# *4DDBDE21011A_4DD77A73036E_var*
begin
//#UC START# *4DDBDE21011A_4DD77A73036E_impl*
 l_RowFI := aView.FormatInfoByPara(ParaX);
 Assert(l_RowFI <> nil);
 Result := l_RowFI.GreatestObjPID;
 Assert(l_RowFI.Hidden OR (Result > -1));               
//#UC END# *4DDBDE21011A_4DD77A73036E_impl*
end;//TnevTableRowBaseLine4Anchor.GetBottomIndex

function TnevTableRowBaseLine4Anchor.GoToNextRow(const aView: InevView;
  const aPoint: InevBasePoint;
  var aDiff: Integer;
  aMoveUp: Boolean): Boolean;
//#UC START# *4DDC9AE00197_4DD77A73036E_var*
var
 l_Line: Integer;
//#UC END# *4DDC9AE00197_4DD77A73036E_var*
begin
//#UC START# *4DDC9AE00197_4DD77A73036E_impl*
 if aMoveUp then
  l_Line := -1
 else
  l_Line := 1;
 if aDiff = 0 then
 begin
  aPoint.IncLine(aView, l_Line, True);
  Result := l_Line = 0;
 end // if aDiff = 0 then
 else
  begin
   Dec(aDiff, Sign(aDiff));
   Result := True;
  end;
//#UC END# *4DDC9AE00197_4DD77A73036E_impl*
end;//TnevTableRowBaseLine4Anchor.GoToNextRow

function TnevTableRowBaseLine4Anchor.GetStartPoint4RemoveDiff(const aView: InevView;
  aHeadCell: Boolean;
  anIndex: Integer;
  var aMoveUp: Boolean): InevBasePoint;
//#UC START# *4EC230A70136_4DD77A73036E_var*
var
 l_Para     : InevPara;
 l_IsBottom : Boolean;
//#UC END# *4EC230A70136_4DD77A73036E_var*
begin
//#UC START# *4EC230A70136_4DD77A73036E_impl*
 aMoveUp := False;
 Result := nil;
 if aHeadCell then
 begin
  Result := f_TopCells[anIndex];
  if Result <> nil then
   Result := Result.ClonePoint(aView);
 end // if aHeadCell then
 else
 begin
  Result := f_Children[anIndex];
  l_Para := ParaX.AsList.Para[anIndex];
  l_IsBottom := (TevVerticalAligment(l_Para.IntA[k2_tiVerticalAligment]) = ev_valBottom);
  if (Result = nil) or l_IsBottom then
  begin
   Result := l_Para.MakeAnchor;
   Result.Bottom(aView);
   aMoveUp := True;
  end // if Result = nil then
  else
   Result := Result.Obj.MakeAnchor;
 end;
//#UC END# *4EC230A70136_4DD77A73036E_impl*
end;//TnevTableRowBaseLine4Anchor.GetStartPoint4RemoveDiff

function TnevTableRowBaseLine4Anchor.CalcDiff4CenterAlign(const aView: InevView;
  const aPoint: InevBasePoint;
  aMoveUp: Boolean): Integer;
//#UC START# *4EC249D403C8_4DD77A73036E_var*
var
 l_FI      : TnevFormatInfoPrim;
 l_OldDiff : Integer;
//#UC END# *4EC249D403C8_4DD77A73036E_var*
begin
//#UC START# *4EC249D403C8_4DD77A73036E_impl*
 if aPoint.IntA[k2_tiVerticalAligment] = Ord(ev_valCenter) then
 begin
  l_FI := aView.FormatInfoByPara(ParaX);
  Result := l_FI.CompareWithMax(aPoint.Obj.PID);
  l_OldDiff := Result;
  Result := Result div 2;
  if aMoveUp then
   Result := l_OldDiff - Result;
 end // if aTestPoint.IntA[k2_tiVerticalAligment] = Ord(ev_valCenter) then
 else
  Result := 0;
//#UC END# *4EC249D403C8_4DD77A73036E_impl*
end;//TnevTableRowBaseLine4Anchor.CalcDiff4CenterAlign

procedure TnevTableRowBaseLine4Anchor.RemoveDiff(const aView: InevView;
  aHeadCell: Boolean;
  const aTestPoint: InevBasePoint;
  const aMaxPoint: InevBasePoint;
  var aMaxFI: TnevFormatInfoPrim;
  anIndex: Integer;
  anHeadIndex: Integer = -1);
//#UC START# *4EC25B770011_4DD77A73036E_var*
var
 l_MoveUp     : Boolean;
 l_StartPoint : InevBasePoint;

 procedure lp_InitStartPointAndFI;
 begin
  if anHeadIndex = -1 then
  begin
   l_StartPoint := aMaxPoint.Obj^.MakeAnchor;
   if l_MoveUp then
    l_StartPoint.Bottom(aView);
  end // if anIndex = -1 then
  else
   l_StartPoint := f_TopCells[anHeadIndex].ClonePoint(aView);
  if aMaxFI = nil then
   aMaxFI := aView.FormatInfoByPoint(aMaxPoint);
 end;

var
 l_DiffDbg  : Integer;
 l_Diff     : Integer;
 l_Item     : InevBasePoint;
 l_WasMove  : Boolean;
 l_ZeroDiff : Integer;
//#UC END# *4EC25B770011_4DD77A73036E_var*
begin
//#UC START# *4EC25B770011_4DD77A73036E_impl*
 l_ZeroDiff := 0;
 l_MoveUp := False;
 Assert(anIndex > -1);
 if aTestPoint = nil then
 begin
  l_Item := GetStartPoint4RemoveDiff(aView, aHeadCell, anIndex, l_MoveUp);
  if l_Item = nil then Exit;
 end // if aTestPoint = nil then
 else
  l_Item := aTestPoint;
 if l_Item.Inner = nil then Exit;
 Assert(aMaxPoint.Inner <> nil);
 lp_InitStartPointAndFI;
 l_WasMove := False;
 l_DiffDbg := 0;
 if not l_StartPoint.AfterEnd then
 begin
  if aHeadCell then
   l_Diff := 0
  else
   l_Diff := CalcDiff4CenterAlign(aView, l_Item, l_MoveUp);
  l_DiffDbg := l_StartPoint.Diff(aView, aMaxPoint, aMaxFI);
  while l_DiffDbg <> 0 do
  begin
   l_WasMove := GoToNextRow(aView, l_Item, l_Diff, l_MoveUp);
   if l_WasMove then
   begin
    l_WasMove := GoToNextRow(aView, l_StartPoint, l_ZeroDiff, l_MoveUp);
    if l_MoveUp then
    begin
     if l_StartPoint.AtStart then Break
    end
    else
     if l_StartPoint.AfterEnd then Break;
   end // if l_WasMove then
   else
    Break;
   l_DiffDbg := l_StartPoint.Diff(aView, aMaxPoint, aMaxFI);
  end; // while l_StartPoint.Diff(aView, aMaxPoint, aMaxFI) <> 0 do
 end; // if not l_StartPoint.AfterEnd then
 if l_WasMove and not l_StartPoint.AfterEnd and (l_Diff = 0) then
  if aHeadCell then
   f_HeadCells[anIndex] := l_Item
  else                                             
   f_Children[anIndex] := l_Item
 else
  if aHeadCell then
   if (l_DiffDbg = 0) and l_StartPoint.AtStart and not l_WasMove then
    f_HeadCells[anIndex] := GetStartPoint4RemoveDiff(aView, aHeadCell, anIndex, l_MoveUp)
   else
    f_HeadCells[anIndex] := TnevAfterEndPoint.DoMake(l_Item)
  else
   if l_Item.IntA[k2_tiVerticalAligment] = Ord(ev_valBottom) then
   begin
    if not l_WasMove and aMaxPoint.AtEnd(aView) then
     f_Children[anIndex] := GetStartPoint4RemoveDiff(aView, aHeadCell, anIndex, l_MoveUp)
    else
     f_Children[anIndex] := TnevBeforeStartPoint.DoMake(l_Item);
   end // if l_Item.IntA[k2_tiVerticalAligment] = Ord(ev_valBottom) then
   else
    if l_Item.IntA[k2_tiVerticalAligment] = Ord(ev_valCenter) then
    begin
     if (aView.FormatInfoByPara(ParaX).GreatestObjPID <> anIndex) then
      if (l_DiffDbg >= 0) then
       f_Children[anIndex] := TnevBeforeStartPoint.DoMake(l_Item)
      else
       f_Children[anIndex] := TnevAfterEndPoint.DoMake(l_Item)
     else
      if l_StartPoint.AfterEnd then
       f_Children[anIndex] := TnevAfterEndPoint.DoMake(l_Item)
      else
       f_Children[anIndex] := l_Item
    end // if l_Item.IntA[k2_tiVerticalAligment] = Ord(ev_valCenter) then  
    else
     if (l_DiffDbg = 0) and l_StartPoint.AtStart and not l_WasMove then
      f_Children[anIndex] := GetStartPoint4RemoveDiff(aView, aHeadCell, anIndex, l_MoveUp)
     else
      f_Children[anIndex] := TnevAfterEndPoint.DoMake(l_Item);
//#UC END# *4EC25B770011_4DD77A73036E_impl*
end;//TnevTableRowBaseLine4Anchor.RemoveDiff

constructor TnevTableRowBaseLine4Anchor.Create(const aRow: InevTag);
//#UC START# *4DDCA54C0206_4DD77A73036E_var*
//#UC END# *4DDCA54C0206_4DD77A73036E_var*
begin
//#UC START# *4DDCA54C0206_4DD77A73036E_impl*
 inherited Create(aRow);
 f_FirstItem := -1;
 f_LastItem := -1;
//#UC END# *4DDCA54C0206_4DD77A73036E_impl*
end;//TnevTableRowBaseLine4Anchor.Create

class function TnevTableRowBaseLine4Anchor.Make(const aRow: InevTag): InevPoint;
var
 l_Inst : TnevTableRowBaseLine4Anchor;
begin
 l_Inst := Create(aRow);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

function TnevTableRowBaseLine4Anchor.DoDiff(const aView: InevView;
  const aPoint: InevBasePoint;
  aMap: TnevFormatInfoPrim): Integer;
//#UC START# *4DDA86730300_4DD77A73036E_var*
var
 l_Child      : InevPara;
 l_PointInner : InevBasePoint;
 l_Inner      : InevBasePoint;
 l_NotInHead  : Boolean;

 function lp_CheckCellPoints: Integer;
 begin
  if l_PointInner = nil then
   if l_Inner = nil then
    Result := 0
   else
    Result := nev_PlusDiff
  else
  if l_PointInner.AfterEnd then
  begin
   if l_Inner = nil then
    Result := nev_MinusDiff
   else
    if l_Inner.AfterEnd then
    Result := 0{nev_MinusDiff}
    // http://mdp.garant.ru/pages/viewpage.action?pageId=219124975
    // http://mdp.garant.ru/pages/viewpage.action?pageId=219124975&focusedCommentId=219125595#comment-219125595
   else
    Result := nev_MinusDiff{nev_PlusDiff}
    // http://mdp.garant.ru/pages/viewpage.action?pageId=219124975&focusedCommentId=219125601#comment-219125601
  end//l_PointInner.AfterEnd
  else
  begin
   if (l_Inner = nil) or l_Inner.AfterEnd then
    Result := nev_MinusDiff
   else
   if l_NotInHead then
    Result := l_Inner.Diff(aView, l_PointInner, aMap.InfoForChild(l_Child))
   else
    Result := l_Inner.Diff(aView, l_PointInner, aView.FormatInfoByPara(l_PointInner.Obj^));
  end;//l_PointInner.AfterEnd
 end;

var
 i        : Integer;
 l_Line   : InevBasePoint;
 l_List   : InevParaList;
 l_Real   : InevBasePoint;
 l_MaxPID : Integer;
//#UC END# *4DDA86730300_4DD77A73036E_var*
begin
//#UC START# *4DDA86730300_4DD77A73036E_impl*
 Result := nev_PlusDiff;
 l_Line := aPoint;
 if (l_Line <> nil) then
 begin
  l_MaxPID := aMap.GreatestObjPID;
  l_List := ParaX.AsList;
  l_Child := l_List.Para[l_MaxPID];
  l_NotInHead := TevMergeStatus(l_Child.IntA[k2_tiMergeStatus]) <> ev_msContinue;
  if (f_Children.Count > l_MaxPID) and (l_NotInHead or (l_MaxPID < f_HeadCells.Count)) then
  begin
   l_PointInner := l_Line.InnerFor(l_Child, l_Real);
   if l_NotInHead then
    l_Inner := f_Children[l_MaxPID]
   else
   begin
    l_PointInner := l_Real;
    l_Inner := f_HeadCells[l_MaxPID];
   end;
   Result := lp_CheckCellPoints;
  end
  else
   Assert(False);
 end;//l_Line <> nil
//#UC END# *4DDA86730300_4DD77A73036E_impl*
end;//TnevTableRowBaseLine4Anchor.DoDiff

function TnevTableRowBaseLine4Anchor.CheckMaxID(aMaxID: Integer): InevBasePoint;
//#UC START# *4DDB9A1802A3_4DD77A73036E_var*
//#UC END# *4DDB9A1802A3_4DD77A73036E_var*
begin
//#UC START# *4DDB9A1802A3_4DD77A73036E_impl*
 Result := f_Children[aMaxID];
//#UC END# *4DDB9A1802A3_4DD77A73036E_impl*
end;//TnevTableRowBaseLine4Anchor.CheckMaxID

function TnevTableRowBaseLine4Anchor.SimpleMode: Boolean;
//#UC START# *502A1AD60269_4DD77A73036E_var*
//#UC END# *502A1AD60269_4DD77A73036E_var*
begin
//#UC START# *502A1AD60269_4DD77A73036E_impl*
 Result := (f_FirstItem > -1) and (f_LastItem = -1);
//#UC END# *502A1AD60269_4DD77A73036E_impl*
end;//TnevTableRowBaseLine4Anchor.SimpleMode

function TnevTableRowBaseLine4Anchor.GetInner4SimpleMode: InevBasePoint;
//#UC START# *502A1B0D0231_4DD77A73036E_var*
//#UC END# *502A1B0D0231_4DD77A73036E_var*
begin
//#UC START# *502A1B0D0231_4DD77A73036E_impl*
 Result := f_Children[f_FirstItem];
//#UC END# *502A1B0D0231_4DD77A73036E_impl*
end;//TnevTableRowBaseLine4Anchor.GetInner4SimpleMode

procedure TnevTableRowBaseLine4Anchor.Cleanup;
//#UC START# *479731C50290_4DD77A73036E_var*
//#UC END# *479731C50290_4DD77A73036E_var*
begin
//#UC START# *479731C50290_4DD77A73036E_impl*
 f_FirstItem := -1;
 f_LastItem := -1;
 inherited;
//#UC END# *479731C50290_4DD77A73036E_impl*
end;//TnevTableRowBaseLine4Anchor.Cleanup

procedure TnevTableRowBaseLine4Anchor.DoFire(const anEvent: Tk2Event;
  const anOp: Ik2Op);
//#UC START# *48CF73CE00B5_4DD77A73036E_var*
var
 l_Point: InevBasePoint;
//#UC END# *48CF73CE00B5_4DD77A73036E_var*
begin
//#UC START# *48CF73CE00B5_4DD77A73036E_impl*
 inherited;
 case anEvent.ID of
  k2_eidChildrenAdded,
  k2_eidChildrenInserted:
  begin
   l_Point := ParaX.AsList[anEvent.Point].MakePoint;
   if TevMergeStatus(l_Point.IntA[k2_tiMergeStatus]) = ev_msContinue then
    l_Point := TnevAfterEndPoint.DoMake(l_Point);
   if anEvent.ID = k2_eidChildrenInserted then
    f_Children.Insert(anEvent.Point, l_Point)
   else
    f_Children.Add(l_Point);
  end;//k2_eidChildrenInserted:
  k2_eidChildrenDeleted:
  begin
   if f_Children.Count = ParaX.ChildrenCount then
   begin
    f_Children.Delete(anEvent.Point);
    if anEvent.Point < f_HeadCells.Count then
    begin
     f_HeadCells.Delete(anEvent.Point);
     f_TopCells.Delete(anEvent.Point);
    end;//if anEvent.Point < f_HeadCells.Count then
   end; // if f_Children.Count = ParaX.ChildrenCount - 1 then
  end;//k2_eidChildrenDeleted
 end;//case anEvent.ID
//#UC END# *48CF73CE00B5_4DD77A73036E_impl*
end;//TnevTableRowBaseLine4Anchor.DoFire

function TnevTableRowBaseLine4Anchor.NeedEvents: Boolean;
//#UC START# *4A48AFBD001D_4DD77A73036E_var*
//#UC END# *4A48AFBD001D_4DD77A73036E_var*
begin
//#UC START# *4A48AFBD001D_4DD77A73036E_impl*
 Result := True;
//#UC END# *4A48AFBD001D_4DD77A73036E_impl*
end;//TnevTableRowBaseLine4Anchor.NeedEvents

procedure TnevTableRowBaseLine4Anchor.DoBottom(const aView: InevView);
//#UC START# *4DD797ED02CE_4DD77A73036E_var*
var
 l_Index : Integer;
 l_CA    : InevBasePoint;

 procedure lp_CheckHeadAfterEnd;
 begin
  if l_Index < f_HeadCells.Count then
   f_HeadCells[l_Index] := TnevAfterEndPoint.DoMake(l_CA)
 end;

var
 l_Para : InevPara;
 l_VA   : TevVerticalAligment;
 l_MS   : TevMergeStatus;
 l_FI   : TnevFormatInfoPrim;
 l_Diff : Integer;

 function lp_CheckBottomAlignment: Boolean;
 begin
  Result := False;
  if (l_CA = nil) and (l_VA = ev_valBottom) then
  begin
   l_CA := l_Para.MakeAnchor;
   f_Children[l_Index] := l_CA;
   l_CA.Bottom(aView);
   Result := True;
  end; // if l_CA = nil then
 end;

 procedure lp_CalcDiff;
 var
  l_OldDiff : Integer;
 begin
  l_Diff := l_FI.CompareWithMax(l_Index);
  if (l_MS = ev_msNone) then
   case l_VA of
    ev_valCenter : begin
     l_OldDiff := l_Diff;
     l_Diff := l_Diff div 2;
     l_Diff := l_OldDiff - l_Diff;
     l_CA := l_Para.MakePoint;
    end;
    ev_valBottom : l_Diff := 0;
   end;
 end;

var
 l_MaxPointFI : TnevFormatInfoPrim;
 l_Bottom     : InevBasePoint;
 l_BtmIndex   : Integer;
 l_Item       : InevBasePoint;
 l_Line       : Integer;
//#UC END# *4DD797ED02CE_4DD77A73036E_var*
begin
//#UC START# *4DD797ED02CE_4DD77A73036E_impl*
 Assert(not SimpleMode);
 l_MaxPointFI := nil;
 l_FI := nil;
 if evCheckSingleContinueCell(ParaX) then Exit;
 l_FI := aView.FormatInfoByPara(ParaX);
 if l_FI.Hidden then
 begin
  Exit;
 end;//l_FI.Hidden
 l_BtmIndex := l_FI.GreatestObjPID;
 InitHeadCells(aView);
 l_Bottom := InnerForChildThatNotAfterEnd(l_FI, nev_itNone);
 Assert(l_Bottom <> nil);
 l_Bottom.Bottom(aView);
 for l_Index := 0 to f_Children.Hi do
  if l_Index <> l_BtmIndex then
  begin
   l_CA := f_Children[l_Index];
   l_Para := ParaX.AsList.Para[l_Index];
   l_VA := TevVerticalAligment(l_Para.IntA[k2_tiVerticalAligment]);
   if lp_CheckBottomAlignment then Continue;
   l_MS := TevMergeStatus(l_Para.IntA[k2_tiMergeStatus]);
   lp_CalcDiff;
   if (l_Diff < 0) and (l_Diff > evUndefHeight) then
    if l_MS = ev_msContinue then
     lp_CheckHeadAfterEnd
    else
    if l_MS = ev_msHead then
     RemoveDiff(aView, False, nil, l_Bottom, l_MaxPointFI, l_Index)
    else
     f_Children[l_Index] := TnevAfterEndPoint.DoMake(l_CA)
   else
    if l_MS = ev_msContinue then
     if (l_Diff > 0) or (l_Diff = evUndefHeight) then
     begin
      if f_TopCells.Count > l_Index then
       RemoveDiff(aView, True, nil, l_Bottom, l_MaxPointFI, l_Index)
      else
       lp_CheckHeadAfterEnd;
     end // if l_Diff > 0 then
     else
     begin
      if (l_Index < f_HeadCells.Count) and (f_HeadCells[l_Index] <> nil) then
       f_HeadCells[l_Index].Bottom(aView)
     end
     else
      if l_MS = ev_msHead then
       RemoveDiff(aView, False, nil, l_Bottom, l_MaxPointFI, l_Index)
      else
       if l_CA.BeforeStart then
        f_Children[l_Index] := TnevAfterEndPoint.DoMake(l_CA)
       else
        l_CA.Bottom(aView);
  end; // if l_Index = l_BtmIndex then
//#UC END# *4DD797ED02CE_4DD77A73036E_impl*
end;//TnevTableRowBaseLine4Anchor.DoBottom

function TnevTableRowBaseLine4Anchor.DoIncLine(const aView: InevView;
  var theLine: Integer;
  aByLine: Boolean): Integer;
//#UC START# *4DD7980F03AA_4DD77A73036E_var*
var
 l_RowFI        : TnevFormatInfoPrim;
 l_Line         : Integer;
 l_NeedMove     : Boolean;
 l_MoveDistance : Integer;
 l_AtStart      : Boolean;
 l_HeadIndex    : Integer;
 l_VA           : TevVerticalAligment;
 l_MaxPoint     : InevBasePoint;
 l_MaxPointInit : Boolean;

 function lp_GetVertPosMax(anIndex: Integer; var aVertPosMax: Integer): Boolean;
 var
  l_FI       : TnevFormatInfoPrim;
  l_TopPoint : InevBasePoint;
  l_PointMax : InevBasePoint;
 begin
  Result := False;
  aVertPosMax := 0;
  l_PointMax := f_Children[l_HeadIndex];
  if l_PointMax.AfterEnd then
   if (l_HeadIndex < f_HeadCells.Count) then
   begin
    l_TopPoint := f_TopCells[l_HeadIndex];
    if l_TopPoint = nil then
     if f_Children[anIndex].AfterEnd then
      Exit
     else
     begin
      f_Children[anIndex] := TnevAfterEndPoint.DoMake(f_Children[anIndex]);
      Exit;
     end; // if not f_Children[anIndex].AfterEnd then
    l_PointMax := f_HeadCells[l_HeadIndex];
    l_FI := aView.FormatInfoByPoint(l_PointMax);
   end // if l_HeadIndex > - 1 then
   else
    if f_Children[anIndex].AfterEnd then
     Exit
    else
    begin
     f_Children[anIndex] := TnevAfterEndPoint.DoMake(f_Children[anIndex]);
     Exit;
    end // if not f_Children[anIndex].AfterEnd then
  else
  begin
   l_TopPoint := l_PointMax.Obj.MakeAnchor;
   l_FI := l_RowFI.InfoForChild(l_PointMax.Obj^);
  end;
  aVertPosMax := evCalcDiffInLines(aView, l_TopPoint, l_PointMax, l_FI);
  Result := True;
 end;

 procedure lp_IncNonTopAlignmentCell(anIndex: Integer);

  function lp_CalcLineCount: Integer;
  var
   l_VertPos    : Integer;
   l_VertPosMax : Integer;
  begin
   Result := 0;
   if not lp_GetVertPosMax(anIndex, l_VertPosMax) then Exit;
   l_VertPos := -l_RowFI.CompareWithMax(anIndex);
   Assert(l_VertPos >= 0);
   if not l_MaxPointInit then // ������������ ����� ����� ���� �� "����������".
    Inc(l_VertPosMax, l_Line);
   if l_VA = ev_valCenter then
    l_VertPos := l_VertPos div 2;
   if l_VertPos <= l_VertPosMax then
   begin
    Result := l_VertPosMax - l_VertPos;
    if l_MaxPointInit or not Odd(l_VertPos) then
     Inc(Result);
   end; // if l_VertPos <= l_VertPosMax then
  end;

 var
  l_Point : InevBasePoint;
 begin 
  l_Line := lp_CalcLineCount;
  if l_Line > 0 then
  begin
   l_Point := ParaX.AsList.Para[anIndex].MakeAnchor;
   Result := l_Point.IncLine(aView, l_Line, True);
   if l_Line = 0 then
    f_Children[anIndex] := l_Point
   else
    f_Children[anIndex] := TnevAfterEndPoint.DoMake(l_Point);
  end; // if l_VertPos <= l_VertPosMax  then
 end;

 function lp_IncLine(const aPoint: InevBasePoint; anIndex: Integer; aMeregedCell: Boolean): Integer;
 var
  l_MS       : TevMergeStatus;
  l_Cell     : InevTableCell;
  l_CellPara : InevPara;
 begin
  if (aPoint <> nil) and not aPoint.BeforeStart then
   Result := aPoint.IncLine(aView, l_Line, True{aByLine})
                                        // ^ - [$213713820]
  else
   Result := 0;
  if (l_Line = 0) then
  begin
   if aMeregedCell then
   begin
    if anIndex = -1 then // ���� ����������� - �� � ��� �����, ��� ����� ������������� �� ���� ������, �.�. ��� ������������.
     l_NeedMove := True
    else
     if not l_AtStart then
     begin
      f_Children[anIndex].Obj.QT(InevTableCell, l_Cell);
      if l_Cell.GetContinueCell(True, fc_Down) = nil then
       l_NeedMove := True;
     end; // if not l_AtStart then
   end // if aMeregedCell then
   else
    if anIndex = l_HeadIndex then
     l_NeedMove := True;
   l_MoveDistance := theLine;
  end // if (l_Line = 0) then
  else
  begin
   if theLine > 0 then
   begin
    l_MoveDistance := Max(l_MoveDistance, theLine - l_Line);
    if aMeregedCell then
    begin
     if (anIndex < f_HeadCells.Count) then
      f_HeadCells[anIndex] := TnevAfterEndPoint.DoMake(aPoint)
    end // if aMeregedCell then
    else
     if aPoint.BeforeStart then
      lp_IncNonTopAlignmentCell(anIndex)
     else
      f_Children[anIndex] := TnevAfterEndPoint.DoMake(aPoint);
   end // if theLine > 0 then
   else
   begin
    l_MoveDistance := Min(l_MoveDistance, theLine - l_Line);
    if (l_MoveDistance < 0) and (l_VA > ev_valTop) then // - ����� ������ �� ��������!!!
     if not aPoint.BeforeStart then
      f_Children[anIndex] := TnevBeforeStartPoint.DoMake(aPoint);
   end;
  end;
 end;

var
 l_MaxPointFI : TnevFormatInfoPrim;

 procedure lp_MakeStart(const aPoint: InevBasePoint; aMeregedCell: Boolean; anIndex: Integer);
 begin
  if aMeregedCell then
   f_HeadCells[anIndex] := aPoint.ClonePoint(aView)
  else
   if aPoint = nil then
    f_Children[anIndex] := nil
   else
    f_Children[anIndex] := aPoint.Obj.MakeAnchor;
 end;

 procedure lp_DecLine(const aPoint: InevBasePoint; aMeregedCell: Boolean; anIndex: Integer);
 begin
  if aMeregedCell then
   f_HeadCells[anIndex] := nil
  else
   f_Children[anIndex] := aPoint;
  if (l_Line < 0) and (aPoint <> nil) then
   if l_AtStart then
    lp_MakeStart(aPoint, aMeregedCell, anIndex)
   else
    RemoveDiff(aView, aMeregedCell, nil, l_MaxPoint, l_MaxPointFI, anIndex, l_HeadIndex);
 end;

 function lp_AtStart(const anMaxPoint: InevBasePoint; aHeadIndex: Integer): Boolean;
 begin
  if aHeadIndex = -1 then
   Result := l_MaxPoint.AtStart
  else
  begin
   if l_MaxPointFI = nil then
    l_MaxPointFI := aView.FormatInfoByPoint(anMaxPoint);
   Result := l_MaxPoint.Diff(aView, f_TopCells[aHeadIndex], l_MaxPointFI) = 0;
  end;
 end;

 function lp_CheckHeadCellAtStart(aMaxLinesCount: Integer): Boolean;
 var
  l_Index      : Integer;
  l_LeftLC     : Integer;
  l_Point      : InevBasePoint;
  l_LinesCount : Integer;
 begin
  Result := False;
  if (l_HeadIndex > -1) then
   if lp_AtStart(l_MaxPoint, l_HeadIndex) then
   begin
    DoIncLine := 0;
    Result := True;
   end // if l_AtStart then
   else
   begin
    l_LinesCount := evCalcDiffInLines(aView, f_TopCells[l_HeadIndex], f_HeadCells[l_HeadIndex], l_MaxPointFI);
    Assert(l_LinesCount >= 0);
    l_LinesCount := Min(l_LinesCount, aMaxLinesCount);
    l_LeftLC := l_LinesCount + theLine;
    if l_LeftLC <= 0 then
    begin
     theLine := l_LeftLC;
     DoIncLine := l_LinesCount;
     if l_LeftLC = 0 then
      for l_Index := 0 to f_Children.Hi do
      begin
       l_Point := f_Children[l_Index];
       if (l_Point <> nil) and (TevMergeStatus(l_Point.IntA[k2_tiMergeStatus]) = ev_msContinue) then
       begin
        if not l_Point.AfterEnd then
         f_Children[l_Index] := TnevAfterEndPoint.DoMake(l_Point);
        if (l_Index < f_HeadCells.Count) and (f_TopCells[l_Index] <> nil) then
         lp_MakeStart(f_TopCells[l_Index], True, l_Index);
       end // if (TevMergeStatus(l_Point.IntA[k2_tiMergeStatus]) = ev_msContinue) then
       else
        lp_MakeStart(l_Point, False, l_Index);
      end; // for l_Index := 0 to f_Children.Hi do
     Result := True;
    end; // if l_LeftLC < 0 then
   end;
 end;

 procedure lp_CalcOutLineCount;
 begin
  if l_NeedMove then
  begin
   theLine := theLine - l_MoveDistance;
   Result := l_MoveDistance;
  end // if l_NeedMove then
 end;

var
 l_Index     : Integer;
 l_Point     : InevBasePoint;
 l_Anchor    : InevAnchor;
 l_RealPoint : InevBasePoint;
 l_MaxDeltaY : Integer;
//#UC END# *4DD7980F03AA_4DD77A73036E_var*
begin
//#UC START# *4DD7980F03AA_4DD77A73036E_impl*
 Result := 0;
 l_NeedMove := False;
 l_MoveDistance := 0;
 InitHeadCells(aView);
 l_RowFI := aView.FormatInfoByPara(ParaX);
 if (l_RowFI = nil) or l_RowFI.Hidden then Exit;
 l_HeadIndex := l_RowFI.GreatestObjPID;
 if theLine < 0 then
 begin
  l_MaxPoint := InnerForChildThatNotAfterEnd(l_RowFI, nev_itNone);
  l_Line := theLine;
  if l_MaxPoint = nil then Exit; // �� ������ ��� �������������...
  if (f_HeadCells.Count <= l_HeadIndex) or ((f_TopCells.Count <= l_HeadIndex) or (f_TopCells[l_HeadIndex] = nil)) then
   l_HeadIndex := -1;
  if l_HeadIndex > 0 then
  begin
   l_Point := f_HeadCells[l_HeadIndex];
   if (l_Point = nil) or l_Point.AfterEnd then // ����������� �� ������� ������...
    l_HeadIndex := -1;
  end; // if l_HeadIndex > 0 then
  if lp_CheckHeadCellAtStart(l_RowFI.MaxLinesCount) then Exit;
  Result := lp_IncLine(l_MaxPoint, -1, l_HeadIndex > -1);
                                // ^ - ����� ������ ������� "� �������", ���������������, ���
                                // � ���� ������ ������� ���������� ������� f_Children �� ������.
  l_AtStart := lp_AtStart(l_MaxPoint, l_HeadIndex);
  if SimpleMode then
  begin
   lp_CalcOutLineCount;
   Exit;
  end;
  l_MaxPointInit := True;
 end // if theLine < 0 then
 else
 begin
  l_MaxPoint := nil;
  l_MaxPointInit := False;
 end;
 for l_Index := 0 to f_Children.Hi do
 begin
  if SimpleMode and (l_Index <> f_FirstItem) then Continue;
  l_Line := theLine;
  l_Point := f_Children[l_Index];
  l_VA := TevVerticalAligment(ParaX.AsList.Para[l_Index].IntA[k2_tiVerticalAligment]);
  if (l_MaxPoint <> nil) and (l_Point = l_MaxPoint) then Continue;
  try
   if (l_Point <> nil) and (TevMergeStatus(l_Point.IntA[k2_tiMergeStatus]) = ev_msContinue) then
   begin
    if not l_Point.AfterEnd then
     f_Children[l_Index] := TnevAfterEndPoint.DoMake(l_Point);
    if (l_Index < f_HeadCells.Count) and (f_TopCells[l_Index] <> nil) then
    begin
     if f_HeadCells[l_Index] = l_MaxPoint then Continue;
     if (f_HeadCells[l_Index] = nil) or f_HeadCells[l_Index].AfterEnd then
      lp_DecLine(f_TopCells[l_Index], True, l_Index)
     else
      Result := lp_IncLine(f_HeadCells[l_Index], l_Index, True);
    end; // if l_Index < f_HeadCells.Count then
   end // if (TevMergeStatus(l_Point.IntA[k2_tiMergeStatus]) = ev_msContinue) then
   else
    if (l_Point <> nil) and l_Point.AfterEnd then
     lp_DecLine(l_Point, False, l_Index)
    else
     Result := lp_IncLine(l_Point, l_Index, False);
   if not l_MaxPointInit and (l_Index = l_HeadIndex) then
    l_MaxPointInit := True;
  finally
   l_Point := nil;
  end;
 end; // for l_Index := f_Children.Hi downto 0 do
 lp_CalcOutLineCount;
//#UC END# *4DD7980F03AA_4DD77A73036E_impl*
end;//TnevTableRowBaseLine4Anchor.DoIncLine

function TnevTableRowBaseLine4Anchor.DoInnerTop(const aChild: InevObject): InevBasePoint;
//#UC START# *4DD79CB2037D_4DD77A73036E_var*
//#UC END# *4DD79CB2037D_4DD77A73036E_var*
begin
//#UC START# *4DD79CB2037D_4DD77A73036E_impl*
 if aChild.PID < f_TopCells.Count then
  Result := f_TopCells[aChild.PID]
 else
  Result := nil;
//#UC END# *4DD79CB2037D_4DD77A73036E_impl*
end;//TnevTableRowBaseLine4Anchor.DoInnerTop

procedure TnevTableRowBaseLine4Anchor.DoAddInner(const aView: InevView;
  const anInner: InevBaseLine4Anchor;
  anIndex: Integer;
  var aFirst: Boolean;
  aMode: TnevAddInnerMode);
//#UC START# *4DD79CEC0371_4DD77A73036E_var*

 procedure lp_CheckAfterEnd;
 begin
  if (f_Children[anIndex] <> nil) and not f_Children[anIndex].AfterEnd then
   f_Children[anIndex] := TnevAfterEndPoint.DoMake(f_Children[anIndex]);
 end;

var
 l_Diff: Integer;
 l_Top : InevBasePoint;
//#UC END# *4DD79CEC0371_4DD77A73036E_var*
begin
//#UC START# *4DD79CEC0371_4DD77A73036E_impl*
 if aFirst then
 begin
  aFirst := False;
  f_FirstItem := anIndex;
 end; // if aFirst then
 if aMode > nev_aimHead then
  f_LastItem := -1
 else
  f_LastItem := anIndex;
 InitHeadCells(aView);
 if aMode = nev_aimHead then
 begin
  if anInner = nil then
  begin
   if (f_HeadCells.Count > anIndex) and (f_HeadCells[anIndex] <> nil) then
    f_HeadCells[anIndex] := nil;
   lp_CheckAfterEnd;
  end // if aHeadInner = nil then
  else
  begin
   if f_HeadCells.Count <= anIndex then
    f_HeadCells.Count := anIndex + 1;
   if anIndex < f_TopCells.Count then
   begin
    l_Top := f_TopCells[anIndex];
    l_Diff := anInner.Diff(aView, l_Top, aView.FormatInfoByPoint(anInner));
   end // if anIndex < f_TopCells.Count then
   else
    l_Diff := 0;
   if l_Diff < 0 then
    f_HeadCells[anIndex] := l_Top.ClonePoint(aView)
   else
    f_HeadCells[anIndex] := anInner;
   lp_CheckAfterEnd;
  end; // if aHeadInner <> nil then
 end // if anInner = nil then
 else
  if anInner <> nil then
   f_Children[anIndex] := anInner;
//#UC END# *4DD79CEC0371_4DD77A73036E_impl*
end;//TnevTableRowBaseLine4Anchor.DoAddInner

procedure TnevTableRowBaseLine4Anchor.DoCompareWithOtherInner(const aView: InevView);
//#UC START# *4DD79DA50099_4DD77A73036E_var*
var
 i          : Integer;
 l_List     : InevParaList;
 l_MaxFI    : TnevFormatInfoPrim;
 l_Point    : InevBasePoint;
 l_NotStart : InevBasePoint;
 l_Count    : Integer;
 l_Start    : Integer;                                    
//#UC END# *4DD79DA50099_4DD77A73036E_var*
begin
//#UC START# *4DD79DA50099_4DD77A73036E_impl*
 l_MaxFI := nil;
 if (f_FirstItem = -1) and (f_LastItem = -1) then
 begin
  InitHeadCells(aView);
  Exit;
 end;
 if (f_FirstItem = 0) and (f_LastItem = f_Children.Count - 1) then Exit;
 l_NotStart := nil;
 l_Count := Min(f_LastItem, f_Children.Count - 1);
 Assert(f_TopCells.Count = f_HeadCells.Count);
 for i := 0 to l_Count do
 begin
  if (i < f_FirstItem) then Continue;
  l_Point := f_Children[i];
  if (l_Point <> nil) and not l_Point.AtStart then
  begin
   if l_Point.AfterEnd and (i < f_HeadCells.Count) then
   begin
    l_Point := f_HeadCells[i];
    if (l_Point <> nil) and not l_Point.AfterEnd and (l_Point.Diff(aView, f_TopCells[i], aView.FormatInfoByPoint(l_Point)) > 0) then
    begin
     l_NotStart := l_Point;
     Break;
    end; // if (l_Point <> nil) and not l_Point.AfterEnd ...
   end // if l_Point.AfterEnd and (i < f_HeadCell.Count) then 
   else
   begin
    l_NotStart := l_Point;
    Break;
   end;
  end; // if not l_Point.AtStart then
 end; // for i := 0 to f_Children.Count - 1 do
 if (l_NotStart <> nil) and not l_NotStart.AfterEnd then
  for i := 0 to f_Children.Count - 1 do
  begin
   if (i >= f_FirstItem) and (i <= f_LastItem) then Continue;
   l_Point := f_Children[i];
   if (l_Point <> nil) and l_Point.AtStart then
    RemoveDiff(aView, False, nil, l_NotStart, l_MaxFI, i)
  end; // for i := 0 to f_Children.Count - 1 do
//#UC END# *4DD79DA50099_4DD77A73036E_impl*
end;//TnevTableRowBaseLine4Anchor.DoCompareWithOtherInner

procedure TnevTableRowBaseLine4Anchor.DoInitBaseLineInner(const aView: InevView;
  const anItem: InevPara);
//#UC START# *4DD7A0490365_4DD77A73036E_var*
var
 l_MS    : TevMergeStatus;
 l_RowFI : TnevFormatInfoPrim;
 l_Index : Integer;
 l_Point : InevBasePoint;
//#UC END# *4DD7A0490365_4DD77A73036E_var*
begin
//#UC START# *4DD7A0490365_4DD77A73036E_impl*
 l_Index := anItem.PID;
 if (f_Children.Count <= l_Index) then
  f_Children.Count := l_Index + 1;
 l_Point := anItem.MakeAnchor;
 l_MS := TevMergeStatus(anItem.IntA[k2_tiMergeStatus]);
 if l_MS = ev_msContinue then
 begin
  l_Point := TnevAfterEndPoint.DoMake(l_Point);
  f_HasMergedCell := True;
 end // if (TevMergeStatus(anItem.IntA[k2_tiMergeStatus]) = ev_msContinue) then
 else
 begin
  if (l_MS = ev_msNone) and (TevVerticalAligment(anItem.IntA[k2_tiVerticalAligment]) > ev_valTop) then
  begin
   l_RowFI := aView.FormatInfoByPara(ParaX);
   if (l_RowFI.GreatestObjPID <> l_Index) and (l_RowFI.CompareWithMax(l_Index) <> 0) then
    l_Point := TnevBeforeStartPoint.DoMake(l_Point);
  end; // if (TevVerticalAligment(anItem.IntA[k2_tiVerticalAligment]) > ev_valTop) then
 end;
 f_Children[l_Index] := l_Point;
//#UC END# *4DD7A0490365_4DD77A73036E_impl*
end;//TnevTableRowBaseLine4Anchor.DoInitBaseLineInner

procedure TnevTableRowBaseLine4Anchor.DoInitByCursor(const aView: InevView;
  const anInnerPoint: InevBasePoint);
//#UC START# *4DD7A08200F7_4DD77A73036E_var*
var
 i          : Integer;
 l_PID      : Integer;
 l_FI       : TnevFormatInfoPrim;
 l_RowFI    : TnevFormatInfoPrim;
 l_MS       : TevMergeStatus;
 l_HeadCell : Boolean;
 l_MaxPoint : InevBasePoint;
//#UC END# *4DD7A08200F7_4DD77A73036E_var*
begin
//#UC START# *4DD7A08200F7_4DD77A73036E_impl*
 if (anInnerPoint <> nil) and not anInnerPoint.AfterEnd then
 begin
  l_FI := nil;
  l_MS := TevMergeStatus(anInnerPoint.IntA[k2_tiMergeStatus]);
  if l_MS = ev_msContinue then Exit;
  InitHeadCells(aView);
  l_PID := anInnerPoint.Obj.PID;
  if (TevVerticalAligment(anInnerPoint.IntA[k2_tiVerticalAligment]) > ev_valTop) then
  begin
   l_RowFI := aView.FormatInfoByPara(ParaX);
   if (l_PID <> l_RowFI.GreatestObjPID) and (l_RowFI.CompareWithMax(l_PID) <> 0) and anInnerPoint.AtStart then Exit;
  end; // if (TevVerticalAligment(anInnerPoint.IntA[k2_tiVerticalAligment]) > ev_valTop) then
  if anInnerPoint.Owner.IsSame(ParaX) then
  begin
   f_Children[l_PID] := anInnerPoint.ClonePoint(aView);
   l_MaxPoint := f_Children[l_PID];
   if l_MaxPoint.Inner = nil then                                              
    l_MaxPoint.Move(aView, ev_ocBottomRight);
  end
  else
  begin
   if (f_HeadCells.Count <= l_PID) then
    f_HeadCells.Count := l_PID + 1;
   f_HeadCells[l_PID] := anInnerPoint.ClonePoint(aView);
   l_MaxPoint := f_HeadCells[l_PID];
  end;
  for i := 0 to f_Children.Count - 1 do
  begin
   if i = l_PID then Continue;
   l_HeadCell := (f_Children[i] <> nil) and (TevMergeStatus(f_Children[i].IntA[k2_tiMergeStatus]) = ev_msContinue);
   RemoveDiff(aView, l_HeadCell, nil, {anInnerPoint}l_MaxPoint, l_FI, i)
  end; // for i := 0 to f_Children.Count - 1 do
 end; // if anInnerPoint = nil then
//#UC END# *4DD7A08200F7_4DD77A73036E_impl*
end;//TnevTableRowBaseLine4Anchor.DoInitByCursor

procedure TnevTableRowBaseLine4Anchor.DoAddHeadInner(const aHeadInner: InevBasePoint);
//#UC START# *4DD7A0E30148_4DD77A73036E_var*
var
 l_Cell  : InevTableCell;
 l_Index : Integer;
//#UC END# *4DD7A0E30148_4DD77A73036E_var*
begin
//#UC START# *4DD7A0E30148_4DD77A73036E_impl*
 if (aHeadInner <> nil) and aHeadInner.HasInner and not aHeadInner.Inner.AfterEnd then
 begin
  if aHeadInner.Owner.IsSame(ParaX) then
   l_Index := aHeadInner.Obj.PID
  else
  begin
   aHeadInner.Obj^.QT(InevTableCell, l_Cell);
   l_Cell := l_Cell.GetContinueCell(True, fc_Down);
   if l_Cell = nil then Exit;
   l_Index := l_Cell.PID;
  end;
  if f_HeadCells.Count <= l_Index then
   f_HeadCells.Count := l_Index + 1;
  f_HeadCells[l_Index] := aHeadInner;
 end; // if aHeadInner <> nil then
//#UC END# *4DD7A0E30148_4DD77A73036E_impl*
end;//TnevTableRowBaseLine4Anchor.DoAddHeadInner

end.