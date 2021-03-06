unit evTableRowPainter;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest"
// �����: ����� �.�.
// ������: "w:/common/components/gui/Garant/Everest/evTableRowPainter.pas"
// �����: 06.06.2007 11:44
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi::Everest::ParaList Painters::TevTableRowPainter
//
// "����������" ����� ������
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
  nevRealTools,
  evParaListPainter,
  l3Interfaces,
  nevBase,
  l3InternalInterfaces
  ;

type
 TevTableRowPainter = class(TevParaListPainter, IevTableRowPainter)
  {* "����������" ����� ������ }
 private
 // private fields
   f_DrawView : Pointer;
 private
 // private methods
   procedure CheckHeight(var l_Height: Integer);
   function GetRowPoint(aMaxIndex: Integer): InevBasePoint;
 protected
 // realized methods
   function CheckChildren(const aFI: TnevFormatInfoPrim;
     const aCanvas: Il3Canvas): Boolean;
     {* [$219123966] }
   procedure CorrectTopDelta(var aDelta: Integer);
   function IsTopAnchorAtStart: Boolean;
   function GetTopAnchor4Row: InevBasePoint;
     {* ���������� ��������� �� ������ �� View.TopAnchor }
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* ������� ������� ����� �������. }
   procedure DoFillSelection; override;
   procedure CheckAlignment(var aFrame: Tl3Frame); override;
   procedure GetFramePartPrim(const aFrame: InevTag;
    anIndex: Tl3FramePartIndex;
    var thePart: TnevFramePart); override;
   function DoDraw: Boolean; override;
     {* ���������� ��������� ��������� ���������. ��� ���������� � ��������. }
   procedure InitBottom(var theBottom: InevBasePoint;
    var theCellBottom: InevBasePoint); override;
   function ChildInSelection(const aPara: InevPara): Boolean; override;
   procedure CheckChild(const aPara: InevPara); override;
   procedure InitInnerBottom(const aChildInfo: TnevShapeInfo); override;
   function GetTableRowPainter: IevTableRowPainter; override;
   function NeedsHackK235870994: Boolean; override;
   function NeedPrintingChild(const aChild: InevPara): Boolean; override;
   procedure CheckNeedLaterFilling(const aPainterHolder: InevPaintersHolder;
     const aChildMap: InevMap); override;
 protected
 // protected methods
   procedure CorrectRowHeightByTopSpace(var aDelta: Integer); virtual;
     {* �������� �������� ������� ������� ������� ����� ��� ��. }
 end;//TevTableRowPainter

implementation

uses
  SysUtils,
  k2Tags,
  l3Const,
  l3MinMax,
  evdTypes,
  Table_Const,
  TableCell_Const,
  nevFacade,
  Classes,
  evTableCellUtils
  {$If defined(nsTest)}
  ,
  PrintRowHeightsSpy
  {$IfEnd} //nsTest
  ,
  Block_Const,
  evParaTools,
  TableRow_Const
  ;

// start class TevTableRowPainter

procedure TevTableRowPainter.CheckHeight(var l_Height: Integer);
//#UC START# *4B3B2F3C01B2_48C7E98600AB_var*
var
 l_Cell   : InevParaList;
 l_Delta  : Integer;
 l_CellFI : TnevFormatInfoPrim;

 function IncDelta(const aTag: InevPara; anIndex: TnevParaIndex): Boolean;
 var
  l_FI : TnevFormatInfoPrim;
 begin//IncDelta
  l_FI := l_CellFI.InfoForChild(aTag);
  Inc(l_Delta, l_FI.Height);
  Result := True;
 end;//IncDelta

 procedure lp_InitFI;
 var
  l_RowPara   : InevParaList;
  l_HeadRowFI : TnevFormatInfoPrim;
 begin
  l_RowPara := l_Cell.OwnerPara;
  l_HeadRowFI := FormatInfo.ParentInfo.InfoForChild(l_RowPara);
  l_CellFI := l_HeadRowFI.InfoForChild(l_Cell);
 end;

var
 l_ChildMap : InevMap;
 l_ChildID  : Integer;
 l_Point    : InevBasePoint;
 l_Leaf     : InevLeafPoint;
 l_MaxIndex : Integer;
 l_LeafFI   : TnevFormatInfoPrim;
 l_View     : InevView;
 l_BottomM  : Integer;
//#UC END# *4B3B2F3C01B2_48C7E98600AB_var*
begin
//#UC START# *4B3B2F3C01B2_48C7E98600AB_impl*
 l_MaxIndex := FormatInfo.GreatestObjPID;
 if l_MaxIndex > -1 then // ���� ������� ������������ ������.
 begin
  // ����� Top ��� Head-������ � ������� ������� ��� Head-������.
  l_Point := GetRowPoint(l_MaxIndex);
  if (l_Point <> nil) then
  begin
   l_Cell := l_Point.Obj^.AsPara.AsList;
   Assert(l_Cell.InheritsFrom(k2_idTableCell));
   l_Point := l_Point.MostInner;
   if (l_Point <> nil) then
    if l_Point.Owner.IsSame(l_Cell) then
    begin
     // ��������� PaintOffsetY ��� ���� �����.
     l_Leaf := l_Point.AsLeaf;
     if (l_Leaf <> nil) then
     begin
      lp_InitFI;
      l_LeafFI := l_CellFI.InfoForChild(l_Point.Obj^);
      l_View := Area.rView.As_InevView;
      l_BottomM := l_CellFI.Spacing.Bottom;
      l_Delta := l_LeafFI.Height - l_Leaf.PaintOffsetY(l_View, l_LeafFI) + l_BottomM - Map.Bounds.Top;
      l_Cell.AsList.IterateParaF(nevL2PIA(@IncDelta), l_Point.Obj^.PID + 1);
      CorrectRowHeightByTopSpace(l_Delta);
      if (l_Delta > 0) then
       if ((l_Delta - l_Height) mod l_BottomM) = 0 then
        l_Height := l_Delta
       else
        l_Height := Min(l_Height, l_Delta)
      else
       if (TevMergeStatus(l_Cell.IntA[k2_tiMergeStatus]) = ev_msNone) then
        if (l_Delta < 0) and ((Map.Bounds.Bottom - Map.Bounds.Top) < 2 * l3Epsilon) then
        begin
         l_Height := -l_Delta + l_Height + l_BottomM - Map.Bounds.Top;
         Map.SetDrawnTop(Map.Bounds.Top - l_Height);
        end; // if (l_Delta < 0) and ((Map.Bounds.Bottom - Map.Bounds.Top) < 2 * evEpsilon) then
     end; // if (l_Leaf <> nil) then
    end // if l_Point.Owner.IsSame(l_Cell) then
    else
    begin
     // V - $370383768. �� CheckHeight ��� ������ ��� ���������� ��������� �� �����������, � ��� ���� � �� ����������� � ������ ��������� ������...
     if l_Point.HasBaseLine then // ��������� �� ������� ������ �������� �������
     begin
      l_Point := l_Point.ParentPoint;
      l_ChildID := l_Point.Obj.PID; // ID �������� �������.
      l_Point := l_Point.ParentPoint;
      l_ChildMap := Map.GetChildMap(l_ChildID); // ���� �������� ������...
      if l_ChildMap <> nil then
      begin
       l_ChildMap := l_ChildMap.GetChildMap(l_ChildID); // �������� �������...
       l_Cell := l_Point.Obj^.AsPara.AsList;
       Assert(l_Cell.InheritsFrom(k2_idTableCell)); 
       if l_ChildMap <> nil then
       begin
        l_Delta := l_ChildMap.Bounds.Bottom;
        lp_InitFI;
        l_Cell.AsList.IterateParaF(nevL2PIA(@IncDelta), l_ChildID + 1);
        l_Height := Min(l_Height, l_Delta);
       end; // if l_ChildMap <> nil then
      end; // if l_ChildMap <> nil) then
     end; // if l_Point.HasBaseLine then
    end;
   end; // if (l_Point <> nil) then
  end; // if l_MaxIndex > -1 then
//#UC END# *4B3B2F3C01B2_48C7E98600AB_impl*
end;//TevTableRowPainter.CheckHeight

function TevTableRowPainter.GetRowPoint(aMaxIndex: Integer): InevBasePoint;
//#UC START# *508FA94102B2_48C7E98600AB_var*
var
 l_Real : InevBasePoint;
 l_Para : InevPara;

 function lp_GetRowPoint: InevBasePoint;
 var
  l_Find     : TnevFindCell;
  l_UpCell   : InevTableCell;
  l_MaxIndex : Integer;
 begin
  Result := GetTopAnchor4Row;
  if Result <> nil then
  begin
   l_Para.QT(InevTableCell, l_UpCell);
   if l_UpCell.OwnerPara.PID <= Result.Obj.PID then
    l_Find := fc_Down
   else
    l_Find := fc_Up;
   while (l_UpCell <> nil) and not l_UpCell.Owner.IsSame(Result.Obj^) do
    l_UpCell := l_UpCell.GetContinueCell(True, l_Find);
   if (l_UpCell = nil) then
    Result := nil // ����� ���������� ������, � �� ������!
   else
    Result := Result.InnerFor(Result.Obj^.AsPara.AsList.Para[l_UpCell.PID], l_Real);
  end; // if Result <> nil then
 end;

//#UC END# *508FA94102B2_48C7E98600AB_var*
begin
//#UC START# *508FA94102B2_48C7E98600AB_impl*
 l_Para := ParaX[aMaxIndex];
 if TopAnchor.AtStart and (l_Para.OverlapType = otLower) then
  Result := lp_GetRowPoint;
 if (Result = nil) then
  Result := TopAnchor.InnerFor(l_Para, l_Real);
 if (Result <> nil) and Result.AfterEnd then
  Result := l_Real;
//#UC END# *508FA94102B2_48C7E98600AB_impl*
end;//TevTableRowPainter.GetRowPoint

procedure TevTableRowPainter.CorrectRowHeightByTopSpace(var aDelta: Integer);
//#UC START# *50D3F47002CA_48C7E98600AB_var*
//#UC END# *50D3F47002CA_48C7E98600AB_var*
begin
//#UC START# *50D3F47002CA_48C7E98600AB_impl*
 
//#UC END# *50D3F47002CA_48C7E98600AB_impl*
end;//TevTableRowPainter.CorrectRowHeightByTopSpace

function TevTableRowPainter.CheckChildren(const aFI: TnevFormatInfoPrim;
  const aCanvas: Il3Canvas): Boolean;
//#UC START# *4C774E7D01CD_48C7E98600AB_var*
var
 l_Check: Boolean absolute Result;
 l_RowFI: TnevFormatInfoPrim;

 function CheckChildPara(const aChild: InevPara; anIndex: Integer): Boolean;
 var
  l_FI: TnevFormatInfoPrim;
 begin
  l_FI := l_RowFI.InfoForChild(aChild);
  if evHasFormulaOnly(aChild, l_FI) then
  begin
   Result := aCanvas.ClipRect.Bottom >= l_FI.Height;
   l_Check := Result;
  end // if evHasFormulaOnly(aChild, l_FI) then
  else
   Result := False;
 end;

//#UC END# *4C774E7D01CD_48C7E98600AB_var*
begin
//#UC START# *4C774E7D01CD_48C7E98600AB_impl*
 l_Check := True;
 if aCanvas.Printing then
 begin
  l_RowFI := aFI.InfoForChild(ParaX);
  ParaX.IterateParaF(nevL2PIA(@CheckChildPara));
 end; // if aCanvas.Printing then
//#UC END# *4C774E7D01CD_48C7E98600AB_impl*
end;//TevTableRowPainter.CheckChildren

procedure TevTableRowPainter.CorrectTopDelta(var aDelta: Integer);
//#UC START# *4D9AF0D00093_48C7E98600AB_var*
var
 l_Delta  : Integer;
 l_CellFI : TnevFormatInfoPrim;

 function lp_IncDelta(const aTag: InevPara; anIndex: TnevParaIndex): Boolean;
 var
  l_FI : TnevFormatInfoPrim;
 begin//lp_IncDelta
  l_FI := l_CellFI.InfoForChild(aTag);
  Inc(l_Delta, l_FI.Height);
  Result := True;
 end;//lp_IncDelta

var
 l_PID       : Integer;
 l_Point     : InevBasePoint;
 l_Leaf      : InevLeafPoint;
 l_Cell      : InevParaList;
 l_HeadRowFI : TnevFormatInfoPrim;
 l_MaxIndex  : Integer;
 l_LeafFI    : TnevFormatInfoPrim;
 l_View      : InevView;
//#UC END# *4D9AF0D00093_48C7E98600AB_var*
begin
//#UC START# *4D9AF0D00093_48C7E98600AB_impl*
 l_MaxIndex := FormatInfo.GreatestObjPID;
 if l_MaxIndex > -1 then // ���� ������� ������������ ������.
 begin
  // ����� Top ��� Head-������ � ������� ������� ��� Head-������.
  l_Point := GetRowPoint(l_MaxIndex);
  if (l_Point <> nil) and not l_Point.AfterEnd then
  begin
   l_Cell := l_Point.Obj^.AsPara.AsList;
   l_Point := l_Point.MostInner;
   if (l_Point <> nil) and l_Point.Owner.IsSame(l_Cell) then
   begin
    // ��������� PaintOffsetY ��� ���� �����.
    l_Leaf := l_Point.AsLeaf;
    if (l_Leaf <> nil) then
    begin
     l_HeadRowFI := FormatInfo.ParentInfo.InfoForChild(l_Cell.OwnerPara);
     l_CellFI := l_HeadRowFI.InfoForChild(l_Cell);
     l_LeafFI := l_CellFI.InfoForChild(l_Point.Obj^);
     l_View := Area.rView.As_InevView;
     l_Delta := l_Leaf.PaintOffsetY(l_View, l_LeafFI);
     if l_Delta > 0 then
      Inc(l_Delta, l_CellFI.Spacing.Bottom);
     l_PID := l_Point.Obj^.PID;
     if l_PID > 0 then
      l_Cell.AsList.IterateParaF(nevL2PIA(@lp_IncDelta), 0, l_PID - 1);
     Dec(aDelta, l_Delta);
     if aDelta < 0 then
      aDelta := 0;
    end; // if (l_Leaf <> nil) and (l_CurrentLeaf <> nil) then
   end; // if (l_Point <> nil) and (l_CurentPoint <> nil) then
  end; // if (l_CurentPoint <> nil) and (l_Point <> nil) then
 end; // if l_MaxIndex > -1 then
//#UC END# *4D9AF0D00093_48C7E98600AB_impl*
end;//TevTableRowPainter.CorrectTopDelta

function TevTableRowPainter.IsTopAnchorAtStart: Boolean;
//#UC START# *4D9AFB1202F9_48C7E98600AB_var*
//#UC END# *4D9AFB1202F9_48C7E98600AB_var*
begin
//#UC START# *4D9AFB1202F9_48C7E98600AB_impl*
 Result := inherited IsTopAnchorAtStart;
//#UC END# *4D9AFB1202F9_48C7E98600AB_impl*
end;//TevTableRowPainter.IsTopAnchorAtStart

function TevTableRowPainter.GetTopAnchor4Row: InevBasePoint;
//#UC START# *50A2210D0105_48C7E98600AB_var*
var
 l_DrawView : InevDrawView;
 l_TopAnchor: InevAnchor;
//#UC END# *50A2210D0105_48C7E98600AB_var*
begin
//#UC START# *50A2210D0105_48C7E98600AB_impl*
 Result := nil;
 if f_DrawView = nil then
 begin
  Supports(Area.rView.As_InevView, InevDrawView, l_DrawView);
  f_DrawView := Pointer(l_DrawView);
  l_DrawView := nil;
 end; // if f_DrawView = nil then
 l_TopAnchor := InevDrawView(f_DrawView).TopAnchor;
 if l_TopAnchor <> nil then
 begin
  Result := l_TopAnchor.Inner;
  while (Result <> nil) and not Result.InheritsFrom(k2_idTableRow) do
  begin
   if Result.InheritsFrom(k2_idTable) and not Result.Obj.IsSame(ParaX.Owner) then
   begin
    Result := nil;
    Break;
   end; // if Result.InheritsFrom(k2_idTable) then
   Result := Result.Inner;
  end; // while Result <> nil do
 end; // if l_TopAnchor <> nil then
//#UC END# *50A2210D0105_48C7E98600AB_impl*
end;//TevTableRowPainter.GetTopAnchor4Row

procedure TevTableRowPainter.Cleanup;
//#UC START# *479731C50290_48C7E98600AB_var*
//#UC END# *479731C50290_48C7E98600AB_var*
begin
//#UC START# *479731C50290_48C7E98600AB_impl*
 f_DrawView := nil;
 inherited;
//#UC END# *479731C50290_48C7E98600AB_impl*
end;//TevTableRowPainter.Cleanup

procedure TevTableRowPainter.DoFillSelection;
//#UC START# *4804B86403BE_48C7E98600AB_var*
var
 l_PaintersHolder : InevPaintersHolder;
//#UC END# *4804B86403BE_48C7E98600AB_var*
begin
//#UC START# *4804B86403BE_48C7E98600AB_impl*
 if not Area.rCanvas.IsVirtual then
 begin
  l_PaintersHolder := ParentPainter.PaintersHolder;
  if (l_PaintersHolder <> nil) then
   if Map.Bounds.Top > 0 then
    l_PaintersHolder.SetHeight(Map.Bounds.Bottom - Map.Bounds.Top)
   else
    l_PaintersHolder.SetHeight(Map.Bounds.Bottom)
  else
   inherited;
 end//not Area.rCanvas.IsVirtual
 else
  inherited;
//#UC END# *4804B86403BE_48C7E98600AB_impl*
end;//TevTableRowPainter.DoFillSelection

procedure TevTableRowPainter.CheckAlignment(var aFrame: Tl3Frame);
//#UC START# *4804B8890228_48C7E98600AB_var*
var
 l_ObjID  : Integer;
 l_Bounds : TnevRect;
 l_DeltaH : Integer;

 procedure lp_CorrectBottom(aCheck: Boolean);
 begin
  if (ParaX.ChildrenCount > 1) and (aCheck or (l_DeltaH - (l_Bounds.Bottom - l_Bounds.Top) >= l3Epsilon)) then
  begin
   l_Bounds.Bottom := l_Bounds.Top + l_DeltaH + Area.rCanvas.FrameLines.GetLineWidth(l_ObjID);
   if Area.rCanvas.Printing then
    l_Bounds.Bottom := Min(l_Bounds.Bottom, Area.rCanvas.GlobalClipRect.Bottom);
   Map.SetDrawnBottom(l_Bounds.BottomRight);
   aFrame.rRect := l_Bounds;//Map.Bounds;
  end; // if (ParaX.ChildrenCount > 1) and (l_DeltaH - (l_Bounds.Bottom - l_Bounds.Top) >= l3Epsilon) then
 end;

{$IFDEF nsTest}
var
 l_UseCheck4Printing : Boolean;
 l_Data              : TRowHeight;
{$ENDIF nsTest}
//#UC END# *4804B8890228_48C7E98600AB_var*
begin
//#UC START# *4804B8890228_48C7E98600AB_impl*
 l_ObjID := Integer(ParaX.OwnerPara.Box.AsObject);
 {$IFDEF nsTest}
 l_UseCheck4Printing := False;
 {$ENDIF nsTest}
 if (FormatInfo.DeltaHeight > 0) then
 begin
  l_Bounds := Map.Bounds;
  l_DeltaH := FormatInfo.DeltaHeight;
  if Area.rCanvas.Printing then
  begin
   if Check4Printing(l_DeltaH) then
   begin
    aFrame.rRect := Map.Bounds;
    {$IFDEF nsTest}
    l_UseCheck4Printing := True;
    {$ENDIF nsTest}
   end
   else
    if (BottomAnchor <> nil) and
       BottomAnchor.HasBaseLine and (BottomAnchor.InnerForChildThatNotAfterEnd(FormatInfo, nev_itNone) = nil) then
     lp_CorrectBottom(True)
    else
     lp_CorrectBottom(False);
  end // if Area.rCanvas.Printing then
  else
  begin
   CheckHeight(l_DeltaH);
   lp_CorrectBottom(False);
  end;
 end;//FormatInfo.DeltaHeight > 0
 {$IFDEF nsTest}
 if TPrintRowHeightsSpy.Exists and Area.rCanvas.Printing and
    not Area.rCanvas.IsPagesCounter and (ParaX.OwnerPara.ChildrenCount > 1) then
 begin
  l_Data.rTableID := ParaX.OwnerPara.PID;
  l_Data.rRowID := ParaX.PID;
  if l_UseCheck4Printing then
   l_Data.rHeight := Map.Bounds.Bottom
  else
   l_Data.rHeight := l_Bounds.Bottom;//Map.Bounds.Bottom;
  l_Data.rPage := Area.rCanvas.PageNumber;
  l_Data.rTopAnchorID := TopAnchor.Obj.PID;
  TPrintRowHeightsSpy.Instance.AddRowData(l_Data);
 end; // if TPrintRowHeightsSpy.Exists then
 {$ENDIF nsTest}
 Area.rCanvas.FrameLines.AlignBoundary(l_ObjID, aFrame, ParaX.ChildrenCount = 1);
//#UC END# *4804B8890228_48C7E98600AB_impl*
end;//TevTableRowPainter.CheckAlignment

procedure TevTableRowPainter.GetFramePartPrim(const aFrame: InevTag;
  anIndex: Tl3FramePartIndex;
  var thePart: TnevFramePart);
//#UC START# *4804B9BB0383_48C7E98600AB_var*
//#UC END# *4804B9BB0383_48C7E98600AB_var*
begin
//#UC START# *4804B9BB0383_48C7E98600AB_impl*
 thePart.rDrawType := lpdHidden;
//#UC END# *4804B9BB0383_48C7E98600AB_impl*
end;//TevTableRowPainter.GetFramePartPrim

function TevTableRowPainter.DoDraw: Boolean;
//#UC START# *4804BC2401C2_48C7E98600AB_var*
{$IfDef Nemesis}
{$IfOpt D+}
var
 l_Index : Integer;
{$EndIf}
{$EndIf Nemesis}
//#UC END# *4804BC2401C2_48C7E98600AB_var*
begin
//#UC START# *4804BC2401C2_48C7E98600AB_impl*
(* if HackK235870994 then
  Result := true
 else*)
 begin
  {$IfDef Nemesis}
  {$IfOpt D+}
  with ParaX do
   for l_Index := 0 to Pred(ChildrenCount) do
    Assert(Child[l_Index].InheritsFrom(k2_idTableCell), '������ ������� ������ �������� �� �����, � �� �� ' + Child[l_Index].TagType.AsString);
  {$EndIf}
  {$EndIf Nemesis}
  Result := inherited DoDraw;
 end;//HackK235870994
//#UC END# *4804BC2401C2_48C7E98600AB_impl*
end;//TevTableRowPainter.DoDraw

procedure TevTableRowPainter.InitBottom(var theBottom: InevBasePoint;
  var theCellBottom: InevBasePoint);
//#UC START# *4804BC800172_48C7E98600AB_var*
//#UC END# *4804BC800172_48C7E98600AB_var*
begin
//#UC START# *4804BC800172_48C7E98600AB_impl*
 inherited;
 if Area.rCanvas.Printing then
  if (ParaX.PID = (ParaX.Owner.ChildrenCount - 1)) then
  begin
   {$IfOpt D+}
   try
   {$EndIf}
    if (theBottom.InnerForChildThatNotAfterEnd(FormatInfo, nev_itNone) = nil) then
     Area.rCanvas.FrameLines.FinishedFO[Integer(ParaX.OwnerPara.Box.AsObject)] := True;
   {$IfOpt D+}
   except
    on EListError do
     Assert(false);
   end;//try..except
   {$EndIf}
  end;//ParaX.PID = (ParaX.Owner.ChildrenCount - 1)
//#UC END# *4804BC800172_48C7E98600AB_impl*
end;//TevTableRowPainter.InitBottom

function TevTableRowPainter.ChildInSelection(const aPara: InevPara): Boolean;
//#UC START# *481D6CB00337_48C7E98600AB_var*
var
 l_Selection : InevRange;
 l_Point     : InevBasePoint;
 l_Range     : InevRange;
 l_HeadCell  : InevTableCell;
 l_Cell      : InevTableCell;
//#UC END# *481D6CB00337_48C7E98600AB_var*
begin
//#UC START# *481D6CB00337_48C7E98600AB_impl*
 l_Selection := ParentPainter.CurrentBlock;
             // ^ - ���� ��������� �� �������
 Result := false; //�� ��������� �������, ��� ������ �� ��������...
                  // ^ - ������ � ���� - � ���� ��� �� �����������, � HEAD?
 // ����� ����:
 // http://mdp.garant.ru/pages/viewpage.action?pageId=89097007&focusedCommentId=89103176#comment-89103176
 if (aPara.IntA[k2_tiMergeStatus] = Ord(ev_msContinue)) AND
    (l_Selection <> nil) then
 begin
  Assert(l_Selection.Obj.InheritsFrom(k2_idTable));
  if not aPara.QT(InevTableCell, l_Cell) then
   Assert(false);
  l_HeadCell := l_Cell.GetMergeHead;
  if (l_HeadCell = nil) then
   Exit;
  l_Point := l_HeadCell.MakePoint;
  l_Point := l_Point.PointToTypedParent(k2_idTable);
  Assert(l_Point.Obj.InheritsFrom(k2_idTable));
  Assert(l_Point.Obj.IsSame(l_Selection.Obj^));
  l_Range := l_Selection;
  while True do
  begin
   l_Point := l_Point.Inner;
   if (l_Point = nil) then
    Break;
   l_Range := l_Range.GetChildSel(Area.rView.As_InevView, l_Point.Obj.PID, True);
   if (l_Range = nil) then
    Break;
   if l_Range.Obj.IsSame(l_HeadCell) then
   begin
    Result := l_Range.Solid(Area.rView.As_InevView);
    Break;
   end;//l_Range.Obj.IsSame(l_HeadCell)
  end;//while true
 end;//(IntA[k2_tiMergeStatus] = Ord(ev_msContinue))..
//#UC END# *481D6CB00337_48C7E98600AB_impl*
end;//TevTableRowPainter.ChildInSelection

procedure TevTableRowPainter.CheckChild(const aPara: InevPara);
//#UC START# *49D30810030E_48C7E98600AB_var*
//#UC END# *49D30810030E_48C7E98600AB_var*
begin
//#UC START# *49D30810030E_48C7E98600AB_impl*
 if ParentPainter <> nil then
  ParentPainter.TablePainter.CheckCell(aPara);
//#UC END# *49D30810030E_48C7E98600AB_impl*
end;//TevTableRowPainter.CheckChild

procedure TevTableRowPainter.InitInnerBottom(const aChildInfo: TnevShapeInfo);
//#UC START# *4C4570AE0113_48C7E98600AB_var*
var
 l_MaxInner: InevBasePoint;
//#UC END# *4C4570AE0113_48C7E98600AB_var*
begin
//#UC START# *4C4570AE0113_48C7E98600AB_impl*
 inherited;
 if (aChildInfo.rBottom <> nil) then
  if not aChildInfo.rBottom.AfterEnd then
  begin
   if (TevMergeStatus(aChildInfo.rBottom.IntA[k2_tiMergeStatus]) = ev_msHead) then
    BottomAnchor.AddHeadInner(aChildInfo.rBottom)
   else
   begin
    l_MaxInner := BottomAnchor.InnerForChildThatNotAfterEnd(FormatInfo, nev_itForDrawing);
    if (l_MaxInner <> nil) and l_MaxInner.AfterEnd and aChildInfo.rBottom.AtStart then
     MakeBottomAnchorInnerAfterEnd(aChildInfo.rBottom);
   end;
  end // if not aChildInfo.rBottom.AfterEnd then
  else
   if TevMergeStatus(aChildInfo.rBottom.IntA[k2_tiMergeStatus]) = ev_msContinue then
    if (aChildInfo.rCellBottom <> nil) then
     BottomAnchor.AddHeadInner(aChildInfo.rCellBottom)
//#UC END# *4C4570AE0113_48C7E98600AB_impl*
end;//TevTableRowPainter.InitInnerBottom

function TevTableRowPainter.GetTableRowPainter: IevTableRowPainter;
//#UC START# *4C77512E00AD_48C7E98600AB_var*
//#UC END# *4C77512E00AD_48C7E98600AB_var*
begin
//#UC START# *4C77512E00AD_48C7E98600AB_impl*
 Result := Self;
//#UC END# *4C77512E00AD_48C7E98600AB_impl*
end;//TevTableRowPainter.GetTableRowPainter

function TevTableRowPainter.NeedsHackK235870994: Boolean;
//#UC START# *4CAF3D530327_48C7E98600AB_var*
//#UC END# *4CAF3D530327_48C7E98600AB_var*
begin
//#UC START# *4CAF3D530327_48C7E98600AB_impl*
 Result := true;
//#UC END# *4CAF3D530327_48C7E98600AB_impl*
end;//TevTableRowPainter.NeedsHackK235870994

function TevTableRowPainter.NeedPrintingChild(const aChild: InevPara): Boolean;
//#UC START# *4CB4024B010A_48C7E98600AB_var*
//#UC END# *4CB4024B010A_48C7E98600AB_var*
begin
//#UC START# *4CB4024B010A_48C7E98600AB_impl*
 Result := aChild.IntA[k2_tiMergeStatus] = Ord(ev_msContinue);
//#UC END# *4CB4024B010A_48C7E98600AB_impl*
end;//TevTableRowPainter.NeedPrintingChild

procedure TevTableRowPainter.CheckNeedLaterFilling(const aPainterHolder: InevPaintersHolder;
  const aChildMap: InevMap);
//#UC START# *4FD97F890377_48C7E98600AB_var*

  function lp_CheckBlock: Boolean;
  var
   l_Block: InevPara;
  begin
   Result := False;
   l_Block := ParaX.OwnerPara.OwnerPara;
   while (l_Block <> nil) and l_Block.InheritsFrom(k2_idBlock) do
   begin
    Result := EvHasOwnStyle(l_Block);
    if Result then Break;
    l_Block := l_Block.OwnerPara;
   end; // while (l_Block <> nil) and l_Block.InheritsFrom(k2_idBlock) do
  end;

//#UC END# *4FD97F890377_48C7E98600AB_var*
begin
//#UC START# *4FD97F890377_48C7E98600AB_impl*
 if lp_CheckBlock then
  with Area.rView.RootMap do
   if aChildMap.Bounds.Right > (Bounds.Right - FI.Spacing.Right) then
    aPainterHolder.RemeberSelPart(aChildMap, False);
//#UC END# *4FD97F890377_48C7E98600AB_impl*
end;//TevTableRowPainter.CheckNeedLaterFilling

end.