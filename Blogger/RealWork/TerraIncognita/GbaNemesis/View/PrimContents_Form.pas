unit PrimContents_Form;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "View"
// �����: ����� �.�.
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/View/PrimContents_Form.pas"
// �����: 23.01.2009 18:18
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<VCMForm::Class>> F1 ������ � ���������� � ������� ����������::Document::View::Contents::PrimContents
//
// ����������
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
  afwInterfaces
  {$If not defined(NoVCM)}
  ,
  vcmExternalInterfaces
  {$IfEnd} //not NoVCM
  ,
  l3TreeInterfaces,
  nevTools,
  bsInterfaces,
  eeInterfaces,
  DocumentAndListInterfaces,
  TreeInterfaces,
  OfficeLike_Usual_Controls
  {$If not defined(NoVCM)}
  ,
  vcmEntityForm
  {$IfEnd} //not NoVCM
  ,
  Document_Strange_Controls,
  Base_Operations_Editions_Controls
  {$If defined(Nemesis)}
  ,
  nscTreeView
  {$IfEnd} //Nemesis
  
  {$If defined(Nemesis)}
  ,
  nscContextFilter
  {$IfEnd} //Nemesis
  ,
  nevContainers,
  vtPanel,
  ImgList,
  nsLogEvent,
  DocumentInterfaces,
  l3StringIDEx,
  ContentsUserTypes_utDrugContents_UserType,
  vtLister
  {$If defined(Nemesis)}
  ,
  nscTasksPanelView
  {$IfEnd} //Nemesis
  ,
  LegalDomain_DocumentNotifications_Controls
  {$If not defined(NoScripts)}
  ,
  kwBynameControlPush
  {$IfEnd} //not NoScripts
  
  {$If not defined(NoScripts)}
  ,
  tfwControlString
  {$IfEnd} //not NoScripts
  
  {$If not defined(NoVCM)}
  ,
  vcmUserControls
  {$IfEnd} //not NoVCM
  ,
  ContentsUserTypes_utContents_UserType
  {$If not defined(NoScripts)}
  ,
  tfwInteger
  {$IfEnd} //not NoScripts
  ,
  vcmInterfaces {a}
  {$If defined(Nemesis)}
  ,
  nscNewInterfaces
  {$IfEnd} //Nemesis
  
  {$If not defined(NoVCM)}
  ,
  vcmControllers
  {$IfEnd} //not NoVCM
  ,
  F1TagDataProviderInterface
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}
type
 TMoveDirectionType = (
   mdtNone
 , mdtDown
 , mdtUp
 );//TMoveDirectionType

 TnsContentItem = (
  {* ���� ��������� ��������� }
   cltNone
 , cltBlock
 , cltBookmark
 , cltUserComment
 , cltPicture
 , cltPictureLink
 , cltRTF
 , cltMP3
 , cltXLS
 , cltEVD
 , cltPDF
 );//TnsContentItem

 TnsFilteredLists = array [TnsContentsListType] of IFiltered;

 TnsListForFiltering = array [TnsContentsListType] of TvtLister;

var
  { ������������ ������ Local }
 str_ContentsPrintTitle : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'ContentsPrintTitle'; rValue : '%s (����������)');
  { '%s (����������)' }

type
 _ContentsUserTypes_Parent_ = TvcmEntityForm;
 {$Include ..\View\ContentsUserTypes.imp.pas}
 _PageControlNotification_Parent_ = _ContentsUserTypes_;
 {$Include ..\View\PageControlNotification.imp.pas}
 TPrimContentsForm = {form} class(_PageControlNotification_, InsTreeDataListener)
  {* ���������� }
 private
 // private fields
   f_Filtered : TnsFilteredLists;
   f_ListForFiltering : TnsListForFiltering;
   f_CloseDisabled : Boolean;
   f_ContentsTreeLastUpdateTime : Longword;
    {* http://mdp.garant.ru/pages/viewpage.action?pageId=298682625}
   f_ContextFilterDocInfo : IdeDocInfo;
   f_BackgroundPanel : TvtPanel;
    {* ���� ��� �������� BackgroundPanel}
   f_lstBookmarks : TvtLister;
    {* ���� ��� �������� lstBookmarks}
   f_lstComments : TvtLister;
    {* ���� ��� �������� lstComments}
   f_lstExternalObjects : TvtLister;
    {* ���� ��� �������� lstExternalObjects}
   f_ContentsTree : TnscTreeView;
    {* ���� ��� �������� ContentsTree}
   f_ContextFilter : TnscContextFilter;
    {* ���� ��� �������� ContextFilter}
   f_Tasks : TnscTasksPanelView;
    {* ���� ��� �������� Tasks}
 protected
  procedure SignalDataSourceChanged(const anOld : IvcmViewAreaController;
                                const aDsNew : IvcmViewAreaController); override;
  procedure InitEntities; override;
  procedure MakeControls; override;
 private
 // private methods
   procedure GetContentsListItem(Sender: TObject;
     Index: Integer;
     var ItemString: Il3CString);
   procedure InitLists;
   function GetBookmarksItemImage(Sender: TObject;
     Index: Integer): Integer;
   function GetCommentsItemImage(Sender: TObject;
     Index: Integer): Integer;
   function GetExternalObjectsItemImage(Sender: TObject;
     Index: Integer): Integer;
   procedure ContentsListActionElement(Sender: TObject;
     Index: Integer);
   procedure ContentsListCurrentChanged(Sender: TObject;
     aNewCurrent: Integer;
     aOldCurrent: Integer);
   procedure ContextFilterChange(Sender: TObject);
   procedure ContextFilterWrongContext(Sender: TObject);
   procedure ContentsTreeNewCharPressed(aChar: AnsiChar);
   procedure ContentsTreeCurrentChanged(Sender: TObject;
     NewCurrent: Integer;
     OldCurrent: Integer);
   function ContentsTreeGetItemImage(Sender: TObject;
     Index: Integer;
     var aImages: TCustomImageList): Integer;
   procedure ContentsTreeTreeChanged(aSender: TObject;
     const anOldTree: Il3SimpleTree;
     const aNewTree: Il3SimpleTree);
   procedure ContentsTreeActionElement(Sender: TObject;
     Index: Integer);
   procedure ContentsTreeMakeTreeSource(out theTree: Il3SimpleTree);
   procedure ContentsTreeRootChanged(aSender: TObject;
     const anOldRoot: IeeNode;
     const aNewRoot: IeeNode);
   function CheckFilteredIndex(aSender: TObject;
     anIndex: Integer): TnsContentsListIndex;
   procedure GetIsContextWrong(aSender: TObject;
     var IsWrong: Boolean);
   procedure DoContentsListActionElement(Sender: TObject;
     Index: Integer;
     aNeedClose: Boolean);
   function FloatingHide: Boolean;
   procedure CheckFocus;
     {* ��������� � ����� �� ����� � ���� ��� �� ���, �� ������ ��� �� ������ ��������� ������� }
   procedure CheckActionElementMode;
   procedure StoreFloatingVisible(aValue: Boolean);
 protected
 // property methods
   function pm_GetBackgroundPanel: TvtPanel;
   function pm_GetContentsTree: TnscTreeView;
   function pm_GetContextFilter: TnscContextFilter;
 protected
 // realized methods
   procedure Updated;
     {* ������ ������ ���� ���������. ������� �� ���������� ������
            ���������� }
   procedure DoTabActivate; override;
     {* ������� �� ������������ ������� }
   procedure Contents_SetCurrent_Execute(aSub: Integer);
   procedure Contents_SetCurrent(const aParams: IvcmExecuteParams);
   procedure Contents_MoveCurrent_Execute(aSub: Integer;
    aDown: Boolean);
   procedure Contents_MoveCurrent(const aParams: IvcmExecuteParams);
   procedure DocumentBlock_GetCorrespondentList_Test(const aParams: IvcmTestParamsPrim);
   procedure DocumentBlock_GetCorrespondentList_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure DocumentBlock_GetRespondentList_Test(const aParams: IvcmTestParamsPrim);
   procedure DocumentBlock_GetRespondentList_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure DocumentBlock_GetTypedCorrespondentList_Test(const aParams: IvcmTestParamsPrim);
   procedure DocumentBlock_GetTypedCorrespondentList_GetState(var State: TvcmOperationStateIndex);
   procedure DocumentBlock_GetTypedCorrespondentList_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure DocumentBlock_GetTypedRespondentList_Test(const aParams: IvcmTestParamsPrim);
   procedure DocumentBlock_GetTypedRespondentList_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure DocumentBlockBookmarks_AddBookmark_Test(const aParams: IvcmTestParamsPrim);
     {* ���������� �������� �� �������� }
   procedure DocumentBlockBookmarks_AddBookmark_Execute(const aParams: IvcmExecuteParamsPrim);
     {* ���������� �������� �� �������� }
   procedure DocumentBlock_ToMSWord_Test(const aParams: IvcmTestParamsPrim);
   procedure DocumentBlock_ToMSWord_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure DocumentBlock_PrintDialog_Test(const aParams: IvcmTestParamsPrim);
   procedure DocumentBlock_PrintDialog_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure DocumentBlock_Copy_Test(const aParams: IvcmTestParamsPrim);
   procedure DocumentBlock_Copy_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure DocumentBlock_Print_Test(const aParams: IvcmTestParamsPrim);
   procedure DocumentBlock_Print_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure DocumentBlock_PrintPreview_Test(const aParams: IvcmTestParamsPrim);
   procedure DocumentBlock_PrintPreview_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure DocumentBlock_Select_Test(const aParams: IvcmTestParamsPrim);
   procedure DocumentBlock_Select_Execute(const aParams: IvcmExecuteParamsPrim);
   function ContentsValidator_IsDocumentAdornmentsChanged_Execute(const aNew: InsDocumentAdornments): Boolean;
   procedure ContentsValidator_IsDocumentAdornmentsChanged(const aParams: IvcmExecuteParams);
   function Contents_HasUserComments_Execute: Boolean;
     {* ���� �� � ���������� ���������������� ����������� }
   procedure Contents_HasUserComments(const aParams: IvcmExecuteParams);
     {* ���� �� � ���������� ���������������� ����������� }
   function Contents_HasBookmarks_Execute: Boolean;
     {* ���� �� � ���������� �������� }
   procedure Contents_HasBookmarks(const aParams: IvcmExecuteParams);
     {* ���� �� � ���������� �������� }
   function Contents_ToggleContentsVisibility_Execute: Boolean;
     {* ����������� ��������� ���������� ���� ����������, ���������� true ���� ������������ ������� }
   procedure Contents_ToggleContentsVisibility(const aParams: IvcmExecuteParams);
     {* ����������� ��������� ���������� ���� ����������, ���������� true ���� ������������ ������� }
   function Contents_IsContentsVisible_Execute: Boolean;
     {* ���������� ��������� ��������� ���������� ���� ���������� }
   procedure Contents_IsContentsVisible(const aParams: IvcmExecuteParams);
     {* ���������� ��������� ��������� ���������� ���� ���������� }
   procedure Comment_Changed_Execute;
   procedure Comment_Changed(const aParams: IvcmExecuteParams);
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* ������� ������� ����� �������. }
   {$If not defined(NoVCM)}
   procedure NotifyDataSourceChanged(const anOld: IvcmViewAreaController;
    const aNew: IvcmViewAreaController); override;
     {* ��������� �������� ������. ��� ���������� � �������� }
   {$IfEnd} //not NoVCM
   {$If not defined(NoVCM)}
   procedure DoInit(aFromHistory: Boolean); override;
     {* ������������� �����. ��� ���������� � �������� }
   {$IfEnd} //not NoVCM
   {$If not defined(NoVCM)}
   procedure InitControls; override;
     {* ��������� ������������� ���������. ��� ���������� � �������� }
   {$IfEnd} //not NoVCM
    {$If not defined(NoVCM)}
   procedure CheckFloatingVisibility; override;
    {$IfEnd} //not NoVCM
 public
 // overridden public methods
    {$If not defined(NoVCM)}
   procedure DefaultQueryClose(aSender: TObject); override;
    {$IfEnd} //not NoVCM
    {$If not defined(NoVCM)}
   function CanHaveCloseButtonInNavigator: Boolean; override;
    {$IfEnd} //not NoVCM
    {$If not defined(NoVCM)}
   function CanHaveOwnCloseButtonInNavigator: Boolean; override;
    {$IfEnd} //not NoVCM
 protected
 // protected fields
   SimpleTree : IdsSimpleTree;
   Contents : IdsContents;
   BaseContents : IdsBaseContents;
   f_InternalPositioning : Integer;
  {$If defined(vcmUseProfilers) AND not defined(Admin) AND not defined(Monitorings)}
   f_FirstCurrentChanged : Boolean;
  {$IfEnd} //vcmUseProfilers AND not Admin AND not Monitorings
 protected
 // protected methods
   function FindSubByID(anID: Integer): Il3SimpleNode;
   function IsMultiSelection: Boolean;
   procedure FillCRList(const aParams: IvcmTestParamsPrim);
   procedure EnDocumentBlockTest(const aParams: IvcmTestParamsPrim;
     AllowMultiSelect: Boolean);
   function MakePositionList(const aNode: IeeNode = nil): IPositionList;
   function IsCurrentBlockOrSub: Boolean;
   function IsNodeBlockOrSub(const aNode: IeeNode): Boolean;
   function ContentItemType(const aNode: IeeNode = nil): TnsContentItem;
   function BuildSelectionList: InevFlatSubsList;
   function TextFormUserType: Byte;
   function CanPrintBlock: Boolean;
   function CanPreview: Boolean;
   function MakePreview: IafwDocumentPreview;
   function MakeEVD: InevStorable;
   function CanPrint: Boolean;
   procedure SendSynchroMessage(anIndex: Integer);
   function IsFloatingState: Boolean;
     {* ���������� - ��������� �� ������� ���������� � ��������� ��������� }
   procedure ExpandFirstLevel;
 public
 // public properties
   property BackgroundPanel: TvtPanel
     read pm_GetBackgroundPanel;
   property lstBookmarks: TvtLister
     read f_lstBookmarks;
   property lstComments: TvtLister
     read f_lstComments;
   property lstExternalObjects: TvtLister
     read f_lstExternalObjects;
   property ContentsTree: TnscTreeView
     read pm_GetContentsTree;
   property ContextFilter: TnscContextFilter
     read pm_GetContextFilter;
   property Tasks: TnscTasksPanelView
     read f_Tasks;
 end;//TPrimContentsForm
{$IfEnd} //not Admin AND not Monitorings

implementation

{$If not defined(Admin) AND not defined(Monitorings)}
uses
  evdTypes,
  LoggingUnit,
  DataAdapter,
  ExternalObjectUnit,
  BaseTypesUnit,
  nevNavigation,
  BitmapPara_Const,
  nevFlatSubsList,
  l3Nodes,
  DocumentUserTypes_dftDocument_UserType,
  DocumentUserTypes_dftDrug_UserType,
  nsHAFPainter,
  evFormatHAFMacroReplacer,
  nsDocInfoHAFMacroReplacer,
  nsDocumentPreview,
  l3InternalInterfaces
  {$If not defined(NoVCM)}
  ,
  vcmBase
  {$IfEnd} //not NoVCM
  ,
  nevBase,
  nsContentsTreeStorable,
  SysUtils,
  k2Interfaces,
  bsTypesNew,
  nsTypes,
  DocumentRes,
  nsFilterableTreeStruct,
  nsContextFilterParams,
  IOUnit,
  eeTreeView,
  nsConst,
  nsTrialSupport,
  nsToMSWordOp,
  afwFacade,
  Printers,
  Controls,
  l3ControlsTypes
  {$If defined(Nemesis)}
  ,
  nscTasksPanel
  {$IfEnd} //Nemesis
  
  {$If defined(Nemesis)}
  ,
  nscTasksPanelGroupDescList
  {$IfEnd} //Nemesis
  ,
  MainMenuNewRes,
  Forms,
  nsUtils,
  eeTreeMisc,
  nsContentsListForFiltering,
  Windows,
  l3SysUtils,
  l3Tree_TLB,
  evdTextStyle_Const,
  l3Base,
  Base_Operations_Strange_Controls
  {$If not defined(NoScripts)}
  ,
  tfwScriptingInterfaces
  {$IfEnd} //not NoScripts
  ,
  l3MessageID,
  nsManagers
  {$If not defined(NoVCM)}
  ,
  StdRes
  {$IfEnd} //not NoVCM
  
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}

{$Include ..\View\ContentsUserTypes.imp.pas}

{$Include ..\View\PageControlNotification.imp.pas}

var
   { ������������ ������ ContentsGroups }
  str_cgContents : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'cgContents'; rValue : '����������');
   { '����������' }
  str_cgBookmarks : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'cgBookmarks'; rValue : '��������');
   { '��������' }
  str_cgComments : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'cgComments'; rValue : '��� �����������');
   { '��� �����������' }
  str_cgExternalObjects : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'cgExternalObjects'; rValue : '���������� �������');
   { '���������� �������' }

type
  TnsGetDocumentStructureEvent = {final} class(TnsLogEvent)
  public
  // public methods
   class procedure Log(const aDoc: IDocument);
  end;//TnsGetDocumentStructureEvent

// start class TnsGetDocumentStructureEvent

class procedure TnsGetDocumentStructureEvent.Log(const aDoc: IDocument);
//#UC START# *4B150E0B0174_4B150DFE035D_var*
var
 l_Data: ILogEventData;
//#UC END# *4B150E0B0174_4B150DFE035D_var*
begin
//#UC START# *4B150E0B0174_4B150DFE035D_impl*
 l_Data := MakeParamsList;
 l_Data.AddObject(aDoc);
 GetLogger.AddEvent(LE_GET_DOCUMENT_STRUCTURE, l_Data);
//#UC END# *4B150E0B0174_4B150DFE035D_impl*
end;//TnsGetDocumentStructureEvent.Log

type
  Tkw_PrimContents_Control_BackgroundPanel = class(TtfwControlString)
   {* ����� ������� ��� �������������� �������� BackgroundPanel
----
*������ �������������*:
[code]
�������::BackgroundPanel TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimContents_Control_BackgroundPanel

// start class Tkw_PrimContents_Control_BackgroundPanel

{$If not defined(NoScripts)}
function Tkw_PrimContents_Control_BackgroundPanel.GetString: AnsiString;
 {-}
begin
 Result := 'BackgroundPanel';
end;//Tkw_PrimContents_Control_BackgroundPanel.GetString
{$IfEnd} //not NoScripts

type
  Tkw_PrimContents_Control_BackgroundPanel_Push = class(TkwBynameControlPush)
   {* ����� ������� ��� �������� BackgroundPanel
----
*������ �������������*:
[code]
�������::BackgroundPanel:push pop:control:SetFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimContents_Control_BackgroundPanel_Push

// start class Tkw_PrimContents_Control_BackgroundPanel_Push

{$If not defined(NoScripts)}
procedure Tkw_PrimContents_Control_BackgroundPanel_Push.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString('BackgroundPanel');
 inherited;
end;//Tkw_PrimContents_Control_BackgroundPanel_Push.DoDoIt
{$IfEnd} //not NoScripts

type
  Tkw_PrimContents_Control_lstBookmarks = class(TtfwControlString)
   {* ����� ������� ��� �������������� �������� lstBookmarks
----
*������ �������������*:
[code]
�������::lstBookmarks TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimContents_Control_lstBookmarks

// start class Tkw_PrimContents_Control_lstBookmarks

{$If not defined(NoScripts)}
function Tkw_PrimContents_Control_lstBookmarks.GetString: AnsiString;
 {-}
begin
 Result := 'lstBookmarks';
end;//Tkw_PrimContents_Control_lstBookmarks.GetString
{$IfEnd} //not NoScripts

type
  Tkw_PrimContents_Control_lstBookmarks_Push = class(TkwBynameControlPush)
   {* ����� ������� ��� �������� lstBookmarks
----
*������ �������������*:
[code]
�������::lstBookmarks:push pop:control:SetFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimContents_Control_lstBookmarks_Push

// start class Tkw_PrimContents_Control_lstBookmarks_Push

{$If not defined(NoScripts)}
procedure Tkw_PrimContents_Control_lstBookmarks_Push.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString('lstBookmarks');
 inherited;
end;//Tkw_PrimContents_Control_lstBookmarks_Push.DoDoIt
{$IfEnd} //not NoScripts

type
  Tkw_PrimContents_Control_lstComments = class(TtfwControlString)
   {* ����� ������� ��� �������������� �������� lstComments
----
*������ �������������*:
[code]
�������::lstComments TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimContents_Control_lstComments

// start class Tkw_PrimContents_Control_lstComments

{$If not defined(NoScripts)}
function Tkw_PrimContents_Control_lstComments.GetString: AnsiString;
 {-}
begin
 Result := 'lstComments';
end;//Tkw_PrimContents_Control_lstComments.GetString
{$IfEnd} //not NoScripts

type
  Tkw_PrimContents_Control_lstComments_Push = class(TkwBynameControlPush)
   {* ����� ������� ��� �������� lstComments
----
*������ �������������*:
[code]
�������::lstComments:push pop:control:SetFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimContents_Control_lstComments_Push

// start class Tkw_PrimContents_Control_lstComments_Push

{$If not defined(NoScripts)}
procedure Tkw_PrimContents_Control_lstComments_Push.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString('lstComments');
 inherited;
end;//Tkw_PrimContents_Control_lstComments_Push.DoDoIt
{$IfEnd} //not NoScripts

type
  Tkw_PrimContents_Control_lstExternalObjects = class(TtfwControlString)
   {* ����� ������� ��� �������������� �������� lstExternalObjects
----
*������ �������������*:
[code]
�������::lstExternalObjects TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimContents_Control_lstExternalObjects

// start class Tkw_PrimContents_Control_lstExternalObjects

{$If not defined(NoScripts)}
function Tkw_PrimContents_Control_lstExternalObjects.GetString: AnsiString;
 {-}
begin
 Result := 'lstExternalObjects';
end;//Tkw_PrimContents_Control_lstExternalObjects.GetString
{$IfEnd} //not NoScripts

type
  Tkw_PrimContents_Control_lstExternalObjects_Push = class(TkwBynameControlPush)
   {* ����� ������� ��� �������� lstExternalObjects
----
*������ �������������*:
[code]
�������::lstExternalObjects:push pop:control:SetFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimContents_Control_lstExternalObjects_Push

// start class Tkw_PrimContents_Control_lstExternalObjects_Push

{$If not defined(NoScripts)}
procedure Tkw_PrimContents_Control_lstExternalObjects_Push.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString('lstExternalObjects');
 inherited;
end;//Tkw_PrimContents_Control_lstExternalObjects_Push.DoDoIt
{$IfEnd} //not NoScripts

type
  Tkw_PrimContents_Control_ContentsTree = class(TtfwControlString)
   {* ����� ������� ��� �������������� �������� ContentsTree
----
*������ �������������*:
[code]
�������::ContentsTree TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimContents_Control_ContentsTree

// start class Tkw_PrimContents_Control_ContentsTree

{$If not defined(NoScripts)}
function Tkw_PrimContents_Control_ContentsTree.GetString: AnsiString;
 {-}
begin
 Result := 'ContentsTree';
end;//Tkw_PrimContents_Control_ContentsTree.GetString
{$IfEnd} //not NoScripts

type
  Tkw_PrimContents_Control_ContentsTree_Push = class(TkwBynameControlPush)
   {* ����� ������� ��� �������� ContentsTree
----
*������ �������������*:
[code]
�������::ContentsTree:push pop:control:SetFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimContents_Control_ContentsTree_Push

// start class Tkw_PrimContents_Control_ContentsTree_Push

{$If not defined(NoScripts)}
procedure Tkw_PrimContents_Control_ContentsTree_Push.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString('ContentsTree');
 inherited;
end;//Tkw_PrimContents_Control_ContentsTree_Push.DoDoIt
{$IfEnd} //not NoScripts

type
  Tkw_PrimContents_Control_ContextFilter = class(TtfwControlString)
   {* ����� ������� ��� �������������� �������� ContextFilter
----
*������ �������������*:
[code]
�������::ContextFilter TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimContents_Control_ContextFilter

// start class Tkw_PrimContents_Control_ContextFilter

{$If not defined(NoScripts)}
function Tkw_PrimContents_Control_ContextFilter.GetString: AnsiString;
 {-}
begin
 Result := 'ContextFilter';
end;//Tkw_PrimContents_Control_ContextFilter.GetString
{$IfEnd} //not NoScripts

type
  Tkw_PrimContents_Control_ContextFilter_Push = class(TkwBynameControlPush)
   {* ����� ������� ��� �������� ContextFilter
----
*������ �������������*:
[code]
�������::ContextFilter:push pop:control:SetFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimContents_Control_ContextFilter_Push

// start class Tkw_PrimContents_Control_ContextFilter_Push

{$If not defined(NoScripts)}
procedure Tkw_PrimContents_Control_ContextFilter_Push.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString('ContextFilter');
 inherited;
end;//Tkw_PrimContents_Control_ContextFilter_Push.DoDoIt
{$IfEnd} //not NoScripts

type
  Tkw_PrimContents_Control_Tasks = class(TtfwControlString)
   {* ����� ������� ��� �������������� �������� Tasks
----
*������ �������������*:
[code]
�������::Tasks TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimContents_Control_Tasks

// start class Tkw_PrimContents_Control_Tasks

{$If not defined(NoScripts)}
function Tkw_PrimContents_Control_Tasks.GetString: AnsiString;
 {-}
begin
 Result := 'Tasks';
end;//Tkw_PrimContents_Control_Tasks.GetString
{$IfEnd} //not NoScripts

type
  Tkw_PrimContents_Control_Tasks_Push = class(TkwBynameControlPush)
   {* ����� ������� ��� �������� Tasks
----
*������ �������������*:
[code]
�������::Tasks:push pop:control:SetFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimContents_Control_Tasks_Push

// start class Tkw_PrimContents_Control_Tasks_Push

{$If not defined(NoScripts)}
procedure Tkw_PrimContents_Control_Tasks_Push.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString('Tasks');
 inherited;
end;//Tkw_PrimContents_Control_Tasks_Push.DoDoIt
{$IfEnd} //not NoScripts

procedure TPrimContentsForm.GetContentsListItem(Sender: TObject;
  Index: Integer;
  var ItemString: Il3CString);
//#UC START# *4D2DE4040157_4979DFB700F8_var*
//#UC END# *4D2DE4040157_4979DFB700F8_var*
begin
//#UC START# *4D2DE4040157_4979DFB700F8_impl*
 if (BaseContents = nil) then
  ItemString := l3CStr('')
 else
  ItemString := nsCStr(BaseContents.ContentsListItem[CheckFilteredIndex(Sender, Index)]);
//#UC END# *4D2DE4040157_4979DFB700F8_impl*
end;//TPrimContentsForm.GetContentsListItem

procedure TPrimContentsForm.InitLists;
//#UC START# *4D2DEC970359_4979DFB700F8_var*
var
 l_Tree: InsContentsTree;
//#UC END# *4D2DEC970359_4979DFB700F8_var*
begin
//#UC START# *4D2DEC970359_4979DFB700F8_impl*
 //Tasks.Visible := false;
 with Tasks do
 begin
  GroupImages := dmMainMenuNew.ilSmallIcons;
  CollapseGroupImage := 1;
  ExpandGroupImage := 0;
  ImageList := dmStdRes.SmallImageList;
  GroupColor := cGarant2011GradientStartColor{c_MainMenuColor};
 end;//with Tasks

 lstBookmarks.BorderStyle := bsNone;
 lstComments.BorderStyle := bsNone;
 lstExternalObjects.BorderStyle := bsNone;

 lstBookmarks.UseStyleTable := true;
 lstComments.UseStyleTable := true;
 lstExternalObjects.UseStyleTable := true;
 
 lstBookmarks.MultiStrokeItem := ContentsTree.MultiStrokeItem;
 lstComments.MultiStrokeItem := ContentsTree.MultiStrokeItem;
 lstExternalObjects.MultiStrokeItem := ContentsTree.MultiStrokeItem;

 CheckActionElementMode;

 if (BaseContents = nil) then
 begin
  lstBookmarks.Visible := false;
  lstComments.Visible := false;
  lstExternalObjects.Visible := false;
  ContentsTree.Visible := false;
 end//BaseContents = nil
 else
 begin
  if (BaseContents.Bookmarks = nil) then
   lstBookmarks.Total := 0
  else
   lstBookmarks.Total := BaseContents.Bookmarks.Count;
  if (BaseContents.Comments = nil) then
   lstComments.Total := 0
  else
   lstComments.Total := BaseContents.Comments.Count;
  if (BaseContents.ExternalObjects = nil) then
   lstExternalObjects.Total := 0
  else
   lstExternalObjects.Total := BaseContents.ExternalObjects.Count;

  lstBookmarks.Visible := (lstBookmarks.Total > 0);
  lstComments.Visible := (lstComments.Total > 0);
  lstExternalObjects.Visible := (lstExternalObjects.Total > 0);

  lstBookmarks.Align := alBottom;
  lstComments.Align := alBottom;
  lstExternalObjects.Align := alBottom;

  lstBookmarks.OnGetStrItem := GetContentsListItem;
  lstComments.OnGetStrItem := GetContentsListItem;
  lstExternalObjects.OnGetStrItem := GetContentsListItem;

  lstBookmarks.Images := BaseContents.ImageList.Hack;
  lstComments.Images := BaseContents.ImageList.Hack;
  lstExternalObjects.Images := BaseContents.ImageList.Hack;

  lstBookmarks.OnGetItemImageIndex := GetBookmarksItemImage;
  lstComments.OnGetItemImageIndex := GetCommentsItemImage;
  lstExternalObjects.OnGetItemImageIndex := GetExternalObjectsItemImage;

  lstBookmarks.OnActionElement := ContentsListActionElement;
  lstComments.OnActionElement := ContentsListActionElement;
  lstExternalObjects.OnActionElement := ContentsListActionElement;

  lstBookmarks.OnCurrentChanged := ContentsListCurrentChanged;
  lstComments.OnCurrentChanged := ContentsListCurrentChanged;
  lstExternalObjects.OnCurrentChanged := ContentsListCurrentChanged;

  with ContentsTree do
  begin
   Images := BaseContents.ImageList.Hack;
   if not Supports(TreeStruct, InsContentsTree, l_Tree) OR
      l_Tree.RootResetted then
   begin
    TreeStruct := BaseContents.SimpleTree;
    ExpandFirstLevel;
    Invalidate;
   end;//not Supports(TreeStruct, InsContentsTree, l_Tree)
  end;//with ContentsTree
  if (not Dispatcher.History.InBF) and ((f_ContextFilterDocInfo = nil) or
   ((f_ContextFilterDocInfo <> nil) and (not f_ContextFilterDocInfo.IsSame(BaseContents.DocInfo)))) then
  begin
   ContextFilter.AssignState(BaseContents.CurrentContextFilter);
   f_ContextFilterDocInfo := BaseContents.DocInfo;
  end;
  ContentsTree.Visible := (ContentsTree.Total > 0);
  Tasks.TasksPanel :=
   TnscTasksPanel.Make(ClassName,
                       [
                        TnscTasksPanelGroupDesc_C(@str_cgContents, ContentsTree),
                        TnscTasksPanelGroupDesc_C(@str_cgBookmarks, lstBookmarks),
                        TnscTasksPanelGroupDesc_C(@str_cgComments, lstComments),
                        TnscTasksPanelGroupDesc_C(@str_cgExternalObjects, lstExternalObjects)
                       ]);
  Tasks.MakeTasksPanel;
  Tasks.Visible := true;
  Tasks.Align := alClient;
 end;//BaseContents = nil
 Op_DocumentSubPanel_UpdateSubPanel.Call(Aggregate);
//#UC END# *4D2DEC970359_4979DFB700F8_impl*
end;//TPrimContentsForm.InitLists

function TPrimContentsForm.GetBookmarksItemImage(Sender: TObject;
  Index: Integer): Integer;
//#UC START# *4D2EDE4E0338_4979DFB700F8_var*
//#UC END# *4D2EDE4E0338_4979DFB700F8_var*
begin
//#UC START# *4D2EDE4E0338_4979DFB700F8_impl*
 Result := diilBookmarkIcon;
//#UC END# *4D2EDE4E0338_4979DFB700F8_impl*
end;//TPrimContentsForm.GetBookmarksItemImage

function TPrimContentsForm.GetCommentsItemImage(Sender: TObject;
  Index: Integer): Integer;
//#UC START# *4D2EDE8C005E_4979DFB700F8_var*
//#UC END# *4D2EDE8C005E_4979DFB700F8_var*
begin
//#UC START# *4D2EDE8C005E_4979DFB700F8_impl*
 Result := diilUserCommentIcon;
//#UC END# *4D2EDE8C005E_4979DFB700F8_impl*
end;//TPrimContentsForm.GetCommentsItemImage

function TPrimContentsForm.GetExternalObjectsItemImage(Sender: TObject;
  Index: Integer): Integer;
//#UC START# *4D2EDEBF001D_4979DFB700F8_var*
var
 l_D : TExternalObjectData;
//#UC END# *4D2EDEBF001D_4979DFB700F8_var*
begin
//#UC START# *4D2EDEBF001D_4979DFB700F8_impl*
 Result := -1;
 Index := CheckFilteredIndex(Sender, Index).rIndex;
 if (BaseContents.ExternalObjects <> nil) AND
    (Index < BaseContents.ExternalObjects.Count)  then
 begin
  BaseContents.ExternalObjects.pm_GetItem(Index, l_D);
  Case l_D.rType of
   EOT_PIC: // �������� � ������� BMP
    Result := diilPictureIcon;
   EOT_JPG:
    Result := diilPictureIcon;
   EOT_PNG:
    Result := diilPictureIcon;
   EOT_GIF:
    Result := diilPictureIcon;
   EOT_RTF, EOT_DOC, EOT_DOCX: // ��������� Word, http://mdp.garant.ru/pages/viewpage.action?pageId=346757718
    Result := diilRTF;
   EOT_XLS, EOT_XLSX: // ������� � ������� XLS
    Result := diilExcel;
   EOT_MP3:
    Result := diilMusic;
   EOT_EVD:
    Result := diilDocumentIcon;
   EOT_TIF:
    Result := diilPictureIcon;
   EOT_PDF:
    Result := diilAcrobat;
   EOT_PPT: // ����� PowerPoint
    Result := diilPictureIcon;
   EOT_CDR: // ����� CorelDraw
    Result := diilPictureIcon;
   EOT_XML, EOT_XSD: // �������� XML
    Result := diilXMLIcon;
   else
    Result := diilUSRIcon;
  end;//Case l_D.rType
 end;//BaseContents.ExternalObjects <> nil
//#UC END# *4D2EDEBF001D_4979DFB700F8_impl*
end;//TPrimContentsForm.GetExternalObjectsItemImage

procedure TPrimContentsForm.ContentsListActionElement(Sender: TObject;
  Index: Integer);
//#UC START# *4D2EE8650170_4979DFB700F8_var*
//#UC END# *4D2EE8650170_4979DFB700F8_var*
begin
//#UC START# *4D2EE8650170_4979DFB700F8_impl*
 DoContentsListActionElement(Sender, Index, true);
//#UC END# *4D2EE8650170_4979DFB700F8_impl*
end;//TPrimContentsForm.ContentsListActionElement

procedure TPrimContentsForm.ContentsListCurrentChanged(Sender: TObject;
  aNewCurrent: Integer;
  aOldCurrent: Integer);
//#UC START# *4D2EECA201F1_4979DFB700F8_var*
//#UC END# *4D2EECA201F1_4979DFB700F8_var*
begin
//#UC START# *4D2EECA201F1_4979DFB700F8_impl*
 if (aOldCurrent <> -1) and
    (aOldCurrent <> aNewCurrent) then
  DoContentsListActionElement(Sender, aNewCurrent, false);
//#UC END# *4D2EECA201F1_4979DFB700F8_impl*
end;//TPrimContentsForm.ContentsListCurrentChanged

procedure TPrimContentsForm.ContextFilterChange(Sender: TObject);
//#UC START# *4D3719CB031B_4979DFB700F8_var*
var
 l_Filtered: Il3SimpleTree;
 l_Node: Il3SimpleNode;
 l_NewNodeIndex: Integer;
 l_LFF : IListForFiltering;
 l_ListType : TnsContentsListType;
//#UC END# *4D3719CB031B_4979DFB700F8_var*
var
 l_CF : IContextFilter;
begin
//#UC START# *4D3719CB031B_4979DFB700F8_impl*
 if (BaseContents <> nil) then
 begin
  Inc(f_InternalPositioning);
  try
   // - ��� ����� ����������� ������
   l_CF := defDataAdapter.NativeAdapter.MakeContextFilter;
   if TnsFilterableTreeStruct.
       FillContextFilter(l_CF,
                         TnsContextFilterParams.Make(gi_cpContents),
                         ContextFilter.Context) then
   begin
    for l_ListType := Low(TnsContentsListType) to High(TnsContentsListType) do
    begin
     if f_ListForFiltering[l_ListType].Visible then
     begin
      l_LFF := TnsContentsListForFiltering.Make(l_ListType, BaseContents);
      l_CF.Filtrate(l_LFF, f_Filtered[l_ListType]);
      if (f_Filtered[l_ListType] = nil) then
       f_ListForFiltering[l_ListType].Total := 0
      else
       f_ListForFiltering[l_ListType].Total := f_Filtered[l_ListType].Count;
     end;//f_ListForFiltering[l_ListType].Visible
    end;//for l_ListType
   end//TnsFilterableTreeStruct.FillContextFilter
   else
   begin
    Finalize(f_Filtered);
    for l_ListType := Low(TnsContentsListType) to High(TnsContentsListType) do
     if f_ListForFiltering[l_ListType].Visible then
      f_ListForFiltering[l_ListType].Total := BaseContents.ContentsListCount[l_ListType];
   end;//TnsFilterableTreeStruct.FillContextFilter
   // - ��������� ����������� ������
   l_Node := ContentsTree.GetCurrentNode;
   try
    l_Filtered := BaseContents.FiltrateByContext(ContentsTree.TreeStruct, l_Node,
     ContextFilter.MakeState, l_NewNodeIndex);
    if Assigned(l_Filtered) and (l_Filtered.CountView > 0) then
    begin
     // ��� Changing/Changed ������ ����������������. �-135598249
     ContentsTree.Changing;
     try
      ContentsTree.TreeStruct := l_Filtered;
      if (l_Node <> nil) then
       ContentsTree.GotoOnNode(l_Node);
     finally
      ContentsTree.Changed;
     end;//try..finally
     // ���� ���� ������� ������ �� ����� ������ ������� ����. �-135598249
     if not ContentsTree.GetCurrentNode.IsSame(l_Node) then
      ContentsTree.Current := 0;
    end;//Assigned(l_Filtered)
   finally
    l_Node := nil;
   end;//try..finally
  finally
   Dec(f_InternalPositioning);
  end;//try..finally
  SendSynchroMessage(ContentsTree.TreeView.Current);
 end;//BaseContents <> nil
 Op_DocumentSubPanel_UpdateSubPanel.Call(Aggregate);
//#UC END# *4D3719CB031B_4979DFB700F8_impl*
end;//TPrimContentsForm.ContextFilterChange

procedure TPrimContentsForm.ContextFilterWrongContext(Sender: TObject);
//#UC START# *4D371A00001E_4979DFB700F8_var*
//#UC END# *4D371A00001E_4979DFB700F8_var*
begin
//#UC START# *4D371A00001E_4979DFB700F8_impl*
 nsBeepWrongContext;
//#UC END# *4D371A00001E_4979DFB700F8_impl*
end;//TPrimContentsForm.ContextFilterWrongContext

procedure TPrimContentsForm.ContentsTreeNewCharPressed(aChar: AnsiChar);
//#UC START# *4D371DC703BB_4979DFB700F8_var*
//#UC END# *4D371DC703BB_4979DFB700F8_var*
begin
//#UC START# *4D371DC703BB_4979DFB700F8_impl*
 ContextFilter.PressChar(aChar);
//#UC END# *4D371DC703BB_4979DFB700F8_impl*
end;//TPrimContentsForm.ContentsTreeNewCharPressed

procedure TPrimContentsForm.ContentsTreeCurrentChanged(Sender: TObject;
  NewCurrent: Integer;
  OldCurrent: Integer);
//#UC START# *4D372007016B_4979DFB700F8_var*
//#UC END# *4D372007016B_4979DFB700F8_var*
begin
//#UC START# *4D372007016B_4979DFB700F8_impl*
 if (OldCurrent <> -1) and
    (OldCurrent <> NewCurrent) then
  SendSynchroMessage(NewCurrent);
//#UC END# *4D372007016B_4979DFB700F8_impl*
end;//TPrimContentsForm.ContentsTreeCurrentChanged

function TPrimContentsForm.ContentsTreeGetItemImage(Sender: TObject;
  Index: Integer;
  var aImages: TCustomImageList): Integer;
//#UC START# *4D37206D034E_4979DFB700F8_var*
const
 nsContentObjectItem = [cltRTF, cltMP3, cltXLS, cltEVD, cltPDF];
  {* �������� ��������� ���������� ���������. }
var
 l_ChildNode : IeeNode;
 l_Node      : IeeNode;
 l_ItemType  : TnsContentItem;
//#UC END# *4D37206D034E_4979DFB700F8_var*
begin
//#UC START# *4D37206D034E_4979DFB700F8_impl*
 Result := -1;
 l_Node := ContentsTree.TreeView.GetNode(Index);
 try
  case ContentItemType(l_Node) of
   cltNone :
    begin
     if l_Node.HasChild then
     begin
      l_ChildNode := l_Node.ChildNode;
      try
       l_ItemType := ContentItemType(l_ChildNode);
       case l_ItemType of
        cltNone:
         Result := diilFolderIcon;
        cltBlock:
         Result := diilSubAndBlockIcon;
        cltBookmark:
         Result := diilFolderIcon;
        cltUserComment:
         Result := diilFolderIcon;
        cltPictureLink, cltPicture :
         Result := diilPictureFolderIcon;
        else
         if l_ItemType in nsContentObjectItem then
          Result := diilObjectFolderIcon
         else
          Assert(False);
       end//case ContentItemType(l_ChildNode) of
      finally
       l_ChildNode := nil;
      end;
     end
     else
      if l_Node.GetLevelForParent(ContentsTree.TreeView.Tree.Root) = 1 then
       Result := diilFolderIcon
      else
       Result := diilDocumentIcon;
    end;
   cltBlock:
    if l_Node.ID = 0 then
     Result := diilDocumentIcon
    else
     Result := diilSubAndBlockIcon;
   cltBookmark:
    Result := diilBookmarkIcon;
   cltUserComment:
    Result := diilUserCommentIcon;
   cltPicture:
    Result := diilPictureIcon;
   cltPictureLink:
    Result := diilPictureLinkIcon;
   cltMP3:
    Result := diilMusic;
   cltRTF:
    Result := diilRTF;
   cltXLS:
    Result := diilExcel;
   cltEVD:
    Result := diilDocumentIcon;
   cltPDF:
    Result := diilAcrobat;
   else
    Assert(False);
  end;//case ContentItemType(l_Node) of
 finally
  l_Node := nil;
 end;//try..finally
//#UC END# *4D37206D034E_4979DFB700F8_impl*
end;//TPrimContentsForm.ContentsTreeGetItemImage

procedure TPrimContentsForm.ContentsTreeTreeChanged(aSender: TObject;
  const anOldTree: Il3SimpleTree;
  const aNewTree: Il3SimpleTree);
//#UC START# *4D3720A5030E_4979DFB700F8_var*
//#UC END# *4D3720A5030E_4979DFB700F8_var*
begin
//#UC START# *4D3720A5030E_4979DFB700F8_impl*
 if (anOldTree <> nil) then
  anOldTree.Unsubscribe(InsTreeDataListener(Self));
 if (aNewTree <> nil) then
  aNewTree.Subscribe(InsTreeDataListener(Self));
 {$IfDef vcmUseProfilers}
 // �������� ������ ���������� �� �������� ���������:
 if not f_FirstCurrentChanged then
 begin
  ProfilersManager.Document.ContentsTreeOpened;
  f_FirstCurrentChanged := True;
 end;//not f_FirstCurrentChanged
 {$EndIf vcmUseProfilers}
 if (aNewTree <> nil) then
  ExpandFirstLevel;
//#UC END# *4D3720A5030E_4979DFB700F8_impl*
end;//TPrimContentsForm.ContentsTreeTreeChanged

procedure TPrimContentsForm.ContentsTreeActionElement(Sender: TObject;
  Index: Integer);
//#UC START# *4D3720DE0381_4979DFB700F8_var*
//#UC END# *4D3720DE0381_4979DFB700F8_var*
begin
//#UC START# *4D3720DE0381_4979DFB700F8_impl*
 SendSynchroMessage(ContentsTree.TreeView.Current);
 FloatingHide;
//#UC END# *4D3720DE0381_4979DFB700F8_impl*
end;//TPrimContentsForm.ContentsTreeActionElement

procedure TPrimContentsForm.ContentsTreeMakeTreeSource(out theTree: Il3SimpleTree);
//#UC START# *4D37210000EE_4979DFB700F8_var*
//#UC END# *4D37210000EE_4979DFB700F8_var*
begin
//#UC START# *4D37210000EE_4979DFB700F8_impl*
 if (SimpleTree <> nil) then
  theTree := SimpleTree.SimpleTree
 else
  theTree := nil;
//#UC END# *4D37210000EE_4979DFB700F8_impl*
end;//TPrimContentsForm.ContentsTreeMakeTreeSource

procedure TPrimContentsForm.ContentsTreeRootChanged(aSender: TObject;
  const anOldRoot: IeeNode;
  const aNewRoot: IeeNode);
//#UC START# *4D372122006B_4979DFB700F8_var*

(* function lp_FindBlockOrSub(const anIntf: IeeNode): Boolean;
 begin//lp_FindBlockOrSub
  Result := IsNodeBlockOrSub(anIntf);
 end;//lp_FindBlockOrSub*)

var
 l_Tree: InsContentsTree;
//#UC END# *4D372122006B_4979DFB700F8_var*
begin
//#UC START# *4D372122006B_4979DFB700F8_impl*
 // ������ ����� TreeStruct ����� nil � ����������� � ���� ��������� ������� ��� ��������...
 if aNewRoot = nil then
  Exit;
(* Supports(ContentsTree.TreeView.Tree.IterateF(eeL2NA(@lp_FindBlockOrSub),
                                              imCheckResult or imOneLevel),
          Il3SimpleNode,
          f_ContentsNode);*)
 if Supports(ContentsTree.TreeStruct, InsContentsTree, l_Tree) then
 begin
  if l_Tree.RootResetted then
   ExpandFirstLevel;
  l_Tree.DataReceived;
 end;//Supports(ContentsTree.TreeStruct, InsContentsTree, l_Tree)
//#UC END# *4D372122006B_4979DFB700F8_impl*
end;//TPrimContentsForm.ContentsTreeRootChanged

function TPrimContentsForm.CheckFilteredIndex(aSender: TObject;
  anIndex: Integer): TnsContentsListIndex;
//#UC START# *4D40508101A1_4979DFB700F8_var*
var
 l_Index : TnsContentsListType;
//#UC END# *4D40508101A1_4979DFB700F8_var*
begin
//#UC START# *4D40508101A1_4979DFB700F8_impl*
 Result.rIndex := anIndex;
 Byte(Result.rListType) := 255; 
 for l_Index := Low(TnsContentsListType) to High(TnsContentsListType) do
  if (f_ListForFiltering[l_Index] = aSender) then
  begin
   Result.rListType := l_Index;
   break;
  end;//f_ListForFiltering[l_Index] = aSender
 Assert(Byte(Result.rListType) <= Ord(High(TnsContentsListType)));
 if (f_Filtered[Result.rListType] <> nil) then
 begin
  Assert(Result.rIndex < f_Filtered[Result.rListType].Count);
  Result.rIndex  := f_Filtered[Result.rListType].Items[Result.rIndex];
 end;//f_Filtered[Result.rListType] <> nil
//#UC END# *4D40508101A1_4979DFB700F8_impl*
end;//TPrimContentsForm.CheckFilteredIndex

procedure TPrimContentsForm.GetIsContextWrong(aSender: TObject;
  var IsWrong: Boolean);
//#UC START# *4D42A67803C6_4979DFB700F8_var*
var
 l_Index : TnsContentsListType;
 l_SomeListVisible : Boolean;
//#UC END# *4D42A67803C6_4979DFB700F8_var*
begin
//#UC START# *4D42A67803C6_4979DFB700F8_impl*
 if IsWrong then
 begin
  for l_Index := Low(l_Index) to High(l_Index) do
   if f_ListForFiltering[l_Index].Visible AND
      (f_ListForFiltering[l_Index].Total > 0) then
   begin
    IsWrong := false;
    Exit;
   end;//f_ListForFiltering[l_Index].Visible
 end//IsWrong
 else
 begin
  if ContentsTree.Visible AND (ContentsTree.Total > 0) then
  // http://mdp.garant.ru/pages/viewpage.action?pageId=265396831
  // - ���� � ���������� �� ������ - ������ �� ���� � ��������
   Exit;
  l_SomeListVisible := false;
  for l_Index := Low(l_Index) to High(l_Index) do
   if f_ListForFiltering[l_Index].Visible then
   begin
    l_SomeListVisible := true;
    break;
   end;//f_ListForFiltering[l_Index].Visible
  if l_SomeListVisible then
  begin
   for l_Index := Low(l_Index) to High(l_Index) do
    if f_ListForFiltering[l_Index].Visible AND
       (f_ListForFiltering[l_Index].Total > 0) then
     Exit;
   IsWrong := true;
  end;//l_SomeListVisible
 end;//IsWrong
//#UC END# *4D42A67803C6_4979DFB700F8_impl*
end;//TPrimContentsForm.GetIsContextWrong

procedure TPrimContentsForm.DoContentsListActionElement(Sender: TObject;
  Index: Integer;
  aNeedClose: Boolean);
//#UC START# *4E7B3A8F00D6_4979DFB700F8_var*
//#UC END# *4E7B3A8F00D6_4979DFB700F8_var*
begin
//#UC START# *4E7B3A8F00D6_4979DFB700F8_impl*
 Op_Document_SetPosition.Call(Aggregate,
                              BaseContents.
                               ContentsListParaID[CheckFilteredIndex(Sender, Index)],
                              dptPara,
                              TextFormUserType);
 if aNeedClose then
  FloatingHide;                             
//#UC END# *4E7B3A8F00D6_4979DFB700F8_impl*
end;//TPrimContentsForm.DoContentsListActionElement

function TPrimContentsForm.FloatingHide: Boolean;
//#UC START# *4E7B3D1A016A_4979DFB700F8_var*
var
 l_P : TafwCustomForm;
//#UC END# *4E7B3D1A016A_4979DFB700F8_var*
begin
//#UC START# *4E7B3D1A016A_4979DFB700F8_impl*
 Result := false;
 if IsFloatingState then
 begin
  l_P := afw.GetAnotherParentForm(Self);
  Assert(l_P <> nil);
  if (l_P <> nil) then
  begin
   l_P.Hide;
   StoreFloatingVisible(l_P.Visible);
   Result := true;
  end;//l_P <> nil
 end;//IsFloatingState
//#UC END# *4E7B3D1A016A_4979DFB700F8_impl*
end;//TPrimContentsForm.FloatingHide

procedure TPrimContentsForm.CheckFocus;
//#UC START# *4E7B450302F4_4979DFB700F8_var*
//#UC END# *4E7B450302F4_4979DFB700F8_var*
begin
//#UC START# *4E7B450302F4_4979DFB700F8_impl*
 if Self.FloatingVisible then
  if not Focused then
   if CanFocus then
   begin
    SetFocus;
    if ContentsTree.Visible AND ContentsTree.CanFocus then
     ContentsTree.SetFocus
    else
    if lstBookmarks.Visible AND lstBookmarks.CanFocus then
     lstBookmarks.SetFocus
    else
    if lstExternalObjects.Visible AND lstExternalObjects.CanFocus then
     lstExternalObjects.SetFocus
    else
    if lstComments.Visible AND lstComments.CanFocus then
     lstComments.SetFocus;
   end;//CanFocus
//#UC END# *4E7B450302F4_4979DFB700F8_impl*
end;//TPrimContentsForm.CheckFocus

procedure TPrimContentsForm.CheckActionElementMode;
//#UC START# *4E7B486801E4_4979DFB700F8_var*
//#UC END# *4E7B486801E4_4979DFB700F8_var*
begin
//#UC START# *4E7B486801E4_4979DFB700F8_impl*
 if IsFloatingState then
 begin
  ContentsTree.ActionElementMode := l3_amDoubleClick;
  lstBookmarks.ActionElementMode := l3_amDoubleClick;
  lstComments.ActionElementMode := l3_amDoubleClick;
  lstExternalObjects.ActionElementMode := l3_amDoubleClick;
 end//IsFloatingState
 else
 begin
  ContentsTree.ActionElementMode := l3_amSecondSingleClick;
  lstBookmarks.ActionElementMode := l3_amSecondSingleClick;
  lstComments.ActionElementMode := l3_amSecondSingleClick;
  lstExternalObjects.ActionElementMode := l3_amSecondSingleClick;
 end;//IsFloatingState
//#UC END# *4E7B486801E4_4979DFB700F8_impl*
end;//TPrimContentsForm.CheckActionElementMode

procedure TPrimContentsForm.StoreFloatingVisible(aValue: Boolean);
//#UC START# *4E7B54800149_4979DFB700F8_var*
//#UC END# *4E7B54800149_4979DFB700F8_var*
begin
//#UC START# *4E7B54800149_4979DFB700F8_impl*
 Self.FloatingVisible := aValue;
//#UC END# *4E7B54800149_4979DFB700F8_impl*
end;//TPrimContentsForm.StoreFloatingVisible

function TPrimContentsForm.FindSubByID(anID: Integer): Il3SimpleNode;

 function IsSubValid(const aNode: Il3SimpleNode): Boolean;
 //#UC START# *4A9D4CD30114__var*
//#UC END# *4A9D4CD30114__var*
 var
  l_Sub : IevSub;
 begin
 //#UC START# *4A9D4CD30114__impl*
  Result := Supports(aNode, IevSub, l_Sub) and
            (l_Sub.LayerID = ev_sbtSub) and
            (l_Sub.ID = anID);
 //#UC END# *4A9D4CD30114__impl*
 end;//IsSubValid

//#UC START# *4A9D4CAB00DD_4979DFB700F8_var*
//#UC END# *4A9D4CAB00DD_4979DFB700F8_var*
var
 l_Tree : InsContentsTree;
 l_CurrentNode : Il3SimpleNode;
begin
//#UC START# *4A9D4CAB00DD_4979DFB700F8_impl*
 l_CurrentNode := ContentsTree.GetCurrentNode;
 if IsSubValid(l_CurrentNode) then
  Result := l_CurrentNode
 else
 if Supports(ContentsTree.TreeStruct, InsContentsTree, l_Tree) then
  Result := l_Tree.FindBlock(anID)
 else
  Result := nil;
//#UC END# *4A9D4CAB00DD_4979DFB700F8_impl*
end;//TPrimContentsForm.FindSubByID

function TPrimContentsForm.IsMultiSelection: Boolean;
//#UC START# *4C2AE9B7021E_4979DFB700F8_var*
//#UC END# *4C2AE9B7021E_4979DFB700F8_var*
begin
//#UC START# *4C2AE9B7021E_4979DFB700F8_impl*
 Result := ContentsTree.TreeView.Tree.SelectedCount > 1;
//#UC END# *4C2AE9B7021E_4979DFB700F8_impl*
end;//TPrimContentsForm.IsMultiSelection

procedure TPrimContentsForm.FillCRList(const aParams: IvcmTestParamsPrim);
//#UC START# *4C2AEAB600F4_4979DFB700F8_var*
//#UC END# *4C2AEAB600F4_4979DFB700F8_var*
var
 l_List : IvcmNodes;
begin
//#UC START# *4C2AEAB600F4_4979DFB700F8_impl*
 l_List := aParams.Op.SubNodes;
 if (l_List <> nil) then
 begin
  l_List.PlainLevel := 2;
  l_List.Clear;
  l_List.Add(DefDataAdapter.CRSimpleListTypeRootNode);
(*  l_Root := DefDataAdapter.CRSimpleListTypeRootNode;
  if (l_Root <> nil) then
  begin
   l_Child := l_Root.ChildNode;
   while (l_Child <> nil) do
   begin
    l_List.Add(l_Child);
    if l_Child.IsLast then
     break;
    l_Child := l_Child.NextNode;
   end;//l_Child <> nil
  end;//l_Root <> nil*)
 end;//l_List <> nil
//#UC END# *4C2AEAB600F4_4979DFB700F8_impl*
end;//TPrimContentsForm.FillCRList

procedure TPrimContentsForm.EnDocumentBlockTest(const aParams: IvcmTestParamsPrim;
  AllowMultiSelect: Boolean);
//#UC START# *4C2AF3B20159_4979DFB700F8_var*
//#UC END# *4C2AF3B20159_4979DFB700F8_var*
begin
//#UC START# *4C2AF3B20159_4979DFB700F8_impl*
 if IsMultiSelection then
  aParams.Op.Flag[vcm_ofEnabled] := AllowMultiSelect
 else
  aParams.Op.Flag[vcm_ofEnabled] := IsCurrentBlockOrSub;
//#UC END# *4C2AF3B20159_4979DFB700F8_impl*
end;//TPrimContentsForm.EnDocumentBlockTest

function TPrimContentsForm.MakePositionList(const aNode: IeeNode = nil): IPositionList;
//#UC START# *4C2AF5150266_4979DFB700F8_var*
var
 l_Node : IeeNode;
 l_Pos: DocumentUnit.TPosition;
//#UC END# *4C2AF5150266_4979DFB700F8_var*
begin
//#UC START# *4C2AF5150266_4979DFB700F8_impl*
 if (aNode = nil) then
  l_Node := ContentsTree.TreeView.CurrentNode
 else
  l_Node := aNode;
 if (l_Node <> nil) then
 begin
  Result := defDataAdapter.NativeAdapter.MakePositionList;
  with l_Pos do
  begin
   rType := PT_SUB;
   rPoint := l_Node.ID;
  end;
  Result.Add(l_Pos);
 end
 else
  Result := nil;
//#UC END# *4C2AF5150266_4979DFB700F8_impl*
end;//TPrimContentsForm.MakePositionList

function TPrimContentsForm.IsCurrentBlockOrSub: Boolean;
//#UC START# *4C2AF7D60169_4979DFB700F8_var*
//#UC END# *4C2AF7D60169_4979DFB700F8_var*
begin
//#UC START# *4C2AF7D60169_4979DFB700F8_impl*
 if (ContentsTree.Total <= 0) then
  Result := false
 else
  Result := true{IsNodeBlockOrSub(ContentsTree.TreeView.CurrentNode)};
 // - ���� � ���������� ������ ����� ��� ����, ����� ����� �� ������� �����
 //   �������������� - http://mdp.garant.ru/pages/viewpage.action?pageId=254938079&focusedCommentId=254943602#comment-254943602
 //   ��� �������� �� �����-�� "�� �� ���� ������.. �� ������ ���������..."
//#UC END# *4C2AF7D60169_4979DFB700F8_impl*
end;//TPrimContentsForm.IsCurrentBlockOrSub

function TPrimContentsForm.IsNodeBlockOrSub(const aNode: IeeNode): Boolean;

 function LpIsNodeBlockOrSub(const aNode: IeeNode): Boolean;
 //#UC START# *4C2AF8A4011C__var*
 //#UC END# *4C2AF8A4011C__var*
 var
  l_ChildNode : IeeNode;
 begin
 //#UC START# *4C2AF8A4011C__impl*
  case ContentItemType(aNode) of
   cltNone :
   begin
    if aNode.HasChild then
    begin
     l_ChildNode := aNode.ChildNode;
     try
      Result := ContentItemType(l_ChildNode) = cltBlock;
     finally
      l_ChildNode := nil;
     end;//try..finally
    end//aNode.HasChild
    else
     Result := false;
   end;//cltNone
   cltBlock:
    Result := true;
   else
    Result := false;
  end;//case ContentItemType(aNode
 //#UC END# *4C2AF8A4011C__impl*
 end;//LpIsNodeBlockOrSub

//#UC START# *4C2AF7F6023A_4979DFB700F8_var*
//#UC END# *4C2AF7F6023A_4979DFB700F8_var*
var
 l_Block : IevDocumentPart;
 l_Sub : IevDocumentPart;
begin
//#UC START# *4C2AF7F6023A_4979DFB700F8_impl*
 Result := (Supports(aNode, IevDocumentPart, l_Block) or
  (Supports(aNode, IevSub, l_Sub) and
  (l_Sub.LayerID = ev_sbtSub))) and lpIsNodeBlockOrSub(aNode);
//#UC END# *4C2AF7F6023A_4979DFB700F8_impl*
end;//TPrimContentsForm.IsNodeBlockOrSub

function TPrimContentsForm.ContentItemType(const aNode: IeeNode = nil): TnsContentItem;
//#UC START# *4C2AFA54035A_4979DFB700F8_var*
var
 l_Node: IeeNode;

 function lp_ItemObjectType: TnsContentItem;
 //var
  //l_DocTagNode: IDocTagNode;
  //l_Type: TExternalObjectType;
 begin
(*  if Supports(l_Node, IDocTagNode, l_DocTagNode) then
  try
   try
    l_Type := l_DocTagNode.GetExternalObjectType;
    case l_Type of
     EOT_RTF, EOT_DOC:
      Result := cltRTF;
     EOT_MP3:
      Result := cltMP3;
     EOT_XLS:
      Result := cltXLS;
     EOT_EVD:
      Result := cltEVD;
     EOT_PDF:
      Result := cltPDF;
     EOT_PIC, EOT_JPG, EOT_PNG, EOT_GIF, EOT_TIF, EOT_PPT, EOT_CDR:
      Result := cltPicture;
     else
      begin
       Result := cltRTF;
       Assert(False);
      end;//else
    end;//case l_DocTagNode.GetExternalObjectType of
   except
    on ECanNotFindData do
     Result := cltRTF;
   end;//try..except
  finally
   l_DocTagNode := nil;
  end//try..finally
  else*)
  begin
   Result := cltRTF;
   Assert(False);
  end;//Supports(l_Node, IDocTagNode, l_DocTagNode)
 end;//lp_ItemType

var
 l_Sub       : IevSub;
 l_TagWrap   : InevTag;
 l_Hyperlink : IevHyperlink;
//#UC END# *4C2AFA54035A_4979DFB700F8_var*
begin
//#UC START# *4C2AFA54035A_4979DFB700F8_impl*
 Result := cltNone;
 if (aNode = nil) and
    (ContentsTree.TreeView.Current >= 0) then
  l_Node := ContentsTree.TreeView.CurrentNode
 else
  l_Node := aNode;
 try
  try
   if Supports(l_Node, IevSub, l_Sub) then
    try
     case l_Sub.LayerID of
      ev_sbtSub:
       Result := cltBlock;
      ev_sbtBookmark:
       Result := cltBookmark;
      ev_sbtMark:
       Result := cltUserComment;
     end;//case l_Sub.LayerID of
    finally
     l_Sub := nil;
    end//try..finally
   else
    if Supports(l_Node, InevTag, l_TagWrap) then
     try
      if l_TagWrap.InheritsFrom(k2_idBitmapPara) then
       Result := cltPicture
      else
      begin
       if Supports(l_Node, IevHyperlink, l_Hyperlink) then
        try
         if l_Hyperlink.Address{$IfDef XE4}.rTafwAddress{$EndIf}.TypeID = CI_PIC then
          Result := cltPictureLink
         else
          Result := lp_ItemObjectType;
        finally
         l_Hyperlink := nil;
        end//try..finally
       else
        Result := lp_ItemObjectType;
      end;//l_TagWrap..InheritsFrom(ee_idBitmapPara)
     finally
      l_TagWrap := nil;
     end;//try..finally
  except
   on EIntfCastError do
    Result := cltNone;
  end;//try..except
 finally
  l_Node := nil;
 end;//try..finally
//#UC END# *4C2AFA54035A_4979DFB700F8_impl*
end;//TPrimContentsForm.ContentItemType

function TPrimContentsForm.BuildSelectionList: InevFlatSubsList;
//#UC START# *4C3B24C6008A_4979DFB700F8_var*
var
 l_Result: TnevFlatSubsList;

  function lp_Iterator(const aNode: Il3SimpleNode): Boolean;
  var
   l_Sub: IevSub;
   l_Node: INodeBase;
  begin
   Result := False;
   if Supports(aNode, INodeBase, l_Node) and l_Node.HasParentFlag(FM_SELECTION) then
    Exit;
   if Supports(aNode, IevSub, l_Sub) then
    l_Result.Add(l_Sub);
  end;//lpIterator

var
 l_Tree: Il3ExpandedSimpleTree;
//#UC END# *4C3B24C6008A_4979DFB700F8_var*
begin
//#UC START# *4C3B24C6008A_4979DFB700F8_impl*
 l_Result := TnevFlatSubsList.Make;
 try
  if Supports(ContentsTree.TreeStruct, Il3ExpandedSimpleTree, l_Tree) then
   l_Tree.FlagIterateF(l3L2SNA(@lp_Iterator), FM_SELECTION);
  if l_Result.Empty then
   Result := nil
  else
   Result := l_Result;
 finally
  FreeAndNil(l_Result);
 end;
//#UC END# *4C3B24C6008A_4979DFB700F8_impl*
end;//TPrimContentsForm.BuildSelectionList

function TPrimContentsForm.TextFormUserType: Byte;
//#UC START# *4C3B24EE0067_4979DFB700F8_var*
const
 cUserTypeMap: array [0 .. 1] of TvcmUserType = (dftDocument, dftDrug);
//#UC END# *4C3B24EE0067_4979DFB700F8_var*
begin
//#UC START# *4C3B24EE0067_4979DFB700F8_impl*
 Result := cUserTypeMap[UserType];
//#UC END# *4C3B24EE0067_4979DFB700F8_impl*
end;//TPrimContentsForm.TextFormUserType

function TPrimContentsForm.CanPrintBlock: Boolean;
//#UC START# *4C3B251A00EF_4979DFB700F8_var*
//#UC END# *4C3B251A00EF_4979DFB700F8_var*
begin
//#UC START# *4C3B251A00EF_4979DFB700F8_impl*
 Result := Assigned(afw) and Assigned(afw.Application.PrintManager) and
  afw.Application.PrintManager.CanPrint;
//#UC END# *4C3B251A00EF_4979DFB700F8_impl*
end;//TPrimContentsForm.CanPrintBlock

function TPrimContentsForm.CanPreview: Boolean;
//#UC START# *4C3B254A033F_4979DFB700F8_var*
//#UC END# *4C3B254A033F_4979DFB700F8_var*
begin
//#UC START# *4C3B254A033F_4979DFB700F8_impl*
 Result := (Printer.Printers.Count > 0) AND (ContentsTree.Total > 0)
//#UC END# *4C3B254A033F_4979DFB700F8_impl*
end;//TPrimContentsForm.CanPreview

function TPrimContentsForm.MakePreview: IafwDocumentPreview;
//#UC START# *4C87965D008F_4979DFB700F8_var*
var
 l_Painter: Il3HAFPainter;
//#UC END# *4C87965D008F_4979DFB700F8_var*
begin
//#UC START# *4C87965D008F_4979DFB700F8_impl*
 if (BaseContents <> nil) then
  l_Painter := TnsHAFPainter.Make(TevFormatHAFMacroReplacer.Make(TnsDocInfoHAFMacroReplacer.Make(nil, BaseContents.DocInfo), str_ContentsPrintTitle.AsCStr))
 else
  l_Painter := nil;
 Result := TnsDocumentPreview.Make(MakeEVD, evDefaultPreviewCacheKey, l_Painter);
//#UC END# *4C87965D008F_4979DFB700F8_impl*
end;//TPrimContentsForm.MakePreview

function TPrimContentsForm.MakeEVD: InevStorable;
//#UC START# *4C87968B002D_4979DFB700F8_var*
//#UC END# *4C87968B002D_4979DFB700F8_var*
begin
//#UC START# *4C87968B002D_4979DFB700F8_impl*
 Result := TnsContentsTreeStorable.Make(BaseContents.DocInfo.Doc,
                                        ContentsTree.TreeStruct,
                                        nil{ContentsTree.TreeStruct.RootNode.Child}{f_ContentsNode});
//#UC END# *4C87968B002D_4979DFB700F8_impl*
end;//TPrimContentsForm.MakeEVD

function TPrimContentsForm.CanPrint: Boolean;
//#UC START# *4C8796AE0140_4979DFB700F8_var*
//#UC END# *4C8796AE0140_4979DFB700F8_var*
begin
//#UC START# *4C8796AE0140_4979DFB700F8_impl*
 Result := CanPreview and Assigned(afw) and Assigned(afw.Application.PrintManager) and
  afw.Application.PrintManager.CanPrint;
//#UC END# *4C8796AE0140_4979DFB700F8_impl*
end;//TPrimContentsForm.CanPrint

function TPrimContentsForm.pm_GetBackgroundPanel: TvtPanel;
begin
 if (f_BackgroundPanel = nil) then
  f_BackgroundPanel := FindComponent('BackgroundPanel') As TvtPanel;
 Result := f_BackgroundPanel;
end;

function TPrimContentsForm.pm_GetContentsTree: TnscTreeView;
begin
 if (f_ContentsTree = nil) then
  f_ContentsTree := FindComponent('ContentsTree') As TnscTreeView;
 Result := f_ContentsTree;
end;

function TPrimContentsForm.pm_GetContextFilter: TnscContextFilter;
begin
 if (f_ContextFilter = nil) then
  f_ContextFilter := FindComponent('ContextFilter') As TnscContextFilter;
 Result := f_ContextFilter;
end;

procedure TPrimContentsForm.SendSynchroMessage(anIndex: Integer);
//#UC START# *4D2DA7CA00F6_4979DFB700F8_var*
var
 l_eeNode  : IeeNode;
 l_Sub     : IevSub;
 l_CurType : TDocumentPositionType;
 l_TagWrap : Ik2Tag;
//#UC END# *4D2DA7CA00F6_4979DFB700F8_var*
begin
//#UC START# *4D2DA7CA00F6_4979DFB700F8_impl*
 if (anIndex >= 0) AND
    not (f_InternalPositioning > 0) AND (Aggregate <> nil) then
 begin
  Inc(f_InternalPositioning);
  try
   l_eeNode := ContentsTree.TreeView.GetNode(anIndex);
   if Supports(l_eeNode, IevSub, l_Sub) then
    try
     case l_Sub.LayerID of
       ev_sbtSub      : l_CurType := dptSub;
       ev_sbtBookmark : l_CurType := dptBookmark;
       ev_sbtMark     : l_CurType := dptMark;
      else
       l_CurType := dptNone;
     end;//case l_Sub.LayerID
     if l_CurType <> dptNone then
      Op_Document_SetPosition.Call(Aggregate, l_eeNode.ID, l_CurType, TextFormUserType);
    finally
     l_Sub := nil;
    end//try..finally
   else
   if Supports(l_eeNode, Ik2Tag, l_TagWrap) then
    try
     Op_Document_GotoPara.Call(Aggregate, l_TagWrap, TextFormUserType);
    finally
     l_TagWrap := nil;
    end;//try..finally
  finally
   Dec(f_InternalPositioning);
  end;//try..finally
 end;//not (f_InternalPositioning > 0)
//#UC END# *4D2DA7CA00F6_4979DFB700F8_impl*
end;//TPrimContentsForm.SendSynchroMessage

function TPrimContentsForm.IsFloatingState: Boolean;
//#UC START# *4E79E72D00A5_4979DFB700F8_var*
var
 l_P : TafwCustomForm;
 l_FW : IafwFloatingWindow;
//#UC END# *4E79E72D00A5_4979DFB700F8_var*
begin
//#UC START# *4E79E72D00A5_4979DFB700F8_impl*
 f_CloseDisabled := false;
 Result := false;
 l_P := afw.GetAnotherParentForm(Self);
 if (l_P <> nil) AND (TForm(l_P).FormStyle = fsStayOnTop) then
 begin
  Result := true;
  f_CloseDisabled := true;
  if Supports(l_P, IafwFloatingWindow, l_FW) then
   try
    l_FW.DisableReactivate;
    //l_FW.DisableClose;
   finally
    l_FW := nil;
   end;//try..finally
 end;//l_P <> nil
//#UC END# *4E79E72D00A5_4979DFB700F8_impl*
end;//TPrimContentsForm.IsFloatingState

procedure TPrimContentsForm.ExpandFirstLevel;
//#UC START# *4AEF076A02D6_4979DFB700F8_var*
//#UC END# *4AEF076A02D6_4979DFB700F8_var*
begin
//#UC START# *4AEF076A02D6_4979DFB700F8_impl*
 with ContentsTree.TreeView.Tree do
  if Assigned(Root) and
     Assigned(Root.ChildNode) then
   ChangeExpand(Root, ee_sbSelect);
(*  if Assigned(Root) and
     Assigned(Root.ChildNode) and
     IsNodeBlockOrSub(Root.ChildNode) then
   ChangeExpand(Root.ChildNode, ee_sbSelect);*)
//#UC END# *4AEF076A02D6_4979DFB700F8_impl*
end;//TPrimContentsForm.ExpandFirstLevel

procedure TPrimContentsForm.Updated;
//#UC START# *48FF6D200201_4979DFB700F8_var*
//#UC END# *48FF6D200201_4979DFB700F8_var*
begin
//#UC START# *48FF6D200201_4979DFB700F8_impl*
 ExpandFirstLevel;
//#UC END# *48FF6D200201_4979DFB700F8_impl*
end;//TPrimContentsForm.Updated

procedure TPrimContentsForm.DoTabActivate;
//#UC START# *497F16AC015A_4979DFB700F8_var*
//#UC END# *497F16AC015A_4979DFB700F8_var*
begin
//#UC START# *497F16AC015A_4979DFB700F8_impl*
 if (BaseContents <> nil) then
  TnsGetDocumentStructureEvent.Log(BaseContents.DocInfo.Doc);
//#UC END# *497F16AC015A_4979DFB700F8_impl*
end;//TPrimContentsForm.DoTabActivate

procedure TPrimContentsForm.Contents_SetCurrent_Execute(aSub: Integer);
//#UC START# *4A9D4A180253_4979DFB700F8exec_var*
var
 l_Node: Il3SimpleNode;
//#UC END# *4A9D4A180253_4979DFB700F8exec_var*
begin
//#UC START# *4A9D4A180253_4979DFB700F8exec_impl*
 if not (f_InternalPositioning > 0) then
 begin
  Inc(f_InternalPositioning);
  try
   with ContentsTree.TreeView do
   begin
    if (CurrentNode <> nil) and
       (CurrentNode.ID <> aSub) then
    begin
     l_Node := FindSubByID(aSub);
     if (l_Node <> nil) then
      ContentsTree.GotoOnNode(l_Node);
    end;//CurrentNode <> nil
   end;//with ContentsTree.TreeView
  finally
   Dec(f_InternalPositioning);
  end;//try..finally
 end;//not (f_InternalPositioning > 0)
//#UC END# *4A9D4A180253_4979DFB700F8exec_impl*
end;//TPrimContentsForm.Contents_SetCurrent_Execute

procedure TPrimContentsForm.Contents_SetCurrent(const aParams: IvcmExecuteParams);
begin
 with (aParams.Data As IContents_SetCurrent_Params) do
  Contents_SetCurrent_Execute(Sub);
end;

procedure TPrimContentsForm.Contents_MoveCurrent_Execute(aSub: Integer;
  aDown: Boolean);
//#UC START# *4A9D4A560164_4979DFB700F8exec_var*

 procedure PositionOnNode(const aNode: Il3SimpleNode);
 var
  l_CurrentChangedProc: TeeCurrentChanged;
 begin
  l_CurrentChangedProc := ContentsTree.OnCurrentChanged;
  ContentsTree.OnCurrentChanged := nil;
  try
   ContentsTree.GotoOnNode(aNode);
  finally
   ContentsTree.OnCurrentChanged := l_CurrentChangedProc;
  end;
   // http://mdp.garant.ru/pages/viewpage.action?pageId=298682625
   if l3IsTimeElapsed(f_ContentsTreeLastUpdateTime, 500) then
   begin
    ContentsTree.Update; // http://mdp.garant.ru/pages/viewpage.action?pageId=297702510
    f_ContentsTreeLastUpdateTime := GetTickCount;
   end;
 end;

var
 l_RelativeIndex: Integer;
 l_CurrentNode: IeeNode;
 l_Node: Il3SimpleNode;
 l_Sub: IevSub;
 l_Direction: TMoveDirectionType;
//#UC END# *4A9D4A560164_4979DFB700F8exec_var*
begin
//#UC START# *4A9D4A560164_4979DFB700F8exec_impl*
 if not (f_InternalPositioning > 0) then
 begin
  l_CurrentNode := ContentsTree.TreeView.CurrentNode;
  if ((l_CurrentNode = nil) or (l_CurrentNode.ID <> aSub)) then
  begin
   l_Node := FindSubByID(aSub);
   if (l_Node <> nil) then
   begin
    if Supports(l_CurrentNode, IevSub, l_Sub) and
       (l_Sub.LayerID = ev_sbtSub) then
    begin
     if aDown then
      l_Direction := mdtDown
     else
      l_Direction := mdtUp;
     l_RelativeIndex := ContentsTree.TreeStruct.GetIndex(l_Node, l_CurrentNode as Il3SimpleNode);
     if l_RelativeIndex = -1 then // ��������� �������� -1 �������� ����������������� � ������������ ��� ��������� ���,
                                  // �� ������� ������� ���� ������� � ��� ��� ������������� ������
     begin
      ContentsTree.TreeStruct.MakeNodeVisible(l_Node);
      l_RelativeIndex := ContentsTree.TreeStruct.GetIndex(l_Node, l_CurrentNode as Il3SimpleNode);
     end;
     if (l_Direction <> mdtNone) and
        (((l_Direction = mdtDown) and (l_RelativeIndex > 0)) or
         ((l_Direction = mdtUp) and (l_RelativeIndex < 0))) then
      PositionOnNode(l_Node);
    end//Supports(l_CurrentNode, IevSub, l_Sub)
    else
     PositionOnNode(l_Node);
   end; //l_eeNode <> nil
  end;//l_CurrentNode <> nil..
 end;//not (f_InternalPositioning > 0)
//#UC END# *4A9D4A560164_4979DFB700F8exec_impl*
end;//TPrimContentsForm.Contents_MoveCurrent_Execute

procedure TPrimContentsForm.Contents_MoveCurrent(const aParams: IvcmExecuteParams);
begin
 with (aParams.Data As IContents_MoveCurrent_Params) do
  Contents_MoveCurrent_Execute(Sub, Down);
end;

procedure TPrimContentsForm.DocumentBlock_GetCorrespondentList_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C2AEDB3003B_4979DFB700F8test_var*
//#UC END# *4C2AEDB3003B_4979DFB700F8test_var*
begin
//#UC START# *4C2AEDB3003B_4979DFB700F8test_impl*
 enDocumentBlockTest(aParams, False);
 if aParams.Op.Flag[vcm_ofEnabled] then
 begin
  if (Contents <> nil) then
   aParams.Op.Flag[vcm_ofEnabled] := Contents.HasCorrespondents;
  FillCRList(aParams);
 end;//aParams.Op.Flag[vcm_ofEnabled]
//#UC END# *4C2AEDB3003B_4979DFB700F8test_impl*
end;//TPrimContentsForm.DocumentBlock_GetCorrespondentList_Test

procedure TPrimContentsForm.DocumentBlock_GetCorrespondentList_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C2AEDB3003B_4979DFB700F8exec_var*
var
 l_PositionList: IPositionList;
//#UC END# *4C2AEDB3003B_4979DFB700F8exec_var*
begin
//#UC START# *4C2AEDB3003B_4979DFB700F8exec_impl*
 if (Aggregate <> nil) and (ContentsTree.TreeView.Current <> -1) then
 begin
  if (ContentsTree.TreeView.CurrentNode.ID = c_DocumentSubID) then
   Aggregate.Operation(TdmStdRes.opcode_Document_GetCorrespondentListExFrmAct)
  else
  begin
   l_PositionList := MakePositionList;
   if (l_PositionList <> nil) then
    op_Document_ShowCorrespondentListToPart.Call(Aggregate, l_PositionList);
  end;//ContentsTree.TreeView.CurrentNode.ID = c_DocumentSubID
 end;//Aggregate <> nil..
//#UC END# *4C2AEDB3003B_4979DFB700F8exec_impl*
end;//TPrimContentsForm.DocumentBlock_GetCorrespondentList_Execute

procedure TPrimContentsForm.DocumentBlock_GetRespondentList_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C2AEDC503CC_4979DFB700F8test_var*
//#UC END# *4C2AEDC503CC_4979DFB700F8test_var*
begin
//#UC START# *4C2AEDC503CC_4979DFB700F8test_impl*
 enDocumentBlockTest(aParams, False);
 if aParams.Op.Flag[vcm_ofEnabled] then
  begin
   if (Contents <> nil) then
    aParams.Op.Flag[vcm_ofEnabled] := Contents.HasCorrespondents
   else
    aParams.Op.Flag[vcm_ofEnabled] := False;
  end;//aParams.Op.Flag[vcm_ofEnabled]
//#UC END# *4C2AEDC503CC_4979DFB700F8test_impl*
end;//TPrimContentsForm.DocumentBlock_GetRespondentList_Test

procedure TPrimContentsForm.DocumentBlock_GetRespondentList_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C2AEDC503CC_4979DFB700F8exec_var*
var
 l_PositionList: IPositionList;
//#UC END# *4C2AEDC503CC_4979DFB700F8exec_var*
begin
//#UC START# *4C2AEDC503CC_4979DFB700F8exec_impl*
 if (Aggregate <> nil) and (ContentsTree.TreeView.Current <> -1) then
 begin
  if (ContentsTree.TreeView.CurrentNode.ID = c_DocumentSubID) then
   Aggregate.Operation(TdmStdRes.opcode_Document_GetRespondentListExFrmAct)
  else
  begin
   l_PositionList := MakePositionList;
   if (l_PositionList <> nil) then
    op_Document_ShowRespondentListToPart.Call(Aggregate, l_PositionList);
  end;//ContentsTree.TreeView.CurrentNode.ID = c_DocumentSubID 
 end;//Aggregate <> nil..
//#UC END# *4C2AEDC503CC_4979DFB700F8exec_impl*
end;//TPrimContentsForm.DocumentBlock_GetRespondentList_Execute

procedure TPrimContentsForm.DocumentBlock_GetTypedCorrespondentList_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C2AEDDA0335_4979DFB700F8test_var*
//#UC END# *4C2AEDDA0335_4979DFB700F8test_var*
begin
//#UC START# *4C2AEDDA0335_4979DFB700F8test_impl*
 enDocumentBlockTest(aParams, False);
 if aParams.Op.Flag[vcm_ofEnabled] then
 begin
  if (Contents <> nil) then
   aParams.Op.Flag[vcm_ofEnabled] := Contents.HasCorrespondents;
  FillCRList(aParams);
 end;//aParams.Op.Flag[vcm_ofEnabled]
//#UC END# *4C2AEDDA0335_4979DFB700F8test_impl*
end;//TPrimContentsForm.DocumentBlock_GetTypedCorrespondentList_Test

procedure TPrimContentsForm.DocumentBlock_GetTypedCorrespondentList_GetState(var State: TvcmOperationStateIndex);
//#UC START# *4C2AEDDA0335_4979DFB700F8getstate_var*
//#UC END# *4C2AEDDA0335_4979DFB700F8getstate_var*
begin
//#UC START# *4C2AEDDA0335_4979DFB700F8getstate_impl*
 // - ������ �� ������
//#UC END# *4C2AEDDA0335_4979DFB700F8getstate_impl*
end;//TPrimContentsForm.DocumentBlock_GetTypedCorrespondentList_GetState

procedure TPrimContentsForm.DocumentBlock_GetTypedCorrespondentList_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C2AEDDA0335_4979DFB700F8exec_var*
var
 l_PositionList : IPositionList;
//#UC END# *4C2AEDDA0335_4979DFB700F8exec_var*
begin
//#UC START# *4C2AEDDA0335_4979DFB700F8exec_impl*
 if (Aggregate <> nil) and (ContentsTree.TreeView.Current <> -1) then
 begin
  if ContentsTree.TreeView.CurrentNode.ID = c_DocumentSubID then
   Aggregate.Operation(TdmStdRes.opcode_Document_GetCorrespondentListExFrmAct, aParams As IvcmExecuteParams)
  else
  begin
   l_PositionList := MakePositionList;
   if (l_PositionList <> nil) then
    op_Document_ShowCorrespondentListToPart.Call(Aggregate, l_PositionList, aParams.CurrentNode);
  end;
 end;//l_PositionList <> nil
//#UC END# *4C2AEDDA0335_4979DFB700F8exec_impl*
end;//TPrimContentsForm.DocumentBlock_GetTypedCorrespondentList_Execute

procedure TPrimContentsForm.DocumentBlock_GetTypedRespondentList_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C2AEDE7028C_4979DFB700F8test_var*
//#UC END# *4C2AEDE7028C_4979DFB700F8test_var*
begin
//#UC START# *4C2AEDE7028C_4979DFB700F8test_impl*
 enDocumentBlockTest(aParams, False);
 if aParams.Op.Flag[vcm_ofEnabled] then
 begin
  if (Contents <> nil) then
   aParams.Op.Flag[vcm_ofEnabled] := Contents.HasRespondents;
  FillCRList(aParams);
 end;//aParams.Op.Flag[vcm_ofEnabled]
//#UC END# *4C2AEDE7028C_4979DFB700F8test_impl*
end;//TPrimContentsForm.DocumentBlock_GetTypedRespondentList_Test

procedure TPrimContentsForm.DocumentBlock_GetTypedRespondentList_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C2AEDE7028C_4979DFB700F8exec_var*
var
 l_PositionList : IPositionList;
//#UC END# *4C2AEDE7028C_4979DFB700F8exec_var*
begin
//#UC START# *4C2AEDE7028C_4979DFB700F8exec_impl*
 if (Aggregate <> nil) and (ContentsTree.TreeView.Current <> -1) then
 begin
  if ContentsTree.TreeView.CurrentNode.ID = c_DocumentSubID then
   Aggregate.Operation(TdmStdRes.opcode_Document_GetRespondentListExFrmAct, aParams As IvcmExecuteParams)
  else
  begin
   l_PositionList := MakePositionList;
   if (l_PositionList <> nil) then
    op_Document_ShowRespondentListToPart.Call(Aggregate, l_PositionList, aParams.CurrentNode);
  end;
 end;//Aggregate <> nil
//#UC END# *4C2AEDE7028C_4979DFB700F8exec_impl*
end;//TPrimContentsForm.DocumentBlock_GetTypedRespondentList_Execute

procedure TPrimContentsForm.DocumentBlockBookmarks_AddBookmark_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3B1AEA0127_4979DFB700F8test_var*
var
 l_Sub: IevSub;
//#UC END# *4C3B1AEA0127_4979DFB700F8test_var*
begin
//#UC START# *4C3B1AEA0127_4979DFB700F8test_impl*
 enDocumentBlockTest(aParams, False);
 if aParams.Op.Flag[vcm_ofEnabled] then
  aParams.Op.Flag[vcm_ofEnabled] := Supports(ContentsTree.TreeView.CurrentNode,
   IevSub, l_Sub) and (l_Sub.LayerID = ev_sbtSub);
//#UC END# *4C3B1AEA0127_4979DFB700F8test_impl*
end;//TPrimContentsForm.DocumentBlockBookmarks_AddBookmark_Test

procedure TPrimContentsForm.DocumentBlockBookmarks_AddBookmark_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3B1AEA0127_4979DFB700F8exec_var*
var
 l_eeNode: IeeNode;
 l_Sub: IevSub;
 l_TagWrap: InevTag;
//#UC END# *4C3B1AEA0127_4979DFB700F8exec_var*
begin
//#UC START# *4C3B1AEA0127_4979DFB700F8exec_impl*
 with ContentsTree.TreeView do
  l_eeNode := GetNode(Current);
 try
  if Supports(l_eeNode, IevSub, l_Sub) then
   try
    op_Document_AddBookmarkFromContents.Call(Aggregate, l_Sub.LeafPara);
   finally
    l_Sub := nil;
   end//try..finally
  else
   if Supports(l_eeNode, InevTag, l_TagWrap) then
    try
     op_Document_AddBookmarkFromContents.Call(Aggregate, l_TagWrap);
    finally
     l_TagWrap := nil;
    end;//try..finally
 finally
  l_eeNode := nil;
 end;//try..finally
//#UC END# *4C3B1AEA0127_4979DFB700F8exec_impl*
end;//TPrimContentsForm.DocumentBlockBookmarks_AddBookmark_Execute

procedure TPrimContentsForm.DocumentBlock_ToMSWord_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3B1AFB0270_4979DFB700F8test_var*
//#UC END# *4C3B1AFB0270_4979DFB700F8test_var*
begin
//#UC START# *4C3B1AFB0270_4979DFB700F8test_impl*
 enDocumentBlockTest(aParams, True);
 nsDisableOperationInTrialMode(aParams);
 TnsToMSWordOp.Test(aParams);
//#UC END# *4C3B1AFB0270_4979DFB700F8test_impl*
end;//TPrimContentsForm.DocumentBlock_ToMSWord_Test

procedure TPrimContentsForm.DocumentBlock_ToMSWord_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3B1AFB0270_4979DFB700F8exec_var*
var
 l_Node  : IeeNode;
 l_Sub   : IevSub;
 l_List: InevFlatSubsList;
//#UC END# *4C3B1AFB0270_4979DFB700F8exec_var*
begin
//#UC START# *4C3B1AFB0270_4979DFB700F8exec_impl*
 if IsMultiSelection then
 begin
  l_List := BuildSelectionList;
  if Assigned(l_List) then
   op_Document_ExportBlock.Call(Aggregate, l_List, TextFormUserType, aParams.ItemIndex > 1)
  else
   Say(war_DocumentBlockNothingToExport);
 end//IsMultiSelection
 else
 begin
  l_Node := ContentsTree.TreeView.CurrentNode;
  if Supports(l_Node, IevSub, l_Sub) then
   op_Document_ExportBlock.Call(Aggregate, l_Sub, TextFormUserType, aParams.ItemIndex > 1);
 end;//IsMultiSelection
//#UC END# *4C3B1AFB0270_4979DFB700F8exec_impl*
end;//TPrimContentsForm.DocumentBlock_ToMSWord_Execute

procedure TPrimContentsForm.DocumentBlock_PrintDialog_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3B1B0F0237_4979DFB700F8test_var*
//#UC END# *4C3B1B0F0237_4979DFB700F8test_var*
begin
//#UC START# *4C3B1B0F0237_4979DFB700F8test_impl*
 enDocumentBlockTest(aParams, True);
 if aParams.Op.Flag[vcm_ofEnabled] then
  aParams.Op.Flag[vcm_ofEnabled] := CanPrintBlock;
//#UC END# *4C3B1B0F0237_4979DFB700F8test_impl*
end;//TPrimContentsForm.DocumentBlock_PrintDialog_Test

procedure TPrimContentsForm.DocumentBlock_PrintDialog_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3B1B0F0237_4979DFB700F8exec_var*
var
 l_Node  : IeeNode;
 l_Sub     : IevSub;
 l_List: InevFlatSubsList;
//#UC END# *4C3B1B0F0237_4979DFB700F8exec_var*
begin
//#UC START# *4C3B1B0F0237_4979DFB700F8exec_impl*
 if IsMultiSelection then
 begin
  l_List := BuildSelectionList;
  if Assigned(l_List) then
   op_Document_PrintDialogBlock.Call(Aggregate, l_List, TextFormUserType)
  else
   Say(war_DocumentBlockNothingToPrint);
 end
 else
 begin
  l_Node := ContentsTree.TreeView.CurrentNode;
  if Supports(l_Node, IevSub, l_Sub) then
   op_Document_PrintDialogBlock.Call(Aggregate, l_Sub, TextFormUserType);
 end;
//#UC END# *4C3B1B0F0237_4979DFB700F8exec_impl*
end;//TPrimContentsForm.DocumentBlock_PrintDialog_Execute

procedure TPrimContentsForm.DocumentBlock_Copy_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3B1B1D003C_4979DFB700F8test_var*
//#UC END# *4C3B1B1D003C_4979DFB700F8test_var*
begin
//#UC START# *4C3B1B1D003C_4979DFB700F8test_impl*
 enDocumentBlockTest(aParams, True);
 nsDisableOperationInTrialMode(aParams);
//#UC END# *4C3B1B1D003C_4979DFB700F8test_impl*
end;//TPrimContentsForm.DocumentBlock_Copy_Test

procedure TPrimContentsForm.DocumentBlock_Copy_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3B1B1D003C_4979DFB700F8exec_var*
var
 l_Node  : IeeNode;
 l_Sub     : IevSub;
 l_List: InevFlatSubsList;
//#UC END# *4C3B1B1D003C_4979DFB700F8exec_var*
begin
//#UC START# *4C3B1B1D003C_4979DFB700F8exec_impl*
 if IsMultiSelection then
 begin
  l_List := BuildSelectionList;
  if Assigned(l_List) then
   Op_Document_CopyBlock.Call(Aggregate, l_List, TextFormUserType)
  else
   Say(war_DocumentBlockNothingToCopy);
 end
 else
 begin
  l_Node := ContentsTree.TreeView.CurrentNode;
  if Supports(l_Node, IevSub, l_Sub) then
   Op_Document_CopyBlock.Call(Aggregate, l_Sub, TextFormUserType);
 end;
//#UC END# *4C3B1B1D003C_4979DFB700F8exec_impl*
end;//TPrimContentsForm.DocumentBlock_Copy_Execute

procedure TPrimContentsForm.DocumentBlock_Print_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3B241401AA_4979DFB700F8test_var*
//#UC END# *4C3B241401AA_4979DFB700F8test_var*
begin
//#UC START# *4C3B241401AA_4979DFB700F8test_impl*
 enDocumentBlockTest(aParams, True);
 if aParams.Op.Flag[vcm_ofEnabled] then
  aParams.Op.Flag[vcm_ofEnabled] := CanPrintBlock;
//#UC END# *4C3B241401AA_4979DFB700F8test_impl*
end;//TPrimContentsForm.DocumentBlock_Print_Test

procedure TPrimContentsForm.DocumentBlock_Print_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3B241401AA_4979DFB700F8exec_var*
var
 l_Node  : IeeNode;
 l_Sub     : IevSub;
 l_List: InevFlatSubsList;
//#UC END# *4C3B241401AA_4979DFB700F8exec_var*
begin
//#UC START# *4C3B241401AA_4979DFB700F8exec_impl*
 if IsMultiSelection then
 begin
  l_List := BuildSelectionList;
  if Assigned(l_List) then
   op_Document_PrintBlock.Call(Aggregate, l_List, TextFormUserType)
  else
   Say(war_DocumentBlockNothingToPrint);
 end
 else
 begin
  l_Node := ContentsTree.TreeView.CurrentNode;
  if Supports(l_Node, IevSub, l_Sub) then
   op_Document_PrintBlock.Call(Aggregate, l_Sub, TextFormUserType);
 end;
//#UC END# *4C3B241401AA_4979DFB700F8exec_impl*
end;//TPrimContentsForm.DocumentBlock_Print_Execute

procedure TPrimContentsForm.DocumentBlock_PrintPreview_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C879306001C_4979DFB700F8test_var*
//#UC END# *4C879306001C_4979DFB700F8test_var*
begin
//#UC START# *4C879306001C_4979DFB700F8test_impl*
 enDocumentBlockTest(aParams, True);
//#UC END# *4C879306001C_4979DFB700F8test_impl*
end;//TPrimContentsForm.DocumentBlock_PrintPreview_Test

procedure TPrimContentsForm.DocumentBlock_PrintPreview_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C879306001C_4979DFB700F8exec_var*
var
 l_Node  : IeeNode;
 l_Sub     : IevSub;
 l_List: InevFlatSubsList;
//#UC END# *4C879306001C_4979DFB700F8exec_var*
begin
//#UC START# *4C879306001C_4979DFB700F8exec_impl*
 if IsMultiSelection then
 begin
  l_List := BuildSelectionList;
  if Assigned(l_List) then
   op_Document_PreviewBlock.Call(Aggregate, l_List, TextFormUserType)
  else
   Say(war_DocumentBlockNothingToPrint);
 end
 else
 begin
  l_Node := ContentsTree.TreeView.CurrentNode;
  if Supports(l_Node, IevSub, l_Sub) then
   op_Document_PreviewBlock.Call(Aggregate, l_Sub, TextFormUserType);
 end;
//#UC END# *4C879306001C_4979DFB700F8exec_impl*
end;//TPrimContentsForm.DocumentBlock_PrintPreview_Execute

procedure TPrimContentsForm.DocumentBlock_Select_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C87931D00FC_4979DFB700F8test_var*
//#UC END# *4C87931D00FC_4979DFB700F8test_var*
begin
//#UC START# *4C87931D00FC_4979DFB700F8test_impl*
 enDocumentBlockTest(aParams, True);
//#UC END# *4C87931D00FC_4979DFB700F8test_impl*
end;//TPrimContentsForm.DocumentBlock_Select_Test

procedure TPrimContentsForm.DocumentBlock_Select_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C87931D00FC_4979DFB700F8exec_var*
var
 l_Node : IeeNode;
 l_Sub  : IevSub;
 l_List : InevFlatSubsList;
//#UC END# *4C87931D00FC_4979DFB700F8exec_var*
begin
//#UC START# *4C87931D00FC_4979DFB700F8exec_impl*
 if IsMultiSelection then
 begin
  l_List := BuildSelectionList;
  if Assigned(l_List) then
   Op_Document_SelectBlock.Call(Aggregate, l_List, TextFormUserType)
  else
   Say(war_DocumentBlockNothingToSelect);
 end//IsMultiSelection
 else
 begin
  l_Node := ContentsTree.TreeView.CurrentNode;
  if Supports(l_Node, IevSub, l_Sub) then
   Op_Document_SelectBlock.Call(Aggregate, l_Sub, TextFormUserType);
 end;//IsMultiSelection
//#UC END# *4C87931D00FC_4979DFB700F8exec_impl*
end;//TPrimContentsForm.DocumentBlock_Select_Execute

function TPrimContentsForm.ContentsValidator_IsDocumentAdornmentsChanged_Execute(const aNew: InsDocumentAdornments): Boolean;
//#UC START# *4D9B1F0A0335_4979DFB700F8exec_var*
//#UC END# *4D9B1F0A0335_4979DFB700F8exec_var*
begin
//#UC START# *4D9B1F0A0335_4979DFB700F8exec_impl*
 Assert(aNew <> nil);
 Result := false;
 if (aNew.Bookmarks = nil) then
  Result := Result OR (lstBookmarks.Total > 0)
 else
  Result := Result OR (lstBookmarks.Total <> aNew.Bookmarks.Count);
 if (aNew.Comments = nil) then
  Result := Result OR (lstComments.Total > 0)
 else
  Result := Result OR (lstComments.Total <> aNew.Comments.Count);
 if (aNew.ExternalObjects = nil) then
  Result := Result OR (lstExternalObjects.Total > 0)
 else
  Result := Result OR (lstExternalObjects.Total <> aNew.ExternalObjects.Count);
//#UC END# *4D9B1F0A0335_4979DFB700F8exec_impl*
end;//TPrimContentsForm.ContentsValidator_IsDocumentAdornmentsChanged_Execute

procedure TPrimContentsForm.ContentsValidator_IsDocumentAdornmentsChanged(const aParams: IvcmExecuteParams);
begin
 with (aParams.Data As IContentsValidator_IsDocumentAdornmentsChanged_Params) do
  ResultValue := ContentsValidator_IsDocumentAdornmentsChanged_Execute(New);
end;

function TPrimContentsForm.Contents_HasUserComments_Execute: Boolean;
//#UC START# *4DF1FCA6008C_4979DFB700F8exec_var*
//#UC END# *4DF1FCA6008C_4979DFB700F8exec_var*
begin
//#UC START# *4DF1FCA6008C_4979DFB700F8exec_impl*
 Result := lstComments.Visible AND (lstComments.Total > 0);
//#UC END# *4DF1FCA6008C_4979DFB700F8exec_impl*
end;//TPrimContentsForm.Contents_HasUserComments_Execute

procedure TPrimContentsForm.Contents_HasUserComments(const aParams: IvcmExecuteParams);
begin
 with (aParams.Data As IContents_HasUserComments_Params) do
  ResultValue := Contents_HasUserComments_Execute;
end;

function TPrimContentsForm.Contents_HasBookmarks_Execute: Boolean;
//#UC START# *4DF1FCC602EE_4979DFB700F8exec_var*
//#UC END# *4DF1FCC602EE_4979DFB700F8exec_var*
begin
//#UC START# *4DF1FCC602EE_4979DFB700F8exec_impl*
 Result := lstBookmarks.Visible AND (lstBookmarks.Total > 0);
//#UC END# *4DF1FCC602EE_4979DFB700F8exec_impl*
end;//TPrimContentsForm.Contents_HasBookmarks_Execute

procedure TPrimContentsForm.Contents_HasBookmarks(const aParams: IvcmExecuteParams);
begin
 with (aParams.Data As IContents_HasBookmarks_Params) do
  ResultValue := Contents_HasBookmarks_Execute;
end;

function TPrimContentsForm.Contents_ToggleContentsVisibility_Execute: Boolean;
//#UC START# *4E79E67402E7_4979DFB700F8exec_var*
var
 l_P : TafwCustomForm;
//#UC END# *4E79E67402E7_4979DFB700F8exec_var*
begin
//#UC START# *4E79E67402E7_4979DFB700F8exec_impl*
 Result := false;
 if IsFloatingState then
 begin
  l_P := afw.GetAnotherParentForm(Self);
  if (l_P <> nil) then
  begin
   Result := true;
   l_P.Visible := not l_P.Visible;
   StoreFloatingVisible(l_P.Visible);
   CheckFocus;
  end;//l_P <> nil
 end;//IsFloatingState
//#UC END# *4E79E67402E7_4979DFB700F8exec_impl*
end;//TPrimContentsForm.Contents_ToggleContentsVisibility_Execute

procedure TPrimContentsForm.Contents_ToggleContentsVisibility(const aParams: IvcmExecuteParams);
begin
 with (aParams.Data As IContents_ToggleContentsVisibility_Params) do
  ResultValue := Contents_ToggleContentsVisibility_Execute;
end;

function TPrimContentsForm.Contents_IsContentsVisible_Execute: Boolean;
//#UC START# *4E79E6C4018D_4979DFB700F8exec_var*
var
 l_P : TafwCustomForm;
//#UC END# *4E79E6C4018D_4979DFB700F8exec_var*
begin
//#UC START# *4E79E6C4018D_4979DFB700F8exec_impl*
 Result := false;
 if IsFloatingState then
 begin
  l_P := afw.GetAnotherParentForm(Self);
  if (l_P <> nil) then
  begin
   Result := l_P.Visible;
   StoreFloatingVisible(Result);
  end;//l_P <> nil
 end;//IsFloatingState
//#UC END# *4E79E6C4018D_4979DFB700F8exec_impl*
end;//TPrimContentsForm.Contents_IsContentsVisible_Execute

procedure TPrimContentsForm.Contents_IsContentsVisible(const aParams: IvcmExecuteParams);
begin
 with (aParams.Data As IContents_IsContentsVisible_Params) do
  ResultValue := Contents_IsContentsVisible_Execute;
end;

procedure TPrimContentsForm.Comment_Changed_Execute;
//#UC START# *4EAAE5C40089_4979DFB700F8exec_var*
//#UC END# *4EAAE5C40089_4979DFB700F8exec_var*
begin
//#UC START# *4EAAE5C40089_4979DFB700F8exec_impl*
 if (lstComments <> nil) then
  lstComments.Invalidate;
//#UC END# *4EAAE5C40089_4979DFB700F8exec_impl*
end;//TPrimContentsForm.Comment_Changed_Execute

procedure TPrimContentsForm.Comment_Changed(const aParams: IvcmExecuteParams);
begin
 Comment_Changed_Execute;
end;

procedure TPrimContentsForm.Cleanup;
//#UC START# *479731C50290_4979DFB700F8_var*
//#UC END# *479731C50290_4979DFB700F8_var*
begin
//#UC START# *479731C50290_4979DFB700F8_impl*
 if (ContentsTree.TreeStruct <> nil) then
  ContentsTree.TreeStruct.Unsubscribe(InsTreeDataListener(Self));
 //f_ContentsNode := nil;
 Finalize(f_Filtered);
 inherited;
//#UC END# *479731C50290_4979DFB700F8_impl*
end;//TPrimContentsForm.Cleanup

{$If not defined(NoVCM)}
procedure TPrimContentsForm.NotifyDataSourceChanged(const anOld: IvcmViewAreaController;
  const aNew: IvcmViewAreaController);
//#UC START# *497469C90140_4979DFB700F8_var*
//#UC END# *497469C90140_4979DFB700F8_var*
begin
//#UC START# *497469C90140_4979DFB700F8_impl*
 inherited;
 {$IfDef vcmUseProfilers}
 f_FirstCurrentChanged := False;
 {$EndIf vcmUseProfilers}
 InitLists;
 ContextFilter.UpdateIsContextWrong;
//#UC END# *497469C90140_4979DFB700F8_impl*
end;//TPrimContentsForm.NotifyDataSourceChanged
{$IfEnd} //not NoVCM

{$If not defined(NoVCM)}
procedure TPrimContentsForm.DoInit(aFromHistory: Boolean);
//#UC START# *49803F5503AA_4979DFB700F8_var*
//#UC END# *49803F5503AA_4979DFB700F8_var*
begin
//#UC START# *49803F5503AA_4979DFB700F8_impl*
 inherited;
 ContextFilter.Images := dmStdRes.SmallImageList;
//#UC END# *49803F5503AA_4979DFB700F8_impl*
end;//TPrimContentsForm.DoInit
{$IfEnd} //not NoVCM

{$If not defined(NoVCM)}
procedure TPrimContentsForm.InitControls;
//#UC START# *4A8E8F2E0195_4979DFB700F8_var*
//#UC END# *4A8E8F2E0195_4979DFB700F8_var*
begin
//#UC START# *4A8E8F2E0195_4979DFB700F8_impl*
 inherited;

 // begin http://mdp.garant.ru/pages/viewpage.action?pageId=336142662
 lstBookmarks.StyleId := evd_saTOC;
 lstBookmarks.UseStyleTable := true;
 lstComments.StyleId := evd_saTOC;
 lstComments.UseStyleTable := true;
 lstExternalObjects.StyleId := evd_saTOC;
 lstExternalObjects.UseStyleTable := true;
 ContentsTree.StyleId := evd_saTOC;
 ContentsTree.UseStyleTable := true;
 // end http://mdp.garant.ru/pages/viewpage.action?pageId=336142662

 f_ListForFiltering[ns_cltBookmarks] := lstBookmarks;
 f_ListForFiltering[ns_cltComments] := lstComments;
 f_ListForFiltering[ns_cltExternalObjects] := lstExternalObjects;
 with ContextFilter do
 begin
  OnChange := Self.ContextFilterChange;
  OnWrongContext := Self.ContextFilterWrongContext;
  OnGetIsContextWrong := Self.GetIsContextWrong;
 end;//with ContextFilter
 with ContentsTree do
 begin
  OnNewCharPressed := Self.ContentsTreeNewCharPressed;
  OnMakeTreeSource := Self.ContentsTreeMakeTreeSource;
  OnGetItemImage := Self.ContentsTreeGetItemImage;
  OnActionElement := Self.ContentsTreeActionElement;
  OnCurrentChanged := Self.ContentsTreeCurrentChanged;
  OnTreeChanged := Self.ContentsTreeTreeChanged;
  OnRootChanged := Self.ContentsTreeRootChanged;
 end;//with ContentsTree
 InitLists;
//#UC END# *4A8E8F2E0195_4979DFB700F8_impl*
end;//TPrimContentsForm.InitControls
{$IfEnd} //not NoVCM

{$If not defined(NoVCM)}
procedure TPrimContentsForm.DefaultQueryClose(aSender: TObject);
//#UC START# *4E7A030702C6_4979DFB700F8_var*
//#UC END# *4E7A030702C6_4979DFB700F8_var*
begin
//#UC START# *4E7A030702C6_4979DFB700F8_impl*
 if not f_CloseDisabled then
  inherited
 else
 if not FloatingHide then
  inherited;
//#UC END# *4E7A030702C6_4979DFB700F8_impl*
end;//TPrimContentsForm.DefaultQueryClose
{$IfEnd} //not NoVCM

{$If not defined(NoVCM)}
procedure TPrimContentsForm.CheckFloatingVisibility;
//#UC START# *4E7A13AE01BC_4979DFB700F8_var*
var
 l_P : TafwCustomForm;
//#UC END# *4E7A13AE01BC_4979DFB700F8_var*
begin
//#UC START# *4E7A13AE01BC_4979DFB700F8_impl*
 inherited;
 if IsFloatingState then
 begin
  l_P := afw.GetAnotherParentForm(Self);
  Assert(l_P <> nil);
  CheckActionElementMode;
  if (l_P <> nil) then
   if not Self.FloatingVisible then
    l_P.Hide
   else
    Self.CheckFocus; 
 end;//IsFloatingState
//#UC END# *4E7A13AE01BC_4979DFB700F8_impl*
end;//TPrimContentsForm.CheckFloatingVisibility
{$IfEnd} //not NoVCM

{$If not defined(NoVCM)}
function TPrimContentsForm.CanHaveCloseButtonInNavigator: Boolean;
//#UC START# *4F619BCE008A_4979DFB700F8_var*
//#UC END# *4F619BCE008A_4979DFB700F8_var*
begin
//#UC START# *4F619BCE008A_4979DFB700F8_impl*
 Result := IsFloatingState{f_CloseDisabled};
 // - ���� �������, �� ��� - ���������, � �� ����� ���� f_CloseDisabled - ������ ���������� f_IsFloatingNow
//#UC END# *4F619BCE008A_4979DFB700F8_impl*
end;//TPrimContentsForm.CanHaveCloseButtonInNavigator
{$IfEnd} //not NoVCM

{$If not defined(NoVCM)}
function TPrimContentsForm.CanHaveOwnCloseButtonInNavigator: Boolean;
//#UC START# *4F6A0EE50047_4979DFB700F8_var*
//#UC END# *4F6A0EE50047_4979DFB700F8_var*
begin
//#UC START# *4F6A0EE50047_4979DFB700F8_impl*
 Result := false;
//#UC END# *4F6A0EE50047_4979DFB700F8_impl*
end;//TPrimContentsForm.CanHaveOwnCloseButtonInNavigator
{$IfEnd} //not NoVCM

procedure TPrimContentsForm.SignalDataSourceChanged(const anOld : IvcmViewAreaController;
 const aDsNew : IvcmViewAreaController);
begin
 inherited;
 if (aDsNew = nil) then
 begin
  SimpleTree := nil;
  Contents := nil;
  BaseContents := nil;
 end//aDsNew = nil
 else
 begin
  Supports(aDsNew, IdsSimpleTree, SimpleTree);
  Supports(aDsNew, IdsContents, Contents);
  Supports(aDsNew, IdsBaseContents, BaseContents);
 end;//aDsNew = nil
end;

procedure TPrimContentsForm.InitEntities;
begin
 inherited;
 with Entities.Entities do
 begin
  PublishFormEntity(en_Contents, nil);
  PublishFormEntity(en_DocumentBlock, nil);
  PublishFormEntity(en_ContentsValidator, nil);
  PublishFormEntity(en_Comment, nil);
  PublishFormEntity(en_DocumentBlockBookmarks, nil);
  PublishFormEntity(en_Edit, nil);
  MakeEntitySupportedByControl(en_Edit, lstBookmarks);
  MakeEntitySupportedByControl(en_Edit, lstComments);
  PublishOpWithResult(en_Contents, op_SetCurrent, Contents_SetCurrent, nil, nil);
  PublishOpWithResult(en_Contents, op_MoveCurrent, Contents_MoveCurrent, nil, nil);
  PublishOp(en_DocumentBlock, op_GetCorrespondentList, DocumentBlock_GetCorrespondentList_Execute, DocumentBlock_GetCorrespondentList_Test, nil);
  PublishOp(en_DocumentBlock, op_GetRespondentList, DocumentBlock_GetRespondentList_Execute, DocumentBlock_GetRespondentList_Test, nil);
  PublishOp(en_DocumentBlock, op_GetTypedCorrespondentList, DocumentBlock_GetTypedCorrespondentList_Execute, DocumentBlock_GetTypedCorrespondentList_Test, DocumentBlock_GetTypedCorrespondentList_GetState);
  PublishOp(en_DocumentBlock, op_GetTypedRespondentList, DocumentBlock_GetTypedRespondentList_Execute, DocumentBlock_GetTypedRespondentList_Test, nil);
  PublishOp(en_DocumentBlockBookmarks, op_AddBookmark, DocumentBlockBookmarks_AddBookmark_Execute, DocumentBlockBookmarks_AddBookmark_Test, nil);
  PublishOp(en_DocumentBlock, op_ToMSWord, DocumentBlock_ToMSWord_Execute, DocumentBlock_ToMSWord_Test, nil);
  PublishOp(en_DocumentBlock, op_PrintDialog, DocumentBlock_PrintDialog_Execute, DocumentBlock_PrintDialog_Test, nil);
  PublishOp(en_DocumentBlock, op_Copy, DocumentBlock_Copy_Execute, DocumentBlock_Copy_Test, nil);
  PublishOp(en_DocumentBlock, op_Print, DocumentBlock_Print_Execute, DocumentBlock_Print_Test, nil);
  PublishOp(en_DocumentBlock, op_PrintPreview, DocumentBlock_PrintPreview_Execute, DocumentBlock_PrintPreview_Test, nil);
  ShowInContextMenu(en_DocumentBlock, op_PrintPreview, true);
  ShowInToolbar(en_DocumentBlock, op_PrintPreview, false);
  PublishOp(en_DocumentBlock, op_Select, DocumentBlock_Select_Execute, DocumentBlock_Select_Test, nil);
  ShowInContextMenu(en_DocumentBlock, op_Select, true);
  ShowInToolbar(en_DocumentBlock, op_Select, false);
  PublishOpWithResult(en_ContentsValidator, op_IsDocumentAdornmentsChanged, ContentsValidator_IsDocumentAdornmentsChanged, nil, nil);
  PublishOpWithResult(en_Contents, op_HasUserComments, Contents_HasUserComments, nil, nil);
  PublishOpWithResult(en_Contents, op_HasBookmarks, Contents_HasBookmarks, nil, nil);
  PublishOpWithResult(en_Contents, op_ToggleContentsVisibility, Contents_ToggleContentsVisibility, nil, nil);
  PublishOpWithResult(en_Contents, op_IsContentsVisible, Contents_IsContentsVisible, nil, nil);
  PublishOpWithResult(en_Comment, op_Changed, Comment_Changed, nil, nil);
 end;//with Entities.Entities
 AddUserTypeExclude(utDrugContentsName, en_DocumentBlock, op_GetCorrespondentList, false);
 AddUserTypeExclude(utDrugContentsName, en_DocumentBlock, op_GetRespondentList, false);
 AddUserTypeExclude(utDrugContentsName, en_DocumentBlock, op_GetTypedCorrespondentList, false);
 AddUserTypeExclude(utDrugContentsName, en_DocumentBlock, op_GetTypedRespondentList, false);
 AddUserTypeExclude(utDrugContentsName, en_DocumentBlockBookmarks, op_AddBookmark, false);
 AddUserTypeExclude(utDrugContentsName, en_DocumentBlock, op_ToMSWord, false);
 AddUserTypeExclude(utDrugContentsName, en_DocumentBlock, op_PrintDialog, false);
 AddUserTypeExclude(utDrugContentsName, en_DocumentBlock, op_Copy, false);
 AddUserTypeExclude(utDrugContentsName, en_DocumentBlock, op_Print, false);
 AddUserTypeExclude(utDrugContentsName, en_DocumentBlock, op_PrintPreview, false);
 AddUserTypeExclude(utDrugContentsName, en_DocumentBlock, op_Select, false);
end;

procedure TPrimContentsForm.MakeControls;
begin
 inherited;
 f_lstBookmarks := TvtLister.Create(Self);
 f_lstBookmarks.Name := 'lstBookmarks';
 f_lstBookmarks.Parent := BackgroundPanel;
 f_lstComments := TvtLister.Create(Self);
 f_lstComments.Name := 'lstComments';
 f_lstComments.Parent := BackgroundPanel;
 f_lstExternalObjects := TvtLister.Create(Self);
 f_lstExternalObjects.Name := 'lstExternalObjects';
 f_lstExternalObjects.Parent := BackgroundPanel;
 f_Tasks := TnscTasksPanelView.Create(Self);
 f_Tasks.Name := 'Tasks';
 f_Tasks.Parent := BackgroundPanel;
end;

{$IfEnd} //not Admin AND not Monitorings

initialization
{$If not defined(Admin) AND not defined(Monitorings)}
 {$Include ..\View\ContentsUserTypes.imp.pas}
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimContents_Control_BackgroundPanel
 Tkw_PrimContents_Control_BackgroundPanel.Register('�������::BackgroundPanel', TvtPanel);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimContents_Control_BackgroundPanel_Push
 Tkw_PrimContents_Control_BackgroundPanel_Push.Register('�������::BackgroundPanel:push');
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimContents_Control_lstBookmarks
 Tkw_PrimContents_Control_lstBookmarks.Register('�������::lstBookmarks', TvtLister);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimContents_Control_lstBookmarks_Push
 Tkw_PrimContents_Control_lstBookmarks_Push.Register('�������::lstBookmarks:push');
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimContents_Control_lstComments
 Tkw_PrimContents_Control_lstComments.Register('�������::lstComments', TvtLister);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimContents_Control_lstComments_Push
 Tkw_PrimContents_Control_lstComments_Push.Register('�������::lstComments:push');
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimContents_Control_lstExternalObjects
 Tkw_PrimContents_Control_lstExternalObjects.Register('�������::lstExternalObjects', TvtLister);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimContents_Control_lstExternalObjects_Push
 Tkw_PrimContents_Control_lstExternalObjects_Push.Register('�������::lstExternalObjects:push');
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimContents_Control_ContentsTree
 Tkw_PrimContents_Control_ContentsTree.Register('�������::ContentsTree', TnscTreeView);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimContents_Control_ContentsTree_Push
 Tkw_PrimContents_Control_ContentsTree_Push.Register('�������::ContentsTree:push');
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimContents_Control_ContextFilter
 Tkw_PrimContents_Control_ContextFilter.Register('�������::ContextFilter', TnscContextFilter);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimContents_Control_ContextFilter_Push
 Tkw_PrimContents_Control_ContextFilter_Push.Register('�������::ContextFilter:push');
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimContents_Control_Tasks
 Tkw_PrimContents_Control_Tasks.Register('�������::Tasks', TnscTasksPanelView);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimContents_Control_Tasks_Push
 Tkw_PrimContents_Control_Tasks_Push.Register('�������::Tasks:push');
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ������������� str_ContentsPrintTitle
 str_ContentsPrintTitle.Init;
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ������������� str_cgContents
 str_cgContents.Init;
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ������������� str_cgBookmarks
 str_cgBookmarks.Init;
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ������������� str_cgComments
 str_cgComments.Init;
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ������������� str_cgExternalObjects
 str_cgExternalObjects.Init;
{$IfEnd} //not Admin AND not Monitorings

end.