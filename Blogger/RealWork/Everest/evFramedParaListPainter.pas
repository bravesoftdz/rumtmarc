unit evFramedParaListPainter;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest"
// �����: ����� �.�.
// ������: "w:/common/components/gui/Garant/Everest/evFramedParaListPainter.pas"
// �����: 20.02.2008 10:18
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi::Everest::ParaList Painters::TevFramedParaListPainter
//
// ����� ���������������� ��� ����������� ������
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
  l3InternalInterfaces,
  evParaListPainter,
  l3LongintList,
  evSelectedParts,
  nevRealTools,
  nevTools
  ;

type
 _evDelayedPainters_Parent_ = TevParaListPainter;
 {$Include ..\Everest\evDelayedPainters.imp.pas}
 TevFramedParaListPainter = class(_evDelayedPainters_)
  {* ����� ���������������� ��� ����������� ������ }
 protected
 // overridden protected methods
   procedure DoInitAlignObjects; override;
     {* ������������� ������������ �������. }
   procedure DoFinisAlignObjects; override;
     {* ������������� ������������ �����. }
   procedure DoFillSelection; override;
   function DoDraw: Boolean; override;
     {* ���������� ��������� ��������� ���������. ��� ���������� � ��������. }
   function GetPaintersHolder: InevPaintersHolder; override;
 protected
 // protected methods
   function GetFameObjectBehaviur: Tl3FrameObjectBehaviour; virtual;
   function GetColorArray: Tl3LinesColorArray; virtual;
   {$If defined(nsTest)}
   function NeedLog: Boolean; virtual; abstract;
     {* ������������ �� ��������� ������ ������ � ��� ��� ������. }
   {$IfEnd} //nsTest
 end;//TevFramedParaListPainter

implementation

uses
  SysUtils,
  Graphics,
  k2Tags,
  l3Units,
  l3Base,
  evDelayedPaintersSpy
  ;

{$Include ..\Everest\evDelayedPainters.imp.pas}

// start class TevFramedParaListPainter

function TevFramedParaListPainter.GetFameObjectBehaviur: Tl3FrameObjectBehaviour;
//#UC START# *51B96E5A0285_48C9300A02EF_var*
//#UC END# *51B96E5A0285_48C9300A02EF_var*
begin
//#UC START# *51B96E5A0285_48C9300A02EF_impl*
 Result := l3_fobNone;
 if Area.rCanvas.Printing then
  Result := l3_fobPrinting;
//#UC END# *51B96E5A0285_48C9300A02EF_impl*
end;//TevFramedParaListPainter.GetFameObjectBehaviur

function TevFramedParaListPainter.GetColorArray: Tl3LinesColorArray;
//#UC START# *48C9339E0013_48C9300A02EF_var*
{$IFNDEF Nemesis}
const
 cnHiddenRed = TColor(13028082);

 function lp_CheckZoom: Boolean;
 begin
  Result := ParaX.HasSubAtom(k2_tiZoom) and
    (ParaX.IntA[k2_tiZoom] <> ParaX.TagType.Prop[k2_tiZoom].DefaultValue);
 end;
{$ENDIF Nemesis}
//#UC END# *48C9339E0013_48C9300A02EF_var*
begin
//#UC START# *48C9339E0013_48C9300A02EF_impl*
 if ParaX.HasSubAtom(k2_tiOldNSRC) and ParaX.BoolA[k2_tiOldNSRC] then
{$IFNDEF Nemesis}
  if lp_CheckZoom then
   Result[lpdDraw] := clPurple
  else
{$ENDIF Nemesis}
   Result[lpdDraw] := clBlue
 else
{$IFNDEF Nemesis}
  if lp_CheckZoom then
   Result[lpdDraw] := clRed
  else
{$ENDIF Nemesis}
   Result[lpdDraw] := ParaX.Attr[k2_tiFrame].IntA[k2_tiForeColor]{clBlack};
{$IFNDEF Nemesis}
 if ParaX.HasSubAtom(k2_tiOldNSRC) and ParaX.BoolA[k2_tiOldNSRC] then
  if lp_CheckZoom then
   Result[lpdSpecialDraw] := clFuchsia
  else
   Result[lpdSpecialDraw] := clSkyBlue
 else
  if lp_CheckZoom then
   Result[lpdSpecialDraw] := cnHiddenRed
  else
{$ENDIF Nemesis}
 Result[lpdSpecialDraw] := clGray;
 Result[lpdHidden] := clWhite;
//#UC END# *48C9339E0013_48C9300A02EF_impl*
end;//TevFramedParaListPainter.GetColorArray

procedure TevFramedParaListPainter.DoInitAlignObjects;
//#UC START# *4804B5FC02A3_48C9300A02EF_var*
//#UC END# *4804B5FC02A3_48C9300A02EF_var*
begin
//#UC START# *4804B5FC02A3_48C9300A02EF_impl*
 with Area.rCanvas.FrameLines do
 begin
  StartFrameObject(GetFameObjectBehaviur, Integer(ParaX.Box.AsObject), GetColorArray);
  {$IFDEF nsTest}
  SetNeedLogging(Integer(ParaX.Box.AsObject), NeedLog);
  {$ENDIF nsTest}
 end;
//#UC END# *4804B5FC02A3_48C9300A02EF_impl*
end;//TevFramedParaListPainter.DoInitAlignObjects

procedure TevFramedParaListPainter.DoFinisAlignObjects;
//#UC START# *4804B60E033E_48C9300A02EF_var*
//#UC END# *4804B60E033E_48C9300A02EF_var*
begin
//#UC START# *4804B60E033E_48C9300A02EF_impl*
 if Area.rCanvas.Printing then
  Area.rCanvas.FrameLines.FinishFrameObject(Integer(ParaX.Box.AsObject), Area.rCanvas.SectionExtent.Y)
 else
  Area.rCanvas.FrameLines.FinishFrameObject(Integer(ParaX.Box.AsObject), -1);
//#UC END# *4804B60E033E_48C9300A02EF_impl*
end;//TevFramedParaListPainter.DoFinisAlignObjects

procedure TevFramedParaListPainter.DoFillSelection;
//#UC START# *4804B86403BE_48C9300A02EF_var*
//#UC END# *4804B86403BE_48C9300A02EF_var*
begin
//#UC START# *4804B86403BE_48C9300A02EF_impl*
 if not Area.rCanvas.IsVirtual then
  PaintSelectionParts
 else
  inherited;
//#UC END# *4804B86403BE_48C9300A02EF_impl*
end;//TevFramedParaListPainter.DoFillSelection

function TevFramedParaListPainter.DoDraw: Boolean;
//#UC START# *4804BC2401C2_48C9300A02EF_var*
//#UC END# *4804BC2401C2_48C9300A02EF_var*
begin
//#UC START# *4804BC2401C2_48C9300A02EF_impl*
 Result := inherited DoDraw;
 DoFinisAlignObjects;
 if Area.rCanvas.DrawEnabled then
  if not (Area.rCanvas.Printing and (BottomAnchor <> nil) and BottomAnchor.AtStart) then
   Area.rCanvas.FrameLines.DrawAllLines(Area.rCanvas.As_Il3Canvas, Integer(ParaX.Box.AsObject));
//#UC END# *4804BC2401C2_48C9300A02EF_impl*
end;//TevFramedParaListPainter.DoDraw

function TevFramedParaListPainter.GetPaintersHolder: InevPaintersHolder;
//#UC START# *49DB948303B9_48C9300A02EF_var*
//#UC END# *49DB948303B9_48C9300A02EF_var*
begin
//#UC START# *49DB948303B9_48C9300A02EF_impl*
 Result := Self;
//#UC END# *49DB948303B9_48C9300A02EF_impl*
end;//TevFramedParaListPainter.GetPaintersHolder

end.