unit evDocumentPartHotSpotTester;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest"
// ������: "w:/common/components/gui/Garant/Everest/evDocumentPartHotSpotTester.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi::Everest::HotSpots::TevDocumentPartHotSpotTester
//
// ��������� ���������� IevHotSpotTester � IevHotSpot ��� ����� ���������.
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\Everest\evDefine.inc}

interface

uses
  l3Interfaces,
  afwInterfaces,
  l3Units,
  nevTools,
  evInternalInterfaces,
  nevGUIInterfaces,
  evParaListHotSpotTester,
  l3IID
  ;

type
 TevDocumentPartHotSpotTester = class(TevParaListHotSpotTester, IevAdvancedHotSpot)
  {* ��������� ���������� IevHotSpotTester � IevHotSpot ��� ����� ���������. }
 private
 // private fields
   f_DragArea : TevObjectArea;
   f_Name : Il3CString;
   f_Sub : IevSub;
   f_TopEdge : InevBasePoint;
    {* ������� ������� �����}
   f_BottomEdge : InevBasePoint;
    {* ������ ������� �����}
   f_Area : TevObjectArea;
    {* ���� ��� �������� Area}
 protected
 // realized methods
   function MouseAction(const aView: InevControlView;
    aButton: Tl3MouseButton;
    anAction: Tl3MouseAction;
    const Keys: TevMouseState;
    var Effect: TevMouseEffect): Boolean;
     {* ������������ ������� �� ����. ���������� true - ���� ����������, ����� - false }
   function CanDrag: Boolean;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* ������� ������� ����� �������. }
   procedure DoHitTest(const aView: InevControlView;
    const aState: TafwCursorState;
    var theInfo: TafwCursorInfo); override;
   function COMQueryInterface(const IID: Tl3GUID;
    out Obj): Tl3HResult; override;
     {* ���������� ������� ���������� }
   function DoGetAdvancedHotSpot(const aView: InevControlView;
     const aState: TevCursorState;
     const aPt: InevBasePoint;
     const aMap: InevMap;
     out theSpot: IevHotSpot): Boolean; override;
 protected
 // protected fields
   thisMap : InevMap;
 protected
 // protected methods
   procedure CheckSub;
   function GetName: Il3CString;
   function GetHintPrefix(const aState: TafwCursorState): Il3CString; virtual;
   function DoDrop(const aView: InevControlView;
     const aPt: Tl3Point): Boolean;
     {* ������������ ����������� ����� �� aPt. }
   function CanChangeBorder(const aView: InevControlView;
     const aPt: Tl3Point): Boolean;
     {* ��������� ����� �� �������� ������� �����. }
   procedure ChangeBorder(const aView: InevControlView;
     const aPt: Tl3Point);
     {* �������� ������� �����. }
   function GetEdge(const aView: InevView;
     aTop: Boolean): InevBasePoint;
 public
 // public methods
   function ShowParts(const aView: InevControlView): Boolean; virtual;
   function DoMouseAction(const aView: InevControlView;
     aButton: TevMouseButton;
     anAction: TevMouseAction;
     const Keys: TevMouseState;
     var Effect: TevMouseEffect): Boolean; virtual;
 protected
 // protected properties
   property Area: TevObjectArea
     read f_Area;
 end;//TevDocumentPartHotSpotTester

implementation

uses
  k2Tags,
  l3Base,
  evDocumentPart,
  nevInterfaces,
  Classes,
  l3String,
  SysUtils,
  evOp,
  evHotSpotMisc,
  l3InterfacesMisc,
  Block_Const,
  ParaList_Const,
  l3Memory,
  nevBase,
  k2OpMisc,
  evMsgCode,
  evCursorTools,
  TextPara_Const,
  evTypes,
  evdInterfaces,
  TableCell_Const
  ;

const
   { InternalConst }
  cnInitOperation : array [Boolean] of Integer = (ev_ocBottomRight, ev_ocTopLeft);

// start class TevDocumentPartHotSpotTester

procedure TevDocumentPartHotSpotTester.CheckSub;
//#UC START# *4F9655E60184_4A27B5510171_var*
var
 l_SubList : InevSubList;
//#UC END# *4F9655E60184_4A27B5510171_var*
begin
//#UC START# *4F9655E60184_4A27B5510171_impl*
 if (f_Sub = nil) then
 begin
  l_SubList := ParaX.MainSubList;
  if (l_SubList <> nil) then
   try
    with TagInst.Attr[k2_tiHandle] do
     if IsValid then
      f_Sub := l_SubList.Sub[AsLong];
   finally
    l_SubList := nil;
   end;//try..finally
 end;//f_Sub = nil
//#UC END# *4F9655E60184_4A27B5510171_impl*
end;//TevDocumentPartHotSpotTester.CheckSub

function TevDocumentPartHotSpotTester.GetName: Il3CString;
//#UC START# *4F96560203C8_4A27B5510171_var*
//#UC END# *4F96560203C8_4A27B5510171_var*
begin
//#UC START# *4F96560203C8_4A27B5510171_impl*
 if (f_Name = nil) then
 begin
  if (f_Sub = nil) then
   Result := l3CStr(evGetBlockName(TagInst).AsPCharLen)
  else
   Result := l3CStr(f_Sub.Name);
  f_Name := Result;
 end//f_Name = nil
 else
  Result := f_Name;
//#UC END# *4F96560203C8_4A27B5510171_impl*
end;//TevDocumentPartHotSpotTester.GetName

function TevDocumentPartHotSpotTester.GetHintPrefix(const aState: TafwCursorState): Il3CString;
//#UC START# *4F96562802A7_4A27B5510171_var*
//#UC END# *4F96562802A7_4A27B5510171_var*
begin
//#UC START# *4F96562802A7_4A27B5510171_impl*
 Result := nil;
 case f_Area of
  ev_oaCollapse   :
   if TagInst.BoolA[k2_tiCollapsed] then
    Result := str_nevdphExpand.AsCStr
   else
    Result := str_nevdphCollapse.AsCStr;
  ev_oaLeftEdge   :
   Result := str_nevdphSelect.AsCStr;
  ev_oaProperties :
  begin
   if (ssCtrl in aState.rKeys) then
    Result := str_nevdphMove.AsCStr
   else
   if (ssShift in aState.rKeys) then
    Result := str_nevdphChangeTopBorder.AsCStr
   else
    Result := str_nevdphProperties.AsCStr;
  end;//ev_oaProperties
  ev_oaBottomEdge :
   if (ssShift in aState.rKeys) then
    Result := str_nevdphChangeBottomBorder.AsCStr
   else
    Exit;
  else
   Exit;
 end;//case f_Area
//#UC END# *4F96562802A7_4A27B5510171_impl*
end;//TevDocumentPartHotSpotTester.GetHintPrefix

function TevDocumentPartHotSpotTester.DoDrop(const aView: InevControlView;
  const aPt: Tl3Point): Boolean;
//#UC START# *4F96565C038E_4A27B5510171_var*
//#UC END# *4F96565C038E_4A27B5510171_var*
begin
//#UC START# *4F96565C038E_4A27B5510171_impl*
 Result := false;
//#UC END# *4F96565C038E_4A27B5510171_impl*
end;//TevDocumentPartHotSpotTester.DoDrop

function TevDocumentPartHotSpotTester.CanChangeBorder(const aView: InevControlView;
  const aPt: Tl3Point): Boolean;
//#UC START# *4F96578503B9_4A27B5510171_var*
var
 l_Result: Boolean absolute Result;

 procedure lp_CheckEdge(aTop: Boolean);
 var
  l_EdgePoint : InevBasePoint;
  l_MousePoint: InevBasePoint;
 begin
  l_MousePoint := aView.PointByPt(aPt, True);
  l_Result := l_MousePoint <> nil;
  if l_Result then
  begin
   l_EdgePoint := GetEdge(aView, not aTop);
   if aTop then
    l_Result := l_MousePoint.Diff(aView, l_EdgePoint, aView.FormatInfoByPoint(l_MousePoint)) <= 0
   else
    l_Result := l_MousePoint.Diff(aView, l_EdgePoint, aView.FormatInfoByPoint(l_MousePoint)) >= 0;
  end; // if l_Result then
 end;
 
//#UC END# *4F96578503B9_4A27B5510171_var*
begin
//#UC START# *4F96578503B9_4A27B5510171_impl*
 Result := True;
 if (f_DragArea in [ev_oaTopEdge, ev_oaBottomEdge]) then
  lp_CheckEdge(f_DragArea = ev_oaTopEdge);
//#UC END# *4F96578503B9_4A27B5510171_impl*
end;//TevDocumentPartHotSpotTester.CanChangeBorder

procedure TevDocumentPartHotSpotTester.ChangeBorder(const aView: InevControlView;
  const aPt: Tl3Point);
//#UC START# *4F9657D00104_4A27B5510171_var*
var
 l_InsCursor : InevBasePoint; // - ������ ��� �������

  procedure CheckInsCursor;
  var
   l_Cursor : InevBasePoint;
  begin//CheckInsCursor
   l_Cursor := l_InsCursor.MostInner;
   if not l3IEQ(l_Cursor.ParentPoint, l_InsCursor) then
   begin
    l_Cursor := l_Cursor.ParentPoint;
    while True do
    begin
     if (l_Cursor.ParentPoint = nil) then
      Break;
     with l_Cursor.Obj^ do
      if not InheritsFrom(k2_idBlock) OR
         // - ���� ��� �� ����
         not IsSame(ParaX.Owner) then
         // - ��� ���� �� ��� ��������
       l_Cursor := l_Cursor.ParentPoint
       // - ���������� �� ������� ����
      else
       Break; // - ����� ����� �������
    end;//while true
    if l_Cursor.Inner.Obj.InheritsFrom(k2_idParaList) then
     // - ���������� �����, �������� etc
     l_Cursor.Inner := nil;
     // - ��������� ������ � ������ ����� �������
   end;//l_Cursor.Parent <> l_InsCursor
  end;//CheckInsCursor

var
 l_TopBorder  : Boolean;
 l_TopDiff    : Integer;
 l_BottomDiff : Integer;

  function lp_CheckOutWholeBlock: Boolean;
  begin
   Result := ParaX.ChildrenCount = 1;
   if not Result then
    Result := l_TopBorder and (l_BottomDiff = 0);
  end;

var
 l_BPoint : InevBasePoint;

 procedure lp_CorrectPoint;
 var
  l_TablePoint: InevBasePoint;
 begin
  l_BPoint.MostInner.Move(aView, cnInitOperation[l_TopBorder]); // http://mdp.garant.ru/pages/viewpage.action?pageId=200085942
  if l_BPoint.MostInner.ParentPoint.InheritsFrom(k2_idTableCell) then // http://mdp.garant.ru/pages/viewpage.action?pageId=360024475
  begin
   l_TablePoint := l_BPoint.MostInner.ParentPoint.ParentPoint.ParentPoint;
   if l_TopBorder then
    if l_TablePoint.Position >= (l_TablePoint.Obj^.ChildrenCount div 2 + 1) then
     l_TablePoint.Move(aView, cnInitOperation[not l_TopBorder])
    else
     l_TablePoint.Move(aView, cnInitOperation[l_TopBorder])
   else
    if l_TablePoint.Position <= (l_TablePoint.Obj^.ChildrenCount div 2 + 1) then
     l_TablePoint.Move(aView, cnInitOperation[not l_TopBorder])
    else
     l_TablePoint.Move(aView, cnInitOperation[l_TopBorder]);
  end; // if l_BPoint.MostInner.ParentPoint.InheritsFrom(k2_idTableCell) then
 end;

 function lp_GetParent(const aBorderPoint: InevBasePoint): InevBasePoint;
 var
  l_CurrentPoint  : InevBasePoint;
  l_TopBorderPoint: InevBasePoint;
 begin
  l_TopBorderPoint := aBorderPoint.PointToParentByLevel(MaxInt);
  l_CurrentPoint := l_BPoint;
  while l_TopBorderPoint.IsSame(l_CurrentPoint) do
  begin
   Result := l_TopBorderPoint;
   l_TopBorderPoint := l_TopBorderPoint.Inner;
   l_CurrentPoint := l_CurrentPoint.Inner;
   if (l_TopBorderPoint = nil) or (l_CurrentPoint = nil) then Break;
  end; // while l_TopBorderPoint.IsSame(l_CurrentPoint) do
 end;

const
 ctFlags4Delete: array [Boolean] of TevInsertParaFlags = ([ev_ipfAtEnd], []);
var
 l_MoveOp      : LongInt;
 l_MoveOp1     : LongInt;
 l_Border      : InevBasePoint; // - ������ �������
 l_NewBorder   : InevBasePoint; // - ����� �������
 l_DelBlock    : InevRange;     // - ���� ��� ��������
 l_Mem         : Tl3MemoryPool;
 l_Op          : InevOp;
 l_OutOfBlock  : Boolean;
 l_NeedJoin    : Boolean;
 l_Flags       : TevLoadFlags;
 l_Pt          : Tl3Point;
 l_FI          : TnevFormatInfoPrim;
 l_InsCursorMI : InevBasePoint;
 l_NewBorderMI : InevBasePoint;
 l_ParentBlock : InevBasePoint;
//#UC END# *4F9657D00104_4A27B5510171_var*
begin
//#UC START# *4F9657D00104_4A27B5510171_impl*
 if (aView <> nil) AND CanChangeBorder(aView, aPt) then
 begin
  l_Op := k2StartOp(Processor, ev_msgDeletePara);
  try
   if (l_Op <> nil) then l_Op.Lock;
   try
    with ParaX do
    begin
     l_TopBorder := f_DragArea = ev_oaTopEdge;
     if l_TopBorder then
     begin
      l_MoveOp := ev_ocPrevParaBottomRight;
      l_MoveOp1 := ev_ocParaUp;
     end//l_TopBorder
     else
     begin
      l_MoveOp := ev_ocNextParaTopLeft;
      l_MoveOp1 := ev_ocParaDown;
     end;//l_TopBorder
     try
      try
       try
        l_Border := MakePoint;
        try
         l_Pt := l3Point(l_Pt.X, aPt.Y);
         l_BPoint := aView.PointByPt(aPT);
         lp_CorrectPoint;
         l_Border.Move(aView, cnInitOperation[l_TopBorder]);
         // - �������������� ������
         l_NeedJoin := False;
         l_FI := aView.FormatInfoByPoint(l_BPoint);
         l_TopDiff := l_BPoint.Diff(aView, GetEdge(aView, True), l_FI);
         l_BottomDiff := l_BPoint.Diff(aView, GetEdge(aView, False), l_FI);
         if l_TopBorder then
         begin
          if l_TopDiff = 0 then Exit;
         end
         else
          if l_BottomDiff = 0 then Exit;
         l_OutOfBlock := (l_TopDiff >= 0) and (l_BottomDiff <= 0);
         if l_OutOfBlock then // ����������� �� ����...
         begin
          if lp_CheckOutWholeBlock then Exit;
          // ������� ������������. ���� �������� � ������ ��� � �����, �� ��������� ������, � ������� ����� ����������...
          l_Border := lp_GetParent(l_Border);
          with l_Border{, GetRedirect^} do
           if InheritsFrom(k2_idBlock) then
           begin
            if (Position = 1) OR
               (Position = ChildrenCount) then
            begin
             evInsertPara(l_Op, l_Border, k2_typTextPara.MakeTag, ctFlags4Delete[l_TopBorder]);
             l_NeedJoin := True;
            end;//l_TopBorder
           end;//InheritsFrom(k2_idBlock)
         end;//l_OutOfBlock
         l_Border := l_Border.PointToParentByLevel(MaxInt);
         if (l_Border = nil) then
          Exit;
         l_InsCursor := l_Border.ClonePoint(aView);
         l_ParentBlock := l_Border.ClonePoint(aView);
         if l_ParentBlock.MostInner.ParentPoint.Move(aView, l_MoveOp) then
         begin
          if not (l_OutOfBlock and l_InsCursor.MostInner.ParentPoint.AtEnd(aView)) then
           l_InsCursor := l_ParentBlock;
         end // if l_ParentBlock.MostInner.ParentPoint.Move(aView, l_MoveOp) then
         else
         begin
          l_InsCursor := l_ParentBlock;
          if not l_OutOfBlock then
           { TODO -o����� �. �. -c��������� :
 �������� ��������� ���� �� ������� ���������.
 ������ �� ��������, �.�. ����������� �������� l_NewBorder.SetScreen(aPt);
 � ������� ����� �������, �������� ����������:
  evMoveCursor(l_NewBorder, l_InitOp); }
           Exit
          else
          if l_InsCursor.MostInner.ParentPoint.Move(aView, l_MoveOp1, l_Op) then
           l_NeedJoin := True
          else
           Exit;
         end;//not evMoveCursor(l_InsCursor.BottomChild.Parent As _TevCursor, l_MoveOp)
         // - ��������� ������ ��� �������
         if l_OutOfBlock then
         begin
          // - ����������� ��������� �� �����
          if (l_BPoint = nil) then
           Exit
          else
           l_NewBorder := l_BPoint;
          if not l_NeedJoin then
          begin
           l_InsCursorMI := l_InsCursor.MostInner;
           l_NewBorderMI := l_NewBorder.MostInner;
           l_NeedJoin := l_NewBorderMI.AtEnd(aView) and l_InsCursorMI.AtStart and (l_NewBorderMI.Compare(l_InsCursorMI) = 1);
          end; // if not l_NeedJoin then
         end//l_OutOfBlock
         else
         begin
          // - ����������� ��������� � ����
          l_NewBorder := l_BPoint;
          l_NewBorderMI := l_NewBorder.MostInner;
          l3Swap(Pointer(l_InsCursor), Pointer(l_Border));
         end;//l_OutOfBlock
         if (l_NewBorder.Compare(l_Border) <= 0) then
          l_DelBlock := l_Border.Obj.Range(l_NewBorder, l_Border)
         else
          l_DelBlock := l_Border.Obj.Range(l_Border, l_NewBorder);
         l_Mem := Tl3MemoryPool.Create;
         try
          l_DelBlock.Data.Store(cf_EverestBin, l_Mem As IStream, nil, evDefaultStoreFlags + [evd_sfInternal] - [evd_sfStoreParaEnd]);
          // - ����� ��������� ����
          l_DelBlock.Modify.Delete(aView, l_Op, ev_cmEmpty4BlockResize);
          // - ������� ����
          if l_OutOfBlock then
           // - ������������� ��������� ���������� � ������ ���� ��� �������
           CheckInsCursor
          else
           evShrinkCursorChildren(l_InsCursor, ParaX);
          l_Flags := evDefaultLoadFlags + [ev_lfInternal];
          if l_NeedJoin then
           l_Flags := l_Flags + [ev_lfNeedJoin]
          else
           l_Flags := l_Flags - [ev_lfNeedJoin];
          if not l_NeedJoin AND ((l_TopBorder AND l_OutOfBlock)
             OR (not l_TopBorder))  then
           l_Flags := l_Flags + [ev_lfAtEnd];
          l_InsCursor.Text.Modify.InsertStream(aView, l_Mem As IStream, cf_EverestBin, l_Op, l_Flags);
          // - ��������� ���� � ������ �����
         finally
          l3Free(l_Mem);
         end;//try..finally
        finally
         l_Border := nil;
        end;//try..finally
       finally
        l_NewBorder := nil;
       end;//try..finally
      finally
       l_InsCursor := nil;
      end;//try..finally
     finally
      l_DelBlock := nil;
     end;//try..finally
    end;//with ParaX
   finally
    if (l_Op <> nil) then l_Op.Unlock;
   end;//try..finally
  finally
   l_Op := nil;
  end;//try..finally
 end;//CanChangeBorder..
//#UC END# *4F9657D00104_4A27B5510171_impl*
end;//TevDocumentPartHotSpotTester.ChangeBorder

function TevDocumentPartHotSpotTester.ShowParts(const aView: InevControlView): Boolean;
//#UC START# *4F965819031F_4A27B5510171_var*
//#UC END# *4F965819031F_4A27B5510171_var*
begin
//#UC START# *4F965819031F_4A27B5510171_impl*
 Result := False;
 if (aView <> nil) then
  Result := aView.Metrics.ShowDocumentParts;
//#UC END# *4F965819031F_4A27B5510171_impl*
end;//TevDocumentPartHotSpotTester.ShowParts

function TevDocumentPartHotSpotTester.DoMouseAction(const aView: InevControlView;
  aButton: TevMouseButton;
  anAction: TevMouseAction;
  const Keys: TevMouseState;
  var Effect: TevMouseEffect): Boolean;
//#UC START# *4F96584801B7_4A27B5510171_var*

 procedure DoDouble;
 begin//DoDouble
  case f_Area of
   ev_oaLeftEdge :
   begin
    evSelectBlock(aView.Control.Selection, Self.ParaX);
    Effect.rNeedAsyncLoop := False;
    Result := True;
   end;//ev_oaLeftEdge
   ev_oaCollapse:
   begin
    Effect.rNeedAsyncLoop := False;
    Result := True;
    with TagInst do
     BoolW[k2_tiCollapsed, k2StartOp(Processor)] := not BoolA[k2_tiCollapsed];
   end;//ev_oaCollapse
   ev_oaBottomEdge :
    Result := True;
   else
    Result := False;
  end;//Case f_Area
 end;//DoDouble
 
//#UC END# *4F96584801B7_4A27B5510171_var*
begin
//#UC START# *4F96584801B7_4A27B5510171_impl*
 CheckSub;
 case aButton of
  ev_mbLeft :
  begin
   case anAction of
    ev_maDown:
    begin
     if (f_Area = ev_oaNone) then
      Result := False
     else
     begin
      Result := True;
      if (ssCtrl in Keys.rKeys) then
      begin
       if (f_Area = ev_oaProperties) then
        f_DragArea := ev_oaDragPoint;
      end
      else
      if (ssShift in Keys.rKeys) then
      begin
       case f_Area of
        ev_oaProperties : f_DragArea := ev_oaTopEdge;
        ev_oaBottomEdge : f_DragArea := ev_oaBottomEdge;
       end;//case f_Area of
      end;//ssCtrl in Keys.rKeys
     end;//f_Area = ev_oaNone
     {$IfDef Nemesis}
     DoDouble;
     {$EndIf Nemesis}
     if Result then
     begin
      if (f_DragArea in [ev_oaTopEdge, ev_oaBottomEdge]) then
       Effect.rStrob := afw_stHorz;
     end;//Result
    end;//ev_maDown
    ev_maMove:
    begin
     if (f_DragArea <> ev_oaNone) then
     begin
      Result := CanChangeBorder(aView, Tl3Point(Keys.rPoint));
      case f_DragArea of
       ev_oaTopEdge,
       ev_oaBottomEdge :
       begin
        aView.Control.Selection.SelectPt(Keys.rPoint, false);
        aView.Control.Selection.Point.MostInner.Move(aView, cnInitOperation[f_DragArea = ev_oaTopEdge]);
        // http://mdp.garant.ru/pages/viewpage.action?pageId=200085942
        aView.Control.ViewArea.Update;
       end;//ev_oaTopEdge
       else
        aView.Control.Selection.SelectPt(Keys.rPoint, true);
      end;//case f_DragArea of
     end//f_DragArea <> ev_oaNone
     else
      Result := False;
    end;//ev_maMove
    ev_maUp:
    begin
     case f_DragArea of
      ev_oaDragPoint :
      begin
       if (ssCtrl in Keys.rKeys) then
        DoDrop(aView, Tl3Point(Keys.rPoint));
       Result := True;
      end;//ev_oaDragPoint
      ev_oaTopEdge,
      ev_oaBottomEdge :
      begin
       if (ssShift in Keys.rKeys) then
        ChangeBorder(aView, Tl3Point(Keys.rPoint));
       Result := True;
      end;//ev_oaTopEdge..
      else
       Result := False;
     end;//case f_DragAread
     f_DragArea := ev_oaNone;
    end;//ev_maUp
    {$IfNDef Nemesis}
    ev_maDouble :
     DoDouble;
    {$EndIf  Nemesis}
    else
     Result := False;
   end;//Case anAction
  end;//ev_mbLeft
  else
   Result := False;
 end;//case aButton
//#UC END# *4F96584801B7_4A27B5510171_impl*
end;//TevDocumentPartHotSpotTester.DoMouseAction

function TevDocumentPartHotSpotTester.GetEdge(const aView: InevView;
  aTop: Boolean): InevBasePoint;
//#UC START# *4F969E7001AD_4A27B5510171_var*
//#UC END# *4F969E7001AD_4A27B5510171_var*
begin
//#UC START# *4F969E7001AD_4A27B5510171_impl*
 if aTop then
 begin
  if f_TopEdge = nil then
  begin
   f_TopEdge := ParaX.Para[0].MakePoint;
   f_TopEdge.Move(aView, ev_ocTopLeft);
   f_TopEdge := f_TopEdge.PointToParentByLevel(MaxInt);
  end; // if f_TopEdge = nil then
  Result := f_TopEdge;
 end
 else
 begin
  if f_BottomEdge = nil then
  begin
   f_BottomEdge := ParaX.Para[ParaX.ParaCount - 1].MakePoint;
   f_BottomEdge.Move(aView, ev_ocBottomRight);
   f_BottomEdge := f_BottomEdge.PointToParentByLevel(MaxInt);
  end; // if f_BottomEdge = nil then
  Result := f_BottomEdge;
 end;
//#UC END# *4F969E7001AD_4A27B5510171_impl*
end;//TevDocumentPartHotSpotTester.GetEdge

function TevDocumentPartHotSpotTester.MouseAction(const aView: InevControlView;
  aButton: Tl3MouseButton;
  anAction: Tl3MouseAction;
  const Keys: TevMouseState;
  var Effect: TevMouseEffect): Boolean;
//#UC START# *48E263CD01BD_4A27B5510171_var*
//#UC END# *48E263CD01BD_4A27B5510171_var*
begin
//#UC START# *48E263CD01BD_4A27B5510171_impl*
 Result := DoMouseAction(aView, aButton, anAction, Keys, Effect);
//#UC END# *48E263CD01BD_4A27B5510171_impl*
end;//TevDocumentPartHotSpotTester.MouseAction

function TevDocumentPartHotSpotTester.CanDrag: Boolean;
//#UC START# *4ECCD6840014_4A27B5510171_var*
//#UC END# *4ECCD6840014_4A27B5510171_var*
begin
//#UC START# *4ECCD6840014_4A27B5510171_impl*
 Result := True;
//#UC END# *4ECCD6840014_4A27B5510171_impl*
end;//TevDocumentPartHotSpotTester.CanDrag

procedure TevDocumentPartHotSpotTester.Cleanup;
//#UC START# *479731C50290_4A27B5510171_var*
//#UC END# *479731C50290_4A27B5510171_var*
begin
//#UC START# *479731C50290_4A27B5510171_impl*
 thisMap := nil;
 f_TopEdge := nil;
 f_BottomEdge := nil;
 f_Area := ev_oaNone;
 f_DragArea := ev_oaNone;
 f_Sub := nil;
 f_Name := nil;
 inherited;
//#UC END# *479731C50290_4A27B5510171_impl*
end;//TevDocumentPartHotSpotTester.Cleanup

procedure TevDocumentPartHotSpotTester.DoHitTest(const aView: InevControlView;
  const aState: TafwCursorState;
  var theInfo: TafwCursorInfo);
//#UC START# *4A267FC6016B_4A27B5510171_var*
var
 l_Name : Il3CString;
//#UC END# *4A267FC6016B_4A27B5510171_var*
begin
//#UC START# *4A267FC6016B_4A27B5510171_impl*
 inherited;
 case f_DragArea of
  ev_oaDragPoint :
   theInfo.rCursor := ev_csDrag;
  else
   case f_Area of
    ev_oaCollapse :
     theInfo.rCursor := ev_csHandPoint;
    ev_oaLeftEdge :
     theInfo.rCursor := ev_csArrow;
    ev_oaProperties :
    begin
     if (ssShift in aState.rKeys) then
      theInfo.rCursor := ev_csVSplit
     else
      theInfo.rCursor := ev_csProperties;
    end;//ev_oaProperties
    ev_oaBottomEdge :
     if (ssShift in aState.rKeys) then
      theInfo.rCursor := ev_csVSplit;
   end;//case f_Area
 end;//case f_DragArea
 theInfo.rHint := GetHintPrefix(aState);
 if not l3IsNil(theInfo.rHint) then
 begin
  l_Name := GetName;
  if not l3IsNil(l_Name) then
   theInfo.rHint := l3Cat([l3Cat(theInfo.rHint, ': '), l_Name]);
  with TagInst.Attr[k2_tiHandle] do
   if IsValid then
    theInfo.rHint := l3Cat(l3Cat(theInfo.rHint, ': '), IntToStr(AsLong));
 end;//theInfo.rHint <> ''
//#UC END# *4A267FC6016B_4A27B5510171_impl*
end;//TevDocumentPartHotSpotTester.DoHitTest

function TevDocumentPartHotSpotTester.COMQueryInterface(const IID: Tl3GUID;
  out Obj): Tl3HResult;
//#UC START# *4A60B23E00C3_4A27B5510171_var*
var
 l_Sub : IevSub;
//#UC END# *4A60B23E00C3_4A27B5510171_var*
begin
//#UC START# *4A60B23E00C3_4A27B5510171_impl*
 if IID.EQ(IevSub) then
 begin
  if (f_Sub = nil) then
   CheckSub; // !!! �������� !!!
  if (f_Sub = nil) then
  begin
   Result.SetNoInterface;
   Pointer(Obj) := nil;
  end//f_Sub = nil
  else
  begin
   Result.SetOk;
   IevSub(Obj) := f_Sub;
  end;//f_Sub = nil
 end//IID.EQ(IevSub)
 else
 if IID.EQ(IevDocumentPart) then
 begin
  if l3IOk(QueryInterface(IevSub, l_Sub)) then
   try
    Result := Tl3HResult_C(l_Sub.QueryInterface(IID.IID, Obj));
   finally
    l_Sub := nil;
   end//try..finally
  else
   Result := inherited COMQueryInterface(IID, Obj);
 end//IID.EQ(IevDocumentPart)
 else
  Result := inherited COMQueryInterface(IID, Obj);
//#UC END# *4A60B23E00C3_4A27B5510171_impl*
end;//TevDocumentPartHotSpotTester.COMQueryInterface

function TevDocumentPartHotSpotTester.DoGetAdvancedHotSpot(const aView: InevControlView;
  const aState: TevCursorState;
  const aPt: InevBasePoint;
  const aMap: InevMap;
  out theSpot: IevHotSpot): Boolean;
//#UC START# *4E6E4F91001A_4A27B5510171_var*
var
 l_Pt          : TnevPoint;
 l_HotSpotSink : IevHotSpotSink;
{$IFNDEF Nemesis}
 l_Map         : InevMap;
 l_ChildPoint  : InevBasePoint;
{$ENDIF Nemesis}
//#UC END# *4E6E4F91001A_4A27B5510171_var*
begin
//#UC START# *4E6E4F91001A_4A27B5510171_impl*
 thisMap := aMap;
 f_Area := ev_oaNone;
 if (aMap <> nil) then
 begin
  l_Pt := Tl3Point(aState.rPoint).Sub(aMap.Bounds.R.TopLeft);
  begin
   if (l_Pt.X >= 0) AND (l_Pt.Y >= 0) then
   begin
    if (l_Pt.Y < evDocumentPartMargin * 2) then
    begin
     if ShowParts(aView) then
     begin
      {$IfDef evNeedCollapseBlocks}
      if (l_Pt.X < evDocumentPartMargin * 2) then
       f_Area := ev_oaCollapse
      else
      {$EndIf evNeedCollapseBlocks}
      {$IfNDef Nemesis}
      if (l_Pt.Y < evDocumentPartMargin) then
       f_Area := ev_oaProperties
      else
      {$EndIf  Nemesis}
       f_Area := ev_oaNone;
     end//ShowParts..
     else
      f_Area := ev_oaNone;
    end//l_Pt.Y < evDocumentPartMargin
    else
    if ShowParts(aView) then
    begin
     if (l_Pt.X < evDocumentPartMargin) then
      f_Area := ev_oaLeftEdge
     {$IFNDEF Nemesis}
     else
      if (l_Pt.Y >= aMap.Bounds.Bottom - aMap.Bounds.Top - evDocumentPartMargin) then
      begin
       l_ChildPoint := aPt.ClonePoint(aView);
       l_ChildPoint.SetAtEnd(aView, True);
       l_ChildPoint := l_ChildPoint.MostInner;
       if not l_ChildPoint.IsSame(aPt.Obj^) then
       begin
        l_Map := aView.MapByPoint(l_ChildPoint);
        if (l_Map <> nil) then
         if (l_Map.Bounds.Bottom <= aMap.Bounds.Bottom) then
          f_Area := ev_oaBottomEdge;
       end;//if not l_ChildPoint.IsSame(aPt.Obj^) then
      end;//if (l_Pt.Y >= aMap.Bounds.Bottom - aMap.Bounds.Top - evDocumentPartMargin) then
     {$ENDIF Nemesis}
    end;//l_Pt.Y < evDocumentPartMargin
   end;//l_Pt.X >= 0
  end;//IID.EQ(IevAdvancedHotSpot)
 end;//aMap <> nil
 if (f_Area = ev_oaNone) then
  Result := inherited DoGetAdvancedHotSpot(aView, aState, aPt, aMap, theSpot)
 else
 begin
  aView.Control.QueryInterface(IevHotSpotSink, l_HotSpotSink);  
  theSpot := TevHotSpotWrap.Make(Self, l_HotSpotSink);
  Result := True;
 end;//f_Area = ev_oaNone
//#UC END# *4E6E4F91001A_4A27B5510171_impl*
end;//TevDocumentPartHotSpotTester.DoGetAdvancedHotSpot

end.