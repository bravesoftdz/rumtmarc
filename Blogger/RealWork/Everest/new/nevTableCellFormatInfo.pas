unit nevTableCellFormatInfo;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest"
// ������: "w:/common/components/gui/Garant/Everest/new/nevTableCellFormatInfo.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi::Everest::Rendering::TnevTableCellFormatInfo
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include w:\common\components\gui\Garant\Everest\evDefine.inc}

interface

uses
  nevTools,
  nevListFormatInfo,
  nevFormatInfo,
  nevBase
  ;

type
 _CellFormatInfoCommon_Parent_ = TnevListFormatInfo;
 {$Include ..\new\CellFormatInfoCommon.imp.pas}
 TnevTableCellFormatInfo = class(_CellFormatInfoCommon_)
 private
 // private fields
   f_CellAtTop : InevPara;
   f_CellBottom : InevPara;
   f_HeadCell : InevPara;
 protected
 // overridden property methods
   function pm_GetLocSpacing: TnevRect; override;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* ������� ������� ����� �������. }
   function GetIsHidden: Boolean; override;
     {* ������ ������� }
   procedure ClearCache; override;
 public
 // overridden public methods
   procedure WForce(aParts: TnevRenderingInfoParts); override;
   function VerticalAlignmentMargin: Integer; override;
     {* ���������� �������� ��������� �� ������� �������, � ����������� �� ������������� ������������. }
 public
 // public methods
   function GetContinueCellAtTheTop: InevPara;
   function GetContinueCellBoottom: InevPara;
   function GetHeadCell: InevPara;
 end;//TnevTableCellFormatInfo

implementation

uses
  k2Tags,
  l3MinMax,
  k2Base,
  nevFacade,
  evdTypes
  ;

{$Include ..\new\CellFormatInfoCommon.imp.pas}

// start class TnevTableCellFormatInfo

function TnevTableCellFormatInfo.GetContinueCellAtTheTop: InevPara;
//#UC START# *5005119C02DB_48DB9D1A030D_var*
var
 l_TableCell: InevTableCell;
//#UC END# *5005119C02DB_48DB9D1A030D_var*
begin
//#UC START# *5005119C02DB_48DB9D1A030D_impl*
 if f_CellAtTop = nil then
 begin
  Obj.QT(InevTableCell, l_TableCell);
  f_CellAtTop := l_TableCell.GetContinueCellPara(True, fc_Up);
  if f_CellAtTop = nil then
   f_CellAtTop := nev.NullPara;
 end; // if f_TopObj = nil then
 Result := f_CellAtTop;
//#UC END# *5005119C02DB_48DB9D1A030D_impl*
end;//TnevTableCellFormatInfo.GetContinueCellAtTheTop

function TnevTableCellFormatInfo.GetContinueCellBoottom: InevPara;
//#UC START# *5005145503E1_48DB9D1A030D_var*
var
 l_TableCell: InevTableCell;
//#UC END# *5005145503E1_48DB9D1A030D_var*
begin
//#UC START# *5005145503E1_48DB9D1A030D_impl*
 if f_CellBottom = nil then
 begin
  Obj.QT(InevTableCell, l_TableCell);
  f_CellBottom := l_TableCell.GetContinueCellPara(True, fc_Down);
  if f_CellBottom = nil then
   f_CellBottom := nev.NullPara;
 end; // if f_CellBottom = nil then
 Result := f_CellBottom;
//#UC END# *5005145503E1_48DB9D1A030D_impl*
end;//TnevTableCellFormatInfo.GetContinueCellBoottom

function TnevTableCellFormatInfo.GetHeadCell: InevPara;
//#UC START# *50066685035C_48DB9D1A030D_var*
var
 l_TableCell: InevTableCell;
//#UC END# *50066685035C_48DB9D1A030D_var*
begin
//#UC START# *50066685035C_48DB9D1A030D_impl*
 if f_HeadCell = nil then
 begin
  Obj.QT(InevTableCell, l_TableCell);
  f_HeadCell := l_TableCell.GetHeadCellPara;
  if (f_HeadCell = nil) then
   f_HeadCell := nev.NullPara;
 end; // if f_CellBottom = nil then
 Result := f_HeadCell;
//#UC END# *50066685035C_48DB9D1A030D_impl*
end;//TnevTableCellFormatInfo.GetHeadCell

procedure TnevTableCellFormatInfo.Cleanup;
//#UC START# *479731C50290_48DB9D1A030D_var*
//#UC END# *479731C50290_48DB9D1A030D_var*
begin
//#UC START# *479731C50290_48DB9D1A030D_impl*
 f_CellAtTop := nil;
 f_CellBottom := nil;
 f_HeadCell := nil;
 inherited;
//#UC END# *479731C50290_48DB9D1A030D_impl*
end;//TnevTableCellFormatInfo.Cleanup

procedure TnevTableCellFormatInfo.WForce(aParts: TnevRenderingInfoParts);
//#UC START# *48175C1302A3_48DB9D1A030D_var*
const
 nev_ripChildrenCnahged = [nev_ripWidth, nev_ripHeight];
 nev_ripCellParams = [nev_ripWidth, nev_ripHeight, nev_ripCellParams];
var
 l_Cell : InevTableCell;
 l_PrevCell : InevTableCell;
//#UC END# *48175C1302A3_48DB9D1A030D_var*
begin
//#UC START# *48175C1302A3_48DB9D1A030D_impl*
 inherited;
 if (Obj.OverlapType = otUpper) then
 begin
  if ((aParts = nev_ripChildrenCnahged) or (aParts = nev_ripCellParams) or (aParts = [nev_ripHeight])) then
  begin
   if not Obj.QT(InevTableCell, l_Cell) then
    Assert(false);
   l_Cell := l_Cell.GetContinueCell(True, fc_Down);
   if l_Cell <> nil then // ������������ ������ ���� ��� ����������� �� �����������...
   begin
    while l_Cell <> nil do
    begin
     if aParts = nev_ripCellParams then
      l_Cell.Invalidate([nev_spExtent]);
     l_PrevCell := l_Cell;
     l_Cell := l_Cell.GetContinueCell(True, fc_Down);
    end; //while l_Cell <> nil do
    if aParts <> nev_ripCellParams then
     l_PrevCell.Invalidate([nev_spExtent]);
   end; // if l_Cell <> nil then
  end; //if (nev_ripHeight in aParts) and (TevMergeStatus(Obj.IntA[k2_tiMergeStatus]) = ev_msHead) then
 end
 else
  if (aParts = nev_ripCellParams) then
  begin
   if not Obj.QT(InevTableCell, l_Cell) then
    Assert(false);
   l_PrevCell := l_Cell;
   l_Cell := l_PrevCell.GetMergeHead(True);
   if (l_Cell <> nil) and not l_Cell.IsSame(l_PrevCell) then
    l_Cell.Invalidate([nev_spCellExtent]);
  end; // if (Obj.OverlapType = otLower) and (aParts = nev_ripCellParams) then
//#UC END# *48175C1302A3_48DB9D1A030D_impl*
end;//TnevTableCellFormatInfo.WForce

function TnevTableCellFormatInfo.GetIsHidden: Boolean;
//#UC START# *4C0D27380357_48DB9D1A030D_var*
//#UC END# *4C0D27380357_48DB9D1A030D_var*
begin
//#UC START# *4C0D27380357_48DB9D1A030D_impl*
 Result :=
 {$IFDEF Nemesis}
 (Width = 0) OR
 {$ENDIF Nemesis}
 inherited GetIsHidden;
//#UC END# *4C0D27380357_48DB9D1A030D_impl*
end;//TnevTableCellFormatInfo.GetIsHidden

procedure TnevTableCellFormatInfo.ClearCache;
//#UC START# *4E5E7D240227_48DB9D1A030D_var*
//#UC END# *4E5E7D240227_48DB9D1A030D_var*
begin
//#UC START# *4E5E7D240227_48DB9D1A030D_impl*
 f_CellAtTop := nil;
 f_CellBottom := nil;
 f_HeadCell := nil;
 inherited;
//#UC END# *4E5E7D240227_48DB9D1A030D_impl*
end;//TnevTableCellFormatInfo.ClearCache

function TnevTableCellFormatInfo.pm_GetLocSpacing: TnevRect;
//#UC START# *4E5F3D1102B8_48DB9D1A030Dget_var*
//#UC END# *4E5F3D1102B8_48DB9D1A030Dget_var*
begin
//#UC START# *4E5F3D1102B8_48DB9D1A030Dget_impl*
 Result := inherited pm_GetLocSpacing;
 Result.Top := Max(Obj.IntA[k2_tiSpaceBefore],
                   Obj.TagType.Prop[k2_tiSpaceBefore].DefaultValue);
 Result.Bottom := Max(Obj.IntA[k2_tiSpaceAfter],
                      Obj.TagType.Prop[k2_tiSpaceAfter].DefaultValue);
//#UC END# *4E5F3D1102B8_48DB9D1A030Dget_impl*
end;//TnevTableCellFormatInfo.pm_GetLocSpacing

function TnevTableCellFormatInfo.VerticalAlignmentMargin: Integer;
//#UC START# *52021CDE00B2_48DB9D1A030D_var*
//#UC END# *52021CDE00B2_48DB9D1A030D_var*
begin
//#UC START# *52021CDE00B2_48DB9D1A030D_impl*
 Result := GetVerticalAlignmentMargin;
//#UC END# *52021CDE00B2_48DB9D1A030D_impl*
end;//TnevTableCellFormatInfo.VerticalAlignmentMargin

end.