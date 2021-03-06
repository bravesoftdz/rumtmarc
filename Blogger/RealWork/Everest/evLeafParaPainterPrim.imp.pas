{$IfNDef evLeafParaPainterPrim_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest"
// �����: ����� �.�.
// ������: "w:/common/components/gui/Garant/Everest/evLeafParaPainterPrim.imp.pas"
// �����: 15.04.2008 19:13
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi::Everest::Drawing Framework::evLeafParaPainterPrim
//
// ������� ���������� ��������� ����������.
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define evLeafParaPainterPrim_imp}
 {$Include ..\Everest\evParaPainter.imp.pas}
 _evLeafParaPainterPrim_ = {mixin} class(_evParaPainter_)
  {* ������� ���������� ��������� ����������. }
 protected
 // overridden protected methods
   function DoDraw: Boolean; override;
     {* ���������� ��������� ��������� ���������. ��� ���������� � ��������. }
   procedure InitBottom(var theBottom: InevBasePoint;
    var theCellBottom: InevBasePoint); override;
 protected
 // protected methods
   function GetBitmapForPara: Il3Bitmap; virtual;
   function DrawPicture: Boolean;
     {* ������ �������� � ��������� - Para �� ����� CN �� �������� aTop. }
   function DrawLeaf: Boolean; virtual;
 end;//_evLeafParaPainterPrim_

{$Else evLeafParaPainterPrim_imp}

{$Include ..\Everest\evParaPainter.imp.pas}

// start class _evLeafParaPainterPrim_

function _evLeafParaPainterPrim_.GetBitmapForPara: Il3Bitmap;
//#UC START# *4E53B9A500B4_4804C7B60375_var*
//#UC END# *4E53B9A500B4_4804C7B60375_var*
begin
//#UC START# *4E53B9A500B4_4804C7B60375_impl*
 Result := FormatInfo.Rendered;
//#UC END# *4E53B9A500B4_4804C7B60375_impl*
end;//_evLeafParaPainterPrim_.GetBitmapForPara

function _evLeafParaPainterPrim_.DrawPicture: Boolean;
//#UC START# *4804C7FC02BB_4804C7B60375_var*
var
 l_BitmapContainer : Il3Bitmap;
 l_Top             : Tl3Point;
 l_Height          : Integer;
 l_ParentWidth     : Integer;
 l_Width           : Integer;
 l_Left            : Integer;
 l_Delta           : Integer;
 l_Extent          : Tl3Point;
 l_ImageInfo       : PnevControlImageInfo;
//#UC END# *4804C7FC02BB_4804C7B60375_var*
begin
//#UC START# *4804C7FC02BB_4804C7B60375_impl*
 PushBC;
 try
  Result := True;
  with ParaX do
  begin
   l_Left := Spaces.Left;
   l_BitmapContainer := GetBitmapForPara;
   if (l_BitmapContainer = nil) then
   begin
    l_ImageInfo := FormatInfo.ImageInfo;
(*    if (l_ImageInfo.rImageList <> nil) then
     if (l_ImageInfo.rFirstIndex >= 0) then
     begin
      with Area.rCanvas.DP2LP(l3SPoint(l_ImageInfo.rImageList.Width + 2,
                                       l_ImageInfo.rImageList.Height + 2)) do
      begin
       IntA[k2_tiWidth] := X;
       IntA[k2_tiHeight] := Y;
       if (X <> FormatInfo.Width) then
        (FormatInfo^ As InevFormatInfoModify).wWidth(X);
       if (Y <> FormatInfo.Height) then
        (FormatInfo^ As InevFormatInfoModify).wHeight(Y);
      end;//with Area.rCanvas..
     end;//l_ImageInfo.rFirstIndex >= 0*)
   end;//l_BitmapContainer = nil
   l_Height := FormatInfo.Height;
   l_Width := FormatInfo.Width;
(*   if (TopAnchor = nil) then
    l_Top := Tl3Point(nevPt0)
   else*)
   Assert(TopAnchor <> nil, 'TopAnchor �� ������ ����� ���� nil, �� �� ������ �����������');
    l_Top := l3PointY(TopAnchor.AsLeaf.PaintOffsetY(Area.rView.As_InevView, FormatInfo)).Neg; //nevPt0; //aTop.Offset.Neg;
   l_Delta := 0;
   with OwnerPara do
   begin
//    l_ParentWidth := Map.ParentMap.rWidth;
    if (Map = nil) then
     l_ParentWidth := 0
    else
     l_ParentWidth := FormatInfo.ParentInfo.rLimitWidth;
    if (l_ParentWidth > 0) then
     with Spaces do
     begin
      Dec(l_ParentWidth, Left);
      Dec(l_ParentWidth, Right);
     end;//with Spaces
   end;//with OwnerPara.Shape
   if (l_ParentWidth > 0) then
    with Attr[k2_tiJustification] do
     if IsValid then
      case AsLong of
       Ord(ev_itCenter):
        l_Delta := (l_ParentWidth - l_Width) div 2;
       Ord(ev_itRight):
        l_Delta := l_ParentWidth - l_Width;
      end;//Case AsLong
   Inc(l_Left, l_Delta);
   Inc(l_Top.P.X, l_Left);
   l_Extent := l3Point(l_Width, l_Height).Add(l_Top);
   with Area.rCanvas do
   begin
    if (l_Top.Y = 0) AND Printing then
    // - ����� ��������, ��� �������� ������� �� ����
    begin
     if (l_Extent.Y > ClipRect.Bottom) AND
        (l_Extent.Y <= GlobalClipRect.Bottom - GlobalClipRect.Top) then
     begin
      // - �� ������ ��������, ���� �� ������ � ����� ������ �� ��������� ����
      Result := false;
      Exit;
     end;//l_Extent.Y > ClipRect.Bottom
    end;//l_Top.Y = 0
    if (l_BitmapContainer <> nil) then
     l_BitmapContainer.StretchDraw(l3Rect(l_Top, l_Extent), Self.Area.rCanvas.As_Il3Canvas)
    else
    begin
     // - ����� ���������� ���������� �������� �� ������
     if (l_ImageInfo <> nil) then
      if (l_ImageInfo.rImageList <> nil) then
       if (l_ImageInfo.rFirstIndex >= 0) then
       begin
        FillRect(l3Rect(l_Top, l_Extent));
        l_Top := l_Top.Add(
         l_Extent.Sub(
          DP2LP(l3SPoint(l_ImageInfo.rImageList.Width,
                         l_ImageInfo.rImageList.Height)))
           .Divide(l3Point1(2)));
        with LP2DP(l_Top) do
         l_ImageInfo.rImageList.Draw(As_Il3Canvas,
                                     X, Y,
                                     l_ImageInfo.rFirstIndex);
       end;//l_ImageInfo.rFirstIndex >= 0
    end;//l_BitmapContainer <> nil
    if Printing AND (l_Extent.Y > ClipRect.Bottom) then
     Result := False;
   end;//with Area.rCanvas
  end;//with ParaX
  FocusRect(Area.rCanvas.LR2DR(l3Rect(l_Top, l_Extent)));
 finally
  PopBC;
 end;//try..finally
//#UC END# *4804C7FC02BB_4804C7B60375_impl*
end;//_evLeafParaPainterPrim_.DrawPicture

function _evLeafParaPainterPrim_.DrawLeaf: Boolean;
//#UC START# *4804C81000B9_4804C7B60375_var*
//#UC END# *4804C81000B9_4804C7B60375_var*
begin
//#UC START# *4804C81000B9_4804C7B60375_impl*
 Result := inherited DoDraw;
//#UC END# *4804C81000B9_4804C7B60375_impl*
end;//_evLeafParaPainterPrim_.DrawLeaf

function _evLeafParaPainterPrim_.DoDraw: Boolean;
//#UC START# *4804BC2401C2_4804C7B60375_var*
//#UC END# *4804BC2401C2_4804C7B60375_var*
begin
//#UC START# *4804BC2401C2_4804C7B60375_impl*
 Result := DrawLeaf;
 SetDrawnBottom;
//#UC END# *4804BC2401C2_4804C7B60375_impl*
end;//_evLeafParaPainterPrim_.DoDraw

procedure _evLeafParaPainterPrim_.InitBottom(var theBottom: InevBasePoint;
  var theCellBottom: InevBasePoint);
//#UC START# *4804BC800172_4804C7B60375_var*
var
 l_Pt : TnevPoint;
//#UC END# *4804BC800172_4804C7B60375_var*
begin
//#UC START# *4804BC800172_4804C7B60375_impl*
 theCellBottom := nil;
 if (Map <> nil) then
 // - ��� �������� �����, �������� ��� ��������� �������� (������)
  with Map.Bounds do
  begin
   l_Pt := l3Point(Left, Bottom);
   theBottom.AsLeaf.InitPointByPt(Area.rView.As_InevView, l_Pt, Map);
   if (Bottom > Top + Spaces.Top) then
   // - !!! ������ ���� �������� ��� ��������� ���������� ���� ������������
   //       ����� ������, �.�. �� �� ����� ��������.
    theBottom := TnevAfterEndPoint.Make(Area.rView.As_InevView, theBottom);
  end;//with Map.Bounds
//#UC END# *4804BC800172_4804C7B60375_impl*
end;//_evLeafParaPainterPrim_.InitBottom

{$EndIf evLeafParaPainterPrim_imp}
