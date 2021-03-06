{$IfNDef nevFontTool_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest"
// �����: ����� �.�.
// ������: "w:/common/components/gui/Garant/Everest/nevFontTool.imp.pas"
// �����: 15.09.2011 17:54
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi::Everest::Garbage::nevFontTool
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define nevFontTool_imp}
 _nevFontTool_ = {mixin} class(_nevFontTool_Parent_)
 private
 // private fields
   f_TRF : IevResultFont;
   f_ZoomPara : InevTag;
   f_Zoom : Integer;
   f_SRF : IevResultFont;
   SRF : IevResultFont;
   ParaFont : IevResultFont;
 private
 // private methods
   function GetObjFont(const aView: InevViewMetrics;
    const Para: InevTag;
    IsSegment: Boolean;
    aFI: TnevFormatInfoPrim;
    CorrectItalic: Boolean): IevResultFont;
 public
 // realized methods
   function GetObjRealFont(const aView: InevViewMetrics;
    const Para: InevTag;
    IsSegment: Boolean;
    aFI: TnevFormatInfoPrim;
    CorrectItalic: Boolean = true): InevFont;
     {* �������� ����� �������. }
   function GetObjIFont(const aView: InevViewMetrics;
    const Para: InevTag;
    IsSegment: Boolean;
    aParentFI: TnevFormatInfoPrim;
    CorrectItalic: Boolean = true): InevFont;
     {* �������� ����� �������. }
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* ������� ������� ����� �������. }
   procedure Release; override;
   procedure ClearFields; override;
 protected
 // protected methods
   function DocumentUseFixedFontForPrintAndExportSetting: Boolean;
 end;//_nevFontTool_

{$Else nevFontTool_imp}

// start class _nevFontTool_

function _nevFontTool_.DocumentUseFixedFontForPrintAndExportSetting: Boolean;
//#UC START# *4E568F3C0274_4E72038F00C3_var*
//#UC END# *4E568F3C0274_4E72038F00C3_var*
begin
//#UC START# *4E568F3C0274_4E72038F00C3_impl*
 Result := TevStyleInterface.DocumentUseFixedFontForPrintAndExportSetting;
//#UC END# *4E568F3C0274_4E72038F00C3_impl*
end;//_nevFontTool_.DocumentUseFixedFontForPrintAndExportSetting

function _nevFontTool_.GetObjFont(const aView: InevViewMetrics;
  const Para: InevTag;
  IsSegment: Boolean;
  aFI: TnevFormatInfoPrim;
  CorrectItalic: Boolean): IevResultFont;
//#UC START# *4E5690450392_4E72038F00C3_var*

 procedure CheckOwnParaFont;
 begin//CheckOwnParaFont
  if (f_TRF = nil) then
   f_TRF := TevResultFontHolder.Make
  else
   f_TRF.Clear;
 end;//CheckOwnParaFont

var
 l_OwnFont  : Boolean;
 l_Fixed    : Boolean;
 l_Printing : Boolean;

 procedure GetParaOwnFont;
 begin//GetParaOwnFont
  l_OwnFont := true;
  if IsSegment then
  begin
   if (f_SRF = nil) then
    f_SRF := TevResultFontHolder.Make
   else
    f_SRF.Clear;
   if Para.HasSubAtom(k2_tiStyle) then
    f_SRF.AddStyledTag(Para)
   else
    f_SRF.AddTag(Para);
   Result := f_SRF;
  end//IsSegment
  else
  begin
   CheckOwnParaFont;
   f_TRF.AddStyledTag(Para);
   Result := f_TRF;
  end;//IsSegment
 end;//GetParaOwnFont

 procedure ApplyZoom;

  procedure ApplySize(aSize : Integer);
  begin//ApplySize
   aSize := Max(6, aSize);
   if (aSize > 4) then
   begin
    if not l_OwnFont then
    begin
     if IsSegment then
      Assert(false)
     else
     begin
      l_OwnFont := true;
      CheckOwnParaFont;
      f_TRF.AddFont(Result);
      Result := f_TRF;
      ParaFont := Result;
     end;//IsSegment
    end;//not l_OwnFont
    Result.SetItem(k2_tiSize, aSize);
   end;//aSize > 4
  end;//ApplySize

  procedure ApplyPrintFontSize;

   procedure DoApply;
   begin//DoApply
    if (TevIndentType(Para.IntA[k2_tiJustification]) = ev_itPreformatted) then
     ApplySize(Para.IntA[k2_tiPrintFontSize])
    else
    if l_Fixed then
    begin
     if Para.HasSubAtom(k2_tiFont) then
     begin
      // - ������� ����� ���������, ���� ���������� �������� ��� f_FrameText
      Assert(l_OwnFont);
      Result.SetItem(k2_tiSize, TevDefaultStylesFontSizes.Instance.FontSizeForTag(Para));
     end;//Para.HasSubAtom(k2_tiFont)
    end;//l_Fixed
   end;//DoApply

  begin//ApplyPrintFontSize
   if IsSegment then
   begin
    if l_Fixed then
     if Para.HasSubAtom(k2_tiFont) then
     begin
      // - ������� ����� ��������, ���� ���������� �������� ��� ��������� �� ������������
      Result.SetItem(k2_tiSize, TevDefaultStylesFontSizes.Instance.FontSizeForTag(Para));
     end;//Para.HasSubAtom(k2_tiFont)
    //Assert(false);
   end//IsSegment
   else
   begin
    if l_Printing then
     DoApply;
   end;//not IsSegment
  end;//ApplyPrintFontSize

 var
  l_Zoom      : Integer;
  l_Table     : InevTag;
  l_FontSize  : Integer;
  l_SizePtr   : PInteger;
 begin//ApplyZoom
  if (aFI = nil) then
  begin
   ApplyPrintFontSize;
   Exit;
  end;//aFI = nil
  if (f_Zoom <> 0) then
   if not IsSegment then
    if (f_ZoomPara = nil) OR not f_ZoomPara.IsSame(aFI.Obj) then
    // - ���������� ���, �.�. ��� ������ ��������
     f_Zoom := 0;
  if (f_Zoom > 0) then
   l_Zoom := f_Zoom
  else
  if (f_Zoom < 0) then
  begin
   ApplyPrintFontSize;
   Exit;
  end//f_Zoom < 0
  else
  begin
   f_Zoom := -1;
   if not IsSegment then
   begin
    //CheckParaX(Para);
    if not evInPara(aFI, k2_idTable, l_Table) then
    begin
     ApplyPrintFontSize;
     Exit;
    end;//not evInPara(Para, k2_idTable, l_Table)
   end//not IsSegment
   else
   begin
    Assert(f_ZoomPara <> nil);
    if not evInPara(aFI, k2_idTable, l_Table) then
     Exit;
   end;//not IsSegment

   if (aFI = nil) then
    l_Zoom := {100}l_Table.IntA[k2_tiZoom]
    // - ��� �� ����, ��� ��� ������
   else
    l_Zoom := aFI.Zoom;
   if (l_Zoom <= 0) OR (l_Zoom >= 100) then
   begin
    Exit;
   end;//l_Zoom <= 0..
   f_Zoom := l_Zoom;
   f_ZoomPara := aFI.Obj;
  end;//f_Zoom > 0

  l_SizePtr := Result.GetItem(k2_tiSize);
  if (l_SizePtr = nil) then
   l_FontSize := l3MulDiv(def_FontSize, l_Zoom, 100)
  else
  if (l_SizePtr^ = k2_TransparentValue) then
  begin
   Assert(not IsSegment);
   Exit;
  end//l_SizePtr^ = k2_tiTransparentValue
  else
  if l_Fixed AND Para.HasSubAtom(k2_tiFont) then
   l_FontSize := l3MulDiv(TevDefaultStylesFontSizes.Instance.FontSizeForTag(Para), l_Zoom, 100)
  else
   l_FontSize := l3MulDiv(l_SizePtr^, l_Zoom, 100);
  ApplySize(l_FontSize);
 end;//ApplyZoom

var
 l_NeedApplyZoom : Boolean;
//#UC END# *4E5690450392_4E72038F00C3_var*
begin
//#UC START# *4E5690450392_4E72038F00C3_impl*
 l_OwnFont := false;
 try
  l_Fixed := false;
  l_Printing :=
       ((aView <> nil) AND
        (aView.InfoCanvas.Printing
        {$IFNDef Nemesis}OR not aView.IsWebStyle{$EndIf})
       );
  if Self.DocumentUseFixedFontForPrintAndExportSetting then
   if l_Printing then
    l_Fixed := true;
  if Para.IsValid then
  begin
   if Para.HasSubAtom(k2_tiFont) then
    GetParaOwnFont
   else
   begin
    if not TevStandardStyles.Instance.GetStandardStyleFont(Para, l_Fixed, Result) then
     GetParaOwnFont;
   end;//Para.HasSubAtom(k2_tiFont)
  end//Para.IsValid
  else
  begin
   l_OwnFont := true;
   if IsSegment then
    Result := nil
   else
   begin
    CheckOwnParaFont;
    Result := f_TRF;
   end;//IsSegment
  end;//Para.IsValid
 finally
  l_NeedApplyZoom := true;
  if IsSegment then
  begin
   l_OwnFont := true;
   if (SRF = nil) then
    SRF := TevResultFontHolder.Make
   else
    SRF.Clear;
   with SRF do
   begin
    if (Result <> nil) then
     AddFont(Result);
    if (f_Zoom > 0) then
    begin
     if IsTransparent(k2_tiSize) then
      l_NeedApplyZoom := false;
      // http://mdp.garant.ru/pages/viewpage.action?pageId=213254777&focusedCommentId=213254791#comment-213254791
    end;//f_Zoom > 0
    if (ParaFont <> nil) then
     AddFont(ParaFont);
   end;//with SRF
   Result := SRF;
  end//IsSegment
  else
   ParaFont := Result;
  if l_NeedApplyZoom then
   ApplyZoom; 
  Result.AsFont(CorrectItalic, l_OwnFont OR IsSegment);
 end;//try..finally
//#UC END# *4E5690450392_4E72038F00C3_impl*
end;//_nevFontTool_.GetObjFont

function _nevFontTool_.GetObjRealFont(const aView: InevViewMetrics;
  const Para: InevTag;
  IsSegment: Boolean;
  aFI: TnevFormatInfoPrim;
  CorrectItalic: Boolean = true): InevFont;
//#UC START# *476BFAA60313_4E72038F00C3_var*
//#UC END# *476BFAA60313_4E72038F00C3_var*
begin
//#UC START# *476BFAA60313_4E72038F00C3_impl*
 Result := GetObjFont(aView, Para, IsSegment, aFI, CorrectItalic).AsFont(CorrectItalic, false);
//#UC END# *476BFAA60313_4E72038F00C3_impl*
end;//_nevFontTool_.GetObjRealFont

function _nevFontTool_.GetObjIFont(const aView: InevViewMetrics;
  const Para: InevTag;
  IsSegment: Boolean;
  aParentFI: TnevFormatInfoPrim;
  CorrectItalic: Boolean = true): InevFont;
//#UC START# *486CB85C01FD_4E72038F00C3_var*
var
 l_Map : TnevFormatInfoPrim;
 l_Obj : InevObject;
//#UC END# *486CB85C01FD_4E72038F00C3_var*
begin
//#UC START# *486CB85C01FD_4E72038F00C3_impl*
 Result := GetObjRealFont(aView, Para, IsSegment, aParentFI, CorrectItalic);
 if IsSegment AND Para.InheritsFrom(k2_idObjectSegment) then
 begin
  if not Para.Child[0].QT(InevObject, l_Obj) then
   Assert(false);
  Assert(aParentFI <> nil);
  l_Map := aParentFI.InfoForChild(l_Obj);
  Result := TevGlyphFont.Make(l_Obj.InheritsFrom(k2_idBitmapPara),
                              l_Map.Width,
                              l_Map.Height,
                              Result);
 end;//IsSegment AND Para.InheritsFrom(k2_idObjectSegment)
//#UC END# *486CB85C01FD_4E72038F00C3_impl*
end;//_nevFontTool_.GetObjIFont

procedure _nevFontTool_.Cleanup;
//#UC START# *479731C50290_4E72038F00C3_var*
//#UC END# *479731C50290_4E72038F00C3_var*
begin
//#UC START# *479731C50290_4E72038F00C3_impl*
 f_Zoom := 0;
 f_ZoomPara := nil;
 inherited;
//#UC END# *479731C50290_4E72038F00C3_impl*
end;//_nevFontTool_.Cleanup

procedure _nevFontTool_.Release;
//#UC START# *479F2AFB0397_4E72038F00C3_var*
//#UC END# *479F2AFB0397_4E72038F00C3_var*
begin
//#UC START# *479F2AFB0397_4E72038F00C3_impl*
 inherited;
 if (f_TRF <> nil) then
 begin
  f_TRF.Clear;
  f_TRF := nil;
 end;//f_TRF <> nil
 if (f_SRF <> nil) then
 begin
  f_SRF.Clear;
  f_SRF := nil;
 end;//f_SRF <> nil
 if (SRF <> nil) then
 begin
  SRF.Clear;
  SRF := nil;
 end;//SRF <> nil
 ParaFont := nil;
//#UC END# *479F2AFB0397_4E72038F00C3_impl*
end;//_nevFontTool_.Release

procedure _nevFontTool_.ClearFields;
 {-}
begin
 f_TRF := nil;
 f_ZoomPara := nil;
 f_SRF := nil;
 SRF := nil;
 ParaFont := nil;
 inherited;
end;//_nevFontTool_.ClearFields

{$EndIf nevFontTool_imp}
