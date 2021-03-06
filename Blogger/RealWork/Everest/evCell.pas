unit evCell;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest"
// ������: "w:/common/components/gui/Garant/Everest/evCell.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi::Everest::ParaUtils::TevCell
//
// ���������� ���������� IedCell ��� ������� ������ �������.
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\Everest\evDefine.inc}

interface

{$If defined(evNeedEditableCursors)}
uses
  nevBase,
  nevTools,
  evEditorInterfaces,
  evCustomParaListUtils,
  l3Interfaces,
  evdTypes
  ;
{$IfEnd} //evNeedEditableCursors

{$If defined(evNeedEditableCursors)}
type
 TevCell = class(TevTableChild, IedCell)
  {* ���������� ���������� IedCell ��� ������� ������ �������. }
 private
 // private fields
   f_Neighbours : TevCellNeighbours;
 protected
 // realized methods
   function Get_Frame: IedFrame;
   procedure UpdateWidthAndCheckHead(aNewWidth: Integer);
     {* �������� ������ ������, � ��� ����� � ������������ }
   function Merge(aNeighbour: TedNeighbourIndex = ed_fpiRight): Boolean;
     {* ���������� ������ � ������� }
   function Split(aColNum: Integer = 2;
    aRowNum: Integer = 1): Boolean; overload; 
     {* ��������� ������ }
   function Split(anOrientation: Tl3Orientation1): Boolean; overload; 
     {* ��������� ������ }
   function IsFirst: Boolean;
     {* ���������� - ������ �� ��� ������ }
   function IsLast: Boolean;
     {* ���������� - ��������� �� ��� ������ }
   function IsBottom: Boolean;
     {* ���������� - ����� �� ������ ������ }
   function Delete(const anOp: InevOp;
    anInMerge: Boolean = False): Boolean;
     {* ������� ������ }
   function pm_GetTable: IedTable;
   function pm_GetNeighbour(aNeighbour: TedNeighbourIndex): IedCell;
   function pm_GetWidth: Integer;
   procedure pm_SetWidth(aValue: Integer);
   function pm_GetVerticalAligment: TevVerticalAligment;
   procedure pm_SetVerticalAligment(aValue: TevVerticalAligment);
   function pm_GetMergeStatus: TevMergeStatus;
   function TextAsInteger: Integer;
     {* �������� ������������� ����� � ������ � ������ �����. }
   function GetFirstLineText: AnsiString;
     {* ���������� ������ ������ ������. ������������ ��� ������. }
   function IsEmptyCell: Boolean;
   function IsFrameEmpty: Boolean;
   function GetCellType: TedCellType;
     {* ���������� ��� ����������� ������. }
   procedure MakeCellContinue(const anOp: InevOp);
     {* ��������� ��� ������ (ev_msContinue) � �������� � ����������. }
   function CalcHeadCellHeghtInRow: Integer;
     {* ��������� ������� �������� ����� ����������� ������. }
   procedure UpdateWidth(aNewWidth: Integer);
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* ������� ������� ����� �������. }
 public
 // public methods
   constructor Create(const aView: InevView;
     const aTable: IedTable;
     const aTagWrap: InevTag;
     const aProcessor: InevProcessor;
     const aNeighbours: TevCellNeighbours;
     const aLocation: InevLocation = nil); reintroduce;
   class function Make(const aView: InevView;
     const aTable: IedTable;
     const aTagWrap: InevTag;
     const aProcessor: InevProcessor;
     const aNeighbours: TevCellNeighbours;
     const aLocation: InevLocation = nil): IedCell;
 end;//TevCell
{$IfEnd} //evNeedEditableCursors

implementation

{$If defined(evNeedEditableCursors)}
uses
  l3Base,
  SysUtils,
  evParaFrame,
  k2Tags,
  k2Base,
  evParaTools,
  evMsgCode,
  l3IID,
  k2OpMisc,
  TextPara_Const,
  evCursorTools,
  l3UnitsTools,
  l3String,
  l3Chars
  ;
{$IfEnd} //evNeedEditableCursors

{$If defined(evNeedEditableCursors)}

// start class TevCell

constructor TevCell.Create(const aView: InevView;
  const aTable: IedTable;
  const aTagWrap: InevTag;
  const aProcessor: InevProcessor;
  const aNeighbours: TevCellNeighbours;
  const aLocation: InevLocation = nil);
//#UC START# *502CCB6101BA_502CC6560261_var*
//#UC END# *502CCB6101BA_502CC6560261_var*
begin
//#UC START# *502CCB6101BA_502CC6560261_impl*
 inherited Create(aView, aTable, aTagWrap, aProcessor, aLocation);
 f_Neighbours := aNeighbours;
//#UC END# *502CCB6101BA_502CC6560261_impl*
end;//TevCell.Create

class function TevCell.Make(const aView: InevView;
  const aTable: IedTable;
  const aTagWrap: InevTag;
  const aProcessor: InevProcessor;
  const aNeighbours: TevCellNeighbours;
  const aLocation: InevLocation = nil): IedCell;
//#UC START# *502CCBA80063_502CC6560261_var*
var
 l_Cell : TevCell;
//#UC END# *502CCBA80063_502CC6560261_var*
begin
//#UC START# *502CCBA80063_502CC6560261_impl*
 l_Cell := Create(aView, aTable, aTagWrap, aProcessor, aNeighbours, aLocation);
 try
  Result := l_Cell;
 finally
  l3Free(l_Cell);
 end;//try..finally
//#UC END# *502CCBA80063_502CC6560261_impl*
end;//TevCell.Make

function TevCell.Get_Frame: IedFrame;
//#UC START# *4BBC89F8009C_502CC6560261get_var*
var
 l_Neighbours : TevCellNeighbours;
 
 procedure CheckNeighbour(anIndex: TedNeighbourIndex);
 var
  l_Neighbour   : InevPara;
  l_MergeStatus : TevMergeStatus;
  l_CellTool    : InevTableCell;
 begin//CheckNeighbour
  if (l_Neighbour <> nil) then
  begin
  if not l_Neighbours[anIndex].QT(InevPara, l_Neighbour, Processor) then
    Assert(False);
   try
    with l_Neighbour.Attr[k2_tiMergeStatus] do
     if IsValid then
      l_MergeStatus := TevMergeStatus(AsLong)
     else
      l_MergeStatus := ev_msNone;
    case l_MergeStatus of
     ev_msContinue : l_Neighbours[anIndex] := k2NullTag;
     ev_msHead : begin
      if Supports(l_Neighbour, InevTableCell, l_CellTool) then
       l_Neighbour := l_CellTool.GetContinueCell(False, fc_DownInternal);
      if (l_Neighbour <> nil) AND l_Neighbour.IsValid then
       l_Neighbours[anIndex] := k2NullTag;
     end;//ev_msHead
    end;//Case l_MergeStatus
   finally
    l_Neighbour := nil;
   end;//try..finally
  end;
 end;//CheckNeighbour

//#UC END# *4BBC89F8009C_502CC6560261get_var*
begin
//#UC START# *4BBC89F8009C_502CC6560261get_impl*
 l_Neighbours := f_Neighbours;
 CheckNeighbour(ed_fpiLeft);
 CheckNeighbour(ed_fpiRight);
 Pointer(Result) := Pointer(IedFrame(TevCellFrame.Create(TagInst, Processor, l_Neighbours)));
//#UC END# *4BBC89F8009C_502CC6560261get_impl*
end;//TevCell.Get_Frame

procedure TevCell.UpdateWidthAndCheckHead(aNewWidth: Integer);
//#UC START# *4BBC90300154_502CC6560261_var*
var
 l_MS      : TevMergeStatus;
 l_Cell    : InevTableCell;
 l_NewCell : InevTableCell;
 l_OpPack  : InevOp;
//#UC END# *4BBC90300154_502CC6560261_var*
begin
//#UC START# *4BBC90300154_502CC6560261_impl*
 if aNewWidth > 0 then
 begin
  l_MS := pm_GetMergeStatus;
  if l_MS <> ev_msContinue then
  begin
   if l_MS = ev_msHead then
   begin
    l_OpPack := Processor.StartOp;
    try
     TagInst.QT(InevTableCell, l_Cell);
     Assert(l_Cell <> nil);
     repeat
      l_NewCell := l_Cell.GetContinueCell(True, fc_Down); // ������� ����, � ����� - ������!
      if aNewWidth <> l_Cell.IntA[k2_tiWidth] then
       l_Cell.IntW[k2_tiWidth, l_OpPack] := aNewWidth;
      l_Cell := l_NewCell;
     until (l_Cell = nil);
    finally
     l_OpPack := nil;
    end;//try..finally
   end // if l_MS = ev_msHead then
   else
    if pm_GetWidth <> aNewWidth then
     pm_SetWidth(aNewWidth);
  end; // if l_MS <> ev_msContinue then
 end; // if aNewWidth > 0 then
//#UC END# *4BBC90300154_502CC6560261_impl*
end;//TevCell.UpdateWidthAndCheckHead

function TevCell.Merge(aNeighbour: TedNeighbourIndex = ed_fpiRight): Boolean;
//#UC START# *4BBC906D00E8_502CC6560261_var*

 procedure DoMerge(const aCell: IedCell; aAtEnd: Boolean);
 var
  l_OpPack : InevOp;
  l_Flags  : TevLoadFlags;
  l_Para   : InevPara;
  l_Para1  : InevPara;
 begin
  if (aCell = nil) then
   Result := False
  else
  begin
   l_OpPack := Processor.StartOp(ev_msgBlock2Para);
   try
    pm_SetWidth(pm_GetWidth + aCell.Width); // - ���������� ����� ������ ������.
    l_Flags := evDefaultCopyFlags;
    if aAtEnd then
     l_Flags := l_Flags + [ev_lfAtEnd];
    if (aCell As InevTag).QT(InevPara, l_Para, Processor) then
     try
      if TagInst.QT(InevPara, l_Para1, Processor) then
       try                                                          
        evCopyParaList(View, Processor, l_Para1, l_Para, l_Flags, True);
       finally
        l_Para1 := nil;
       end;//try..finally
     finally
      l_Para := nil;
     end//try..finally
    else
     Assert(False);
    // - ���������� ������ ���� �����.
    aCell.Delete(nil, True); // - ������� �������� ������.
    Result := True;
   finally
    l_OpPack := nil;
   end;//try..finally
  end
 end;

//#UC END# *4BBC906D00E8_502CC6560261_var*
begin
//#UC START# *4BBC906D00E8_502CC6560261_impl*
 if (aNeighbour = ed_fpiRight) AND IsLast then aNeighbour := ed_fpiLeft;
 case aNeighbour of
  ed_fpiLeft  : DoMerge(pm_GetNeighbour(aNeighbour), False);
  ed_fpiRight : DoMerge(pm_GetNeighbour(aNeighbour), True);
  else
   Result := False;
 end;//case aNeighbour
//#UC END# *4BBC906D00E8_502CC6560261_impl*
end;//TevCell.Merge

function TevCell.Split(aColNum: Integer = 2;
  aRowNum: Integer = 1): Boolean;
//#UC START# *4BBC908A0312_502CC6560261_var*
var
 l_Cell          : InevPara;
 l_PrevCell      : InevPara;
 l_CellI         : IedCell;
 l_NewCell       : InevPara;
 l_NewCell1      : InevPara;
 l_Width         : Integer;
 l_CellWidth     : Integer;
 l_OpPack        : InevOp;
 l_Point         : InevBasePoint;
 l_ColNum        : Integer;
 l_WasMerge      : Boolean;
 l_TagWrap       : InevTag;
 l_CellTool      : InevTableCell;
 l_NeighbourCell : IedCell;
 l_HeadCell      : InevPara;
 l_NextCell      : InevPara;
//#UC END# *4BBC908A0312_502CC6560261_var*
begin
//#UC START# *4BBC908A0312_502CC6560261_impl*
 Result := False;
 l_WasMerge := False;
 try
  if (aColNum > 0) AND (aRowNum > 0) then
  begin
   if (Processor = nil) then
    l_OpPack := nil
   else
    l_OpPack := Processor.StartOp(M_evSplit);
   try
    if not TagInst.QT(InevPara, l_Cell, Processor) then
     Assert(False);
    if (aRowNum > 1) then
    begin
     with l_Cell do
     begin
      with Attr[k2_tiMergeStatus] do
       l_WasMerge := IsValid AND (AsLong = Ord(ev_msHead));
      AttrW[k2_tiMergeStatus, l_OpPack] := nil;
      evCheckCellStatus(l_OpPack, l_Cell);
      // - ���� �������� ������� �����������
     end;//with l_Cell
    end;//aRowNum > 1..
    if (aColNum > 1) then
    begin
     while True do
     begin
      // - ��� ���� ��� ���������� ���� ������������ �����
      with l_Cell do
      begin
       with Attr[k2_tiWidth] do
        if IsValid then
         l_Width := AsLong
        else
         l_Width := 0;
       if (l_Width > 0) then
       begin
        Result := True;
        // �������� ��������� ������ ������ �����, �.�. ������ � ����� ������� �� � �� ������.
        if Supports(l_Cell, InevTableCell, l_CellTool) then
         l_NextCell := l_CellTool.GetContinueCell(False, fc_DownInternal);
        l_ColNum := aColNum;
        l_CellWidth := l_Width div aColNum;
        l_CellWidth := l_CellTool.CheckCellWidth(l_CellWidth, l_Width);
        Dec(l_Width, l_CellWidth);
        IntW[k2_tiWidth, l_OpPack] := l_CellWidth;
        // - ������������� ����� ������ ������
        if not l_Cell.CloneTag.QT(InevPara, l_NewCell, Processor) then
         Assert(False);
        try
         evClearPara(View, l_NewCell, nil);
         l_Point := MakePoint;
         try
          l_Point := l_Point.PointToParent;
          // - �������� ������ � ������ �������
          while True do
          begin
           Dec(l_ColNum);
           l_CellWidth := l_Width div l_ColNum;
           if l_ColNum > 1 then
            l_CellWidth := l_CellTool.CheckCellWidth(l_CellWidth, l_Width);
           Dec(l_Width, l_CellWidth);
           l_NewCell.IntA[k2_tiWidth] := l_CellWidth;
           evInsertPara(l_OpPack, l_Point, l_NewCell);
           // - ��������� ����� ������
           if (l_ColNum = 1) then
            Break
           else
           begin
            l_Point.PositionW := l_Point.Position + 1;
            // - ���������� ������
            if not l_NewCell.CloneTag.QT(InevPara, l_NewCell1, Processor) then
             Assert(False);
            try
             l_NewCell := l_NewCell1;
            finally
             l_NewCell1 := nil;
            end;//try..finally
           end;//l_ColNum = 1
          end;//while True
         finally
          l_Point := nil;
         end;//try..finally
        finally
         l_NewCell := nil;
        end;//try..finally
       end//l_Width > 0
       else
        Break;
        // - ���� �����, �.�. ��������� ������
      end;//with l_Cell
      if (l_NextCell <> nil) AND l_NextCell.IsValid then
       l_Cell := l_NextCell
      else
       Break;
       // - ��� ������ ���������
     end;//while True
    end;//aColNum > 1
    if not TagInst.QT(InevPara, l_Cell, Processor) then
     Assert(False);
    with l_Cell do
    begin
     if (aRowNum > 1) then
     begin
      if l_WasMerge then
      begin
       if Supports(l_Cell, InevTableCell, l_CellTool) then
        l_NewCell := l_CellTool.GetContinueCell(False, fc_DownInternal);
       if (l_NewCell <> nil) AND l_NewCell.IsValid then
        if l3IOk(evQueryParaInterface(View, Processor, l_NewCell, Tl3GUID_C(IedCell), l_CellI)) then
         try
          Result := True;
          l_NewCell.IntW[k2_tiMergeStatus, l_OpPack] := Ord(ev_msHead);
          evCheckCellStatus(l_OpPack, l_NewCell);
          l_CellI.Split(aColNum, aRowNum - 1);
          Exit;
         finally
          l_CellI := nil;
         end;//try..finally
      end;//l_WasMerge
      if not Owner.CloneTag.QT(InevPara, l_NewCell, Processor) then
       Assert(False);
      // - �������� ������ �������
      with OwnerPara do
      begin
       try
        Result := True;
        evClearPara(View, l_NewCell, nil);
        // - ������� ����� ������
        l_ColNum := 0;
        while (l_ColNum < ChildrenCount) do
        begin
         l_NewCell1 := Para[l_ColNum];
         if l_NewCell1.IsSame(l_Cell) then
          Inc(l_ColNum, aColNum)
          // - ���������� ������, ����������� � ������ �������
         else
         begin
          with l_NewCell1 do
          begin
           with Attr[k2_tiMergeStatus] do
            l_WasMerge := IsValid AND (AsLong <> Ord(ev_msNone));
           if not l_WasMerge then
            IntW[k2_tiMergeStatus, l_OpPack] := Ord(ev_msHead);
           evCheckCellStatus(l_OpPack, l_NewCell1); 
          end;//with l_NewCell1
          evClearPara(View, l_NewCell.AsList.ToList.Obj[l_ColNum], l_OpPack, ev_cmAll);
          l_NewCell.Child[l_ColNum].IntA[k2_tiMergeStatus] := Ord(ev_msContinue);
          // - ����� ������ ����� ������ ��� �����������
          Inc(l_ColNum);
         end;//l_NewCell1.EQ(l_Cell)
        end;//while (l_ColNum < ChildrenCount)
        // - ����� ������������ ���������
        l_ColNum := aRowNum;
        l_Point := MakePoint;
        try
         l_Point := l_Point.PointToParent;
         // - �������� ������ � �������
         while True do
         begin
          evInsertPara(l_OpPack, l_Point, l_NewCell);
          // - ��������� ����� ������
          Dec(l_ColNum);
          if (l_ColNum = 1) then
           Break
          else
          begin
           l_Point.PositionW := l_Point.Position + 1;
           // - ���������� ������
           if not l_NewCell.CloneTag.QT(InevPara, l_NewCell1, Processor) then
            Assert(False);
           try
            l_NewCell := l_NewCell1;
           finally
            l_NewCell1 := nil;
           end;//try..finally
          end;//l_ColNum = 1
         end;//while True
        finally
         l_Point := nil;
        end;//try..finally
       finally
        l_NewCell := nil;
       end;//try..finally
       l_NewCell := OwnerPara;
       l_NewCell.Invalidate([nev_spExtent]);
      end;//with TagOwner
     end;//aRowNum > 1
    end;//with l_Cell
   finally
    l_OpPack := nil;
   end;//try..finally
  end;//aColNum > 0
 finally
  if Result then
  begin
   l_NeighbourCell := pm_GetTable.Cell;
   if not l_NeighbourCell.IsLast and Supports(l_NeighbourCell.Neighbour[ed_fpiRight], InevTag, l_TagWrap) then
    f_Neighbours[ed_fpiRight] := l_TagWrap.Box
   else
    f_Neighbours[ed_fpiRight] := k2NullTag;
   if not l_NeighbourCell.IsBottom and Supports(l_NeighbourCell.Neighbour[ed_fpiDown], InevTag, l_TagWrap) then
    f_Neighbours[ed_fpiDown] := l_TagWrap.Box
   else
    f_Neighbours[ed_fpiDown] := k2NullTag;
  end;
 end;//try..finally
//#UC END# *4BBC908A0312_502CC6560261_impl*
end;//TevCell.Split

function TevCell.Split(anOrientation: Tl3Orientation1): Boolean;
//#UC START# *4BBC90A5006F_502CC6560261_var*
var
 l_OpPack : InevOp;
 l_Dest   : InevPara;
 l_Cursor : InevPoint;
 l_Para   : InevPara;
//#UC END# *4BBC90A5006F_502CC6560261_var*
begin
//#UC START# *4BBC90A5006F_502CC6560261_impl*
 if (Processor = nil) then
  l_OpPack := nil
 else
  l_OpPack := Processor.StartOp(M_evSplit);
 try
  if (anOrientation = ev_orHorizontal) then
   Result := Split(1, 2)
  else
   Result := Split(2, 1);
  if Result then
  begin
   if Supports(f_Location, InevPoint, l_Cursor) then
   begin
    if (anOrientation = ev_orHorizontal) then
    begin
     if not f_Neighbours[ed_fpiDown].QT(InevPara, l_Dest, Processor) then
      Assert(False);
    end//anOrientation = ev_orHorizontal
    else
    begin
     if not f_Neighbours[ed_fpiRight].QT(InevPara, l_Dest, Processor) then
      Assert(False);
    end;//anOrientation = ev_orHorizontal
    if InevTag(Self).QT(InevPara, l_Para) then
    begin
     evCopyParaList(View,
                    Processor,
                    l_Dest,
                    l_Para,
                    evDefaultCopyFlags + [ev_lfNeedJoin] - [ev_lfAtEnd],
                    False,
                    l_Cursor, True);
    end
    else
     Assert(False);                
   end;//Owner Is TevCursor
  end;//Result
 finally
  l_OpPack := nil;
 end;//try..finally 
//#UC END# *4BBC90A5006F_502CC6560261_impl*
end;//TevCell.Split

function TevCell.IsFirst: Boolean;
//#UC START# *4BBC90B601A3_502CC6560261_var*
//#UC END# *4BBC90B601A3_502CC6560261_var*
begin
//#UC START# *4BBC90B601A3_502CC6560261_impl*
 Result := (f_Neighbours[ed_fpiLeft] = nil) or f_Neighbours[ed_fpiLeft].IsNull;
//#UC END# *4BBC90B601A3_502CC6560261_impl*
end;//TevCell.IsFirst

function TevCell.IsLast: Boolean;
//#UC START# *4BBC90CB0396_502CC6560261_var*
//#UC END# *4BBC90CB0396_502CC6560261_var*
begin
//#UC START# *4BBC90CB0396_502CC6560261_impl*
 Result := (f_Neighbours[ed_fpiRight] = nil) or f_Neighbours[ed_fpiRight].IsNull;
//#UC END# *4BBC90CB0396_502CC6560261_impl*
end;//TevCell.IsLast

function TevCell.IsBottom: Boolean;
//#UC START# *4BBC90DE010C_502CC6560261_var*
//#UC END# *4BBC90DE010C_502CC6560261_var*
begin
//#UC START# *4BBC90DE010C_502CC6560261_impl*
 Result := (f_Neighbours[ed_fpiDown] = nil) or f_Neighbours[ed_fpiDown].IsNull;
//#UC END# *4BBC90DE010C_502CC6560261_impl*
end;//TevCell.IsBottom

function TevCell.Delete(const anOp: InevOp;
  anInMerge: Boolean = False): Boolean;
//#UC START# *4BBC90F1002D_502CC6560261_var*
var
 l_Op   : InevOp;
 l_Para : InevTableCell;
 l_Head : InevPara;
//#UC END# *4BBC90F1002D_502CC6560261_var*
begin
//#UC START# *4BBC90F1002D_502CC6560261_impl*
 if TagInst.QT(InevTableCell, l_Para, Processor) then
 begin
  if anOp = nil then
   l_Op := k2StartOp(Processor, ev_msgDeletePara)
  else
   l_Op := anOp;
  l_Head := l_Para.GetHeadCellPara;
  Result := l_Para.Edit.Delete(anInMerge, l_Op);
  if (l_Head <> nil) and not l_Head.IsSame(l_Para) then
   l_Head.Invalidate([nev_spExtent]);
 end // if TagInst.QT(InevPara, l_Para, Processor) then
 else
  Result := false;
//#UC END# *4BBC90F1002D_502CC6560261_impl*
end;//TevCell.Delete

function TevCell.pm_GetTable: IedTable;
//#UC START# *4BBC91340257_502CC6560261get_var*
//#UC END# *4BBC91340257_502CC6560261get_var*
begin
//#UC START# *4BBC91340257_502CC6560261get_impl*
 Result := GetTable;
//#UC END# *4BBC91340257_502CC6560261get_impl*
end;//TevCell.pm_GetTable

function TevCell.pm_GetNeighbour(aNeighbour: TedNeighbourIndex): IedCell;
//#UC START# *4BBC914B03C3_502CC6560261get_var*
var
 l_Para : InevPara;
//#UC END# *4BBC914B03C3_502CC6560261get_var*
begin
//#UC START# *4BBC914B03C3_502CC6560261get_impl*
 if f_Neighbours[aNeighbour].IsNull then
  Result := nil
 else
 begin
  if not f_Neighbours[aNeighbour].QT(InevPara, l_Para, Processor) then
   Assert(False);
  if l3IFail(evQueryParaInterface(View, Processor, l_Para, Tl3GUID_C(IedCell), Result)) then
   Result := nil;
 end;
//#UC END# *4BBC914B03C3_502CC6560261get_impl*
end;//TevCell.pm_GetNeighbour

function TevCell.pm_GetWidth: Integer;
//#UC START# *4BBC91960248_502CC6560261get_var*
//#UC END# *4BBC91960248_502CC6560261get_var*
begin
//#UC START# *4BBC91960248_502CC6560261get_impl*
 Result := TagInst.IntA[k2_tiWidth];
//#UC END# *4BBC91960248_502CC6560261get_impl*
end;//TevCell.pm_GetWidth

procedure TevCell.pm_SetWidth(aValue: Integer);
//#UC START# *4BBC91960248_502CC6560261set_var*
var
 l_OpPack : InevOp;
//#UC END# *4BBC91960248_502CC6560261set_var*
begin
//#UC START# *4BBC91960248_502CC6560261set_impl*
 if (aValue > 0) then
 begin
  l_OpPack := Processor.StartOp;
  try
   TagInst.IntW[k2_tiWidth, l_OpPack] := aValue;
  finally
   l_OpPack := nil;
  end;//try..finally
 end;//Value > 0
//#UC END# *4BBC91960248_502CC6560261set_impl*
end;//TevCell.pm_SetWidth

function TevCell.pm_GetVerticalAligment: TevVerticalAligment;
//#UC START# *4BBC91DF0370_502CC6560261get_var*
//#UC END# *4BBC91DF0370_502CC6560261get_var*
begin
//#UC START# *4BBC91DF0370_502CC6560261get_impl*
 with TagInst.Attr[k2_tiVerticalAligment] do
  if IsValid then
   Result := TevVerticalAligment(AsLong)
  else
   Result := ev_valTop;
//#UC END# *4BBC91DF0370_502CC6560261get_impl*
end;//TevCell.pm_GetVerticalAligment

procedure TevCell.pm_SetVerticalAligment(aValue: TevVerticalAligment);
//#UC START# *4BBC91DF0370_502CC6560261set_var*
var
 l_OpPack : InevOp;
//#UC END# *4BBC91DF0370_502CC6560261set_var*
begin
//#UC START# *4BBC91DF0370_502CC6560261set_impl*
 l_OpPack := Processor.StartOp;
 try
  TagInst.IntW[k2_tiVerticalAligment, l_OpPack] := Ord(aValue);
 finally
  l_OpPack := nil;
 end;//try..finally
//#UC END# *4BBC91DF0370_502CC6560261set_impl*
end;//TevCell.pm_SetVerticalAligment

function TevCell.pm_GetMergeStatus: TevMergeStatus;
//#UC START# *4F290E34016D_502CC6560261get_var*
//#UC END# *4F290E34016D_502CC6560261get_var*
begin
//#UC START# *4F290E34016D_502CC6560261get_impl*
 Result := TevMergeStatus(TagInst.IntA[k2_tiMergeStatus]);
//#UC END# *4F290E34016D_502CC6560261get_impl*
end;//TevCell.pm_GetMergeStatus

function TevCell.TextAsInteger: Integer;
//#UC START# *4FA4EEDF0370_502CC6560261_var*
var
 l_Value: Integer;
 l_Child: InevTag;
//#UC END# *4FA4EEDF0370_502CC6560261_var*
begin
//#UC START# *4FA4EEDF0370_502CC6560261_impl*
 Result := 0;
 if TagInst.ChildrenCount = 1 then
 begin
  l_Child := TagInst.Child[0];
  if l_Child.InheritsFrom(k2_idTextPara) and TryStrToInt(l_Child.StrA[k2_tiText], l_Value) then
   Result := l_Value;
 end; // if TagInst.ChildrenCount = 1 then
//#UC END# *4FA4EEDF0370_502CC6560261_impl*
end;//TevCell.TextAsInteger

function TevCell.GetFirstLineText: AnsiString;
//#UC START# *4FC728DF02A2_502CC6560261_var*
//#UC END# *4FC728DF02A2_502CC6560261_var*
begin
//#UC START# *4FC728DF02A2_502CC6560261_impl*
 if TagInst.ChildrenCount > 0 then
  Result := TagInst.Child[0].StrA[k2_tiText]
 else
  Result := '';
//#UC END# *4FC728DF02A2_502CC6560261_impl*
end;//TevCell.GetFirstLineText

function TevCell.IsEmptyCell: Boolean;
//#UC START# *4FC764D402BF_502CC6560261_var*

 function lp_CheckCell(const aCell: InevTag; Index: LongInt): Boolean;
 begin
  Result := l3Trim(TagInst.Child[0].PCharLenA[k2_tiText], cc_WhiteSpaceExt).SLen = 0;
  if not Result then
   IsEmptyCell := False;
 end;

//#UC END# *4FC764D402BF_502CC6560261_var*
begin
//#UC START# *4FC764D402BF_502CC6560261_impl*
 with TagInst do
 begin
  Result := (ChildrenCount > 0) and (ChildrenCount <= 2);
  if Result then
   IterateChildrenF(k2L2TIA(@lp_CheckCell));
 end;
//#UC END# *4FC764D402BF_502CC6560261_impl*
end;//TevCell.IsEmptyCell

function TevCell.IsFrameEmpty: Boolean;
//#UC START# *502CAE3301E7_502CC6560261_var*
//#UC END# *502CAE3301E7_502CC6560261_var*
begin
//#UC START# *502CAE3301E7_502CC6560261_impl*
 with TagInst.Attr[k2_tiFrame] do
  if IsValid then
   Result := IntA[k2_tiHandle] = 0
  else
   Result := True;
//#UC END# *502CAE3301E7_502CC6560261_impl*
end;//TevCell.IsFrameEmpty

function TevCell.GetCellType: TedCellType;
//#UC START# *5112045801FF_502CC6560261_var*
var
 i          : Integer;
 l_Char     : Char;
 l_Value    : Integer;
 l_Child    : InevTag;
 l_Count    : Integer;
 l_WasPoint : Boolean;
 l_ValueStr : String;
//#UC END# *5112045801FF_502CC6560261_var*
begin
//#UC START# *5112045801FF_502CC6560261_impl*
 Result := ed_None;
 (*if pm_GetMergeStatus = ev_msContinue then
  Result := ed_Continue
 else*)
  if IsEmptyCell then
  begin
   (*if pm_GetMergeStatus = ev_msHead then
    Result := ed_HeadEmpty
   else*)
    Result := ed_Empty;
  end // if IsEmptyCell then
  else
  if TagInst.ChildrenCount = 1 then
  begin
   l_Child := TagInst.Child[0];
   if l_Child.InheritsFrom(k2_idTextPara) then
   begin
    l_ValueStr := l_Child.StrA[k2_tiText];
    if TryStrToInt(l_ValueStr, l_Value) then
    begin
     (*if pm_GetMergeStatus = ev_msHead then
      Result := ed_HeadInteger
     else*)
      Result := ed_Integer;
     Exit;
    end; // if TryStrToInt(l_Child.StrA[k2_tiText], l_Value) then
    if Pos('____', l_ValueStr) > 0 then
    begin
     Result := ed_HasFormLine;
     Exit;
    end; // if Pos('____', l_Child.StrA[k2_tiText]) > 0 then
    // ���� ��� - ��������:
    l_WasPoint := False;
    l_Count := Length(l_ValueStr);
    Result := ed_Number;
    for i := 1 to l_Count do
    begin
     l_Char := l_ValueStr[i];
     if i = 1 then
     begin
      if not (l_Char in ['1'..'9']) then // ������ ���������� � 1.
      begin
       Result := ed_None;
       Break;
      end // if i = 1 then
     end // if i = 1 then
     else
     begin
      if l_WasPoint and (l_Char = '.') then // �������� ������� �����
      begin
       Result := ed_None;
       Break;
      end;
      l_WasPoint := l_Char = '.';
      if not l_WasPoint and not (l_Char in ['0'..'9'])then
      begin
       Result := ed_None;
       Break;
      end; // if not l_WasPoint and not (l_Char in ['0'..'9'])then
     end;
    end; // for i := 1 to l_Count do
    if Result = ed_Number then
    begin
     if l_WasPoint then
     begin
      (*if pm_GetMergeStatus = ev_msHead then
       Result := ed_HeadNumber;*)
      Exit;
     end
     else
      Result := ed_None;
    end; // if IsEmptyStr(l_ValueStr, ['0'..'9', '.']) then
    (*if IsEmptyStr(l_ValueStr, ['0'..'9', ',']) then
    begin
     if pm_GetMergeStatus = ev_msHead then
      Result := ed_HeadFloat
     else
      Result := ed_Float;
     Exit;
    end; // if IsEmptyStr(l_ValueStr, ['0'..'9', '.']) then*)
   end; // if l_Child.InheritsFrom(k2_idTextPara) then
   (*if pm_GetMergeStatus = ev_msHead then
    Result := ed_HeadText
   else*)
   if Length(l_ValueStr) < 10 then
    Result := ed_SmallText
   else 
    Result := ed_Text;
  end // if TagInst.ChildrenCount = 1 then
  else
   if TagInst.ChildrenCount > 1 then
   begin
    (*if pm_GetMergeStatus = ev_msHead then
     Result := ed_HeadText
    else*)
     Result := ed_Text;
   end;
 if Result = ed_Empty then
  if pm_GetWidth <= evCellWidthEpsilon then
   Result := ed_NeedDelete;
//#UC END# *5112045801FF_502CC6560261_impl*
end;//TevCell.GetCellType

procedure TevCell.MakeCellContinue(const anOp: InevOp);
//#UC START# *511B2BEC02F0_502CC6560261_var*
var
 l_Para: InevPara;
//#UC END# *511B2BEC02F0_502CC6560261_var*
begin
//#UC START# *511B2BEC02F0_502CC6560261_impl*
 if TagInst.QT(InevPara, l_Para, Processor) then
 begin
  evClearPara(View, l_Para, anOp, ev_cmAll);
  l_Para.IntW[k2_tiMergeStatus, anOp] := Ord(ev_msContinue);
 end; // if TagInst.QT(InevPara, l_Para, Processor) then
//#UC END# *511B2BEC02F0_502CC6560261_impl*
end;//TevCell.MakeCellContinue

function TevCell.CalcHeadCellHeghtInRow: Integer;
//#UC START# *511B2C39034C_502CC6560261_var*
var
 l_Cell: InevTableCell;
//#UC END# *511B2C39034C_502CC6560261_var*
begin
//#UC START# *511B2C39034C_502CC6560261_impl*
 Result := 0;
 if pm_GetMergeStatus = ev_msHead then
 begin
  TagInst.QT(InevTableCell, l_Cell);
  Assert(l_Cell <> nil);
  while l_Cell <> nil do
  begin
   l_Cell := l_Cell.GetContinueCell(True, fc_Down);
   if l_Cell <> nil then Inc(Result);
  end; // while l_Cell <> nil do
 end; // if pm_GetMergeStatus = ev_msHead then
//#UC END# *511B2C39034C_502CC6560261_impl*
end;//TevCell.CalcHeadCellHeghtInRow

procedure TevCell.UpdateWidth(aNewWidth: Integer);
//#UC START# *512CB1DC00D1_502CC6560261_var*
//#UC END# *512CB1DC00D1_502CC6560261_var*
begin
//#UC START# *512CB1DC00D1_502CC6560261_impl*
 if (aNewWidth > 0) and (pm_GetWidth <> aNewWidth) then
  pm_SetWidth(aNewWidth);
//#UC END# *512CB1DC00D1_502CC6560261_impl*
end;//TevCell.UpdateWidth

procedure TevCell.Cleanup;
//#UC START# *479731C50290_502CC6560261_var*
var
 i : TedFramePartIndex;
//#UC END# *479731C50290_502CC6560261_var*
begin
//#UC START# *479731C50290_502CC6560261_impl*
 for i := Low(f_Neighbours) to High(f_Neighbours) do
  f_Neighbours[i] := nil;
 inherited;
//#UC END# *479731C50290_502CC6560261_impl*
end;//TevCell.Cleanup

{$IfEnd} //evNeedEditableCursors

end.