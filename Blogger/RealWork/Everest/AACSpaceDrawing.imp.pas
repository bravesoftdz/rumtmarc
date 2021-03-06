{$IfNDef AACSpaceDrawing_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest"
// ������: "w:/common/components/gui/Garant/Everest/AACSpaceDrawing.imp.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi::Everest::Drawing Framework::AACSpaceDrawing
//
// ��� ��������� ������ �������� ��� AAK
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define AACSpaceDrawing_imp}
 _AACSpaceDrawing_ = {mixin} class(_AACSpaceDrawing_Parent_)
  {* ��� ��������� ������ �������� ��� AAK }
 private
 // private fields
   f_TopSpace : Integer;
   f_NeedCalcSpace : Boolean;
 protected
 // protected methods
   function NeedCalcSpace: Boolean; virtual; abstract;
     {* �������� ��� ������������ �������. }
   function SpecialFill(const aRect: Tl3Rect;
     aNeedCorrectRight: Boolean): Boolean;
     {* ����������� ������� ��� ������ ����� }
   procedure StartDrawingInitFields;
     {* ������� ������������� ����� ��� ������ ��������� �������. }
   procedure CorrectByTextHeight(aHeight: Integer); virtual;
     {* ������������ ������ ������������ ������� ������. }
   procedure CorrectByImageHeight(aHeight: Integer;
     aY: Integer);
     {* ������������ ������� ������ (� ��������). }
   procedure InternalDrawFrameText(const aText: Tl3PCharLen;
     aTop: Boolean;
     aSpace: Integer;
     aDecorType: TnevDecorType;
     const aDecorObj: InevTag;
     aFirstIndent: Integer);
   function HeaderOwnSpace: Boolean; virtual; abstract;
   function GetSpaceTop(anInc: Boolean): Integer; virtual; abstract;
 end;//_AACSpaceDrawing_

{$Else AACSpaceDrawing_imp}

// start class _AACSpaceDrawing_

function _AACSpaceDrawing_.SpecialFill(const aRect: Tl3Rect;
  aNeedCorrectRight: Boolean): Boolean;
//#UC START# *5062C0F603BF_5062BFDB025E_var*
var
 l_Top    : Integer;
 l_Bottom : Integer;
 l_Right  : Integer;
//#UC END# *5062C0F603BF_5062BFDB025E_var*
begin
//#UC START# *5062C0F603BF_5062BFDB025E_impl*
 Result := f_NeedCalcSpace;
 if Result then
 begin
  if Map.Bounds.Top > 0 then
   l_Top := Max(f_TopSpace, aRect.Top)
  else
   l_Top := 0;
  l_Bottom := aRect.Bottom;
  if Map.Bounds.Bottom < Area.rView.Metrics.Extent.Y then
   Dec(l_Bottom, Spaces.Bottom);
  l_Right := aRect.Right;
  if aNeedCorrectRight then
   l_Right := Max(aRect.Right, Map.Bounds.Right - Spaces.Right);
  Area.rCanvas.FillEmptyRect(l3Rect(aRect.Left, l_Top, l_Right, l_Bottom));
 end; //if Result then
//#UC END# *5062C0F603BF_5062BFDB025E_impl*
end;//_AACSpaceDrawing_.SpecialFill

procedure _AACSpaceDrawing_.StartDrawingInitFields;
//#UC START# *5062C21A02C0_5062BFDB025E_var*
//#UC END# *5062C21A02C0_5062BFDB025E_var*
begin
//#UC START# *5062C21A02C0_5062BFDB025E_impl*
 f_NeedCalcSpace := NeedCalcSpace;
 if f_NeedCalcSpace then
  f_TopSpace := GetSpaceTop(False)
 else
  f_TopSpace := 0; 
//#UC END# *5062C21A02C0_5062BFDB025E_impl*
end;//_AACSpaceDrawing_.StartDrawingInitFields

procedure _AACSpaceDrawing_.CorrectByTextHeight(aHeight: Integer);
//#UC START# *5062C3470289_5062BFDB025E_var*
//#UC END# *5062C3470289_5062BFDB025E_var*
begin
//#UC START# *5062C3470289_5062BFDB025E_impl*
 if f_NeedCalcSpace then
  f_TopSpace := aHeight;
//#UC END# *5062C3470289_5062BFDB025E_impl*
end;//_AACSpaceDrawing_.CorrectByTextHeight

procedure _AACSpaceDrawing_.CorrectByImageHeight(aHeight: Integer;
  aY: Integer);
//#UC START# *5062C38800CA_5062BFDB025E_var*
var
 l_Y: Integer;
//#UC END# *5062C38800CA_5062BFDB025E_var*
begin
//#UC START# *5062C38800CA_5062BFDB025E_impl*
 if f_NeedCalcSpace then
 begin
  l_Y := aY;
  if l_Y < 0 then l_Y := 0;
  l_Y := Area.rCanvas.DP2LP(l3SPoint(0, l_Y + aHeight)).Y;
  f_TopSpace := Min(f_TopSpace, GetSpaceTop(True) - l_Y);
 end; // if f_NeedCalcSpace then
//#UC END# *5062C38800CA_5062BFDB025E_impl*
end;//_AACSpaceDrawing_.CorrectByImageHeight

procedure _AACSpaceDrawing_.InternalDrawFrameText(const aText: Tl3PCharLen;
  aTop: Boolean;
  aSpace: Integer;
  aDecorType: TnevDecorType;
  const aDecorObj: InevTag;
  aFirstIndent: Integer);
//#UC START# *51FF64D702CE_5062BFDB025E_var*
var
 l_X              : Integer;
 l_Y              : Integer;
 l_H              : Integer;
 l_X0             : Integer;
 l_TE             : TnevPoint;
 l_NCR            : Tl3Rect;
 l_Height         : Integer;
 l_NeedText       : Boolean;
 l_Collapsed      : Boolean;
 l_ImageInfo      : PnevControlImageInfo;
 l_HeaderOwnSpace : Boolean;
//#UC END# *51FF64D702CE_5062BFDB025E_var*
begin
//#UC START# *51FF64D702CE_5062BFDB025E_impl*
 with Area.rCanvas do
 begin
  PushWO;
  try
   PushFC;
   try
    l_Collapsed := Area.rView.IsObjectCollapsed[ParaX];
    if not aTop then
     MoveWindowOrg(l3PointY(aSpace));
    if aDecorObj <> nil then
     DrawDecorObject(aDecorObj, l_Collapsed, aDecorType);
    l_NeedText := aTop AND
                  not l3IsNil(aText) AND
                  not l3Same(aText, sp_HardSpace[false]) AND
                  // - ������� ��� ��� ������, ������� ����� �� �����, � ������ - �����
                  // http://mdp.garant.ru/pages/viewpage.action?pageId=294600965
                  (not l_Collapsed OR not aDecorObj.IsValid);
    if l_NeedText then
    begin
     l_NCR := PushClipRect;
     try
      l_NCR.Right := Min(l_NCR.Right, FormatInfo.rLimitWidth);
      l_HeaderOwnSpace := HeaderOwnSpace;
      if not l_HeaderOwnSpace then
      // http://mdp.garant.ru/pages/viewpage.action?pageId=280006084
       l_NCR.Right := Min(l_NCR.Right, aFirstIndent);
      ClipRect := l_NCR;
      l_ImageInfo := FormatInfo.ImageInfo;
      if aTop then
      begin
       if (l_ImageInfo <> nil) and not l_ImageInfo.rHidePicture and l_ImageInfo.rPictureOnly then
        l_Height := DP2LP(PointY(l_ImageInfo.rImageList.Height)).Y
       else
        l_Height := FormatInfo.DecorHeight(aDecorType);
       if l_HeaderOwnSpace then
        l_H := aSpace - l_Height
       else
       begin
        MoveWindowOrg(DP2LP(PointY(1)));
        // - ���. ������� ������������ ������� �����.
        l_H := l_Height;
       end;//l_HeaderOwnSpace
       if (l_H <> 0) then
        MoveWindowOrg(l3PointY(-l_H));
       CorrectByTextHeight(l_H);
      end;//aTop
      Font := FormatInfo.FrameTextFont;
      if l_HeaderOwnSpace then
      begin
       l_X0 := (l3Inch div 64);
       l_X := l_X0 + l3Inch div 6;
      end//l_HeaderOwnSpace
      else
      begin
       l_X0 := ParaX.IntA[k2_tiFirstIndent];
       l_X := l_X0;
      end;//l_HeaderOwnSpace
      if (l_ImageInfo <> nil) and not l_ImageInfo.rHidePicture then
      begin
       Inc(l_X, l_ImageInfo.rLeftIndent);
       Inc(l_X0, l_ImageInfo.rLeftIndent);
       if (l_ImageInfo.rImageList <> nil) AND (l_ImageInfo.rFirstIndex >= 0) then
       begin
        if l_HeaderOwnSpace then
         Inc(l_X, DP2LP(PointX(l_ImageInfo.rImageList.Width)).X div 2)
        else
         Inc(l_X, DP2LP(PointX(l_ImageInfo.rImageList.Width)).X * 2);
       end;//l_ImageInfo.rImageList <> nil..
      end;//l_ImageInfo <> nil
      if l_ImageInfo.rPictureOnly and not l_ImageInfo.rHidePicture then // http://mdp.garant.ru/pages/viewpage.action?pageId=474592317 �. 2)
       l_TE := l3Point0
      else
       l_TE := TextOut(l3Point(l_X, 0), aText);
      if (l_ImageInfo <> nil) and not l_ImageInfo.rHidePicture then
       if (l_ImageInfo.rImageList <> nil) then
       begin
        if (l_ImageInfo.rFirstIndex >= 0) then
         with LP2DP(l3Point(l_X0,
                            l_TE.Y)) do
         begin
          if l_ImageInfo.rPictureOnly then
           l_Y := 0
          else
           l_Y := ((Y - l_ImageInfo.rImageList.Height) div 2);
          FillRect(l3SRect(X, l_Y,
                           X + l_ImageInfo.rImageList.Width,
                           l_Y + l_ImageInfo.rImageList.Height));
          l_ImageInfo.rImageList.Draw(As_Il3Canvas,
                                      X, l_Y,
                                      l_ImageInfo.rFirstIndex);
         end;//with LP2DP(l3Point((l3Inch div 64) {div 2}, l_TE.Y))
        if (l_ImageInfo.rLastIndex >= 0) then
         with LP2DP(l3Point(l_X + l_TE.X, l_TE.Y)) do
         begin
          l_Y := ((Y - l_ImageInfo.rImageList.Height) div 2);
          FillRect(l3SRect(X, l_Y,
                           X + l_ImageInfo.rImageList.Width,
                           l_Y + l_ImageInfo.rImageList.Height));
          l_ImageInfo.rImageList.Draw(As_Il3Canvas,
                                      X, l_Y,
                                      l_ImageInfo.rLastIndex);
         end;//with LP2DP(l3Point(l_X + l_TE.X, l_TE.Y))

         if aTop then
          CorrectByImageHeight(l_ImageInfo.rImageList.Height, l_Y);
       end;//l_ImgLst <> nil
     finally
      PopClipRect;
     end;//try..finally
    end;//l_NeedText
   finally
    PopFC;
   end;//try..finally
  finally
   PopWO;
  end;//try..finally
 end;//with Area.rCanvas
//#UC END# *51FF64D702CE_5062BFDB025E_impl*
end;//_AACSpaceDrawing_.InternalDrawFrameText

{$EndIf AACSpaceDrawing_imp}
