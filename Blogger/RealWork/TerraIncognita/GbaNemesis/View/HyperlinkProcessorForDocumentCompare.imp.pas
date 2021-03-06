{$IfNDef HyperlinkProcessorForDocumentCompare_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "View"
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/View/HyperlinkProcessorForDocumentCompare.imp.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<VCMForm::Class>> F1 Core::Base Operations::View::Navigation::HyperlinkProcessorForDocumentCompare
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define HyperlinkProcessorForDocumentCompare_imp}
{$If not defined(Admin) AND not defined(Monitorings)}
 _HyperlinkProcessorForDocumentCompare_ = {abstract form} class(_HyperlinkProcessorForDocumentCompare_Parent_)
 private
 // private methods
   procedure DoGetNonHyperlinkInfo(Sender: TObject;
     const aKeys: TafwCursorState;
     var theInfo: TafwCursorInfo);
     {* ���������� ���������� � ����� ��������� }
 protected
 // overridden protected methods
   procedure GetNonHyperlinkInfo(Sender: TObject;
    const aHotSpot: IevHotSpot;
    const aKeys: TafwCursorState;
    var theInfo: TafwCursorInfo); override;
     {* ���������� ���������� � ������� �� ��� ������� }
 end;//_HyperlinkProcessorForDocumentCompare_
{$IfEnd} //not Admin AND not Monitorings

{$Else HyperlinkProcessorForDocumentCompare_imp}

{$If not defined(Admin) AND not defined(Monitorings)}

// start class _HyperlinkProcessorForDocumentCompare_

procedure _HyperlinkProcessorForDocumentCompare_.DoGetNonHyperlinkInfo(Sender: TObject;
  const aKeys: TafwCursorState;
  var theInfo: TafwCursorInfo);
//#UC START# *4A8912820378_4E9C33A802C8_var*
//#UC END# *4A8912820378_4E9C33A802C8_var*
var
 l_Tag : InevTag;
 l_Point : InevBasePoint;
 l_Pos : Integer;
 l_P : Il3CString;
 l_S : Il3CString;
begin
//#UC START# *4A8912820378_4E9C33A802C8_impl*
 if (Sender As TevCustomEditorWindow).GetPtPoint(aKeys.rPoint, l_Point) then
  with l_Point.MostInner, Obj^ do
   if InheritsFrom(k2_idStyledLeafPara) then
   begin
    l_Tag := evSegments_GetSegmentOnPos(Attr[k2_tiSegments], ev_slDiff, Position, l_Pos);
    if l_Tag.IsValid then
    begin
     with theInfo do
     begin
      //rCursor := ev_csHelp;
      rHint := l3CStr(l_Tag.PCharLenA[k2_tiStyle]);
      l3Split(rHint, '.', l_P, l_S);
      if not l3IsNil(l_S) then
       rHint := l_S;
      if afw.Application.IsInternal then
       rHint := l3Cat(rHint, ' ParaID = ' + IntToStr(IntA[k2_tiHandle]));
     end;//with theInfo
    end//l_Tag.IsValid
    else
    begin
     if afw.Application.IsInternal then
      with theInfo do
       rHint := l3Cat(rHint, ' ParaID = ' + IntToStr(IntA[k2_tiHandle]));
    end;//l_Tag.IsValid
   end;//InheritsFrom(k2_idStyledLeafPara)
//#UC END# *4A8912820378_4E9C33A802C8_impl*
end;//_HyperlinkProcessorForDocumentCompare_.DoGetNonHyperlinkInfo

procedure _HyperlinkProcessorForDocumentCompare_.GetNonHyperlinkInfo(Sender: TObject;
  const aHotSpot: IevHotSpot;
  const aKeys: TafwCursorState;
  var theInfo: TafwCursorInfo);
//#UC START# *4A890E81030B_4E9C33A802C8_var*
//#UC END# *4A890E81030B_4E9C33A802C8_var*
begin
//#UC START# *4A890E81030B_4E9C33A802C8_impl*
 DoGetNonHyperlinkInfo(Sender, aKeys, theInfo);
//#UC END# *4A890E81030B_4E9C33A802C8_impl*
end;//_HyperlinkProcessorForDocumentCompare_.GetNonHyperlinkInfo

{$IfEnd} //not Admin AND not Monitorings

{$EndIf HyperlinkProcessorForDocumentCompare_imp}
