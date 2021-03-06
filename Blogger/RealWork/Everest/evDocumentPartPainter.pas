unit evDocumentPartPainter;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest"
// �����: ����� �.�.
// ������: "w:/common/components/gui/Garant/Everest/evDocumentPartPainter.pas"
// �����: 15.12.96 01:55
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi::Everest::ParaList Painters::TevDocumentPartPainter
//
// ���������� ���������� IevPainter ��� ����� ����������
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\Everest\evDefine.inc}

interface

uses
  l3Units,
  evParaListPainter,
  l3Types,
  nevBase,
  l3Interfaces,
  nevRealTools
  ;

type
 _AACSpaceDrawing_Parent_ = TevParaListPainter;
 {$Include ..\Everest\AACSpaceDrawing.imp.pas}
 TevDocumentPartPainter = class(_AACSpaceDrawing_)
  {* ���������� ���������� IevPainter ��� ����� ���������� }
 private
 // private methods
   procedure CorrectFrameBounds;
   function DoWithFrameName(aDrawText: Boolean): Tl3Point;
 protected
 // realized methods
   function NeedCalcSpace: Boolean; override;
     {* �������� ��� ������������ �������. }
   function HeaderOwnSpace: Boolean; override;
   function GetSpaceTop(anInc: Boolean): Integer; override;
 protected
 // overridden protected methods
   procedure DrawFrame; override;
     {* ��������� ��������� ������� ����� ������ ���������. }
   function InfiniteFrame: Boolean; override;
   procedure GetFramePartPrim(const aFrame: InevTag;
    anIndex: Tl3FramePartIndex;
    var thePart: TnevFramePart); override;
   procedure DoDrawFrameText(aTop: Boolean); override;
   function BeforeDrawChild(const ChildPainter: IevPainter): Boolean; override;
     {* ���������� ����� ���������� ������� ��������� ���������. }
   procedure FillUnfilled(const aRect: Tl3Rect); override;
     {* �������� ������� ���������, ������� �� ���� ������ }
   procedure CorrectByTextHeight(aHeight: Integer); override;
     {* ������������ ������ ������������ ������� ������. }
 protected
 // protected methods
   procedure DrawFrameName; virtual;
     {* ������ ��� ����� � ������� ����� }
   function NeedDrawPlus: Boolean; virtual;
     {* ����� �� �������� ����/����� ��� ��������/������������ ����� }
 end;//TevDocumentPartPainter

implementation

uses
  evDocumentPart,
  l3Defaults,
  Graphics,
  k2Tags,
  evDef,
  l3CustomString,
  evConst,
  l3MinMax,
  l3Const,
  l3String,
  l3Chars,
  l3Math,
  evParaTools
  ;

{$Include ..\Everest\AACSpaceDrawing.imp.pas}

const
   { ��������� ��� ��������� ������� (��������) � ��������. }
  cPlusFrameWidth = 1;
  cPlusSize = 10;
  cHalfPlusSize = 5;
  cDeltaPlus = cHalfPlusSize + cPlusFrameWidth;
   { �������� ��� ������ ��������� �����. }
  cDeltaText = cPlusSize + cPlusFrameWidth;
   { �������� ������ ����� ���� (����� ���������� ���������). }

// start class TevDocumentPartPainter

procedure TevDocumentPartPainter.CorrectFrameBounds;
//#UC START# *4EB92D5A0249_49DB1B70013F_var*
var
 l_Y           : Integer;
 l_BottomRight : Tl3_Point;
//#UC END# *4EB92D5A0249_49DB1B70013F_var*
begin
//#UC START# *4EB92D5A0249_49DB1B70013F_impl*
 if Collapsed then
 begin
  l_Y := Area.rCanvas.DP2LP(l3SPoint(0, cDeltaText)).Y;
  l_Y := Max(l_Y, DoWithFrameName(False).Y);
  Inc(l_Y, Spaces.Top + 3 * def_FrameWidth);
  l_BottomRight := Map.Bounds.BottomRight;
  l_BottomRight := l3Point(l_BottomRight.X, Max(l_BottomRight.Y, Map.Bounds.Top + l_Y));
  Map.SetDrawnBottom(l_BottomRight);
 end; // if Collapsed then
//#UC END# *4EB92D5A0249_49DB1B70013F_impl*
end;//TevDocumentPartPainter.CorrectFrameBounds

function TevDocumentPartPainter.DoWithFrameName(aDrawText: Boolean): Tl3Point;
//#UC START# *4EB92D990307_49DB1B70013F_var*
var
 l_BC   : TnevColor;
 l_Name : Tl3CustomString;
//#UC END# *4EB92D990307_49DB1B70013F_var*
begin
//#UC START# *4EB92D990307_49DB1B70013F_impl*
 Result := l3Point0;
 l_Name := evGetBlockName(ParaX);
 if (l_Name <> nil) then
  with Area.rCanvas do
   begin
    with Font do
    begin
     Name := def_FontName;
     Size := def_FontSize - 3;
     if aDrawText then
     begin
      l_BC := ParaX.BackColor;
      if (l_BC <> nevDefaultColor) then
       BackColor := l_BC;
     end; // if aDrawText then
     Style := [];
    end;//with Font
    if aDrawText then
     TextOut(l3Point1(def_FrameWidth), l_Name.AsPCharLen)
    else
     Result := TextExtent(l_Name.AsPCharLen)
   end;//l_Name <> nil
//#UC END# *4EB92D990307_49DB1B70013F_impl*
end;//TevDocumentPartPainter.DoWithFrameName

procedure TevDocumentPartPainter.DrawFrameName;
//#UC START# *49DB1B9E0191_49DB1B70013F_var*
//#UC END# *49DB1B9E0191_49DB1B70013F_var*
begin
//#UC START# *49DB1B9E0191_49DB1B70013F_impl*
 if Collapsed then
  DoWithFrameName(True);
//#UC END# *49DB1B9E0191_49DB1B70013F_impl*
end;//TevDocumentPartPainter.DrawFrameName

function TevDocumentPartPainter.NeedDrawPlus: Boolean;
//#UC START# *49DB1BF30312_49DB1B70013F_var*
//#UC END# *49DB1BF30312_49DB1B70013F_var*
begin
//#UC START# *49DB1BF30312_49DB1B70013F_impl*
 {$IfDef evNeedCollapseBlocks}
 Result := ViewMetrics.ShowDocumentParts;
 {$Else  evNeedCollapseBlocks}
 Result := False;
 {$EndIf evNeedCollapseBlocks}
//#UC END# *49DB1BF30312_49DB1B70013F_impl*
end;//TevDocumentPartPainter.NeedDrawPlus

function TevDocumentPartPainter.NeedCalcSpace: Boolean;
//#UC START# *5062C0650076_49DB1B70013F_var*
//#UC END# *5062C0650076_49DB1B70013F_var*
begin
//#UC START# *5062C0650076_49DB1B70013F_impl*
 Result := EvHasOwnStyle(ParaX);
//#UC END# *5062C0650076_49DB1B70013F_impl*
end;//TevDocumentPartPainter.NeedCalcSpace

function TevDocumentPartPainter.HeaderOwnSpace: Boolean;
//#UC START# *51FF6BC10266_49DB1B70013F_var*
//#UC END# *51FF6BC10266_49DB1B70013F_var*
begin
//#UC START# *51FF6BC10266_49DB1B70013F_impl*
 Result := True;
//#UC END# *51FF6BC10266_49DB1B70013F_impl*
end;//TevDocumentPartPainter.HeaderOwnSpace

function TevDocumentPartPainter.GetSpaceTop(anInc: Boolean): Integer;
//#UC START# *5208B63400C1_49DB1B70013F_var*
//#UC END# *5208B63400C1_49DB1B70013F_var*
begin
//#UC START# *5208B63400C1_49DB1B70013F_impl*
 Result := Spaces.Top;
 if ViewMetrics.ShowDocumentParts then
  if anInc then
   Inc(Result, evDocumentPartLineSpace)
  else
   Dec(Result, evDocumentPartLineSpace);
//#UC END# *5208B63400C1_49DB1B70013F_impl*
end;//TevDocumentPartPainter.GetSpaceTop

procedure TevDocumentPartPainter.DrawFrame;
//#UC START# *4804B76803D5_49DB1B70013F_var*
//#UC END# *4804B76803D5_49DB1B70013F_var*
begin
//#UC START# *4804B76803D5_49DB1B70013F_impl*
 with Area.rCanvas do
 begin
  if Printing AND (ClipRect.Bottom < Spaces.Top) then
   Exit;
  PushWO;
  try
   CorrectFrameBounds;
   inherited;
   with Tl3Rect(Map.Bounds) do
    WindowOrg := TopLeft.Neg;
   MoveWindowOrg(l3SPoint(-cDeltaPlus, -cDeltaPlus));
   if not Printing AND NeedDrawPlus AND IsTopAnchorAtStart then
   begin
    // - ������ ���� ��� �����
    PushBC;
    try
     BackColor := clBlack;
     FillForeRect(l3SRect(Point0, l3SPoint(cPlusSize, cPlusFrameWidth)));
     FillForeRect(l3SRect(0, cPlusSize, cPlusSize, cDeltaText));
     FillForeRect(l3SRect(Point0, l3SPoint(cPlusFrameWidth, cPlusSize)));
     FillForeRect(l3SRect(cPlusSize, 0, cDeltaText, cDeltaText));

     FillForeRect(l3SRect(cPlusFrameWidth * 2,
                          cHalfPlusSize,
                          cPlusSize - cPlusFrameWidth,
                          cDeltaPlus));
     if Collapsed then
      FillForeRect(l3SRect(cHalfPlusSize,
                           cPlusFrameWidth * 2,
                           cDeltaPlus,
                           cPlusSize - cPlusFrameWidth));

     MoveWindowOrg(PointX(-cDeltaText));
    finally
     PopBC;
    end;//try..finally
   end;//not Printing
   DrawFrameName; // - ������ ��� �����
  finally
   PopWO;
  end;//try..finally
 end;//with Area.rCanvas
//#UC END# *4804B76803D5_49DB1B70013F_impl*
end;//TevDocumentPartPainter.DrawFrame

function TevDocumentPartPainter.InfiniteFrame: Boolean;
//#UC START# *4804B78B0397_49DB1B70013F_var*
//#UC END# *4804B78B0397_49DB1B70013F_var*
begin
//#UC START# *4804B78B0397_49DB1B70013F_impl*
 Result := True;
//#UC END# *4804B78B0397_49DB1B70013F_impl*
end;//TevDocumentPartPainter.InfiniteFrame

procedure TevDocumentPartPainter.GetFramePartPrim(const aFrame: InevTag;
  anIndex: Tl3FramePartIndex;
  var thePart: TnevFramePart);
//#UC START# *4804B9BB0383_49DB1B70013F_var*
//#UC END# *4804B9BB0383_49DB1B70013F_var*
begin
//#UC START# *4804B9BB0383_49DB1B70013F_impl*
 if EvHasOwnStyle(ParaX) then
 begin
  if (anIndex = l3_fpiUp) then
   if (Spaces.Top > 0) AND not ParaX.Attr[k2_tiStyle].BoolA[k2_tiHeaderHasOwnSpace] then
   begin
    thePart.rDrawType := lpdDraw;
    thePart.rColor := clBlack;
    thePart.rWidth := 0;
    thePart.rSpaceBefore := (l3Inch div 8) div 2;
    thePart.rSpaceAfter := (l3Inch div 8) div 2;
   end;//Spaces.Top > 0..
  if (thePart.rDrawType = lpdDraw) AND (anIndex = l3_fpiLeft) then
   thePart.rSpaceBefore := Max(Spaces.Left - l3Inch div 16, 0);
  if (thePart.rDrawType = lpdDraw) then
  begin
   if (anIndex = l3_fpiDown) then
   begin
    thePart.rSpaceBefore := Max(thePart.rSpaceBefore, l3Inch div 16);
    thePart.rSpaceAfter := Max(thePart.rSpaceAfter, l3Inch div 32);
   end;//anIndex = l3_fpiDown
  end;//thePart.rDrawType = lpdDraw
 end; // if HasOwnStyle then
 if ViewMetrics.ShowDocumentParts then
 begin
  thePart.rDrawType := lpdDraw;
  thePart.rColor := clBlue;
  thePart.rWidth := 1;
  case anIndex of
   l3_fpiUp,
   l3_fpiLeft:
    thePart.rSpaceBefore := evDocumentPartLineSpace;
   l3_fpiDown:
    thePart.rSpaceAfter := evDocumentPartLineSpace;
  end;//�ase anIndex
 end//View.Metrics.ShowDocumentParts
 else
  thePart.rDrawType := lpdHidden;
//#UC END# *4804B9BB0383_49DB1B70013F_impl*
end;//TevDocumentPartPainter.GetFramePartPrim

procedure TevDocumentPartPainter.DoDrawFrameText(aTop: Boolean);
//#UC START# *4804C35B00B2_49DB1B70013F_var*
var
 l_Space : Integer;
 l_Style : InevTag;
 l_Text  : Tl3PCharLen;
//#UC END# *4804C35B00B2_49DB1B70013F_var*
begin
//#UC START# *4804C35B00B2_49DB1B70013F_impl*
 if EvHasOwnStyle(ParaX) then
 begin
  if aTop then
   l_Space := GetSpaceTop(False)
  else
   l_Space := Spaces.Bottom;
  if (l_Space > 0) then
  begin
   l_Style := ParaX.Attr[k2_tiStyle];
   l_Text := l_Style.PCharLenA[k2_tiShortName];
   if not l3IsNil(l_Text) then
    InternalDrawFrameText(l_Text, aTop, l_Space, nev_dtHeader, nil, 0);
  end;//l_Space > 0
 end // if EvHasOwnStyle(ParaX) then
 else
  inherited;
//#UC END# *4804C35B00B2_49DB1B70013F_impl*
end;//TevDocumentPartPainter.DoDrawFrameText

function TevDocumentPartPainter.BeforeDrawChild(const ChildPainter: IevPainter): Boolean;
//#UC START# *481D6C56033A_49DB1B70013F_var*
//#UC END# *481D6C56033A_49DB1B70013F_var*
begin
//#UC START# *481D6C56033A_49DB1B70013F_impl*
 StartDrawingInitFields;
 Result := not Collapsed;
//#UC END# *481D6C56033A_49DB1B70013F_impl*
end;//TevDocumentPartPainter.BeforeDrawChild

procedure TevDocumentPartPainter.FillUnfilled(const aRect: Tl3Rect);
//#UC START# *4E2702FE01EA_49DB1B70013F_var*
//#UC END# *4E2702FE01EA_49DB1B70013F_var*
begin
//#UC START# *4E2702FE01EA_49DB1B70013F_impl*
 if not SpecialFill(aRect, True) then
  inherited;
//#UC END# *4E2702FE01EA_49DB1B70013F_impl*
end;//TevDocumentPartPainter.FillUnfilled

procedure TevDocumentPartPainter.CorrectByTextHeight(aHeight: Integer);
//#UC START# *5062C3470289_49DB1B70013F_var*
//#UC END# *5062C3470289_49DB1B70013F_var*
begin
//#UC START# *5062C3470289_49DB1B70013F_impl*
 if ViewMetrics.ShowDocumentParts then
  Inc(aHeight, evDocumentPartLineSpace);
 inherited CorrectByTextHeight(aHeight);
//#UC END# *5062C3470289_49DB1B70013F_impl*
end;//TevDocumentPartPainter.CorrectByTextHeight

end.