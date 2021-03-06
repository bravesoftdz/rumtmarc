unit dsMedicFirmList;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Medic"
// �����: �������� �.�.
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/Medic/dsMedicFirmList.pas"
// �����: 2008/03/31 10:23:14
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<ViewAreaControllerImp::Class>> F1 ���������� ��������::Inpharm::Medic::Medic::TdsMedicFirmList
//
// ������ ����-��������������
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
  DocumentUnit,
  DynamicTreeUnit,
  l3Interfaces,
  afwInterfaces,
  l3TreeInterfaces,
  bsInterfaces,
  DocumentAndListInterfaces,
  MedicInterfaces,
  l3InternalInterfaces,
  ExtCtrls,
  TreeInterfaces
  {$If not defined(NoVCM)}
  ,
  vcmInterfaces
  {$IfEnd} //not NoVCM
  
  {$If not defined(NoVCM)}
  ,
  vcmExternalInterfaces
  {$IfEnd} //not NoVCM
  
  {$If not defined(NoVCM)}
  ,
  vcmLocalInterfaces
  {$IfEnd} //not NoVCM
  ,
  l3ProtoObjectWithCOMQI,
  l3NotifyPtrList
  {$If defined(Nemesis)}
  ,
  nscNewInterfaces
  {$IfEnd} //Nemesis
  ,
  DocumentInterfaces,
  PreviewInterfaces,
  nsTypes,
  vcmControllers {a}
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}
type
 _FormDataSourceType_ = IdsMedicFirmList;
 _InitDataType_ = IUnknown;
 {$Include w:\garant6x\implementation\Garant\GbaNemesis\Tree\dsSimpleTree.imp.pas}
 _nsContextFilter_Parent_ = _dsSimpleTree_;
 {$Include w:\garant6x\implementation\Garant\GbaNemesis\Tree\nsContextFilter.imp.pas}
 TdsMedicFirmList = {final vac} class(_nsContextFilter_, InsMedicFirmsTreeNotifyRecipient, IdsMedicFirmList)
  {* ������ ����-�������������� }
 private
 // private fields
   f_CurrentCountryFilter : Il3SimpleNode;
   f_CountryFilterTree : Il3SimpleTree;
   ucc_BaseDocument : IsdsBaseDocument;
   f_Current : INodeBase;
    {* ���� ��� �������� Current}
 protected

  procedure InitRefs(const aDS: IvcmUseCaseController); override;
  procedure ClearRefs; override;
 private
 // private methods
   function MakePreview(const aTree: Il3SimpleTree): IafwComplexDocumentPreview;
     {* ��������� preview ��� ������ }
   function MakeMultiDocumentPreview(const aTree: Il3SimpleTree): IafwComplexDocumentPreview;
     {* ������� ������ � �������� ���������� }
   function CreateBookmark: IBookmark;
     {* ������� �������� ��� �������� ��������� }
   procedure ChangeCurrent(const aNode: Il3SimpleNode);
     {* ������� ��������� }
 protected
 // property methods
   function pm_GetShortName: Il3CString;
 protected
 // realized methods
   function MakeSimpleTree: Il3SimpleTree; override;
     {* ������� ������ ������ }
   procedure CountryFilterResetted;
   function FiltrateByCountry(const aTreeSource: Il3SimpleTree;
    const aCurrentNode: Il3SimpleNode;
    const aFilter: Il3SimpleNode;
    out aCurrent: Integer): Il3SimpleTree;
   function MakeNewDocInfo: IdeDocInfo;
   procedure AddBookmark;
     {* �������� �������� �� ������� �������� }
   function GetNodeID(const aNode: Il3SimpleNode): Integer;
   function MakeSuperPreview(const aTree: Il3SimpleTree;
    WithTexts: Boolean = True): InsSuperComplexDocumentPreview;
     {* ������� ���������������� ������ }
   function FullName: Il3CString;
   function ExportDocuments(const aTree: Il3SimpleTree;
    aOnlySelection: Boolean;
    const aPath: Il3CString;
    aFormat: TnsFileFormat): Boolean;
     {* ��������� ���������� ��������� �� ���� � ��������� �������. ���������� ������� ����, ��� ����-�� ��������� }
   function MergeDocuments(const aTree: Il3SimpleTree;
    aOnlySelection: Boolean;
    const aFileName: Il3CString;
    aFormat: TnsFileFormat;
    NeedPrintTopic: Boolean = True): Boolean;
     {* ��������� ���������� ��������� � ���� ���� � ��������� �������. ��������, ���� �������, �� ������ "�����: <���������� ����� ���������>". ���������� ������� ����, ��� ����-�� ��������� }
   function pm_GetCurrentCountryFilter: Il3SimpleNode;
   function pm_GetCountryFilterTree: Il3SimpleTree;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* ������� ������� ����� �������. }
   procedure DoCurrentChanged(const aNode: Il3SimpleNode); override;
     {* �������� �������. }
   procedure ClearFields; override;
 private
 // private properties
   property Current: INodeBase
     read f_Current
     write f_Current;
   property ShortName: Il3CString
     read pm_GetShortName;
 end;//TdsMedicFirmList
{$IfEnd} //not Admin AND not Monitorings

implementation

{$If not defined(Admin) AND not defined(Monitorings)}
uses
  Classes
  {$If not defined(NoVCM)}
  ,
  vcmBase
  {$IfEnd} //not NoVCM
  ,
  SysUtils
  {$If not defined(NoVCM)}
  ,
  StdRes
  {$IfEnd} //not NoVCM
  ,
  afwComplexDocumentPreview,
  nsDocumentPreview,
  nsHAFPainter,
  evTreeStorable,
  nsTreeMultiDocumentPreviewContainer,
  nsDocumentTools,
  nsSuperComplexDocumentPreview,
  nsDocumentStreamWrapper,
  nsMedicFirmsTree,
  k2Const,
  bsTypesNew,
  nsCountryFilter,
  bsUtils,
  l3String,
  nsExternalObject,
  l3Nodes,
  BaseTypesUnit,
  PharmFirmListUnit,
  deDocInfo,
  nsMedicFirmsCountryFilterTree,
  bsDataContainer,
  nevBase,
  nsFixedHAFMacroReplacer,
  evFormatHAFMacroReplacer,
  FoldersDomainInterfaces,
  nsFolderFilterInfo,
  l3Base,
  vtUtils,
  vtStdRes,
  nsNewCachableNode,
  Windows,
  l3InterfacesMisc
  {$If defined(Nemesis)}
  ,
  nscContextFilterState
  {$IfEnd} //Nemesis
  
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}

type _Instance_R_ = TdsMedicFirmList;

{$Include w:\garant6x\implementation\Garant\GbaNemesis\Tree\dsSimpleTree.imp.pas}

{$Include w:\garant6x\implementation\Garant\GbaNemesis\Tree\nsContextFilter.imp.pas}

// start class TdsMedicFirmList

function TdsMedicFirmList.pm_GetShortName: Il3CString;
//#UC START# *49257D6C02A5_49257BB801C7get_var*
//#UC END# *49257D6C02A5_49257BB801C7get_var*
begin
//#UC START# *49257D6C02A5_49257BB801C7get_impl*
 Result := vcmCStr(str_FirmListName);
//#UC END# *49257D6C02A5_49257BB801C7get_impl*
end;//TdsMedicFirmList.pm_GetShortName

function TdsMedicFirmList.MakePreview(const aTree: Il3SimpleTree): IafwComplexDocumentPreview;
//#UC START# *49257D0D020D_49257BB801C7_var*
var
 l_Selection: IafwDocumentPreview;
 l_Replacer: IafwHAFMacroReplacer;          
//#UC END# *49257D0D020D_49257BB801C7_var*
begin
//#UC START# *49257D0D020D_49257BB801C7_impl*
 l_Replacer := TnsFixedHAFMacroReplacer.Make(nil, pm_GetShortName, FullName);
 Result := TafwComplexDocumentPreview.Make(TnsDocumentPreview.Make(TevTreeStorable.MakeStorable(TevTreeStorableData_C(aTree)),
                                             evDefaultPreviewCacheKey,
                                             TnsHAFPainter.Make(l_Replacer)),
                                           nil);
 if aTree.SelectCount > 1 then
 begin
  l_Selection := TnsDocumentPreview.Make(
             TevTreeStorable.MakeStorable(TevTreeStorableData_C(aTree, k2_tiVoid, FM_SELECTION)),
             evDefaultPreviewCacheKey,
             TnsHAFPainter.Make(TevFormatHAFMacroReplacer.Make(l_Replacer, vcmCStr(str_SaveSelectedListPrefix))));
  Result.SetSelection(l_Selection);
  if Assigned(l_Selection) then
   Result.ContentKind := afw_pckSelection
  else
   Result.ContentKind := afw_pckDocument;
 end;
//#UC END# *49257D0D020D_49257BB801C7_impl*
end;//TdsMedicFirmList.MakePreview

function TdsMedicFirmList.MakeMultiDocumentPreview(const aTree: Il3SimpleTree): IafwComplexDocumentPreview;
//#UC START# *49257D2E030B_49257BB801C7_var*
var
 l_Tree    : Il3ExpandedSimpleTree;
 l_FullPreview : IafwDocumentPreview;
 l_SelectedPreview: IafwDocumentPreview;
//#UC END# *49257D2E030B_49257BB801C7_var*
begin
//#UC START# *49257D2E030B_49257BB801C7_impl*
 if Supports(aTree, Il3ExpandedSimpleTree, l_Tree) then
 try
  l_FullPreview := TnsTreeMultiDocumentPreviewContainer.Make(l_Tree, False, False);
  l_SelectedPreview := TnsTreeMultiDocumentPreviewContainer.Make(l_Tree, True, False);
  try
   Result := TafwComplexDocumentPreview.Make(l_FullPreview);
   Result.SetSelection(l_SelectedPreview);
   if Assigned(l_SelectedPreview) then
    Result.ContentKind := afw_pckSelection;
  finally
   l_FullPreview := nil;
   l_SelectedPreview := nil;
  end;{try..finally}
 finally
  l_Tree := nil;
 end{try..finally}
 else
  Result := nil;
//#UC END# *49257D2E030B_49257BB801C7_impl*
end;//TdsMedicFirmList.MakeMultiDocumentPreview

function TdsMedicFirmList.CreateBookmark: IBookmark;
//#UC START# *49257D9201BF_49257BB801C7_var*
var
 l_Document : IDocument;
 l_DocInfo: IdeDocInfo;
//#UC END# *49257D9201BF_49257BB801C7_var*
begin
//#UC START# *49257D9201BF_49257BB801C7_impl*
 Result := nil;
 if Assigned(ucc_BaseDocument) then
 begin
  l_DocInfo:= ucc_BaseDocument.DocInfo;
  try
   l_Document := l_DocInfo.Doc;
   if Assigned(l_Document) then
   try
    nsDocumentTools.CreateBookmark(l_Document,
                                   l_DocInfo.Pos.rPos,
                                   l_DocInfo.Pos.rRefType = dptPara,
                                   Result);
   finally
    l_Document := nil;
   end;//if Assigned(lDocument) then
  finally
   l_DocInfo := nil;
  end;
 end;//if Assigned(f_ListNode) and (
//#UC END# *49257D9201BF_49257BB801C7_impl*
end;//TdsMedicFirmList.CreateBookmark

procedure TdsMedicFirmList.ChangeCurrent(const aNode: Il3SimpleNode);
//#UC START# *4925898100FE_49257BB801C7_var*
var
 l_Node: INodeBase;
//#UC END# *4925898100FE_49257BB801C7_var*
begin
//#UC START# *4925898100FE_49257BB801C7_impl*
 if Supports(aNode, INodeBase, l_Node) then
 try
  f_Current := nil;
  l_Node.GetFrozenNode(f_Current);
 finally
  l_Node := nil;
 end;{try..finally}
//#UC END# *4925898100FE_49257BB801C7_impl*
end;//TdsMedicFirmList.ChangeCurrent

function TdsMedicFirmList.MakeSimpleTree: Il3SimpleTree;
//#UC START# *47F4C2B9014A_49257BB801C7_var*
//#UC END# *47F4C2B9014A_49257BB801C7_var*
begin
//#UC START# *47F4C2B9014A_49257BB801C7_impl*
 Result := TnsMedicFirmsTree.Make;
//#UC END# *47F4C2B9014A_49257BB801C7_impl*
end;//TdsMedicFirmList.MakeSimpleTree

procedure TdsMedicFirmList.CountryFilterResetted;
//#UC START# *49071AF00132_49257BB801C7_var*
//#UC END# *49071AF00132_49257BB801C7_var*
begin
//#UC START# *49071AF00132_49257BB801C7_impl*
 f_CurrentCountryFilter := nil;
//#UC END# *49071AF00132_49257BB801C7_impl*
end;//TdsMedicFirmList.CountryFilterResetted

function TdsMedicFirmList.FiltrateByCountry(const aTreeSource: Il3SimpleTree;
  const aCurrentNode: Il3SimpleNode;
  const aFilter: Il3SimpleNode;
  out aCurrent: Integer): Il3SimpleTree;
//#UC START# *492576530326_49257BB801C7_var*
var
 l_FilterableTree: Il3FilterableTree;
 l_TreeFilters: InsMedicFirmListFilters;
//#UC END# *492576530326_49257BB801C7_var*
begin
//#UC START# *492576530326_49257BB801C7_impl*
 if (not pm_GetCurrentCountryFilter.IsSame(aFilter)) and
    Supports(aTreeSource, Il3FilterableTree, l_FilterableTree) and
    Supports(l_FilterableTree.CloneFilters, InsMedicFirmListFilters, l_TreeFilters) then
 begin
  f_CurrentCountryFilter := aFilter;
  Result := l_FilterableTree.MakeFiltered(l_TreeFilters.
                                          SetCountry(TnsCountryFilter.Make(aFilter)).
                                          SetContext(pm_GetCurrentContextFilter.ActiveContext),
                                          aCurrentNode,
                                          aCurrent,
                                          True,
                                          True);


 end
 else
  Result := aTreeSource;
//#UC END# *492576530326_49257BB801C7_impl*
end;//TdsMedicFirmList.FiltrateByCountry

function TdsMedicFirmList.MakeNewDocInfo: IdeDocInfo;
//#UC START# *492576D90012_49257BB801C7_var*
//#UC END# *492576D90012_49257BB801C7_var*
begin
//#UC START# *492576D90012_49257BB801C7_impl*
 Result := ucc_BaseDocument.DocInfo.Clone;   
//#UC END# *492576D90012_49257BB801C7_impl*
end;//TdsMedicFirmList.MakeNewDocInfo

procedure TdsMedicFirmList.AddBookmark;
//#UC START# *492576E30362_49257BB801C7_var*
var
 l_Bookmark : IBookmark;
//#UC END# *492576E30362_49257BB801C7_var*
begin
//#UC START# *492576E30362_49257BB801C7_impl*
 l_Bookmark := CreateBookmark;
 if Assigned(l_Bookmark) then
 try
   TdmStdRes.SaveOpen(nil, // - ��� ��� ����� ! �� ����� �������� :-(
                      TnsFolderFilterInfo.Make(ffBookmark, ns_ffDocument),
                      fetBookmark,
                      l_Bookmark,
                      false);
 finally
  l_Bookmark := nil;
 end;//try..finally
//#UC END# *492576E30362_49257BB801C7_impl*
end;//TdsMedicFirmList.AddBookmark

function TdsMedicFirmList.GetNodeID(const aNode: Il3SimpleNode): Integer;
//#UC START# *492576F500F5_49257BB801C7_var*
var
 lNode : INodeBase;
//#UC END# *492576F500F5_49257BB801C7_var*
begin
//#UC START# *492576F500F5_49257BB801C7_impl*
 Result := 0;
 if Supports(aNode, INodeBase, lNode) then
 try
  Result := lNode.GetNodeId;
 finally
  lNode := nil;
 end;
//#UC END# *492576F500F5_49257BB801C7_impl*
end;//TdsMedicFirmList.GetNodeID

function TdsMedicFirmList.MakeSuperPreview(const aTree: Il3SimpleTree;
  WithTexts: Boolean = True): InsSuperComplexDocumentPreview;
//#UC START# *492577250399_49257BB801C7_var*
var
 l_Preview: IafwComplexDocumentPreview;
//#UC END# *492577250399_49257BB801C7_var*
begin
//#UC START# *492577250399_49257BB801C7_impl*
 Result := TnsSuperComplexDocumentPreview.Make(MakePreview(aTree));
 if WithTexts then
  l_Preview := MakeMultiDocumentPreview(aTree)
 else
  l_Preview := nil;
 Result.DocumentTexts := l_Preview;
//#UC END# *492577250399_49257BB801C7_impl*
end;//TdsMedicFirmList.MakeSuperPreview

function TdsMedicFirmList.FullName: Il3CString;
//#UC START# *4925777F003A_49257BB801C7_var*
//#UC END# *4925777F003A_49257BB801C7_var*
begin
//#UC START# *4925777F003A_49257BB801C7_impl*
 Result := vcmCStr(str_FirmListName);
//#UC END# *4925777F003A_49257BB801C7_impl*
end;//TdsMedicFirmList.FullName

function TdsMedicFirmList.ExportDocuments(const aTree: Il3SimpleTree;
  aOnlySelection: Boolean;
  const aPath: Il3CString;
  aFormat: TnsFileFormat): Boolean;
//#UC START# *4925778D0078_49257BB801C7_var*
var
 l_Result: Boolean absolute Result;

  function lp_ExportDocument(const aNode: Il3SimpleNode): Boolean;
  var
   l_PathName : Il3CString;
   l_Index    : Integer;
   l_Document : IDocument;
   l_NB       : INodeBase;
  begin
   Result := False;
   if Supports(aNode, INodeBase, l_NB) then
   try
     l_Document := bsExtractDocument(l_NB);
     if (l_Document <> nil) and (l_Document.GetDocType <> DT_FLASH) then
     try
      l_PathName := l3Cat([l3Cat(aPath, '\'), CreateFileName(l_Document)]);
      // ������������ ������������ �����
      if FileExists(l3PStr(l3Cat(l_PathName, nsGetFileFormatExt(aFormat)))) then
      begin
       l_Index := 1;
       while FileExists(l3PStr(l3Cat(l_PathName, IntToStr(l_Index) + nsGetFileFormatExt(aFormat)))) do
        Inc(l_Index);
       l_PathName := l3Cat(l_PathName, IntToStr(l_Index) + nsGetFileFormatExt(aFormat));
      end
      else
       l_PathName := l3Cat(l_PathName, nsGetFileFormatExt(aFormat));
      // ��������
      DocumentSaveAs(l_Document, l_PathName, True, aFormat);
      l_Result := True;
     finally
      l_Document := nil
     end;//try..finally
   finally
    l_NB := nil;
   end;//try..finally
  end;

var
 l_Flag: Word;
 l_Tree: Il3ExpandedSimpleTree;
//#UC END# *4925778D0078_49257BB801C7_var*
begin
//#UC START# *4925778D0078_49257BB801C7_impl*
 Result := False;
 if aOnlySelection then
  l_Flag := FM_SELECTION
 else
  l_Flag := 0;
 if Supports(aTree, Il3ExpandedSimpleTree, l_Tree) then
  l_Tree.FlagIterateF(l3L2SNA(@lp_ExportDocument), l_Flag);
//#UC END# *4925778D0078_49257BB801C7_impl*
end;//TdsMedicFirmList.ExportDocuments

function TdsMedicFirmList.MergeDocuments(const aTree: Il3SimpleTree;
  aOnlySelection: Boolean;
  const aFileName: Il3CString;
  aFormat: TnsFileFormat;
  NeedPrintTopic: Boolean = True): Boolean;
//#UC START# *492577CF0184_49257BB801C7_var*
var
 l_Tree : Il3ExpandedSimpleTree;
 l_Documents: TvcmInterfaceList;

  function lp_ExportDocument(const aNode: Il3SimpleNode): Boolean;
  var
   l_NB       : INodeBase;
   l_Document : IDocument;
  begin
   // ���������� ��� ����
   Result := False;
   if Supports(aNode, INodeBase, l_NB) then
   begin
    l_Document := bsExtractDocument(l_NB);
    try
     if (l_Document <> nil) and (l_Document.GetDocType <> DT_FLASH) then
      l_Documents.Add(TnsDocumentStreamWrapper.Make(l_Document));
    finally
     l_Document := nil;
    end;
   end;
  end;//lpIterator

var
 l_Flag: Word;
//#UC END# *492577CF0184_49257BB801C7_var*
begin
//#UC START# *492577CF0184_49257BB801C7_impl*
 if Supports(aTree, Il3ExpandedSimpleTree, l_Tree) then
 begin
  // ��������� ���������� ��������
  if aOnlySelection then
   l_Flag := FM_SELECTION
  else
   l_Flag := 0;
  l_Documents := TvcmInterfaceList.Make;
  try
   l_Tree.FlagIterateF(l3L2SNA(@lp_ExportDocument), l_Flag);
   Result := l_Documents.Count > 0;
   if Result then
    nsSaveMultiplyDocuments(l_Documents, aFileName, aFormat, NeedPrintTopic, True);
  finally
   vcmFree(l_Documents);
  end;
 end
 else
  Result := False;
//#UC END# *492577CF0184_49257BB801C7_impl*
end;//TdsMedicFirmList.MergeDocuments

function TdsMedicFirmList.pm_GetCurrentCountryFilter: Il3SimpleNode;
//#UC START# *4925780600F0_49257BB801C7get_var*
//#UC END# *4925780600F0_49257BB801C7get_var*
begin
//#UC START# *4925780600F0_49257BB801C7get_impl*
 if f_CurrentCountryFilter = nil then
 begin
  Assert(Assigned(pm_GetCountryFilterTree.RootNode.Child));
  f_CurrentCountryFilter := pm_GetCountryFilterTree.RootNode.Child;
 end;
 Result := f_CurrentCountryFilter;
//#UC END# *4925780600F0_49257BB801C7get_impl*
end;//TdsMedicFirmList.pm_GetCurrentCountryFilter

function TdsMedicFirmList.pm_GetCountryFilterTree: Il3SimpleTree;
//#UC START# *4925786801D6_49257BB801C7get_var*
var
 l_Source: InsMedicFirmsTreeNotificationSource;
//#UC END# *4925786801D6_49257BB801C7get_var*
begin
//#UC START# *4925786801D6_49257BB801C7get_impl*
 if f_CountryFilterTree = nil then
 begin
  f_CountryFilterTree := TnsMedicFirmsCountryFilterTree.Make;
  if Supports(f_CountryFilterTree, InsMedicFirmsTreeNotificationSource, l_Source) then
   l_Source.Subscribe(Self);
 end;
 Result := f_CountryFilterTree;
//#UC END# *4925786801D6_49257BB801C7get_impl*
end;//TdsMedicFirmList.pm_GetCountryFilterTree

procedure TdsMedicFirmList.Cleanup;
//#UC START# *479731C50290_49257BB801C7_var*
var
 l_Source: InsMedicFirmsTreeNotificationSource;
//#UC END# *479731C50290_49257BB801C7_var*
begin
//#UC START# *479731C50290_49257BB801C7_impl*
 f_Current := nil;
 f_CurrentCountryFilter := nil;
 if Supports(f_CountryFilterTree, InsMedicFirmsTreeNotificationSource, l_Source) then
  l_Source.UnSubscribe(Self);
 f_CountryFilterTree := nil;
 inherited;
//#UC END# *479731C50290_49257BB801C7_impl*
end;//TdsMedicFirmList.Cleanup

procedure TdsMedicFirmList.DoCurrentChanged(const aNode: Il3SimpleNode);
//#UC START# *47F0C1BF0314_49257BB801C7_var*
var
 l_Node   : INodeBase;
 l_Entity : IEntityBase;
 l_Entry  : IPharmFirmListEntry;
//#UC END# *47F0C1BF0314_49257BB801C7_var*
begin
//#UC START# *47F0C1BF0314_49257BB801C7_impl*
 if Supports(aNode, INodeBase, l_Node) and not l_Node.IsSameNode(Current) then
 try
  l_Node.GetEntity(l_Entity);
  if Supports(l_Entity, IPharmFirmListEntry, l_Entry) then
  try
   if (ucc_BaseDocument <> nil) then
   begin
    ChangeCurrent(aNode);
    ucc_BaseDocument.ChangeDocument(TdeDocInfo.Make(TbsMedicFirmNodeContainer.Make(l_Node, l_Entry)));
   end;//ucc_BaseDocument <> nil
  finally
   l_Entry := nil;
  end//try..finally
  else
   Assert(false, 'http://mdp.garant.ru/pages/viewpage.action?pageId=136255787&focusedCommentId=136256073#comment-136256073');
 finally
  l_Node := nil;
 end;//try..finally
//#UC END# *47F0C1BF0314_49257BB801C7_impl*
end;//TdsMedicFirmList.DoCurrentChanged

procedure TdsMedicFirmList.ClearFields;
 {-}
begin
 Current := nil;
 inherited;
end;//TdsMedicFirmList.ClearFields

procedure TdsMedicFirmList.InitRefs(const aDS: IvcmUseCaseController);
begin
 inherited;
 Supports(aDS, IsdsBaseDocument, ucc_BaseDocument);
end;

procedure TdsMedicFirmList.ClearRefs;
begin
 inherited;
 ucc_BaseDocument := nil;
end;

{$IfEnd} //not Admin AND not Monitorings

end.