unit nscCustomChatMemoDocumentPartGenerator;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Nemesis"
// �����: ����� �.�.
// ������: "w:/common/components/gui/Garant/Nemesis/nscCustomChatMemoDocumentPartGenerator.pas"
// �����: 19.08.2009 12:10
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi For F1::Nemesis::Memos::TnscCustomChatMemoDocumentPartGenerator
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\Nemesis\nscDefine.inc}

interface

{$If defined(Nemesis)}
uses
  nevBase,
  evDocumentPartGenerator,
  l3StringIDEx,
  k2Types,
  k2DocumentGenerator
  ;
{$IfEnd} //Nemesis

{$If defined(Nemesis)}
type
 TnscCustomChatMemoDocumentPartGenerator = class(TevDocumentPartGenerator)
 private
 // private fields
   f_WasHandle : Boolean;
   f_WasInheritedParaAdd : Boolean;
    {* ���� �������������� ���������� ���������}
   f_Doc : InevTag;
   f_ExternalHandle : Integer;
   f_NumberedPara : InevTag;
 protected
 // overridden protected methods
   procedure DoAddAtom(const Atom: Tk2StackAtom;
    Prop: Integer;
    TK: Tk2TypeKind;
    const Source); override;
   function AddChild(var aChild: Tk2StackAtom): Integer; override;
   procedure FinishInsertion; override;
 end;//TnscCustomChatMemoDocumentPartGenerator
{$IfEnd} //Nemesis

implementation

{$If defined(Nemesis)}
uses
  k2Tags,
  Document_Const,
  Para_Const,
  evCursorTools,
  evOp,
  evParaTools,
  TextPara_Const,
  l3Defaults,
  k2Base,
  HyperLink_Const,
  evdTypes,
  LeafPara_Const,
  l3Types,
  l3MessageID
  ;
{$IfEnd} //Nemesis

{$If defined(Nemesis)}

var
   { ������������ ������ Local }
  str_ChatPastePrefix : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'ChatPastePrefix'; rValue : '�� ��������� ������:');
   { '�� ��������� ������:' }

// start class TnscCustomChatMemoDocumentPartGenerator

procedure TnscCustomChatMemoDocumentPartGenerator.DoAddAtom(const Atom: Tk2StackAtom;
  Prop: Integer;
  TK: Tk2TypeKind;
  const Source);
//#UC START# *4836B3DB01C9_4A8BB357000F_var*
//#UC END# *4836B3DB01C9_4A8BB357000F_var*
begin
//#UC START# *4836B3DB01C9_4A8BB357000F_impl*
 if not (ev_lfInternal in Flags) then
  if not f_WasHandle then
  begin
   if (Prop = k2_tiExternalHandle) then
    if Atom.InheritsFrom(k2_idDocument) then
    begin
     f_Doc := Atom.Box;
     f_WasHandle := true;
     Case TK of
      k2_tkInteger:
       f_ExternalHandle := Integer(Source);
      else
       Assert(false);
     end;//Case TK
    end;//Atom.InheritsFrom(k2_idDocument)
  end;//not f_WasHandle
  if (Prop = k2_tiHandle) then
   if (f_NumberedPara = nil) then
    if Atom.InheritsFrom(k2_idLeafPara) then
     f_NumberedPara := Atom.Box;
 inherited;
//#UC END# *4836B3DB01C9_4A8BB357000F_impl*
end;//TnscCustomChatMemoDocumentPartGenerator.DoAddAtom

function TnscCustomChatMemoDocumentPartGenerator.AddChild(var aChild: Tk2StackAtom): Integer;
//#UC START# *4836B3FC032A_4A8BB357000F_var*
//#UC END# *4836B3FC032A_4A8BB357000F_var*
begin
//#UC START# *4836B3FC032A_4A8BB357000F_impl*
 Result := -1;
 if not (ev_lfInternal in Flags) then
 begin
  if f_WasHandle then
  begin
   if aChild.InheritsFrom(k2_idDocument) AND
      ((aChild.Parent = nil) OR not aChild.Parent.InheritsFrom(k2_idPara)) then
    // - ������� ����� ��������������� ��������
   begin
(*    f_WasHandle := false;
    f_WasInheritedParaAdd := false;*)
    Result := inherited AddChild(aChild);
    Exit;
   end;//aChild.InheritsFrom(k2_idDocument)
  end;//f_WasHandle
  if aChild.InheritsFrom(k2_idHyperlink) then
  begin
   if (aChild.Box.ChildrenCount <= 0) then
    // - ������� ������ ��� �������
    Exit;
   if (aChild.Box.Child[0].IntA[k2_tiType] = CI_ExternalOperation) then
    // - ������� ������, ������� �� ����� �� ����� ����������
    Exit;
  end;//aChild.InheritsFrom(k2_idHyperlink)
  if f_WasHandle then
  begin
   Assert(not f_WasInheritedParaAdd);
   aChild.Parent.Box.AddChild(aChild.f_Inst, Context);
   Exit;
  end;//f_WasHandle
 end;//not (ev_lfInternal in Flags)
 Result := inherited AddChild(aChild);
 if not f_WasInheritedParaAdd then
  if aChild.InheritsFrom(k2_idPara) then
   f_WasInheritedParaAdd := true;
//#UC END# *4836B3FC032A_4A8BB357000F_impl*
end;//TnscCustomChatMemoDocumentPartGenerator.AddChild

procedure TnscCustomChatMemoDocumentPartGenerator.FinishInsertion;
//#UC START# *48E4B7F403D6_4A8BB357000F_var*
var
 l_Para : InevTag;
 l_Link : InevTag;
 l_Addr : InevTag;
 l_HeaderParaType : Tk2Type;
//#UC END# *48E4B7F403D6_4A8BB357000F_var*
begin
//#UC START# *48E4B7F403D6_4A8BB357000F_impl*
 if f_WasHandle AND (f_Doc <> nil) then
 begin
  EnableUndo;
  try
   f_Doc.IntA[k2_tiBackColor] := $C0F0C0;
   f_Doc.IntA[k2_tiLeftIndent] := 0;
   with f_Doc.cAtom(k2_tiFrame) do
   begin
    with cAtom(k2_tiFrameDown) do
    begin
     IntA[k2_tiSpaceBefore] := def_FrameWidth * 3;
     IntA[k2_tiWidth] := def_FrameWidth * 2;
     IntA[k2_tiSpaceAfter] := def_FrameWidth * 3;
    end;//cAtom(k2_tiFrameDown)
   end;//with f_Doc.cAtom(k2_tiFrame)
   with InsCursor.MostInner do
    if Obj.InheritsFrom(k2_idTextPara) AND not evHasText(Obj^) then
     evDeletePara(Context, ParentPoint, []);
   if (f_ExternalHandle > 0) then
   begin
    // http://mdp.garant.ru/pages/viewpage.action?pageId=429695918
    l_HeaderParaType := Tk2Type(f_Doc.TagType).ArrayProp[k2_tiChildren].DefaultChildType;
    if not l_HeaderParaType.InheritsFrom(k2_idTextPara) then
     l_HeaderParaType := k2_typTextPara;
    l_Para := l_HeaderParaType.MakeTag;
    try
     l_Para.IntA[k2_tiFirstIndent] := 0;
     l_Para.IntA[k2_tiLeftIndent] := 0;
     l_Para.PCharLenA[k2_tiText] := Tl3PCharLen(str_ChatPastePrefix.AsCStr.AsWStr);
     with l_Para.cAtom(k2_tiFrame) do
     begin
      with cAtom(k2_tiFrameDown) do
      begin
       IntA[k2_tiSpaceBefore] := def_FrameWidth * 4;
       IntA[k2_tiWidth] := def_FrameWidth * 2;
       IntA[k2_tiSpaceAfter] := def_FrameWidth * 3;
      end;//cAtom(k2_tiFrameDown)
      l_Link := Tk2TypeTable(l_Para.TagType.TypeTable)[k2_idHyperlink].MakeTag;
      try
       l_Addr := Tk2Type(l_Link.TagType).ArrayProp[k2_tiChildren].DefaultChildType.MakeTag;
       try
        l_Addr.IntA[k2_tiDocID] := f_ExternalHandle;
        if (f_NumberedPara <> nil) then
         l_Addr.IntA[k2_tiSubID] := Integer(Longword(f_NumberedPara.IntA[k2_tiHandle]) or POSITION_TYPE_PARA_ID);
        l_Link.AddChild(l_Addr);
       finally
        l_Addr := nil;
       end;//try..finally
       l_Para.AddChild(l_Link);
      finally
       l_Link := nil;
      end;//try..finally
      f_Doc.InsertChild(0, l_Para);
     end;//l_Para
    finally
     l_Para := nil;
    end;//try..finally
   end;//f_ExternalHandle > 0
   evInsertPara(Context, InsCursor, f_Doc{, true});
   InsCursor.Move(View, ev_ocParaDown, Context);
   f_InsPara := InsCursor.Position;
   pm_SetNeedJoin(false);
  finally
   DisableUndo;
  end;//try..finally
  f_WasInheritedParaAdd := false;
  f_WasHandle := false;
 end;//f_WasHandle
 f_Doc := nil;
 f_NumberedPara := nil;
 inherited;
//#UC END# *48E4B7F403D6_4A8BB357000F_impl*
end;//TnscCustomChatMemoDocumentPartGenerator.FinishInsertion

{$IfEnd} //Nemesis

initialization
{$If defined(Nemesis)}
// ������������� str_ChatPastePrefix
 str_ChatPastePrefix.Init;
{$IfEnd} //Nemesis

end.