unit evdHeaderHyperlinkAdder;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest"
// �����: ����� �.�.
// ������: "w:/common/components/gui/Garant/Everest/evdHeaderHyperlinkAdder.pas"
// �����: 30.11.2010 17:51
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi::Everest::Generators::TevdHeaderHyperlinkAdder
//
// ������, ��������������� ������ �� ��������� ���������
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\Everest\evDefine.inc}

interface

uses
  nevBase,
  evdLeafParaFilter,
  k2Interfaces,
  k2Types
  ;

type
 TevdHeaderHyperlinkAdder = class(TevdLeafParaFilter)
  {* ������, ��������������� ������ �� ��������� ��������� }
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* ������� ������� ����� �������. }
   procedure DoWritePara(const aLeaf: Ik2Tag); override;
     {* ������ ����������� ������ � ���������. ��������� ������� ��������� � ���������� ������ }
   procedure DoAddAtomEx(AtomIndex: Integer;
    const Value: Tk2Variant); override;
 protected
 // protected fields
   f_DocID : Integer;
    {* ������������� ���������}
   f_WasSomeLink : Boolean;
    {* ���� �� ���� ���� �������������� ������}
 protected
 // protected methods
   procedure OutBlockNames(const aLeaf: InevTag); virtual;
     {* ������� ����� ������, � ������� ������ ������ �������� }
 end;//TevdHeaderHyperlinkAdder

implementation

uses
  SegmentsLayer_Const,
  PageBreak_Const,
  Address_Const,
  HyperLink_Const,
  k2Tags,
  Document_Const,
  DecorTextPara_Const,
  evdTypes
  ;

// start class TevdHeaderHyperlinkAdder

procedure TevdHeaderHyperlinkAdder.OutBlockNames(const aLeaf: InevTag);
//#UC START# *4CF513300102_4CF50F7D0203_var*
var
 l_HL : InevTag;
 l_Add : InevTag;
 l_Len : Integer;
//#UC END# *4CF513300102_4CF50F7D0203_var*
begin
//#UC START# *4CF513300102_4CF50F7D0203_impl*
 if (f_DocID <> 0) AND not f_WasSomeLink AND (aLeaf <> nil) then
 begin
  if not aLeaf.InheritsFrom(k2_idDecorTextPara) then
  begin
   l_Len := aLeaf.PCharLenA[k2_tiText].SLen;
   if (l_Len > 0) then
   begin
    f_WasSomeLink := true;
    l_HL := k2_typHyperLink.MakeTag;
    try
     l_HL.IntA[k2_tiStart] := 1;
     l_HL.IntA[k2_tiFinish] := l_Len;
     l_Add := k2_typAddress.MakeTag;
     try
      l_Add.IntA[k2_tiDocID] := f_DocID;
      l_Add.IntA[k2_tiType] := CI_REF;
      l_HL.AddChild(l_Add);
     finally
      l_Add := nil;
     end;//try..finally
     aLeaf.cAtomEx([k2_tiSegments,
                    k2_tiChildren, k2_tiHandle, ev_slHyperlinks], nil).AddChild(l_HL);
    finally
     l_HL := nil;
    end;//try..finally
   end;//l_Len > 0
  end;//not aLeaf.InheritsFrom(k2_idDecorTextPara)
 end;//not f_WasSomeLink
//#UC END# *4CF513300102_4CF50F7D0203_impl*
end;//TevdHeaderHyperlinkAdder.OutBlockNames

procedure TevdHeaderHyperlinkAdder.Cleanup;
//#UC START# *479731C50290_4CF50F7D0203_var*
//#UC END# *479731C50290_4CF50F7D0203_var*
begin
//#UC START# *479731C50290_4CF50F7D0203_impl*
 f_DocID := 0;
 f_WasSomeLink := false;
 inherited;
//#UC END# *479731C50290_4CF50F7D0203_impl*
end;//TevdHeaderHyperlinkAdder.Cleanup

procedure TevdHeaderHyperlinkAdder.DoWritePara(const aLeaf: Ik2Tag);
//#UC START# *49E4883E0176_4CF50F7D0203_var*
var
 l_Break : Boolean;
//#UC END# *49E4883E0176_4CF50F7D0203_var*
begin
//#UC START# *49E4883E0176_4CF50F7D0203_impl*
 l_Break := aLeaf.InheritsFrom(k2_idPageBreak);
 if not l_Break then
  OutBlockNames(aLeaf);
 inherited;
 if l_Break then
  OutBlockNames(aLeaf);
//#UC END# *49E4883E0176_4CF50F7D0203_impl*
end;//TevdHeaderHyperlinkAdder.DoWritePara

procedure TevdHeaderHyperlinkAdder.DoAddAtomEx(AtomIndex: Integer;
  const Value: Tk2Variant);
//#UC START# *4A2D1634025B_4CF50F7D0203_var*
//#UC END# *4A2D1634025B_4CF50F7D0203_var*
begin
//#UC START# *4A2D1634025B_4CF50F7D0203_impl*
 if (AtomIndex = k2_tiExternalHandle) AND
    CurrentType.InheritsFrom(k2_idDocument) then
  f_DocID := VariantAsInteger(AtomIndex, Value);
 inherited;
//#UC END# *4A2D1634025B_4CF50F7D0203_impl*
end;//TevdHeaderHyperlinkAdder.DoAddAtomEx

end.