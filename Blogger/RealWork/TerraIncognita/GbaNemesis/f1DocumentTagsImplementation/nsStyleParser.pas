unit nsStyleParser;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "f1DocumentTagsImplementation"
// �����: ����� �.�.
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/f1DocumentTagsImplementation/nsStyleParser.pas"
// �����: 25.05.2011 21:33
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> F1 ������� ����������� ���������� �������::LegalDomain::f1DocumentTagsImplementation::TagDataProviders::TnsStyleParser
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

uses
  l3Interfaces,
  nevBase,
  k2DocumentGenerator,
  evdNativeReader,
  l3CProtoObject,
  k2InPlaceGenerator
  ;

type
 TnsStyleParserContext = class(Tl3CProtoObject)
 private
 // private fields
   f_Processor : InevProcessor;
 private
 // private methods
   function DoFinishAtom(G: Tk2DocumentGenerator;
     var Atom: Tk2StackAtom): Boolean;
 protected
 // overridden protected methods
   procedure ClearFields; override;
 public
 // public methods
   constructor Create(const aProcessor: InevProcessor); reintroduce;
 end;//TnsStyleParserContext

 TnsStyleParser = class
 public
 // public methods
   class procedure Parse(const aStyle: IStream;
     const aTag: InevTag);
 end;//TnsStyleParser

implementation

uses
  SysUtils,
  l3Base,
  evdVer,
  k2Const,
  k2Base,
  evNestedCommentsEliminator,
  k2TagGen,
  CommentPara_Const,
  StyledLeafPara_Const,
  evTextStyle_Const,
  k2Tags
  {$If not defined(NoVCM)}
  ,
  StdRes
  {$IfEnd} //not NoVCM
  ,
  F1TagDataProviderInterface,
  Para_Const,
  nevTools
  ;

var
   g_Gen : Tk2InPlaceGenerator = nil;
var
   g_Reader : TevdNativeReader = nil;

// start class TnsStyleParser

class procedure TnsStyleParser.Parse(const aStyle: IStream;
  const aTag: InevTag);
//#UC START# *4DDD3DBD02A1_4DDD3D520070_var*
var
 l_Reader : TevdNativeReader;
 l_Type   : Integer;
 l_Gen    : Tk2InPlaceGenerator;
 l_T      : Tk2Type;
 l_G      : Tk2TagGenerator;
 l_O      : InevObjectPrim;
 l_C      : If1EditionDocumentContainer;
 l_IsComment : Boolean;
 l_P         : InevPara;
 l_Cont      : InevDocumentContainer;
 l_Context : TnsStyleParserContext;
//#UC END# *4DDD3DBD02A1_4DDD3D520070_var*
begin
//#UC START# *4DDD3DBD02A1_4DDD3D520070_impl*
 l_T := Tk2Type(aTag.TagType);
 Assert(l_T <> nil);
 l_Type := l_T.ID;
 //l_Type := f_TagDataProvider.GetType;
 if (l_Type <> k2_idEmpty) then
 begin
  if (g_Reader = nil) OR (g_Reader.RefCount > 1) then
  begin
   l_Reader := TevdNativeReader.Create;
   FreeAndNil(g_Gen);
  end//g_Reader = nil
  else
  begin
   l_Reader := g_Reader.Use;
   FreeAndNil(g_Reader);
  end;//g_Reader = nil
  try
   if (g_Gen = nil) then
    l_Gen := Tk2InPlaceGenerator.Make(l_T, aTag)
   else
   begin
    l_Gen := g_Gen.Use;
    FreeAndNil(g_Gen);
    l_Gen.Root := aTag;
    l_Gen.TagType := l_T;
   end;//g_Gen = nil
   try
    l_G := l_Gen.Use;
    try
     l_IsComment := aTag.InheritsFrom(k2_idCommentPara);
     if l_IsComment then
      TevNestedCommentsEliminator.SetTo(l_G);
     l_Reader.Generator := l_G;
     l3Set(g_Gen, l_Gen);
    finally
     FreeAndNil(l_G);
    end;//try..finally
    l_Context := nil;
    try
     if l_IsComment then
     begin
      if not aTag.QT(InevPara, l_P) then
       Assert(false);
      l_Cont := l_P.DocumentContainer;
      if (l_Cont <> nil) then
      // http://mdp.garant.ru/pages/viewpage.action?pageId=307791168
      begin
       Assert(l_Cont <> nil);
       l_Context := TnsStyleParserContext.Create(l_Cont.Processor);
       l_Gen.OnFinishAtom := l_Context.DoFinishAtom;
 (*      l_Gen.Context := l_Cont.Processor.StartOp;
       l_Gen.Context.DeleteMapped := false;
       l_Gen.Context.InIOProcess := true;*)
       // http://mdp.garant.ru/pages/viewpage.action?pageId=296096620
      end;//l_Cont <> nil
     end;//l_IsComment
     try
      l_Reader.Filer.NeedProcessMessages := false;
      l_Reader.Filer.Indicator.NeedProgressProc := false;
      l_Reader.Filer.COMStream := aStyle;
      try
       l_Reader.ForceBinary := true;
       l_Reader.CurrentVersion := evNonPackedVer;
       try
        l_Reader.Start;
        try
         l_Reader.StartChild(l_Type);
         try
          l_Reader.Execute;
         finally
          l_Reader.Finish;
         end;//try..finally
        finally
         l_Reader.Finish;
        end;//try..finally
       finally
        l_Reader.CurrentVersion := evFormatCurVersionI;
       end;//try..finally
      finally
       l_Reader.Filer.COMStream := nil;
      end;//try..finally
     finally
      l_Gen.OnFinishAtom := nil;
      l_Gen.Context := nil;
     end;//try..finally
    finally
     FreeAndNil(l_Context);
    end;//try..finally
   finally
    FreeAndNil(l_Gen);
   end;//try..finally
   l3Set(g_Reader, l_Reader);
  finally
   FreeAndNil(l_Reader);
  end;//try..finally
  if aTag.InheritsFrom(k2_idStyledLeafPara) then
   if (aTag.IntA[k2_tiStyle] = ev_saChangesInfo) then
   begin
    if not aTag.QT(InevObjectPrim, l_O) then
     Assert(false);
    if Supports(l_O.HolderPrim, If1EditionDocumentContainer, l_C) then
     try
      aTag.BoolA[k2_tiCollapsed] := l_C.CollapsedTagDefaultValueForPara(l_O);
     finally
      l_C := nil;
     end//try..finally
    else
     aTag.BoolA[k2_tiCollapsed] := not TdmStdRes.DocumentShowChangesInfoSetting;
   end;//aTag.IntA[k2_tiStyle] = ev_saChangesInfo
 end;//l_Type <> k2_idEmpty
//#UC END# *4DDD3DBD02A1_4DDD3D520070_impl*
end;//TnsStyleParser.Parse
// start class TnsStyleParserContext

function TnsStyleParserContext.DoFinishAtom(G: Tk2DocumentGenerator;
  var Atom: Tk2StackAtom): Boolean;
//#UC START# *4EA97C6C021C_4EAA9EA101C9_var*
//#UC END# *4EA97C6C021C_4EAA9EA101C9_var*
begin
//#UC START# *4EA97C6C021C_4EAA9EA101C9_impl*
 // http://mdp.garant.ru/pages/viewpage.action?pageId=278135821
 // http://mdp.garant.ru/pages/viewpage.action?pageId=278135821&focusedCommentId=296093753#comment-296093753
 Result := true;
 if Atom.Box.InheritsFrom(k2_idPara) then
 begin
  if (Atom.Parent = nil) then
  begin
   Atom.Box.InheritsFrom(k2_idCommentPara);
   f_Processor.NotifyCompleted(Atom.Box.Owner, Atom.Box);
  end//Atom.Parent = nil
  else
   f_Processor.NotifyCompleted(Atom.Parent^.Box, Atom.Box);
 end;//Atom.Box.InheritsFrom(k2_idPara)
//#UC END# *4EA97C6C021C_4EAA9EA101C9_impl*
end;//TnsStyleParserContext.DoFinishAtom

constructor TnsStyleParserContext.Create(const aProcessor: InevProcessor);
//#UC START# *4EAA9F0A03D5_4EAA9EA101C9_var*
//#UC END# *4EAA9F0A03D5_4EAA9EA101C9_var*
begin
//#UC START# *4EAA9F0A03D5_4EAA9EA101C9_impl*
 Assert(aProcessor <> nil);
 inherited Create;
 f_Processor := aProcessor;
//#UC END# *4EAA9F0A03D5_4EAA9EA101C9_impl*
end;//TnsStyleParserContext.Create

procedure TnsStyleParserContext.ClearFields;
 {-}
begin
 f_Processor := nil;
 inherited;
end;//TnsStyleParserContext.ClearFields

initialization
//#UC START# *4C6E5E6E025B*
//#UC END# *4C6E5E6E025B*

finalization
//#UC START# *4C6E5E780305*
 FreeAndNil(g_Reader);
 FreeAndNil(g_Gen);
//#UC END# *4C6E5E780305*

end.