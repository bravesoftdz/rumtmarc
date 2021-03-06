unit ExText_Form;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "View"
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/View/Document/Forms/ExText_Form.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<VCMContainer::Class>> F1 ������ � ���������� � ������� ����������::Document::View::Document::ExText
//
// ����� ���������, ���������� � IdsDocument � ������� ���������� ������������ ������� �����
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
  l3Interfaces,
  k2Interfaces
  {$If not defined(NoVCM)}
  ,
  vcmExternalInterfaces
  {$IfEnd} //not NoVCM
  ,
  l3TreeInterfaces,
  Classes,
  nevTools,
  bsTypes,
  Windows,
  eeInterfaces,
  DocumentAndListInterfaces,
  OfficeLike_Text_Controls,
  evSubWaiter,
  Document_F1Lite_Controls,
  Document_Strange_Controls,
  Base_Operations_Editions_Controls,
  L10nInterfaces,
  nevNavigation,
  nsTypes,
  Base_Operations_View_Controls,
  Base_Operations_Strange_Controls,
  ConsultationDomainInterfaces,
  AdapterFacade,
  DictionInterfacesPrim,
  InpharmInterfaces,
  Search_Strange_Controls,
  Common_Strange_Controls,
  DocumentUserTypes_dftNone_UserType,
  DocumentUserTypes_dftDocument_UserType,
  DocumentUserTypes_dftRelatedDoc_UserType,
  DocumentUserTypes_dftAnnotation_UserType,
  DocumentUserTypes_dftDocSynchroView_UserType,
  DocumentUserTypes_dftRelatedSynchroView_UserType,
  DocumentUserTypes_dftAnnotationSynchroView_UserType,
  DocumentUserTypes_dftDictEntry_UserType,
  DocumentUserTypes_dftDictSubEntry_UserType,
  DocumentUserTypes_dftAutoreferatAfterSearch_UserType,
  DocumentUserTypes_dftConsultation_UserType,
  DocumentUserTypes_dftTranslation_UserType,
  DocumentUserTypes_dftTips_UserType,
  DocumentUserTypes_dftMedDictEntry_UserType,
  DocumentUserTypes_dftAutoreferat_UserType,
  DocumentUserTypes_dftDrug_UserType,
  DocumentUserTypes_dftMedicFirm_UserType,
  DocumentUserTypes_dftMedicFirmSynchroView_UserType,
  DocumentUserTypes_dftDrugSynchroView_UserType,
  nsLogEvent,
  nsCounterEvent,
  l3StringIDEx,
  bsTypesNew,
  WorkWithDocumentInterfaces,
  DocumentUserTypes_dftAACLeft_UserType,
  DocumentUserTypes_dftAACRight_UserType,
  DocumentUserTypes_dftAACContentsLeft_UserType,
  DocumentUserTypes_dftAACContentsRight_UserType,
  BaseSearchInterfaces
  {$If not defined(NoVCM)}
  ,
  vcmInterfaces
  {$IfEnd} //not NoVCM
  ,
  l3SimpleObject,
  eeSubPanel
  {$If not defined(NoScripts)}
  ,
  kwBynameControlPush
  {$IfEnd} //not NoScripts
  ,
  vtScrollBar
  {$If not defined(NoScripts)}
  ,
  tfwControlString
  {$IfEnd} //not NoScripts
  ,
  vcmEntityForm {a},
  vcmControllers {a},
  afwInterfaces,
  bsInterfaces,
  l3InternalInterfaces,
  k2TagGen,
  k2CustomFileGenerator,
  l3BaseStream
  {$If defined(Nemesis)}
  ,
  nscEditor
  {$IfEnd} //Nemesis
  
  {$If defined(Nemesis)}
  ,
  nscTextSource
  {$IfEnd} //Nemesis
  ,
  Base_Operations_F1Specific_Controls,
  OfficeLike_Usual_Controls,
  k2Prim,
  PrimBaseSearchInterfaces,
  Forms
  {$If defined(Nemesis)}
  ,
  nscNewInterfaces
  {$IfEnd} //Nemesis
  ,
  PresentationInterfaces,
  l3Core,
  ExternalOperationUnit,
  evCustomEditorWindow,
  nevGUIInterfaces,
  afwNavigation,
  NavigationInterfaces,
  DocumentInterfaces,
  nevBase
  {$If not defined(NoVCM)}
  ,
  vcmUserControls
  {$IfEnd} //not NoVCM
  
  {$If not defined(NoScripts)}
  ,
  tfwInteger
  {$IfEnd} //not NoScripts
  ,
  l3LongintList,
  nsFoundBlocksList,
  UnderControlUnit,
  DocInfoInterfaces,
  BaseDocumentWithAttributesInterfaces,
  UnderControlInterfaces,
  Hypertext_Controls_Controls,
  LoggingUnit,
  Messages,
  vcmContainerForm {a}
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}
type
 TnsUseDocumentSubPanelOperationEvent = class(TnsCounterEvent)
 protected
 // realized methods
   function EventID: TLogEvent; override;
 public
 // singleton factory method
   class function Instance: TnsUseDocumentSubPanelOperationEvent;
    {- ���������� ��������� ����������. }
 end;//TnsUseDocumentSubPanelOperationEvent

var
  { ������������ ������ LocalForChangedFragments }
 str_ViewChangesOpName : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'ViewChangesOpName'; rValue : '����� ��������� ���������');
  { '����� ��������� ���������' }

type
 _SearcheableText_Parent_ = TvcmContainerForm;
 {$Include ..\Forms\SearcheableText.imp.pas}
 _PageControlNotification_Parent_ = _SearcheableText_;
 {$Include w:\garant6x\implementation\Garant\GbaNemesis\View\PageControlNotification.imp.pas}
 _TurnOnTimeMachine_Parent_ = _PageControlNotification_;
 {$Include w:\garant6x\implementation\Garant\GbaNemesis\View\Document\TurnOnTimeMachine.imp.pas}
 _TurnOffTimeMachine_Parent_ = _TurnOnTimeMachine_;
 {$Include w:\garant6x\implementation\Garant\GbaNemesis\View\Document\TurnOffTimeMachine.imp.pas}
 _WorkWithRedactions_Parent_ = _TurnOffTimeMachine_;
 {$Include w:\garant6x\implementation\Garant\GbaNemesis\View\WorkWithRedactions.imp.pas}
 _DocumentPresentation_Parent_ = _WorkWithRedactions_;
 {$Include w:\garant6x\implementation\Garant\GbaNemesis\View\DocumentPresentation.imp.pas}
 _HyperlinkProcessor_Parent_ = _DocumentPresentation_;
 {$Include w:\garant6x\implementation\Garant\GbaNemesis\View\HyperlinkProcessor.imp.pas}
 _TextWithComments_Parent_ = _HyperlinkProcessor_;
 {$Include w:\garant6x\implementation\Garant\GbaNemesis\View\TextWithComments.imp.pas}
 _DocumentUserTypes_Parent_ = _TextWithComments_;
 {$Include w:\garant6x\implementation\Garant\GbaNemesis\View\DocumentUserTypes.imp.pas}
 _BlockSelector_Parent_ = _DocumentUserTypes_;
 {$Include w:\garant6x\implementation\Garant\GbaNemesis\View\BlockSelector.imp.pas}
 _CommonForTextAndFlashOperations_Parent_ = _BlockSelector_;
 {$Include w:\garant6x\implementation\Garant\GbaNemesis\View\CommonForTextAndFlashOperations.imp.pas}
 _HyperlinkOperations_Parent_ = _CommonForTextAndFlashOperations_;
 {$Include w:\garant6x\implementation\Garant\GbaNemesis\View\HyperlinkOperations.imp.pas}
 TExTextForm = {form} class(_HyperlinkOperations_)
  {* ����� ���������, ���������� � IdsDocument � ������� ���������� ������������ ������� ����� }
 private
 // private fields
   f_NeedAnnoingCheck : Boolean;
   f_InGoToInternet : Boolean;
  {$If defined(nsTest) AND not defined(Admin) AND not defined(Monitorings)}
   f_NeedShowIntranetWarningHack : Boolean;
    {* ���� ��� �������� NeedShowIntranetWarningHack}
  {$IfEnd} //nsTest AND not Admin AND not Monitorings
 protected
  procedure SignalDataSourceChanged(const anOld : IvcmViewAreaController;
                                const aDsNew : IvcmViewAreaController); override;
  procedure InitEntities; override;
 private
 // private methods
   procedure DoFindInDict;
   procedure DoFocusViaMouseSet(aSender: TObject);
   procedure TextSourceTOCCreated(aSender: TObject;
     const aTOC: Il3SimpleTree);
   procedure TextSourceMakeDocumentContainer(Sender: TObject;
     var aMade: InevDocumentContainer);
   procedure TextSourceDocumentChanged(aSender: TObject;
     const anOldDocument: Ik2Tag;
     const aNewDocument: Ik2Tag);
   procedure OnHistoryState(Sender: TObject;
     var IsLast: Boolean);
   procedure GoToIntranetPrim(aNeedCheck: Boolean);
   procedure SetFocusToTextInAAC;
   function GetCorrespondentListTest: Boolean;
   function GetRespondentListTest: Boolean;
   procedure CheckLinkedWindows;
     {* �������������� ��������� ��������� ���� }
   procedure DoHyperlinkNavigate(Sender: TObject);
     {* TNotifyEvent is used for events that do not require parameters. }
 protected
 // property methods
   {$If defined(nsTest) AND not defined(Admin) AND not defined(Monitorings)}

   {$IfEnd} //nsTest AND not Admin AND not Monitorings
 protected
 // realized methods
   procedure DftMedicFirmSynchroViewQueryMaximized(aSender: TObject); override;
     {* ���������� ������� dftMedicFirmSynchroView.OnQueryMaximized }
   procedure DftTranslationQueryMaximized(aSender: TObject); override;
     {* ���������� ������� dftTranslation.OnQueryMaximized }
   procedure DoTabActivate; override;
     {* ������� �� ������������ ������� }
   procedure Document_OpenCorrespondentList_Test(const aParams: IvcmTestParamsPrim);
     {* �������, ��� ���? }
   procedure Document_OpenCorrespondentList_Execute(aKind: TlstCRType;
    const aCRType: Il3SimpleNode);
     {* �������, ��� ���? }
   procedure Document_OpenCorrespondentList(const aParams: IvcmExecuteParams);
     {* �������, ��� ���? }
   procedure Document_OpenRespondentList_Test(const aParams: IvcmTestParamsPrim);
     {* �������, ��� ���? }
   procedure Document_OpenRespondentList_Execute(aKind: TlstCRType;
    const aCRType: Il3SimpleNode);
     {* �������, ��� ���? }
   procedure Document_OpenRespondentList(const aParams: IvcmExecuteParams);
     {* �������, ��� ���? }
   procedure Document_GetAttributesFrmAct_Test(const aParams: IvcmTestParamsPrim);
     {* ���������� � ��������� }
   procedure Document_GetAttributesFrmAct_Execute(const aParams: IvcmExecuteParamsPrim);
     {* ���������� � ��������� }
   function Loadable_Load_Execute(const aNode: IeeNode;
    const aData: IUnknown;
    anOp: TListLogicOperation = LLO_NONE): Boolean;
     {* �������, ��� ����� ������� ���� �����? }
   procedure Loadable_Load(const aParams: IvcmExecuteParams);
     {* �������, ��� ����� ������� ���� �����? }
   procedure Document_GetRelatedDocFrmAct_Test(const aParams: IvcmTestParamsPrim);
     {* ������� � ��������� }
   procedure Document_GetRelatedDocFrmAct_Execute(const aParams: IvcmExecuteParamsPrim);
     {* ������� � ��������� }
   procedure SetBookmark; override;
     {* ������������� �������� �� ������� ����� �������� ��������� }
   function CanAddBookmark: Boolean; override;
     {* ����� �� ������ ��������� �������� }
   procedure Document_GetCorrespondentList_Test(const aParams: IvcmTestParamsPrim);
     {* ������ �� �������� }
   procedure Document_GetCorrespondentList_Execute(const aParams: IvcmExecuteParamsPrim);
     {* ������ �� �������� }
   procedure Document_GetRespondentList_Test(const aParams: IvcmTestParamsPrim);
     {* ������ �� ��������� }
   procedure Document_GetRespondentList_Execute(const aParams: IvcmExecuteParamsPrim);
     {* ������ �� ��������� }
   function Document_AttributesCanBeClosed_Execute: Boolean;
     {* ��� �������� �� ������� � Facet ��� ���-�� �������� }
   procedure Document_AttributesCanBeClosed(const aParams: IvcmExecuteParams);
     {* ��� �������� �� ������� � Facet ��� ���-�� �������� }
   function DocumentIsValid: Boolean; override;
     {* ���� �� ��������, ������� � ������ }
   function RedactionCurrentPara: IeeLeafPara; override;
     {* ������� �������� �������� ��� ������������� � ����� ���������� �������� }
   function DoProcessExternalOperation(const anOperation: IExternalOperation): Boolean; override;
     {* ���������� ������� �������� }
   procedure GotoPoint(aPointID: Cardinal;
    aPointType: TDocumentPositionType = dptSub); override;
     {* ������� �� ����� � ��������� }
   procedure OpenRedactionLocalLink(const aDocument: IDocument;
    aSub: Cardinal); override;
     {* ��������� ��������� ������ �� ������ �������� }
   function HyperlinkDocument: IDocument; override;
     {* �������� �� �������� ���� ������ }
   function pm_GetHyperlinkText: TevCustomEditorWindow; override;
   function CanBeChanged: Boolean; override;
     {* ����� �� �������� ���� ������� }
   function IsFloating: Boolean; override;
     {* ����� ��������� }
   function pm_GetTextWithComments: TevCustomEditorWindow; override;
   procedure Document_CommonDocumentOpenNewWindow_Execute(aUserType: Integer);
     {* ��� ���? }
   procedure Document_CommonDocumentOpenNewWindow(const aParams: IvcmExecuteParams);
     {* ��� ���? }
   procedure System_TimeMachineStateChange_Execute(aStayInCurrentRedaction: Boolean = false);
   procedure System_TimeMachineStateChange(const aParams: IvcmExecuteParams);
   procedure Redactions_RedactionOnID_Execute(aRedactionID: TRedactionID);
   procedure Redactions_RedactionOnID(const aParams: IvcmExecuteParams);
   function Document_FindExplanation_Execute: Boolean;
     {* ����� ���������� }
   procedure Document_FindExplanation(const aParams: IvcmExecuteParams);
     {* ����� ���������� }
   procedure Selection_FindInDict_Test(const aParams: IvcmTestParamsPrim);
     {* ����� � �������� ������� }
   procedure Selection_FindInDict_Execute(const aParams: IvcmExecuteParamsPrim);
     {* ����� � �������� ������� }
   function Document_SetPosition_Execute(aPointID: Cardinal;
    aPointType: TDocumentPositionType = dptSub;
    aUserType: Integer = 0): Boolean;
   procedure Document_SetPosition(const aParams: IvcmExecuteParams);
   procedure Document_SetActive_Execute(aUserType: Integer);
   procedure Document_SetActive(const aParams: IvcmExecuteParams);
   procedure Document_ExportBlock_Execute(const aData: IUnknown;
    aUserType: Integer;
    aToActiveWindow: Boolean);
   procedure Document_ExportBlock(const aParams: IvcmExecuteParams);
   procedure Document_GetCurrentPosition_Test(const aParams: IvcmTestParamsPrim);
   function Document_GetCurrentPosition_Execute: Integer;
   procedure Document_GetCurrentPosition(const aParams: IvcmExecuteParams);
   procedure Document_SelectBlock_Execute(const aData: IUnknown;
    aUserType: Integer);
   procedure Document_SelectBlock(const aParams: IvcmExecuteParams);
   procedure Document_CopyBlock_Execute(const aData: IUnknown;
    aUserType: Integer);
   procedure Document_CopyBlock(const aParams: IvcmExecuteParams);
   procedure Document_PrintBlock_Execute(const aData: IUnknown;
    aUserType: Integer);
   procedure Document_PrintBlock(const aParams: IvcmExecuteParams);
   procedure Document_PrintDialogBlock_Execute(const aData: IUnknown;
    aUserType: Integer);
   procedure Document_PrintDialogBlock(const aParams: IvcmExecuteParams);
   procedure Document_PreviewBlock_Execute(const aData: IUnknown;
    aUserType: Integer);
   procedure Document_PreviewBlock(const aParams: IvcmExecuteParams);
   procedure Document_ShowRespondentListToPart_Execute(const aList: IPositionList;
    const aCurrent: Il3SimpleNode = nil);
   procedure Document_ShowRespondentListToPart(const aParams: IvcmExecuteParams);
   procedure Document_ShowCorrespondentListToPart_Execute(const aList: IPositionList;
    const aCurrent: Il3SimpleNode = nil);
   procedure Document_ShowCorrespondentListToPart(const aParams: IvcmExecuteParams);
   procedure Document_ModifyBookmarkNotify_Execute(const anEntity: IUnknown);
   procedure Document_ModifyBookmarkNotify(const aParams: IvcmExecuteParams);
   procedure Document_AddBookmarkFromContents_Execute(const aTag: InevTag);
   procedure Document_AddBookmarkFromContents(const aParams: IvcmExecuteParams);
   procedure Document_GetCorrespondentListExFrmAct_Test(const aParams: IvcmTestParamsPrim);
     {* ������ �� �������� (��� ����������) }
   procedure Document_GetCorrespondentListExFrmAct_Execute(const aParams: IvcmExecuteParamsPrim);
     {* ������ �� �������� (��� ����������) }
   procedure Document_GetRespondentListExFrmAct_Test(const aParams: IvcmTestParamsPrim);
     {* ������ �� ��������� (��� ����������) }
   procedure Document_GetRespondentListExFrmAct_Execute(const aParams: IvcmExecuteParamsPrim);
     {* ������ �� ��������� (��� ����������) }
   procedure TimeMachine_TimeMachineOnOff_Test(const aParams: IvcmTestParamsPrim);
   procedure TimeMachine_TimeMachineOnOff_Execute;
   procedure TimeMachine_TimeMachineOnOff(const aParams: IvcmExecuteParams);
   procedure TimeMachine_TimeMachineOffAndReset_Test(const aParams: IvcmTestParamsPrim);
   procedure TimeMachine_TimeMachineOffAndReset_Execute;
   procedure TimeMachine_TimeMachineOffAndReset(const aParams: IvcmExecuteParams);
   procedure Document_OpenNotSureTopic_Execute;
   procedure Document_OpenNotSureTopic(const aParams: IvcmExecuteParams);
   procedure Redactions_ActualRedaction_Test(const aParams: IvcmTestParamsPrim);
   procedure Redactions_ActualRedaction_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Edit_ToggleFoundWords_Test(const aParams: IvcmTestParamsPrim);
     {* ������������ ��������� �������� }
   procedure Edit_ToggleFoundWords_Execute(const aParams: IvcmExecuteParamsPrim);
     {* ������������ ��������� �������� }
   function Document_GotoPara_Execute(const aPara: InevTag;
    aUserType: Integer): Boolean;
   procedure Document_GotoPara(const aParams: IvcmExecuteParams);
   procedure TimeMachine_TimeMachineOnOffNew_Test(const aParams: IvcmTestParamsPrim);
     {* �������� ������ ������� }
   procedure TimeMachine_TimeMachineOnOffNew_GetState(var State: TvcmOperationStateIndex);
     {* �������� ������ ������� }
   procedure TimeMachine_TimeMachineOnOffNew_Execute(const aParams: IvcmExecuteParamsPrim);
     {* �������� ������ ������� }
   procedure Redactions_OpenRedactionListFrmAct_Test(const aParams: IvcmTestParamsPrim);
     {* ������ �������� }
   procedure Redactions_OpenRedactionListFrmAct_GetState(var State: TvcmOperationStateIndex);
     {* ������ �������� }
   procedure Redactions_OpenRedactionListFrmAct_Execute(const aParams: IvcmExecuteParamsPrim);
     {* ������ �������� }
   procedure Document_GetParaForPositionning_Test(const aParams: IvcmTestParamsPrim);
   function Document_GetParaForPositionning_Execute: IeeLeafPara;
   procedure Document_GetParaForPositionning(const aParams: IvcmExecuteParams);
   function NeedGotoNeighbours: Boolean; override;
     {* ���� �� ���������� �� ������� ����� }
   procedure DocumentBlock_GetCorrespondentList_Test(const aParams: IvcmTestParamsPrim);
   procedure DocumentBlock_GetCorrespondentList_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure DocumentBlock_GetRespondentList_Test(const aParams: IvcmTestParamsPrim);
   procedure DocumentBlock_GetRespondentList_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure DocumentBlock_GetTypedCorrespondentList_Test(const aParams: IvcmTestParamsPrim);
   procedure DocumentBlock_GetTypedCorrespondentList_GetState(var State: TvcmOperationStateIndex);
   procedure DocumentBlock_GetTypedCorrespondentList_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure DocumentBlock_GetTypedRespondentList_Test(const aParams: IvcmTestParamsPrim);
   procedure DocumentBlock_GetTypedRespondentList_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Document_GetAnnotationDocFrmAct_Test(const aParams: IvcmTestParamsPrim);
   procedure Document_GetAnnotationDocFrmAct_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Document_SimilarDocuments_Test(const aParams: IvcmTestParamsPrim);
   procedure Document_SimilarDocuments_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure DocumentBlockHeader_UserCR1_Test(const aParams: IvcmTestParamsPrim);
   procedure DocumentBlockHeader_UserCR1_GetState(var State: TvcmOperationStateIndex);
   procedure DocumentBlockHeader_UserCR1_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure DocumentBlockHeader_UserCR2_Test(const aParams: IvcmTestParamsPrim);
   procedure DocumentBlockHeader_UserCR2_GetState(var State: TvcmOperationStateIndex);
   procedure DocumentBlockHeader_UserCR2_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure DocumentBlockHeader_GetTypedCorrespondentList_Test(const aParams: IvcmTestParamsPrim);
   procedure DocumentBlockHeader_GetTypedCorrespondentList_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Redactions_PrevRedaction_Test(const aParams: IvcmTestParamsPrim);
   procedure Redactions_PrevRedaction_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Redactions_NextRedaction_Test(const aParams: IvcmTestParamsPrim);
   procedure Redactions_NextRedaction_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Text_AddToControl_Test(const aParams: IvcmTestParamsPrim);
   procedure Text_AddToControl_GetState(var State: TvcmOperationStateIndex);
   procedure Text_AddToControl_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Selection_ShowCorrespondentListToPart_Test(const aParams: IvcmTestParamsPrim);
   procedure Selection_ShowCorrespondentListToPart_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Selection_ShowRespondentListToPart_Test(const aParams: IvcmTestParamsPrim);
   procedure Selection_ShowRespondentListToPart_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure WarnOnControl_ClearStatusSettings_Test(const aParams: IvcmTestParamsPrim);
     {* ������ ������ ������� "�������" }
   procedure WarnOnControl_ClearStatusSettings_Execute(const aParams: IvcmExecuteParamsPrim);
     {* ������ ������ ������� "�������" }
   procedure TasksPanel_TimeMachineOnOff_Test(const aParams: IvcmTestParamsPrim);
   procedure TasksPanel_TimeMachineOnOff_GetState(var State: TvcmOperationStateIndex);
   procedure TasksPanel_TimeMachineOnOff_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure DocumentBlockHeader_AddBookmark_Test(const aParams: IvcmTestParamsPrim);
   procedure DocumentBlockHeader_AddBookmark_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure DocumentBlockHeader_ToMSWord_Test(const aParams: IvcmTestParamsPrim);
   procedure DocumentBlockHeader_ToMSWord_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure DocumentBlockHeader_Print_Test(const aParams: IvcmTestParamsPrim);
   procedure DocumentBlockHeader_Print_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure DocumentBlockHeader_PrintDialog_Test(const aParams: IvcmTestParamsPrim);
   procedure DocumentBlockHeader_PrintDialog_Execute(const aParams: IvcmExecuteParamsPrim);
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
   procedure Document_OpenContentsFrmAct_Test(const aParams: IvcmTestParamsPrim);
   procedure Document_OpenContentsFrmAct_GetState(var State: TvcmOperationStateIndex);
   procedure Document_OpenContentsFrmAct_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Document_ShowDocumentPicture_Test(const aParams: IvcmTestParamsPrim);
   procedure Document_ShowDocumentPicture_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure ExternalObject_Open_Test(const aParams: IvcmTestParamsPrim);
   procedure ExternalObject_Open_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure ExternalObject_Save_Test(const aParams: IvcmTestParamsPrim);
   procedure ExternalObject_Save_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure WarnRedaction_OpenActualRedaction_Test(const aParams: IvcmTestParamsPrim);
   procedure WarnRedaction_OpenActualRedaction_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure WarnTimeMachine_ShowInfo_Test(const aParams: IvcmTestParamsPrim);
   procedure WarnTimeMachine_ShowInfo_GetState(var State: TvcmOperationStateIndex);
   procedure WarnTimeMachine_ShowInfo_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure WarnTimeMachine_TimeMachineOnOffNew_Test(const aParams: IvcmTestParamsPrim);
   procedure WarnTimeMachine_TimeMachineOnOffNew_GetState(var State: TvcmOperationStateIndex);
   procedure WarnTimeMachine_TimeMachineOnOffNew_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure WarnJuror_ShowInfo_Test(const aParams: IvcmTestParamsPrim);
   procedure WarnJuror_ShowInfo_GetState(var State: TvcmOperationStateIndex);
   procedure WarnJuror_ShowInfo_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure WarnOnControl_ShowChanges_Test(const aParams: IvcmTestParamsPrim);
     {* �������� ��������� }
   procedure WarnOnControl_ShowChanges_Execute(const aParams: IvcmExecuteParamsPrim);
     {* �������� ��������� }
   procedure WarnOnControl_ClearStatus_Test(const aParams: IvcmTestParamsPrim);
     {* �������� ������ "�������" }
   procedure WarnOnControl_ClearStatus_Execute(const aParams: IvcmExecuteParamsPrim);
     {* �������� ������ "�������" }
   procedure UserCommentIcon_HideShow_GetState(var State: TvcmOperationStateIndex);
   procedure UserComment_Delete_Test(const aParams: IvcmTestParamsPrim);
   procedure UserComment_Delete_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Text_AddUserComment_Test(const aParams: IvcmTestParamsPrim);
   procedure Text_AddUserComment_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Document_GetGraphicImage_Test(const aParams: IvcmTestParamsPrim);
   procedure Document_GetGraphicImage_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Document_DocumentSynchroOpenWindow_Test(const aParams: IvcmTestParamsPrim);
   procedure Document_DocumentSynchroOpenWindow_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Document_DocumentSynchroOpenNewWindow_Test(const aParams: IvcmTestParamsPrim);
   procedure Document_DocumentSynchroOpenNewWindow_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Document_DictListOpenFrmAct_Test(const aParams: IvcmTestParamsPrim);
   procedure Document_DictListOpenFrmAct_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Document_GotoBookmark_Test(const aParams: IvcmTestParamsPrim);
   procedure Document_GotoBookmark_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Document_LiteratureListForDictionary_Test(const aParams: IvcmTestParamsPrim);
   procedure Document_LiteratureListForDictionary_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Text_EditBookmark_Test(const aParams: IvcmTestParamsPrim);
   procedure Text_EditBookmark_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Text_DeleteBookmark_Test(const aParams: IvcmTestParamsPrim);
   procedure Text_DeleteBookmark_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Text_AddBookmark_Test(const aParams: IvcmTestParamsPrim);
   procedure Text_AddBookmark_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Text_OpenNewWindow_Test(const aParams: IvcmTestParamsPrim);
   procedure Text_OpenNewWindow_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Document_OpenProducedDrugList_Test(const aParams: IvcmTestParamsPrim);
   procedure Document_OpenProducedDrugList_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Document_OpenSimilarDrugList_Test(const aParams: IvcmTestParamsPrim);
   procedure Document_OpenSimilarDrugList_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Selection_InsertHyperlink_Test(const aParams: IvcmTestParamsPrim);
     {* ��������� ������... }
   procedure Selection_InsertHyperlink_GetState(var State: TvcmOperationStateIndex);
     {* ��������� ������... }
   procedure Selection_InsertHyperlink_Execute(const aParams: IvcmExecuteParamsPrim);
     {* ��������� ������... }
   procedure WarnRedaction_ShowInfo_Test(const aParams: IvcmTestParamsPrim);
     {* �������� ����� �������������� }
   procedure WarnRedaction_ShowInfo_GetState(var State: TvcmOperationStateIndex);
     {* �������� ����� �������������� }
   procedure WarnRedaction_ShowInfo_Execute(const aParams: IvcmExecuteParamsPrim);
     {* �������� ����� �������������� }
   procedure DocumentBlock_PrintPreview_Test(const aParams: IvcmTestParamsPrim);
   procedure DocumentBlock_PrintPreview_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure DocumentBlock_Select_Test(const aParams: IvcmTestParamsPrim);
   procedure DocumentBlock_Select_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Document_ViewChangedFragments_Test(const aParams: IvcmTestParamsPrim);
     {* ����� ��������� ��������� }
   procedure Document_ViewChangedFragments_Execute(const aParams: IvcmExecuteParamsPrim);
     {* ����� ��������� ��������� }
   procedure DocumentSubPanel_UpdateSubPanel_Execute;
   procedure DocumentSubPanel_UpdateSubPanel(const aParams: IvcmExecuteParams);
   procedure IntranetSourcePoint_GoToIntranet_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Picture_Open_Test(const aParams: IvcmTestParamsPrim);
     {* ������� }
   procedure Picture_Open_Execute(const aParams: IvcmExecuteParamsPrim);
     {* ������� }
   procedure Picture_OpenNewWindow_Test(const aParams: IvcmTestParamsPrim);
     {* ������� � ����� ���� }
   procedure Picture_OpenNewWindow_Execute(const aParams: IvcmExecuteParamsPrim);
     {* ������� � ����� ���� }
   function BaseSearchPresentationHolder_GetBaseSearchPresentation_Execute: InsBaseSearchPresentation;
   procedure BaseSearchPresentationHolder_GetBaseSearchPresentation(const aParams: IvcmExecuteParams);
   procedure DftDrugSynchroViewQueryOpen(aSender: TObject); override;
     {* ���������� ������� dftDrugSynchroView.OnQueryOpen }
   procedure DftDictSubEntryQueryClose(aSender: TObject); override;
     {* ���������� ������� dftDictSubEntry.OnQueryClose }
   procedure DftTranslationQueryClose(aSender: TObject); override;
     {* ���������� ������� dftTranslation.OnQueryClose }
   procedure DftDrugSynchroViewQueryMaximized(aSender: TObject); override;
     {* ���������� ������� dftDrugSynchroView.OnQueryMaximized }
   procedure DftAnnotationQueryClose(aSender: TObject); override;
     {* ���������� ������� dftAnnotation.OnQueryClose }
   procedure DftDocSynchroViewQueryMaximized(aSender: TObject); override;
     {* ���������� ������� dftDocSynchroView.OnQueryMaximized }
   procedure DftRelatedDocQueryClose(aSender: TObject); override;
     {* ���������� ������� dftRelatedDoc.OnQueryClose }
   procedure DftTranslationQueryOpen(aSender: TObject); override;
     {* ���������� ������� dftTranslation.OnQueryOpen }
   procedure DftDocSynchroViewQueryOpen(aSender: TObject); override;
     {* ���������� ������� dftDocSynchroView.OnQueryOpen }
   procedure DftMedicFirmSynchroViewQueryOpen(aSender: TObject); override;
     {* ���������� ������� dftMedicFirmSynchroView.OnQueryOpen }
 protected
 // overridden property methods
   function pm_GetHyperlinkSubID: Integer; override;
 protected
 // overridden protected methods
   procedure WndProc(var Message: TMessage); override;
   procedure FinishDataUpdate; override;
   function SettingChanged(const aSettingId: TafwSettingId): Boolean; override;
   procedure SettingsReplaceFinish; override;
   procedure UserSettingsChanged; override;
     {* ���������� ��������� ������������ }
   {$If not defined(NoVCM)}
   procedure NotifyDataSourceChanged(const anOld: IvcmViewAreaController;
    const aNew: IvcmViewAreaController); override;
     {* ��������� �������� ������. ��� ���������� � �������� }
   {$IfEnd} //not NoVCM
   {$If not defined(NoVCM)}
   procedure DoInit(aFromHistory: Boolean); override;
     {* ������������� �����. ��� ���������� � �������� }
   {$IfEnd} //not NoVCM
   function CanAddToControl: Boolean; override;
     {* ����� �� ��������� �� �������� }
   function DoMakeLinkDocInfo(const aDocument: IDocument;
    aPointType: TDocumentPositionType;
    aSub: Cardinal): IdeDocInfo; override;
   function DoProcessLocalLink(const aDocument: IDocument;
    aPointType: TDocumentPositionType;
    aSub: Cardinal): Boolean; override;
     {* ��������� ��������� ������ }
   function NeedsStatusBarItems: Boolean; override;
     {* ����������, ��� �������� � ��������� ������ ���� ���� ����������� }
   {$If not defined(NoVCM)}
   procedure InitControls; override;
     {* ��������� ������������� ���������. ��� ���������� � �������� }
   {$IfEnd} //not NoVCM
   procedure VersionCommentsVisibleInvertedByUser(NewState: Boolean); override;
   procedure DoDocumentShowTechCommentsExecute; override;
   procedure DoSetHyperlinkCallStatus(aValue: Boolean); override;
     {* ���������� ����, ������������ ������������� ������� �� ������ }
    {$If not defined(NoVCM)}
   procedure FormInsertedIntoContainer; override;
    {$IfEnd} //not NoVCM
    {$If not defined(NoVCM)}
   procedure BecomeVisible; override;
    {$IfEnd} //not NoVCM
   procedure ClearFields; override;
 public
 // overridden public methods
   {$If not defined(NoVCM)}
   procedure SetPositionByDS; override;
     {* ���������� ����� ����� �������� ������� ��������� �������� ������. [$136258455] }
   {$IfEnd} //not NoVCM
   {$If not defined(NoVCM)}
   function NeedDrawCaption: Boolean; override;
     {* ����� �� �������� ��������� ���� }
   {$IfEnd} //not NoVCM
   {$If not defined(NoVCM)}
   function DoGetTabInfo(out theCaption: Il3CString;
    out theItemIndex: Integer): Boolean; override;
     {* ���������� � ��������, � ������� ����������� �����. ��� ���������� � �������� }
   {$IfEnd} //not NoVCM
   {$If not defined(NoVCM)}
   function NeedSetMyFocus: Boolean; override;
   {$IfEnd} //not NoVCM
    {$If not defined(NoVCM)}
   procedure NotifyUserTypeSet; override;
    {$IfEnd} //not NoVCM
    {$If not defined(NoVCM)}
   function GetIsMainObjectForm: Boolean; override;
    {$IfEnd} //not NoVCM
 protected
 // protected fields
   DocumentWithContents : IucbDocumentWithContents;
   DictionDocument : IdsDictionDocument;
    {* �������� ��������� �������. ����� ���� nil}
   MedicFirmDocument : IdsMedicFirmDocument;
    {* �������� ���. �����. ����� ���� nil}
   DrugDocument : IdsDrugDocument;
    {* ��������-��������. ����� ���� nil}
   Consultation : IsdsConsultation;
   dsConsultation : IdsConsultation;
   f_ControlMap : InsStringValueMap;
   f_LastBookmarkIndex : Integer;
   f_RecallCreateTOCTree : IdeSimpleTree;
   f_HyperlinkCallStatus : Boolean;
   AAC : IsdsAAC;
 protected
 // protected methods
   function CheckParamForUserType(aUserType: Integer): Boolean;
   procedure DisableOperation(const aParams: IvcmTestParamsPrim);
   procedure CRToPartTest(const aParams: IvcmTestParamsPrim;
     aCRType: TlstCRType);
     {* ����� ���������� ��� ��� � ����� }
   procedure CRToPartExecute(const aParams: IvcmExecuteParamsPrim;
     aCRType: TlstCRType);
     {* ����� ���������� ��� ��� � ����� }
   procedure TurnOnTimeMachine(const aDate: Il3CString);
     {* �������� ������ ������� �� ���� }
   procedure OpenContents(aMode: TnsContentsOpenMode);
   function FiltrateTOCTree(const aTOC: Il3SimpleTree;
     NeedFiltrate: Boolean = True): Il3SimpleTree;
   procedure ShowWarningPage(SwitchActivity: Boolean;
     anOffset: TnsWarningSub = cNoneWarningSub);
   function GetVisibleBookmarksCount(const aBookmarks: IeeSubList): Integer;
   function GetVisibleBookmark(const aBookmarks: IeeSubList;
     anIndex: Integer = 0): IeeSub;
   procedure EditBookmark(anID: Integer);
   function NeedShowIntranetWarning: Boolean;
   procedure GoToIntranet;
   procedure CheckForcedQueryForIntranet;
   procedure RequiestCheckForcedQueryForInternet;
   procedure UpdateSubPanelDescription;
   procedure InvalidateDataSources;
     {* �������������� ����� �������� ������ � ������������ ����������� ������ }
   procedure UpdateTechComment;
   procedure CreateTOC(const aTOC: IdeSimpleTree); virtual; abstract;
   procedure LoadFromSettings;
     {* ��������� ��������� � ����� }
   procedure ShowSubNumbers;
   procedure DoSettingsChanged;
     {* ���������� � ������ ���������\������ ��������. }
   function GetCurrentCaption: Il3CString;
   function GetCurrentImage: Integer;
   procedure CorrespondentsToSubTest(const aParams: IvcmTestParamsPrim);
   function ExtractSubFromSubPanel(const aTarget: IUnknown): IeeSub;
   procedure OpenPicture(const aPara: IeePara;
     const aPicture: IeePicture;
     inNewWindow: Boolean = false);
   function LeafParaUnderCursor: IeePara;
   function MakePositionList(aCRType: TlstCRType): IPositionList;
   procedure SetFocusToText;
   function GetNeedsStatusBarItems: Boolean;
   function NeedShowTOC: Boolean;
     {* ����� �� ���������� ���������� }
   procedure ChangePositionByDataSource;
     {* �������� ������� � ��������� �� ������ ���������� ��������� ������ }
   function OpenCRList(aKind: TlstCRType;
    const aType: Il3SimpleNode;
    ReConvertNode: Boolean): Boolean;
     {* ������� ������ ���������������/������������ }
   procedure TypedCRToPartTest(const aParams: IvcmTestParamsPrim;
    aCRType: TlstCRType);
   procedure GetCorrespondentListEx(aParamsIndex: Integer;
    const aChoosedNode: Il3SimpleNode);
     {* �������, ��� ���? }
   procedure OpenCRListToPart(aCRType: TlstCRType;
    const aType: Il3SimpleNode;
    const aPositionList: IPositionList = nil);
   procedure GetRespondentListEx(aParamsIndex: Integer;
    const aChoosedNode: Il3SimpleNode);
   procedure SynchronizeWithRedationsForm;
   procedure ReloadRedaction(aChangeType: TnsChangeRedactionType;
    aRedaction: TRedactionID = 0); overload;  virtual; abstract;
   function ReloadRedaction(const aDate: AdapterDate): Boolean; overload;  virtual; abstract;
   procedure SetActualRedaction; virtual; abstract;
   function ExtractRangeFromContents(const aData: IUnknown;
    aUserType: Integer): InevRange; virtual; abstract;
   procedure ExportBlock(const aRange: InevRange;
    ToActiveWindow: Boolean); virtual; abstract;
   procedure SelectBlock(const aRange: InevRange); virtual; abstract;
   procedure CopyBlock(const aRange: InevRange); virtual; abstract;
   procedure PrintBlock(const aRange: InevRange); virtual; abstract;
   procedure PrintDialogBlock(const aRange: InevRange); virtual; abstract;
   procedure PreviewBlock(const aRange: InevRange); virtual; abstract;
   function FindBookmarkInText(const aBookmark: IBookmark;
    out aSub: IeeSub): Boolean; virtual; abstract;
   procedure InitHyperLink(const aHyperLink: IevHyperlink;
    const aBaseEntity: IUnknown); virtual; abstract;
   function EnableRedactionOps(const aParams: IvcmTestParamsPrim): Boolean; virtual; abstract;
   procedure OpenInWindow(aNew: Boolean = true); virtual; abstract;
   procedure DoSwitchToFirstTab;
   procedure OpenRedactionList;
 public
 // public properties
    {$If defined(nsTest) AND not defined(Admin) AND not defined(Monitorings)}
   property NeedShowIntranetWarningHack: Boolean
     read f_NeedShowIntranetWarningHack
     write f_NeedShowIntranetWarningHack;
     {* ��� ��� �������� ��������� ��� ������ }
    {$IfEnd} //nsTest AND not Admin AND not Monitorings
 end;//TExTextForm
{$IfEnd} //not Admin AND not Monitorings

implementation

{$If not defined(Admin) AND not defined(Monitorings)}
uses
  l3Base {a},
  Block_Const,
  evParaTools,
  k2Tags,
  evSubImplementation,
  Document_Const,
  nsFolders,
  nsTagNodeTools,
  LeafParaDecorationsHolder_Const,
  CommentPara_Const,
  ParaList_Const,
  LeafPara_Const
  {$If not defined(NoVCM)}
  ,
  StdRes
  {$IfEnd} //not NoVCM
  
  {$If not defined(NoVCM)}
  ,
  vcmBase
  {$IfEnd} //not NoVCM
  ,
  ConsultingUnit,
  DataAdapter
  {$If not defined(NoVCM)}
  ,
  vcmGUI
  {$IfEnd} //not NoVCM
  
  {$If not defined(NoVCM)}
  ,
  vcmForm
  {$IfEnd} //not NoVCM
  ,
  nsConst,
  nsExternalObject,
  nsValueMaps,
  nsValueMapsIDs,
  bsChangeRedationWorker,
  eeEditorExport,
  l3Bits,
  evdTypes,
  l3Chars,
  l3String,
  evTypes,
  BaseTreeSupportUnit,
  FoldersUnit,
  BaseTypesUnit,
  nsDocumentTools,
  eePara,
  eeInterfacesEx,
  eeParaTools,
  F1Like_InternalOperations_Controls,
  evSubPn
  {$If not defined(NoVCM)}
  ,
  vcmUtils
  {$IfEnd} //not NoVCM
  ,
  StartUnit,
  evCustomEditor,
  FoldersDomainInterfaces,
  Controls,
  deSimpleTree,
  F1TagDataProviderInterface,
  Graphics,
  WarningConst,
  ControlStatusUtils,
  resWarnImages,
  bsDocumentMissingMessage,
  bsUtils,
  nsInternalPictureData,
  BitmapPara_Const,
  Base_Operations_AAC_Controls,
  AACTextContainerPrim_Form,
  k2Const,
  vtReminderUtils,
  l3MessageID,
  nsTrialSupport,
  bsDocumentContextSearcher,
  afwFacade,
  Printers,
  l3Stream,
  l3Types,
  SysUtils,
  nsUtils,
  nsToMSWordOp
  {$If not defined(NoScripts)}
  ,
  tfwScriptingInterfaces
  {$IfEnd} //not NoScripts
  ,
  evdBlockNameAdder
  {$If not defined(NoVCM)}
  ,
  vcmMessagesSupport
  {$IfEnd} //not NoVCM
  ,
  nsExportToFileEvent,
  nsExportToWordEvent,
  nsSendDocumentByEMailEvent,
  nsDocumentPrintPreviewEvent,
  nsBaseTextOperationsConst,
  f1MultylinkResolver,
  nsQuestions,
  nsExternalObjectModelPart,
  nsSearchInDocumentEvent,
  l3InterfacesMisc,
  nsManagers,
  bsConvert,
  nsTimeMachineOffEvent,
  nsHyperLinkProcessor,
  deDocInfo,
  nsOpenUtils,
  DocumentRes,
  vtUtils,
  evdStyles,
  evOp,
  DynamicTreeUnit,
  ExternalObjectUnit,
  nsDocumentFromListNavigationEvent
  {$If defined(Nemesis)}
  ,
  nscStatusBarItemDef
  {$IfEnd} //Nemesis
  
  {$If defined(Nemesis)}
  ,
  nscStatusBarOperationDef
  {$IfEnd} //Nemesis
  
  {$If defined(Nemesis)}
  ,
  nscStatusBarDelimiterDef
  {$IfEnd} //Nemesis
  ,
  DocumentUtil
  {$If defined(Nemesis)}
  ,
  nscStatusBarOperationDefsList
  {$IfEnd} //Nemesis
  ,
  Common_FormDefinitions_Controls,
  evConstStringData,
  evdHyperlinkInfo,
  nsHyperlinkToDocumentProducerConst
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}

type _Instance_R_ = TExTextForm;

{$Include ..\Forms\SearcheableText.imp.pas}

{$Include w:\garant6x\implementation\Garant\GbaNemesis\View\PageControlNotification.imp.pas}

{$Include w:\garant6x\implementation\Garant\GbaNemesis\View\Document\TurnOnTimeMachine.imp.pas}

{$Include w:\garant6x\implementation\Garant\GbaNemesis\View\Document\TurnOffTimeMachine.imp.pas}


{$Include w:\garant6x\implementation\Garant\GbaNemesis\View\WorkWithRedactions.imp.pas}


{$Include w:\garant6x\implementation\Garant\GbaNemesis\View\DocumentPresentation.imp.pas}


{$Include w:\garant6x\implementation\Garant\GbaNemesis\View\HyperlinkProcessor.imp.pas}


{$Include w:\garant6x\implementation\Garant\GbaNemesis\View\TextWithComments.imp.pas}

{$Include w:\garant6x\implementation\Garant\GbaNemesis\View\DocumentUserTypes.imp.pas}


{$Include w:\garant6x\implementation\Garant\GbaNemesis\View\BlockSelector.imp.pas}

{$Include w:\garant6x\implementation\Garant\GbaNemesis\View\CommonForTextAndFlashOperations.imp.pas}

{$Include w:\garant6x\implementation\Garant\GbaNemesis\View\HyperlinkOperations.imp.pas}

type
  TnsSwitchVersionCommentsEvent = class(TnsLogEvent)
  public
  // public methods
   class procedure Log(State: Boolean);
  end;//TnsSwitchVersionCommentsEvent

// start class TnsSwitchVersionCommentsEvent

class procedure TnsSwitchVersionCommentsEvent.Log(State: Boolean);
//#UC START# *4B0E6ED502E0_4B0E6EAD01D9_var*
const
 cMap: array [Boolean] of Cardinal = (0, 1);
var
 l_Data: ILogEventData;
//#UC END# *4B0E6ED502E0_4B0E6EAD01D9_var*
begin
//#UC START# *4B0E6ED502E0_4B0E6EAD01D9_impl*
 l_Data := MakeParamsList;
 l_Data.AddULong(cMap[State]);
 GetLogger.AddEvent(LE_SWITCH_VERSION_COMMENTS, l_Data);
//#UC END# *4B0E6ED502E0_4B0E6EAD01D9_impl*
end;//TnsSwitchVersionCommentsEvent.Log

type
  TnsTextTabActivateKind = (
    ttakRelated
  , ttakAnnotation
  );//TnsTextTabActivateKind

  TnsTextTabActivateEvent = class(TnsLogEvent)
  public
  // public methods
   class procedure Log(const aDoc: IDocument;
     aKind: TnsTextTabActivateKind);
  end;//TnsTextTabActivateEvent

// start class TnsTextTabActivateEvent

class procedure TnsTextTabActivateEvent.Log(const aDoc: IDocument;
  aKind: TnsTextTabActivateKind);
//#UC START# *4B0E700600BA_4B0E6F160372_var*
var
 l_Data: ILogEventData;
const
  cMap: array [TnsTextTabActivateKind] of TLogEvent = (LE_OPEN_RELATED, LE_OPEN_ANNOTATION);
//#UC END# *4B0E700600BA_4B0E6F160372_var*
begin
//#UC START# *4B0E700600BA_4B0E6F160372_impl*
 l_Data := MakeParamsList;
 l_Data.AddObject(aDoc);
 GetLogger.AddEvent(cMap[aKind], l_Data);
//#UC END# *4B0E700600BA_4B0E6F160372_impl*
end;//TnsTextTabActivateEvent.Log

type
  TnsDocumentPointWaiter = class(TevSubWaiter)
   {* ����� ��� �������� �������� �� ��������� ����� ��������� }
  private
  // private fields
   f_Pos : TbsDocPos;
   f_Form : TExTextForm;
  protected
  // overridden protected methods
   procedure Cleanup; override;
     {* ������� ������� ����� �������. }
   function TrySelectPara(const aContainer: InevDocumentContainer;
    const aSel: InevSelection;
    aParaID: Integer): Boolean; override;
  public
  // public methods
   constructor Create(aForm: TExTextForm;
      const aPos: TbsDocPos); reintroduce;
   class function Make(aForm: TExTextForm;
      const aPos: TbsDocPos): InevWaiter; reintroduce;
     {* ��������� ������� TnsDocumentPointWaiter.Make }
  end;//TnsDocumentPointWaiter

// start class TnsDocumentPointWaiter

constructor TnsDocumentPointWaiter.Create(aForm: TExTextForm;
  const aPos: TbsDocPos);
//#UC START# *4C0669610060_4C066918002D_var*
//#UC END# *4C0669610060_4C066918002D_var*
begin
//#UC START# *4C0669610060_4C066918002D_impl*
 inherited Create(aForm.Text, aPos.rPos, DocPosTypeToEdtSubType(aPos.rRefType));
 f_Pos := aPos;
 f_Form := aForm;
//#UC END# *4C0669610060_4C066918002D_impl*
end;//TnsDocumentPointWaiter.Create

class function TnsDocumentPointWaiter.Make(aForm: TExTextForm;
  const aPos: TbsDocPos): InevWaiter;
var
 l_Inst : TnsDocumentPointWaiter;
begin
 l_Inst := Create(aForm, aPos);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

procedure TnsDocumentPointWaiter.Cleanup;
//#UC START# *479731C50290_4C066918002D_var*
//#UC END# *479731C50290_4C066918002D_var*
begin
//#UC START# *479731C50290_4C066918002D_impl*
 Finalize(f_Pos);
 f_Form := nil;
 inherited;
//#UC END# *479731C50290_4C066918002D_impl*
end;//TnsDocumentPointWaiter.Cleanup

function TnsDocumentPointWaiter.TrySelectPara(const aContainer: InevDocumentContainer;
  const aSel: InevSelection;
  aParaID: Integer): Boolean;
//#UC START# *4BFFA0FF01D2_4C066918002D_var*
var
 l_Tag   : InevTag;
 l_Para  : InevPara;
 l_Block : InevTag;
 l_Doc   : InevTag;
 l_Part  : IevDocumentPart;
 l_Obj   : InevObject;
 l_Fmt   : TnevFormatInfoPrim;
 l_Addr  : TevAddress;
 l_SubHandle : Integer;
//#UC END# *4BFFA0FF01D2_4C066918002D_var*
begin
//#UC START# *4BFFA0FF01D2_4C066918002D_impl*
 Result := inherited TrySelectPara(aContainer, aSel, aParaID);
 try
  if not Result then
  begin
   //http://mdp.garant.ru/pages/viewpage.action?pageId=420416039
   if ((f_Form.Text.AACLike = nev_aacLeft) and ((f_Pos.rRefType <> dptPara)
    or ((f_Pos.rRefType = dptSub) and (f_Pos.rPos <> 0)))) then
   begin
    f_Form.Text.Try2GoByHyperlinkUnderCursor;
    Exit;
   end // if Text.AACLike = nev_aacLeft then
   else
   // "�������� �������������" - ������� � �������� ������ � ����� �����
   // �� ����������� � ������ ����� ���������
   // http://mdp.garant.ru/pages/viewpage.action?pageId=420416039
   if ((f_Form.Text.AACLike = nev_aacLeft) and (f_Pos.rRefType = dptPara)) and
      f_Form.AAC.Right.HasDoc then
   begin
    // ������ �������� � ������ �����
    if f_Form.AAC.Right.Container.FindObjByID(f_Pos.rPos, l_Obj) then
    try
     if Supports(l_Obj, InevPara, l_Para) then
     try
      l_SubHandle := l_Para.rAtomEx([k2_tiSubs, k2_tiChildren, k2_tiHandle, ev_sbtSub,
       k2_tiChildren, k2_tiByIndex, 0]).IntA[k2_tiHandle];
      if (l_SubHandle <= 0) then
       if evInPara(l_Para, k2_idBlock, l_Block) then
        l_SubHandle := l_Block.IntA[k2_tiHandle];
      if (l_SubHandle > 0) then
      begin
       l_Addr := TevAddress_C(-1, l_SubHandle);
       if (f_Form.Text.SearchHyperLinkAddress(true, true, l_Addr)) then
        Exit;
      end;//if (l_SubHandle > 0) then
     finally
      l_Para := nil;
     end;//try..finally
    finally
     l_Obj := nil;
    end;//try..finally
   end;// if ((f_Form.Text.AACLike = nev_aacLeft) and (f_Pos.rRefType = dptPara))
   if (f_Pos.rPara <> nil) then
   // - http://mdp.garant.ru/pages/viewpage.action?pageId=217157085
   begin
    Result := true;
    // - ����� �����������
    if f_Form.GotoSub(f_Pos.rPara) then
     Exit;
    if Supports(f_Pos.rPara, InevTag, l_Tag) then
     try
      if l_Tag.QT(InevPara, l_Para) then
       try
        if evInPara(l_Para, k2_idBlock, l_Block) AND
           (l_Block.IntA[k2_tiLayerID] = ev_sbtSub) then
        begin
         if evInPara(l_Block, k2_idDocument, l_Doc) then
         begin
          l_Part := TevDocumentPartImplementation.Make(l_Doc,
                                                       nil,
                                                       l_Block.IntA[k2_tiHandle],
                                                       l_Block.IntA[k2_tiLayerID]);
          try
           if f_Form.GotoBlock(l_Part) then
            Exit;
          finally
           l_Part := nil;
          end;//try..finally
         end;//evInPara(l_Block, k2_idDocument, l_Doc)
        end;//evInPara(l_Para, k2_idBlock, l_Block)
       finally
        l_Para := nil;
       end;//try..finally
     finally
      l_Tag := nil;
     end;//try..finally
    Result := false;
   end;//f_Pos.rPara <> nil
  end;//not Result
 finally
  if Result then
  // - ����� ���� ����� �������� �����������, ���� ��������� �� �����
  // http://mdp.garant.ru/pages/viewpage.action?pageId=236718088
  begin
   if (f_Form <> nil) then
   begin
    with f_Form.Text do
    begin
     if TextSource.DocumentContainer.FindObjByID(aParaID, l_Obj) then
     begin
      if (l_Obj <> nil) then
      begin
       l_Fmt := View.FormatInfoByPara(l_Obj);
       if (l_Fmt <> nil) AND l_Fmt.IsHidden(true, true) then
       begin
        if not l_Obj.QT(InevPara, l_Para) then
         Assert(false);
        if l_Para.IsLegalComment then
        begin
         if l_Para.IsComment then
          ShowComments := True
         else
         begin
          {$IfDef evNeedCollapsedVersionComments}
          View.IsObjectCollapsed[l_Para] := false;
          {$Else evNeedCollapsedVersionComments}
          ShowVersionComments := True;
          {$EndIf evNeedCollapsedVersionComments}
         end;//l_Para.IsComment
         InevSelection(Selection).SelectPoint(l_Para.MakePoint, true);
        end;//l_Para.IsLegalComment
       end;//l_Obj.IsHidden(aView.Metrics, aView.FormatInfoByPara(l_Obj), true)
      end;//l_Obj <> nil
     end;//TextSource.DocumentContainer.FindObjByID(aParaID, l_Obj)
    end;//with f_Form.Text
   end;//f_Form <> nil
  end;//Result
 end;//try..finally
//#UC END# *4BFFA0FF01D2_4C066918002D_impl*
end;//TnsDocumentPointWaiter.TrySelectPara

procedure TExTextForm.DoFindInDict;
//#UC START# *4C80FB6E0249_49539DBA029D_var*

 function DeleteEndlines(const S: Il3CString): Il3CString;
 begin//DeleteEndlines
  Result := S;
  l3Replace(Result, [#$D], cc_HardSpace);
  l3DeleteChars(Result, [#$A]);
 end;//DeleteEndlines

var
 l_Str : Il3CString;
 l_Range: InevRange;
 l_Pt: InevBasePoint;
//#UC END# *4C80FB6E0249_49539DBA029D_var*
begin
//#UC START# *4C80FB6E0249_49539DBA029D_impl*
 if (ViewArea <> nil) AND defDataAdapter.IsExplanatoryExists then
 begin
  if (Text.HasSelection) then
   l_Range := InevSelection(Text.Selection).GetBlock
  else
  begin
   l_Pt := Text.Selection.Cursor.ClonePoint(Text.View);
   l_Range := l_Pt.Obj.Range;
   l_Range.Select(Text.View, l_Pt, ev_stWord);
  end;
  if not l_Range.Collapsed(Text.View) then
   l_Str := DeleteEndlines(l3Trim(evAsString(l_Range.Data)))
  else
   l_Str := nil;
  TdmStdRes.OpenTermByContext(l_Str, ViewArea.Language);
 end;//ViewArea <> nil
//#UC END# *4C80FB6E0249_49539DBA029D_impl*
end;//TExTextForm.DoFindInDict

procedure TExTextForm.DoFocusViaMouseSet(aSender: TObject);
//#UC START# *4E7B48CB02C1_49539DBA029D_var*
//#UC END# *4E7B48CB02C1_49539DBA029D_var*
begin
//#UC START# *4E7B48CB02C1_49539DBA029D_impl*
 if Op_Contents_IsContentsVisible.Call(Aggregate) then
  Op_Contents_ToggleContentsVisibility.Call(Aggregate);
//#UC END# *4E7B48CB02C1_49539DBA029D_impl*
end;//TExTextForm.DoFocusViaMouseSet

procedure TExTextForm.TextSourceTOCCreated(aSender: TObject;
  const aTOC: Il3SimpleTree);
//#UC START# *4EBAB1080234_49539DBA029D_var*
var
 l_Adornments : InsDocumentAdornments;
//#UC END# *4EBAB1080234_49539DBA029D_var*
begin
//#UC START# *4EBAB1080234_49539DBA029D_impl*
 Supports(Text.TextSource.DocumentContainer, InsDocumentAdornments, l_Adornments);
 try
  CreateTOC(TdeSimpleTree.Make(aTOC, l_Adornments));
 finally
  l_Adornments := nil;
 end;//try..finally
 TdmStdRes.CheckBaseSearchDataReady(NativeMainForm);
//#UC END# *4EBAB1080234_49539DBA029D_impl*
end;//TExTextForm.TextSourceTOCCreated

procedure TExTextForm.TextSourceMakeDocumentContainer(Sender: TObject;
  var aMade: InevDocumentContainer);
//#UC START# *4EBAB3C4024F_49539DBA029D_var*
var
 l_Container : InevDocumentContainer;
//#UC END# *4EBAB3C4024F_49539DBA029D_var*
begin
//#UC START# *4EBAB3C4024F_49539DBA029D_impl*
 if (ViewArea <> nil) then
 begin
  l_Container := ViewArea.Container;
  if (l_Container <> nil) then
  begin
   aMade := l_Container;
   InvalidateDataSources;
  end;//if l_Container <> nil then
 end;//ViewArea <> nil
//#UC END# *4EBAB3C4024F_49539DBA029D_impl*
end;//TExTextForm.TextSourceMakeDocumentContainer

procedure TExTextForm.TextSourceDocumentChanged(aSender: TObject;
  const anOldDocument: Ik2Tag;
  const aNewDocument: Ik2Tag);
//#UC START# *4EBAB40900C2_49539DBA029D_var*

 function GetDocumentName(const aDocument: IDocument): Il3CString;
 begin
//  Result := nsGetDocumentShortName(aDocument);
  Result := nsGetDocumentName(aDocument);
 end;

var
 l_Document: IDocument;
//#UC END# *4EBAB40900C2_49539DBA029D_var*
begin
//#UC START# *4EBAB40900C2_49539DBA029D_impl*
 CloseAllReminderBaloons(Self);
 TdmStdRes.CheckBaseSearchDataReady(NativeMainForm);
 if (aNewDocument <> nil) and
    l3IOk(aNewDocument.Owner.QueryInterface(IDocument, l_Document)) then
 begin
  case UserType of
   dftDocument, dftDictEntry, dftTips, dftMedDictEntry, dftMedicFirm:
   begin
    if not TdmStdRes.IsCurEditionActual(l_Document) then
     CCaption := vcmFmt(str_nsRedactionCaption, [GetDocumentName(l_Document)])
    else
     CCaption := l3Cat(CurUserType.Caption + ' : ', GetDocumentName(l_Document));
   end;//dftDocument..
   dftAutoreferat, dftAutoreferatAfterSearch:
   begin
    CCaption := GetDocumentName(l_Document);
    Dispatcher.UpdateStatus;
   end;//dftAutoreferat..
   dftAACLeft, {dftAACRight, }
   dftAACContentsRight{, dftAACContentsLeft}:
   begin
    // �������. ������ �� ����������� ��������: �380043923
    CCaption := GetDocumentName(l_Document);
    TvcmEntityForm(Container.AsForm.VCLWinControl).CCaption := l3Cat([str_dftDocumentCaption.AsCStr, vcmCStr(' : '), CCaption]);
    Dispatcher.UpdateStatus;
   end;
   dftDrug:
    CCaption := l3Cat(CurUserType.Caption + ' : ', GetDocumentName(l_Document));
     // - ������ ������ ������ ��� (CQ: OIT5-29237);
  end;//case UserType
  LoadFromSettings;
  ContextChanged(nil);
  CheckLinkedWindows;
 end;//aNewDocument <> nil..
//#UC END# *4EBAB40900C2_49539DBA029D_impl*
end;//TExTextForm.TextSourceDocumentChanged

procedure TExTextForm.OnHistoryState(Sender: TObject;
  var IsLast: Boolean);
//#UC START# *4EBAB68B0050_49539DBA029D_var*
//#UC END# *4EBAB68B0050_49539DBA029D_var*
begin
//#UC START# *4EBAB68B0050_49539DBA029D_impl*
 IsLast := Dispatcher.History.IsLast;
//#UC END# *4EBAB68B0050_49539DBA029D_impl*
end;//TExTextForm.OnHistoryState

procedure TExTextForm.GoToIntranetPrim(aNeedCheck: Boolean);
//#UC START# *4F184AD903C9_49539DBA029D_var*
var
 l_Para: IeePara;
 l_ParaID: LongWord;
//#UC END# *4F184AD903C9_49539DBA029D_var*
begin
//#UC START# *4F184AD903C9_49539DBA029D_impl*
 l_Para := GetTopParaID;
 if Assigned(l_Para) then
  l_Para := eeFindNumberedPara(l_Para, Text as IeeDocumentEx);
 if Assigned(l_Para) then
  l_ParaID := l_Para.ID
 else
  l_ParaID := 0;
 DefDataAdapter.OpenIntranetDocument(Document.GetInternalId, l_ParaID, aNeedCheck);
//#UC END# *4F184AD903C9_49539DBA029D_impl*
end;//TExTextForm.GoToIntranetPrim

procedure TExTextForm.SetFocusToTextInAAC;
//#UC START# *4FF4378900EB_49539DBA029D_var*
//#UC END# *4FF4378900EB_49539DBA029D_var*
begin
//#UC START# *4FF4378900EB_49539DBA029D_impl*
 if (UserType = dftAACLeft) OR (UserType = dftAACContentsLeft) then
  SetFocusToText;
//#UC END# *4FF4378900EB_49539DBA029D_impl*
end;//TExTextForm.SetFocusToTextInAAC

function TExTextForm.GetCorrespondentListTest: Boolean;
//#UC START# *50111C6102B7_49539DBA029D_var*
//#UC END# *50111C6102B7_49539DBA029D_var*
begin
//#UC START# *50111C6102B7_49539DBA029D_impl*
//  if (ZoneType = vcm_ztChild) then
//  begin
//   Result := False;
//   Exit;
//  end;    ����������� ����� ExcludeUserType http://mdp.garant.ru/pages/viewpage.action?pageId=379233069&focusedCommentId=379249025#comment-379249025
 if Assigned(dsDocument) then
 begin
  if DocumentIsValid then
   Result := DocumentSet.HasCorrespondents
  else
   Result := False;
 end;//Assigned(dsDocument)
//#UC END# *50111C6102B7_49539DBA029D_impl*
end;//TExTextForm.GetCorrespondentListTest

function TExTextForm.GetRespondentListTest: Boolean;
//#UC START# *50111CAC03B5_49539DBA029D_var*
//#UC END# *50111CAC03B5_49539DBA029D_var*
begin
//#UC START# *50111CAC03B5_49539DBA029D_impl*
//  if (ZoneType = vcm_ztChild) then
//  begin
//   Result := False;
//   Exit;
//  end;         ����������� ����� ExcludeUserType http://mdp.garant.ru/pages/viewpage.action?pageId=379233069&focusedCommentId=379249025#comment-379249025
 if Assigned(dsDocument) then
 begin
  if DocumentIsValid then
   Result := DocumentSet.HasRespondents
  else
   Result := False;
 end;
//#UC END# *50111CAC03B5_49539DBA029D_impl*
end;//TExTextForm.GetRespondentListTest

procedure TExTextForm.CheckLinkedWindows;
//#UC START# *502D3AFC0282_49539DBA029D_var*
var
 l_Addr : TevAddress;
//#UC END# *502D3AFC0282_49539DBA029D_var*
begin
//#UC START# *502D3AFC0282_49539DBA029D_impl*
 if (UserType = dftAACContentsLeft) then
  if Assigned(dsDocument) and
     Assigned(dsDocument.DocInfo) then
  begin
   if (dsDocument.DocInfo.Pos.rRefType = dptSub) then
   begin
    //if not Dispatcher.History.InBF then
    begin
     l_Addr := TevAddress_C(-1, dsDocument.DocInfo.Pos.rPos);
     if not Text.SearchHyperLinkAddress(true, true, l_Addr) then
      if (Text.Selection <> nil) then
       //if Text.Selection.Collapsed then
       if Dispatcher.History.InBF then
       begin
        Text.GotoTop;
        //Text.NextHyperlink;
       end;//Dispatcher.History.InBF
     end;//not Dispatcher.History.InBF
   end;//dsDocument.DocInfo.Pos.rRefType = dptSub
  end;//Assigned(dsDocument)
//#UC END# *502D3AFC0282_49539DBA029D_impl*
end;//TExTextForm.CheckLinkedWindows

procedure TExTextForm.DoHyperlinkNavigate(Sender: TObject);
//#UC START# *502D43D50306_49539DBA029D_var*
//#UC END# *502D43D50306_49539DBA029D_var*
begin
//#UC START# *502D43D50306_49539DBA029D_impl*
 if (UserType = dftAACContentsLeft) then
  if (dsDocument <> nil) then
   if not Dispatcher.History.InBF then
    if (Text <> nil) AND Text.HasDocument then
    begin
     Text.OnHyperlinkNavigate := nil;
     try
      Self.OpenHyperlink;
     finally
      Text.OnHyperlinkNavigate := Self.DoHyperlinkNavigate;
     end;//try..finally
    end;//Text <> nil
//#UC END# *502D43D50306_49539DBA029D_impl*
end;//TExTextForm.DoHyperlinkNavigate

function TExTextForm.CheckParamForUserType(aUserType: Integer): Boolean;
//#UC START# *4A8EEFED022C_49539DBA029D_var*
//#UC END# *4A8EEFED022C_49539DBA029D_var*
begin
//#UC START# *4A8EEFED022C_49539DBA029D_impl*
 if (aUserType = dftNone) then
  Result := true
 else
 begin
  // � ����� �� � ���� �������� ������ ��� ������?
  // �� ������-�� ����� �� �����...
  Result := (UserType <> dftNone) and
            (aUserType <> dftNone) and
            ((UserType = aUserType) or
             ((UserType in [dftAACLeft]) and
              (aUserType = dftDocument)
             )
            );
 end;
//#UC END# *4A8EEFED022C_49539DBA029D_impl*
end;//TExTextForm.CheckParamForUserType

procedure TExTextForm.DisableOperation(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3AED97022A_49539DBA029D_var*
//#UC END# *4C3AED97022A_49539DBA029D_var*
begin
//#UC START# *4C3AED97022A_49539DBA029D_impl*
 aParams.Op.Flag[vcm_ofEnabled] := False;
//#UC END# *4C3AED97022A_49539DBA029D_impl*
end;//TExTextForm.DisableOperation

procedure TExTextForm.CRToPartTest(const aParams: IvcmTestParamsPrim;
  aCRType: TlstCRType);
//#UC START# *4C3B036300C4_49539DBA029D_var*
var
 l_Strings : IvcmStrings;
 l_List    : IvcmNodes;
//#UC END# *4C3B036300C4_49539DBA029D_var*
begin
//#UC START# *4C3B036300C4_49539DBA029D_impl*
 with aParams do
 begin
  if (ZoneType = vcm_ztChild) then
   Op.Flag[vcm_ofEnabled] := False
  else
   aParams.Op.Flag[vcm_ofEnabled] := Assigned(Document) and
                                     Text.HasSelection;
  if Op.Flag[vcm_ofEnabled] and
     Assigned(dsDocument) and
     Assigned(dsDocument.DocInfo) then
  begin
   with DocumentSet do
    case aCRType of
     crtCorrespondents:
      Op.Flag[vcm_ofEnabled] := HasCorrespondents;
     crtRespondents:
      Op.Flag[vcm_ofEnabled] := HasRespondents;
    end;//case aCRType of
   l_Strings := Op.SubItems;
   if Assigned(l_Strings) then
   try
    l_Strings.Clear;
    l_List := Op.SubNodes;
    if (l_List.Count = 0) then
     l_List.Add(DefDataAdapter.CRSimpleListTypeRootNode);
   finally
    l_Strings := nil;
   end;//try..finally
  end;//if Op.Flag[vcm_ofVisible]
 end;//with aParams do
//#UC END# *4C3B036300C4_49539DBA029D_impl*
end;//TExTextForm.CRToPartTest

procedure TExTextForm.CRToPartExecute(const aParams: IvcmExecuteParamsPrim;
  aCRType: TlstCRType);
//#UC START# *4C3B0399027D_49539DBA029D_var*
//#UC END# *4C3B0399027D_49539DBA029D_var*
begin
//#UC START# *4C3B0399027D_49539DBA029D_impl*
 if (UserType = dftDocument) then
  OpenCRListToPart(aCRType, aParams.CurrentNode);
//#UC END# *4C3B0399027D_49539DBA029D_impl*
end;//TExTextForm.CRToPartExecute

procedure TExTextForm.TurnOnTimeMachine(const aDate: Il3CString);
//#UC START# *4C3B040002CA_49539DBA029D_var*
var
 l_Date: BaseTypesUnit.TDate;
//#UC END# *4C3B040002CA_49539DBA029D_var*
begin
//#UC START# *4C3B040002CA_49539DBA029D_impl*
 // ��� ������ � ��������� ���� ���������� ���������� ��������
 // (TControl.Click), ����������� ��� ��������:
 if l3Same(aDate, DefDataAdapter.TimeMachine.DateStr) then
  Exit;
 // ��������� �������� �� ����
 try
  DecodeDate(nsStrToDate(aDate),
             l_Date.rYear, l_Date.rMonth, l_Date.rDay);
 except
  on EConvertError do
  begin
   if not l3CharSetPresent(aDate, cc_Digits) then
    TimeMachineOnOff(True);
   Exit;
  end;//on EConvertError
 end;//try..except
 nsTimeMachineOn(Document, l_Date);
//#UC END# *4C3B040002CA_49539DBA029D_impl*
end;//TExTextForm.TurnOnTimeMachine

procedure TExTextForm.OpenContents(aMode: TnsContentsOpenMode);
//#UC START# *4C3B3D3A0254_49539DBA029D_var*
var
 l_ST : Il3SimpleTree;
 l_SimpleTree : IdeSimpleTree;
 l_Adornments : InsDocumentAdornments;
//#UC END# *4C3B3D3A0254_49539DBA029D_var*
begin
//#UC START# *4C3B3D3A0254_49539DBA029D_impl*
 // �� InClose ���������, ������, ��� �����, ������� ��������� � ���������
 // ����������� �������� ���������� ���� ��������� � ��� ���������� ����������
 // ������, � ���������� ���������� �����, ��� �� ���������. �������� ��� �����
 // ���������� �� �������� ������ � ���������� �� ����� ������������ �� ������
 // vcmFormSetFactory:
 if not (Self.as_IvcmEntityForm).InClose and (DocumentWithContents <> nil) then
 begin
  l_ST := FiltrateTOCTree(Text.TextSource.ContentsTree);
  try
   if (l_ST <> nil) then
    if (l_ST.CountView = 0) then
     l_ST := nil;
   Supports(Text.TextSource.DocumentContainer, InsDocumentAdornments, l_Adornments);
   try
    l_SimpleTree := TdeSimpleTree.Make(l_ST, l_Adornments);
    try
     if not l_SimpleTree.Empty then
      DocumentWithContents.OpenContents(l_SimpleTree, aMode, Text.TextSource.DocumentContainer);
    finally
     l_SimpleTree := nil;
    end;//try..finally
   finally
    l_Adornments := nil;
   end;//try..finally
  finally
   l_ST := nil;
  end;//try..finally
 end;//not (Self.as_IvcmEntityForm).InClose and (DocumentWithContents <> nil)
//#UC END# *4C3B3D3A0254_49539DBA029D_impl*
end;//TExTextForm.OpenContents

function TExTextForm.FiltrateTOCTree(const aTOC: Il3SimpleTree;
  NeedFiltrate: Boolean = True): Il3SimpleTree;
//#UC START# *4C3B3E270109_49539DBA029D_var*
(*var
 l_FilterableTree: Il3FilterableTree;
 l_Dummy: Integer;*)
//#UC END# *4C3B3E270109_49539DBA029D_var*
begin
//#UC START# *4C3B3E270109_49539DBA029D_impl*
{ if NeedFiltrate and Supports(aTOC, Il3FilterableTree, l_FilterableTree) then
  Result := l_FilterableTree.MakeFiltered(l_FilterableTree.CloneFilters, nil, l_Dummy)
 else}
  Result := aTOC;
//#UC END# *4C3B3E270109_49539DBA029D_impl*
end;//TExTextForm.FiltrateTOCTree

procedure TExTextForm.ShowWarningPage(SwitchActivity: Boolean;
  anOffset: TnsWarningSub = cNoneWarningSub);
//#UC START# *4C3B4CCF0068_49539DBA029D_var*

 function lp_NeedOpen: Boolean;
 begin
  if FormIsMainInDocumentSet and Assigned(dsDocument) then
  begin
   if SwitchActivity then
    Result := not Op_Warning_SwitchActive.Call(Aggregate, anOffset)
   else
    Result := not Op_Warning_BecomeActive.Call(Aggregate, anOffset);
   // http://mdp.garant.ru/pages/viewpage.action?pageId=260447845&focusedCommentId=271192159#comment-271192159
   // - ��������� ��� ������ ���������, �� �������� ������� � �� ��������,
   //   ����� ����� ������� ���� � ������. 
  end//FormIsMainInDocumentSet and Assigned(dsDocument)
  else
   Result := false;
 end;//lp_NeedOpen

//#UC END# *4C3B4CCF0068_49539DBA029D_var*
begin
//#UC START# *4C3B4CCF0068_49539DBA029D_impl*
 if (DocumentSet <> nil) AND lp_NeedOpen then
  DocumentSet.OpenWarning;
//#UC END# *4C3B4CCF0068_49539DBA029D_impl*
end;//TExTextForm.ShowWarningPage

function TExTextForm.GetVisibleBookmarksCount(const aBookmarks: IeeSubList): Integer;
//#UC START# *4C3EC2DE00A4_49539DBA029D_var*
var
 I: Integer;
//#UC END# *4C3EC2DE00A4_49539DBA029D_var*
begin
//#UC START# *4C3EC2DE00A4_49539DBA029D_impl*
 Result := 0;
 if Assigned(aBookmarks) then
  for I := 0 to Pred(aBookmarks.Count) do
   if aBookmarks.Subs[I].Flags and ev_sfOwn = ev_sfOwn then
    Inc(Result);
//#UC END# *4C3EC2DE00A4_49539DBA029D_impl*
end;//TExTextForm.GetVisibleBookmarksCount

function TExTextForm.GetVisibleBookmark(const aBookmarks: IeeSubList;
  anIndex: Integer = 0): IeeSub;
//#UC START# *4C3EC308025F_49539DBA029D_var*
var
 CurIndex,
 I: Integer;
//#UC END# *4C3EC308025F_49539DBA029D_var*
begin
//#UC START# *4C3EC308025F_49539DBA029D_impl*
 Result := nil;
 CurIndex := 0;
 if Assigned(aBookmarks) then
  for I := 0 to Pred(aBookmarks.Count) do
   if aBookmarks.Subs[I].Flags and ev_sfOwn = ev_sfOwn then
   begin
    if CurIndex = anIndex then
    begin
     Result := aBookmarks.Subs[I];
     break;
    end;
    Inc(CurIndex);
   end;
//#UC END# *4C3EC308025F_49539DBA029D_impl*
end;//TExTextForm.GetVisibleBookmark

procedure TExTextForm.EditBookmark(anID: Integer);
//#UC START# *4C3EC3570265_49539DBA029D_var*
var
 l_FoldersNode : IFoldersNode;
 l_Entity      : IvcmEntity;
//#UC END# *4C3EC3570265_49539DBA029D_var*
begin
//#UC START# *4C3EC3570265_49539DBA029D_impl*
 if nsFindBookmarkForEditInFolders(anID, l_FoldersNode, l_Entity, true, Text.TextSource.DocumentContainer) then
  try
   Op_FoldersControl_EditElement.Call(l_Entity, l_FoldersNode);
  finally
   l_Entity := nil;
   l_FoldersNode := nil;
  end//try..finally
 else
  Say(war_EditMissingBookmark);
//#UC END# *4C3EC3570265_49539DBA029D_impl*
end;//TExTextForm.EditBookmark
var
  g_GoToIntranetMessage : THandle;


function TExTextForm.NeedShowIntranetWarning: Boolean;
//#UC START# *4C40039C03CD_49539DBA029D_var*
//#UC END# *4C40039C03CD_49539DBA029D_var*
begin
//#UC START# *4C40039C03CD_49539DBA029D_impl*
 {$IfDef nsTest}
 if NeedShowIntranetWarningHack then
  Result := Assigned(Document)
 else
 {$EndIf nsTest}
  Result := defDataAdapter.RevisionCheckEnabled and
            Assigned(Document) and
            {Document.GetNewRevisionAvailable}
            (Document.GetChangeStatus <> 0)
            ;
//#UC END# *4C40039C03CD_49539DBA029D_impl*
end;//TExTextForm.NeedShowIntranetWarning

procedure TExTextForm.GoToIntranet;
//#UC START# *4C4003D00232_49539DBA029D_var*
//#UC END# *4C4003D00232_49539DBA029D_var*
begin
//#UC START# *4C4003D00232_49539DBA029D_impl*
 f_InGoToInternet := True;
 try
  f_NeedAnnoingCheck := False; // http://mdp.garant.ru/pages/viewpage.action?pageId=352453000
  Case MessageDlg(str_InActualDocumentAction,
                  [BsControlStatusHint(Document.GetChangeStatus, true)]) of
   -1:
    GoToIntranetPrim(true);
   -2, mrCancel : // mrCancel - ��� ��������� �������� ���� (�� Esc)
    // - ������ �� ������
    ;
   else
    Assert(false);
  end;//Case MessageDlg(str_InActualDocumentAction..
 finally
  f_InGoToInternet := False;
 end;
//#UC END# *4C4003D00232_49539DBA029D_impl*
end;//TExTextForm.GoToIntranet

procedure TExTextForm.CheckForcedQueryForIntranet;
//#UC START# *4C40042A0193_49539DBA029D_var*
//#UC END# *4C40042A0193_49539DBA029D_var*
begin
//#UC START# *4C40042A0193_49539DBA029D_impl*
 {$IfDef nsTest}
 if not NeedShowIntranetWarningHack then
 {$EndIf nsTest}
  if f_NeedAnnoingCheck and NeedShowIntranetWarning then
  begin
   f_NeedAnnoingCheck := False;
   PostMessage(Handle, g_GoToIntranetMessage, 0, 0);
  end;//f_NeedAnnoingCheck and NeedShowIntranetWarning
//#UC END# *4C40042A0193_49539DBA029D_impl*
end;//TExTextForm.CheckForcedQueryForIntranet

procedure TExTextForm.RequiestCheckForcedQueryForInternet;
//#UC START# *4C931477005F_49539DBA029D_var*
//#UC END# *4C931477005F_49539DBA029D_var*
begin
//#UC START# *4C931477005F_49539DBA029D_impl*
 f_NeedAnnoingCheck := not f_InGoToInternet and
                       afw.Application.Settings.LoadBoolean(pi_Document_ForceAskForIntranet,
                                                            dv_Document_ForceAskForIntranet);
//#UC END# *4C931477005F_49539DBA029D_impl*
end;//TExTextForm.RequiestCheckForcedQueryForInternet

procedure TExTextForm.UpdateSubPanelDescription;
//#UC START# *4DF1F81F02DE_49539DBA029D_var*
var
 l_Document : IDocument;
 l_SubDescriptors : TevCustomSubDescriptors;
//#UC END# *4DF1F81F02DE_49539DBA029D_var*
begin
//#UC START# *4DF1F81F02DE_49539DBA029D_impl*
 if (UserType in [dftDocument, dftDrug, dftAACLeft]) then
  l_SubDescriptors := nsDocumentRes.SubDescriptors
 else
  l_SubDescriptors := nsDocumentRes.LiteSubDescriptors;
 l_Document := Document;
 with Settings, l_SubDescriptors{SubPanel.SubDescriptors} do
 begin
  SubsLayer.Flag5.Visible := (UserType = dftDocument) and
    LoadBoolean(pi_Document_SubPanel_ShowBlocks,
                dv_Document_SubPanel_ShowBlocks) and
    ((l_Document = nil) or (l_Document.GetDocType <> DT_BOOK));
  if (l_SubDescriptors = nsDocumentRes.LiteSubDescriptors) then
  begin
   BookmarksLayer.Flag2.Visible := false;
   MarksLayer.Flag0.Visible := not Text.ShowComments or
                               LoadBoolean(pi_Document_SubPanel_ShowJurorComments,
                                           dv_Document_SubPanel_ShowJurorComments);
   MarksLayer.Flag1.Visible := Op_Contents_HasUserComments.Call(Aggregate) AND
                               (not Text.ShowUserComments or
                               LoadBoolean(pi_Document_SubPanel_ShowUserComments,
                                           dv_Document_SubPanel_ShowUserComments));
   MarksLayer.Flag2.Visible := false;
   SubsLayer.Visible := LoadBoolean(pi_Document_SubPanel_ShowSubNumbers,
                                    dv_Document_SubPanel_ShowSubNumbers);
  end//l_SubDescriptors = nsDocumentRes.LiteSubDescriptors
  else
  begin
   BookmarksLayer.Flag2.Visible := Op_Contents_HasBookmarks.Call(Aggregate) AND
                                   LoadBoolean(pi_Document_SubPanel_ShowBookmarks,
                                               dv_Document_SubPanel_ShowBookmarks);
   MarksLayer.Flag0.Visible := (not Text.ShowComments or
                               LoadBoolean(pi_Document_SubPanel_ShowJurorComments,
                                           dv_Document_SubPanel_ShowJurorComments));
   MarksLayer.Flag1.Visible := Op_Contents_HasUserComments.Call(Aggregate) AND
                               (not Text.ShowUserComments or
                               LoadBoolean(pi_Document_SubPanel_ShowUserComments,
                                           dv_Document_SubPanel_ShowUserComments));
   MarksLayer.Flag2.Visible := {false}not Text.ShowVersionComments or
                                      LoadBoolean(pi_Document_SubPanel_ShowVersionComments,
                                                  dv_Document_SubPanel_ShowVersionComments);
   SubsLayer.Visible := LoadBoolean(pi_Document_SubPanel_ShowSubNumbers,
                                    dv_Document_SubPanel_ShowSubNumbers);
  end;//l_SubDescriptors = nsDocumentRes.LiteSubDescriptors
 end;//with Settings
 if (SubPanel.SubDescriptors <> l_SubDescriptors) then
  SubPanel.SubDescriptors := l_SubDescriptors;
 SubPanel.Visible := not (UserType in [dftAACRight,
                                       dftAACContentsLeft,
                                       dftAACContentsRight]);
//#UC END# *4DF1F81F02DE_49539DBA029D_impl*
end;//TExTextForm.UpdateSubPanelDescription

procedure TExTextForm.InvalidateDataSources;
//#UC START# *4EBA9E0201FC_49539DBA029D_var*
//#UC END# *4EBA9E0201FC_49539DBA029D_var*
begin
//#UC START# *4EBA9E0201FC_49539DBA029D_impl*
 if FormDataChangedInfo.NeedProcess then
 begin
  FormDataChangedInfo.NeedProcess := False;
   // - ����� ��������� � ������, ����� ������ ����� ���� ��������� � ����������
   //   ���������, ��� ���������� ���� ����� ���� �� MakeDocumentContainer;
  if (ViewArea <> nil) then
  begin
   //Assert(false, '� �������� �� �� ����? � ����� �� ��� ������?');
   // - �������� :-(
   // �������� ������ �������:
   if ViewArea.TimeMachineOff then
    DefDataAdapter.TimeMachine.SwitchOff;
   if FormDataChangedInfo.FromHistory then
   begin
    with Text.TextSource do
     // ���� ��������� ������, �� ��������������� ���������:
     if not Assigned(DocumentContainer) or
        not DocumentContainer.IsSame(ViewArea.Container) then
      DocumentContainer := ViewArea.Container;
   end
   else//FormDataChangedInfo.FromHistory
   begin
    with Text do
    begin
     ShowUserComments := True;
     ShowComments := True;
     ShowVersionComments := Settings.LoadBoolean(pi_Document_ShowVersionsComment, dv_Document_ShowVersionsComment);
    end;//with Text
    ChangePositionByDataSource;
   end;//FormDataChangedInfo.FromHistory
   Text.IsStaticText := ViewArea.IsReadOnly;
   Text.PreviewCaleeArea := ViewArea.PreviewCaleeArea;
   CheckControllableState([dcsExitFromSystem]);
   // �������� ��� ������������:
   if (dsConsultation <> nil) then
    CCaption := dsConsultation.DisplayName;
   // ���� ��� ��������� ��������, ����� � ������� �������� ������ ����� c
   // ������������� _DataSource (��� �������� �� ���������, ��. �����
   // sfsOnlyIfDataSourceChanged), ������ ����� ����� ������ �� ������� �����
   // ������������� ������� ������������� �� ������� ��������:
   if FormDataChangedInfo.FromHistory then
    SynchronizeWithRedationsForm;
   UpdateSubPanelDescription;
   RequiestCheckForcedQueryForInternet;
  end;//if (ViewArea <> nil) then
 end;//if FormDataChangedInfo.NeedProcess then
 if Assigned(f_RecallCreateTOCTree) then
  CreateTOC(f_RecallCreateTOCTree);
//#UC END# *4EBA9E0201FC_49539DBA029D_impl*
end;//TExTextForm.InvalidateDataSources

procedure TExTextForm.UpdateTechComment;
//#UC START# *4EBA9FDE0189_49539DBA029D_var*
//#UC END# *4EBA9FDE0189_49539DBA029D_var*
begin
//#UC START# *4EBA9FDE0189_49539DBA029D_impl*
 Text.ShowTechComments := afw.Application.IsInternal and
                          Settings.LoadBoolean(pi_Document_ShowTechComment,
                                               dv_Document_ShowTechComment);
//#UC END# *4EBA9FDE0189_49539DBA029D_impl*
end;//TExTextForm.UpdateTechComment

procedure TExTextForm.LoadFromSettings;
//#UC START# *4EBAAEB20259_49539DBA029D_var*
//#UC END# *4EBAAEB20259_49539DBA029D_var*
begin
//#UC START# *4EBAAEB20259_49539DBA029D_impl*
 with Settings do
 begin
  Text.PersistentSelection :=
   LoadBoolean(pi_Document_PermanentSelection, dv_Document_PermanentSelection);
  with Text do
  begin
   ShowDocumentParts := LoadBoolean(pi_Document_ShowBlockBorders,
                                    dv_Document_ShowBlockBorders);
   DrawSpecial := LoadBoolean(pi_Document_ShowSpatial,
                              dv_Document_ShowSpatial);
  end;//with Text do
 end;//with Settings do
 UpdateSubPanelDescription;
 UpdateTechComment;
//#UC END# *4EBAAEB20259_49539DBA029D_impl*
end;//TExTextForm.LoadFromSettings

procedure TExTextForm.ShowSubNumbers;
//#UC START# *4EBAAF2F03D6_49539DBA029D_var*
//#UC END# *4EBAAF2F03D6_49539DBA029D_var*
begin
//#UC START# *4EBAAF2F03D6_49539DBA029D_impl*
 with Settings do
  SaveBoolean(pi_Document_SubPanel_ShowSubNumbers,
              not LoadBoolean(pi_Document_SubPanel_ShowSubNumbers,
                              dv_Document_SubPanel_ShowSubNumbers),
              dv_Document_SubPanel_ShowSubNumbers);
//#UC END# *4EBAAF2F03D6_49539DBA029D_impl*
end;//TExTextForm.ShowSubNumbers

procedure TExTextForm.DoSettingsChanged;
//#UC START# *4EBABF090101_49539DBA029D_var*
//#UC END# *4EBABF090101_49539DBA029D_var*
begin
//#UC START# *4EBABF090101_49539DBA029D_impl*
 // ����� �������� ������ "��������� ���������", ��� ����� ������������ ���
 // ����������, ���� ������������ �������� ������� �������� ��������� ���������:
 if (UserType in [dftDocument, dftDrug]) then
  OpenContents(ns_comNotForce);
 LoadFromSettings;
//#UC END# *4EBABF090101_49539DBA029D_impl*
end;//TExTextForm.DoSettingsChanged

function TExTextForm.GetCurrentCaption: Il3CString;
//#UC START# *4EBABF3902F7_49539DBA029D_var*
//#UC END# *4EBABF3902F7_49539DBA029D_var*
begin
//#UC START# *4EBABF3902F7_49539DBA029D_impl*
 if (UserType in [dftDictEntry, dftDictSubEntry]) and
   (ViewArea <> nil) then
  Result := bsLanguageCaption(ViewArea.Language)
 else
  Result := nsCStr(CurUserType.Caption);
//#UC END# *4EBABF3902F7_49539DBA029D_impl*
end;//TExTextForm.GetCurrentCaption

function TExTextForm.GetCurrentImage: Integer;
//#UC START# *4EBABF5503AA_49539DBA029D_var*
//#UC END# *4EBABF5503AA_49539DBA029D_var*
begin
//#UC START# *4EBABF5503AA_49539DBA029D_impl*
 if not (UserType in [dftDictEntry, dftDictSubEntry]) then
  Result := CurUserType.ImageIndex
 else
 if (ViewArea <> nil) and Assigned(ViewArea.DocInfo) then
  Result := bsLanguageImage(ViewArea.DocInfo.Language)
 else
  Result := -1;
//#UC END# *4EBABF5503AA_49539DBA029D_impl*
end;//TExTextForm.GetCurrentImage

procedure TExTextForm.CorrespondentsToSubTest(const aParams: IvcmTestParamsPrim);
//#UC START# *4EDF70F902E1_49539DBA029D_var*
var
 l_Root : Il3SimpleNode;
 l_Child : Il3SimpleNode;
 l_Sub: IeeSub;
//#UC END# *4EDF70F902E1_49539DBA029D_var*
begin
//#UC START# *4EDF70F902E1_49539DBA029D_impl*
 with aParams do
 begin
  if (ZoneType = vcm_ztChild) then
   Op.Flag[vcm_ofEnabled] := False
  else
   aParams.Op.Flag[vcm_ofEnabled] := Assigned(Document);
  if Op.Flag[vcm_ofEnabled] and
     Assigned(dsDocument) then
  begin
   l_Sub := ExtractSubFromSubPanel(aParams.Target);
   if Assigned(l_Sub) then
   begin
    l_Root := nsGetFilteredCorrespondentsTypeTree(Text.Document.DocumentContainer.SubList.SubEx[l_Sub.ID, l_Sub.LayerID]);
    if Assigned(l_Root) then
    begin
     if (Op.SubItems <> nil) then
      Op.SubItems.Clear;
     Op.SubNodes.Clear;
     l_Child := l_Root.Child;
     while (l_Child <> nil) do
     begin
      Op.SubNodes.Add(l_Child);
      if l_Child.IsLast then
       break;
      l_Child := l_Child.Next; 
     end;//l_Child <> nil
     Op.SubNodes.ShowRoot := true; 
    end//Assigned(l_Root)
    else
     aParams.Op.Flag[vcm_ofEnabled] := False;
   end//Assigned(l_Sub)
   else
    aParams.Op.Flag[vcm_ofEnabled] := False;
  end//Op.Flag[vcm_ofEnabled]..
  else
   aParams.Op.Flag[vcm_ofEnabled] := False;
 end;//with aParams do
//#UC END# *4EDF70F902E1_49539DBA029D_impl*
end;//TExTextForm.CorrespondentsToSubTest

function TExTextForm.ExtractSubFromSubPanel(const aTarget: IUnknown): IeeSub;
//#UC START# *4EDF72CC0158_49539DBA029D_var*
var
 l_eeSub: IeeSub;
//#UC END# *4EDF72CC0158_49539DBA029D_var*
begin
//#UC START# *4EDF72CC0158_49539DBA029D_impl*
 if Supports(aTarget, IeeSub, l_eeSub) and
    (l_eeSub.LayerID = ev_sbtSub) then
  Result := l_eeSub
 else
  Result := nil;
//#UC END# *4EDF72CC0158_49539DBA029D_impl*
end;//TExTextForm.ExtractSubFromSubPanel

procedure TExTextForm.OpenPicture(const aPara: IeePara;
  const aPicture: IeePicture;
  inNewWindow: Boolean = false);
//#UC START# *4F6719C001DB_49539DBA029D_var*
var
 l_Cont  : IvcmContainer;
//#UC END# *4F6719C001DB_49539DBA029D_var*
begin
//#UC START# *4F6719C001DB_49539DBA029D_impl*
 if (aPicture <> nil) then
 begin
  if inNewWindow then
   l_Cont := nsOpenNewWindowParams(NativeMainForm)
  else
   l_Cont := nil;

  TdmStdRes.OpenPicture(l_Cont,
                        TnsInternalPictureData.Make(aPara,
                                                    aPicture,
                                                    nsGetDocumentShortName(Document)));
 end;//aPicture <> nil
//#UC END# *4F6719C001DB_49539DBA029D_impl*
end;//TExTextForm.OpenPicture

function TExTextForm.LeafParaUnderCursor: IeePara;
//#UC START# *4F672B0E03A8_49539DBA029D_var*
//#UC END# *4F672B0E03A8_49539DBA029D_var*
begin
//#UC START# *4F672B0E03A8_49539DBA029D_impl*
 if (Text.Selection <> nil) AND
    (Text.Selection.Cursor <> nil) then
  Result := TeePara.Make(Text.Selection.Cursor.MostInner.Obj.AsPara, Text)
 else
  Result := nil; 
//#UC END# *4F672B0E03A8_49539DBA029D_impl*
end;//TExTextForm.LeafParaUnderCursor

function TExTextForm.MakePositionList(aCRType: TlstCRType): IPositionList;
var
 l_PositionList : IPositionList absolute Result;

 procedure CollectParas(const aRange: InevRange);
 var
  l_WasCorrection : Boolean;

  function DoIt(const anItem: InevRange;
    anIndex: Integer): Boolean;

   procedure AddParaToList(const aPara: InevObject);
   //#UC START# *4F98298400DA__var*
   var
    l_Pos : DocumentUnit.TPosition;
   //#UC END# *4F98298400DA__var*
   begin
   //#UC START# *4F98298400DA__impl*
    l3FillChar(l_Pos, SizeOf(l_Pos));
    l_Pos.rPoint := Cardinal(aPara.IntA[k2_tiHandle]);
    if (l_Pos.rPoint <> 0) AND (l_Pos.rPoint <> Cardinal(-1)) then
    begin
     l_Pos.rType := PT_PARA;
     l_PositionList.Add(l_Pos);
    end;//l_Pos.rPoint <> 0
   //#UC END# *4F98298400DA__impl*
   end;//AddParaToList


   function CorrectPara(const aPara: InevObject): Boolean;
   //#UC START# *4F981D29027B__var*

    function ParaHasAnySub(const aPara: InevObject): Boolean;
    begin//ParaHasAnySub
     Result := false;
     with aPara.rAtomEx([k2_tiSubs, k2_tiChildren, k2_tiHandle, ev_sbtSub]) do
      if IsValid then
       if (ChildrenCount > 0) then
        Result := true;
    end;//ParaHasAnySub

    procedure AddBlockToList(const aBlock : InevTag);
    var
     l_Pos : DocumentUnit.TPosition;
    begin//AddBlockToList
     l3FillChar(l_Pos, SizeOf(l_Pos));
     l_Pos.rPoint := Cardinal(aBlock.IntA[k2_tiHandle]);
     l_Pos.rType := PT_SUB;
     l_PositionList.Add(l_Pos);
    end;//AddBlockToList

   var
    l_P : InevPara;
    l_Block : InevTag;
   //#UC END# *4F981D29027B__var*
   begin
   //#UC START# *4F981D29027B__impl*
    Result := false;
    if not l_WasCorrection then
    begin
     l_WasCorrection := true;
     if (aCRType = crtCorrespondents) then
     begin
      if ParaHasAnySub(aPara) then
       // - �� ��������� ���� ���� �� ���� Sub - ������ �� ������
       Exit;
      if not aPara.QT(InevPara, l_P) then
      begin
       Assert(false);
       Exit;
      end;//not aPara.QT(InevPara, l_P)
      l_P := l_P.Prev;
      while (l_P <> nil) AND l_P.IsValid do
      begin
       if not l_P.InheritsFrom(k2_idCommentPara) then
       // - ������ ���������� ����������� ������������
       begin
        if l_P.InheritsFrom(k2_idParaList) then
         // - ��� ��������� ���� ������ ��������, ���� �� �� �������
         Exit;
        if not l_P.IsLegalComment then
         // - ��� �� �����������
         if not l3IsNil(l_P.PCharLenA[k2_tiText]) then
          // - � ���� �� ������ �����
          Exit;
        if ParaHasAnySub(l_P) then
         AddParaToList(l_P);
        if (l_P.PID = 0) then
        // - ��� ������ ��������
         if evInPara(l_P, k2_idBlock, l_Block) then
         // - ���� ��� ����
          AddBlockToList(l_Block);
          // - ��������� ���� � ������
       end;//not l_P.InheritsFrom(k2_idCommentPara)
       l_P := l_P.Prev;
      end;//while l_P <> nil..
     end;//aCRType = crtCorrespondents
    end;//l_WasCorrection
   //#UC END# *4F981D29027B__impl*
   end;//CorrectPara

  //#UC START# *4F981D630001__var*
  var
   l_P : PInevObject;
  //#UC END# *4F981D630001__var*
  begin
  //#UC START# *4F981D630001__impl*
   Result := true;
   l_P := anItem.Obj;
   if l_P.InheritsFrom(k2_idParaList) then
    CollectParas(anItem)
   else
   if l_P.InheritsFrom(k2_idLeafPara) then
   begin
    if not CorrectPara(l_P^) then
     AddParaToList(l_P^);
   end;//l_P.InheritsFrom(k2_idLeafPara)
  //#UC END# *4F981D630001__impl*
  end;//DoIt

 //#UC START# *4F980CDF02C7__var*
 //#UC END# *4F980CDF02C7__var*
 begin
  //#UC START# *4F980CDF02C7iter*
  l_WasCorrection := false;
  aRange.
  //#UC END# *4F980CDF02C7iter*
   IterateF(L2InevRangePrimIterateAction(@DoIt));
 end;//CollectParas

//#UC START# *4F97FB9C0324_49539DBA029D_var*
var
 l_Block: InevRange;
//#UC END# *4F97FB9C0324_49539DBA029D_var*
begin
//#UC START# *4F97FB9C0324_49539DBA029D_impl*
 l_Block := InevSelection(Text.Selection).GetBlock;
 try
  if (l_Block = nil) OR
      l_Block.Solid(Text.View) then // - ������� ����� ��������
   Result := nil
  else
  begin
   Result := defDataAdapter.NativeAdapter.MakePositionList;
   CollectParas(l_Block);
  end;//l_Block = nil..
 finally
  l_Block := nil;
 end;//try..finally
//#UC END# *4F97FB9C0324_49539DBA029D_impl*
end;//TExTextForm.MakePositionList

procedure TExTextForm.SetFocusToText;
//#UC START# *4FF437680128_49539DBA029D_var*
//#UC END# *4FF437680128_49539DBA029D_var*
begin
//#UC START# *4FF437680128_49539DBA029D_impl*
 if Text.CanFocus then
  Text.SetFocus;
//#UC END# *4FF437680128_49539DBA029D_impl*
end;//TExTextForm.SetFocusToText

function TExTextForm.GetNeedsStatusBarItems: Boolean;
//#UC START# *501013340168_49539DBA029D_var*
//#UC END# *501013340168_49539DBA029D_var*
begin
//#UC START# *501013340168_49539DBA029D_impl*
 Result := UserType in [dftDocument, dftDrug, dftAACLeft, dftAACContentsRight];
//#UC END# *501013340168_49539DBA029D_impl*
end;//TExTextForm.GetNeedsStatusBarItems

function TExTextForm.NeedShowTOC: Boolean;
//#UC START# *502B835801B4_49539DBA029D_var*
//#UC END# *502B835801B4_49539DBA029D_var*
begin
//#UC START# *502B835801B4_49539DBA029D_impl*
 Result := (UserType in [dftDocument, dftDrug, dftAACLeft, dftAACContentsRight]);
//#UC END# *502B835801B4_49539DBA029D_impl*
end;//TExTextForm.NeedShowTOC

// start class TnsUseDocumentSubPanelOperationEvent

var g_TnsUseDocumentSubPanelOperationEvent : TnsUseDocumentSubPanelOperationEvent = nil;

procedure TnsUseDocumentSubPanelOperationEventFree;
begin
 l3Free(g_TnsUseDocumentSubPanelOperationEvent);
end;

class function TnsUseDocumentSubPanelOperationEvent.Instance: TnsUseDocumentSubPanelOperationEvent;
begin
 if (g_TnsUseDocumentSubPanelOperationEvent = nil) then
 begin
  l3System.AddExitProc(TnsUseDocumentSubPanelOperationEventFree);
  g_TnsUseDocumentSubPanelOperationEvent := Create;
 end;
 Result := g_TnsUseDocumentSubPanelOperationEvent;
end;


function TnsUseDocumentSubPanelOperationEvent.EventID: TLogEvent;
//#UC START# *4B13A26203DB_4B13AFDF013A_var*
//#UC END# *4B13A26203DB_4B13AFDF013A_var*
begin
//#UC START# *4B13A26203DB_4B13AFDF013A_impl*
 Result := LE_USE_SUB_PANEL_DOCUMENT_OPERATION;
//#UC END# *4B13A26203DB_4B13AFDF013A_impl*
end;//TnsUseDocumentSubPanelOperationEvent.EventID

procedure TExTextForm.ChangePositionByDataSource;
//#UC START# *49883D6D03A2_49539DBA029D_var*
//#UC END# *49883D6D03A2_49539DBA029D_var*
begin
//#UC START# *49883D6D03A2_49539DBA029D_impl*
 if (ViewArea <> nil) then
 begin
(*  Il3Lock(Text).Lock(Text);
  try*)
  Text.TextSource.DocumentContainer.LinkWaiter(TnsDocumentPointWaiter.Make(Self, ViewArea.DocInfo.Pos));
(*  finally
   Il3Lock(Text).Unlock(Text);
  end;//try..finally*)
 end;//ViewArea <> nil
//#UC END# *49883D6D03A2_49539DBA029D_impl*
end;//TExTextForm.ChangePositionByDataSource

function TExTextForm.OpenCRList(aKind: TlstCRType;
  const aType: Il3SimpleNode;
  ReConvertNode: Boolean): Boolean;
//#UC START# *49886FBC0385_49539DBA029D_var*
var
 l_Node: Il3SimpleNode;
//#UC END# *49886FBC0385_49539DBA029D_var*
begin
//#UC START# *49886FBC0385_49539DBA029D_impl*
 Result := true;
 if ReConvertNode then
  l_Node := bsConvertFilteredCRNode(aType)
 else
  l_Node := aType;
 OpenCRListOpExecute(aKind, l_Node);
//#UC END# *49886FBC0385_49539DBA029D_impl*
end;//TExTextForm.OpenCRList

procedure TExTextForm.TypedCRToPartTest(const aParams: IvcmTestParamsPrim;
  aCRType: TlstCRType);
//#UC START# *4988773A0053_49539DBA029D_var*
const
 CRListCaptions : array [1..2] of PvcmStringID = (@str_RespListForText, @str_RespListForPart);
var
 l_List    : IvcmNodes;
 l_Strings : IvcmStrings;
//#UC END# *4988773A0053_49539DBA029D_var*
begin
//#UC START# *4988773A0053_49539DBA029D_impl*
 OpenCRListOpTest(aParams, aCRType);
 with aParams do
 begin
  if Op.Flag[vcm_ofEnabled] then
  begin
   l_Strings := Op.SubItems;
   l_List := Op.SubNodes;
   if (l_Strings <> nil) and (l_List <> nil) then
   begin
    with DefDataAdapter do
     if Text.HasSelection then
     begin
      l_Strings.Add(vcmCStr(CRListCaptions[1]^));
      l_List.Add(CRSimpleListTypeRootNode);
      //
      l_Strings.Add(vcmCStr(CRListCaptions[2]^));
      l_List.Add(CRSimpleListTypeRootNode);
     end
     else
      l_List.Add(CRSimpleListTypeRootNode);
   end;//l_Strings <> nil
  end;
 end;
//#UC END# *4988773A0053_49539DBA029D_impl*
end;//TExTextForm.TypedCRToPartTest

procedure TExTextForm.GetCorrespondentListEx(aParamsIndex: Integer;
  const aChoosedNode: Il3SimpleNode);
//#UC START# *498878B60084_49539DBA029D_var*
//#UC END# *498878B60084_49539DBA029D_var*
begin
//#UC START# *498878B60084_49539DBA029D_impl*
 case aParamsIndex of
  0, 1:
   OpenCRListOpExecute(crtCorrespondents, aChoosedNode);
  2:
   OpenCRListToPart(crtCorrespondents, aChoosedNode);
  else
   Assert(False);
 end;//case aParamsIndex
//#UC END# *498878B60084_49539DBA029D_impl*
end;//TExTextForm.GetCorrespondentListEx

procedure TExTextForm.OpenCRListToPart(aCRType: TlstCRType;
  const aType: Il3SimpleNode;
  const aPositionList: IPositionList = nil);
//#UC START# *498879F203D8_49539DBA029D_var*
var
 l_PositionList : IPositionList;
 l_Node         : INodeBase;
//#UC END# *498879F203D8_49539DBA029D_var*
begin
//#UC START# *498879F203D8_49539DBA029D_impl*
 if Assigned(dsDocument) then
 begin
  if Assigned(aPositionList) then
   l_PositionList := aPositionList
  else
   l_PositionList := MakePositionList(aCRType);
  if Assigned (l_PositionList) then
  begin
   if Supports(aType, INodeBase, l_Node) then
    DocumentSet.OpenCRToPart(l_PositionList, l_Node, aCRType)
   else
    DocumentSet.OpenCRToPart(l_PositionList, nil, aCRType);
  end//Assigned(l_PositionList)
  else
  begin
   //Assert(false,'� ����� �����-������ Assigned(l_PositionList) �������?');
   // - �� - ������ ������ ����� ��� �������
   // http://mdp.garant.ru/pages/viewpage.action?pageId=269063249
   // �� �� ����� ������ ������� OpenCRType, ������ ��� �������� ������� ��
   // ���������� ������� ��������� ���������� ����� ����\���� � ������� �����
   // �������� (CQ: OIT500017328):
   case aCRType of
    crtCorrespondents:
     op_Document_OpenCorrespondentList.Call(Self.As_IvcmEntityForm, aCRType, aType);
    crtRespondents:
     op_Document_OpenRespondentList.Call(Self.As_IvcmEntityForm, aCRType, aType);
   end;//case aCRType
   //OpenCRList(aCRType, aType);
  end;//Assigned(l_PositionList)
 end;//if Assigned(dsDocument) then
//#UC END# *498879F203D8_49539DBA029D_impl*
end;//TExTextForm.OpenCRListToPart

procedure TExTextForm.GetRespondentListEx(aParamsIndex: Integer;
  const aChoosedNode: Il3SimpleNode);
//#UC START# *49889018003E_49539DBA029D_var*
//#UC END# *49889018003E_49539DBA029D_var*
begin
//#UC START# *49889018003E_49539DBA029D_impl*
 case aParamsIndex of
  0, 1:
   OpenCRListOpExecute(crtRespondents, aChoosedNode);
  2:
   OpenCRListToPart(crtRespondents, aChoosedNode);
  else
   Assert(False);
 end;//case aParamsIndex
//#UC END# *49889018003E_49539DBA029D_impl*
end;//TExTextForm.GetRespondentListEx

procedure TExTextForm.SynchronizeWithRedationsForm;
//#UC START# *4A793A0A032F_49539DBA029D_var*
//#UC END# *4A793A0A032F_49539DBA029D_var*
begin
//#UC START# *4A793A0A032F_49539DBA029D_impl*
 op_Editions_SetCurrent.Call(Aggregate, Document);
//#UC END# *4A793A0A032F_49539DBA029D_impl*
end;//TExTextForm.SynchronizeWithRedationsForm

procedure TExTextForm.DoSwitchToFirstTab;
//#UC START# *4B043ABF0363_49539DBA029D_var*
//#UC END# *4B043ABF0363_49539DBA029D_var*
begin
//#UC START# *4B043ABF0363_49539DBA029D_impl*
 if (UserType in [dftRelatedDoc,
                              dftDictSubEntry,
                              dftAnnotation,
                              dftTranslation]) then
  op_Switcher_SetFirstPageActive.Call(Container)
 else
  SafeClose;
//#UC END# *4B043ABF0363_49539DBA029D_impl*
end;//TExTextForm.DoSwitchToFirstTab

procedure TExTextForm.OpenRedactionList;
//#UC START# *4B2631930324_49539DBA029D_var*
//#UC END# *4B2631930324_49539DBA029D_var*
begin
//#UC START# *4B2631930324_49539DBA029D_impl*
 DocumentSet.OpenEditions;
//#UC END# *4B2631930324_49539DBA029D_impl*
end;//TExTextForm.OpenRedactionList

procedure TExTextForm.DftMedicFirmSynchroViewQueryMaximized(aSender: TObject);
//#UC START# *08687812598B_49539DBA029D_var*
//#UC END# *08687812598B_49539DBA029D_var*
begin
//#UC START# *08687812598B_49539DBA029D_impl*
  if HasDoc then
   OpenInWindow;
//#UC END# *08687812598B_49539DBA029D_impl*
end;//TExTextForm.DftMedicFirmSynchroViewQueryMaximized

procedure TExTextForm.DftTranslationQueryMaximized(aSender: TObject);
//#UC START# *0B8413148796_49539DBA029D_var*
//#UC END# *0B8413148796_49539DBA029D_var*
begin
//#UC START# *0B8413148796_49539DBA029D_impl*
  if HasDoc then
   OpenInWindow;
//#UC END# *0B8413148796_49539DBA029D_impl*
end;//TExTextForm.DftTranslationQueryMaximized

procedure TExTextForm.DoTabActivate;
//#UC START# *497F16AC015A_49539DBA029D_var*
var
 l_ActivationKind : TnsTextTabActivateKind;
//#UC END# *497F16AC015A_49539DBA029D_var*
begin
//#UC START# *497F16AC015A_49539DBA029D_impl*
 if (sdsBaseDocument <> nil) then
 begin
  case UserType of
   dftRelatedDoc:
    l_ActivationKind := ttakRelated;
   dftAnnotation:
    l_ActivationKind := ttakAnnotation;
   else
    Exit;
  end;//case UserType of
  TnsTextTabActivateEvent.Log(sdsBaseDocument.DocInfo.Doc, l_ActivationKind);
 end;//sdsBaseDocument <> nil
//#UC END# *497F16AC015A_49539DBA029D_impl*
end;//TExTextForm.DoTabActivate

procedure TExTextForm.Document_OpenCorrespondentList_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4988752302F4_49539DBA029Dtest_var*
//#UC END# *4988752302F4_49539DBA029Dtest_var*
begin
//#UC START# *4988752302F4_49539DBA029Dtest_impl*
 TypedCRToPartTest(aParams, crtCorrespondents);
//#UC END# *4988752302F4_49539DBA029Dtest_impl*
end;//TExTextForm.Document_OpenCorrespondentList_Test

procedure TExTextForm.Document_OpenCorrespondentList_Execute(aKind: TlstCRType;
  const aCRType: Il3SimpleNode);
//#UC START# *4988752302F4_49539DBA029Dexec_var*
//#UC END# *4988752302F4_49539DBA029Dexec_var*
begin
//#UC START# *4988752302F4_49539DBA029Dexec_impl*
 if not Operation(TdmStdRes.opcode_Document_GetCorrespondentListExFrmAct) then
  Assert(false);
 if not OpenCRList(aKind, aCRType, True) then
  Assert(false);
  //GetCorrespondentListEx(aParams.ItemIndex, bsConvertFilteredCRNode(aParams.CurrentNode));
//#UC END# *4988752302F4_49539DBA029Dexec_impl*
end;//TExTextForm.Document_OpenCorrespondentList_Execute

procedure TExTextForm.Document_OpenCorrespondentList(const aParams: IvcmExecuteParams);
begin
 with (aParams.Data As IDocument_OpenCorrespondentList_Params) do
  Document_OpenCorrespondentList_Execute(Kind, CRType);
end;

procedure TExTextForm.Document_OpenRespondentList_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *49888E8003B9_49539DBA029Dtest_var*
//#UC END# *49888E8003B9_49539DBA029Dtest_var*
begin
//#UC START# *49888E8003B9_49539DBA029Dtest_impl*
 TypedCRToPartTest(aParams, crtRespondents);
//#UC END# *49888E8003B9_49539DBA029Dtest_impl*
end;//TExTextForm.Document_OpenRespondentList_Test

procedure TExTextForm.Document_OpenRespondentList_Execute(aKind: TlstCRType;
  const aCRType: Il3SimpleNode);
//#UC START# *49888E8003B9_49539DBA029Dexec_var*
//#UC END# *49888E8003B9_49539DBA029Dexec_var*
begin
//#UC START# *49888E8003B9_49539DBA029Dexec_impl*
 if not Operation(TdmStdRes.opcode_Document_GetRespondentListExFrmAct) then
  Assert(false);
 if not OpenCRList(aKind, aCRType, false) then
  Assert(false);
  //GetRespondentListEx(aParams.ItemIndex, aParams.CurrentNode);
//#UC END# *49888E8003B9_49539DBA029Dexec_impl*
end;//TExTextForm.Document_OpenRespondentList_Execute

procedure TExTextForm.Document_OpenRespondentList(const aParams: IvcmExecuteParams);
begin
 with (aParams.Data As IDocument_OpenRespondentList_Params) do
  Document_OpenRespondentList_Execute(Kind, CRType);
end;

procedure TExTextForm.Document_GetAttributesFrmAct_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *498891640253_49539DBA029Dtest_var*
//#UC END# *498891640253_49539DBA029Dtest_var*
begin
//#UC START# *498891640253_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] :=
  (not (UserType in [dftAACContentsLeft, dftAACContentsRight])) AND
  ((UserType in [dftAACLeft, dftAACRight]) OR
    (ZoneType <> vcm_ztChild));
 if aParams.Op.Flag[vcm_ofEnabled] then
  OpenAttributesOpTest(aParams);
//#UC END# *498891640253_49539DBA029Dtest_impl*
end;//TExTextForm.Document_GetAttributesFrmAct_Test

procedure TExTextForm.Document_GetAttributesFrmAct_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *498891640253_49539DBA029Dexec_var*
//#UC END# *498891640253_49539DBA029Dexec_var*
begin
//#UC START# *498891640253_49539DBA029Dexec_impl*
 OpenAttributesOpExecute;
//#UC END# *498891640253_49539DBA029Dexec_impl*
end;//TExTextForm.Document_GetAttributesFrmAct_Execute

function TExTextForm.Loadable_Load_Execute(const aNode: IeeNode;
  const aData: IUnknown;
  anOp: TListLogicOperation = LLO_NONE): Boolean;
//#UC START# *49895A2102E8_49539DBA029Dexec_var*
var
 l_FolderNode : INode;
 l_BaseEntity : IUnknown;
 l_Hyperlink  : IevHyperlink;
 l_HyperlinkUndo: InevOp;
//#UC END# *49895A2102E8_49539DBA029Dexec_var*
begin
//#UC START# *49895A2102E8_49539DBA029Dexec_impl*
 Result := true;
 if Supports(aNode, INode, l_FolderNode) then
  try
   if not Supports(aData, IevHyperlink, l_Hyperlink) then
    if not Supports(aData, Il3CString) then
     Supports(Text.Selection, IevHyperlink, l_Hyperlink);

   try
    l_FolderNode.Open(l_BaseEntity);
   except
    on ECanNotFindData do
    begin
     nsSayAdapterObjectMissing(Self, l_FolderNode);
     Result := false;
     Exit;
    end;//on ECanNotFindData
   end;//try..except
   try
    if (l_Hyperlink = nil) then
     case TFoldersItemType(l_FolderNode.GetObjectType) of
       FIT_LIST: ;
        // !Stub! ���� �� �����
       FIT_QUERY: ;
        // !Stub! ���� �� �����
       FIT_BOOKMARK,
       FIT_PHARM_BOOKMARK:
        TdmStdres.OpenEntityAsDocument(l_BaseEntity, nil);
     end//case TFoldersItemType(l_FolderNode.GetObjectType)
    else
    if (l_Hyperlink.ID >= 0) then
     try
      l_HyperlinkUndo := Text.StartOp;
      try
       if not l_Hyperlink.Exists then
        l_Hyperlink.Insert;
       try
        InitHyperLink(l_Hyperlink, l_BaseEntity);
       except
        on EUnsupported do
        begin
         Say(err_UnsupportedHyperlinkTarget);
         Result := false;
         Exit;
        end;//on EUnsupported
       end;//try..except
      finally
       l_HyperlinkUndo := nil;
      end;//try..finally
     finally
      l_Hyperlink := nil;
     end;//try..finally
   finally
    l_BaseEntity := nil;
   end;//try..finally
  finally
   l_FolderNode := nil;
  end;//try..finally
//#UC END# *49895A2102E8_49539DBA029Dexec_impl*
end;//TExTextForm.Loadable_Load_Execute

procedure TExTextForm.Loadable_Load(const aParams: IvcmExecuteParams);
begin
 with (aParams.Data As ILoadable_Load_Params) do
  ResultValue := Loadable_Load_Execute(Node, Data, nOp);
end;

procedure TExTextForm.Document_GetRelatedDocFrmAct_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *498993C801DC_49539DBA029Dtest_var*
//#UC END# *498993C801DC_49539DBA029Dtest_var*
begin
//#UC START# *498993C801DC_49539DBA029Dtest_impl*
(* aParams.Op.Flag[vcm_ofEnabled] := (ZoneType <> vcm_ztChild);*)
 // http://mdp.garant.ru/pages/viewpage.action?pageId=380047003
 if aParams.Op.Flag[vcm_ofEnabled] then
  OpenRelatedDocOpTest(aParams);
//#UC END# *498993C801DC_49539DBA029Dtest_impl*
end;//TExTextForm.Document_GetRelatedDocFrmAct_Test

procedure TExTextForm.Document_GetRelatedDocFrmAct_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *498993C801DC_49539DBA029Dexec_var*
//#UC END# *498993C801DC_49539DBA029Dexec_var*
begin
//#UC START# *498993C801DC_49539DBA029Dexec_impl*
 // ������ �� ������, �.�. ��� FormActivate - http://mdp.garant.ru/pages/viewpage.action?pageId=135136020&focusedCommentId=136258958#comment-136258958
//#UC END# *498993C801DC_49539DBA029Dexec_impl*
end;//TExTextForm.Document_GetRelatedDocFrmAct_Execute

procedure TExTextForm.SetBookmark;
//#UC START# *4989CD040306_49539DBA029D_var*
//#UC END# *4989CD040306_49539DBA029D_var*
begin
//#UC START# *4989CD040306_49539DBA029D_impl*
 AddBookmark(GetParaForPositionning(False));
//#UC END# *4989CD040306_49539DBA029D_impl*
end;//TExTextForm.SetBookmark

function TExTextForm.CanAddBookmark: Boolean;
//#UC START# *4989CF90010A_49539DBA029D_var*
//#UC END# *4989CF90010A_49539DBA029D_var*
begin
//#UC START# *4989CF90010A_49539DBA029D_impl*
 Result := true;
//#UC END# *4989CF90010A_49539DBA029D_impl*
end;//TExTextForm.CanAddBookmark

procedure TExTextForm.Document_GetCorrespondentList_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4989D65C0275_49539DBA029Dtest_var*
//#UC END# *4989D65C0275_49539DBA029Dtest_var*
begin
//#UC START# *4989D65C0275_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := GetCorrespondentListTest;
//#UC END# *4989D65C0275_49539DBA029Dtest_impl*
end;//TExTextForm.Document_GetCorrespondentList_Test

procedure TExTextForm.Document_GetCorrespondentList_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4989D65C0275_49539DBA029Dexec_var*
//#UC END# *4989D65C0275_49539DBA029Dexec_var*
begin
//#UC START# *4989D65C0275_49539DBA029Dexec_impl*
 OpenCRListOpExecute(crtCorrespondents, nil);
//#UC END# *4989D65C0275_49539DBA029Dexec_impl*
end;//TExTextForm.Document_GetCorrespondentList_Execute

procedure TExTextForm.Document_GetRespondentList_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4989D8430128_49539DBA029Dtest_var*
//#UC END# *4989D8430128_49539DBA029Dtest_var*
begin
//#UC START# *4989D8430128_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := GetRespondentListTest;
//#UC END# *4989D8430128_49539DBA029Dtest_impl*
end;//TExTextForm.Document_GetRespondentList_Test

procedure TExTextForm.Document_GetRespondentList_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4989D8430128_49539DBA029Dexec_var*
//#UC END# *4989D8430128_49539DBA029Dexec_var*
begin
//#UC START# *4989D8430128_49539DBA029Dexec_impl*
 OpenCRListOpExecute(crtRespondents, nil);
//#UC END# *4989D8430128_49539DBA029Dexec_impl*
end;//TExTextForm.Document_GetRespondentList_Execute

function TExTextForm.Document_AttributesCanBeClosed_Execute: Boolean;
//#UC START# *4989DE3702CF_49539DBA029Dexec_var*
const
 c_CanCloseFormTypes = [
  dftNone,
  dftDocument,
  dftDictEntry,
  dftTips,
  dftMedDictEntry,
  dftMedicFirm
 ];
//#UC END# *4989DE3702CF_49539DBA029Dexec_var*
begin
//#UC START# *4989DE3702CF_49539DBA029Dexec_impl*
 Result := (UserType in c_CanCloseFormTypes) and
           OpenAttributesOpCanBeClosed;
//#UC END# *4989DE3702CF_49539DBA029Dexec_impl*
end;//TExTextForm.Document_AttributesCanBeClosed_Execute

procedure TExTextForm.Document_AttributesCanBeClosed(const aParams: IvcmExecuteParams);
begin
 with (aParams.Data As IDocument_AttributesCanBeClosed_Params) do
  ResultValue := Document_AttributesCanBeClosed_Execute;
end;

function TExTextForm.DocumentIsValid: Boolean;
//#UC START# *4A7C0E1A005C_49539DBA029D_var*
//#UC END# *4A7C0E1A005C_49539DBA029D_var*
begin
//#UC START# *4A7C0E1A005C_49539DBA029D_impl*
 Result := (Document <> nil);
//#UC END# *4A7C0E1A005C_49539DBA029D_impl*
end;//TExTextForm.DocumentIsValid

function TExTextForm.RedactionCurrentPara: IeeLeafPara;
//#UC START# *4A7FCEA9025D_49539DBA029D_var*
//#UC END# *4A7FCEA9025D_49539DBA029D_var*
begin
//#UC START# *4A7FCEA9025D_49539DBA029D_impl*
 Result := GetParaForPositionning;
//#UC END# *4A7FCEA9025D_49539DBA029D_impl*
end;//TExTextForm.RedactionCurrentPara

function TExTextForm.DoProcessExternalOperation(const anOperation: IExternalOperation): Boolean;
//#UC START# *4A815E860391_49539DBA029D_var*
var
 l_Operartion: TbsObjectId;
 l_Form: IvcmEntityForm;
const
 gc_Confirmation: array [Boolean] of PvcmMessageID = (@inf_PaymentRejected, @inf_PaymentConfirmed);
//#UC END# *4A815E860391_49539DBA029D_var*
begin
//#UC START# *4A815E860391_49539DBA029D_impl*
 Result := True;
 if Assigned(anOperation) then
 begin
  l_Operartion := anOperation.GetId;
  if l_Operartion = EOI_ESTIMATION then
  begin
   if (Consultation <> nil) then
    try
     Consultation.GiveMark;
    except
     on EbsConsultationAlreadyMark do
      Say(inf_ConsulationAlreadyMark);
     on EbsConsultationWasDeleted do
      Say(inf_ConsultationWasDeleted);
    end;//try..except
  end//l_Operartion = EOI_ESTIMATION
  else
   if l_Operartion in [EOI_PAYMENT_CONFIRM, EOI_PAYMENT_REFUSAL] then
   begin
    if (Consultation <> nil) then
     try
      Consultation.ConfirmPayment(l_Operartion = EOI_PAYMENT_CONFIRM);
      Say(gc_Confirmation[l_Operartion = EOI_PAYMENT_CONFIRM]^);
     except
      on EbsConsultationAlreadyConfirmed do
       Say(inf_ConsulationAlreadyConfirmed);
      on EbsConsultationWasDeleted do
       Say(inf_ConsultationWasDeleted);
      on EbsPaymentForbidden do
       Say(war_PaymentForbidden);
      on ENoConnection do
       Say(war_NoConnection);
      on ENoSubscription do
       Say(war_NoSubscription, [defDataAdapter.GetDealerInfo]);
     end;{try..except}
   end//l_Operartion in [EOI_PAYMENT_CONFIRM, EOI_PAYMENT_REFUSAL]
   else
    if (l_Operartion = EOI_SHOW_HELP_TOPIC) and (UserType = dftConsultation) then
     Application.HelpSystem.ShowTopicHelp(cHelpConsultingRules, '')
    else
     if (l_Operartion = EOI_CONSULTATION_CALL_GARANT) then
      nsDoShellExecute(nsStringMapManager.Map[smap_InternetCaptions].DisplayNameToValue(vcmCStr(str_ilnCatalogue)))
     else
      if (l_Operartion = EOI_SHOW_CONSULTATION_LIST) then
      begin
       if (Consultation <> nil) then
       begin
        f_HyperlinkCallStatus := false; // http://mdp.garant.ru/pages/viewpage.action?pageId=342335537       
        if NativeMainForm.HasForm(fm_efList.rFormID, vcm_ztChild, True, @l_Form) then
         l_Form.SetActiveInParent;
       end;
      end
      else
       Result := False;
 end;

//#UC END# *4A815E860391_49539DBA029D_impl*
end;//TExTextForm.DoProcessExternalOperation

procedure TExTextForm.GotoPoint(aPointID: Cardinal;
  aPointType: TDocumentPositionType = dptSub);
//#UC START# *4A8164E801AE_49539DBA029D_var*
var
 l_Document : IDocument;
 l_Sub      : IeeSub;
//#UC END# *4A8164E801AE_49539DBA029D_var*
begin
//#UC START# *4A8164E801AE_49539DBA029D_impl*
 if Text.TextSource.HasDocument then
 begin
  if (aPointType = dptSub) then
  begin
   if (aPointID AND POSITION_TYPE_MASK = POSITION_TYPE_PARA_ID) then
    aPointType := dptPara;
   l3ClearMask(Integer(aPointID), Integer(POSITION_TYPE_MASK));
  end;//aPointType = dptSub
  case aPointType of
   dptPara :
    try
     Text.GoToPara(aPointID);
    except
     on E: Exception do
      l3System.Exception2Log(E);
    end;//try..except
   dptSub  :
    begin
     l_Document := Document;
     try
      l_Sub := Text.Editor.Data.Document.Subs.SubsByID[aPointID];
      if (l_Sub <> nil) and
         l_Sub.Exists then
       l_Sub.Select;
     finally
      l_Document := nil;
     end;//try..finally
    end;//dptSub
   dptBookmark :
    begin
     l_Sub := Text.Editor.Data.Document.Bookmarks.SubsByID[aPointID];
     if (l_Sub <> nil) and
        l_Sub.Exists then
      l_Sub.Select;
    end;//dptBookmark
   dptMarker :
    begin
     l_Sub := Text.Editor.Data.Document.Markers.SubsByID[aPointID];
     if (l_Sub <> nil) and
        l_Sub.Exists then
      l_Sub.Select;
    end;//dptMarker
   dptMark :
    begin
     l_Sub := Text.Editor.Data.Document.Marks.SubsByID[aPointID];
     if (l_Sub <> nil) and
        l_Sub.Exists then
      l_Sub.Select;
    end;//dptMark
   dptDocumentPlace:
    if aPointID = LongWord(Ord(ev_dpEnd)) then
     Text.GotoBottom;
  end;//case aPointType
 end//Text.TextSource.HasDocument
 else
 if (ViewArea <> nil) then
  ViewArea.DocInfo.SetPosition(TbsDocPos_C(aPointType, aPointID));
//#UC END# *4A8164E801AE_49539DBA029D_impl*
end;//TExTextForm.GotoPoint

procedure TExTextForm.OpenRedactionLocalLink(const aDocument: IDocument;
  aSub: Cardinal);
//#UC START# *4A81650B014A_49539DBA029D_var*

 function lp_GetDocumentRedactionID(const aDoc: IDocument): TRedactionID;
 // http://mdp.garant.ru/pages/viewpage.action?pageId=477628351 *)
 var
  l_DocState: IDocumentState;
  l_DocRedactionInfo: TRedactionInfo;
 begin
   Assert(aDoc <> nil);
   aDoc.GetCurrentState(l_DocState);
   Assert(l_DocState <> nil);
   try
    l_DocState.GetCurrentRedaction(l_DocRedactionInfo);
    Result := l_DocRedactionInfo.rID;
   finally
    l_DocState := nil;
    Finalize(l_DocRedactionInfo);
   end;//try..finally
 end;//lp_GetDocumentRedactionID

 function lp_GetDocumentRedactionIndex(const aDoc: IDocument; aRedactionID: TRedactionID): Integer;
 //http://mdp.garant.ru/pages/viewpage.action?pageId=477628351
 var
  l_RedactionItemInfo: TRedactionInfo;
  l_RedactionList: IRedactionInfoList;
  l_Index: Integer;
 begin
  aDoc.GetRedactionsList(l_RedactionList);
  try
   for l_Index := 0 to l_RedactionList.Count - 1 do
   begin
    l_RedactionList.pm_GetItem(l_Index, l_RedactionItemInfo);
    try
     if (l_RedactionItemInfo.rID = aRedactionID) then
     begin
      Result := l_Index;
      Exit;
     end;//if (l_RedactionItemInfo.rID = aRedactionID)
    finally
     Finalize(l_RedactionItemInfo);
    end;//try..finally
   end;//for l_Index := 0 to l_RedactionList.Count - 1
  finally
   l_RedactionList := nil;
  end;//try..finally
 end;//lp_GetDocumentRedactionIndex

var
 l_Redactions: IRedactionInfoList;

 l_LoopInfo,
 l_RedactionInfo,
 l_ActualInfo: TRedactionInfo;

 l_State,
 l_ActualState: IDocumentState;

 l_RedactionIndex,
 l_ActualIndex: Integer;

 l_ActualRedactionId: TRedactionID;
 l_ActualDoc: IDocument;
 I: Integer;
 l_Block: InevTag;
 l_Ob: InevObject;
 l_Para: IeeLeafPara;
 l_Sub: IevSub;

 l_CurrentRedactionIndex: Integer;
 l_AnotherRedactionIndex: Integer;
 l_ActiveElement: InevActiveElement;
 l_LeftDocument: IDocument;
 l_RightDocument: IDocument;
//#UC END# *4A81650B014A_49539DBA029D_var*
begin
//#UC START# *4A81650B014A_49539DBA029D_impl*
 // ��������� �������� ����� ��������� ����� ��������� ���������, �� ��������
 // ����� ����������� � ��������� ���������, ����������� � aDocument.
 // � ���� ����� ������.
 // http://mdp.garant.ru/pages/viewpage.action?pageId=476811628
 Assert(HyperlinkDocument <> nil);
 //http://mdp.garant.ru/pages/viewpage.action?pageId=477628351
 l_CurrentRedactionIndex := lp_GetDocumentRedactionIndex(HyperlinkDocument,
  lp_GetDocumentRedactionID(aDocument));
 Assert(aDocument <> nil);
 l_AnotherRedactionIndex := lp_GetDocumentRedactionIndex(HyperlinkDocument,
  lp_GetDocumentRedactionID(HyperlinkDocument));

 // ������ ��� ���������������� � �� �������� TbsDocPos � ��������� ������
 // �����/����, � �������� ����� ��� ����������� ����� � ���������, ����
 // ����� ���������
 // http://mdp.garant.ru/pages/viewpage.action?pageId=476379343
 // http://mdp.garant.ru/pages/viewpage.action?pageId=475141260
 l_ActiveElement := (Text as TevCustomEditorWindow).ActiveElement;
 if Assigned(l_ActiveElement) and
  evInPara(l_ActiveElement.Para, k2_idBlock, l_Block) then
 begin
  l_Block.Child[0].QT(InevObject, l_Ob);
  l_Para := TeeLeafPara.Make(EvFindNumberedPara(l_Ob), Text) as IeeLeafPara;
 end//if Assigned(l_ActiveElement)
 else
  l_Para := TeeLeafPara.Make((Text as TevCustomEditorWindow).Selection.Cursor.MostInner.Obj^, Text) as IeeLeafPara;
 l_ActiveElement := nil;

 try
  //�������, � ����� ��������, � ����� �������� ��� ���������, ��� ����� ���� � ���������, ���� ���� ��������
  //������� ��������, ������� �� ����, �� ������ ��������� ����� ���������, ��� � �������. ���� �� ������ -
  //������� ������ ���� � ������ ����. ���� � ������� - � �����. ����� �� ���������� �� ������������ ���������/
  // http://mdp.garant.ru/pages/viewpage.action?pageId=453155865
  if (l_CurrentRedactionIndex > l_AnotherRedactionIndex) then
  begin
   l_LeftDocument := aDocument;
   l_RightDocument := HyperlinkDocument;
  end//if (l_CurrentRedactionIndex > l_AnotherRedactionIndex) 
  else
  if (l_CurrentRedactionIndex < l_AnotherRedactionIndex) then
  begin
   l_LeftDocument := HyperlinkDocument;
   l_RightDocument := aDocument;
  end//if (l_CurrentRedactionIndex < l_AnotherRedactionIndex)
  else
   Assert(False, '��� ���������� �� ������ ��� ���������� ����� � ��� �� �������� ���������');

  TdmStdRes.MakeCompareEditions(l_LeftDocument, l_RightDocument,
   TbsDocPos_C(dptSub, aSub), HyperlinkDocument, l_Para);
 finally
  l_Para := nil;
  l_LeftDocument := nil;
  l_RightDocument := nil;
 end;//try..finally

(* ���� ������� - �� ������. ��������� ��� ������ � ���������� ���������.
 ���� ���������������.
// http://mdp.garant.ru/pages/viewpage.action?pageId=453155865
 l_ActualRedactionId := -1;
 aDocument.GetRedactionsList(l_Redactions);
 for I := 0 to l_Redactions.Count - 1 do
 begin
  l_Redactions.pm_GetItem(I, l_ActualInfo);
  if l_ActualInfo.rActualType = RT_ACTUAL then
  begin
   l_ActualRedactionId := l_ActualInfo.rId;
   l_ActualIndex := I;
   Break;
  end;
 end;
 Assert(l_ActualRedactionId >= 0);
 Assert(l_ActualIndex >= 0);

 aDocument.GetCurrentState(l_State);
 l_State.GetCurrentRedaction(l_RedactionInfo);
 l_State.Clone(l_ActualState);
 l_ActualState.SetRedactionOnId(l_ActualRedactionId);
 aDocument.CreateView(l_ActualState, l_ActualDoc);

 l_RedactionIndex := -1;
 for I := 0 to l_Redactions.Count - 1 do
 begin
  l_Redactions.pm_GetItem(I, l_LoopInfo);
  if l_LoopInfo.rId = l_RedactionInfo.rId then
  begin
   l_RedactionIndex := I;
   Break;
  end;
 end;
 Assert(l_RedactionIndex >= 0);

 // http://mdp.garant.ru/pages/viewpage.action?pageId=475141260
 if (aSub <> 0) then
 begin
  l_Sub := TextSource.DocumentContainer.SubList.Sub[aSub];
  if (l_Sub <> nil) and (l_Sub.Exists) then
  begin
   l_Sub.Select(Text.Selection);
   l_Para := TeeLeafPara.Make((Text as TevCustomEditorWindow).Selection.Cursor.MostInner.Obj^, Text) as IeeLeafPara;
  end;//if (l_Sub <> nil)
 end;//if (aSub <> 0)
 if (l_Para = nil) then
 begin
  if Assigned((Text as TevCustomEditorWindow).ActiveElement) and
   evInPara((Text as TevCustomEditorWindow).ActiveElement.Para, k2_idBlock, l_Block) then
  begin
   l_Block.Child[0].QT(InevObject, l_Ob);
   l_Para := TeeLeafPara.Make(EvFindNumberedPara(l_Ob), Text) as IeeLeafPara;
  end else
  l_Para := TeeLeafPara.Make((Text as TevCustomEditorWindow).Selection.Cursor.MostInner.Obj^, Text) as IeeLeafPara;
 end;//if (l_Para = nil)
//�������, � ����� ��������, � ����� �������� ��� ���������, ��� ����� ���� � ���������, ���� ���� ��������
//������� ��������, ������� �� ����, �� ������ ��������� ����� ���������, ��� � �������. ���� �� ������ -
//������� ������ ���� � ������ ����. ���� � ������� - � �����. ����� �� ���������� �� ������������ ���������/

 if l_ActualIndex < l_RedactionIndex
  then TdmStdRes.MakeCompareEditions(aDocument, l_ActualDoc, l_Para)
  else TdmStdRes.MakeCompareEditions(l_ActualDoc, aDocument, l_Para);      *)
//#UC END# *4A81650B014A_49539DBA029D_impl*
end;//TExTextForm.OpenRedactionLocalLink

function TExTextForm.HyperlinkDocument: IDocument;
//#UC START# *4A8168BB0217_49539DBA029D_var*
//#UC END# *4A8168BB0217_49539DBA029D_var*
begin
//#UC START# *4A8168BB0217_49539DBA029D_impl*
 Result := Document;
//#UC END# *4A8168BB0217_49539DBA029D_impl*
end;//TExTextForm.HyperlinkDocument

function TExTextForm.pm_GetHyperlinkText: TevCustomEditorWindow;
//#UC START# *4A82BC390036_49539DBA029Dget_var*
//#UC END# *4A82BC390036_49539DBA029Dget_var*
begin
//#UC START# *4A82BC390036_49539DBA029Dget_impl*
 Result := Text;
//#UC END# *4A82BC390036_49539DBA029Dget_impl*
end;//TExTextForm.pm_GetHyperlinkText

function TExTextForm.CanBeChanged: Boolean;
//#UC START# *4A8931130363_49539DBA029D_var*
//#UC END# *4A8931130363_49539DBA029D_var*
begin
//#UC START# *4A8931130363_49539DBA029D_impl*
 Result := true;
//#UC END# *4A8931130363_49539DBA029D_impl*
end;//TExTextForm.CanBeChanged

function TExTextForm.IsFloating: Boolean;
//#UC START# *4A8A9DB0001A_49539DBA029D_var*
//#UC END# *4A8A9DB0001A_49539DBA029D_var*
begin
//#UC START# *4A8A9DB0001A_49539DBA029D_impl*
 Result := false;
//#UC END# *4A8A9DB0001A_49539DBA029D_impl*
end;//TExTextForm.IsFloating

function TExTextForm.pm_GetTextWithComments: TevCustomEditorWindow;
//#UC START# *4A8AAD450084_49539DBA029Dget_var*
//#UC END# *4A8AAD450084_49539DBA029Dget_var*
begin
//#UC START# *4A8AAD450084_49539DBA029Dget_impl*
 Result := Text;
//#UC END# *4A8AAD450084_49539DBA029Dget_impl*
end;//TExTextForm.pm_GetTextWithComments

procedure TExTextForm.Document_CommonDocumentOpenNewWindow_Execute(aUserType: Integer);
//#UC START# *4A8EF02E007D_49539DBA029Dexec_var*
var
 l_NewDocument : IDocument;
 l_Cont        : IvcmContainer;
 l_TopPara     : IeePara;
//#UC END# *4A8EF02E007D_49539DBA029Dexec_var*
begin
//#UC START# *4A8EF02E007D_49539DBA029Dexec_impl*
 // �������� ����� ���� ������� ��� ����� � ���������� UserType
 
 if not CheckParamForUserType(aUserType) then
  Exit;

 if (Document <> nil) then
 begin
  l_Cont := nsOpenNewWindowParams(NativeMainForm);
  // http://mdp.garant.ru/pages/viewpage.action?pageId=414849606
  if (l_Cont <> nil) then
  try
   l_TopPara := GetTopParaID;
   try
    l_NewDocument := defDataAdapter.TimeMachine.CorrectDocumentEdition(Document);
    try
     if (l_TopPara <> nil) then
      TdmStdRes.OpenDocument(TdeDocInfo.Make(l_NewDocument,
                                             TbsDocPos_P(l_TopPara)),
                             l_Cont)
     else
      TdmStdRes.OpenDocument(TdeDocInfo.Make(l_NewDocument), l_Cont);
    finally
     l_NewDocument := nil;
    end;//try..finally
   finally
    l_TopPara := nil;
   end;//try..finally
  finally
   l_Cont := nil;
  end;//try..finally
 end;//Document <> nil
//#UC END# *4A8EF02E007D_49539DBA029Dexec_impl*
end;//TExTextForm.Document_CommonDocumentOpenNewWindow_Execute

procedure TExTextForm.Document_CommonDocumentOpenNewWindow(const aParams: IvcmExecuteParams);
begin
 with (aParams.Data As IDocument_CommonDocumentOpenNewWindow_Params) do
  Document_CommonDocumentOpenNewWindow_Execute(UserType);
end;

procedure TExTextForm.System_TimeMachineStateChange_Execute(aStayInCurrentRedaction: Boolean = false);
//#UC START# *4A8EF367029E_49539DBA029Dexec_var*
//#UC END# *4A8EF367029E_49539DBA029Dexec_var*
begin
//#UC START# *4A8EF367029E_49539DBA029Dexec_impl*
 if (UserType = dftDocument) then
 begin
  if not defDataAdapter.TimeMachine.IsOn then
  begin
   if aStayInCurrentRedaction then
    f_DontResetRedactions := True;
   if not f_DontResetRedactions then
    SetActualRedaction
   else
   // ����� �� ���� ������ ������� ��� � http://mdp.garant.ru/pages/viewpage.action?pageId=342866563
   // ��������� ���� �������� - and dsDocument.TimeMachineOff
   if Visible and Assigned(dsDocument) and dsDocument.TimeMachineOff then
    DocumentSet.OpenWarning;
  end//not defDataAdapter.TimeMachine.IsOn
  else
  if not ReloadRedaction(defDataAdapter.TimeMachine.Date) and
     Visible and Assigned(dsDocument) and dsDocument.TimeMachineOff then
   DocumentSet.OpenWarning;
 end;//UserType = dftDocument
 f_DontResetRedactions := False;
//#UC END# *4A8EF367029E_49539DBA029Dexec_impl*
end;//TExTextForm.System_TimeMachineStateChange_Execute

procedure TExTextForm.System_TimeMachineStateChange(const aParams: IvcmExecuteParams);
begin
 with (aParams.Data As ISystem_TimeMachineStateChange_Params) do
  System_TimeMachineStateChange_Execute(StayInCurrentRedaction);
end;

procedure TExTextForm.Redactions_RedactionOnID_Execute(aRedactionID: TRedactionID);
//#UC START# *4A8EF4B50044_49539DBA029Dexec_var*
//#UC END# *4A8EF4B50044_49539DBA029Dexec_var*
begin
//#UC START# *4A8EF4B50044_49539DBA029Dexec_impl*
 if (UserType = dftDocument) and
    (Document <> nil) then
  ReloadRedaction(crtID, aRedactionID);
//#UC END# *4A8EF4B50044_49539DBA029Dexec_impl*
end;//TExTextForm.Redactions_RedactionOnID_Execute

procedure TExTextForm.Redactions_RedactionOnID(const aParams: IvcmExecuteParams);
begin
 with (aParams.Data As IRedactions_RedactionOnID_Params) do
  Redactions_RedactionOnID_Execute(RedactionID);
end;

function TExTextForm.Document_FindExplanation_Execute: Boolean;
//#UC START# *4A9D26B80015_49539DBA029Dexec_var*
//#UC END# *4A9D26B80015_49539DBA029Dexec_var*
begin
//#UC START# *4A9D26B80015_49539DBA029Dexec_impl*
 Result := true;
 if Text.HasSelection then
  DoFindInDict
 else
  Result := false;
//#UC END# *4A9D26B80015_49539DBA029Dexec_impl*
end;//TExTextForm.Document_FindExplanation_Execute

procedure TExTextForm.Document_FindExplanation(const aParams: IvcmExecuteParams);
begin
 with (aParams.Data As IDocument_FindExplanation_Params) do
  ResultValue := Document_FindExplanation_Execute;
end;

procedure TExTextForm.Selection_FindInDict_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4A9D3FC50134_49539DBA029Dtest_var*
//#UC END# *4A9D3FC50134_49539DBA029Dtest_var*
begin
//#UC START# *4A9D3FC50134_49539DBA029Dtest_impl*
 if aParams.Op.Flag[vcm_ofEnabled] then 
  aParams.Op.Flag[vcm_ofEnabled] := (Document <> nil) and
                                   defDataAdapter.IsExplanatoryExists;
//#UC END# *4A9D3FC50134_49539DBA029Dtest_impl*
end;//TExTextForm.Selection_FindInDict_Test

procedure TExTextForm.Selection_FindInDict_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4A9D3FC50134_49539DBA029Dexec_var*
//#UC END# *4A9D3FC50134_49539DBA029Dexec_var*
begin
//#UC START# *4A9D3FC50134_49539DBA029Dexec_impl*
 DoFindInDict;
//#UC END# *4A9D3FC50134_49539DBA029Dexec_impl*
end;//TExTextForm.Selection_FindInDict_Execute

function TExTextForm.Document_SetPosition_Execute(aPointID: Cardinal;
  aPointType: TDocumentPositionType = dptSub;
  aUserType: Integer = 0): Boolean;
//#UC START# *4AE9D38A02DA_49539DBA029Dexec_var*
//#UC END# *4AE9D38A02DA_49539DBA029Dexec_var*
begin
//#UC START# *4AE9D38A02DA_49539DBA029Dexec_impl*
 if not CheckParamForUserType(aUserType) then
 begin
  Result := false;
  Exit;
 end;//not CheckParamForUserType(aUserType)
 Result := true;
 GoToPoint(aPointID, aPointType)
//#UC END# *4AE9D38A02DA_49539DBA029Dexec_impl*
end;//TExTextForm.Document_SetPosition_Execute

procedure TExTextForm.Document_SetPosition(const aParams: IvcmExecuteParams);
begin
 with (aParams.Data As IDocument_SetPosition_Params) do
  ResultValue := Document_SetPosition_Execute(PointID, PointType, UserType);
end;

procedure TExTextForm.Document_SetActive_Execute(aUserType: Integer);
//#UC START# *4AE9D9AF02FE_49539DBA029Dexec_var*
//#UC END# *4AE9D9AF02FE_49539DBA029Dexec_var*
begin
//#UC START# *4AE9D9AF02FE_49539DBA029Dexec_impl*
 if (ZoneType = vcm_ztChild) and
    (UserType = aUserType) then
 begin
  if IsActiveInParent then
   SetInactiveInParent
  else
   SetActiveInParent;
 end;//ZoneType = vcm_ztChild
//#UC END# *4AE9D9AF02FE_49539DBA029Dexec_impl*
end;//TExTextForm.Document_SetActive_Execute

procedure TExTextForm.Document_SetActive(const aParams: IvcmExecuteParams);
begin
 with (aParams.Data As IDocument_SetActive_Params) do
  Document_SetActive_Execute(UserType);
end;

procedure TExTextForm.Document_ExportBlock_Execute(const aData: IUnknown;
  aUserType: Integer;
  aToActiveWindow: Boolean);
//#UC START# *4AE9DC070264_49539DBA029Dexec_var*
//#UC END# *4AE9DC070264_49539DBA029Dexec_var*
begin
//#UC START# *4AE9DC070264_49539DBA029Dexec_impl*
 ExportBlock(ExtractRangeFromContents(aData, aUserType), aToActiveWindow);
//#UC END# *4AE9DC070264_49539DBA029Dexec_impl*
end;//TExTextForm.Document_ExportBlock_Execute

procedure TExTextForm.Document_ExportBlock(const aParams: IvcmExecuteParams);
begin
 with (aParams.Data As IDocument_ExportBlock_Params) do
  Document_ExportBlock_Execute(Data, UserType, ToActiveWindow);
end;

procedure TExTextForm.Document_GetCurrentPosition_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4AEAF9C000D8_49539DBA029Dtest_var*
//#UC END# *4AEAF9C000D8_49539DBA029Dtest_var*
begin
//#UC START# *4AEAF9C000D8_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := (UserType in [dftDocument, dftMedicFirm]);
//#UC END# *4AEAF9C000D8_49539DBA029Dtest_impl*
end;//TExTextForm.Document_GetCurrentPosition_Test

function TExTextForm.Document_GetCurrentPosition_Execute: Integer;
//#UC START# *4AEAF9C000D8_49539DBA029Dexec_var*
var
 l_CurSub : IeeSub;
//#UC END# *4AEAF9C000D8_49539DBA029Dexec_var*
begin
//#UC START# *4AEAF9C000D8_49539DBA029Dexec_impl*
 l_CurSub := Text.GetNearestSubByCursor;
 try
  if (l_CurSub <> nil) then
   Result := l_CurSub.ID
  else
   Result := -1;
 finally
  l_CurSub := nil;
 end;//try..finally
//#UC END# *4AEAF9C000D8_49539DBA029Dexec_impl*
end;//TExTextForm.Document_GetCurrentPosition_Execute

procedure TExTextForm.Document_GetCurrentPosition(const aParams: IvcmExecuteParams);
begin
 with (aParams.Data As IDocument_GetCurrentPosition_Params) do
  ResultValue := Document_GetCurrentPosition_Execute;
end;

procedure TExTextForm.Document_SelectBlock_Execute(const aData: IUnknown;
  aUserType: Integer);
//#UC START# *4AEB097001C3_49539DBA029Dexec_var*
//#UC END# *4AEB097001C3_49539DBA029Dexec_var*
begin
//#UC START# *4AEB097001C3_49539DBA029Dexec_impl*
 SelectBlock(ExtractRangeFromContents(aData, aUserType));
//#UC END# *4AEB097001C3_49539DBA029Dexec_impl*
end;//TExTextForm.Document_SelectBlock_Execute

procedure TExTextForm.Document_SelectBlock(const aParams: IvcmExecuteParams);
begin
 with (aParams.Data As IDocument_SelectBlock_Params) do
  Document_SelectBlock_Execute(Data, UserType);
end;

procedure TExTextForm.Document_CopyBlock_Execute(const aData: IUnknown;
  aUserType: Integer);
//#UC START# *4AEB09C50287_49539DBA029Dexec_var*
//#UC END# *4AEB09C50287_49539DBA029Dexec_var*
begin
//#UC START# *4AEB09C50287_49539DBA029Dexec_impl*
 CopyBlock(ExtractRangeFromContents(aData, aUserType));
//#UC END# *4AEB09C50287_49539DBA029Dexec_impl*
end;//TExTextForm.Document_CopyBlock_Execute

procedure TExTextForm.Document_CopyBlock(const aParams: IvcmExecuteParams);
begin
 with (aParams.Data As IDocument_CopyBlock_Params) do
  Document_CopyBlock_Execute(Data, UserType);
end;

procedure TExTextForm.Document_PrintBlock_Execute(const aData: IUnknown;
  aUserType: Integer);
//#UC START# *4AEB0A1C0270_49539DBA029Dexec_var*
//#UC END# *4AEB0A1C0270_49539DBA029Dexec_var*
begin
//#UC START# *4AEB0A1C0270_49539DBA029Dexec_impl*
 PrintBlock(ExtractRangeFromContents(aData, aUserType));
//#UC END# *4AEB0A1C0270_49539DBA029Dexec_impl*
end;//TExTextForm.Document_PrintBlock_Execute

procedure TExTextForm.Document_PrintBlock(const aParams: IvcmExecuteParams);
begin
 with (aParams.Data As IDocument_PrintBlock_Params) do
  Document_PrintBlock_Execute(Data, UserType);
end;

procedure TExTextForm.Document_PrintDialogBlock_Execute(const aData: IUnknown;
  aUserType: Integer);
//#UC START# *4AEB0A550165_49539DBA029Dexec_var*
//#UC END# *4AEB0A550165_49539DBA029Dexec_var*
begin
//#UC START# *4AEB0A550165_49539DBA029Dexec_impl*
 PrintDialogBlock(ExtractRangeFromContents(aData, aUserType));
//#UC END# *4AEB0A550165_49539DBA029Dexec_impl*
end;//TExTextForm.Document_PrintDialogBlock_Execute

procedure TExTextForm.Document_PrintDialogBlock(const aParams: IvcmExecuteParams);
begin
 with (aParams.Data As IDocument_PrintDialogBlock_Params) do
  Document_PrintDialogBlock_Execute(Data, UserType);
end;

procedure TExTextForm.Document_PreviewBlock_Execute(const aData: IUnknown;
  aUserType: Integer);
//#UC START# *4AEB0A8E002E_49539DBA029Dexec_var*
//#UC END# *4AEB0A8E002E_49539DBA029Dexec_var*
begin
//#UC START# *4AEB0A8E002E_49539DBA029Dexec_impl*
 PreviewBlock(ExtractRangeFromContents(aData, aUserType));
//#UC END# *4AEB0A8E002E_49539DBA029Dexec_impl*
end;//TExTextForm.Document_PreviewBlock_Execute

procedure TExTextForm.Document_PreviewBlock(const aParams: IvcmExecuteParams);
begin
 with (aParams.Data As IDocument_PreviewBlock_Params) do
  Document_PreviewBlock_Execute(Data, UserType);
end;

procedure TExTextForm.Document_ShowRespondentListToPart_Execute(const aList: IPositionList;
  const aCurrent: Il3SimpleNode = nil);
//#UC START# *4AEEEE970141_49539DBA029Dexec_var*
//#UC END# *4AEEEE970141_49539DBA029Dexec_var*
begin
//#UC START# *4AEEEE970141_49539DBA029Dexec_impl*
 if (UserType in [dftDocument, dftAACLeft]) then
  OpenCRListToPart(crtRespondents, aCurrent, aList);
//#UC END# *4AEEEE970141_49539DBA029Dexec_impl*
end;//TExTextForm.Document_ShowRespondentListToPart_Execute

procedure TExTextForm.Document_ShowRespondentListToPart(const aParams: IvcmExecuteParams);
begin
 with (aParams.Data As IDocument_ShowRespondentListToPart_Params) do
  Document_ShowRespondentListToPart_Execute(List, Current);
end;

procedure TExTextForm.Document_ShowCorrespondentListToPart_Execute(const aList: IPositionList;
  const aCurrent: Il3SimpleNode = nil);
//#UC START# *4AEEEEB7027C_49539DBA029Dexec_var*
//#UC END# *4AEEEEB7027C_49539DBA029Dexec_var*
begin
//#UC START# *4AEEEEB7027C_49539DBA029Dexec_impl*
 if (UserType in [dftDocument, dftAACLeft]) then
  OpenCRListToPart(crtCorrespondents, aCurrent, aList);
//#UC END# *4AEEEEB7027C_49539DBA029Dexec_impl*
end;//TExTextForm.Document_ShowCorrespondentListToPart_Execute

procedure TExTextForm.Document_ShowCorrespondentListToPart(const aParams: IvcmExecuteParams);
begin
 with (aParams.Data As IDocument_ShowCorrespondentListToPart_Params) do
  Document_ShowCorrespondentListToPart_Execute(List, Current);
end;

procedure TExTextForm.Document_ModifyBookmarkNotify_Execute(const anEntity: IUnknown);
//#UC START# *4AEEF7F40304_49539DBA029Dexec_var*
var
 l_Bookmark : IBookmark;
 l_Sub      : IeeSub;
//#UC END# *4AEEF7F40304_49539DBA029Dexec_var*
begin
//#UC START# *4AEEF7F40304_49539DBA029Dexec_impl*
 if (Document <> nil) and
    (Text.Editor.Data.Document.Bookmarks.Count > 0) and
    Supports(anEntity, IBookmark, l_Bookmark) then
  try
   if FindBookmarkInText(l_Bookmark, l_Sub) then
    try
     l_Sub.Name := nsGetBookmarkName(l_Bookmark).AsWStr;
    finally
     l_Sub := nil;
    end;//try..finally
  finally
   l_Bookmark := nil;
  end;//try..finally
//#UC END# *4AEEF7F40304_49539DBA029Dexec_impl*
end;//TExTextForm.Document_ModifyBookmarkNotify_Execute

procedure TExTextForm.Document_ModifyBookmarkNotify(const aParams: IvcmExecuteParams);
begin
 with (aParams.Data As IDocument_ModifyBookmarkNotify_Params) do
  Document_ModifyBookmarkNotify_Execute(nEntity);
end;

procedure TExTextForm.Document_AddBookmarkFromContents_Execute(const aTag: InevTag);
//#UC START# *4AEEF87B00E1_49539DBA029Dexec_var*
var
 l_eePara: IeePara;
//#UC END# *4AEEF87B00E1_49539DBA029Dexec_var*
begin
//#UC START# *4AEEF87B00E1_49539DBA029Dexec_impl*
 if (Document <> nil) and
    (aTag <> nil) then
 begin
  l_eePara := TeePara.Make(aTag.Box, Text As IeeDocumentEx);
  try
   AddBookmark(eeFindNumberedPara(l_eePara, Text as IeeDocumentEx));
  finally
   l_eePara := nil;
  end;
 end;//Document <> nil
//#UC END# *4AEEF87B00E1_49539DBA029Dexec_impl*
end;//TExTextForm.Document_AddBookmarkFromContents_Execute

procedure TExTextForm.Document_AddBookmarkFromContents(const aParams: IvcmExecuteParams);
begin
 with (aParams.Data As IDocument_AddBookmarkFromContents_Params) do
  Document_AddBookmarkFromContents_Execute(Tag);
end;

procedure TExTextForm.Document_GetCorrespondentListExFrmAct_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4AF329F6002A_49539DBA029Dtest_var*
//#UC END# *4AF329F6002A_49539DBA029Dtest_var*
begin
//#UC START# *4AF329F6002A_49539DBA029Dtest_impl*
 TypedCRToPartTest(aParams, crtCorrespondents);
//#UC END# *4AF329F6002A_49539DBA029Dtest_impl*
end;//TExTextForm.Document_GetCorrespondentListExFrmAct_Test

procedure TExTextForm.Document_GetCorrespondentListExFrmAct_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4AF329F6002A_49539DBA029Dexec_var*
//#UC END# *4AF329F6002A_49539DBA029Dexec_var*
begin
//#UC START# *4AF329F6002A_49539DBA029Dexec_impl*
 if (aParams.CurrentNode <> nil) OR (aParams.ItemIndex >= 0) then
  GetCorrespondentListEx(aParams.ItemIndex, bsConvertFilteredCRNode(aParams.CurrentNode));
//#UC END# *4AF329F6002A_49539DBA029Dexec_impl*
end;//TExTextForm.Document_GetCorrespondentListExFrmAct_Execute

procedure TExTextForm.Document_GetRespondentListExFrmAct_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4AF329FD014D_49539DBA029Dtest_var*
//#UC END# *4AF329FD014D_49539DBA029Dtest_var*
begin
//#UC START# *4AF329FD014D_49539DBA029Dtest_impl*
 TypedCRToPartTest(aParams, crtRespondents);
//#UC END# *4AF329FD014D_49539DBA029Dtest_impl*
end;//TExTextForm.Document_GetRespondentListExFrmAct_Test

procedure TExTextForm.Document_GetRespondentListExFrmAct_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4AF329FD014D_49539DBA029Dexec_var*
//#UC END# *4AF329FD014D_49539DBA029Dexec_var*
begin
//#UC START# *4AF329FD014D_49539DBA029Dexec_impl*
 if (aParams.CurrentNode <> nil) OR (aParams.ItemIndex >= 0) then
  GetRespondentListEx(aParams.ItemIndex, aParams.CurrentNode);
//#UC END# *4AF329FD014D_49539DBA029Dexec_impl*
end;//TExTextForm.Document_GetRespondentListExFrmAct_Execute

procedure TExTextForm.TimeMachine_TimeMachineOnOff_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4AF83BDB03AE_49539DBA029Dtest_var*
//#UC END# *4AF83BDB03AE_49539DBA029Dtest_var*
begin
//#UC START# *4AF83BDB03AE_49539DBA029Dtest_impl*
 with aParams do
 begin
  Op.Flag[vcm_ofEnabled] := Assigned(Document) and
   (not Document.GetNotTm or DefDataAdapter.TimeMachine.IsOn);
  if Op.Flag[vcm_ofEnabled] then
   Op.Flag[vcm_ofChecked] := defDataAdapter.TimeMachine.IsOn;
 end;//with aParams do
//#UC END# *4AF83BDB03AE_49539DBA029Dtest_impl*
end;//TExTextForm.TimeMachine_TimeMachineOnOff_Test

procedure TExTextForm.TimeMachine_TimeMachineOnOff_Execute;
//#UC START# *4AF83BDB03AE_49539DBA029Dexec_var*
//#UC END# *4AF83BDB03AE_49539DBA029Dexec_var*
begin
//#UC START# *4AF83BDB03AE_49539DBA029Dexec_impl*
 f_DontResetRedactions := true;
 TimeMachineOnOff;
//#UC END# *4AF83BDB03AE_49539DBA029Dexec_impl*
end;//TExTextForm.TimeMachine_TimeMachineOnOff_Execute

procedure TExTextForm.TimeMachine_TimeMachineOnOff(const aParams: IvcmExecuteParams);
begin
 TimeMachine_TimeMachineOnOff_Execute;
end;

procedure TExTextForm.TimeMachine_TimeMachineOffAndReset_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4AF83BEB0393_49539DBA029Dtest_var*
//#UC END# *4AF83BEB0393_49539DBA029Dtest_var*
begin
//#UC START# *4AF83BEB0393_49539DBA029Dtest_impl*
 if aParams.Op.Flag[vcm_ofEnabled] then
  aParams.Op.Flag[vcm_ofEnabled] := defDataAdapter.TimeMachine.IsOn;
//#UC END# *4AF83BEB0393_49539DBA029Dtest_impl*
end;//TExTextForm.TimeMachine_TimeMachineOffAndReset_Test

procedure TExTextForm.TimeMachine_TimeMachineOffAndReset_Execute;
//#UC START# *4AF83BEB0393_49539DBA029Dexec_var*
//#UC END# *4AF83BEB0393_49539DBA029Dexec_var*
begin
//#UC START# *4AF83BEB0393_49539DBA029Dexec_impl*
 TimeMachineOnOff(True);
//#UC END# *4AF83BEB0393_49539DBA029Dexec_impl*
end;//TExTextForm.TimeMachine_TimeMachineOffAndReset_Execute

procedure TExTextForm.TimeMachine_TimeMachineOffAndReset(const aParams: IvcmExecuteParams);
begin
 TimeMachine_TimeMachineOffAndReset_Execute;
end;

procedure TExTextForm.Document_OpenNotSureTopic_Execute;
//#UC START# *4AF83C3D01DA_49539DBA029Dexec_var*
var
 l_Document: IDocument;
//#UC END# *4AF83C3D01DA_49539DBA029Dexec_var*
begin
//#UC START# *4AF83C3D01DA_49539DBA029Dexec_impl*
 if (UserType = dftDocument) then
 begin
  l_Document := defDataAdapter.TimeMachine.NotSureHelp;
  if Assigned(l_Document) then
   try
    TdmStdRes.OpenDocumentWithCheck(TdeDocInfo.Make(l_Document), NativeMainForm);
   finally
    l_Document := nil;
   end;//try..finally
 end;//UserType = dftDocument
//#UC END# *4AF83C3D01DA_49539DBA029Dexec_impl*
end;//TExTextForm.Document_OpenNotSureTopic_Execute

procedure TExTextForm.Document_OpenNotSureTopic(const aParams: IvcmExecuteParams);
begin
 Document_OpenNotSureTopic_Execute;
end;

procedure TExTextForm.Redactions_ActualRedaction_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4AFAF4900270_49539DBA029Dtest_var*
//#UC END# *4AFAF4900270_49539DBA029Dtest_var*
begin
//#UC START# *4AFAF4900270_49539DBA029Dtest_impl*
 if EnableRedactionOps(aParams) and Assigned(ViewArea) then
  aParams.Op.Flag[vcm_ofChecked] := TdmStdRes.IsCurEditionActual(ViewArea.DocInfo.Doc);
//#UC END# *4AFAF4900270_49539DBA029Dtest_impl*
end;//TExTextForm.Redactions_ActualRedaction_Test

procedure TExTextForm.Redactions_ActualRedaction_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4AFAF4900270_49539DBA029Dexec_var*
//#UC END# *4AFAF4900270_49539DBA029Dexec_var*
begin
//#UC START# *4AFAF4900270_49539DBA029Dexec_impl*
 SetActualRedaction;
//#UC END# *4AFAF4900270_49539DBA029Dexec_impl*
end;//TExTextForm.Redactions_ActualRedaction_Execute

procedure TExTextForm.Edit_ToggleFoundWords_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4AFD4230031F_49539DBA029Dtest_var*
//#UC END# *4AFD4230031F_49539DBA029Dtest_var*
begin
//#UC START# *4AFD4230031F_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofChecked] := (Text.ExcludeSuper = []);
//#UC END# *4AFD4230031F_49539DBA029Dtest_impl*
end;//TExTextForm.Edit_ToggleFoundWords_Test

procedure TExTextForm.Edit_ToggleFoundWords_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4AFD4230031F_49539DBA029Dexec_var*
//#UC END# *4AFD4230031F_49539DBA029Dexec_var*
begin
//#UC START# *4AFD4230031F_49539DBA029Dexec_impl*
 with Text do
  if (ExcludeSuper = []) then
   ExcludeSuper := [ev_slFoundWords]
  else
   ExcludeSuper := [];
//#UC END# *4AFD4230031F_49539DBA029Dexec_impl*
end;//TExTextForm.Edit_ToggleFoundWords_Execute

function TExTextForm.Document_GotoPara_Execute(const aPara: InevTag;
  aUserType: Integer): Boolean;
//#UC START# *4AFD4A45003B_49539DBA029Dexec_var*
var
 l_O : InevObject;
//#UC END# *4AFD4A45003B_49539DBA029Dexec_var*
begin
//#UC START# *4AFD4A45003B_49539DBA029Dexec_impl*
 if not CheckParamForUserType(aUserType) then
 begin
  Result := false;
  Exit;
 end;//not CheckParamForUserType(aUserType)
 Result := true;
 if not aPara.QT(InevObject, l_O) then
  Assert(false);
 Text.GotoTag(l_O);
//#UC END# *4AFD4A45003B_49539DBA029Dexec_impl*
end;//TExTextForm.Document_GotoPara_Execute

procedure TExTextForm.Document_GotoPara(const aParams: IvcmExecuteParams);
begin
 with (aParams.Data As IDocument_GotoPara_Params) do
  ResultValue := Document_GotoPara_Execute(Para, UserType);
end;

procedure TExTextForm.TimeMachine_TimeMachineOnOffNew_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4B261EC80086_49539DBA029Dtest_var*
//#UC END# *4B261EC80086_49539DBA029Dtest_var*
begin
//#UC START# *4B261EC80086_49539DBA029Dtest_impl*
 with aParams do
 begin
  Op.Flag[vcm_ofEnabled] := Assigned(Document) and
   (not Document.GetNotTm or DefDataAdapter.TimeMachine.IsOn);
  if Op.Flag[vcm_ofEnabled] then
   Op.Flag[vcm_ofChecked] := defDataAdapter.TimeMachine.IsOn;
 end;//with aParams do
//#UC END# *4B261EC80086_49539DBA029Dtest_impl*
end;//TExTextForm.TimeMachine_TimeMachineOnOffNew_Test

procedure TExTextForm.TimeMachine_TimeMachineOnOffNew_GetState(var State: TvcmOperationStateIndex);
//#UC START# *4B261EC80086_49539DBA029Dgetstate_var*
//#UC END# *4B261EC80086_49539DBA029Dgetstate_var*
begin
//#UC START# *4B261EC80086_49539DBA029Dgetstate_impl*
 if (Document <> nil) then
 begin
  if not defDataAdapter.TimeMachine.IsOn then
   State := st_user_TimeMachine_TimeMachineOnOffNew_MachineOn
  else
   State := st_user_TimeMachine_TimeMachineOnOffNew_MachineOff;
 end//Document <> nil
 else
  State := vcm_DefaultOperationState;
//#UC END# *4B261EC80086_49539DBA029Dgetstate_impl*
end;//TExTextForm.TimeMachine_TimeMachineOnOffNew_GetState

procedure TExTextForm.TimeMachine_TimeMachineOnOffNew_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4B261EC80086_49539DBA029Dexec_var*
//#UC END# *4B261EC80086_49539DBA029Dexec_var*
begin
//#UC START# *4B261EC80086_49539DBA029Dexec_impl*
 if DefDataAdapter.TimeMachine.IsOn then
  TdmStdRes.OpenTurnOffTimeMachine(InsTurnOffTimeMachine(Self))
 else
  TdmStdRes.OpenTurnOnTimeMachine(InsTurnOnTimeMachine(Self));
//#UC END# *4B261EC80086_49539DBA029Dexec_impl*
end;//TExTextForm.TimeMachine_TimeMachineOnOffNew_Execute

procedure TExTextForm.Redactions_OpenRedactionListFrmAct_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4B262F9701DE_49539DBA029Dtest_var*
//#UC END# *4B262F9701DE_49539DBA029Dtest_var*
begin
//#UC START# *4B262F9701DE_49539DBA029Dtest_impl*
 EnableRedactionOps(aParams);
//#UC END# *4B262F9701DE_49539DBA029Dtest_impl*
end;//TExTextForm.Redactions_OpenRedactionListFrmAct_Test

procedure TExTextForm.Redactions_OpenRedactionListFrmAct_GetState(var State: TvcmOperationStateIndex);
//#UC START# *4B262F9701DE_49539DBA029Dgetstate_var*
//#UC END# *4B262F9701DE_49539DBA029Dgetstate_var*
begin
//#UC START# *4B262F9701DE_49539DBA029Dgetstate_impl*
 State := vcm_DefaultOperationState;
//#UC END# *4B262F9701DE_49539DBA029Dgetstate_impl*
end;//TExTextForm.Redactions_OpenRedactionListFrmAct_GetState

procedure TExTextForm.Redactions_OpenRedactionListFrmAct_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4B262F9701DE_49539DBA029Dexec_var*
//#UC END# *4B262F9701DE_49539DBA029Dexec_var*
begin
//#UC START# *4B262F9701DE_49539DBA029Dexec_impl*
 OpenRedactionList;
//#UC END# *4B262F9701DE_49539DBA029Dexec_impl*
end;//TExTextForm.Redactions_OpenRedactionListFrmAct_Execute

procedure TExTextForm.Document_GetParaForPositionning_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4B506F4D0196_49539DBA029Dtest_var*
//#UC END# *4B506F4D0196_49539DBA029Dtest_var*
begin
//#UC START# *4B506F4D0196_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := (UserType in [dftDocument, dftMedicFirm]);
//#UC END# *4B506F4D0196_49539DBA029Dtest_impl*
end;//TExTextForm.Document_GetParaForPositionning_Test

function TExTextForm.Document_GetParaForPositionning_Execute: IeeLeafPara;
//#UC START# *4B506F4D0196_49539DBA029Dexec_var*
//#UC END# *4B506F4D0196_49539DBA029Dexec_var*
begin
//#UC START# *4B506F4D0196_49539DBA029Dexec_impl*
 Result := GetParaForPositionning;
//#UC END# *4B506F4D0196_49539DBA029Dexec_impl*
end;//TExTextForm.Document_GetParaForPositionning_Execute

procedure TExTextForm.Document_GetParaForPositionning(const aParams: IvcmExecuteParams);
begin
 with (aParams.Data As IDocument_GetParaForPositionning_Params) do
  ResultValue := Document_GetParaForPositionning_Execute;
end;

function TExTextForm.NeedGotoNeighbours: Boolean;
//#UC START# *4C068AB5026A_49539DBA029D_var*
//#UC END# *4C068AB5026A_49539DBA029D_var*
begin
//#UC START# *4C068AB5026A_49539DBA029D_impl*
 Result := true;
//#UC END# *4C068AB5026A_49539DBA029D_impl*
end;//TExTextForm.NeedGotoNeighbours

procedure TExTextForm.DocumentBlock_GetCorrespondentList_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C2AEDB3003B_49539DBA029Dtest_var*
//#UC END# *4C2AEDB3003B_49539DBA029Dtest_var*
begin
//#UC START# *4C2AEDB3003B_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := false;
//#UC END# *4C2AEDB3003B_49539DBA029Dtest_impl*
end;//TExTextForm.DocumentBlock_GetCorrespondentList_Test

procedure TExTextForm.DocumentBlock_GetCorrespondentList_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C2AEDB3003B_49539DBA029Dexec_var*
//#UC END# *4C2AEDB3003B_49539DBA029Dexec_var*
begin
//#UC START# *4C2AEDB3003B_49539DBA029Dexec_impl*
 Assert(false, '��� ����������� ��������');
//#UC END# *4C2AEDB3003B_49539DBA029Dexec_impl*
end;//TExTextForm.DocumentBlock_GetCorrespondentList_Execute

procedure TExTextForm.DocumentBlock_GetRespondentList_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C2AEDC503CC_49539DBA029Dtest_var*
//#UC END# *4C2AEDC503CC_49539DBA029Dtest_var*
begin
//#UC START# *4C2AEDC503CC_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := false;
//#UC END# *4C2AEDC503CC_49539DBA029Dtest_impl*
end;//TExTextForm.DocumentBlock_GetRespondentList_Test

procedure TExTextForm.DocumentBlock_GetRespondentList_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C2AEDC503CC_49539DBA029Dexec_var*
//#UC END# *4C2AEDC503CC_49539DBA029Dexec_var*
begin
//#UC START# *4C2AEDC503CC_49539DBA029Dexec_impl*
 Assert(false, '��� ����������� ��������');
//#UC END# *4C2AEDC503CC_49539DBA029Dexec_impl*
end;//TExTextForm.DocumentBlock_GetRespondentList_Execute

procedure TExTextForm.DocumentBlock_GetTypedCorrespondentList_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C2AEDDA0335_49539DBA029Dtest_var*
//#UC END# *4C2AEDDA0335_49539DBA029Dtest_var*
begin
//#UC START# *4C2AEDDA0335_49539DBA029Dtest_impl*
 DisableOperation(aParams);
//#UC END# *4C2AEDDA0335_49539DBA029Dtest_impl*
end;//TExTextForm.DocumentBlock_GetTypedCorrespondentList_Test

procedure TExTextForm.DocumentBlock_GetTypedCorrespondentList_GetState(var State: TvcmOperationStateIndex);
//#UC START# *4C2AEDDA0335_49539DBA029Dgetstate_var*
//#UC END# *4C2AEDDA0335_49539DBA029Dgetstate_var*
begin
//#UC START# *4C2AEDDA0335_49539DBA029Dgetstate_impl*
 State := st_user_DocumentBlock_GetTypedCorrespondentList_InText;
//#UC END# *4C2AEDDA0335_49539DBA029Dgetstate_impl*
end;//TExTextForm.DocumentBlock_GetTypedCorrespondentList_GetState

procedure TExTextForm.DocumentBlock_GetTypedCorrespondentList_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C2AEDDA0335_49539DBA029Dexec_var*
//#UC END# *4C2AEDDA0335_49539DBA029Dexec_var*
begin
//#UC START# *4C2AEDDA0335_49539DBA029Dexec_impl*
 Assert(false, '��� ����������� ��������');
//#UC END# *4C2AEDDA0335_49539DBA029Dexec_impl*
end;//TExTextForm.DocumentBlock_GetTypedCorrespondentList_Execute

procedure TExTextForm.DocumentBlock_GetTypedRespondentList_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C2AEDE7028C_49539DBA029Dtest_var*
//#UC END# *4C2AEDE7028C_49539DBA029Dtest_var*
begin
//#UC START# *4C2AEDE7028C_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := false;
//#UC END# *4C2AEDE7028C_49539DBA029Dtest_impl*
end;//TExTextForm.DocumentBlock_GetTypedRespondentList_Test

procedure TExTextForm.DocumentBlock_GetTypedRespondentList_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C2AEDE7028C_49539DBA029Dexec_var*
//#UC END# *4C2AEDE7028C_49539DBA029Dexec_var*
begin
//#UC START# *4C2AEDE7028C_49539DBA029Dexec_impl*
 Assert(false, '��� ����������� ��������');
//#UC END# *4C2AEDE7028C_49539DBA029Dexec_impl*
end;//TExTextForm.DocumentBlock_GetTypedRespondentList_Execute

procedure TExTextForm.Document_GetAnnotationDocFrmAct_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3AA77E00A3_49539DBA029Dtest_var*
//#UC END# *4C3AA77E00A3_49539DBA029Dtest_var*
begin
//#UC START# *4C3AA77E00A3_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := defDataAdapter.Monitoring.IsExist and
  (ZoneType <> vcm_ztChild) and (Document <> nil) and
  Assigned(dsDocument) and DocumentSet.HasAnnotation
//#UC END# *4C3AA77E00A3_49539DBA029Dtest_impl*
end;//TExTextForm.Document_GetAnnotationDocFrmAct_Test

procedure TExTextForm.Document_GetAnnotationDocFrmAct_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3AA77E00A3_49539DBA029Dexec_var*
//#UC END# *4C3AA77E00A3_49539DBA029Dexec_var*
begin
//#UC START# *4C3AA77E00A3_49539DBA029Dexec_impl*
 // - ������ �� ������, �.�. ��� FormActivate
//#UC END# *4C3AA77E00A3_49539DBA029Dexec_impl*
end;//TExTextForm.Document_GetAnnotationDocFrmAct_Execute

procedure TExTextForm.Document_SimilarDocuments_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3AA78E024D_49539DBA029Dtest_var*
//#UC END# *4C3AA78E024D_49539DBA029Dtest_var*
begin
//#UC START# *4C3AA78E024D_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := (dsDocument <> nil) and dsDocument.HasSimilarDocuments;
//#UC END# *4C3AA78E024D_49539DBA029Dtest_impl*
end;//TExTextForm.Document_SimilarDocuments_Test

procedure TExTextForm.Document_SimilarDocuments_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3AA78E024D_49539DBA029Dexec_var*
//#UC END# *4C3AA78E024D_49539DBA029Dexec_var*
begin
//#UC START# *4C3AA78E024D_49539DBA029Dexec_impl*
 if (dsDocument <> nil) then
  dsDocument.OpenSimilarDocuments;
//#UC END# *4C3AA78E024D_49539DBA029Dexec_impl*
end;//TExTextForm.Document_SimilarDocuments_Execute

procedure TExTextForm.DocumentBlockHeader_UserCR1_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3ADF860163_49539DBA029Dtest_var*
//#UC END# *4C3ADF860163_49539DBA029Dtest_var*
begin
//#UC START# *4C3ADF860163_49539DBA029Dtest_impl*
 DisableOperation(aParams);
//#UC END# *4C3ADF860163_49539DBA029Dtest_impl*
end;//TExTextForm.DocumentBlockHeader_UserCR1_Test

procedure TExTextForm.DocumentBlockHeader_UserCR1_GetState(var State: TvcmOperationStateIndex);
//#UC START# *4C3ADF860163_49539DBA029Dgetstate_var*
//#UC END# *4C3ADF860163_49539DBA029Dgetstate_var*
begin
//#UC START# *4C3ADF860163_49539DBA029Dgetstate_impl*
 if (dsDocument <> nil) then
 begin
  if (DocumentSet.UserCRListInfo[ulFirst].ListType = crtCorrespondents) then
   State := st_user_DocumentBlockHeader_UserCR1_Corr
  else
   State := vcm_DefaultOperationState;
 end//dsDocument <> nil
 else
  State := vcm_DefaultOperationState;
//#UC END# *4C3ADF860163_49539DBA029Dgetstate_impl*
end;//TExTextForm.DocumentBlockHeader_UserCR1_GetState

procedure TExTextForm.DocumentBlockHeader_UserCR1_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3ADF860163_49539DBA029Dexec_var*
//#UC END# *4C3ADF860163_49539DBA029Dexec_var*
begin
//#UC START# *4C3ADF860163_49539DBA029Dexec_impl*
 Assert(false, '��� ����������� ��������');
//#UC END# *4C3ADF860163_49539DBA029Dexec_impl*
end;//TExTextForm.DocumentBlockHeader_UserCR1_Execute

procedure TExTextForm.DocumentBlockHeader_UserCR2_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3ADF950028_49539DBA029Dtest_var*
//#UC END# *4C3ADF950028_49539DBA029Dtest_var*
begin
//#UC START# *4C3ADF950028_49539DBA029Dtest_impl*
 DisableOperation(aParams);
//#UC END# *4C3ADF950028_49539DBA029Dtest_impl*
end;//TExTextForm.DocumentBlockHeader_UserCR2_Test

procedure TExTextForm.DocumentBlockHeader_UserCR2_GetState(var State: TvcmOperationStateIndex);
//#UC START# *4C3ADF950028_49539DBA029Dgetstate_var*
//#UC END# *4C3ADF950028_49539DBA029Dgetstate_var*
begin
//#UC START# *4C3ADF950028_49539DBA029Dgetstate_impl*
 if (dsDocument <> nil) then
 begin
  if (DocumentSet.UserCRListInfo[ulSecond].ListType = crtCorrespondents) then
   State := st_user_DocumentBlockHeader_UserCR2_Corr
  else
   State := vcm_DefaultOperationState;
 end//dsDocument <> nil
 else
  State := vcm_DefaultOperationState;
//#UC END# *4C3ADF950028_49539DBA029Dgetstate_impl*
end;//TExTextForm.DocumentBlockHeader_UserCR2_GetState

procedure TExTextForm.DocumentBlockHeader_UserCR2_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3ADF950028_49539DBA029Dexec_var*
//#UC END# *4C3ADF950028_49539DBA029Dexec_var*
begin
//#UC START# *4C3ADF950028_49539DBA029Dexec_impl*
 Assert(false, '��� ����������� ��������');
//#UC END# *4C3ADF950028_49539DBA029Dexec_impl*
end;//TExTextForm.DocumentBlockHeader_UserCR2_Execute

procedure TExTextForm.DocumentBlockHeader_GetTypedCorrespondentList_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3ADFA5018F_49539DBA029Dtest_var*
//#UC END# *4C3ADFA5018F_49539DBA029Dtest_var*
begin
//#UC START# *4C3ADFA5018F_49539DBA029Dtest_impl*
 DisableOperation(aParams);
//#UC END# *4C3ADFA5018F_49539DBA029Dtest_impl*
end;//TExTextForm.DocumentBlockHeader_GetTypedCorrespondentList_Test

procedure TExTextForm.DocumentBlockHeader_GetTypedCorrespondentList_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3ADFA5018F_49539DBA029Dexec_var*
//#UC END# *4C3ADFA5018F_49539DBA029Dexec_var*
begin
//#UC START# *4C3ADFA5018F_49539DBA029Dexec_impl*
 Assert(false, '��� ����������� ��������');
//#UC END# *4C3ADFA5018F_49539DBA029Dexec_impl*
end;//TExTextForm.DocumentBlockHeader_GetTypedCorrespondentList_Execute

procedure TExTextForm.Redactions_PrevRedaction_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3AE0950253_49539DBA029Dtest_var*
//#UC END# *4C3AE0950253_49539DBA029Dtest_var*
begin
//#UC START# *4C3AE0950253_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := (ViewArea <> nil) and ViewArea.HasPrevRedaction;
//#UC END# *4C3AE0950253_49539DBA029Dtest_impl*
end;//TExTextForm.Redactions_PrevRedaction_Test

procedure TExTextForm.Redactions_PrevRedaction_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3AE0950253_49539DBA029Dexec_var*
//#UC END# *4C3AE0950253_49539DBA029Dexec_var*
begin
//#UC START# *4C3AE0950253_49539DBA029Dexec_impl*
 // ��������� ���������� ��������
 ReloadRedaction(crtPrevious);
//#UC END# *4C3AE0950253_49539DBA029Dexec_impl*
end;//TExTextForm.Redactions_PrevRedaction_Execute

procedure TExTextForm.Redactions_NextRedaction_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3AE0CD0079_49539DBA029Dtest_var*
//#UC END# *4C3AE0CD0079_49539DBA029Dtest_var*
begin
//#UC START# *4C3AE0CD0079_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := (ViewArea <> nil) and
  ViewArea.HasNextRedaction;
//#UC END# *4C3AE0CD0079_49539DBA029Dtest_impl*
end;//TExTextForm.Redactions_NextRedaction_Test

procedure TExTextForm.Redactions_NextRedaction_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3AE0CD0079_49539DBA029Dexec_var*
//#UC END# *4C3AE0CD0079_49539DBA029Dexec_var*
begin
//#UC START# *4C3AE0CD0079_49539DBA029Dexec_impl*
 // ��������� ��������� ��������
 ReloadRedaction(crtNext);
//#UC END# *4C3AE0CD0079_49539DBA029Dexec_impl*
end;//TExTextForm.Redactions_NextRedaction_Execute

procedure TExTextForm.Text_AddToControl_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3AFAD90234_49539DBA029Dtest_var*
//#UC END# *4C3AFAD90234_49539DBA029Dtest_var*
begin
//#UC START# *4C3AFAD90234_49539DBA029Dtest_impl*
 Document_AddToControl_Test(aParams);
//#UC END# *4C3AFAD90234_49539DBA029Dtest_impl*
end;//TExTextForm.Text_AddToControl_Test

procedure TExTextForm.Text_AddToControl_GetState(var State: TvcmOperationStateIndex);
//#UC START# *4C3AFAD90234_49539DBA029Dgetstate_var*
var
 l_Controllable : IControllable;
//#UC END# *4C3AFAD90234_49539DBA029Dgetstate_var*
begin
//#UC START# *4C3AFAD90234_49539DBA029Dgetstate_impl*
 if Supports(Document, IControllable, l_Controllable) then
  try
   if l_Controllable.GetControlled then
    State := st_user_Text_AddToControl_RemoveFromControl
   else
    State := vcm_DefaultOperationState;
  finally
   l_Controllable := nil;
  end;//try..finally
//#UC END# *4C3AFAD90234_49539DBA029Dgetstate_impl*
end;//TExTextForm.Text_AddToControl_GetState

procedure TExTextForm.Text_AddToControl_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3AFAD90234_49539DBA029Dexec_var*
//#UC END# *4C3AFAD90234_49539DBA029Dexec_var*
begin
//#UC START# *4C3AFAD90234_49539DBA029Dexec_impl*
 Document_AddToControl_Execute(aParams);
//#UC END# *4C3AFAD90234_49539DBA029Dexec_impl*
end;//TExTextForm.Text_AddToControl_Execute

procedure TExTextForm.Selection_ShowCorrespondentListToPart_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3AFB450234_49539DBA029Dtest_var*
//#UC END# *4C3AFB450234_49539DBA029Dtest_var*
begin
//#UC START# *4C3AFB450234_49539DBA029Dtest_impl*
 CRToPartTest(aParams, crtCorrespondents);
//#UC END# *4C3AFB450234_49539DBA029Dtest_impl*
end;//TExTextForm.Selection_ShowCorrespondentListToPart_Test

procedure TExTextForm.Selection_ShowCorrespondentListToPart_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3AFB450234_49539DBA029Dexec_var*
//#UC END# *4C3AFB450234_49539DBA029Dexec_var*
begin
//#UC START# *4C3AFB450234_49539DBA029Dexec_impl*
 CRToPartExecute(aParams, crtCorrespondents);
//#UC END# *4C3AFB450234_49539DBA029Dexec_impl*
end;//TExTextForm.Selection_ShowCorrespondentListToPart_Execute

procedure TExTextForm.Selection_ShowRespondentListToPart_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3AFB51020D_49539DBA029Dtest_var*
//#UC END# *4C3AFB51020D_49539DBA029Dtest_var*
begin
//#UC START# *4C3AFB51020D_49539DBA029Dtest_impl*
 CRToPartTest(aParams, crtRespondents);
//#UC END# *4C3AFB51020D_49539DBA029Dtest_impl*
end;//TExTextForm.Selection_ShowRespondentListToPart_Test

procedure TExTextForm.Selection_ShowRespondentListToPart_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3AFB51020D_49539DBA029Dexec_var*
//#UC END# *4C3AFB51020D_49539DBA029Dexec_var*
begin
//#UC START# *4C3AFB51020D_49539DBA029Dexec_impl*
 CRToPartExecute(aParams, crtRespondents);
//#UC END# *4C3AFB51020D_49539DBA029Dexec_impl*
end;//TExTextForm.Selection_ShowRespondentListToPart_Execute

procedure TExTextForm.WarnOnControl_ClearStatusSettings_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3AFBA702E4_49539DBA029Dtest_var*
var
 l_Strings : IvcmStrings;
 l_StringsSource: InsStringsSource;
//#UC END# *4C3AFBA702E4_49539DBA029Dtest_var*
begin
//#UC START# *4C3AFBA702E4_49539DBA029Dtest_impl*
 l_Strings := aParams.Op.SubItems;
 if (l_Strings = nil) then
  Exit;
 if (l_Strings.Count = 0) and
  Supports(f_ControlMap, InsStringsSource, l_StringsSource) then
 try
  l_StringsSource.FillStrings(l_Strings);
 finally
  l_StringsSource := nil;
 end;//try..finally
 aParams.Op.SelectedString := f_ControlMap.
  ValueToDisplayName(afw.Settings.LoadString(pi_DropChangeStatus, dv_DropChangeStatus));
//#UC END# *4C3AFBA702E4_49539DBA029Dtest_impl*
end;//TExTextForm.WarnOnControl_ClearStatusSettings_Test

procedure TExTextForm.WarnOnControl_ClearStatusSettings_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3AFBA702E4_49539DBA029Dexec_var*
var l_Str: Il3CString;
//#UC END# *4C3AFBA702E4_49539DBA029Dexec_var*
begin
//#UC START# *4C3AFBA702E4_49539DBA029Dexec_impl*
 l_Str := f_ControlMap.DisplayNameToValue(aParams.SelectedString);
 if not l3Same(afw.Settings.LoadString(pi_DropChangeStatus, dv_DropChangeStatus), l_Str) then
 begin
  afw.Settings.SaveString(pi_DropChangeStatus, l_Str);
  CheckControllableState([dcsAfterReview, dcsExitFromSystem]);
 end;//if GetString(pi_DropChangeStatus,
//#UC END# *4C3AFBA702E4_49539DBA029Dexec_impl*
end;//TExTextForm.WarnOnControl_ClearStatusSettings_Execute

procedure TExTextForm.TasksPanel_TimeMachineOnOff_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3AFC1302FF_49539DBA029Dtest_var*
//#UC END# *4C3AFC1302FF_49539DBA029Dtest_var*
begin
//#UC START# *4C3AFC1302FF_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := Assigned(Document) and
  (not Document.GetNotTm or DefDataAdapter.TimeMachine.IsOn);
//#UC END# *4C3AFC1302FF_49539DBA029Dtest_impl*
end;//TExTextForm.TasksPanel_TimeMachineOnOff_Test

procedure TExTextForm.TasksPanel_TimeMachineOnOff_GetState(var State: TvcmOperationStateIndex);
//#UC START# *4C3AFC1302FF_49539DBA029Dgetstate_var*
//#UC END# *4C3AFC1302FF_49539DBA029Dgetstate_var*
begin
//#UC START# *4C3AFC1302FF_49539DBA029Dgetstate_impl*
 if DefDataAdapter.TimeMachine.IsOn then
  State := st_user_TasksPanel_TimeMachineOnOff_Off
 else
  State := st_user_TasksPanel_TimeMachineOnOff_On;
//#UC END# *4C3AFC1302FF_49539DBA029Dgetstate_impl*
end;//TExTextForm.TasksPanel_TimeMachineOnOff_GetState

procedure TExTextForm.TasksPanel_TimeMachineOnOff_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3AFC1302FF_49539DBA029Dexec_var*
var
 l_Date: Il3CString;
//#UC END# *4C3AFC1302FF_49539DBA029Dexec_var*
begin
//#UC START# *4C3AFC1302FF_49539DBA029Dexec_impl*
 if DefDataAdapter.TimeMachine.IsOn then
  TimeMachineOnOff
 else
 begin
  l_Date := vcmSelectDate(l3CStr(vcmConstString(
   str_CalendarCaptionTimeMachineOn)), nil);
  if not l3IsNil(l_Date) then
   TurnOnTimeMachine(l_Date);
 end;//if DefDataAdapter.TimeMachine.IsOn then
//#UC END# *4C3AFC1302FF_49539DBA029Dexec_impl*
end;//TExTextForm.TasksPanel_TimeMachineOnOff_Execute

procedure TExTextForm.DocumentBlockHeader_AddBookmark_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3B17DC02C4_49539DBA029Dtest_var*
//#UC END# *4C3B17DC02C4_49539DBA029Dtest_var*
begin
//#UC START# *4C3B17DC02C4_49539DBA029Dtest_impl*
 DisableOperation(aParams);
//#UC END# *4C3B17DC02C4_49539DBA029Dtest_impl*
end;//TExTextForm.DocumentBlockHeader_AddBookmark_Test

procedure TExTextForm.DocumentBlockHeader_AddBookmark_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3B17DC02C4_49539DBA029Dexec_var*
//#UC END# *4C3B17DC02C4_49539DBA029Dexec_var*
begin
//#UC START# *4C3B17DC02C4_49539DBA029Dexec_impl*
 Assert(false, '��� ����������� ��������');
//#UC END# *4C3B17DC02C4_49539DBA029Dexec_impl*
end;//TExTextForm.DocumentBlockHeader_AddBookmark_Execute

procedure TExTextForm.DocumentBlockHeader_ToMSWord_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3B17ED0192_49539DBA029Dtest_var*
//#UC END# *4C3B17ED0192_49539DBA029Dtest_var*
begin
//#UC START# *4C3B17ED0192_49539DBA029Dtest_impl*
 DisableOperation(aParams);
//#UC END# *4C3B17ED0192_49539DBA029Dtest_impl*
end;//TExTextForm.DocumentBlockHeader_ToMSWord_Test

procedure TExTextForm.DocumentBlockHeader_ToMSWord_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3B17ED0192_49539DBA029Dexec_var*
//#UC END# *4C3B17ED0192_49539DBA029Dexec_var*
begin
//#UC START# *4C3B17ED0192_49539DBA029Dexec_impl*
 Assert(false, '��� ����������� ��������');
//#UC END# *4C3B17ED0192_49539DBA029Dexec_impl*
end;//TExTextForm.DocumentBlockHeader_ToMSWord_Execute

procedure TExTextForm.DocumentBlockHeader_Print_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3B17FF03D2_49539DBA029Dtest_var*
//#UC END# *4C3B17FF03D2_49539DBA029Dtest_var*
begin
//#UC START# *4C3B17FF03D2_49539DBA029Dtest_impl*
 DisableOperation(aParams);
//#UC END# *4C3B17FF03D2_49539DBA029Dtest_impl*
end;//TExTextForm.DocumentBlockHeader_Print_Test

procedure TExTextForm.DocumentBlockHeader_Print_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3B17FF03D2_49539DBA029Dexec_var*
//#UC END# *4C3B17FF03D2_49539DBA029Dexec_var*
begin
//#UC START# *4C3B17FF03D2_49539DBA029Dexec_impl*
 Assert(false, '��� ����������� ��������');
//#UC END# *4C3B17FF03D2_49539DBA029Dexec_impl*
end;//TExTextForm.DocumentBlockHeader_Print_Execute

procedure TExTextForm.DocumentBlockHeader_PrintDialog_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3B180E038F_49539DBA029Dtest_var*
//#UC END# *4C3B180E038F_49539DBA029Dtest_var*
begin
//#UC START# *4C3B180E038F_49539DBA029Dtest_impl*
 DisableOperation(aParams);
//#UC END# *4C3B180E038F_49539DBA029Dtest_impl*
end;//TExTextForm.DocumentBlockHeader_PrintDialog_Test

procedure TExTextForm.DocumentBlockHeader_PrintDialog_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3B180E038F_49539DBA029Dexec_var*
//#UC END# *4C3B180E038F_49539DBA029Dexec_var*
begin
//#UC START# *4C3B180E038F_49539DBA029Dexec_impl*
 Assert(false, '��� ����������� ��������');
//#UC END# *4C3B180E038F_49539DBA029Dexec_impl*
end;//TExTextForm.DocumentBlockHeader_PrintDialog_Execute

procedure TExTextForm.DocumentBlockBookmarks_AddBookmark_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3B1AEA0127_49539DBA029Dtest_var*
//#UC END# *4C3B1AEA0127_49539DBA029Dtest_var*
begin
//#UC START# *4C3B1AEA0127_49539DBA029Dtest_impl*
 DisableOperation(aParams);
//#UC END# *4C3B1AEA0127_49539DBA029Dtest_impl*
end;//TExTextForm.DocumentBlockBookmarks_AddBookmark_Test

procedure TExTextForm.DocumentBlockBookmarks_AddBookmark_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3B1AEA0127_49539DBA029Dexec_var*
var
 l_eeSub: IeeSub;
//#UC END# *4C3B1AEA0127_49539DBA029Dexec_var*
begin
//#UC START# *4C3B1AEA0127_49539DBA029Dexec_impl*
 if (Document <> nil) and
    Supports(aParams.Target, IeeSub, l_eeSub) and
    (l_eeSub.LayerID = ev_sbtSub) then
 begin
  AddBookmark(l_eeSub.LeafPara);
  TnsUseDocumentSubPanelOperationEvent.Instance.Log;
 end;//Document <> nil..
//#UC END# *4C3B1AEA0127_49539DBA029Dexec_impl*
end;//TExTextForm.DocumentBlockBookmarks_AddBookmark_Execute

procedure TExTextForm.DocumentBlock_ToMSWord_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3B1AFB0270_49539DBA029Dtest_var*
//#UC END# *4C3B1AFB0270_49539DBA029Dtest_var*
begin
//#UC START# *4C3B1AFB0270_49539DBA029Dtest_impl*
 DisableOperation(aParams);
//#UC END# *4C3B1AFB0270_49539DBA029Dtest_impl*
end;//TExTextForm.DocumentBlock_ToMSWord_Test

procedure TExTextForm.DocumentBlock_ToMSWord_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3B1AFB0270_49539DBA029Dexec_var*
//#UC END# *4C3B1AFB0270_49539DBA029Dexec_var*
begin
//#UC START# *4C3B1AFB0270_49539DBA029Dexec_impl*
 Assert(false, '��� ����������� ��������');
//#UC END# *4C3B1AFB0270_49539DBA029Dexec_impl*
end;//TExTextForm.DocumentBlock_ToMSWord_Execute

procedure TExTextForm.DocumentBlock_PrintDialog_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3B1B0F0237_49539DBA029Dtest_var*
//#UC END# *4C3B1B0F0237_49539DBA029Dtest_var*
begin
//#UC START# *4C3B1B0F0237_49539DBA029Dtest_impl*
 DisableOperation(aParams);
//#UC END# *4C3B1B0F0237_49539DBA029Dtest_impl*
end;//TExTextForm.DocumentBlock_PrintDialog_Test

procedure TExTextForm.DocumentBlock_PrintDialog_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3B1B0F0237_49539DBA029Dexec_var*
//#UC END# *4C3B1B0F0237_49539DBA029Dexec_var*
begin
//#UC START# *4C3B1B0F0237_49539DBA029Dexec_impl*
 Assert(false, '��� ����������� ��������');
//#UC END# *4C3B1B0F0237_49539DBA029Dexec_impl*
end;//TExTextForm.DocumentBlock_PrintDialog_Execute

procedure TExTextForm.DocumentBlock_Copy_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3B1B1D003C_49539DBA029Dtest_var*
//#UC END# *4C3B1B1D003C_49539DBA029Dtest_var*
begin
//#UC START# *4C3B1B1D003C_49539DBA029Dtest_impl*
 DisableOperation(aParams);
//#UC END# *4C3B1B1D003C_49539DBA029Dtest_impl*
end;//TExTextForm.DocumentBlock_Copy_Test

procedure TExTextForm.DocumentBlock_Copy_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3B1B1D003C_49539DBA029Dexec_var*
//#UC END# *4C3B1B1D003C_49539DBA029Dexec_var*
begin
//#UC START# *4C3B1B1D003C_49539DBA029Dexec_impl*
 Assert(false, '��� ����������� ��������');
//#UC END# *4C3B1B1D003C_49539DBA029Dexec_impl*
end;//TExTextForm.DocumentBlock_Copy_Execute

procedure TExTextForm.DocumentBlock_Print_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3B241401AA_49539DBA029Dtest_var*
//#UC END# *4C3B241401AA_49539DBA029Dtest_var*
begin
//#UC START# *4C3B241401AA_49539DBA029Dtest_impl*
 DisableOperation(aParams);
//#UC END# *4C3B241401AA_49539DBA029Dtest_impl*
end;//TExTextForm.DocumentBlock_Print_Test

procedure TExTextForm.DocumentBlock_Print_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3B241401AA_49539DBA029Dexec_var*
//#UC END# *4C3B241401AA_49539DBA029Dexec_var*
begin
//#UC START# *4C3B241401AA_49539DBA029Dexec_impl*
 Assert(false, '�� ����������');
//#UC END# *4C3B241401AA_49539DBA029Dexec_impl*
end;//TExTextForm.DocumentBlock_Print_Execute

procedure TExTextForm.Document_OpenContentsFrmAct_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3B3754034D_49539DBA029Dtest_var*
//#UC END# *4C3B3754034D_49539DBA029Dtest_var*
begin
//#UC START# *4C3B3754034D_49539DBA029Dtest_impl*
 if Assigned(Aggregate) then
 begin
  // ���� �� � ��������� ����������
  if (DocumentWithContents <> nil) then
  begin
   aParams.Op.Flag[vcm_ofEnabled] := (DocumentWithContents.dsContents <> nil)
                                     and not DocumentWithContents.dsContents.Empty
   // begin - http://mdp.garant.ru/pages/viewpage.action?pageId=342331306
                                     or (Text.TextSource.ContentsTree <> nil) and (Text.TextSource.ContentsTree.CountView > 0);
   // end - http://mdp.garant.ru/pages/viewpage.action?pageId=342331306
   if aParams.Op.Flag[vcm_ofEnabled] then
    if Op_Contents_IsContentsVisible.Call(Aggregate) then
     aParams.Op.Flag[vcm_ofChecked] := true;
  end//DocumentWithContents <> nil
  else
   aParams.Op.Flag[vcm_ofEnabled] := false;
 end;//Assigned(Aggregate)
//#UC END# *4C3B3754034D_49539DBA029Dtest_impl*
end;//TExTextForm.Document_OpenContentsFrmAct_Test

procedure TExTextForm.Document_OpenContentsFrmAct_GetState(var State: TvcmOperationStateIndex);
//#UC START# *4C3B3754034D_49539DBA029Dgetstate_var*
//#UC END# *4C3B3754034D_49539DBA029Dgetstate_var*
begin
//#UC START# *4C3B3754034D_49539DBA029Dgetstate_impl*
 if (UserType = dftDrug) then
  State := st_user_Document_OpenContentsFrmAct_Drug
 else
  State := vcm_DefaultOperationState;
//#UC END# *4C3B3754034D_49539DBA029Dgetstate_impl*
end;//TExTextForm.Document_OpenContentsFrmAct_GetState

procedure TExTextForm.Document_OpenContentsFrmAct_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3B3754034D_49539DBA029Dexec_var*
//#UC END# *4C3B3754034D_49539DBA029Dexec_var*
begin
//#UC START# *4C3B3754034D_49539DBA029Dexec_impl*
 if not Op_Contents_ToggleContentsVisibility.Call(Aggregate) then
  OpenContents(ns_comForce);
//#UC END# *4C3B3754034D_49539DBA029Dexec_impl*
end;//TExTextForm.Document_OpenContentsFrmAct_Execute

procedure TExTextForm.Document_ShowDocumentPicture_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3B3792000E_49539DBA029Dtest_var*
//#UC END# *4C3B3792000E_49539DBA029Dtest_var*
begin
//#UC START# *4C3B3792000E_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := afw.Application.IsInternal;
//#UC END# *4C3B3792000E_49539DBA029Dtest_impl*
end;//TExTextForm.Document_ShowDocumentPicture_Test

procedure TExTextForm.Document_ShowDocumentPicture_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3B3792000E_49539DBA029Dexec_var*
//#UC END# *4C3B3792000E_49539DBA029Dexec_var*
begin
//#UC START# *4C3B3792000E_49539DBA029Dexec_impl*
 if afw.Application.IsInternal then
  try
   DefDataAdapter.CommonInterfaces.ShowPicturesOnNumber(Document.GetInternalId);
  except
   on EWorkingParamsNotFound do
    Say(err_ShowPictureInvalidParams);
   on EExternalApplicationError do ;
  end;
//#UC END# *4C3B3792000E_49539DBA029Dexec_impl*
end;//TExTextForm.Document_ShowDocumentPicture_Execute

procedure TExTextForm.ExternalObject_Open_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3B49DB03BC_49539DBA029Dtest_var*
//#UC END# *4C3B49DB03BC_49539DBA029Dtest_var*
begin
//#UC START# *4C3B49DB03BC_49539DBA029Dtest_impl*
 DisableOperation(aParams);
//#UC END# *4C3B49DB03BC_49539DBA029Dtest_impl*
end;//TExTextForm.ExternalObject_Open_Test

procedure TExTextForm.ExternalObject_Open_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3B49DB03BC_49539DBA029Dexec_var*
//#UC END# *4C3B49DB03BC_49539DBA029Dexec_var*
begin
//#UC START# *4C3B49DB03BC_49539DBA029Dexec_impl*
 Assert(false, '��� ����������� ��������');
//#UC END# *4C3B49DB03BC_49539DBA029Dexec_impl*
end;//TExTextForm.ExternalObject_Open_Execute

procedure TExTextForm.ExternalObject_Save_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3B49EA00C4_49539DBA029Dtest_var*
//#UC END# *4C3B49EA00C4_49539DBA029Dtest_var*
begin
//#UC START# *4C3B49EA00C4_49539DBA029Dtest_impl*
 DisableOperation(aParams);
//#UC END# *4C3B49EA00C4_49539DBA029Dtest_impl*
end;//TExTextForm.ExternalObject_Save_Test

procedure TExTextForm.ExternalObject_Save_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3B49EA00C4_49539DBA029Dexec_var*
//#UC END# *4C3B49EA00C4_49539DBA029Dexec_var*
begin
//#UC START# *4C3B49EA00C4_49539DBA029Dexec_impl*
 Assert(false, '��� ����������� ��������');
//#UC END# *4C3B49EA00C4_49539DBA029Dexec_impl*
end;//TExTextForm.ExternalObject_Save_Execute

procedure TExTextForm.WarnRedaction_OpenActualRedaction_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3B4A7D029B_49539DBA029Dtest_var*
//#UC END# *4C3B4A7D029B_49539DBA029Dtest_var*
begin
//#UC START# *4C3B4A7D029B_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := FormIsMainInDocumentSet;
//#UC END# *4C3B4A7D029B_49539DBA029Dtest_impl*
end;//TExTextForm.WarnRedaction_OpenActualRedaction_Test

procedure TExTextForm.WarnRedaction_OpenActualRedaction_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3B4A7D029B_49539DBA029Dexec_var*
//#UC END# *4C3B4A7D029B_49539DBA029Dexec_var*
begin
//#UC START# *4C3B4A7D029B_49539DBA029Dexec_impl*
 if Assigned(ViewArea) and
    not TdmStdRes.IsCurEditionActual(ViewArea.DocInfo.Doc) then
  SetActualRedaction;
//#UC END# *4C3B4A7D029B_49539DBA029Dexec_impl*
end;//TExTextForm.WarnRedaction_OpenActualRedaction_Execute

procedure TExTextForm.WarnTimeMachine_ShowInfo_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3B500B0126_49539DBA029Dtest_var*
//#UC END# *4C3B500B0126_49539DBA029Dtest_var*
begin
//#UC START# *4C3B500B0126_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofVisible] := Assigned(dsDocument) and
  Assigned(DocumentSet) and
  DocumentSet.HasTimeMachineWarning;
//#UC END# *4C3B500B0126_49539DBA029Dtest_impl*
end;//TExTextForm.WarnTimeMachine_ShowInfo_Test

procedure TExTextForm.WarnTimeMachine_ShowInfo_GetState(var State: TvcmOperationStateIndex);
//#UC START# *4C3B500B0126_49539DBA029Dgetstate_var*
var l_Form: IvcmEntityForm;
//#UC END# *4C3B500B0126_49539DBA029Dgetstate_var*
begin
//#UC START# *4C3B500B0126_49539DBA029Dgetstate_impl*
 if Assigned(Aggregate) and Aggregate.HasForm(fm_WarningForm.rFormID, @l_Form) and
  l_Form.IsActiveInParent then
  State := st_user_WarnTimeMachine_ShowInfo_Hide
 else
  State := vcm_DefaultOperationState;
//#UC END# *4C3B500B0126_49539DBA029Dgetstate_impl*
end;//TExTextForm.WarnTimeMachine_ShowInfo_GetState

procedure TExTextForm.WarnTimeMachine_ShowInfo_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3B500B0126_49539DBA029Dexec_var*
//#UC END# *4C3B500B0126_49539DBA029Dexec_var*
begin
//#UC START# *4C3B500B0126_49539DBA029Dexec_impl*
 ShowWarningPage(true{false{True}, cTimeMachineWarningSub);
              // ^ - ������� ������ ���������, ���� �������� � ������
              // http://mdp.garant.ru/pages/viewpage.action?pageId=266898633&focusedCommentId=285508953#comment-285508953
              // � ��� � ���� "�����" - http://mdp.garant.ru/pages/viewpage.action?pageId=287219564
//#UC END# *4C3B500B0126_49539DBA029Dexec_impl*
end;//TExTextForm.WarnTimeMachine_ShowInfo_Execute

procedure TExTextForm.WarnTimeMachine_TimeMachineOnOffNew_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3B504A0202_49539DBA029Dtest_var*
//#UC END# *4C3B504A0202_49539DBA029Dtest_var*
begin
//#UC START# *4C3B504A0202_49539DBA029Dtest_impl*
 // - ������ �� ������
//#UC END# *4C3B504A0202_49539DBA029Dtest_impl*
end;//TExTextForm.WarnTimeMachine_TimeMachineOnOffNew_Test

procedure TExTextForm.WarnTimeMachine_TimeMachineOnOffNew_GetState(var State: TvcmOperationStateIndex);
//#UC START# *4C3B504A0202_49539DBA029Dgetstate_var*
//#UC END# *4C3B504A0202_49539DBA029Dgetstate_var*
begin
//#UC START# *4C3B504A0202_49539DBA029Dgetstate_impl*
 TimeMachine_TimeMachineOnOffNew_GetState(State);
//#UC END# *4C3B504A0202_49539DBA029Dgetstate_impl*
end;//TExTextForm.WarnTimeMachine_TimeMachineOnOffNew_GetState

procedure TExTextForm.WarnTimeMachine_TimeMachineOnOffNew_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3B504A0202_49539DBA029Dexec_var*
//#UC END# *4C3B504A0202_49539DBA029Dexec_var*
begin
//#UC START# *4C3B504A0202_49539DBA029Dexec_impl*
 TimeMachine_TimeMachineOnOffNew_Execute(aParams);
//#UC END# *4C3B504A0202_49539DBA029Dexec_impl*
end;//TExTextForm.WarnTimeMachine_TimeMachineOnOffNew_Execute

procedure TExTextForm.WarnJuror_ShowInfo_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3B52D6021F_49539DBA029Dtest_var*
//#UC END# *4C3B52D6021F_49539DBA029Dtest_var*
begin
//#UC START# *4C3B52D6021F_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := FormIsMainInDocumentSet;
//#UC END# *4C3B52D6021F_49539DBA029Dtest_impl*
end;//TExTextForm.WarnJuror_ShowInfo_Test

procedure TExTextForm.WarnJuror_ShowInfo_GetState(var State: TvcmOperationStateIndex);
//#UC START# *4C3B52D6021F_49539DBA029Dgetstate_var*
var l_Form: IvcmEntityForm;
//#UC END# *4C3B52D6021F_49539DBA029Dgetstate_var*
begin
//#UC START# *4C3B52D6021F_49539DBA029Dgetstate_impl*
 if Assigned(Aggregate) and Aggregate.HasForm(fm_WarningForm.rFormID, @l_Form) and
  l_Form.IsActiveInParent then
  State := st_user_WarnJuror_ShowInfo_Hide
 else
  State := vcm_DefaultOperationState;
//#UC END# *4C3B52D6021F_49539DBA029Dgetstate_impl*
end;//TExTextForm.WarnJuror_ShowInfo_GetState

procedure TExTextForm.WarnJuror_ShowInfo_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3B52D6021F_49539DBA029Dexec_var*
//#UC END# *4C3B52D6021F_49539DBA029Dexec_var*
begin
//#UC START# *4C3B52D6021F_49539DBA029Dexec_impl*
 ShowWarningPage(true{false{True}, cSimpleWarningSub);
              // ^ - ������� ������ ���������, ���� �������� � ������
              // http://mdp.garant.ru/pages/viewpage.action?pageId=266898633&focusedCommentId=285508953#comment-285508953
              // � ��� � ���� "�����" - http://mdp.garant.ru/pages/viewpage.action?pageId=287219564
//#UC END# *4C3B52D6021F_49539DBA029Dexec_impl*
end;//TExTextForm.WarnJuror_ShowInfo_Execute

procedure TExTextForm.WarnOnControl_ShowChanges_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3B5337022E_49539DBA029Dtest_var*
var
 l_Controllable : IControllable;
//#UC END# *4C3B5337022E_49539DBA029Dtest_var*
begin
//#UC START# *4C3B5337022E_49539DBA029Dtest_impl*
 Document_CompareEditions_Test(aParams);
 if aParams.Op.Flag[vcm_ofEnabled] and
  Supports(Document, IControllable, l_Controllable) then
  aParams.Op.Flag[vcm_ofEnabled] := (l_Controllable.GetControlStatus and CS_CHANGED) = CS_CHANGED;
//#UC END# *4C3B5337022E_49539DBA029Dtest_impl*
end;//TExTextForm.WarnOnControl_ShowChanges_Test

procedure TExTextForm.WarnOnControl_ShowChanges_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3B5337022E_49539DBA029Dexec_var*
//#UC END# *4C3B5337022E_49539DBA029Dexec_var*
begin
//#UC START# *4C3B5337022E_49539DBA029Dexec_impl*
 Document_CompareEditions_Execute(aParams);
//#UC END# *4C3B5337022E_49539DBA029Dexec_impl*
end;//TExTextForm.WarnOnControl_ShowChanges_Execute

procedure TExTextForm.WarnOnControl_ClearStatus_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3B535F0064_49539DBA029Dtest_var*
//#UC END# *4C3B535F0064_49539DBA029Dtest_var*
begin
//#UC START# *4C3B535F0064_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofVisible] := (ucpUnderControl <> nil) and ucpUnderControl.HasControlStatus;
//#UC END# *4C3B535F0064_49539DBA029Dtest_impl*
end;//TExTextForm.WarnOnControl_ClearStatus_Test

procedure TExTextForm.WarnOnControl_ClearStatus_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3B535F0064_49539DBA029Dexec_var*
//#UC END# *4C3B535F0064_49539DBA029Dexec_var*
begin
//#UC START# *4C3B535F0064_49539DBA029Dexec_impl*
 if (ucpUnderControl <> nil) then
 begin
  ucpUnderControl.ClearControlStatus;
  UpdateUnderControlList;
 end;//ViewArea <> nil
//#UC END# *4C3B535F0064_49539DBA029Dexec_impl*
end;//TExTextForm.WarnOnControl_ClearStatus_Execute

procedure TExTextForm.UserCommentIcon_HideShow_GetState(var State: TvcmOperationStateIndex);
//#UC START# *4C3C71E4033D_49539DBA029Dgetstate_var*
var
 l_eeSub : IeeSub;
//#UC END# *4C3C71E4033D_49539DBA029Dgetstate_var*
begin
//#UC START# *4C3C71E4033D_49539DBA029Dgetstate_impl*
 with SubPanel.ScreenToClient(Mouse.CursorPos) do
  SubPanel.CheckSubOnPoint(X, Y, l_eeSub);
 if (l_eeSub <> nil) and
    (l_eeSub.LayerID = ev_sbtMark) then
 begin
  case l_eeSub.Flag of
   1 : if Text.ShowComments then
        State := st_user_UserCommentIcon_HideShow_GarantShown
       else
        State := st_user_UserCommentIcon_HideShow_GarantHidden;
   2 : if Text.ShowUserComments then
        State := st_user_UserCommentIcon_HideShow_UserShown
       else
        State := st_user_UserCommentIcon_HideShow_UserHidden;
   3 : if Text.ShowVersionComments then
        State := st_user_UserCommentIcon_HideShow_VersionShown
       else
        State := st_user_UserCommentIcon_HideShow_VersionHidden;
  end; // case l_eeSub.Flag
 end//Supports(aParams.Target, IeeSub, l_eeSub)
 else
  State := st_user_UserCommentIcon_HideShow_Invisible;
 l_eeSub := nil;
//#UC END# *4C3C71E4033D_49539DBA029Dgetstate_impl*
end;//TExTextForm.UserCommentIcon_HideShow_GetState

procedure TExTextForm.UserComment_Delete_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3C74C603B6_49539DBA029Dtest_var*
var
 l_EP : IeePara;
//#UC END# *4C3C74C603B6_49539DBA029Dtest_var*
begin
//#UC START# *4C3C74C603B6_49539DBA029Dtest_impl*
 l_EP := LeafParaUnderCursor;
 aParams.Op.Flag[vcm_ofEnabled] := (l_EP <> nil) AND l_EP.IsUserComment;
//#UC END# *4C3C74C603B6_49539DBA029Dtest_impl*
end;//TExTextForm.UserComment_Delete_Test

procedure TExTextForm.UserComment_Delete_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3C74C603B6_49539DBA029Dexec_var*
var
 l_EP : IeePara;
//#UC END# *4C3C74C603B6_49539DBA029Dexec_var*
begin
//#UC START# *4C3C74C603B6_49539DBA029Dexec_impl*
 l_EP := LeafParaUnderCursor;
 if l_EP.IsUserComment then
  if (l_EP.Block <> nil) then
   (l_EP.Block As IeePara).Delete;
//#UC END# *4C3C74C603B6_49539DBA029Dexec_impl*
end;//TExTextForm.UserComment_Delete_Execute

procedure TExTextForm.Text_AddUserComment_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3C75240091_49539DBA029Dtest_var*
//#UC END# *4C3C75240091_49539DBA029Dtest_var*
begin
//#UC START# *4C3C75240091_49539DBA029Dtest_impl*
 if (UserType in [dftAACRight, dftAACLeft, dftAACContentsRight, dftAACContentsLeft]) then
  aParams.Op.Flag[vcm_ofVisible] := False;
 if aParams.Op.Flag[vcm_ofEnabled] then
  aParams.Op.Flag[vcm_ofEnabled] := Text.CanUserModify AND (Document <> nil);
//#UC END# *4C3C75240091_49539DBA029Dtest_impl*
end;//TExTextForm.Text_AddUserComment_Test

procedure TExTextForm.Text_AddUserComment_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3C75240091_49539DBA029Dexec_var*
//#UC END# *4C3C75240091_49539DBA029Dexec_var*
begin
//#UC START# *4C3C75240091_49539DBA029Dexec_impl*
 Assert(false);
//#UC END# *4C3C75240091_49539DBA029Dexec_impl*
end;//TExTextForm.Text_AddUserComment_Execute

procedure TExTextForm.Document_GetGraphicImage_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3C77CC012A_49539DBA029Dtest_var*
//#UC END# *4C3C77CC012A_49539DBA029Dtest_var*
begin
//#UC START# *4C3C77CC012A_49539DBA029Dtest_impl*
 with aParams do
  Op.Flag[vcm_ofEnabled] := (Document <> nil) and Document.HasInternetImage;
//#UC END# *4C3C77CC012A_49539DBA029Dtest_impl*
end;//TExTextForm.Document_GetGraphicImage_Test

procedure TExTextForm.Document_GetGraphicImage_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3C77CC012A_49539DBA029Dexec_var*
var
 l_ExternalLink: IExternalLink;
//#UC END# *4C3C77CC012A_49539DBA029Dexec_var*
begin
//#UC START# *4C3C77CC012A_49539DBA029Dexec_impl*
(* if (aParams.Count >= 1) and Supports(aParams.AsIU[0], IExternalLink, l_ExternalLink) then
 else*)
  if (Document <> nil) and Document.HasInternetImage then
   Document.GetInternetImageUrl(0, l_ExternalLink);
 if (l_ExternalLink <> nil) then
  try
   nsExecuteExternalLink(l_ExternalLink);
  finally
   l_ExternalLink := nil;
  end;
//#UC END# *4C3C77CC012A_49539DBA029Dexec_impl*
end;//TExTextForm.Document_GetGraphicImage_Execute

procedure TExTextForm.Document_DocumentSynchroOpenWindow_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3EA65F0233_49539DBA029Dtest_var*
//#UC END# *4C3EA65F0233_49539DBA029Dtest_var*
begin
//#UC START# *4C3EA65F0233_49539DBA029Dtest_impl*
 if aParams.Op.Flag[vcm_ofEnabled] then
  aParams.Op.Flag[vcm_ofEnabled] := TextSource.HasDocument;
//#UC END# *4C3EA65F0233_49539DBA029Dtest_impl*
end;//TExTextForm.Document_DocumentSynchroOpenWindow_Test

procedure TExTextForm.Document_DocumentSynchroOpenWindow_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3EA65F0233_49539DBA029Dexec_var*
//#UC END# *4C3EA65F0233_49539DBA029Dexec_var*
begin
//#UC START# *4C3EA65F0233_49539DBA029Dexec_impl*
 if HasDoc then
  OpenInWindow(False);
//#UC END# *4C3EA65F0233_49539DBA029Dexec_impl*
end;//TExTextForm.Document_DocumentSynchroOpenWindow_Execute

procedure TExTextForm.Document_DocumentSynchroOpenNewWindow_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3EA671007A_49539DBA029Dtest_var*
//#UC END# *4C3EA671007A_49539DBA029Dtest_var*
begin
//#UC START# *4C3EA671007A_49539DBA029Dtest_impl*
 if aParams.Op.Flag[vcm_ofEnabled] then
  aParams.Op.Flag[vcm_ofEnabled] := TextSource.HasDocument;
//#UC END# *4C3EA671007A_49539DBA029Dtest_impl*
end;//TExTextForm.Document_DocumentSynchroOpenNewWindow_Test

procedure TExTextForm.Document_DocumentSynchroOpenNewWindow_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3EA671007A_49539DBA029Dexec_var*
//#UC END# *4C3EA671007A_49539DBA029Dexec_var*
begin
//#UC START# *4C3EA671007A_49539DBA029Dexec_impl*
 if HasDoc then
  OpenInWindow;
//#UC END# *4C3EA671007A_49539DBA029Dexec_impl*
end;//TExTextForm.Document_DocumentSynchroOpenNewWindow_Execute

procedure TExTextForm.Document_DictListOpenFrmAct_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3EA90300E1_49539DBA029Dtest_var*
var
 l_Form: IvcmEntityForm;
//#UC END# *4C3EA90300E1_49539DBA029Dtest_var*
begin
//#UC START# *4C3EA90300E1_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := False;
 if NativeMainForm.HasForm(fm_enDiction.rFormID, vcm_ztNavigator, True, @l_Form) then
 try
  aParams.Op.Flag[vcm_ofEnabled] := not l_Form.IsActiveInParent;
 finally
  l_Form := nil;
 end;{try..finally}
//#UC END# *4C3EA90300E1_49539DBA029Dtest_impl*
end;//TExTextForm.Document_DictListOpenFrmAct_Test

procedure TExTextForm.Document_DictListOpenFrmAct_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3EA90300E1_49539DBA029Dexec_var*
var
 l_Form: IvcmEntityForm;
//#UC END# *4C3EA90300E1_49539DBA029Dexec_var*
begin
//#UC START# *4C3EA90300E1_49539DBA029Dexec_impl*
 if NativeMainForm.HasForm(fm_enDiction.rFormID, vcm_ztNavigator, True, @l_Form) then
 try
  l_Form.SetActiveInParent;
 finally
  l_Form := nil;
 end;{try..finally}
//#UC END# *4C3EA90300E1_49539DBA029Dexec_impl*
end;//TExTextForm.Document_DictListOpenFrmAct_Execute

procedure TExTextForm.Document_GotoBookmark_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3EBF860139_49539DBA029Dtest_var*
var
 l_Count,
 l_Index: Integer;
 l_BookmarkList: IeeSubList;
//#UC END# *4C3EBF860139_49539DBA029Dtest_var*
begin
//#UC START# *4C3EBF860139_49539DBA029Dtest_impl*
// ��������� �������� ������ ��������
 if (Document <> nil) then
 begin
  l_BookmarkList := Text.Editor.Data.Document.Bookmarks;
  try
   l_Count := GetVisibleBookmarksCount(l_BookmarkList);
   if (l_Count > 0) then
   begin
    with aParams.Op.SubItems do
    begin
     Clear;
     for l_Index := 0 to Pred(l_BookmarkList.Count) do
      if l_BookmarkList.Subs[l_Index].Flags and ev_sfOwn = ev_sfOwn then
       Add(l_BookmarkList.Subs[l_Index].Name);
    end;//with aParams.Op.SubItems
   end//l_Count > 0
   else
    aParams.Op.Flag[vcm_ofEnabled] := False;
  finally
   l_BookmarkList := nil;
  end;//try..finally
 end//Document <> nil
 else
  aParams.Op.Flag[vcm_ofEnabled] := False;
//#UC END# *4C3EBF860139_49539DBA029Dtest_impl*
end;//TExTextForm.Document_GotoBookmark_Test

procedure TExTextForm.Document_GotoBookmark_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3EBF860139_49539DBA029Dexec_var*
var
 l_Count,
 l_Index: Integer;
 l_BookmarkList: IeeSubList;
 l_Sub: IeeSub;
//#UC END# *4C3EBF860139_49539DBA029Dexec_var*
begin
//#UC START# *4C3EBF860139_49539DBA029Dexec_impl*
 l_Index := aParams.ItemIndex;
 if (l_Index >= 0) then
 begin
  l_BookmarkList := Text.Editor.Data.Document.Bookmarks;
  l_Count := GetVisibleBookmarksCount(l_BookmarkList);
  if (l_Index = 0) then
  begin
   if (f_LastBookmarkIndex >= Pred(l_Count)) then
    f_LastBookmarkIndex := 0
   else
    Inc(f_LastBookmarkIndex);
   l_Index := f_LastBookmarkIndex;
  end//l_Index = 0
  else
  begin
   Dec(l_Index);
   f_LastBookmarkIndex := l_Index;
  end;//l_Index = 0
  l_Sub := GetVisibleBookmark(l_BookmarkList, l_Index);
  if (l_Sub <> nil) and
     l_Sub.Exists then
   l_Sub.Select;
 end;//l_Index >= 0
//#UC END# *4C3EBF860139_49539DBA029Dexec_impl*
end;//TExTextForm.Document_GotoBookmark_Execute

procedure TExTextForm.Document_LiteratureListForDictionary_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3ED13D03A5_49539DBA029Dtest_var*
//#UC END# *4C3ED13D03A5_49539DBA029Dtest_var*
begin
//#UC START# *4C3ED13D03A5_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofVisible] := (DictionDocument <> nil) and DictionDocument.IsMainDiction;
//#UC END# *4C3ED13D03A5_49539DBA029Dtest_impl*
end;//TExTextForm.Document_LiteratureListForDictionary_Test

procedure TExTextForm.Document_LiteratureListForDictionary_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3ED13D03A5_49539DBA029Dexec_var*
//#UC END# *4C3ED13D03A5_49539DBA029Dexec_var*
begin
//#UC START# *4C3ED13D03A5_49539DBA029Dexec_impl*
 if (DictionDocument <> nil) then
  DictionDocument.OpenLiteratureList;
//#UC END# *4C3ED13D03A5_49539DBA029Dexec_impl*
end;//TExTextForm.Document_LiteratureListForDictionary_Execute

procedure TExTextForm.Text_EditBookmark_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3ED54100A2_49539DBA029Dtest_var*
//#UC END# *4C3ED54100A2_49539DBA029Dtest_var*
begin
//#UC START# *4C3ED54100A2_49539DBA029Dtest_impl*
 DisableOperation(aParams);
//#UC END# *4C3ED54100A2_49539DBA029Dtest_impl*
end;//TExTextForm.Text_EditBookmark_Test

procedure TExTextForm.Text_EditBookmark_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3ED54100A2_49539DBA029Dexec_var*
//#UC END# *4C3ED54100A2_49539DBA029Dexec_var*
begin
//#UC START# *4C3ED54100A2_49539DBA029Dexec_impl*
 Assert(false);
//#UC END# *4C3ED54100A2_49539DBA029Dexec_impl*
end;//TExTextForm.Text_EditBookmark_Execute

procedure TExTextForm.Text_DeleteBookmark_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3ED54D03D4_49539DBA029Dtest_var*
//#UC END# *4C3ED54D03D4_49539DBA029Dtest_var*
begin
//#UC START# *4C3ED54D03D4_49539DBA029Dtest_impl*
 DisableOperation(aParams);
//#UC END# *4C3ED54D03D4_49539DBA029Dtest_impl*
end;//TExTextForm.Text_DeleteBookmark_Test

procedure TExTextForm.Text_DeleteBookmark_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3ED54D03D4_49539DBA029Dexec_var*
//#UC END# *4C3ED54D03D4_49539DBA029Dexec_var*
begin
//#UC START# *4C3ED54D03D4_49539DBA029Dexec_impl*
 Assert(false);
//#UC END# *4C3ED54D03D4_49539DBA029Dexec_impl*
end;//TExTextForm.Text_DeleteBookmark_Execute

procedure TExTextForm.Text_AddBookmark_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3ED5D502AE_49539DBA029Dtest_var*
//#UC END# *4C3ED5D502AE_49539DBA029Dtest_var*
begin
//#UC START# *4C3ED5D502AE_49539DBA029Dtest_impl*
 DisableOperation(aParams);
//#UC END# *4C3ED5D502AE_49539DBA029Dtest_impl*
end;//TExTextForm.Text_AddBookmark_Test

procedure TExTextForm.Text_AddBookmark_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3ED5D502AE_49539DBA029Dexec_var*
//#UC END# *4C3ED5D502AE_49539DBA029Dexec_var*
begin
//#UC START# *4C3ED5D502AE_49539DBA029Dexec_impl*
 Assert(false);
//#UC END# *4C3ED5D502AE_49539DBA029Dexec_impl*
end;//TExTextForm.Text_AddBookmark_Execute

procedure TExTextForm.Text_OpenNewWindow_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3ED7190010_49539DBA029Dtest_var*
//#UC END# *4C3ED7190010_49539DBA029Dtest_var*
begin
//#UC START# *4C3ED7190010_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := (UserType in [dftDocument, dftMedicFirm]) and
  (Document <> nil);
//#UC END# *4C3ED7190010_49539DBA029Dtest_impl*
end;//TExTextForm.Text_OpenNewWindow_Test

procedure TExTextForm.Text_OpenNewWindow_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3ED7190010_49539DBA029Dexec_var*
//#UC END# *4C3ED7190010_49539DBA029Dexec_var*
begin
//#UC START# *4C3ED7190010_49539DBA029Dexec_impl*
 if Assigned(dsDocument) then
  OpenInWindow
 else
  op_Document_CommonDocumentOpenNewWindow.Call(Self.As_IvcmEntityForm, UserType);
//#UC END# *4C3ED7190010_49539DBA029Dexec_impl*
end;//TExTextForm.Text_OpenNewWindow_Execute

procedure TExTextForm.Document_OpenProducedDrugList_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3EDBA7030C_49539DBA029Dtest_var*
//#UC END# *4C3EDBA7030C_49539DBA029Dtest_var*
begin
//#UC START# *4C3EDBA7030C_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := (MedicFirmDocument <> nil);
 aParams.Op.Flag[vcm_ofVisible] := defDataAdapter.IsInpharmExists;
//#UC END# *4C3EDBA7030C_49539DBA029Dtest_impl*
end;//TExTextForm.Document_OpenProducedDrugList_Test

procedure TExTextForm.Document_OpenProducedDrugList_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3EDBA7030C_49539DBA029Dexec_var*
//#UC END# *4C3EDBA7030C_49539DBA029Dexec_var*
begin
//#UC START# *4C3EDBA7030C_49539DBA029Dexec_impl*
 if (MedicFirmDocument <> nil) then
  MedicFirmDocument.OpenDrugList; 
//#UC END# *4C3EDBA7030C_49539DBA029Dexec_impl*
end;//TExTextForm.Document_OpenProducedDrugList_Execute

procedure TExTextForm.Document_OpenSimilarDrugList_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3EDBB80283_49539DBA029Dtest_var*
//#UC END# *4C3EDBB80283_49539DBA029Dtest_var*
begin
//#UC START# *4C3EDBB80283_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := (DrugDocument <> nil);
 aParams.Op.Flag[vcm_ofVisible] := defDataAdapter.IsInpharmExists;
//#UC END# *4C3EDBB80283_49539DBA029Dtest_impl*
end;//TExTextForm.Document_OpenSimilarDrugList_Test

procedure TExTextForm.Document_OpenSimilarDrugList_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3EDBB80283_49539DBA029Dexec_var*
//#UC END# *4C3EDBB80283_49539DBA029Dexec_var*
begin
//#UC START# *4C3EDBB80283_49539DBA029Dexec_impl*
 if (DrugDocument <> nil) then
  DrugDocument.OpenDrugInternationalNameSynonims;
//#UC END# *4C3EDBB80283_49539DBA029Dexec_impl*
end;//TExTextForm.Document_OpenSimilarDrugList_Execute

procedure TExTextForm.Selection_InsertHyperlink_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C7B96FA02DA_49539DBA029Dtest_var*
var
 l_Hyperlink : IevHyperlink;
 l_TempPara  : IeePara;
 l_TextPara  : IeeTextPara;
 l_Selection : InevSelection;
//#UC END# *4C7B96FA02DA_49539DBA029Dtest_var*
begin
//#UC START# *4C7B96FA02DA_49539DBA029Dtest_impl*
 if (aParams.Control Is TevCustomEditor) then
 begin
  l_Selection := TevCustomEditor(aParams.Control).Selection;
  if (l_Selection <> nil) AND not l_Selection.IsMulti then
  begin
   if Supports(l_Selection, IevHyperlink, l_Hyperlink) then
    try
     if (l_Hyperlink.ID < 0) then
      aParams.Op.Flag[vcm_ofEnabled] := false
     else
     begin
      l_TempPara := TeePara.Make(l_Hyperlink.Para, aParams.Control As IeeDocumentEx);
      try
       if Supports(l_TempPara, IeeTextPara, l_TextPara) then
        try
         if not l_TextPara.IsUserComment or
            l3IsNil(l_TextPara.Text) then
          aParams.Op.Flag[vcm_ofEnabled] := false;
        finally
         l_TextPara := nil;
        end//try..finally
       else
        aParams.Op.Flag[vcm_ofEnabled] := false;
      finally
       l_TempPara := nil;
      end;
     end;//l_Hyperlink.ID < 0
   finally
    l_Hyperlink := nil;
   end//try..finally
   else
    aParams.Op.Flag[vcm_ofEnabled] := false;
  end
  else
   aParams.Op.Flag[vcm_ofEnabled] := false;
 end//aParams.Control Is TevCustomEditor
 else
  aParams.Op.Flag[vcm_ofEnabled] := false;
//#UC END# *4C7B96FA02DA_49539DBA029Dtest_impl*
end;//TExTextForm.Selection_InsertHyperlink_Test

procedure TExTextForm.Selection_InsertHyperlink_GetState(var State: TvcmOperationStateIndex);
//#UC START# *4C7B96FA02DA_49539DBA029Dgetstate_var*
var
 l_Hyperlink : IevHyperlink;
 l_Selection : InevSelection;
//#UC END# *4C7B96FA02DA_49539DBA029Dgetstate_var*
begin
//#UC START# *4C7B96FA02DA_49539DBA029Dgetstate_impl*
 State := vcm_DefaultOperationState;
 l_Selection := Text.Selection;
 if (l_Selection <> nil) AND not l_Selection.IsMulti then
 begin
  if Supports(l_Selection, IevHyperlink, l_Hyperlink) then
   try
    if (l_Hyperlink.ID > 0) then
     State := st_user_Selection_InsertHyperlink_ModifyLink;
   finally
    l_Hyperlink := nil;
   end//try..finally
 end;//(l_Selection <> nil) AND not l_Selection.IsMulti
//#UC END# *4C7B96FA02DA_49539DBA029Dgetstate_impl*
end;//TExTextForm.Selection_InsertHyperlink_GetState

procedure TExTextForm.Selection_InsertHyperlink_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C7B96FA02DA_49539DBA029Dexec_var*
var
 l_Caption   : TvcmStringID;
 l_Hyperlink : IevHyperlink;
//#UC END# *4C7B96FA02DA_49539DBA029Dexec_var*
begin
//#UC START# *4C7B96FA02DA_49539DBA029Dexec_impl*
 if (aParams.Control Is TevCustomEditor) then
 begin
  if Supports(TevCustomEditor(aParams.Control).Selection, IevHyperlink, l_Hyperlink) then
   try
    if (l_Hyperlink.ID >= 0) then
    begin
     if not l_Hyperlink.Exists then
      l_Caption := str_SetHyperLink
     else
      l_Caption := str_ChangeHyperLink;
     TdmStdRes.SelectOpenWithUserData(Self.As_IvcmEntityForm,
                                      FilterInfoFactory.MakeFilterInfo(ffNone, sfMyDocumentsAndCommon),
                                      l_Caption,
                                      l_Hyperlink);
    end;//l_Hyperlink.ID
   finally
    l_Hyperlink := nil;
   end;//try..finally
 end;//aParams.Control Is TevCustomEditor
//#UC END# *4C7B96FA02DA_49539DBA029Dexec_impl*
end;//TExTextForm.Selection_InsertHyperlink_Execute

procedure TExTextForm.WarnRedaction_ShowInfo_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C7D354603D3_49539DBA029Dtest_var*
//#UC END# *4C7D354603D3_49539DBA029Dtest_var*
begin
//#UC START# *4C7D354603D3_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := FormIsMainInDocumentSet;
//#UC END# *4C7D354603D3_49539DBA029Dtest_impl*
end;//TExTextForm.WarnRedaction_ShowInfo_Test

procedure TExTextForm.WarnRedaction_ShowInfo_GetState(var State: TvcmOperationStateIndex);
//#UC START# *4C7D354603D3_49539DBA029Dgetstate_var*
var l_Form: IvcmEntityForm;
//#UC END# *4C7D354603D3_49539DBA029Dgetstate_var*
begin
//#UC START# *4C7D354603D3_49539DBA029Dgetstate_impl*
 if Assigned(Aggregate) and Aggregate.HasForm(fm_WarningForm.rFormID, @l_Form) and
  l_Form.IsActiveInParent then
  State := st_user_WarnRedaction_ShowInfo_Hide
 else
  State := vcm_DefaultOperationState;
//#UC END# *4C7D354603D3_49539DBA029Dgetstate_impl*
end;//TExTextForm.WarnRedaction_ShowInfo_GetState

procedure TExTextForm.WarnRedaction_ShowInfo_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C7D354603D3_49539DBA029Dexec_var*
//#UC END# *4C7D354603D3_49539DBA029Dexec_var*
begin
//#UC START# *4C7D354603D3_49539DBA029Dexec_impl*
 ShowWarningPage(true{false{True}, cEditionWarningSub);
              // ^ - ������� ������ ���������, ���� �������� � ������
              // http://mdp.garant.ru/pages/viewpage.action?pageId=266898633&focusedCommentId=285508953#comment-285508953
              // � ��� � ���� "�����" - http://mdp.garant.ru/pages/viewpage.action?pageId=287219564
//#UC END# *4C7D354603D3_49539DBA029Dexec_impl*
end;//TExTextForm.WarnRedaction_ShowInfo_Execute

procedure TExTextForm.DocumentBlock_PrintPreview_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C879306001C_49539DBA029Dtest_var*
//#UC END# *4C879306001C_49539DBA029Dtest_var*
begin
//#UC START# *4C879306001C_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := False;
//#UC END# *4C879306001C_49539DBA029Dtest_impl*
end;//TExTextForm.DocumentBlock_PrintPreview_Test

procedure TExTextForm.DocumentBlock_PrintPreview_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C879306001C_49539DBA029Dexec_var*
//#UC END# *4C879306001C_49539DBA029Dexec_var*
begin
//#UC START# *4C879306001C_49539DBA029Dexec_impl*
 Assert(false);
//#UC END# *4C879306001C_49539DBA029Dexec_impl*
end;//TExTextForm.DocumentBlock_PrintPreview_Execute

procedure TExTextForm.DocumentBlock_Select_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C87931D00FC_49539DBA029Dtest_var*
//#UC END# *4C87931D00FC_49539DBA029Dtest_var*
begin
//#UC START# *4C87931D00FC_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := False;
//#UC END# *4C87931D00FC_49539DBA029Dtest_impl*
end;//TExTextForm.DocumentBlock_Select_Test

procedure TExTextForm.DocumentBlock_Select_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C87931D00FC_49539DBA029Dexec_var*
//#UC END# *4C87931D00FC_49539DBA029Dexec_var*
begin
//#UC START# *4C87931D00FC_49539DBA029Dexec_impl*
 Assert(false);
//#UC END# *4C87931D00FC_49539DBA029Dexec_impl*
end;//TExTextForm.DocumentBlock_Select_Execute

procedure TExTextForm.Document_ViewChangedFragments_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4DDCBABC03B7_49539DBA029Dtest_var*
//#UC END# *4DDCBABC03B7_49539DBA029Dtest_var*
begin
//#UC START# *4DDCBABC03B7_49539DBA029Dtest_impl*
 Document_CompareEditions_Test(aParams);
//#UC END# *4DDCBABC03B7_49539DBA029Dtest_impl*
end;//TExTextForm.Document_ViewChangedFragments_Test

procedure TExTextForm.Document_ViewChangedFragments_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4DDCBABC03B7_49539DBA029Dexec_var*
//#UC END# *4DDCBABC03B7_49539DBA029Dexec_var*
begin
//#UC START# *4DDCBABC03B7_49539DBA029Dexec_impl*
 TdmStdRes.ViewChangedFragmentsForPrevEdition(Self.Document);
//#UC END# *4DDCBABC03B7_49539DBA029Dexec_impl*
end;//TExTextForm.Document_ViewChangedFragments_Execute

procedure TExTextForm.DocumentSubPanel_UpdateSubPanel_Execute;
//#UC START# *4DF20436002A_49539DBA029Dexec_var*
//#UC END# *4DF20436002A_49539DBA029Dexec_var*
begin
//#UC START# *4DF20436002A_49539DBA029Dexec_impl*
 UpdateSubPanelDescription;
//#UC END# *4DF20436002A_49539DBA029Dexec_impl*
end;//TExTextForm.DocumentSubPanel_UpdateSubPanel_Execute

procedure TExTextForm.DocumentSubPanel_UpdateSubPanel(const aParams: IvcmExecuteParams);
begin
 DocumentSubPanel_UpdateSubPanel_Execute;
end;

procedure TExTextForm.IntranetSourcePoint_GoToIntranet_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4F184B42019E_49539DBA029Dexec_var*
//#UC END# *4F184B42019E_49539DBA029Dexec_var*
begin
//#UC START# *4F184B42019E_49539DBA029Dexec_impl*
 GoToIntranetPrim(false);
//#UC END# *4F184B42019E_49539DBA029Dexec_impl*
end;//TExTextForm.IntranetSourcePoint_GoToIntranet_Execute

procedure TExTextForm.Picture_Open_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4F672A7903C1_49539DBA029Dtest_var*
var
 l_EP : IeePara;
//#UC END# *4F672A7903C1_49539DBA029Dtest_var*
begin
//#UC START# *4F672A7903C1_49539DBA029Dtest_impl*
 l_EP := LeafParaUnderCursor;
 aParams.Op.Flag[vcm_ofEnabled] := (l_EP <> nil);
 if aParams.Op.Flag[vcm_ofEnabled] then
  if not Supports(l_EP, IeePicture) then
   aParams.Op.Flag[vcm_ofEnabled] := false;
//#UC END# *4F672A7903C1_49539DBA029Dtest_impl*
end;//TExTextForm.Picture_Open_Test

procedure TExTextForm.Picture_Open_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4F672A7903C1_49539DBA029Dexec_var*
var
 l_EP : IeePara;
 l_Picture : IeePicture;
//#UC END# *4F672A7903C1_49539DBA029Dexec_var*
begin
//#UC START# *4F672A7903C1_49539DBA029Dexec_impl*
 l_EP := LeafParaUnderCursor;
 if Supports(l_EP, IeePicture, l_Picture) then
  OpenPicture(l_EP, l_Picture);
//#UC END# *4F672A7903C1_49539DBA029Dexec_impl*
end;//TExTextForm.Picture_Open_Execute

procedure TExTextForm.Picture_OpenNewWindow_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4F672A9C0083_49539DBA029Dtest_var*
//#UC END# *4F672A9C0083_49539DBA029Dtest_var*
begin
//#UC START# *4F672A9C0083_49539DBA029Dtest_impl*
 Picture_Open_Test(aParams);
//#UC END# *4F672A9C0083_49539DBA029Dtest_impl*
end;//TExTextForm.Picture_OpenNewWindow_Test

procedure TExTextForm.Picture_OpenNewWindow_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4F672A9C0083_49539DBA029Dexec_var*
var
 l_EP : IeePara;
 l_Picture : IeePicture;
//#UC END# *4F672A9C0083_49539DBA029Dexec_var*
begin
//#UC START# *4F672A9C0083_49539DBA029Dexec_impl*
 l_EP := LeafParaUnderCursor;
 if Supports(l_EP, IeePicture, l_Picture) then
  OpenPicture(l_EP, l_Picture, true);
//#UC END# *4F672A9C0083_49539DBA029Dexec_impl*
end;//TExTextForm.Picture_OpenNewWindow_Execute

function TExTextForm.BaseSearchPresentationHolder_GetBaseSearchPresentation_Execute: InsBaseSearchPresentation;
//#UC START# *5072D45A035C_49539DBA029Dexec_var*
//#UC END# *5072D45A035C_49539DBA029Dexec_var*
begin
//#UC START# *5072D45A035C_49539DBA029Dexec_impl*
 Assert(UserType = dftAACLeft);
 Result := Self;
//#UC END# *5072D45A035C_49539DBA029Dexec_impl*
end;//TExTextForm.BaseSearchPresentationHolder_GetBaseSearchPresentation_Execute

procedure TExTextForm.BaseSearchPresentationHolder_GetBaseSearchPresentation(const aParams: IvcmExecuteParams);
begin
 with (aParams.Data As IBaseSearchPresentationHolder_GetBaseSearchPresentation_Params) do
  ResultValue := BaseSearchPresentationHolder_GetBaseSearchPresentation_Execute;
end;

procedure TExTextForm.DftDrugSynchroViewQueryOpen(aSender: TObject);
//#UC START# *664D52829DD3_49539DBA029D_var*
//#UC END# *664D52829DD3_49539DBA029D_var*
begin
//#UC START# *664D52829DD3_49539DBA029D_impl*
 if HasDoc then
  OpenInWindow(False);
//#UC END# *664D52829DD3_49539DBA029D_impl*
end;//TExTextForm.DftDrugSynchroViewQueryOpen

procedure TExTextForm.DftDictSubEntryQueryClose(aSender: TObject);
//#UC START# *701BC3512B2B_49539DBA029D_var*
//#UC END# *701BC3512B2B_49539DBA029D_var*
begin
//#UC START# *701BC3512B2B_49539DBA029D_impl*
 DoSwitchToFirstTab;
//#UC END# *701BC3512B2B_49539DBA029D_impl*
end;//TExTextForm.DftDictSubEntryQueryClose

procedure TExTextForm.DftTranslationQueryClose(aSender: TObject);
//#UC START# *7401AD950C39_49539DBA029D_var*
//#UC END# *7401AD950C39_49539DBA029D_var*
begin
//#UC START# *7401AD950C39_49539DBA029D_impl*
 DoSwitchToFirstTab;
//#UC END# *7401AD950C39_49539DBA029D_impl*
end;//TExTextForm.DftTranslationQueryClose

procedure TExTextForm.DftDrugSynchroViewQueryMaximized(aSender: TObject);
//#UC START# *8A8A353C1A57_49539DBA029D_var*
//#UC END# *8A8A353C1A57_49539DBA029D_var*
begin
//#UC START# *8A8A353C1A57_49539DBA029D_impl*
 if HasDoc then
  OpenInWindow;
//#UC END# *8A8A353C1A57_49539DBA029D_impl*
end;//TExTextForm.DftDrugSynchroViewQueryMaximized

procedure TExTextForm.DftAnnotationQueryClose(aSender: TObject);
//#UC START# *918005C1AFE3_49539DBA029D_var*
//#UC END# *918005C1AFE3_49539DBA029D_var*
begin
//#UC START# *918005C1AFE3_49539DBA029D_impl*
 DoSwitchToFirstTab;
//#UC END# *918005C1AFE3_49539DBA029D_impl*
end;//TExTextForm.DftAnnotationQueryClose

procedure TExTextForm.DftDocSynchroViewQueryMaximized(aSender: TObject);
//#UC START# *931EEB23421A_49539DBA029D_var*
//#UC END# *931EEB23421A_49539DBA029D_var*
begin
//#UC START# *931EEB23421A_49539DBA029D_impl*
 if HasDoc then
  OpenInWindow;
//#UC END# *931EEB23421A_49539DBA029D_impl*
end;//TExTextForm.DftDocSynchroViewQueryMaximized

procedure TExTextForm.DftRelatedDocQueryClose(aSender: TObject);
//#UC START# *A2BF852CD6C7_49539DBA029D_var*
//#UC END# *A2BF852CD6C7_49539DBA029D_var*
begin
//#UC START# *A2BF852CD6C7_49539DBA029D_impl*
 DoSwitchToFirstTab;
//#UC END# *A2BF852CD6C7_49539DBA029D_impl*
end;//TExTextForm.DftRelatedDocQueryClose

procedure TExTextForm.DftTranslationQueryOpen(aSender: TObject);
//#UC START# *AF0C9051AEEF_49539DBA029D_var*
//#UC END# *AF0C9051AEEF_49539DBA029D_var*
begin
//#UC START# *AF0C9051AEEF_49539DBA029D_impl*
 if HasDoc then
  OpenInWindow(False);
//#UC END# *AF0C9051AEEF_49539DBA029D_impl*
end;//TExTextForm.DftTranslationQueryOpen

procedure TExTextForm.DftDocSynchroViewQueryOpen(aSender: TObject);
//#UC START# *BB5471A3EA8E_49539DBA029D_var*
//#UC END# *BB5471A3EA8E_49539DBA029D_var*
begin
//#UC START# *BB5471A3EA8E_49539DBA029D_impl*
 if HasDoc then
  OpenInWindow(False);
//#UC END# *BB5471A3EA8E_49539DBA029D_impl*
end;//TExTextForm.DftDocSynchroViewQueryOpen

procedure TExTextForm.DftMedicFirmSynchroViewQueryOpen(aSender: TObject);
//#UC START# *FD0B95191C1E_49539DBA029D_var*
//#UC END# *FD0B95191C1E_49539DBA029D_var*
begin
//#UC START# *FD0B95191C1E_49539DBA029D_impl*
 if HasDoc then
  OpenInWindow(False);
//#UC END# *FD0B95191C1E_49539DBA029D_impl*
end;//TExTextForm.DftMedicFirmSynchroViewQueryOpen

procedure TExTextForm.WndProc(var Message: TMessage);
//#UC START# *47E136A80191_49539DBA029D_var*
//#UC END# *47E136A80191_49539DBA029D_var*
begin
//#UC START# *47E136A80191_49539DBA029D_impl*
 if Message.Msg = g_GoToIntranetMessage then
  GoToIntranet
 else
  inherited WndProc(Message);
//#UC END# *47E136A80191_49539DBA029D_impl*
end;//TExTextForm.WndProc

procedure TExTextForm.FinishDataUpdate;
//#UC START# *47EA4E9002C6_49539DBA029D_var*

 function lp_ShowMessage: Boolean;
 begin
  Result := (UserType = dftDocument) and
     Assigned(ViewArea) and
     Assigned(ViewArea.DocInfo) and
    (not Assigned(ViewArea.DocInfo.Doc) or
     not ViewArea.DocInfo.Doc.IsAlive);
 end;//function lp_ShowMessage: Boolean;

//#UC END# *47EA4E9002C6_49539DBA029D_var*
begin
//#UC START# *47EA4E9002C6_49539DBA029D_impl*
 inherited;
 if lp_ShowMessage then
  TbsDocumentMissingMessage.Show;
//#UC END# *47EA4E9002C6_49539DBA029D_impl*
end;//TExTextForm.FinishDataUpdate

function TExTextForm.SettingChanged(const aSettingId: TafwSettingId): Boolean;
//#UC START# *47EA863A035C_49539DBA029D_var*
//#UC END# *47EA863A035C_49539DBA029D_var*
begin
//#UC START# *47EA863A035C_49539DBA029D_impl*
 Result := False;
 if (aSettingId = pi_Document_PermanentSelection) then
 begin
  Text.PersistentSelection :=
   Settings.LoadBoolean(pi_Document_PermanentSelection,
                        dv_Document_PermanentSelection);
  Result := True;
 end//aSettingId = pi_Document_PermanentSelection
 else
 if (aSettingId = pi_Document_ShowBlockBorders) then
 begin
  Text.ShowDocumentParts := Settings.LoadBoolean(pi_Document_ShowBlockBorders,
                                                 dv_Document_ShowBlockBorders);
  Result := True;
 end//aSettingId = pi_Document_ShowBlockBorders
 else
 if (aSettingId = pi_Document_ShowSpatial) then
 begin
  Text.DrawSpecial := Settings.LoadBoolean(pi_Document_ShowSpatial,
                                           dv_Document_ShowSpatial);
  Result := True;
 end//aSettingId = pi_Document_ShowSpatial
 else
 if (aSettingId = pi_Document_SubPanel_ShowBlocks) or
    (aSettingId = pi_Document_SubPanel_ShowBookmarks) or
    (aSettingId = pi_Document_SubPanel_ShowJurorComments) or
    (aSettingId = pi_Document_SubPanel_ShowUserComments) or
    (aSettingId = pi_Document_SubPanel_ShowSubNumbers) then
 begin
  UpdateSubPanelDescription;
  Result := True;
 end//aSettingId = pi_Document_SubPanel_ShowBlocks..
 else
 if (aSettingId = pi_Document_ShowTechComment) then
 begin
  UpdateTechComment;
  Result := True;
 end;//aSettingId = pi_Document_ShowTechComment
//#UC END# *47EA863A035C_49539DBA029D_impl*
end;//TExTextForm.SettingChanged

procedure TExTextForm.SettingsReplaceFinish;
//#UC START# *47EA8B9601FE_49539DBA029D_var*
//#UC END# *47EA8B9601FE_49539DBA029D_var*
begin
//#UC START# *47EA8B9601FE_49539DBA029D_impl*
 inherited;
 DoSettingsChanged;
//#UC END# *47EA8B9601FE_49539DBA029D_impl*
end;//TExTextForm.SettingsReplaceFinish

procedure TExTextForm.UserSettingsChanged;
//#UC START# *4958BE910345_49539DBA029D_var*
//#UC END# *4958BE910345_49539DBA029D_var*
begin
//#UC START# *4958BE910345_49539DBA029D_impl*
 inherited;
 DoSettingsChanged;
//#UC END# *4958BE910345_49539DBA029D_impl*
end;//TExTextForm.UserSettingsChanged

{$If not defined(NoVCM)}
procedure TExTextForm.NotifyDataSourceChanged(const anOld: IvcmViewAreaController;
  const aNew: IvcmViewAreaController);
//#UC START# *497469C90140_49539DBA029D_var*
//#UC END# *497469C90140_49539DBA029D_var*
begin
//#UC START# *497469C90140_49539DBA029D_impl*
 inherited;
 if (aNew <> nil) then
  CheckLinkedWindows;

 if Assigned(ViewArea) then
  Text.IsStaticText := ViewArea.IsReadOnly; // ������ ����� ��� ������ ���� �� ����� ��� �� ���.
                                            // http://mdp.garant.ru/pages/viewpage.action?pageId=401506914
//#UC END# *497469C90140_49539DBA029D_impl*
end;//TExTextForm.NotifyDataSourceChanged
{$IfEnd} //not NoVCM

{$If not defined(NoVCM)}
procedure TExTextForm.DoInit(aFromHistory: Boolean);
//#UC START# *49803F5503AA_49539DBA029D_var*
//#UC END# *49803F5503AA_49539DBA029D_var*
begin
//#UC START# *49803F5503AA_49539DBA029D_impl*
 inherited;
 nsWarnImages;
 f_LastBookmarkIndex := -1;
 f_InGoToInternet := False;
 LoadFromSettings;
 // http://mdp.garant.ru/pages/viewpage.action?pageId=290953654
(* with SubPanel do
 begin
  if (UserType in [dftDocument, dftDrug]) then
   SubDescriptors := nsDocumentRes.SubDescriptors
  else
   SubDescriptors := nsDocumentRes.LiteSubDescriptors;
 end;//with SubPanel do*)
 //LoadFromSettings;
 // - ���������� ����
 // http://mdp.garant.ru/pages/viewpage.action?pageId=290953654
//#UC END# *49803F5503AA_49539DBA029D_impl*
end;//TExTextForm.DoInit
{$IfEnd} //not NoVCM

function TExTextForm.CanAddToControl: Boolean;
//#UC START# *4988675A0308_49539DBA029D_var*
//#UC END# *4988675A0308_49539DBA029D_var*
begin
//#UC START# *4988675A0308_49539DBA029D_impl*
 Result := (UserType = dftDocument);
//#UC END# *4988675A0308_49539DBA029D_impl*
end;//TExTextForm.CanAddToControl

{$If not defined(NoVCM)}
procedure TExTextForm.SetPositionByDS;
//#UC START# *498953170108_49539DBA029D_var*
//#UC END# *498953170108_49539DBA029D_var*
begin
//#UC START# *498953170108_49539DBA029D_impl*
 inherited;
 ChangePositionByDataSource;
//#UC END# *498953170108_49539DBA029D_impl*
end;//TExTextForm.SetPositionByDS
{$IfEnd} //not NoVCM

function TExTextForm.DoMakeLinkDocInfo(const aDocument: IDocument;
  aPointType: TDocumentPositionType;
  aSub: Cardinal): IdeDocInfo;
//#UC START# *4A815FB3005D_49539DBA029D_var*
//#UC END# *4A815FB3005D_49539DBA029D_var*
begin
//#UC START# *4A815FB3005D_49539DBA029D_impl*
 Assert(ViewArea <> nil);
 Result := ViewArea.MakeGotoPointData(aDocument, aPointType, aSub);
//#UC END# *4A815FB3005D_49539DBA029D_impl*
end;//TExTextForm.DoMakeLinkDocInfo

function TExTextForm.DoProcessLocalLink(const aDocument: IDocument;
  aPointType: TDocumentPositionType;
  aSub: Cardinal): Boolean;
//#UC START# *4A8160720125_49539DBA029D_var*
//#UC END# *4A8160720125_49539DBA029D_var*
begin
//#UC START# *4A8160720125_49539DBA029D_impl*
 Result := false;
 if (UserType in [dftDocSynchroView,
                  dftRelatedSynchroView,
                  dftMedicFirmSynchroView] +
                 [dftAACLeft,
                  dftAACRight,
                  dftAACContentsLeft,
                  dftAACContentsRight])
                 // - � ��� ��-������ ���� ��������� ����� ���������
                 //   �.�. ����� ������������ ���� ������, ���� ����� ��������
                 //   ��������� 
  then
  Exit;
 if aDocument.GetDocType = DT_BOOK then
  Exit;
 Result := inherited DoProcessLocalLink(aDocument, aPointType, aSub);
//#UC END# *4A8160720125_49539DBA029D_impl*
end;//TExTextForm.DoProcessLocalLink

{$If not defined(NoVCM)}
function TExTextForm.NeedDrawCaption: Boolean;
//#UC START# *4A84183701B9_49539DBA029D_var*
//#UC END# *4A84183701B9_49539DBA029D_var*
begin
//#UC START# *4A84183701B9_49539DBA029D_impl*
 Result := not (UserType in [dftAACLeft,
                             dftAACRight,
                             dftAACContentsLeft,
                             dftAACContentsRight]);
//#UC END# *4A84183701B9_49539DBA029D_impl*
end;//TExTextForm.NeedDrawCaption
{$IfEnd} //not NoVCM

function TExTextForm.NeedsStatusBarItems: Boolean;
//#UC START# *4A8E5CEC021F_49539DBA029D_var*
//#UC END# *4A8E5CEC021F_49539DBA029D_var*
begin
//#UC START# *4A8E5CEC021F_49539DBA029D_impl*
 Result := GetNeedsStatusBarItems;
//#UC END# *4A8E5CEC021F_49539DBA029D_impl*
end;//TExTextForm.NeedsStatusBarItems

{$If not defined(NoVCM)}
procedure TExTextForm.InitControls;
//#UC START# *4A8E8F2E0195_49539DBA029D_var*
//#UC END# *4A8E8F2E0195_49539DBA029D_var*
begin
//#UC START# *4A8E8F2E0195_49539DBA029D_impl*
 inherited;
 TextSource.OnMakeDocumentContainer := TextSourceMakeDocumentContainer;
 TextSource.OnDocumentChanged := TextSourceDocumentChanged;
 TextSource.OnTOCCreated := Self.TextSourceTOCCreated;
 SubPanel.Color := clWhite;
 Text.LeftIndentDelta := 7{2};
                      // ^ http://mdp.garant.ru/pages/viewpage.action?pageId=294590299
 Text.OnFocusViaMouseSet := Self.DoFocusViaMouseSet;
 Text.OnHistory := Self.OnHistoryState;
 Assert(not Assigned(Text.OnHyperlinkNavigate));
 Text.OnHyperlinkNavigate := Self.DoHyperlinkNavigate;
//#UC END# *4A8E8F2E0195_49539DBA029D_impl*
end;//TExTextForm.InitControls
{$IfEnd} //not NoVCM

procedure TExTextForm.VersionCommentsVisibleInvertedByUser(NewState: Boolean);
//#UC START# *4AAA150A0244_49539DBA029D_var*
//#UC END# *4AAA150A0244_49539DBA029D_var*
begin
//#UC START# *4AAA150A0244_49539DBA029D_impl*
 TnsSwitchVersionCommentsEvent.Log(NewState);
//#UC END# *4AAA150A0244_49539DBA029D_impl*
end;//TExTextForm.VersionCommentsVisibleInvertedByUser

{$If not defined(NoVCM)}
function TExTextForm.DoGetTabInfo(out theCaption: Il3CString;
  out theItemIndex: Integer): Boolean;
//#UC START# *4AC497FD00A2_49539DBA029D_var*
//#UC END# *4AC497FD00A2_49539DBA029D_var*
begin
//#UC START# *4AC497FD00A2_49539DBA029D_impl*
 Result := not (UserType in [dftNone,
                             dftDocument,
                             dftRelatedDoc,
                             dftDocSynchroView,
                             dftRelatedSynchroView,
                             dftDictEntry,
                             //dftDictSubEntry,
                             dftAnnotation,
                             //dftAutoreferatAfterSearch,
                             //dftConsultation,
                             dftTranslation,
                             dftAnnotationSynchroView,
                             dftTips,
                             dftMedDictEntry,
                             //dftAutoreferat,
                             //dftDrug,
                             dftMedicFirm,
                             dftMedicFirmSynchroView]);
 if Result then
 begin
  theCaption := GetCurrentCaption;
  theItemIndex := GetCurrentImage;
 end;//UserType in..
//#UC END# *4AC497FD00A2_49539DBA029D_impl*
end;//TExTextForm.DoGetTabInfo
{$IfEnd} //not NoVCM

{$If not defined(NoVCM)}
function TExTextForm.NeedSetMyFocus: Boolean;
//#UC START# *4B4F13E80365_49539DBA029D_var*
//#UC END# *4B4F13E80365_49539DBA029D_var*
begin
//#UC START# *4B4F13E80365_49539DBA029D_impl*
 Case UserType of
  dftAACContentsLeft:
   Result := true;
  dftAACRight:
   Result := false;
  dftAACContentsRight:
   Result := false;
  dftAACLeft:
   Result := true;
  else
   Result := inherited NeedSetMyFocus;
 end;//Case UserType
//#UC END# *4B4F13E80365_49539DBA029D_impl*
end;//TExTextForm.NeedSetMyFocus
{$IfEnd} //not NoVCM

procedure TExTextForm.DoDocumentShowTechCommentsExecute;
//#UC START# *4C8DCD3B015C_49539DBA029D_var*
//#UC END# *4C8DCD3B015C_49539DBA029D_var*
begin
//#UC START# *4C8DCD3B015C_49539DBA029D_impl*
 with Settings do
  SaveBoolean(pi_Document_ShowTechComment,
              not LoadBoolean(pi_Document_ShowTechComment,
                              dv_Document_ShowTechComment),
              dv_Document_ShowTechComment);
//#UC END# *4C8DCD3B015C_49539DBA029D_impl*
end;//TExTextForm.DoDocumentShowTechCommentsExecute

function TExTextForm.pm_GetHyperlinkSubID: Integer;
//#UC START# *4CE41B300315_49539DBA029Dget_var*
var
 l_Para : IeePara;
//#UC END# *4CE41B300315_49539DBA029Dget_var*
begin
//#UC START# *4CE41B300315_49539DBA029Dget_impl*
 //����� ��� ���-���������� ������������� ������ �� Para,
 //��-�� ���� ��� �������� ������ �� ����������� �������������
 //http://mdp.garant.ru/pages/viewpage.action?pageId=401514692
 if (UserType in [dftAACContentsRight, dftAACContentsLeft])
  and Assigned(dsDocument) and Assigned(dsDocument.DocInfo) then
 begin
  if (dsDocument.DocInfo.Pos.rRefType = dptSub) then
   Result := dsDocument.DocInfo.Pos.rPos
  else//(dsDocument.DocInfo.Pos.rRefType = dptSub)
  if (dsDocument.DocInfo.Pos.rRefType = dptPara) then
   Result := Integer(Cardinal(dsDocument.DocInfo.Pos.rPos) OR POSITION_TYPE_PARA_ID);
 end//(UserType in [dftAACContentsRight, dftAACContentsLeft])
 else
 begin
  l_Para := GetParaForPositionning;
  if (l_Para = nil) then
   Result := inherited pm_GetHyperlinkSubID
  else
  begin
   if (l_Para.Subs <> nil) AND (l_Para.Subs.Count > 0) then
    Result := l_Para.Subs.Subs[0].ID
   else
   begin
    Result := l_Para.ID;
    if (Result <> 0) then
     Result := Integer(Cardinal(Result) OR POSITION_TYPE_PARA_ID);
   end;//l_Para.Subs <> nil
  end;//l_Para = nil
 end;
//#UC END# *4CE41B300315_49539DBA029Dget_impl*
end;//TExTextForm.pm_GetHyperlinkSubID

{$If not defined(NoVCM)}
procedure TExTextForm.NotifyUserTypeSet;
//#UC START# *4D78E2BB0211_49539DBA029D_var*
//#UC END# *4D78E2BB0211_49539DBA029D_var*
begin
//#UC START# *4D78E2BB0211_49539DBA029D_impl*
 inherited;
 if (UserType in [dftAACRight, dftAACLeft, dftAACContentsRight, dftAACContentsLeft]) then
  Text.NeedDrawDocumentEdge := False;

 case UserType of
  dftAACContentsLeft:
   begin
    Text.AACLike := nev_aacLeft;
    Text.Color := cAACContentsBackColor;
    Text.LeftIndentDelta := 65 - Text.LMargin; // http://mdp.garant.ru/pages/viewpage.action?pageId=388860126
   end;
  dftAACContentsRight:
   begin
    Text.AACLike := nev_aacRight;
    Text.LeftIndentDelta := 65 - Text.LMargin; // http://mdp.garant.ru/pages/viewpage.action?pageId=388860126
   end;
  dftAACLeft:
   begin
    Text.LeftIndentDelta := 45; // http://mdp.garant.ru/pages/viewpage.action?pageId=390577778
    Text.RMargin := 45;
   end;
  dftAACRight:
   begin
    //Text.LeftIndentDelta := AACTextContainerPrim_Form.LeftIndentDeltaForAACRight;
    Text.LeftIndentDelta := 55 - Text.LMargin;
    Text.RMargin := 55;
   end;
 else
  Text.AACLike := nev_aacNone;
 end;
//#UC END# *4D78E2BB0211_49539DBA029D_impl*
end;//TExTextForm.NotifyUserTypeSet
{$IfEnd} //not NoVCM

procedure TExTextForm.DoSetHyperlinkCallStatus(aValue: Boolean);
//#UC START# *4F382E2D01C1_49539DBA029D_var*
//#UC END# *4F382E2D01C1_49539DBA029D_var*
begin
//#UC START# *4F382E2D01C1_49539DBA029D_impl*
 f_HyperlinkCallStatus := aValue;
//#UC END# *4F382E2D01C1_49539DBA029D_impl*
end;//TExTextForm.DoSetHyperlinkCallStatus

{$If not defined(NoVCM)}
procedure TExTextForm.FormInsertedIntoContainer;
//#UC START# *4F7C65380244_49539DBA029D_var*
var
 l_VScroll: TvtScrollBar;
//#UC END# *4F7C65380244_49539DBA029D_var*
begin
//#UC START# *4F7C65380244_49539DBA029D_impl*
 inherited;
 SetFocusToTextInAAC;
 if (UserType in [dftAACRight, dftAACLeft, dftAACContentsRight, dftAACContentsLeft]) then
 begin
  l_VScroll := Op_AACTextContainer_GetVScrollBar.Call(Aggregate, (UserType = dftAACLeft) or (UserType = dftAACContentsLeft));
  if Assigned(l_VScroll) then
   Text.VScrollBar := l_VScroll;
  if (UserType = dftAACRight) then
   Op_AACTextContainer_SetJumpTo.Call(Aggregate, Self.JumpTo);
 end;//UserType in [dftAACRight, dftAACLeft]
//#UC END# *4F7C65380244_49539DBA029D_impl*
end;//TExTextForm.FormInsertedIntoContainer
{$IfEnd} //not NoVCM

{$If not defined(NoVCM)}
procedure TExTextForm.BecomeVisible;
//#UC START# *4F7C808A0349_49539DBA029D_var*
//#UC END# *4F7C808A0349_49539DBA029D_var*
begin
//#UC START# *4F7C808A0349_49539DBA029D_impl*
 inherited;
 SetFocusToTextInAAC;
//#UC END# *4F7C808A0349_49539DBA029D_impl*
end;//TExTextForm.BecomeVisible
{$IfEnd} //not NoVCM

procedure TExTextForm.ClearFields;
 {-}
begin
 f_ControlMap := nil;
 f_RecallCreateTOCTree := nil;
 inherited;
end;//TExTextForm.ClearFields

{$If not defined(NoVCM)}
function TExTextForm.GetIsMainObjectForm: Boolean;
//#UC START# *501174B10018_49539DBA029D_var*
//#UC END# *501174B10018_49539DBA029D_var*
begin
//#UC START# *501174B10018_49539DBA029D_impl*
 Case UserType of
  dftAACContentsLeft,
  dftAACRight:
   Result := false;
  dftAACContentsRight,
  dftAACLeft:
   Result := true;
  else
   Result := inherited GetIsMainObjectForm;
 end;//Case UserType
//#UC END# *501174B10018_49539DBA029D_impl*
end;//TExTextForm.GetIsMainObjectForm
{$IfEnd} //not NoVCM

procedure TExTextForm.SignalDataSourceChanged(const anOld : IvcmViewAreaController;
 const aDsNew : IvcmViewAreaController);
begin
 inherited;
 if (aDsNew = nil) then
 begin
  DocumentWithContents := nil;
  DictionDocument := nil;
  MedicFirmDocument := nil;
  DrugDocument := nil;
  Consultation := nil;
  dsConsultation := nil;
  AAC := nil;
 end//aDsNew = nil
 else
 begin
  Supports(aDsNew, IucbDocumentWithContents, DocumentWithContents);
  Supports(aDsNew, IdsDictionDocument, DictionDocument);
  Supports(aDsNew, IdsMedicFirmDocument, MedicFirmDocument);
  Supports(aDsNew, IdsDrugDocument, DrugDocument);
  aDsNew.CastUCC(IsdsConsultation, Consultation);
  Supports(aDsNew, IdsConsultation, dsConsultation);
  aDsNew.CastUCC(IsdsAAC, AAC);
 end;//aDsNew = nil
end;

procedure TExTextForm.InitEntities;
begin
 inherited;
 with Entities.Entities do
 begin
  PublishFormEntity(en_Document, nil);
  PublishFormEntity(en_Loadable, nil);
  PublishFormEntity(en_System, nil);
  PublishFormEntity(en_Redactions, nil);
  PublishFormEntity(en_Selection, nil);
  PublishFormEntity(en_TimeMachine, nil);
  PublishFormEntity(en_Edit, nil);
  PublishFormEntity(en_DocumentBlock, nil);
  PublishFormEntity(en_DocumentBlockHeader, nil);
  PublishFormEntity(en_Text, nil);
  PublishFormEntity(en_WarnOnControl, nil);
  PublishFormEntity(en_TasksPanel, nil);
  PublishFormEntity(en_ExternalObject, nil);
  PublishFormEntity(en_WarnRedaction, nil);
  PublishFormEntity(en_WarnTimeMachine, nil);
  PublishFormEntity(en_WarnJuror, nil);
  PublishFormEntity(en_UserCommentIcon, nil);
  PublishFormEntity(en_UserComment, nil);
  PublishFormEntity(en_DocumentSubPanel, nil);
  PublishFormEntity(en_DocumentBlockBookmarks, nil);
  PublishFormEntity(en_IntranetSourcePoint, nil);
  PublishFormEntity(en_Picture, nil);
  PublishFormEntity(en_BaseSearchPresentationHolder, nil);
  PublishOpWithResult(en_Document, op_OpenCorrespondentList, Document_OpenCorrespondentList, Document_OpenCorrespondentList_Test, nil);
  PublishOpWithResult(en_Document, op_OpenRespondentList, Document_OpenRespondentList, Document_OpenRespondentList_Test, nil);
  PublishOp(en_Document, op_GetAttributesFrmAct, Document_GetAttributesFrmAct_Execute, Document_GetAttributesFrmAct_Test, nil);
  PublishOpWithResult(en_Loadable, op_Load, Loadable_Load, nil, nil);
  PublishOp(en_Document, op_GetRelatedDocFrmAct, Document_GetRelatedDocFrmAct_Execute, Document_GetRelatedDocFrmAct_Test, nil);
  PublishOp(en_Document, op_GetCorrespondentList, Document_GetCorrespondentList_Execute, Document_GetCorrespondentList_Test, nil);
  PublishOp(en_Document, op_GetRespondentList, Document_GetRespondentList_Execute, Document_GetRespondentList_Test, nil);
  PublishOpWithResult(en_Document, op_AttributesCanBeClosed, Document_AttributesCanBeClosed, nil, nil);
  PublishOpWithResult(en_Document, op_CommonDocumentOpenNewWindow, Document_CommonDocumentOpenNewWindow, nil, nil);
  PublishOpWithResult(en_System, op_TimeMachineStateChange, System_TimeMachineStateChange, nil, nil, true);
  PublishOpWithResult(en_Redactions, op_RedactionOnID, Redactions_RedactionOnID, nil, nil);
  PublishOpWithResult(en_Document, op_FindExplanation, Document_FindExplanation, nil, nil);
  PublishOp(en_Selection, op_FindInDict, Selection_FindInDict_Execute, Selection_FindInDict_Test, nil);
  PublishOpWithResult(en_Document, op_SetPosition, Document_SetPosition, nil, nil);
  PublishOpWithResult(en_Document, op_SetActive, Document_SetActive, nil, nil);
  PublishOpWithResult(en_Document, op_ExportBlock, Document_ExportBlock, nil, nil);
  PublishOpWithResult(en_Document, op_GetCurrentPosition, Document_GetCurrentPosition, Document_GetCurrentPosition_Test, nil);
  PublishOpWithResult(en_Document, op_SelectBlock, Document_SelectBlock, nil, nil);
  PublishOpWithResult(en_Document, op_CopyBlock, Document_CopyBlock, nil, nil);
  PublishOpWithResult(en_Document, op_PrintBlock, Document_PrintBlock, nil, nil);
  PublishOpWithResult(en_Document, op_PrintDialogBlock, Document_PrintDialogBlock, nil, nil);
  PublishOpWithResult(en_Document, op_PreviewBlock, Document_PreviewBlock, nil, nil);
  PublishOpWithResult(en_Document, op_ShowRespondentListToPart, Document_ShowRespondentListToPart, nil, nil);
  PublishOpWithResult(en_Document, op_ShowCorrespondentListToPart, Document_ShowCorrespondentListToPart, nil, nil);
  PublishOpWithResult(en_Document, op_ModifyBookmarkNotify, Document_ModifyBookmarkNotify, nil, nil);
  PublishOpWithResult(en_Document, op_AddBookmarkFromContents, Document_AddBookmarkFromContents, nil, nil);
  PublishOp(en_Document, op_GetCorrespondentListExFrmAct, Document_GetCorrespondentListExFrmAct_Execute, Document_GetCorrespondentListExFrmAct_Test, nil);
  PublishOp(en_Document, op_GetRespondentListExFrmAct, Document_GetRespondentListExFrmAct_Execute, Document_GetRespondentListExFrmAct_Test, nil);
  PublishOpWithResult(en_TimeMachine, op_TimeMachineOnOff, TimeMachine_TimeMachineOnOff, TimeMachine_TimeMachineOnOff_Test, nil);
  PublishOpWithResult(en_TimeMachine, op_TimeMachineOffAndReset, TimeMachine_TimeMachineOffAndReset, TimeMachine_TimeMachineOffAndReset_Test, nil);
  PublishOpWithResult(en_Document, op_OpenNotSureTopic, Document_OpenNotSureTopic, nil, nil);
  PublishOp(en_Redactions, op_ActualRedaction, Redactions_ActualRedaction_Execute, Redactions_ActualRedaction_Test, nil);
  PublishOp(en_Edit, op_ToggleFoundWords, Edit_ToggleFoundWords_Execute, Edit_ToggleFoundWords_Test, nil);
  PublishOpWithResult(en_Document, op_GotoPara, Document_GotoPara, nil, nil);
  PublishOp(en_TimeMachine, op_TimeMachineOnOffNew, TimeMachine_TimeMachineOnOffNew_Execute, TimeMachine_TimeMachineOnOffNew_Test, TimeMachine_TimeMachineOnOffNew_GetState);
  PublishOp(en_Redactions, op_OpenRedactionListFrmAct, Redactions_OpenRedactionListFrmAct_Execute, Redactions_OpenRedactionListFrmAct_Test, Redactions_OpenRedactionListFrmAct_GetState);
  PublishOpWithResult(en_Document, op_GetParaForPositionning, Document_GetParaForPositionning, Document_GetParaForPositionning_Test, nil);
  PublishOp(en_DocumentBlock, op_GetCorrespondentList, DocumentBlock_GetCorrespondentList_Execute, DocumentBlock_GetCorrespondentList_Test, nil);
  PublishOp(en_DocumentBlock, op_GetRespondentList, DocumentBlock_GetRespondentList_Execute, DocumentBlock_GetRespondentList_Test, nil);
  PublishOp(en_DocumentBlock, op_GetTypedCorrespondentList, DocumentBlock_GetTypedCorrespondentList_Execute, DocumentBlock_GetTypedCorrespondentList_Test, DocumentBlock_GetTypedCorrespondentList_GetState);
  PublishOp(en_DocumentBlock, op_GetTypedRespondentList, DocumentBlock_GetTypedRespondentList_Execute, DocumentBlock_GetTypedRespondentList_Test, nil);
  PublishOp(en_Document, op_GetAnnotationDocFrmAct, Document_GetAnnotationDocFrmAct_Execute, Document_GetAnnotationDocFrmAct_Test, nil);
  PublishOp(en_Document, op_SimilarDocuments, Document_SimilarDocuments_Execute, Document_SimilarDocuments_Test, nil);
  PublishOp(en_DocumentBlockHeader, op_UserCR1, DocumentBlockHeader_UserCR1_Execute, DocumentBlockHeader_UserCR1_Test, DocumentBlockHeader_UserCR1_GetState);
  PublishOp(en_DocumentBlockHeader, op_UserCR2, DocumentBlockHeader_UserCR2_Execute, DocumentBlockHeader_UserCR2_Test, DocumentBlockHeader_UserCR2_GetState);
  PublishOp(en_DocumentBlockHeader, op_GetTypedCorrespondentList, DocumentBlockHeader_GetTypedCorrespondentList_Execute, DocumentBlockHeader_GetTypedCorrespondentList_Test, nil);
  PublishOp(en_Redactions, op_PrevRedaction, Redactions_PrevRedaction_Execute, Redactions_PrevRedaction_Test, nil);
  PublishOp(en_Redactions, op_NextRedaction, Redactions_NextRedaction_Execute, Redactions_NextRedaction_Test, nil);
  PublishOp(en_Text, op_AddToControl, Text_AddToControl_Execute, Text_AddToControl_Test, Text_AddToControl_GetState);
  PublishOp(en_Selection, op_ShowCorrespondentListToPart, Selection_ShowCorrespondentListToPart_Execute, Selection_ShowCorrespondentListToPart_Test, nil);
  PublishOp(en_Selection, op_ShowRespondentListToPart, Selection_ShowRespondentListToPart_Execute, Selection_ShowRespondentListToPart_Test, nil);
  PublishOp(en_WarnOnControl, op_ClearStatusSettings, WarnOnControl_ClearStatusSettings_Execute, WarnOnControl_ClearStatusSettings_Test, nil);
  PublishOp(en_TasksPanel, op_TimeMachineOnOff, TasksPanel_TimeMachineOnOff_Execute, TasksPanel_TimeMachineOnOff_Test, TasksPanel_TimeMachineOnOff_GetState);
  PublishOp(en_DocumentBlockHeader, op_AddBookmark, DocumentBlockHeader_AddBookmark_Execute, DocumentBlockHeader_AddBookmark_Test, nil);
  PublishOp(en_DocumentBlockHeader, op_ToMSWord, DocumentBlockHeader_ToMSWord_Execute, DocumentBlockHeader_ToMSWord_Test, nil);
  PublishOp(en_DocumentBlockHeader, op_Print, DocumentBlockHeader_Print_Execute, DocumentBlockHeader_Print_Test, nil);
  PublishOp(en_DocumentBlockHeader, op_PrintDialog, DocumentBlockHeader_PrintDialog_Execute, DocumentBlockHeader_PrintDialog_Test, nil);
  PublishOp(en_DocumentBlockBookmarks, op_AddBookmark, DocumentBlockBookmarks_AddBookmark_Execute, DocumentBlockBookmarks_AddBookmark_Test, nil);
  PublishOp(en_DocumentBlock, op_ToMSWord, DocumentBlock_ToMSWord_Execute, DocumentBlock_ToMSWord_Test, nil);
  PublishOp(en_DocumentBlock, op_PrintDialog, DocumentBlock_PrintDialog_Execute, DocumentBlock_PrintDialog_Test, nil);
  PublishOp(en_DocumentBlock, op_Copy, DocumentBlock_Copy_Execute, DocumentBlock_Copy_Test, nil);
  PublishOp(en_DocumentBlock, op_Print, DocumentBlock_Print_Execute, DocumentBlock_Print_Test, nil);
  PublishOp(en_Document, op_OpenContentsFrmAct, Document_OpenContentsFrmAct_Execute, Document_OpenContentsFrmAct_Test, Document_OpenContentsFrmAct_GetState);
  PublishOp(en_Document, op_ShowDocumentPicture, Document_ShowDocumentPicture_Execute, Document_ShowDocumentPicture_Test, nil);
  PublishOp(en_ExternalObject, op_Open, ExternalObject_Open_Execute, ExternalObject_Open_Test, nil);
  PublishOp(en_ExternalObject, op_Save, ExternalObject_Save_Execute, ExternalObject_Save_Test, nil);
  PublishOp(en_WarnRedaction, op_OpenActualRedaction, WarnRedaction_OpenActualRedaction_Execute, WarnRedaction_OpenActualRedaction_Test, nil, true);
  PublishOp(en_WarnTimeMachine, op_ShowInfo, WarnTimeMachine_ShowInfo_Execute, WarnTimeMachine_ShowInfo_Test, WarnTimeMachine_ShowInfo_GetState);
  PublishOp(en_WarnTimeMachine, op_TimeMachineOnOffNew, WarnTimeMachine_TimeMachineOnOffNew_Execute, WarnTimeMachine_TimeMachineOnOffNew_Test, WarnTimeMachine_TimeMachineOnOffNew_GetState);
  PublishOp(en_WarnJuror, op_ShowInfo, WarnJuror_ShowInfo_Execute, WarnJuror_ShowInfo_Test, WarnJuror_ShowInfo_GetState, true);
  PublishOp(en_WarnOnControl, op_ShowChanges, WarnOnControl_ShowChanges_Execute, WarnOnControl_ShowChanges_Test, nil);
  PublishOp(en_WarnOnControl, op_ClearStatus, WarnOnControl_ClearStatus_Execute, WarnOnControl_ClearStatus_Test, nil);
  PublishOp(en_UserCommentIcon, op_Delete, nil, nil, nil);
  PublishOp(en_UserCommentIcon, op_HideShow, nil, nil, UserCommentIcon_HideShow_GetState);
  PublishOp(en_UserComment, op_Delete, UserComment_Delete_Execute, UserComment_Delete_Test, nil);
  PublishOp(en_Text, op_AddUserComment, Text_AddUserComment_Execute, Text_AddUserComment_Test, nil);
  PublishOp(en_Document, op_GetGraphicImage, Document_GetGraphicImage_Execute, Document_GetGraphicImage_Test, nil);
  PublishOp(en_Document, op_DocumentSynchroOpenWindow, Document_DocumentSynchroOpenWindow_Execute, Document_DocumentSynchroOpenWindow_Test, nil, true);
  PublishOp(en_Document, op_DocumentSynchroOpenNewWindow, Document_DocumentSynchroOpenNewWindow_Execute, Document_DocumentSynchroOpenNewWindow_Test, nil, true);
  PublishOp(en_Document, op_DictListOpenFrmAct, Document_DictListOpenFrmAct_Execute, Document_DictListOpenFrmAct_Test, nil);
  PublishOp(en_Document, op_GotoBookmark, Document_GotoBookmark_Execute, Document_GotoBookmark_Test, nil);
  PublishOp(en_Document, op_LiteratureListForDictionary, Document_LiteratureListForDictionary_Execute, Document_LiteratureListForDictionary_Test, nil);
  PublishOp(en_Text, op_EditBookmark, Text_EditBookmark_Execute, Text_EditBookmark_Test, nil);
  PublishOp(en_Text, op_DeleteBookmark, Text_DeleteBookmark_Execute, Text_DeleteBookmark_Test, nil);
  PublishOp(en_Text, op_AddBookmark, Text_AddBookmark_Execute, Text_AddBookmark_Test, nil);
  PublishOp(en_Text, op_OpenNewWindow, Text_OpenNewWindow_Execute, Text_OpenNewWindow_Test, nil);
  PublishOp(en_Document, op_OpenProducedDrugList, Document_OpenProducedDrugList_Execute, Document_OpenProducedDrugList_Test, nil);
  PublishOp(en_Document, op_OpenSimilarDrugList, Document_OpenSimilarDrugList_Execute, Document_OpenSimilarDrugList_Test, nil);
  PublishOp(en_Selection, op_InsertHyperlink, Selection_InsertHyperlink_Execute, Selection_InsertHyperlink_Test, Selection_InsertHyperlink_GetState, true);
  PublishOp(en_WarnRedaction, op_ShowInfo, WarnRedaction_ShowInfo_Execute, WarnRedaction_ShowInfo_Test, WarnRedaction_ShowInfo_GetState, true);
  PublishOp(en_DocumentBlock, op_PrintPreview, DocumentBlock_PrintPreview_Execute, DocumentBlock_PrintPreview_Test, nil);
  ShowInContextMenu(en_DocumentBlock, op_PrintPreview, true);
  ShowInToolbar(en_DocumentBlock, op_PrintPreview, false);
  PublishOp(en_DocumentBlock, op_Select, DocumentBlock_Select_Execute, DocumentBlock_Select_Test, nil);
  ShowInContextMenu(en_DocumentBlock, op_Select, true);
  ShowInToolbar(en_DocumentBlock, op_Select, false);
  PublishOp(en_Document, op_ViewChangedFragments, Document_ViewChangedFragments_Execute, Document_ViewChangedFragments_Test, nil);
  ShowInContextMenu(en_Document, op_ViewChangedFragments, false);
  ShowInToolbar(en_Document, op_ViewChangedFragments, true);
  PublishOpWithResult(en_DocumentSubPanel, op_UpdateSubPanel, DocumentSubPanel_UpdateSubPanel, nil, nil);
  PublishOp(en_IntranetSourcePoint, op_GoToIntranet, IntranetSourcePoint_GoToIntranet_Execute, nil, nil);
  ShowInContextMenu(en_IntranetSourcePoint, op_GoToIntranet, false);
  ShowInToolbar(en_IntranetSourcePoint, op_GoToIntranet, false);
  PublishOp(en_Picture, op_Open, Picture_Open_Execute, Picture_Open_Test, nil);
  PublishOp(en_Picture, op_OpenNewWindow, Picture_OpenNewWindow_Execute, Picture_OpenNewWindow_Test, nil);
  PublishOpWithResult(en_BaseSearchPresentationHolder, op_GetBaseSearchPresentation, BaseSearchPresentationHolder_GetBaseSearchPresentation, nil, nil);
 end;//with Entities.Entities
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_File, op_SaveToFolder, false);
 AddUserTypeExclude(dftTipsName, en_File, op_SaveToFolder, false);
 AddUserTypeExclude(dftAutoreferatName, en_File, op_SaveToFolder, false);
 AddUserTypeExclude(dftRelatedDocName, en_File, op_SaveToFolder, false);
 AddUserTypeExclude(dftAnnotationName, en_File, op_SaveToFolder, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_File, op_SaveToFolder, false);
 AddUserTypeExclude(dftDictSubEntryName, en_File, op_SaveToFolder, false);
 AddUserTypeExclude(dftConsultationName, en_File, op_SaveToFolder, false);
 AddUserTypeExclude(dftTranslationName, en_File, op_SaveToFolder, false);
 AddUserTypeExclude(dftDocSynchroViewName, en_File, op_LoadFromFolder, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_File, op_LoadFromFolder, false);
 AddUserTypeExclude(dftRelatedDocName, en_File, op_LoadFromFolder, false);
 AddUserTypeExclude(dftAnnotationName, en_File, op_LoadFromFolder, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_File, op_LoadFromFolder, false);
 AddUserTypeExclude(dftDictSubEntryName, en_File, op_LoadFromFolder, false);
 AddUserTypeExclude(dftConsultationName, en_File, op_LoadFromFolder, false);
 AddUserTypeExclude(dftTranslationName, en_File, op_LoadFromFolder, false);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_File, op_LoadFromFolder, false);
 AddUserTypeExclude(dftDrugSynchroViewName, en_File, op_LoadFromFolder, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_Edit, op_Paste, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_Edit, op_Undo, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_Edit, op_Redo, false);
 AddUserTypeExclude(dftConsultationName, en_Edit, op_Paste, false);
 AddUserTypeExclude(dftConsultationName, en_Edit, op_Undo, false);
 AddUserTypeExclude(dftConsultationName, en_Edit, op_Redo, false);
 AddUserTypeExclude(dftAutoreferatName, en_Edit, op_Paste, false);
 AddUserTypeExclude(dftAutoreferatName, en_Edit, op_Undo, false);
 AddUserTypeExclude(dftAutoreferatName, en_Edit, op_Redo, false);
 AddUserTypeExclude(dftConsultationName, en_Edit, op_Cut, false);
 AddUserTypeExclude(dftConsultationName, en_Document, op_AttributesCanBeClosed, false);
 AddUserTypeExclude(dftConsultationName, en_Document, op_CommonDocumentOpenNewWindow, false);
 AddUserTypeExclude(dftConsultationName, en_Document, op_FindExplanation, false);
 AddUserTypeExclude(dftConsultationName, en_Selection, op_FindInDict, false);
 AddUserTypeExclude(dftConsultationName, en_Document, op_SetPosition, false);
 AddUserTypeExclude(dftConsultationName, en_Document, op_ShowRespondentListToPart, false);
 AddUserTypeExclude(dftConsultationName, en_Document, op_ShowCorrespondentListToPart, false);
 AddUserTypeExclude(dftConsultationName, en_Document, op_ModifyBookmarkNotify, false);
 AddUserTypeExclude(dftConsultationName, en_Document, op_OpenNotSureTopic, false);
 AddUserTypeExclude(dftConsultationName, en_ExternalObject, op_Open, false);
 AddUserTypeExclude(dftConsultationName, en_ExternalObject, op_Save, false);
 AddUserTypeExclude(dftConsultationName, en_WarnRedaction, op_OpenActualRedaction, true);
 AddUserTypeExclude(dftConsultationName, en_WarnTimeMachine, op_ShowInfo, false);
 AddUserTypeExclude(dftConsultationName, en_WarnJuror, op_ShowInfo, true);
 AddUserTypeExclude(dftConsultationName, en_WarnOnControl, op_ShowChanges, false);
 AddUserTypeExclude(dftConsultationName, en_WarnOnControl, op_ClearStatus, false);
 AddUserTypeExclude(dftConsultationName, en_Table, op_Insert, false);
 AddUserTypeExclude(dftConsultationName, en_Table, op_InsertRow, false);
 AddUserTypeExclude(dftConsultationName, en_Table, op_DeleteRow, false);
 AddUserTypeExclude(dftConsultationName, en_Table, op_InsertColumn, false);
 AddUserTypeExclude(dftConsultationName, en_Table, op_DeleteColumn, false);
 AddUserTypeExclude(dftConsultationName, en_Font, op_Bold, false);
 AddUserTypeExclude(dftConsultationName, en_Font, op_Italic, false);
 AddUserTypeExclude(dftConsultationName, en_Font, op_Underline, false);
 AddUserTypeExclude(dftConsultationName, en_Font, op_Strikeout, false);
 AddUserTypeExclude(dftConsultationName, en_Selection, op_InsertHyperlink, true);
 AddUserTypeExclude(dftConsultationName, en_WarnRedaction, op_ShowInfo, true);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_Edit, op_FindContext, false);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_Edit, op_FindNext, false);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_Edit, op_FindPrev, false);
 AddUserTypeExclude(dftDrugSynchroViewName, en_Edit, op_FindContext, false);
 AddUserTypeExclude(dftDrugSynchroViewName, en_Edit, op_FindNext, false);
 AddUserTypeExclude(dftDrugSynchroViewName, en_Edit, op_FindPrev, false);
 AddUserTypeExclude(dftConsultationName, en_UserCommentIcon, op_HideShow, false);
 AddUserTypeExclude(dftTipsName, en_UserCommentIcon, op_HideShow, false);
 AddUserTypeExclude(dftDictEntryName, en_Redactions, op_RedactionOnID, false);
 AddUserTypeExclude(dftDictSubEntryName, en_Redactions, op_RedactionOnID, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_Redactions, op_RedactionOnID, false);
 AddUserTypeExclude(dftTipsName, en_Redactions, op_RedactionOnID, false);
 AddUserTypeExclude(dftMedDictEntryName, en_Redactions, op_RedactionOnID, false);
 AddUserTypeExclude(dftAutoreferatName, en_Redactions, op_RedactionOnID, false);
 AddUserTypeExclude(dftDrugName, en_Redactions, op_RedactionOnID, false);
 AddUserTypeExclude(dftMedicFirmName, en_Redactions, op_RedactionOnID, false);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_Redactions, op_RedactionOnID, false);
 AddUserTypeExclude(dftDrugSynchroViewName, en_Redactions, op_RedactionOnID, false);
 AddUserTypeExclude(dftRelatedDocName, en_Document, op_GetAttributesFrmAct, false);
 AddUserTypeExclude(dftAnnotationName, en_Document, op_GetAttributesFrmAct, false);
 AddUserTypeExclude(dftDocSynchroViewName, en_Document, op_GetAttributesFrmAct, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_Document, op_GetAttributesFrmAct, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_Document, op_GetAttributesFrmAct, false);
 AddUserTypeExclude(dftDictSubEntryName, en_Document, op_GetAttributesFrmAct, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_Document, op_GetAttributesFrmAct, false);
 AddUserTypeExclude(dftConsultationName, en_Document, op_GetAttributesFrmAct, false);
 AddUserTypeExclude(dftTranslationName, en_Document, op_GetAttributesFrmAct, false);
 AddUserTypeExclude(dftAutoreferatName, en_Document, op_GetAttributesFrmAct, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_Document, op_ShowJurorComments, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_Document, op_ShowVersionComments, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_Document, op_ShowTechComments, false);
 AddUserTypeExclude(dftDictEntryName, en_Document, op_ShowJurorComments, false);
 AddUserTypeExclude(dftDictEntryName, en_Document, op_ShowVersionComments, false);
 AddUserTypeExclude(dftDictEntryName, en_Document, op_ShowTechComments, false);
 AddUserTypeExclude(dftDictSubEntryName, en_Document, op_ShowJurorComments, false);
 AddUserTypeExclude(dftDictSubEntryName, en_Document, op_ShowVersionComments, false);
 AddUserTypeExclude(dftDictSubEntryName, en_Document, op_ShowTechComments, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_Document, op_ShowJurorComments, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_Document, op_ShowVersionComments, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_Document, op_ShowTechComments, false);
 AddUserTypeExclude(dftConsultationName, en_Document, op_ShowJurorComments, false);
 AddUserTypeExclude(dftConsultationName, en_Document, op_ShowVersionComments, false);
 AddUserTypeExclude(dftConsultationName, en_Document, op_ShowTechComments, false);
 AddUserTypeExclude(dftTipsName, en_Document, op_ShowJurorComments, false);
 AddUserTypeExclude(dftTipsName, en_Document, op_ShowVersionComments, false);
 AddUserTypeExclude(dftTipsName, en_Document, op_ShowTechComments, false);
 AddUserTypeExclude(dftMedDictEntryName, en_Document, op_ShowJurorComments, false);
 AddUserTypeExclude(dftMedDictEntryName, en_Document, op_ShowVersionComments, false);
 AddUserTypeExclude(dftMedDictEntryName, en_Document, op_ShowTechComments, false);
 AddUserTypeExclude(dftAutoreferatName, en_Document, op_ShowJurorComments, false);
 AddUserTypeExclude(dftAutoreferatName, en_Document, op_ShowVersionComments, false);
 AddUserTypeExclude(dftAutoreferatName, en_Document, op_ShowTechComments, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_Document, op_ShowUserComments, false);
 AddUserTypeExclude(dftConsultationName, en_Document, op_ShowUserComments, false);
 AddUserTypeExclude(dftTipsName, en_Document, op_ShowUserComments, false);
 AddUserTypeExclude(dftTipsName, en_BookmarkIcon, op_Delete, false);
 AddUserTypeExclude(dftTipsName, en_BookmarkIcon, op_Edit, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_UserCommentIcon, op_Delete, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_UserComment, op_Delete, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_Text, op_AddUserComment, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_HyperLink, op_Delete, true);
 AddUserTypeExclude(dftAutoreferatName, en_UserCommentIcon, op_Delete, false);
 AddUserTypeExclude(dftAutoreferatName, en_UserComment, op_Delete, false);
 AddUserTypeExclude(dftAutoreferatName, en_Text, op_AddUserComment, false);
 AddUserTypeExclude(dftAutoreferatName, en_HyperLink, op_Delete, true);
 AddUserTypeExclude(dftConsultationName, en_UserCommentIcon, op_Delete, false);
 AddUserTypeExclude(dftConsultationName, en_UserComment, op_Delete, false);
 AddUserTypeExclude(dftConsultationName, en_Text, op_AddUserComment, false);
 AddUserTypeExclude(dftConsultationName, en_HyperLink, op_Delete, true);
 AddUserTypeExclude(dftTipsName, en_UserCommentIcon, op_Delete, false);
 AddUserTypeExclude(dftTipsName, en_UserComment, op_Delete, false);
 AddUserTypeExclude(dftTipsName, en_Text, op_AddUserComment, false);
 AddUserTypeExclude(dftTipsName, en_HyperLink, op_Delete, true);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_Selection, op_InsertHyperlink, true);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_Selection, op_InsertHyperlink, true);
 AddUserTypeExclude(dftTipsName, en_Selection, op_InsertHyperlink, true);
 AddUserTypeExclude(dftAutoreferatName, en_Selection, op_InsertHyperlink, true);
 AddUserTypeExclude(dftRelatedDocName, en_Document, op_GotoBookmark, false);
 AddUserTypeExclude(dftAnnotationName, en_Document, op_GotoBookmark, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_Document, op_GotoBookmark, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_Document, op_GotoBookmark, false);
 AddUserTypeExclude(dftDictSubEntryName, en_Document, op_GotoBookmark, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_Document, op_GotoBookmark, false);
 AddUserTypeExclude(dftConsultationName, en_Document, op_GotoBookmark, false);
 AddUserTypeExclude(dftTranslationName, en_Document, op_GotoBookmark, false);
 AddUserTypeExclude(dftTipsName, en_Document, op_GotoBookmark, false);
 AddUserTypeExclude(dftAutoreferatName, en_Document, op_GotoBookmark, false);
 AddUserTypeExclude(dftDictSubEntryName, en_Document, op_AddBookmark, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_Document, op_AddBookmark, false);
 AddUserTypeExclude(dftConsultationName, en_Document, op_AddBookmark, false);
 AddUserTypeExclude(dftTipsName, en_Document, op_AddBookmark, false);
 AddUserTypeExclude(dftAutoreferatName, en_Document, op_AddBookmark, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_Document, op_ShowCommentsGroup, false);
 AddUserTypeExclude(dftConsultationName, en_Document, op_ShowCommentsGroup, false);
 AddUserTypeExclude(dftRelatedDocName, en_Document, op_CompareEditions, false);
 AddUserTypeExclude(dftAnnotationName, en_Document, op_CompareEditions, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_Document, op_CompareEditions, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_Document, op_CompareEditions, false);
 AddUserTypeExclude(dftDictSubEntryName, en_Document, op_CompareEditions, false);
 AddUserTypeExclude(dftConsultationName, en_Document, op_CompareEditions, false);
 AddUserTypeExclude(dftTranslationName, en_Document, op_CompareEditions, false);
 AddUserTypeExclude(dftTipsName, en_Document, op_CompareEditions, false);
 AddUserTypeExclude(dftAutoreferatName, en_Document, op_CompareEditions, false);
 AddUserTypeExclude(dftDictSubEntryName, en_Text, op_EditBookmark, false);
 AddUserTypeExclude(dftDictSubEntryName, en_Text, op_DeleteBookmark, false);
 AddUserTypeExclude(dftDictSubEntryName, en_Text, op_AddBookmark, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_Text, op_EditBookmark, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_Text, op_DeleteBookmark, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_Text, op_AddBookmark, false);
 AddUserTypeExclude(dftConsultationName, en_Text, op_EditBookmark, false);
 AddUserTypeExclude(dftConsultationName, en_Text, op_DeleteBookmark, false);
 AddUserTypeExclude(dftConsultationName, en_Text, op_AddBookmark, false);
 AddUserTypeExclude(dftTipsName, en_Text, op_EditBookmark, false);
 AddUserTypeExclude(dftTipsName, en_Text, op_DeleteBookmark, false);
 AddUserTypeExclude(dftTipsName, en_Text, op_AddBookmark, false);
 AddUserTypeExclude(dftAutoreferatName, en_Text, op_EditBookmark, false);
 AddUserTypeExclude(dftAutoreferatName, en_Text, op_DeleteBookmark, false);
 AddUserTypeExclude(dftAutoreferatName, en_Text, op_AddBookmark, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_Text, op_OpenNewWindow, false);
 AddUserTypeExclude(dftConsultationName, en_Text, op_OpenNewWindow, false);
 AddUserTypeExclude(dftAutoreferatName, en_Text, op_OpenNewWindow, false);
 AddUserTypeExclude(dftAACContentsLeftName, en_Document, op_GetAttributesFrmAct, false);
 AddUserTypeExclude(dftAACContentsLeftName, en_Document, op_GetRelatedDocFrmAct, false);
 AddUserTypeExclude(dftAACContentsLeftName, en_Document, op_GetCorrespondentList, false);
 AddUserTypeExclude(dftAACContentsLeftName, en_Document, op_GetRespondentList, false);
 AddUserTypeExclude(dftAACContentsLeftName, en_Document, op_GetCorrespondentListExFrmAct, false);
 AddUserTypeExclude(dftAACContentsLeftName, en_Document, op_GetRespondentListExFrmAct, false);
 AddUserTypeExclude(dftAACContentsRightName, en_Document, op_GetAttributesFrmAct, false);
 AddUserTypeExclude(dftAACContentsRightName, en_Document, op_GetRelatedDocFrmAct, false);
 AddUserTypeExclude(dftAACContentsRightName, en_Document, op_GetCorrespondentList, false);
 AddUserTypeExclude(dftAACContentsRightName, en_Document, op_GetRespondentList, false);
 AddUserTypeExclude(dftAACContentsRightName, en_Document, op_GetCorrespondentListExFrmAct, false);
 AddUserTypeExclude(dftAACContentsRightName, en_Document, op_GetRespondentListExFrmAct, false);
 AddUserTypeExclude(dftRelatedDocName, en_Document, op_AddToControl, false);
 AddUserTypeExclude(dftDocSynchroViewName, en_Document, op_AddToControl, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_Document, op_AddToControl, false);
 AddUserTypeExclude(dftDictEntryName, en_Document, op_AddToControl, false);
 AddUserTypeExclude(dftDictSubEntryName, en_Document, op_AddToControl, false);
 AddUserTypeExclude(dftAnnotationName, en_Document, op_AddToControl, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_Document, op_AddToControl, false);
 AddUserTypeExclude(dftConsultationName, en_Document, op_AddToControl, false);
 AddUserTypeExclude(dftTranslationName, en_Document, op_AddToControl, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_Document, op_AddToControl, false);
 AddUserTypeExclude(dftTipsName, en_Document, op_AddToControl, false);
 AddUserTypeExclude(dftMedDictEntryName, en_Document, op_AddToControl, false);
 AddUserTypeExclude(dftAutoreferatName, en_Document, op_AddToControl, false);
 AddUserTypeExclude(dftDrugName, en_Document, op_AddToControl, false);
 AddUserTypeExclude(dftMedicFirmName, en_Document, op_AddToControl, false);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_Document, op_AddToControl, false);
 AddUserTypeExclude(dftDrugSynchroViewName, en_Document, op_AddToControl, false);
 AddUserTypeExclude(dftRelatedDocName, en_Document, op_GetRelatedDocFrmAct, false);
 AddUserTypeExclude(dftDocSynchroViewName, en_Document, op_GetRelatedDocFrmAct, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_Document, op_GetRelatedDocFrmAct, false);
 AddUserTypeExclude(dftDictEntryName, en_Document, op_GetRelatedDocFrmAct, false);
 AddUserTypeExclude(dftDictSubEntryName, en_Document, op_GetRelatedDocFrmAct, false);
 AddUserTypeExclude(dftAnnotationName, en_Document, op_GetRelatedDocFrmAct, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_Document, op_GetRelatedDocFrmAct, false);
 AddUserTypeExclude(dftConsultationName, en_Document, op_GetRelatedDocFrmAct, false);
 AddUserTypeExclude(dftTranslationName, en_Document, op_GetRelatedDocFrmAct, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_Document, op_GetRelatedDocFrmAct, false);
 AddUserTypeExclude(dftTipsName, en_Document, op_GetRelatedDocFrmAct, false);
 AddUserTypeExclude(dftMedDictEntryName, en_Document, op_GetRelatedDocFrmAct, false);
 AddUserTypeExclude(dftAutoreferatName, en_Document, op_GetRelatedDocFrmAct, false);
 AddUserTypeExclude(dftDrugName, en_Document, op_GetRelatedDocFrmAct, false);
 AddUserTypeExclude(dftMedicFirmName, en_Document, op_GetRelatedDocFrmAct, false);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_Document, op_GetRelatedDocFrmAct, false);
 AddUserTypeExclude(dftDrugSynchroViewName, en_Document, op_GetRelatedDocFrmAct, false);
 AddUserTypeExclude(dftRelatedDocName, en_Document, op_UserCR1, false);
 AddUserTypeExclude(dftDocSynchroViewName, en_Document, op_UserCR1, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_Document, op_UserCR1, false);
 AddUserTypeExclude(dftDictEntryName, en_Document, op_UserCR1, false);
 AddUserTypeExclude(dftDictSubEntryName, en_Document, op_UserCR1, false);
 AddUserTypeExclude(dftAnnotationName, en_Document, op_UserCR1, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_Document, op_UserCR1, false);
 AddUserTypeExclude(dftConsultationName, en_Document, op_UserCR1, false);
 AddUserTypeExclude(dftTranslationName, en_Document, op_UserCR1, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_Document, op_UserCR1, false);
 AddUserTypeExclude(dftTipsName, en_Document, op_UserCR1, false);
 AddUserTypeExclude(dftMedDictEntryName, en_Document, op_UserCR1, false);
 AddUserTypeExclude(dftAutoreferatName, en_Document, op_UserCR1, false);
 AddUserTypeExclude(dftDrugName, en_Document, op_UserCR1, false);
 AddUserTypeExclude(dftMedicFirmName, en_Document, op_UserCR1, false);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_Document, op_UserCR1, false);
 AddUserTypeExclude(dftDrugSynchroViewName, en_Document, op_UserCR1, false);
 AddUserTypeExclude(dftRelatedDocName, en_Document, op_UserCR2, false);
 AddUserTypeExclude(dftDocSynchroViewName, en_Document, op_UserCR2, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_Document, op_UserCR2, false);
 AddUserTypeExclude(dftDictEntryName, en_Document, op_UserCR2, false);
 AddUserTypeExclude(dftDictSubEntryName, en_Document, op_UserCR2, false);
 AddUserTypeExclude(dftAnnotationName, en_Document, op_UserCR2, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_Document, op_UserCR2, false);
 AddUserTypeExclude(dftConsultationName, en_Document, op_UserCR2, false);
 AddUserTypeExclude(dftTranslationName, en_Document, op_UserCR2, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_Document, op_UserCR2, false);
 AddUserTypeExclude(dftTipsName, en_Document, op_UserCR2, false);
 AddUserTypeExclude(dftMedDictEntryName, en_Document, op_UserCR2, false);
 AddUserTypeExclude(dftAutoreferatName, en_Document, op_UserCR2, false);
 AddUserTypeExclude(dftDrugName, en_Document, op_UserCR2, false);
 AddUserTypeExclude(dftMedicFirmName, en_Document, op_UserCR2, false);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_Document, op_UserCR2, false);
 AddUserTypeExclude(dftDrugSynchroViewName, en_Document, op_UserCR2, false);
 AddUserTypeExclude(dftRelatedDocName, en_Document, op_GetCorrespondentList, false);
 AddUserTypeExclude(dftDocSynchroViewName, en_Document, op_GetCorrespondentList, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_Document, op_GetCorrespondentList, false);
 AddUserTypeExclude(dftDictEntryName, en_Document, op_GetCorrespondentList, false);
 AddUserTypeExclude(dftDictSubEntryName, en_Document, op_GetCorrespondentList, false);
 AddUserTypeExclude(dftAnnotationName, en_Document, op_GetCorrespondentList, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_Document, op_GetCorrespondentList, false);
 AddUserTypeExclude(dftConsultationName, en_Document, op_GetCorrespondentList, false);
 AddUserTypeExclude(dftTranslationName, en_Document, op_GetCorrespondentList, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_Document, op_GetCorrespondentList, false);
 AddUserTypeExclude(dftTipsName, en_Document, op_GetCorrespondentList, false);
 AddUserTypeExclude(dftMedDictEntryName, en_Document, op_GetCorrespondentList, false);
 AddUserTypeExclude(dftAutoreferatName, en_Document, op_GetCorrespondentList, false);
 AddUserTypeExclude(dftDrugName, en_Document, op_GetCorrespondentList, false);
 AddUserTypeExclude(dftMedicFirmName, en_Document, op_GetCorrespondentList, false);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_Document, op_GetCorrespondentList, false);
 AddUserTypeExclude(dftDrugSynchroViewName, en_Document, op_GetCorrespondentList, false);
 AddUserTypeExclude(dftRelatedDocName, en_Document, op_GetRespondentList, false);
 AddUserTypeExclude(dftDocSynchroViewName, en_Document, op_GetRespondentList, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_Document, op_GetRespondentList, false);
 AddUserTypeExclude(dftDictEntryName, en_Document, op_GetRespondentList, false);
 AddUserTypeExclude(dftDictSubEntryName, en_Document, op_GetRespondentList, false);
 AddUserTypeExclude(dftAnnotationName, en_Document, op_GetRespondentList, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_Document, op_GetRespondentList, false);
 AddUserTypeExclude(dftConsultationName, en_Document, op_GetRespondentList, false);
 AddUserTypeExclude(dftTranslationName, en_Document, op_GetRespondentList, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_Document, op_GetRespondentList, false);
 AddUserTypeExclude(dftTipsName, en_Document, op_GetRespondentList, false);
 AddUserTypeExclude(dftMedDictEntryName, en_Document, op_GetRespondentList, false);
 AddUserTypeExclude(dftAutoreferatName, en_Document, op_GetRespondentList, false);
 AddUserTypeExclude(dftDrugName, en_Document, op_GetRespondentList, false);
 AddUserTypeExclude(dftMedicFirmName, en_Document, op_GetRespondentList, false);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_Document, op_GetRespondentList, false);
 AddUserTypeExclude(dftDrugSynchroViewName, en_Document, op_GetRespondentList, false);
 AddUserTypeExclude(dftRelatedDocName, en_Document, op_GetCorrespondentListExFrmAct, false);
 AddUserTypeExclude(dftDocSynchroViewName, en_Document, op_GetCorrespondentListExFrmAct, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_Document, op_GetCorrespondentListExFrmAct, false);
 AddUserTypeExclude(dftDictEntryName, en_Document, op_GetCorrespondentListExFrmAct, false);
 AddUserTypeExclude(dftDictSubEntryName, en_Document, op_GetCorrespondentListExFrmAct, false);
 AddUserTypeExclude(dftAnnotationName, en_Document, op_GetCorrespondentListExFrmAct, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_Document, op_GetCorrespondentListExFrmAct, false);
 AddUserTypeExclude(dftConsultationName, en_Document, op_GetCorrespondentListExFrmAct, false);
 AddUserTypeExclude(dftTranslationName, en_Document, op_GetCorrespondentListExFrmAct, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_Document, op_GetCorrespondentListExFrmAct, false);
 AddUserTypeExclude(dftTipsName, en_Document, op_GetCorrespondentListExFrmAct, false);
 AddUserTypeExclude(dftMedDictEntryName, en_Document, op_GetCorrespondentListExFrmAct, false);
 AddUserTypeExclude(dftAutoreferatName, en_Document, op_GetCorrespondentListExFrmAct, false);
 AddUserTypeExclude(dftDrugName, en_Document, op_GetCorrespondentListExFrmAct, false);
 AddUserTypeExclude(dftMedicFirmName, en_Document, op_GetCorrespondentListExFrmAct, false);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_Document, op_GetCorrespondentListExFrmAct, false);
 AddUserTypeExclude(dftDrugSynchroViewName, en_Document, op_GetCorrespondentListExFrmAct, false);
 AddUserTypeExclude(dftRelatedDocName, en_Document, op_GetRespondentListExFrmAct, false);
 AddUserTypeExclude(dftDocSynchroViewName, en_Document, op_GetRespondentListExFrmAct, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_Document, op_GetRespondentListExFrmAct, false);
 AddUserTypeExclude(dftDictEntryName, en_Document, op_GetRespondentListExFrmAct, false);
 AddUserTypeExclude(dftDictSubEntryName, en_Document, op_GetRespondentListExFrmAct, false);
 AddUserTypeExclude(dftAnnotationName, en_Document, op_GetRespondentListExFrmAct, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_Document, op_GetRespondentListExFrmAct, false);
 AddUserTypeExclude(dftConsultationName, en_Document, op_GetRespondentListExFrmAct, false);
 AddUserTypeExclude(dftTranslationName, en_Document, op_GetRespondentListExFrmAct, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_Document, op_GetRespondentListExFrmAct, false);
 AddUserTypeExclude(dftTipsName, en_Document, op_GetRespondentListExFrmAct, false);
 AddUserTypeExclude(dftMedDictEntryName, en_Document, op_GetRespondentListExFrmAct, false);
 AddUserTypeExclude(dftAutoreferatName, en_Document, op_GetRespondentListExFrmAct, false);
 AddUserTypeExclude(dftDrugName, en_Document, op_GetRespondentListExFrmAct, false);
 AddUserTypeExclude(dftMedicFirmName, en_Document, op_GetRespondentListExFrmAct, false);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_Document, op_GetRespondentListExFrmAct, false);
 AddUserTypeExclude(dftDrugSynchroViewName, en_Document, op_GetRespondentListExFrmAct, false);
 AddUserTypeExclude(dftRelatedDocName, en_TimeMachine, op_TimeMachineOnOff, false);
 AddUserTypeExclude(dftDocSynchroViewName, en_TimeMachine, op_TimeMachineOnOff, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_TimeMachine, op_TimeMachineOnOff, false);
 AddUserTypeExclude(dftDictEntryName, en_TimeMachine, op_TimeMachineOnOff, false);
 AddUserTypeExclude(dftDictSubEntryName, en_TimeMachine, op_TimeMachineOnOff, false);
 AddUserTypeExclude(dftAnnotationName, en_TimeMachine, op_TimeMachineOnOff, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_TimeMachine, op_TimeMachineOnOff, false);
 AddUserTypeExclude(dftConsultationName, en_TimeMachine, op_TimeMachineOnOff, false);
 AddUserTypeExclude(dftTranslationName, en_TimeMachine, op_TimeMachineOnOff, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_TimeMachine, op_TimeMachineOnOff, false);
 AddUserTypeExclude(dftTipsName, en_TimeMachine, op_TimeMachineOnOff, false);
 AddUserTypeExclude(dftMedDictEntryName, en_TimeMachine, op_TimeMachineOnOff, false);
 AddUserTypeExclude(dftAutoreferatName, en_TimeMachine, op_TimeMachineOnOff, false);
 AddUserTypeExclude(dftDrugName, en_TimeMachine, op_TimeMachineOnOff, false);
 AddUserTypeExclude(dftMedicFirmName, en_TimeMachine, op_TimeMachineOnOff, false);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_TimeMachine, op_TimeMachineOnOff, false);
 AddUserTypeExclude(dftDrugSynchroViewName, en_TimeMachine, op_TimeMachineOnOff, false);
 AddUserTypeExclude(dftRelatedDocName, en_TimeMachine, op_TimeMachineOffAndReset, false);
 AddUserTypeExclude(dftDocSynchroViewName, en_TimeMachine, op_TimeMachineOffAndReset, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_TimeMachine, op_TimeMachineOffAndReset, false);
 AddUserTypeExclude(dftDictEntryName, en_TimeMachine, op_TimeMachineOffAndReset, false);
 AddUserTypeExclude(dftDictSubEntryName, en_TimeMachine, op_TimeMachineOffAndReset, false);
 AddUserTypeExclude(dftAnnotationName, en_TimeMachine, op_TimeMachineOffAndReset, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_TimeMachine, op_TimeMachineOffAndReset, false);
 AddUserTypeExclude(dftConsultationName, en_TimeMachine, op_TimeMachineOffAndReset, false);
 AddUserTypeExclude(dftTranslationName, en_TimeMachine, op_TimeMachineOffAndReset, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_TimeMachine, op_TimeMachineOffAndReset, false);
 AddUserTypeExclude(dftTipsName, en_TimeMachine, op_TimeMachineOffAndReset, false);
 AddUserTypeExclude(dftMedDictEntryName, en_TimeMachine, op_TimeMachineOffAndReset, false);
 AddUserTypeExclude(dftAutoreferatName, en_TimeMachine, op_TimeMachineOffAndReset, false);
 AddUserTypeExclude(dftDrugName, en_TimeMachine, op_TimeMachineOffAndReset, false);
 AddUserTypeExclude(dftMedicFirmName, en_TimeMachine, op_TimeMachineOffAndReset, false);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_TimeMachine, op_TimeMachineOffAndReset, false);
 AddUserTypeExclude(dftDrugSynchroViewName, en_TimeMachine, op_TimeMachineOffAndReset, false);
 AddUserTypeExclude(dftRelatedDocName, en_Redactions, op_ActualRedaction, false);
 AddUserTypeExclude(dftDocSynchroViewName, en_Redactions, op_ActualRedaction, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_Redactions, op_ActualRedaction, false);
 AddUserTypeExclude(dftDictEntryName, en_Redactions, op_ActualRedaction, false);
 AddUserTypeExclude(dftDictSubEntryName, en_Redactions, op_ActualRedaction, false);
 AddUserTypeExclude(dftAnnotationName, en_Redactions, op_ActualRedaction, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_Redactions, op_ActualRedaction, false);
 AddUserTypeExclude(dftConsultationName, en_Redactions, op_ActualRedaction, false);
 AddUserTypeExclude(dftTranslationName, en_Redactions, op_ActualRedaction, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_Redactions, op_ActualRedaction, false);
 AddUserTypeExclude(dftTipsName, en_Redactions, op_ActualRedaction, false);
 AddUserTypeExclude(dftMedDictEntryName, en_Redactions, op_ActualRedaction, false);
 AddUserTypeExclude(dftAutoreferatName, en_Redactions, op_ActualRedaction, false);
 AddUserTypeExclude(dftDrugName, en_Redactions, op_ActualRedaction, false);
 AddUserTypeExclude(dftMedicFirmName, en_Redactions, op_ActualRedaction, false);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_Redactions, op_ActualRedaction, false);
 AddUserTypeExclude(dftDrugSynchroViewName, en_Redactions, op_ActualRedaction, false);
 AddUserTypeExclude(dftRelatedDocName, en_TimeMachine, op_TimeMachineOnOffNew, false);
 AddUserTypeExclude(dftDocSynchroViewName, en_TimeMachine, op_TimeMachineOnOffNew, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_TimeMachine, op_TimeMachineOnOffNew, false);
 AddUserTypeExclude(dftDictEntryName, en_TimeMachine, op_TimeMachineOnOffNew, false);
 AddUserTypeExclude(dftDictSubEntryName, en_TimeMachine, op_TimeMachineOnOffNew, false);
 AddUserTypeExclude(dftAnnotationName, en_TimeMachine, op_TimeMachineOnOffNew, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_TimeMachine, op_TimeMachineOnOffNew, false);
 AddUserTypeExclude(dftConsultationName, en_TimeMachine, op_TimeMachineOnOffNew, false);
 AddUserTypeExclude(dftTranslationName, en_TimeMachine, op_TimeMachineOnOffNew, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_TimeMachine, op_TimeMachineOnOffNew, false);
 AddUserTypeExclude(dftTipsName, en_TimeMachine, op_TimeMachineOnOffNew, false);
 AddUserTypeExclude(dftMedDictEntryName, en_TimeMachine, op_TimeMachineOnOffNew, false);
 AddUserTypeExclude(dftAutoreferatName, en_TimeMachine, op_TimeMachineOnOffNew, false);
 AddUserTypeExclude(dftDrugName, en_TimeMachine, op_TimeMachineOnOffNew, false);
 AddUserTypeExclude(dftMedicFirmName, en_TimeMachine, op_TimeMachineOnOffNew, false);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_TimeMachine, op_TimeMachineOnOffNew, false);
 AddUserTypeExclude(dftDrugSynchroViewName, en_TimeMachine, op_TimeMachineOnOffNew, false);
 AddUserTypeExclude(dftRelatedDocName, en_Redactions, op_OpenRedactionListFrmAct, false);
 AddUserTypeExclude(dftDocSynchroViewName, en_Redactions, op_OpenRedactionListFrmAct, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_Redactions, op_OpenRedactionListFrmAct, false);
 AddUserTypeExclude(dftDictEntryName, en_Redactions, op_OpenRedactionListFrmAct, false);
 AddUserTypeExclude(dftDictSubEntryName, en_Redactions, op_OpenRedactionListFrmAct, false);
 AddUserTypeExclude(dftAnnotationName, en_Redactions, op_OpenRedactionListFrmAct, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_Redactions, op_OpenRedactionListFrmAct, false);
 AddUserTypeExclude(dftConsultationName, en_Redactions, op_OpenRedactionListFrmAct, false);
 AddUserTypeExclude(dftTranslationName, en_Redactions, op_OpenRedactionListFrmAct, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_Redactions, op_OpenRedactionListFrmAct, false);
 AddUserTypeExclude(dftTipsName, en_Redactions, op_OpenRedactionListFrmAct, false);
 AddUserTypeExclude(dftMedDictEntryName, en_Redactions, op_OpenRedactionListFrmAct, false);
 AddUserTypeExclude(dftAutoreferatName, en_Redactions, op_OpenRedactionListFrmAct, false);
 AddUserTypeExclude(dftDrugName, en_Redactions, op_OpenRedactionListFrmAct, false);
 AddUserTypeExclude(dftMedicFirmName, en_Redactions, op_OpenRedactionListFrmAct, false);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_Redactions, op_OpenRedactionListFrmAct, false);
 AddUserTypeExclude(dftDrugSynchroViewName, en_Redactions, op_OpenRedactionListFrmAct, false);
 AddUserTypeExclude(dftRelatedDocName, en_Document, op_GetAnnotationDocFrmAct, false);
 AddUserTypeExclude(dftDocSynchroViewName, en_Document, op_GetAnnotationDocFrmAct, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_Document, op_GetAnnotationDocFrmAct, false);
 AddUserTypeExclude(dftDictEntryName, en_Document, op_GetAnnotationDocFrmAct, false);
 AddUserTypeExclude(dftDictSubEntryName, en_Document, op_GetAnnotationDocFrmAct, false);
 AddUserTypeExclude(dftAnnotationName, en_Document, op_GetAnnotationDocFrmAct, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_Document, op_GetAnnotationDocFrmAct, false);
 AddUserTypeExclude(dftConsultationName, en_Document, op_GetAnnotationDocFrmAct, false);
 AddUserTypeExclude(dftTranslationName, en_Document, op_GetAnnotationDocFrmAct, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_Document, op_GetAnnotationDocFrmAct, false);
 AddUserTypeExclude(dftTipsName, en_Document, op_GetAnnotationDocFrmAct, false);
 AddUserTypeExclude(dftMedDictEntryName, en_Document, op_GetAnnotationDocFrmAct, false);
 AddUserTypeExclude(dftAutoreferatName, en_Document, op_GetAnnotationDocFrmAct, false);
 AddUserTypeExclude(dftDrugName, en_Document, op_GetAnnotationDocFrmAct, false);
 AddUserTypeExclude(dftMedicFirmName, en_Document, op_GetAnnotationDocFrmAct, false);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_Document, op_GetAnnotationDocFrmAct, false);
 AddUserTypeExclude(dftDrugSynchroViewName, en_Document, op_GetAnnotationDocFrmAct, false);
 AddUserTypeExclude(dftRelatedDocName, en_Document, op_SimilarDocuments, false);
 AddUserTypeExclude(dftDocSynchroViewName, en_Document, op_SimilarDocuments, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_Document, op_SimilarDocuments, false);
 AddUserTypeExclude(dftDictEntryName, en_Document, op_SimilarDocuments, false);
 AddUserTypeExclude(dftDictSubEntryName, en_Document, op_SimilarDocuments, false);
 AddUserTypeExclude(dftAnnotationName, en_Document, op_SimilarDocuments, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_Document, op_SimilarDocuments, false);
 AddUserTypeExclude(dftConsultationName, en_Document, op_SimilarDocuments, false);
 AddUserTypeExclude(dftTranslationName, en_Document, op_SimilarDocuments, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_Document, op_SimilarDocuments, false);
 AddUserTypeExclude(dftTipsName, en_Document, op_SimilarDocuments, false);
 AddUserTypeExclude(dftMedDictEntryName, en_Document, op_SimilarDocuments, false);
 AddUserTypeExclude(dftAutoreferatName, en_Document, op_SimilarDocuments, false);
 AddUserTypeExclude(dftDrugName, en_Document, op_SimilarDocuments, false);
 AddUserTypeExclude(dftMedicFirmName, en_Document, op_SimilarDocuments, false);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_Document, op_SimilarDocuments, false);
 AddUserTypeExclude(dftDrugSynchroViewName, en_Document, op_SimilarDocuments, false);
 AddUserTypeExclude(dftRelatedDocName, en_DocumentBlockHeader, op_UserCR1, false);
 AddUserTypeExclude(dftDocSynchroViewName, en_DocumentBlockHeader, op_UserCR1, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_DocumentBlockHeader, op_UserCR1, false);
 AddUserTypeExclude(dftDictEntryName, en_DocumentBlockHeader, op_UserCR1, false);
 AddUserTypeExclude(dftDictSubEntryName, en_DocumentBlockHeader, op_UserCR1, false);
 AddUserTypeExclude(dftAnnotationName, en_DocumentBlockHeader, op_UserCR1, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_DocumentBlockHeader, op_UserCR1, false);
 AddUserTypeExclude(dftConsultationName, en_DocumentBlockHeader, op_UserCR1, false);
 AddUserTypeExclude(dftTranslationName, en_DocumentBlockHeader, op_UserCR1, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_DocumentBlockHeader, op_UserCR1, false);
 AddUserTypeExclude(dftTipsName, en_DocumentBlockHeader, op_UserCR1, false);
 AddUserTypeExclude(dftMedDictEntryName, en_DocumentBlockHeader, op_UserCR1, false);
 AddUserTypeExclude(dftAutoreferatName, en_DocumentBlockHeader, op_UserCR1, false);
 AddUserTypeExclude(dftDrugName, en_DocumentBlockHeader, op_UserCR1, false);
 AddUserTypeExclude(dftMedicFirmName, en_DocumentBlockHeader, op_UserCR1, false);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_DocumentBlockHeader, op_UserCR1, false);
 AddUserTypeExclude(dftDrugSynchroViewName, en_DocumentBlockHeader, op_UserCR1, false);
 AddUserTypeExclude(dftRelatedDocName, en_DocumentBlockHeader, op_UserCR2, false);
 AddUserTypeExclude(dftDocSynchroViewName, en_DocumentBlockHeader, op_UserCR2, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_DocumentBlockHeader, op_UserCR2, false);
 AddUserTypeExclude(dftDictEntryName, en_DocumentBlockHeader, op_UserCR2, false);
 AddUserTypeExclude(dftDictSubEntryName, en_DocumentBlockHeader, op_UserCR2, false);
 AddUserTypeExclude(dftAnnotationName, en_DocumentBlockHeader, op_UserCR2, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_DocumentBlockHeader, op_UserCR2, false);
 AddUserTypeExclude(dftConsultationName, en_DocumentBlockHeader, op_UserCR2, false);
 AddUserTypeExclude(dftTranslationName, en_DocumentBlockHeader, op_UserCR2, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_DocumentBlockHeader, op_UserCR2, false);
 AddUserTypeExclude(dftTipsName, en_DocumentBlockHeader, op_UserCR2, false);
 AddUserTypeExclude(dftMedDictEntryName, en_DocumentBlockHeader, op_UserCR2, false);
 AddUserTypeExclude(dftAutoreferatName, en_DocumentBlockHeader, op_UserCR2, false);
 AddUserTypeExclude(dftDrugName, en_DocumentBlockHeader, op_UserCR2, false);
 AddUserTypeExclude(dftMedicFirmName, en_DocumentBlockHeader, op_UserCR2, false);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_DocumentBlockHeader, op_UserCR2, false);
 AddUserTypeExclude(dftDrugSynchroViewName, en_DocumentBlockHeader, op_UserCR2, false);
 AddUserTypeExclude(dftRelatedDocName, en_DocumentBlockHeader, op_GetTypedCorrespondentList, false);
 AddUserTypeExclude(dftDocSynchroViewName, en_DocumentBlockHeader, op_GetTypedCorrespondentList, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_DocumentBlockHeader, op_GetTypedCorrespondentList, false);
 AddUserTypeExclude(dftDictEntryName, en_DocumentBlockHeader, op_GetTypedCorrespondentList, false);
 AddUserTypeExclude(dftDictSubEntryName, en_DocumentBlockHeader, op_GetTypedCorrespondentList, false);
 AddUserTypeExclude(dftAnnotationName, en_DocumentBlockHeader, op_GetTypedCorrespondentList, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_DocumentBlockHeader, op_GetTypedCorrespondentList, false);
 AddUserTypeExclude(dftConsultationName, en_DocumentBlockHeader, op_GetTypedCorrespondentList, false);
 AddUserTypeExclude(dftTranslationName, en_DocumentBlockHeader, op_GetTypedCorrespondentList, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_DocumentBlockHeader, op_GetTypedCorrespondentList, false);
 AddUserTypeExclude(dftTipsName, en_DocumentBlockHeader, op_GetTypedCorrespondentList, false);
 AddUserTypeExclude(dftMedDictEntryName, en_DocumentBlockHeader, op_GetTypedCorrespondentList, false);
 AddUserTypeExclude(dftAutoreferatName, en_DocumentBlockHeader, op_GetTypedCorrespondentList, false);
 AddUserTypeExclude(dftDrugName, en_DocumentBlockHeader, op_GetTypedCorrespondentList, false);
 AddUserTypeExclude(dftMedicFirmName, en_DocumentBlockHeader, op_GetTypedCorrespondentList, false);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_DocumentBlockHeader, op_GetTypedCorrespondentList, false);
 AddUserTypeExclude(dftDrugSynchroViewName, en_DocumentBlockHeader, op_GetTypedCorrespondentList, false);
 AddUserTypeExclude(dftRelatedDocName, en_Redactions, op_PrevRedaction, false);
 AddUserTypeExclude(dftDocSynchroViewName, en_Redactions, op_PrevRedaction, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_Redactions, op_PrevRedaction, false);
 AddUserTypeExclude(dftDictEntryName, en_Redactions, op_PrevRedaction, false);
 AddUserTypeExclude(dftDictSubEntryName, en_Redactions, op_PrevRedaction, false);
 AddUserTypeExclude(dftAnnotationName, en_Redactions, op_PrevRedaction, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_Redactions, op_PrevRedaction, false);
 AddUserTypeExclude(dftConsultationName, en_Redactions, op_PrevRedaction, false);
 AddUserTypeExclude(dftTranslationName, en_Redactions, op_PrevRedaction, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_Redactions, op_PrevRedaction, false);
 AddUserTypeExclude(dftTipsName, en_Redactions, op_PrevRedaction, false);
 AddUserTypeExclude(dftMedDictEntryName, en_Redactions, op_PrevRedaction, false);
 AddUserTypeExclude(dftAutoreferatName, en_Redactions, op_PrevRedaction, false);
 AddUserTypeExclude(dftDrugName, en_Redactions, op_PrevRedaction, false);
 AddUserTypeExclude(dftMedicFirmName, en_Redactions, op_PrevRedaction, false);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_Redactions, op_PrevRedaction, false);
 AddUserTypeExclude(dftDrugSynchroViewName, en_Redactions, op_PrevRedaction, false);
 AddUserTypeExclude(dftRelatedDocName, en_Redactions, op_NextRedaction, false);
 AddUserTypeExclude(dftDocSynchroViewName, en_Redactions, op_NextRedaction, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_Redactions, op_NextRedaction, false);
 AddUserTypeExclude(dftDictEntryName, en_Redactions, op_NextRedaction, false);
 AddUserTypeExclude(dftDictSubEntryName, en_Redactions, op_NextRedaction, false);
 AddUserTypeExclude(dftAnnotationName, en_Redactions, op_NextRedaction, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_Redactions, op_NextRedaction, false);
 AddUserTypeExclude(dftConsultationName, en_Redactions, op_NextRedaction, false);
 AddUserTypeExclude(dftTranslationName, en_Redactions, op_NextRedaction, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_Redactions, op_NextRedaction, false);
 AddUserTypeExclude(dftTipsName, en_Redactions, op_NextRedaction, false);
 AddUserTypeExclude(dftMedDictEntryName, en_Redactions, op_NextRedaction, false);
 AddUserTypeExclude(dftAutoreferatName, en_Redactions, op_NextRedaction, false);
 AddUserTypeExclude(dftDrugName, en_Redactions, op_NextRedaction, false);
 AddUserTypeExclude(dftMedicFirmName, en_Redactions, op_NextRedaction, false);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_Redactions, op_NextRedaction, false);
 AddUserTypeExclude(dftDrugSynchroViewName, en_Redactions, op_NextRedaction, false);
 AddUserTypeExclude(dftRelatedDocName, en_Text, op_AddToControl, false);
 AddUserTypeExclude(dftDocSynchroViewName, en_Text, op_AddToControl, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_Text, op_AddToControl, false);
 AddUserTypeExclude(dftDictEntryName, en_Text, op_AddToControl, false);
 AddUserTypeExclude(dftDictSubEntryName, en_Text, op_AddToControl, false);
 AddUserTypeExclude(dftAnnotationName, en_Text, op_AddToControl, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_Text, op_AddToControl, false);
 AddUserTypeExclude(dftConsultationName, en_Text, op_AddToControl, false);
 AddUserTypeExclude(dftTranslationName, en_Text, op_AddToControl, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_Text, op_AddToControl, false);
 AddUserTypeExclude(dftTipsName, en_Text, op_AddToControl, false);
 AddUserTypeExclude(dftMedDictEntryName, en_Text, op_AddToControl, false);
 AddUserTypeExclude(dftAutoreferatName, en_Text, op_AddToControl, false);
 AddUserTypeExclude(dftDrugName, en_Text, op_AddToControl, false);
 AddUserTypeExclude(dftMedicFirmName, en_Text, op_AddToControl, false);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_Text, op_AddToControl, false);
 AddUserTypeExclude(dftDrugSynchroViewName, en_Text, op_AddToControl, false);
 AddUserTypeExclude(dftRelatedDocName, en_Selection, op_ShowCorrespondentListToPart, false);
 AddUserTypeExclude(dftDocSynchroViewName, en_Selection, op_ShowCorrespondentListToPart, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_Selection, op_ShowCorrespondentListToPart, false);
 AddUserTypeExclude(dftDictEntryName, en_Selection, op_ShowCorrespondentListToPart, false);
 AddUserTypeExclude(dftDictSubEntryName, en_Selection, op_ShowCorrespondentListToPart, false);
 AddUserTypeExclude(dftAnnotationName, en_Selection, op_ShowCorrespondentListToPart, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_Selection, op_ShowCorrespondentListToPart, false);
 AddUserTypeExclude(dftConsultationName, en_Selection, op_ShowCorrespondentListToPart, false);
 AddUserTypeExclude(dftTranslationName, en_Selection, op_ShowCorrespondentListToPart, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_Selection, op_ShowCorrespondentListToPart, false);
 AddUserTypeExclude(dftTipsName, en_Selection, op_ShowCorrespondentListToPart, false);
 AddUserTypeExclude(dftMedDictEntryName, en_Selection, op_ShowCorrespondentListToPart, false);
 AddUserTypeExclude(dftAutoreferatName, en_Selection, op_ShowCorrespondentListToPart, false);
 AddUserTypeExclude(dftDrugName, en_Selection, op_ShowCorrespondentListToPart, false);
 AddUserTypeExclude(dftMedicFirmName, en_Selection, op_ShowCorrespondentListToPart, false);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_Selection, op_ShowCorrespondentListToPart, false);
 AddUserTypeExclude(dftDrugSynchroViewName, en_Selection, op_ShowCorrespondentListToPart, false);
 AddUserTypeExclude(dftRelatedDocName, en_Selection, op_ShowRespondentListToPart, false);
 AddUserTypeExclude(dftDocSynchroViewName, en_Selection, op_ShowRespondentListToPart, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_Selection, op_ShowRespondentListToPart, false);
 AddUserTypeExclude(dftDictEntryName, en_Selection, op_ShowRespondentListToPart, false);
 AddUserTypeExclude(dftDictSubEntryName, en_Selection, op_ShowRespondentListToPart, false);
 AddUserTypeExclude(dftAnnotationName, en_Selection, op_ShowRespondentListToPart, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_Selection, op_ShowRespondentListToPart, false);
 AddUserTypeExclude(dftConsultationName, en_Selection, op_ShowRespondentListToPart, false);
 AddUserTypeExclude(dftTranslationName, en_Selection, op_ShowRespondentListToPart, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_Selection, op_ShowRespondentListToPart, false);
 AddUserTypeExclude(dftTipsName, en_Selection, op_ShowRespondentListToPart, false);
 AddUserTypeExclude(dftMedDictEntryName, en_Selection, op_ShowRespondentListToPart, false);
 AddUserTypeExclude(dftAutoreferatName, en_Selection, op_ShowRespondentListToPart, false);
 AddUserTypeExclude(dftDrugName, en_Selection, op_ShowRespondentListToPart, false);
 AddUserTypeExclude(dftMedicFirmName, en_Selection, op_ShowRespondentListToPart, false);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_Selection, op_ShowRespondentListToPart, false);
 AddUserTypeExclude(dftDrugSynchroViewName, en_Selection, op_ShowRespondentListToPart, false);
 AddUserTypeExclude(dftRelatedDocName, en_WarnOnControl, op_ClearStatusSettings, false);
 AddUserTypeExclude(dftDocSynchroViewName, en_WarnOnControl, op_ClearStatusSettings, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_WarnOnControl, op_ClearStatusSettings, false);
 AddUserTypeExclude(dftDictEntryName, en_WarnOnControl, op_ClearStatusSettings, false);
 AddUserTypeExclude(dftDictSubEntryName, en_WarnOnControl, op_ClearStatusSettings, false);
 AddUserTypeExclude(dftAnnotationName, en_WarnOnControl, op_ClearStatusSettings, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_WarnOnControl, op_ClearStatusSettings, false);
 AddUserTypeExclude(dftConsultationName, en_WarnOnControl, op_ClearStatusSettings, false);
 AddUserTypeExclude(dftTranslationName, en_WarnOnControl, op_ClearStatusSettings, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_WarnOnControl, op_ClearStatusSettings, false);
 AddUserTypeExclude(dftTipsName, en_WarnOnControl, op_ClearStatusSettings, false);
 AddUserTypeExclude(dftMedDictEntryName, en_WarnOnControl, op_ClearStatusSettings, false);
 AddUserTypeExclude(dftAutoreferatName, en_WarnOnControl, op_ClearStatusSettings, false);
 AddUserTypeExclude(dftDrugName, en_WarnOnControl, op_ClearStatusSettings, false);
 AddUserTypeExclude(dftMedicFirmName, en_WarnOnControl, op_ClearStatusSettings, false);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_WarnOnControl, op_ClearStatusSettings, false);
 AddUserTypeExclude(dftDrugSynchroViewName, en_WarnOnControl, op_ClearStatusSettings, false);
 AddUserTypeExclude(dftRelatedDocName, en_TasksPanel, op_TimeMachineOnOff, false);
 AddUserTypeExclude(dftDocSynchroViewName, en_TasksPanel, op_TimeMachineOnOff, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_TasksPanel, op_TimeMachineOnOff, false);
 AddUserTypeExclude(dftDictEntryName, en_TasksPanel, op_TimeMachineOnOff, false);
 AddUserTypeExclude(dftDictSubEntryName, en_TasksPanel, op_TimeMachineOnOff, false);
 AddUserTypeExclude(dftAnnotationName, en_TasksPanel, op_TimeMachineOnOff, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_TasksPanel, op_TimeMachineOnOff, false);
 AddUserTypeExclude(dftConsultationName, en_TasksPanel, op_TimeMachineOnOff, false);
 AddUserTypeExclude(dftTranslationName, en_TasksPanel, op_TimeMachineOnOff, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_TasksPanel, op_TimeMachineOnOff, false);
 AddUserTypeExclude(dftTipsName, en_TasksPanel, op_TimeMachineOnOff, false);
 AddUserTypeExclude(dftMedDictEntryName, en_TasksPanel, op_TimeMachineOnOff, false);
 AddUserTypeExclude(dftAutoreferatName, en_TasksPanel, op_TimeMachineOnOff, false);
 AddUserTypeExclude(dftDrugName, en_TasksPanel, op_TimeMachineOnOff, false);
 AddUserTypeExclude(dftMedicFirmName, en_TasksPanel, op_TimeMachineOnOff, false);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_TasksPanel, op_TimeMachineOnOff, false);
 AddUserTypeExclude(dftDrugSynchroViewName, en_TasksPanel, op_TimeMachineOnOff, false);
 AddUserTypeExclude(dftRelatedDocName, en_Document, op_NextDocumentInList, false);
 AddUserTypeExclude(dftDocSynchroViewName, en_Document, op_NextDocumentInList, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_Document, op_NextDocumentInList, false);
 AddUserTypeExclude(dftDictEntryName, en_Document, op_NextDocumentInList, false);
 AddUserTypeExclude(dftDictSubEntryName, en_Document, op_NextDocumentInList, false);
 AddUserTypeExclude(dftAnnotationName, en_Document, op_NextDocumentInList, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_Document, op_NextDocumentInList, false);
 AddUserTypeExclude(dftConsultationName, en_Document, op_NextDocumentInList, false);
 AddUserTypeExclude(dftTranslationName, en_Document, op_NextDocumentInList, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_Document, op_NextDocumentInList, false);
 AddUserTypeExclude(dftTipsName, en_Document, op_NextDocumentInList, false);
 AddUserTypeExclude(dftMedDictEntryName, en_Document, op_NextDocumentInList, false);
 AddUserTypeExclude(dftAutoreferatName, en_Document, op_NextDocumentInList, false);
 AddUserTypeExclude(dftMedicFirmName, en_Document, op_NextDocumentInList, false);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_Document, op_NextDocumentInList, false);
 AddUserTypeExclude(dftDrugSynchroViewName, en_Document, op_NextDocumentInList, false);
 AddUserTypeExclude(dftRelatedDocName, en_Document, op_ReturnToList, false);
 AddUserTypeExclude(dftDocSynchroViewName, en_Document, op_ReturnToList, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_Document, op_ReturnToList, false);
 AddUserTypeExclude(dftDictEntryName, en_Document, op_ReturnToList, false);
 AddUserTypeExclude(dftDictSubEntryName, en_Document, op_ReturnToList, false);
 AddUserTypeExclude(dftAnnotationName, en_Document, op_ReturnToList, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_Document, op_ReturnToList, false);
 AddUserTypeExclude(dftConsultationName, en_Document, op_ReturnToList, false);
 AddUserTypeExclude(dftTranslationName, en_Document, op_ReturnToList, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_Document, op_ReturnToList, false);
 AddUserTypeExclude(dftTipsName, en_Document, op_ReturnToList, false);
 AddUserTypeExclude(dftMedDictEntryName, en_Document, op_ReturnToList, false);
 AddUserTypeExclude(dftAutoreferatName, en_Document, op_ReturnToList, false);
 AddUserTypeExclude(dftMedicFirmName, en_Document, op_ReturnToList, false);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_Document, op_ReturnToList, false);
 AddUserTypeExclude(dftDrugSynchroViewName, en_Document, op_ReturnToList, false);
 AddUserTypeExclude(dftRelatedDocName, en_Document, op_PrevDocumentInList, false);
 AddUserTypeExclude(dftDocSynchroViewName, en_Document, op_PrevDocumentInList, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_Document, op_PrevDocumentInList, false);
 AddUserTypeExclude(dftDictEntryName, en_Document, op_PrevDocumentInList, false);
 AddUserTypeExclude(dftDictSubEntryName, en_Document, op_PrevDocumentInList, false);
 AddUserTypeExclude(dftAnnotationName, en_Document, op_PrevDocumentInList, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_Document, op_PrevDocumentInList, false);
 AddUserTypeExclude(dftConsultationName, en_Document, op_PrevDocumentInList, false);
 AddUserTypeExclude(dftTranslationName, en_Document, op_PrevDocumentInList, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_Document, op_PrevDocumentInList, false);
 AddUserTypeExclude(dftTipsName, en_Document, op_PrevDocumentInList, false);
 AddUserTypeExclude(dftMedDictEntryName, en_Document, op_PrevDocumentInList, false);
 AddUserTypeExclude(dftAutoreferatName, en_Document, op_PrevDocumentInList, false);
 AddUserTypeExclude(dftMedicFirmName, en_Document, op_PrevDocumentInList, false);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_Document, op_PrevDocumentInList, false);
 AddUserTypeExclude(dftDrugSynchroViewName, en_Document, op_PrevDocumentInList, false);
 AddUserTypeExclude(dftRelatedDocName, en_DocumentBlock, op_GetTypedCorrespondentList, false);
 AddUserTypeExclude(dftDocSynchroViewName, en_DocumentBlock, op_GetTypedCorrespondentList, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_DocumentBlock, op_GetTypedCorrespondentList, false);
 AddUserTypeExclude(dftDictEntryName, en_DocumentBlock, op_GetTypedCorrespondentList, false);
 AddUserTypeExclude(dftDictSubEntryName, en_DocumentBlock, op_GetTypedCorrespondentList, false);
 AddUserTypeExclude(dftAnnotationName, en_DocumentBlock, op_GetTypedCorrespondentList, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_DocumentBlock, op_GetTypedCorrespondentList, false);
 AddUserTypeExclude(dftConsultationName, en_DocumentBlock, op_GetTypedCorrespondentList, false);
 AddUserTypeExclude(dftTranslationName, en_DocumentBlock, op_GetTypedCorrespondentList, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_DocumentBlock, op_GetTypedCorrespondentList, false);
 AddUserTypeExclude(dftTipsName, en_DocumentBlock, op_GetTypedCorrespondentList, false);
 AddUserTypeExclude(dftMedDictEntryName, en_DocumentBlock, op_GetTypedCorrespondentList, false);
 AddUserTypeExclude(dftAutoreferatName, en_DocumentBlock, op_GetTypedCorrespondentList, false);
 AddUserTypeExclude(dftMedicFirmName, en_DocumentBlock, op_GetTypedCorrespondentList, false);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_DocumentBlock, op_GetTypedCorrespondentList, false);
 AddUserTypeExclude(dftRelatedDocName, en_DocumentBlockHeader, op_AddBookmark, false);
 AddUserTypeExclude(dftDocSynchroViewName, en_DocumentBlockHeader, op_AddBookmark, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_DocumentBlockHeader, op_AddBookmark, false);
 AddUserTypeExclude(dftDictEntryName, en_DocumentBlockHeader, op_AddBookmark, false);
 AddUserTypeExclude(dftDictSubEntryName, en_DocumentBlockHeader, op_AddBookmark, false);
 AddUserTypeExclude(dftAnnotationName, en_DocumentBlockHeader, op_AddBookmark, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_DocumentBlockHeader, op_AddBookmark, false);
 AddUserTypeExclude(dftConsultationName, en_DocumentBlockHeader, op_AddBookmark, false);
 AddUserTypeExclude(dftTranslationName, en_DocumentBlockHeader, op_AddBookmark, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_DocumentBlockHeader, op_AddBookmark, false);
 AddUserTypeExclude(dftTipsName, en_DocumentBlockHeader, op_AddBookmark, false);
 AddUserTypeExclude(dftMedDictEntryName, en_DocumentBlockHeader, op_AddBookmark, false);
 AddUserTypeExclude(dftAutoreferatName, en_DocumentBlockHeader, op_AddBookmark, false);
 AddUserTypeExclude(dftMedicFirmName, en_DocumentBlockHeader, op_AddBookmark, false);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_DocumentBlockHeader, op_AddBookmark, false);
 AddUserTypeExclude(dftRelatedDocName, en_DocumentBlockHeader, op_ToMSWord, false);
 AddUserTypeExclude(dftDocSynchroViewName, en_DocumentBlockHeader, op_ToMSWord, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_DocumentBlockHeader, op_ToMSWord, false);
 AddUserTypeExclude(dftDictEntryName, en_DocumentBlockHeader, op_ToMSWord, false);
 AddUserTypeExclude(dftDictSubEntryName, en_DocumentBlockHeader, op_ToMSWord, false);
 AddUserTypeExclude(dftAnnotationName, en_DocumentBlockHeader, op_ToMSWord, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_DocumentBlockHeader, op_ToMSWord, false);
 AddUserTypeExclude(dftConsultationName, en_DocumentBlockHeader, op_ToMSWord, false);
 AddUserTypeExclude(dftTranslationName, en_DocumentBlockHeader, op_ToMSWord, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_DocumentBlockHeader, op_ToMSWord, false);
 AddUserTypeExclude(dftTipsName, en_DocumentBlockHeader, op_ToMSWord, false);
 AddUserTypeExclude(dftMedDictEntryName, en_DocumentBlockHeader, op_ToMSWord, false);
 AddUserTypeExclude(dftAutoreferatName, en_DocumentBlockHeader, op_ToMSWord, false);
 AddUserTypeExclude(dftMedicFirmName, en_DocumentBlockHeader, op_ToMSWord, false);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_DocumentBlockHeader, op_ToMSWord, false);
 AddUserTypeExclude(dftRelatedDocName, en_DocumentBlockHeader, op_Print, false);
 AddUserTypeExclude(dftDocSynchroViewName, en_DocumentBlockHeader, op_Print, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_DocumentBlockHeader, op_Print, false);
 AddUserTypeExclude(dftDictEntryName, en_DocumentBlockHeader, op_Print, false);
 AddUserTypeExclude(dftDictSubEntryName, en_DocumentBlockHeader, op_Print, false);
 AddUserTypeExclude(dftAnnotationName, en_DocumentBlockHeader, op_Print, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_DocumentBlockHeader, op_Print, false);
 AddUserTypeExclude(dftConsultationName, en_DocumentBlockHeader, op_Print, false);
 AddUserTypeExclude(dftTranslationName, en_DocumentBlockHeader, op_Print, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_DocumentBlockHeader, op_Print, false);
 AddUserTypeExclude(dftTipsName, en_DocumentBlockHeader, op_Print, false);
 AddUserTypeExclude(dftMedDictEntryName, en_DocumentBlockHeader, op_Print, false);
 AddUserTypeExclude(dftAutoreferatName, en_DocumentBlockHeader, op_Print, false);
 AddUserTypeExclude(dftMedicFirmName, en_DocumentBlockHeader, op_Print, false);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_DocumentBlockHeader, op_Print, false);
 AddUserTypeExclude(dftRelatedDocName, en_DocumentBlockHeader, op_PrintDialog, false);
 AddUserTypeExclude(dftDocSynchroViewName, en_DocumentBlockHeader, op_PrintDialog, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_DocumentBlockHeader, op_PrintDialog, false);
 AddUserTypeExclude(dftDictEntryName, en_DocumentBlockHeader, op_PrintDialog, false);
 AddUserTypeExclude(dftDictSubEntryName, en_DocumentBlockHeader, op_PrintDialog, false);
 AddUserTypeExclude(dftAnnotationName, en_DocumentBlockHeader, op_PrintDialog, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_DocumentBlockHeader, op_PrintDialog, false);
 AddUserTypeExclude(dftConsultationName, en_DocumentBlockHeader, op_PrintDialog, false);
 AddUserTypeExclude(dftTranslationName, en_DocumentBlockHeader, op_PrintDialog, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_DocumentBlockHeader, op_PrintDialog, false);
 AddUserTypeExclude(dftTipsName, en_DocumentBlockHeader, op_PrintDialog, false);
 AddUserTypeExclude(dftMedDictEntryName, en_DocumentBlockHeader, op_PrintDialog, false);
 AddUserTypeExclude(dftAutoreferatName, en_DocumentBlockHeader, op_PrintDialog, false);
 AddUserTypeExclude(dftMedicFirmName, en_DocumentBlockHeader, op_PrintDialog, false);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_DocumentBlockHeader, op_PrintDialog, false);
 AddUserTypeExclude(dftRelatedDocName, en_DocumentBlockBookmarks, op_AddBookmark, false);
 AddUserTypeExclude(dftDocSynchroViewName, en_DocumentBlockBookmarks, op_AddBookmark, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_DocumentBlockBookmarks, op_AddBookmark, false);
 AddUserTypeExclude(dftDictEntryName, en_DocumentBlockBookmarks, op_AddBookmark, false);
 AddUserTypeExclude(dftDictSubEntryName, en_DocumentBlockBookmarks, op_AddBookmark, false);
 AddUserTypeExclude(dftAnnotationName, en_DocumentBlockBookmarks, op_AddBookmark, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_DocumentBlockBookmarks, op_AddBookmark, false);
 AddUserTypeExclude(dftConsultationName, en_DocumentBlockBookmarks, op_AddBookmark, false);
 AddUserTypeExclude(dftTranslationName, en_DocumentBlockBookmarks, op_AddBookmark, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_DocumentBlockBookmarks, op_AddBookmark, false);
 AddUserTypeExclude(dftTipsName, en_DocumentBlockBookmarks, op_AddBookmark, false);
 AddUserTypeExclude(dftMedDictEntryName, en_DocumentBlockBookmarks, op_AddBookmark, false);
 AddUserTypeExclude(dftAutoreferatName, en_DocumentBlockBookmarks, op_AddBookmark, false);
 AddUserTypeExclude(dftMedicFirmName, en_DocumentBlockBookmarks, op_AddBookmark, false);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_DocumentBlockBookmarks, op_AddBookmark, false);
 AddUserTypeExclude(dftRelatedDocName, en_DocumentBlock, op_ToMSWord, false);
 AddUserTypeExclude(dftDocSynchroViewName, en_DocumentBlock, op_ToMSWord, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_DocumentBlock, op_ToMSWord, false);
 AddUserTypeExclude(dftDictEntryName, en_DocumentBlock, op_ToMSWord, false);
 AddUserTypeExclude(dftDictSubEntryName, en_DocumentBlock, op_ToMSWord, false);
 AddUserTypeExclude(dftAnnotationName, en_DocumentBlock, op_ToMSWord, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_DocumentBlock, op_ToMSWord, false);
 AddUserTypeExclude(dftConsultationName, en_DocumentBlock, op_ToMSWord, false);
 AddUserTypeExclude(dftTranslationName, en_DocumentBlock, op_ToMSWord, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_DocumentBlock, op_ToMSWord, false);
 AddUserTypeExclude(dftTipsName, en_DocumentBlock, op_ToMSWord, false);
 AddUserTypeExclude(dftMedDictEntryName, en_DocumentBlock, op_ToMSWord, false);
 AddUserTypeExclude(dftAutoreferatName, en_DocumentBlock, op_ToMSWord, false);
 AddUserTypeExclude(dftMedicFirmName, en_DocumentBlock, op_ToMSWord, false);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_DocumentBlock, op_ToMSWord, false);
 AddUserTypeExclude(dftRelatedDocName, en_DocumentBlock, op_PrintDialog, false);
 AddUserTypeExclude(dftDocSynchroViewName, en_DocumentBlock, op_PrintDialog, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_DocumentBlock, op_PrintDialog, false);
 AddUserTypeExclude(dftDictEntryName, en_DocumentBlock, op_PrintDialog, false);
 AddUserTypeExclude(dftDictSubEntryName, en_DocumentBlock, op_PrintDialog, false);
 AddUserTypeExclude(dftAnnotationName, en_DocumentBlock, op_PrintDialog, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_DocumentBlock, op_PrintDialog, false);
 AddUserTypeExclude(dftConsultationName, en_DocumentBlock, op_PrintDialog, false);
 AddUserTypeExclude(dftTranslationName, en_DocumentBlock, op_PrintDialog, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_DocumentBlock, op_PrintDialog, false);
 AddUserTypeExclude(dftTipsName, en_DocumentBlock, op_PrintDialog, false);
 AddUserTypeExclude(dftMedDictEntryName, en_DocumentBlock, op_PrintDialog, false);
 AddUserTypeExclude(dftAutoreferatName, en_DocumentBlock, op_PrintDialog, false);
 AddUserTypeExclude(dftMedicFirmName, en_DocumentBlock, op_PrintDialog, false);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_DocumentBlock, op_PrintDialog, false);
 AddUserTypeExclude(dftRelatedDocName, en_DocumentBlock, op_Copy, false);
 AddUserTypeExclude(dftDocSynchroViewName, en_DocumentBlock, op_Copy, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_DocumentBlock, op_Copy, false);
 AddUserTypeExclude(dftDictEntryName, en_DocumentBlock, op_Copy, false);
 AddUserTypeExclude(dftDictSubEntryName, en_DocumentBlock, op_Copy, false);
 AddUserTypeExclude(dftAnnotationName, en_DocumentBlock, op_Copy, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_DocumentBlock, op_Copy, false);
 AddUserTypeExclude(dftConsultationName, en_DocumentBlock, op_Copy, false);
 AddUserTypeExclude(dftTranslationName, en_DocumentBlock, op_Copy, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_DocumentBlock, op_Copy, false);
 AddUserTypeExclude(dftTipsName, en_DocumentBlock, op_Copy, false);
 AddUserTypeExclude(dftMedDictEntryName, en_DocumentBlock, op_Copy, false);
 AddUserTypeExclude(dftAutoreferatName, en_DocumentBlock, op_Copy, false);
 AddUserTypeExclude(dftMedicFirmName, en_DocumentBlock, op_Copy, false);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_DocumentBlock, op_Copy, false);
 AddUserTypeExclude(dftRelatedDocName, en_Document, op_OpenContentsFrmAct, false);
 AddUserTypeExclude(dftDocSynchroViewName, en_Document, op_OpenContentsFrmAct, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_Document, op_OpenContentsFrmAct, false);
 AddUserTypeExclude(dftDictEntryName, en_Document, op_OpenContentsFrmAct, false);
 AddUserTypeExclude(dftDictSubEntryName, en_Document, op_OpenContentsFrmAct, false);
 AddUserTypeExclude(dftAnnotationName, en_Document, op_OpenContentsFrmAct, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_Document, op_OpenContentsFrmAct, false);
 AddUserTypeExclude(dftConsultationName, en_Document, op_OpenContentsFrmAct, false);
 AddUserTypeExclude(dftTranslationName, en_Document, op_OpenContentsFrmAct, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_Document, op_OpenContentsFrmAct, false);
 AddUserTypeExclude(dftTipsName, en_Document, op_OpenContentsFrmAct, false);
 AddUserTypeExclude(dftMedDictEntryName, en_Document, op_OpenContentsFrmAct, false);
 AddUserTypeExclude(dftAutoreferatName, en_Document, op_OpenContentsFrmAct, false);
 AddUserTypeExclude(dftMedicFirmName, en_Document, op_OpenContentsFrmAct, false);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_Document, op_OpenContentsFrmAct, false);
 AddUserTypeExclude(dftRelatedDocName, en_Document, op_ShowDocumentPicture, false);
 AddUserTypeExclude(dftDocSynchroViewName, en_Document, op_ShowDocumentPicture, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_Document, op_ShowDocumentPicture, false);
 AddUserTypeExclude(dftDictEntryName, en_Document, op_ShowDocumentPicture, false);
 AddUserTypeExclude(dftDictSubEntryName, en_Document, op_ShowDocumentPicture, false);
 AddUserTypeExclude(dftAnnotationName, en_Document, op_ShowDocumentPicture, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_Document, op_ShowDocumentPicture, false);
 AddUserTypeExclude(dftConsultationName, en_Document, op_ShowDocumentPicture, false);
 AddUserTypeExclude(dftTranslationName, en_Document, op_ShowDocumentPicture, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_Document, op_ShowDocumentPicture, false);
 AddUserTypeExclude(dftTipsName, en_Document, op_ShowDocumentPicture, false);
 AddUserTypeExclude(dftMedDictEntryName, en_Document, op_ShowDocumentPicture, false);
 AddUserTypeExclude(dftAutoreferatName, en_Document, op_ShowDocumentPicture, false);
 AddUserTypeExclude(dftMedicFirmName, en_Document, op_ShowDocumentPicture, false);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_Document, op_ShowDocumentPicture, false);
 AddUserTypeExclude(dftDocSynchroViewName, en_Document, op_GetGraphicImage, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_Document, op_GetGraphicImage, false);
 AddUserTypeExclude(dftDictEntryName, en_Document, op_GetGraphicImage, false);
 AddUserTypeExclude(dftDictSubEntryName, en_Document, op_GetGraphicImage, false);
 AddUserTypeExclude(dftAnnotationName, en_Document, op_GetGraphicImage, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_Document, op_GetGraphicImage, false);
 AddUserTypeExclude(dftConsultationName, en_Document, op_GetGraphicImage, false);
 AddUserTypeExclude(dftTranslationName, en_Document, op_GetGraphicImage, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_Document, op_GetGraphicImage, false);
 AddUserTypeExclude(dftTipsName, en_Document, op_GetGraphicImage, false);
 AddUserTypeExclude(dftMedDictEntryName, en_Document, op_GetGraphicImage, false);
 AddUserTypeExclude(dftAutoreferatName, en_Document, op_GetGraphicImage, false);
 AddUserTypeExclude(dftMedicFirmName, en_Document, op_GetGraphicImage, false);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_Document, op_GetGraphicImage, false);
 AddUserTypeExclude(dftNoneName, en_Document, op_DocumentSynchroOpenWindow, true);
 AddUserTypeExclude(dftDocumentName, en_Document, op_DocumentSynchroOpenWindow, true);
 AddUserTypeExclude(dftRelatedDocName, en_Document, op_DocumentSynchroOpenWindow, true);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_Document, op_DocumentSynchroOpenWindow, true);
 AddUserTypeExclude(dftDictEntryName, en_Document, op_DocumentSynchroOpenWindow, true);
 AddUserTypeExclude(dftDictSubEntryName, en_Document, op_DocumentSynchroOpenWindow, true);
 AddUserTypeExclude(dftAnnotationName, en_Document, op_DocumentSynchroOpenWindow, true);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_Document, op_DocumentSynchroOpenWindow, true);
 AddUserTypeExclude(dftConsultationName, en_Document, op_DocumentSynchroOpenWindow, true);
 AddUserTypeExclude(dftTranslationName, en_Document, op_DocumentSynchroOpenWindow, true);
 AddUserTypeExclude(dftTipsName, en_Document, op_DocumentSynchroOpenWindow, true);
 AddUserTypeExclude(dftMedDictEntryName, en_Document, op_DocumentSynchroOpenWindow, true);
 AddUserTypeExclude(dftAutoreferatName, en_Document, op_DocumentSynchroOpenWindow, true);
 AddUserTypeExclude(dftDrugName, en_Document, op_DocumentSynchroOpenWindow, true);
 AddUserTypeExclude(dftMedicFirmName, en_Document, op_DocumentSynchroOpenWindow, true);
 AddUserTypeExclude(dftAACLeftName, en_Document, op_DocumentSynchroOpenWindow, true);
 AddUserTypeExclude(dftAACRightName, en_Document, op_DocumentSynchroOpenWindow, true);
 AddUserTypeExclude(dftAACContentsLeftName, en_Document, op_DocumentSynchroOpenWindow, true);
 AddUserTypeExclude(dftAACContentsRightName, en_Document, op_DocumentSynchroOpenWindow, true);
 AddUserTypeExclude(dftNoneName, en_Document, op_DocumentSynchroOpenNewWindow, true);
 AddUserTypeExclude(dftDocumentName, en_Document, op_DocumentSynchroOpenNewWindow, true);
 AddUserTypeExclude(dftRelatedDocName, en_Document, op_DocumentSynchroOpenNewWindow, true);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_Document, op_DocumentSynchroOpenNewWindow, true);
 AddUserTypeExclude(dftDictEntryName, en_Document, op_DocumentSynchroOpenNewWindow, true);
 AddUserTypeExclude(dftDictSubEntryName, en_Document, op_DocumentSynchroOpenNewWindow, true);
 AddUserTypeExclude(dftAnnotationName, en_Document, op_DocumentSynchroOpenNewWindow, true);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_Document, op_DocumentSynchroOpenNewWindow, true);
 AddUserTypeExclude(dftConsultationName, en_Document, op_DocumentSynchroOpenNewWindow, true);
 AddUserTypeExclude(dftTranslationName, en_Document, op_DocumentSynchroOpenNewWindow, true);
 AddUserTypeExclude(dftTipsName, en_Document, op_DocumentSynchroOpenNewWindow, true);
 AddUserTypeExclude(dftMedDictEntryName, en_Document, op_DocumentSynchroOpenNewWindow, true);
 AddUserTypeExclude(dftAutoreferatName, en_Document, op_DocumentSynchroOpenNewWindow, true);
 AddUserTypeExclude(dftDrugName, en_Document, op_DocumentSynchroOpenNewWindow, true);
 AddUserTypeExclude(dftMedicFirmName, en_Document, op_DocumentSynchroOpenNewWindow, true);
 AddUserTypeExclude(dftAACLeftName, en_Document, op_DocumentSynchroOpenNewWindow, true);
 AddUserTypeExclude(dftAACRightName, en_Document, op_DocumentSynchroOpenNewWindow, true);
 AddUserTypeExclude(dftAACContentsLeftName, en_Document, op_DocumentSynchroOpenNewWindow, true);
 AddUserTypeExclude(dftAACContentsRightName, en_Document, op_DocumentSynchroOpenNewWindow, true);
 AddUserTypeExclude(dftNoneName, en_Document, op_DictListOpenFrmAct, false);
 AddUserTypeExclude(dftDocumentName, en_Document, op_DictListOpenFrmAct, false);
 AddUserTypeExclude(dftRelatedDocName, en_Document, op_DictListOpenFrmAct, false);
 AddUserTypeExclude(dftDocSynchroViewName, en_Document, op_DictListOpenFrmAct, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_Document, op_DictListOpenFrmAct, false);
 AddUserTypeExclude(dftDictSubEntryName, en_Document, op_DictListOpenFrmAct, false);
 AddUserTypeExclude(dftAnnotationName, en_Document, op_DictListOpenFrmAct, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_Document, op_DictListOpenFrmAct, false);
 AddUserTypeExclude(dftConsultationName, en_Document, op_DictListOpenFrmAct, false);
 AddUserTypeExclude(dftTranslationName, en_Document, op_DictListOpenFrmAct, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_Document, op_DictListOpenFrmAct, false);
 AddUserTypeExclude(dftAutoreferatName, en_Document, op_DictListOpenFrmAct, false);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_Document, op_DictListOpenFrmAct, false);
 AddUserTypeExclude(dftAACLeftName, en_Document, op_DictListOpenFrmAct, false);
 AddUserTypeExclude(dftAACRightName, en_Document, op_DictListOpenFrmAct, false);
 AddUserTypeExclude(dftAACContentsLeftName, en_Document, op_DictListOpenFrmAct, false);
 AddUserTypeExclude(dftAACContentsRightName, en_Document, op_DictListOpenFrmAct, false);
 AddUserTypeExclude(dftRelatedDocName, en_Document, op_AddBookmarkFromContents, false);
 AddUserTypeExclude(dftDocSynchroViewName, en_Document, op_AddBookmarkFromContents, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_Document, op_AddBookmarkFromContents, false);
 AddUserTypeExclude(dftDictEntryName, en_Document, op_AddBookmarkFromContents, false);
 AddUserTypeExclude(dftDictSubEntryName, en_Document, op_AddBookmarkFromContents, false);
 AddUserTypeExclude(dftAnnotationName, en_Document, op_AddBookmarkFromContents, false);
 AddUserTypeExclude(dftConsultationName, en_Document, op_AddBookmarkFromContents, false);
 AddUserTypeExclude(dftTranslationName, en_Document, op_AddBookmarkFromContents, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_Document, op_AddBookmarkFromContents, false);
 AddUserTypeExclude(dftTipsName, en_Document, op_AddBookmarkFromContents, false);
 AddUserTypeExclude(dftMedDictEntryName, en_Document, op_AddBookmarkFromContents, false);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_Document, op_AddBookmarkFromContents, false);
 AddUserTypeExclude(dftNoneName, en_Document, op_LiteratureListForDictionary, false);
 AddUserTypeExclude(dftDocumentName, en_Document, op_LiteratureListForDictionary, false);
 AddUserTypeExclude(dftRelatedDocName, en_Document, op_LiteratureListForDictionary, false);
 AddUserTypeExclude(dftDocSynchroViewName, en_Document, op_LiteratureListForDictionary, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_Document, op_LiteratureListForDictionary, false);
 AddUserTypeExclude(dftDictSubEntryName, en_Document, op_LiteratureListForDictionary, false);
 AddUserTypeExclude(dftAnnotationName, en_Document, op_LiteratureListForDictionary, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_Document, op_LiteratureListForDictionary, false);
 AddUserTypeExclude(dftConsultationName, en_Document, op_LiteratureListForDictionary, false);
 AddUserTypeExclude(dftTranslationName, en_Document, op_LiteratureListForDictionary, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_Document, op_LiteratureListForDictionary, false);
 AddUserTypeExclude(dftTipsName, en_Document, op_LiteratureListForDictionary, false);
 AddUserTypeExclude(dftMedDictEntryName, en_Document, op_LiteratureListForDictionary, false);
 AddUserTypeExclude(dftAutoreferatName, en_Document, op_LiteratureListForDictionary, false);
 AddUserTypeExclude(dftDrugName, en_Document, op_LiteratureListForDictionary, false);
 AddUserTypeExclude(dftMedicFirmName, en_Document, op_LiteratureListForDictionary, false);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_Document, op_LiteratureListForDictionary, false);
 AddUserTypeExclude(dftDrugSynchroViewName, en_Document, op_LiteratureListForDictionary, false);
 AddUserTypeExclude(dftAACLeftName, en_Document, op_LiteratureListForDictionary, false);
 AddUserTypeExclude(dftAACRightName, en_Document, op_LiteratureListForDictionary, false);
 AddUserTypeExclude(dftAACContentsLeftName, en_Document, op_LiteratureListForDictionary, false);
 AddUserTypeExclude(dftAACContentsRightName, en_Document, op_LiteratureListForDictionary, false);
 AddUserTypeExclude(dftNoneName, en_Document, op_OpenProducedDrugList, false);
 AddUserTypeExclude(dftDocumentName, en_Document, op_OpenProducedDrugList, false);
 AddUserTypeExclude(dftRelatedDocName, en_Document, op_OpenProducedDrugList, false);
 AddUserTypeExclude(dftDocSynchroViewName, en_Document, op_OpenProducedDrugList, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_Document, op_OpenProducedDrugList, false);
 AddUserTypeExclude(dftDictEntryName, en_Document, op_OpenProducedDrugList, false);
 AddUserTypeExclude(dftDictSubEntryName, en_Document, op_OpenProducedDrugList, false);
 AddUserTypeExclude(dftAnnotationName, en_Document, op_OpenProducedDrugList, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_Document, op_OpenProducedDrugList, false);
 AddUserTypeExclude(dftConsultationName, en_Document, op_OpenProducedDrugList, false);
 AddUserTypeExclude(dftTranslationName, en_Document, op_OpenProducedDrugList, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_Document, op_OpenProducedDrugList, false);
 AddUserTypeExclude(dftTipsName, en_Document, op_OpenProducedDrugList, false);
 AddUserTypeExclude(dftMedDictEntryName, en_Document, op_OpenProducedDrugList, false);
 AddUserTypeExclude(dftAutoreferatName, en_Document, op_OpenProducedDrugList, false);
 AddUserTypeExclude(dftDrugName, en_Document, op_OpenProducedDrugList, false);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_Document, op_OpenProducedDrugList, false);
 AddUserTypeExclude(dftDrugSynchroViewName, en_Document, op_OpenProducedDrugList, false);
 AddUserTypeExclude(dftAACLeftName, en_Document, op_OpenProducedDrugList, false);
 AddUserTypeExclude(dftAACRightName, en_Document, op_OpenProducedDrugList, false);
 AddUserTypeExclude(dftAACContentsLeftName, en_Document, op_OpenProducedDrugList, false);
 AddUserTypeExclude(dftAACContentsRightName, en_Document, op_OpenProducedDrugList, false);
 AddUserTypeExclude(dftNoneName, en_Document, op_OpenSimilarDrugList, false);
 AddUserTypeExclude(dftDocumentName, en_Document, op_OpenSimilarDrugList, false);
 AddUserTypeExclude(dftRelatedDocName, en_Document, op_OpenSimilarDrugList, false);
 AddUserTypeExclude(dftDocSynchroViewName, en_Document, op_OpenSimilarDrugList, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_Document, op_OpenSimilarDrugList, false);
 AddUserTypeExclude(dftDictEntryName, en_Document, op_OpenSimilarDrugList, false);
 AddUserTypeExclude(dftDictSubEntryName, en_Document, op_OpenSimilarDrugList, false);
 AddUserTypeExclude(dftAnnotationName, en_Document, op_OpenSimilarDrugList, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_Document, op_OpenSimilarDrugList, false);
 AddUserTypeExclude(dftConsultationName, en_Document, op_OpenSimilarDrugList, false);
 AddUserTypeExclude(dftTranslationName, en_Document, op_OpenSimilarDrugList, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_Document, op_OpenSimilarDrugList, false);
 AddUserTypeExclude(dftTipsName, en_Document, op_OpenSimilarDrugList, false);
 AddUserTypeExclude(dftMedDictEntryName, en_Document, op_OpenSimilarDrugList, false);
 AddUserTypeExclude(dftAutoreferatName, en_Document, op_OpenSimilarDrugList, false);
 AddUserTypeExclude(dftMedicFirmName, en_Document, op_OpenSimilarDrugList, false);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_Document, op_OpenSimilarDrugList, false);
 AddUserTypeExclude(dftDrugSynchroViewName, en_Document, op_OpenSimilarDrugList, false);
 AddUserTypeExclude(dftAACLeftName, en_Document, op_OpenSimilarDrugList, false);
 AddUserTypeExclude(dftAACRightName, en_Document, op_OpenSimilarDrugList, false);
 AddUserTypeExclude(dftAACContentsLeftName, en_Document, op_OpenSimilarDrugList, false);
 AddUserTypeExclude(dftAACContentsRightName, en_Document, op_OpenSimilarDrugList, false);
 AddUserTypeExclude(dftNoneName, en_BaseSearchPresentationHolder, op_GetBaseSearchPresentation, false);
 AddUserTypeExclude(dftDocumentName, en_BaseSearchPresentationHolder, op_GetBaseSearchPresentation, false);
 AddUserTypeExclude(dftRelatedDocName, en_BaseSearchPresentationHolder, op_GetBaseSearchPresentation, false);
 AddUserTypeExclude(dftDocSynchroViewName, en_BaseSearchPresentationHolder, op_GetBaseSearchPresentation, false);
 AddUserTypeExclude(dftRelatedSynchroViewName, en_BaseSearchPresentationHolder, op_GetBaseSearchPresentation, false);
 AddUserTypeExclude(dftDictEntryName, en_BaseSearchPresentationHolder, op_GetBaseSearchPresentation, false);
 AddUserTypeExclude(dftDictSubEntryName, en_BaseSearchPresentationHolder, op_GetBaseSearchPresentation, false);
 AddUserTypeExclude(dftAnnotationName, en_BaseSearchPresentationHolder, op_GetBaseSearchPresentation, false);
 AddUserTypeExclude(dftAutoreferatAfterSearchName, en_BaseSearchPresentationHolder, op_GetBaseSearchPresentation, false);
 AddUserTypeExclude(dftConsultationName, en_BaseSearchPresentationHolder, op_GetBaseSearchPresentation, false);
 AddUserTypeExclude(dftTranslationName, en_BaseSearchPresentationHolder, op_GetBaseSearchPresentation, false);
 AddUserTypeExclude(dftAnnotationSynchroViewName, en_BaseSearchPresentationHolder, op_GetBaseSearchPresentation, false);
 AddUserTypeExclude(dftTipsName, en_BaseSearchPresentationHolder, op_GetBaseSearchPresentation, false);
 AddUserTypeExclude(dftMedDictEntryName, en_BaseSearchPresentationHolder, op_GetBaseSearchPresentation, false);
 AddUserTypeExclude(dftAutoreferatName, en_BaseSearchPresentationHolder, op_GetBaseSearchPresentation, false);
 AddUserTypeExclude(dftDrugName, en_BaseSearchPresentationHolder, op_GetBaseSearchPresentation, false);
 AddUserTypeExclude(dftMedicFirmName, en_BaseSearchPresentationHolder, op_GetBaseSearchPresentation, false);
 AddUserTypeExclude(dftMedicFirmSynchroViewName, en_BaseSearchPresentationHolder, op_GetBaseSearchPresentation, false);
 AddUserTypeExclude(dftDrugSynchroViewName, en_BaseSearchPresentationHolder, op_GetBaseSearchPresentation, false);
 AddUserTypeExclude(dftAACRightName, en_BaseSearchPresentationHolder, op_GetBaseSearchPresentation, false);
 AddUserTypeExclude(dftAACContentsLeftName, en_BaseSearchPresentationHolder, op_GetBaseSearchPresentation, false);
 AddUserTypeExclude(dftAACContentsRightName, en_BaseSearchPresentationHolder, op_GetBaseSearchPresentation, false);
end;

{$IfEnd} //not Admin AND not Monitorings

initialization
{$If not defined(Admin) AND not defined(Monitorings)}
 {$Include ..\Forms\SearcheableText.imp.pas}
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
 {$Include w:\garant6x\implementation\Garant\GbaNemesis\View\DocumentUserTypes.imp.pas}
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
//#UC START# *4C40048600C1*
 g_GoToIntranetMessage := RegisterWindowMessage('{A6BE0224-FE97-4984-8E91-B24104812165}');
//#UC END# *4C40048600C1*
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ������������� str_ViewChangesOpName
 str_ViewChangesOpName.Init;
{$IfEnd} //not Admin AND not Monitorings

end.