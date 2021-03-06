unit nsF1DocumentContainer;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "F1DocumentProcessing"
// �����: ����� �.�.
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/F1DocumentProcessing/nsF1DocumentContainer.pas"
// �����: 17.08.2010 18:21
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> F1 Core::Common::F1DocumentProcessing::F1DocumentContainers::TnsF1DocumentContainer
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If not defined(Admin) AND not defined(Monitorings)}
uses
  nevBase,
  l3TreeInterfaces,
  nsF1DocumentContainerPrim,
  DocumentUnit,
  nevTools,
  DocumentInterfaces,
  F1TagDataProviderInterface,
  afwInterfaces,
  l3Interfaces,
  k2Base,
  Classes,
  nevPrintableDocumentContainer,
  l3IID
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}
type
 _nsDocumentContainer_Parent_ = TnsF1DocumentContainerPrim;
 {$Include ..\F1DocumentProcessing\nsDocumentContainer.imp.pas}
 TnsF1DocumentContainer = class(_nsDocumentContainer_)
 private
 // private fields
   f_ContentsTree : Il3SimpleTree;
    {* ������ ����������}
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* ������� ������� ����� �������. }
   function GetDocument: InevTag; override;
   function GetContentsTree: InevSimpleTree; override;
   procedure ClearFields; override;
 protected
 // protected methods
   procedure TransformMadeDocument(var theDocument: InevTag); virtual;
     {* �������������� �������� � ��� ������������, �������� ��� � ��� ��� �������� ������� }
 end;//TnsF1DocumentContainer
{$IfEnd} //not Admin AND not Monitorings

implementation

{$If not defined(Admin) AND not defined(Monitorings)}
uses
  nsF1DocumentTagNode,
  nsMedicContentsTree,
  nsContentsTree,
  DynamicTreeUnit,
  nsManagers,
  BaseTypesUnit,
  ComObj,
  evTypes,
  l3Types,
  evdNativeReader,
  evdVer,
  SysUtils,
  nsIDocumentDataObject,
  nsDocumentPreview,
  nsHAFPainter,
  LoggingInterfaces,
  nsDocumentPrintEvent,
  deDocInfo,
  DataAdapter,
  evdTypes,
  nsTypes,
  LeafPara_Const,
  k2Tags,
  nsTagString,
  evParaTools,
  afwFacade
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}

type _Instance_R_ = TnsF1DocumentContainer;

{$Include ..\F1DocumentProcessing\nsDocumentContainer.imp.pas}

// start class TnsF1DocumentContainer

procedure TnsF1DocumentContainer.TransformMadeDocument(var theDocument: InevTag);
//#UC START# *500ED7750045_4C6A9AD101B4_var*
//#UC END# *500ED7750045_4C6A9AD101B4_var*
begin
//#UC START# *500ED7750045_4C6A9AD101B4_impl*
 // - ������ �� ������, ��������� �������� ��� ����
//#UC END# *500ED7750045_4C6A9AD101B4_impl*
end;//TnsF1DocumentContainer.TransformMadeDocument

procedure TnsF1DocumentContainer.Cleanup;
//#UC START# *479731C50290_4C6A9AD101B4_var*
//#UC END# *479731C50290_4C6A9AD101B4_var*
begin
//#UC START# *479731C50290_4C6A9AD101B4_impl*
 if (f_ContentsTree <> nil) then
  f_ContentsTree.Unsubscribe(Il3ItemNotifyRecipient(Self));
 f_ContentsTree := nil;
 inherited;
//#UC END# *479731C50290_4C6A9AD101B4_impl*
end;//TnsF1DocumentContainer.Cleanup

function TnsF1DocumentContainer.GetDocument: InevTag;
//#UC START# *47F27DA80172_4C6A9AD101B4_var*

 procedure lp_FinishProfile;
 begin
  {$IfDef vcmUseProfilers}
  ProfilersManager.Document.DocumentReceived;
  {$EndIf vcmUseProfilers}
 end;

 procedure GetDocumentStub;
 var
  l_S : IStream;
  l_Res : Int64;
  l_R : TevdNativeReader;
 begin//GetDocumentStub
  f_DocumentInfo.Doc.GetEVDStream(l_S);
  Assert(l_S <> nil);
  try
   OleCheck(l_S.Seek(0, STREAM_SEEK_SET, l_Res));
   l_R := TevdNativeReader.Create;
   try
    l_R.ForceBinary := true;
    l_R.CurrentVersion := evNonPackedVer;
    l_R.Filer.COMStream := l_S;
    try
     //Self.WriteTag(nil, cf_EverestBin, l_S, nil);
     Self.WriteTagEx(nil, l_R);
    finally
     l_R.Filer.COMStream := nil;
    end;//try..finally
    Assert(inherited GetDocument <> nil);
   finally
    FreeAndNil(l_R);
   end;//try..finally
  finally
   l_S := nil;
  end;//try..finally
 end;//GetDocumentStub

var
 l_P : IDocumentTextProvider;
 l_Node : INodeBase;
 l_TmpContents : Il3SimpleTree;
 l_Tree : InsContentsTree;
//#UC END# *47F27DA80172_4C6A9AD101B4_var*
begin
//#UC START# *47F27DA80172_4C6A9AD101B4_impl*
 Result := inherited GetDocument;
 if (Result = nil) then
 begin
  try
   if (f_DocumentInfo.Doc = nil) then
    Exit;
   f_DocumentInfo.Doc.GetTextProvider(false, l_P);
   Assert(l_P <> nil);
   Result := TnsF1DocumentTagNode.Make(l_P);
  except
   on ECannotFindData do
   // - ��������� ����, ���� �������� ��������
   begin
    GetDocumentStub;
    Result := inherited GetDocument;
    Exit;
   end;//on ECannotFindData
  end;//try..except
  // ���� ������ ����������
  try
   f_DocumentInfo.Doc.GetContentsRoot(l_Node);
  except
   on ECannotFindData do
    l_Node := nil;
  end;//try..except 
  try
   if (l_Node = nil) then
    l_TmpContents := nil
   else  
   if (f_DocumentInfo.Doc.GetDocType = DT_MEDICAL_DOCUMENT) then
    l_TmpContents := TnsMedicContentsTree.Make(l_Node, Result)
   else
    l_TmpContents := TnsContentsTree.Make(l_Node, Result);
   // ���� ������ ���������� ��� ����
   // �������� ��� ������������� ��������
   // ��� ���, ����� ����� ������� ���������� 
   // DataReset � RegetRootNode (cq24170)
   if Assigned(l_TmpContents) and
      Supports(f_ContentsTree, InsContentsTree, l_Tree) and
      l_Tree.NeedResetRoot then
    l_Tree.ResetRoot(Result, l_TmpContents.RootNode)
   else
   begin
    if Assigned(f_ContentsTree) then
     f_ContentsTree.UnSubscribe(Il3ItemNotifyRecipient(Self));
    f_ContentsTree := l_TmpContents;
    if Assigned(f_ContentsTree) then
     f_ContentsTree.Subscribe(Il3ItemNotifyRecipient(Self));
   end;
   {$IfDef vcmUseProfilers}
   if not Assigned(f_ContentsTree) then
    ProfilersManager.Document.ContentsTreeOpened;
     // - ������ ���������� ����������� ��� �� ��������� �������� �� ����������
     //   ����������;
   {$EndIf vcmUseProfilers}
  finally
   l_Node := nil;
  end;//try..finally
  // - ��� ��������� �������� ����������
  TransformMadeDocument(Result);
  Document := Result;
  // - ��� ���������� ����� �������� ����������
 end//Result = nil
 else
 begin
  {$IfDef vcmUseProfilers}
  lp_FinishProfile;
  ProfilersManager.Document.ContentsTreeOpened;
  {$EndIf vcmUseProfilers}
 end;//(Result = nil)
//#UC END# *47F27DA80172_4C6A9AD101B4_impl*
end;//TnsF1DocumentContainer.GetDocument

function TnsF1DocumentContainer.GetContentsTree: InevSimpleTree;
//#UC START# *47F2802003C4_4C6A9AD101B4_var*
//#UC END# *47F2802003C4_4C6A9AD101B4_var*
begin
//#UC START# *47F2802003C4_4C6A9AD101B4_impl*
 Result := f_ContentsTree;
//#UC END# *47F2802003C4_4C6A9AD101B4_impl*
end;//TnsF1DocumentContainer.GetContentsTree

procedure TnsF1DocumentContainer.ClearFields;
 {-}
begin
 f_ContentsTree := nil;
 inherited;
end;//TnsF1DocumentContainer.ClearFields

{$IfEnd} //not Admin AND not Monitorings

end.