unit evTablePainter;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest"
// �����: ����� �.�.
// ������: "w:/common/components/gui/Garant/Everest/evTablePainter.pas"
// �����: 06.06.2007 11:44
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi::Everest::ParaList Painters::TevTablePainter
//
// ���������� ���������� IevPainter ��� �������
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\Everest\evDefine.inc}

interface

uses
  evFramedParaListPainter,
  evCellsOffsets,
  nevRealTools,
  nevTools,
  nevBase
  ;

type
 TevTablePainter = class(TevFramedParaListPainter, IevTablePainter)
  {* ���������� ���������� IevPainter ��� ������� }
 private
 // private fields
   f_CellsOffsets : TevCellsOffsets;
 private
 // private methods
   function CellsOffsets: TevCellsOffsets;
 protected
 // realized methods
   procedure CheckCell(const aPara: InevTag;
     aCheckType: TnevCheckType = nev_None);
   procedure CalcOffset;
     {* ����������� �������� ��� ��������� ������ }
   function WasPainted(const aPara: InevTag;
     anPID: Integer;
     aForLines: Boolean): Boolean;
     {* �������� ���� �� ���������� ��������� ������ �����������. }
   {$If defined(nsTest)}
   function NeedLog: Boolean; override;
     {* ������������ �� ��������� ������ ������ � ��� ��� ������. }
   {$IfEnd} //nsTest
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* ������� ������� ����� �������. }
   function DoDraw: Boolean; override;
     {* ���������� ��������� ��������� ���������. ��� ���������� � ��������. }
   procedure InitBottom(var theBottom: InevBasePoint;
    var theCellBottom: InevBasePoint); override;
   function BeforeDrawChild(const ChildPainter: IevPainter): Boolean; override;
     {* ���������� ����� ���������� ������� ��������� ���������. }
   function GetTablePainter: IevTablePainter; override;
   procedure InitInnerBottom(const aChildInfo: TnevShapeInfo); override;
   function NeedsHackK235870994: Boolean; override;
 end;//TevTablePainter

implementation

uses
  k2Tags,
  evdTypes,
  SysUtils
  ;

// start class TevTablePainter

function TevTablePainter.CellsOffsets: TevCellsOffsets;
//#UC START# *49CB6F2D03C8_48C9377502A0_var*
//#UC END# *49CB6F2D03C8_48C9377502A0_var*
begin
//#UC START# *49CB6F2D03C8_48C9377502A0_impl*
 if f_CellsOffsets = nil then
  f_CellsOffsets := TevCellsOffsets.Create;
 Result := f_CellsOffsets;
//#UC END# *49CB6F2D03C8_48C9377502A0_impl*
end;//TevTablePainter.CellsOffsets

procedure TevTablePainter.CheckCell(const aPara: InevTag;
  aCheckType: TnevCheckType = nev_None);
//#UC START# *49CB6BE30032_48C9377502A0_var*
//#UC END# *49CB6BE30032_48C9377502A0_var*
begin
//#UC START# *49CB6BE30032_48C9377502A0_impl*     
 f_CellsOffsets.SetWidth(aPara.IntA[k2_tiWidth]);
 case TevMergeStatus(aPara.IntA[k2_tiMergeStatus]) of
  ev_msHead: begin
     f_CellsOffsets.CheckOffset(False);
     f_CellsOffsets.AddCellWidth;
    end; // ev_msHead
  ev_msNone: f_CellsOffsets.CheckOffset(False);
  ev_msContinue: if aCheckType <> nev_None then
   begin
    f_CellsOffsets.CheckOffset(False);
    if aCheckType = nev_NeedAdd then
    f_CellsOffsets.AddCellWidth;
   end;
 end; // case l_MergeStatus of
//#UC END# *49CB6BE30032_48C9377502A0_impl*
end;//TevTablePainter.CheckCell

procedure TevTablePainter.CalcOffset;
//#UC START# *49CB6C1A02DF_48C9377502A0_var*
//#UC END# *49CB6C1A02DF_48C9377502A0_var*
begin
//#UC START# *49CB6C1A02DF_48C9377502A0_impl*
 CellsOffsets.RecalcOffset;
//#UC END# *49CB6C1A02DF_48C9377502A0_impl*
end;//TevTablePainter.CalcOffset

function TevTablePainter.WasPainted(const aPara: InevTag;
  anPID: Integer;
  aForLines: Boolean): Boolean;
//#UC START# *49CB6C2E02E2_48C9377502A0_var*
//#UC END# *49CB6C2E02E2_48C9377502A0_var*
begin
//#UC START# *49CB6C2E02E2_48C9377502A0_impl*
 Result := TevMergeStatus(aPara.IntA[k2_tiMergeStatus]) = ev_msContinue;
 if Result then
  Result := (f_CellsOffsets <> nil) and not f_CellsOffsets.CheckParam;
 if not Result and aForLines then
  if Area.rCanvas.Printing and (TopAnchor.Inner <> nil) and TopAnchor.Inner.HasHeadPart then
   Result := TopAnchor.Inner.InnerHead(anPID) <> nil
//#UC END# *49CB6C2E02E2_48C9377502A0_impl*
end;//TevTablePainter.WasPainted

{$If defined(nsTest)}
function TevTablePainter.NeedLog: Boolean;
//#UC START# *4D0203AA016F_48C9377502A0_var*
//#UC END# *4D0203AA016F_48C9377502A0_var*
begin
//#UC START# *4D0203AA016F_48C9377502A0_impl*
 Result := True;
//#UC END# *4D0203AA016F_48C9377502A0_impl*
end;//TevTablePainter.NeedLog
{$IfEnd} //nsTest

procedure TevTablePainter.Cleanup;
//#UC START# *479731C50290_48C9377502A0_var*
//#UC END# *479731C50290_48C9377502A0_var*
begin
//#UC START# *479731C50290_48C9377502A0_impl*
 FreeAndNil(f_CellsOffsets);
 inherited;
//#UC END# *479731C50290_48C9377502A0_impl*
end;//TevTablePainter.Cleanup

function TevTablePainter.DoDraw: Boolean;
//#UC START# *4804BC2401C2_48C9377502A0_var*
//#UC END# *4804BC2401C2_48C9377502A0_var*
begin
//#UC START# *4804BC2401C2_48C9377502A0_impl*
(* if HackK235870994 then
  Result := true
 else*)
  Result := inherited DoDraw;
//#UC END# *4804BC2401C2_48C9377502A0_impl*
end;//TevTablePainter.DoDraw

procedure TevTablePainter.InitBottom(var theBottom: InevBasePoint;
  var theCellBottom: InevBasePoint);
//#UC START# *4804BC800172_48C9377502A0_var*
var
 l_Inn : InevBasePoint;
//#UC END# *4804BC800172_48C9377502A0_var*
begin
//#UC START# *4804BC800172_48C9377502A0_impl*
 l_Inn := theBottom.Inner;
 inherited InitBottom(theBottom, theCellBottom);
 if (l_Inn <> nil) AND l_Inn.AfterEnd and not theBottom.AfterEnd then
  if l_Inn.HasHeadPart and Area.rCanvas.Printing then
  begin
   theBottom.Inner := theBottom.Inner.Obj^.BaseLine4Print;
   theBottom.Inner.CopyHeadParts(l_Inn);
  end; // if l_Inn.HasHeadPart then
//#UC END# *4804BC800172_48C9377502A0_impl*
end;//TevTablePainter.InitBottom

function TevTablePainter.BeforeDrawChild(const ChildPainter: IevPainter): Boolean;
//#UC START# *481D6C56033A_48C9377502A0_var*
//#UC END# *481D6C56033A_48C9377502A0_var*
begin
//#UC START# *481D6C56033A_48C9377502A0_impl*
 Result := inherited BeforeDrawChild(ChildPainter);
 CellsOffsets.ClearOffset;    
//#UC END# *481D6C56033A_48C9377502A0_impl*
end;//TevTablePainter.BeforeDrawChild

function TevTablePainter.GetTablePainter: IevTablePainter;
//#UC START# *49DCA7F3011C_48C9377502A0_var*
//#UC END# *49DCA7F3011C_48C9377502A0_var*
begin
//#UC START# *49DCA7F3011C_48C9377502A0_impl*
 Result := Self;
//#UC END# *49DCA7F3011C_48C9377502A0_impl*
end;//TevTablePainter.GetTablePainter

procedure TevTablePainter.InitInnerBottom(const aChildInfo: TnevShapeInfo);
//#UC START# *4C4570AE0113_48C9377502A0_var*
var
 l_Inn : InevBasePoint;
//#UC END# *4C4570AE0113_48C9377502A0_var*
begin
//#UC START# *4C4570AE0113_48C9377502A0_impl*
 if Area.rNeedBottom then
  l_Inn := BottomAnchor.Inner;
 inherited;
 if Area.rNeedBottom and (l_Inn <> nil) then
  if l_Inn.HasHeadPart then
   BottomAnchor.Inner.CopyHeadParts(l_Inn);
//#UC END# *4C4570AE0113_48C9377502A0_impl*
end;//TevTablePainter.InitInnerBottom

function TevTablePainter.NeedsHackK235870994: Boolean;
//#UC START# *4CAF3D530327_48C9377502A0_var*
//#UC END# *4CAF3D530327_48C9377502A0_var*
begin
//#UC START# *4CAF3D530327_48C9377502A0_impl*
 Result := false{true};
              //^ - �� ����� ���, ������ �� ������, ������� ������
              //    ������������� �������
//#UC END# *4CAF3D530327_48C9377502A0_impl*
end;//TevTablePainter.NeedsHackK235870994

end.