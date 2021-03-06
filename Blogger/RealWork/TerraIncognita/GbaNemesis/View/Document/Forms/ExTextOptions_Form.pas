unit ExTextOptions_Form;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "View"
// �����: ����� �.�.
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/View/Document/Forms/ExTextOptions_Form.pas"
// �����: 02.09.2010 14:45
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<VCMContainer::Class>> F1 ������ � ���������� � ������� ����������::Document::View::Document::ExTextOptions
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
  l3Interfaces,
  k2Interfaces,
  afwInterfaces
  {$If not defined(NoVCM)}
  ,
  vcmExternalInterfaces
  {$IfEnd} //not NoVCM
  ,
  l3Units,
  Classes,
  nevTools,
  eeInterfaces,
  ExText_Form,
  Document_Strange_Controls,
  Base_Operations_Editions_Controls,
  DataAdapterInterfaces,
  nevContainers,
  Base_Operations_Strange_Controls,
  Search_Strange_Controls,
  bsTypesNew
  {$If defined(Nemesis)}
  ,
  nscReminder
  {$IfEnd} //Nemesis
  
  {$If defined(Nemesis)}
  ,
  nscRemindersLine
  {$IfEnd} //Nemesis
  
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
  vcmControllers
  {$IfEnd} //not NoVCM
  ,
  DocumentUnit,
  nsTypes,
  AdapterFacade,
  nevNavigation,
  DocumentAndListInterfaces,
  vcmInterfaces {a},
  vcmEntityForm {a}
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}
type
 TExTextOptionsForm = {form} class(TExTextForm)
 private
 // private fields
   f_WarnPreActive : TnscReminder;
    {* ���� ��� �������� WarnPreActive}
   f_WarnRedaction : TnscReminder;
    {* ���� ��� �������� WarnRedaction}
   f_WarnTimeMachineException : TnscReminder;
    {* ���� ��� �������� WarnTimeMachineException}
   f_WarnIsAbolished : TnscReminder;
    {* ���� ��� �������� WarnIsAbolished}
   f_WarnJuror : TnscReminder;
    {* ���� ��� �������� WarnJuror}
   f_WarnOnControl : TnscReminder;
    {* ���� ��� �������� WarnOnControl}
   f_WarnTimeMachineOn : TnscReminder;
    {* ���� ��� �������� WarnTimeMachineOn}
   f_WarnTimeMachineWarning : TnscReminder;
    {* ���� ��� �������� WarnTimeMachineWarning}
   f_WarnInactualDocument : TnscReminder;
    {* ���� ��� �������� WarnInactualDocument}
   f_RemindersLine : TnscRemindersLine;
    {* ���� ��� �������� RemindersLine}
 protected
  procedure InitEntities; override;
  procedure MakeControls; override;
 private
 // private methods
   procedure TextBlockChange(aSender: TObject);
   procedure TextBlockScroll(aSender: TObject;
     const aDown: Boolean);
   function TextMouseAction(aSender: TObject;
     const aHotSpot: IeeHotSpot;
     aButton: TeeMouseButton;
     anAction: TeeMouseAction;
     Keys: TeeShiftState;
     aWasSelection: LongBool): LongBool;
   procedure TextCanSplitPara(aSender: TObject;
     const aPara: IeePara;
     var Allow: Boolean);
   procedure TextUserCommentsHidden(Sender: TObject);
   procedure TextAfterFirstPaint(Sender: TObject);
   procedure TextCommentsVisibleChanged(Sender: TObject);
   procedure TextShowDocumentPartsChanged(Sender: TObject);
   procedure TextDrawSpecialChange(Sender: TObject);
   function SubPanelMouseOverSub(Sender: TObject;
     const Pt: Tl3SPoint;
     const R: Tl3SRect;
     const aSub: IevSub;
     aLayer: Integer): Boolean;
   procedure SubPanelClickSub(Sender: TObject;
     SubType: Integer;
     SubHandle: Integer;
     aKind: TafwClickKind);
   procedure VcmEntityFormRefGetStatus(aSender: TObject;
     out theStatus: TafwStatusInfo);
   function GetContentsElement(const aBlock: IevDocumentPart): IevDocumentPart;
 protected
 // realized methods
   procedure ReloadRedaction(aChangeType: TnsChangeRedactionType;
    aRedaction: TRedactionID = 0); override;
   function ReloadRedaction(const aDate: AdapterDate): Boolean; override;
   procedure SetActualRedaction; override;
   function ExtractRangeFromContents(const aData: IUnknown;
    aUserType: Integer): InevRange; override;
   procedure ExportBlock(const aRange: InevRange;
    ToActiveWindow: Boolean); override;
   procedure SelectBlock(const aRange: InevRange); override;
   procedure CopyBlock(const aRange: InevRange); override;
   procedure PrintBlock(const aRange: InevRange); override;
   procedure PrintDialogBlock(const aRange: InevRange); override;
   procedure PreviewBlock(const aRange: InevRange); override;
   function FindBookmarkInText(const aBookmark: IBookmark;
    out aSub: IeeSub): Boolean; override;
   procedure InitHyperLink(const aHyperLink: IevHyperlink;
    const aBaseEntity: IUnknown); override;
   function EnableRedactionOps(const aParams: IvcmTestParamsPrim): Boolean; override;
   procedure OpenInWindow(aNew: Boolean = true); override;
   procedure Openable_OpenInNewWindow_Test(const aParams: IvcmTestParamsPrim);
   procedure Openable_OpenInNewWindow_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure SubPanelSettings_Show_Test(const aParams: IvcmTestParamsPrim);
     {* ���������� ����� }
   procedure SubPanelSettings_Show_Execute(const aParams: IvcmExecuteParamsPrim);
     {* ���������� ����� }
   procedure Reminder_RemWarnJuror_Test(const aParams: IvcmTestParamsPrim);
   procedure Reminder_RemWarnJuror_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Reminder_RemWarnTimeMachineOn_Test(const aParams: IvcmTestParamsPrim);
   procedure Reminder_RemWarnTimeMachineOn_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Reminder_RemWarnRedaction_Test(const aParams: IvcmTestParamsPrim);
   procedure Reminder_RemWarnRedaction_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Reminder_RemWarnOnControl_Test(const aParams: IvcmTestParamsPrim);
   procedure Reminder_RemWarnOnControl_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Reminder_RemWarnIsAbolished_Test(const aParams: IvcmTestParamsPrim);
   procedure Reminder_RemWarnIsAbolished_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Reminder_RemWarnTimeMachineException_Test(const aParams: IvcmTestParamsPrim);
   procedure Reminder_RemWarnTimeMachineException_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Reminder_RemWarnPreActive_Test(const aParams: IvcmTestParamsPrim);
   procedure Reminder_RemWarnPreActive_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Reminder_RemWarnTimeMachineWarning_Test(const aParams: IvcmTestParamsPrim);
   procedure Reminder_RemWarnTimeMachineWarning_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Reminder_ViewInactualDocument_Test(const aParams: IvcmTestParamsPrim);
   procedure Reminder_ViewInactualDocument_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure CreateTOC(const aTOC: IdeSimpleTree); override;
   procedure Document_ChangesButton_Test(const aParams: IvcmTestParamsPrim);
     {* ��������� � ��������� }
   procedure SubsPanel_CopySubNumber_Test(const aParams: IvcmTestParamsPrim);
     {* ���������� ������� }
   procedure SubsPanel_CopySubNumber_Execute(const aParams: IvcmExecuteParamsPrim);
     {* ���������� ������� }
 protected
 // overridden protected methods
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
   procedure EntitiesInited; override;
     {* ���������� ����� ���� ��� ��� �������� ���������������� }
   {$IfEnd} //not NoVCM
   {$If not defined(NoVCM)}
   function SaveOwnFormState(out theState: IvcmBase;
    aStateType: TvcmStateType): Boolean; override;
   {$IfEnd} //not NoVCM
   procedure ClearFields; override;
 protected
 // protected fields
   f_DocOpsList : IvcmItems;
 protected
 // protected methods
   procedure SetReminderOpParams(const aParams: IvcmTestParamsPrim;
     const aInfo: Il3CString;
     const aCaption: Il3CString = nil);
   function WarnJurorInfo: Il3CString;
     {* ��������� � �������������� "� ��������� �������� ������� ���������" }
   function TimeMachineWarningOnInfo: Il3CString;
     {* ��������� � �������������� ������ ������� �������� }
   function TimeMachineWarningOnHint: Il3CString;
     {* ��������� � �������������� ������ ������� �������� }
   function WarnPreActiveInfo: Il3CString;
     {* ��������� � �������������� �������� �� ������� � ���� }
   function HasWarning: Boolean;
   function WarnOnControlInfo: Il3CString;
     {* ��������� � �������������� �������� �� �������� ������ }
   function WarnIsAbolishedInfo: Il3CString;
     {* ��������� � �������������� �������� �������� ���� }
   function BaseTimeMachineWarningInfo(aType: TTMWarningType): Il3CString;
     {* ��������� � ��������������� ���������� ������ ������� }
   function TimeMachineWarningInfo: Il3CString;
     {* ��������� � �������������� ??? }
   function ExtractRangeFromSub(aID: Integer;
     aLayerID: Integer): InevRange;
   function ExtractRangeFromList(const aList: InevFlatSubsList): InevRange;
   function CurrentParaPos: TbsDocPos;
   function ContextEntitiesGetTarget(aControl: TComponent;
     aX: Integer;
     aY: Integer;
     out theTarget: IUnknown): Boolean;
   function SubPanelEntitiesGetTarget(aControl: TComponent;
     aX: Integer;
     aY: Integer;
     out theTarget: IUnknown): Boolean;
 public
 // public properties
   property WarnPreActive: TnscReminder
     read f_WarnPreActive;
   property WarnRedaction: TnscReminder
     read f_WarnRedaction;
   property WarnTimeMachineException: TnscReminder
     read f_WarnTimeMachineException;
   property WarnIsAbolished: TnscReminder
     read f_WarnIsAbolished;
   property WarnJuror: TnscReminder
     read f_WarnJuror;
   property WarnOnControl: TnscReminder
     read f_WarnOnControl;
   property WarnTimeMachineOn: TnscReminder
     read f_WarnTimeMachineOn;
   property WarnTimeMachineWarning: TnscReminder
     read f_WarnTimeMachineWarning;
   property WarnInactualDocument: TnscReminder
     read f_WarnInactualDocument;
   property RemindersLine: TnscRemindersLine
     read f_RemindersLine;
 end;//TExTextOptionsForm

 TvcmContainerFormRef = TExTextOptionsForm;
{$IfEnd} //not Admin AND not Monitorings

implementation

{$If not defined(Admin) AND not defined(Monitorings)}
uses
  l3String,
  ParaList_Const,
  k2Tags,
  l3Memory,
  k2DocumentBuffer,
  evCustomWikiReader,
  DataAdapter,
  SysUtils,
  nsHyperLinkProcessor,
  evCustomEditor,
  eePara,
  eeInterfacesEx,
  evdTypes
  {$If not defined(NoVCM)}
  ,
  vcmMessagesSupport
  {$IfEnd} //not NoVCM
  ,
  Dialogs
  {$If not defined(NoVCM)}
  ,
  StdRes
  {$IfEnd} //not NoVCM
  ,
  BaseTypesUnit,
  nsDocumentTools,
  DocumentUserTypes_dftDocument_UserType
  {$If not defined(NoVCM)}
  ,
  vcmBase
  {$IfEnd} //not NoVCM
  ,
  l3Base,
  DocumentUserTypes_dftRelatedDoc_UserType,
  bsUtils,
  WarningConst,
  ControlStatusUtils,
  resWarnImages,
  DocumentUserTypes_dftDrug_UserType,
  DocumentUserTypes_dftAutoreferat_UserType,
  DocumentUserTypes_dftAutoreferatAfterSearch_UserType,
  nsManagers,
  nsConst,
  eeParaTools,
  l3Chars,
  Controls,
  evDocumentPart,
  Forms,
  nsValueMaps,
  nsValueMapsIDs,
  DocumentUserTypes_dftDictEntry_UserType,
  DocumentUserTypes_dftMedDictEntry_UserType,
  DocumentUserTypes_dftConsultation_UserType,
  bsChangeRedationWorker,
  afwFacade,
  afwNavigation,
  nsOpenUtils,
  DocumentInterfaces,
  l3TreeInterfaces,
  deSimpleTree,
  nevRangeList,
  nevRangeListTools,
  evMultiSelectionBlock
  {$If not defined(NoVCM)}
  ,
  vcmItems
  {$IfEnd} //not NoVCM
  ,
  evConstStringData,
  eeEditor,
  eeSubPanel,
  DocumentUserTypes_dftAACRight_UserType,
  DocumentUserTypes_dftAACLeft_UserType
  {$If not defined(NoScripts)}
  ,
  tfwScriptingInterfaces
  {$IfEnd} //not NoScripts
  ,
  OfficeLike_Text_Controls,
  OfficeLike_Usual_Controls,
  Base_Operations_F1Specific_Controls,
  Common_Strange_Controls,
  Base_Operations_View_Controls,
  Document_F1Lite_Controls
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}

const
   { SubLayers }
  c_Div = 10;
  c_GarantComment = - (ev_sbtMark * c_Div + 0);
   { ����������� ������� � SubPanel }
  c_UserComment = - (ev_sbtMark * c_Div + 1);
   { ���������������� ����������� � SubPanel }
  c_VersionComment = - (ev_sbtMark * c_Div + 2);
   { ���������� ����������� ������� � SubPanel }

type
  Tkw_ExTextOptions_Control_WarnPreActive = class(TtfwControlString)
   {* ����� ������� ��� �������������� �������� WarnPreActive
----
*������ �������������*:
[code]
�������::WarnPreActive TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_ExTextOptions_Control_WarnPreActive

// start class Tkw_ExTextOptions_Control_WarnPreActive

{$If not defined(NoScripts)}
function Tkw_ExTextOptions_Control_WarnPreActive.GetString: AnsiString;
 {-}
begin
 Result := 'WarnPreActive';
end;//Tkw_ExTextOptions_Control_WarnPreActive.GetString
{$IfEnd} //not NoScripts

type
  Tkw_ExTextOptions_Control_WarnPreActive_Push = class(TkwBynameControlPush)
   {* ����� ������� ��� �������� WarnPreActive
----
*������ �������������*:
[code]
�������::WarnPreActive:push pop:control:SetFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_ExTextOptions_Control_WarnPreActive_Push

// start class Tkw_ExTextOptions_Control_WarnPreActive_Push

{$If not defined(NoScripts)}
procedure Tkw_ExTextOptions_Control_WarnPreActive_Push.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString('WarnPreActive');
 inherited;
end;//Tkw_ExTextOptions_Control_WarnPreActive_Push.DoDoIt
{$IfEnd} //not NoScripts

type
  Tkw_ExTextOptions_Control_WarnRedaction = class(TtfwControlString)
   {* ����� ������� ��� �������������� �������� WarnRedaction
----
*������ �������������*:
[code]
�������::WarnRedaction TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_ExTextOptions_Control_WarnRedaction

// start class Tkw_ExTextOptions_Control_WarnRedaction

{$If not defined(NoScripts)}
function Tkw_ExTextOptions_Control_WarnRedaction.GetString: AnsiString;
 {-}
begin
 Result := 'WarnRedaction';
end;//Tkw_ExTextOptions_Control_WarnRedaction.GetString
{$IfEnd} //not NoScripts

type
  Tkw_ExTextOptions_Control_WarnRedaction_Push = class(TkwBynameControlPush)
   {* ����� ������� ��� �������� WarnRedaction
----
*������ �������������*:
[code]
�������::WarnRedaction:push pop:control:SetFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_ExTextOptions_Control_WarnRedaction_Push

// start class Tkw_ExTextOptions_Control_WarnRedaction_Push

{$If not defined(NoScripts)}
procedure Tkw_ExTextOptions_Control_WarnRedaction_Push.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString('WarnRedaction');
 inherited;
end;//Tkw_ExTextOptions_Control_WarnRedaction_Push.DoDoIt
{$IfEnd} //not NoScripts

type
  Tkw_ExTextOptions_Control_WarnTimeMachineException = class(TtfwControlString)
   {* ����� ������� ��� �������������� �������� WarnTimeMachineException
----
*������ �������������*:
[code]
�������::WarnTimeMachineException TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_ExTextOptions_Control_WarnTimeMachineException

// start class Tkw_ExTextOptions_Control_WarnTimeMachineException

{$If not defined(NoScripts)}
function Tkw_ExTextOptions_Control_WarnTimeMachineException.GetString: AnsiString;
 {-}
begin
 Result := 'WarnTimeMachineException';
end;//Tkw_ExTextOptions_Control_WarnTimeMachineException.GetString
{$IfEnd} //not NoScripts

type
  Tkw_ExTextOptions_Control_WarnTimeMachineException_Push = class(TkwBynameControlPush)
   {* ����� ������� ��� �������� WarnTimeMachineException
----
*������ �������������*:
[code]
�������::WarnTimeMachineException:push pop:control:SetFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_ExTextOptions_Control_WarnTimeMachineException_Push

// start class Tkw_ExTextOptions_Control_WarnTimeMachineException_Push

{$If not defined(NoScripts)}
procedure Tkw_ExTextOptions_Control_WarnTimeMachineException_Push.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString('WarnTimeMachineException');
 inherited;
end;//Tkw_ExTextOptions_Control_WarnTimeMachineException_Push.DoDoIt
{$IfEnd} //not NoScripts

type
  Tkw_ExTextOptions_Control_WarnIsAbolished = class(TtfwControlString)
   {* ����� ������� ��� �������������� �������� WarnIsAbolished
----
*������ �������������*:
[code]
�������::WarnIsAbolished TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_ExTextOptions_Control_WarnIsAbolished

// start class Tkw_ExTextOptions_Control_WarnIsAbolished

{$If not defined(NoScripts)}
function Tkw_ExTextOptions_Control_WarnIsAbolished.GetString: AnsiString;
 {-}
begin
 Result := 'WarnIsAbolished';
end;//Tkw_ExTextOptions_Control_WarnIsAbolished.GetString
{$IfEnd} //not NoScripts

type
  Tkw_ExTextOptions_Control_WarnIsAbolished_Push = class(TkwBynameControlPush)
   {* ����� ������� ��� �������� WarnIsAbolished
----
*������ �������������*:
[code]
�������::WarnIsAbolished:push pop:control:SetFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_ExTextOptions_Control_WarnIsAbolished_Push

// start class Tkw_ExTextOptions_Control_WarnIsAbolished_Push

{$If not defined(NoScripts)}
procedure Tkw_ExTextOptions_Control_WarnIsAbolished_Push.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString('WarnIsAbolished');
 inherited;
end;//Tkw_ExTextOptions_Control_WarnIsAbolished_Push.DoDoIt
{$IfEnd} //not NoScripts

type
  Tkw_ExTextOptions_Control_WarnJuror = class(TtfwControlString)
   {* ����� ������� ��� �������������� �������� WarnJuror
----
*������ �������������*:
[code]
�������::WarnJuror TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_ExTextOptions_Control_WarnJuror

// start class Tkw_ExTextOptions_Control_WarnJuror

{$If not defined(NoScripts)}
function Tkw_ExTextOptions_Control_WarnJuror.GetString: AnsiString;
 {-}
begin
 Result := 'WarnJuror';
end;//Tkw_ExTextOptions_Control_WarnJuror.GetString
{$IfEnd} //not NoScripts

type
  Tkw_ExTextOptions_Control_WarnJuror_Push = class(TkwBynameControlPush)
   {* ����� ������� ��� �������� WarnJuror
----
*������ �������������*:
[code]
�������::WarnJuror:push pop:control:SetFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_ExTextOptions_Control_WarnJuror_Push

// start class Tkw_ExTextOptions_Control_WarnJuror_Push

{$If not defined(NoScripts)}
procedure Tkw_ExTextOptions_Control_WarnJuror_Push.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString('WarnJuror');
 inherited;
end;//Tkw_ExTextOptions_Control_WarnJuror_Push.DoDoIt
{$IfEnd} //not NoScripts

type
  Tkw_ExTextOptions_Control_WarnOnControl = class(TtfwControlString)
   {* ����� ������� ��� �������������� �������� WarnOnControl
----
*������ �������������*:
[code]
�������::WarnOnControl TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_ExTextOptions_Control_WarnOnControl

// start class Tkw_ExTextOptions_Control_WarnOnControl

{$If not defined(NoScripts)}
function Tkw_ExTextOptions_Control_WarnOnControl.GetString: AnsiString;
 {-}
begin
 Result := 'WarnOnControl';
end;//Tkw_ExTextOptions_Control_WarnOnControl.GetString
{$IfEnd} //not NoScripts

type
  Tkw_ExTextOptions_Control_WarnOnControl_Push = class(TkwBynameControlPush)
   {* ����� ������� ��� �������� WarnOnControl
----
*������ �������������*:
[code]
�������::WarnOnControl:push pop:control:SetFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_ExTextOptions_Control_WarnOnControl_Push

// start class Tkw_ExTextOptions_Control_WarnOnControl_Push

{$If not defined(NoScripts)}
procedure Tkw_ExTextOptions_Control_WarnOnControl_Push.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString('WarnOnControl');
 inherited;
end;//Tkw_ExTextOptions_Control_WarnOnControl_Push.DoDoIt
{$IfEnd} //not NoScripts

type
  Tkw_ExTextOptions_Control_WarnTimeMachineOn = class(TtfwControlString)
   {* ����� ������� ��� �������������� �������� WarnTimeMachineOn
----
*������ �������������*:
[code]
�������::WarnTimeMachineOn TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_ExTextOptions_Control_WarnTimeMachineOn

// start class Tkw_ExTextOptions_Control_WarnTimeMachineOn

{$If not defined(NoScripts)}
function Tkw_ExTextOptions_Control_WarnTimeMachineOn.GetString: AnsiString;
 {-}
begin
 Result := 'WarnTimeMachineOn';
end;//Tkw_ExTextOptions_Control_WarnTimeMachineOn.GetString
{$IfEnd} //not NoScripts

type
  Tkw_ExTextOptions_Control_WarnTimeMachineOn_Push = class(TkwBynameControlPush)
   {* ����� ������� ��� �������� WarnTimeMachineOn
----
*������ �������������*:
[code]
�������::WarnTimeMachineOn:push pop:control:SetFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_ExTextOptions_Control_WarnTimeMachineOn_Push

// start class Tkw_ExTextOptions_Control_WarnTimeMachineOn_Push

{$If not defined(NoScripts)}
procedure Tkw_ExTextOptions_Control_WarnTimeMachineOn_Push.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString('WarnTimeMachineOn');
 inherited;
end;//Tkw_ExTextOptions_Control_WarnTimeMachineOn_Push.DoDoIt
{$IfEnd} //not NoScripts

type
  Tkw_ExTextOptions_Control_WarnTimeMachineWarning = class(TtfwControlString)
   {* ����� ������� ��� �������������� �������� WarnTimeMachineWarning
----
*������ �������������*:
[code]
�������::WarnTimeMachineWarning TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_ExTextOptions_Control_WarnTimeMachineWarning

// start class Tkw_ExTextOptions_Control_WarnTimeMachineWarning

{$If not defined(NoScripts)}
function Tkw_ExTextOptions_Control_WarnTimeMachineWarning.GetString: AnsiString;
 {-}
begin
 Result := 'WarnTimeMachineWarning';
end;//Tkw_ExTextOptions_Control_WarnTimeMachineWarning.GetString
{$IfEnd} //not NoScripts

type
  Tkw_ExTextOptions_Control_WarnTimeMachineWarning_Push = class(TkwBynameControlPush)
   {* ����� ������� ��� �������� WarnTimeMachineWarning
----
*������ �������������*:
[code]
�������::WarnTimeMachineWarning:push pop:control:SetFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_ExTextOptions_Control_WarnTimeMachineWarning_Push

// start class Tkw_ExTextOptions_Control_WarnTimeMachineWarning_Push

{$If not defined(NoScripts)}
procedure Tkw_ExTextOptions_Control_WarnTimeMachineWarning_Push.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString('WarnTimeMachineWarning');
 inherited;
end;//Tkw_ExTextOptions_Control_WarnTimeMachineWarning_Push.DoDoIt
{$IfEnd} //not NoScripts

type
  Tkw_ExTextOptions_Control_WarnInactualDocument = class(TtfwControlString)
   {* ����� ������� ��� �������������� �������� WarnInactualDocument
----
*������ �������������*:
[code]
�������::WarnInactualDocument TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_ExTextOptions_Control_WarnInactualDocument

// start class Tkw_ExTextOptions_Control_WarnInactualDocument

{$If not defined(NoScripts)}
function Tkw_ExTextOptions_Control_WarnInactualDocument.GetString: AnsiString;
 {-}
begin
 Result := 'WarnInactualDocument';
end;//Tkw_ExTextOptions_Control_WarnInactualDocument.GetString
{$IfEnd} //not NoScripts

type
  Tkw_ExTextOptions_Control_WarnInactualDocument_Push = class(TkwBynameControlPush)
   {* ����� ������� ��� �������� WarnInactualDocument
----
*������ �������������*:
[code]
�������::WarnInactualDocument:push pop:control:SetFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_ExTextOptions_Control_WarnInactualDocument_Push

// start class Tkw_ExTextOptions_Control_WarnInactualDocument_Push

{$If not defined(NoScripts)}
procedure Tkw_ExTextOptions_Control_WarnInactualDocument_Push.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString('WarnInactualDocument');
 inherited;
end;//Tkw_ExTextOptions_Control_WarnInactualDocument_Push.DoDoIt
{$IfEnd} //not NoScripts

type
  Tkw_ExTextOptions_Component_RemindersLine = class(TtfwControlString)
   {* ����� ������� ��� �������������� ���������� RemindersLine
----
*������ �������������*:
[code]
���������::RemindersLine TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_ExTextOptions_Component_RemindersLine

// start class Tkw_ExTextOptions_Component_RemindersLine

{$If not defined(NoScripts)}
function Tkw_ExTextOptions_Component_RemindersLine.GetString: AnsiString;
 {-}
begin
 Result := 'RemindersLine';
end;//Tkw_ExTextOptions_Component_RemindersLine.GetString
{$IfEnd} //not NoScripts

procedure TExTextOptionsForm.TextBlockChange(aSender: TObject);
//#UC START# *4F82F0810313_4C7F801D0304_var*
var
 l_CurSub: IevSub;
//#UC END# *4F82F0810313_4C7F801D0304_var*
begin
//#UC START# *4F82F0810313_4C7F801D0304_impl*
 if (UserType in [dftDocument, dftDrug]) then
 begin
  with Text do
   l_CurSub := GetContentsElement(GetNearestBlockByCursor(nil));
  try
   if (l_CurSub <> nil) then
    Op_Contents_SetCurrent.Call(Aggregate, l_CurSub.ID);
  finally
   l_CurSub := nil;
  end;//try..finally
 end;//UserType in [dftDocument,dftDrug]
//#UC END# *4F82F0810313_4C7F801D0304_impl*
end;//TExTextOptionsForm.TextBlockChange

procedure TExTextOptionsForm.TextBlockScroll(aSender: TObject;
  const aDown: Boolean);
//#UC START# *4F82F0A0030A_4C7F801D0304_var*
var
 l_TopCursor : InevBasePoint;
 l_CurSub    : IevSub;
//#UC END# *4F82F0A0030A_4C7F801D0304_var*
begin
//#UC START# *4F82F0A0030A_4C7F801D0304_impl*
 if (UserType in [dftDocument, dftDrug]) then
  with Text do
  begin
   if GetTopCursor(l_TopCursor) then
   try
    l_CurSub := GetContentsElement(GetNearestBlockByCursor(l_TopCursor));
    try
     if (l_CurSub <> nil) then
      Op_Contents_MoveCurrent.Call(Aggregate, l_CurSub.ID, aDown);
    finally
     l_CurSub := nil;
    end;
   finally
    l_TopCursor := nil;
   end;
  end;
//#UC END# *4F82F0A0030A_4C7F801D0304_impl*
end;//TExTextOptionsForm.TextBlockScroll

function TExTextOptionsForm.TextMouseAction(aSender: TObject;
  const aHotSpot: IeeHotSpot;
  aButton: TeeMouseButton;
  anAction: TeeMouseAction;
  Keys: TeeShiftState;
  aWasSelection: LongBool): LongBool;
//#UC START# *4F82F0C7004D_4C7F801D0304_var*
var
 l_Picture : IeePicture;
//#UC END# *4F82F0C7004D_4C7F801D0304_var*
begin
//#UC START# *4F82F0C7004D_4C7F801D0304_impl*
 Result := false;
 if (aButton = ee_mbLeft) and (anAction in [ee_maUp, ee_maDouble])
    and (not aWasSelection) then
 begin
  if (ee_ssCtrl in Keys) then
   Exit;
  if Supports(aHotSpot.Para, IeePicture, l_Picture) then
   try
    Result := true;
    OpenPicture(aHotSpot.Para, l_Picture);
   finally
    l_Picture := nil;
   end;//try..finally
 end;//aButton = ee_mbLeft..
//#UC END# *4F82F0C7004D_4C7F801D0304_impl*
end;//TExTextOptionsForm.TextMouseAction

procedure TExTextOptionsForm.TextCanSplitPara(aSender: TObject;
  const aPara: IeePara;
  var Allow: Boolean);
//#UC START# *4F82F10600ED_4C7F801D0304_var*
//#UC END# *4F82F10600ED_4C7F801D0304_var*
begin
//#UC START# *4F82F10600ED_4C7F801D0304_impl*
 Allow := (Document <> nil) and (aPara.ID > 0);
//#UC END# *4F82F10600ED_4C7F801D0304_impl*
end;//TExTextOptionsForm.TextCanSplitPara

procedure TExTextOptionsForm.TextUserCommentsHidden(Sender: TObject);
//#UC START# *4F82F137005B_4C7F801D0304_var*
//#UC END# *4F82F137005B_4C7F801D0304_var*
begin
//#UC START# *4F82F137005B_4C7F801D0304_impl*
 if Ask(qr_UserCommentsHidden) then
  Text.ShowUserComments := true;
//#UC END# *4F82F137005B_4C7F801D0304_impl*
end;//TExTextOptionsForm.TextUserCommentsHidden

procedure TExTextOptionsForm.TextAfterFirstPaint(Sender: TObject);
//#UC START# *4F82F15D0133_4C7F801D0304_var*
//#UC END# *4F82F15D0133_4C7F801D0304_var*
begin
//#UC START# *4F82F15D0133_4C7F801D0304_impl*
 {$IfDef vcmUseProfilers}
 if UserType = dftDocument then
  ProfilersManager.Document.DocumentPainted;
 {$EndIf vcmUseProfilers}
//#UC END# *4F82F15D0133_4C7F801D0304_impl*
end;//TExTextOptionsForm.TextAfterFirstPaint

procedure TExTextOptionsForm.TextCommentsVisibleChanged(Sender: TObject);
//#UC START# *4F82F18203A7_4C7F801D0304_var*
//#UC END# *4F82F18203A7_4C7F801D0304_var*
begin
//#UC START# *4F82F18203A7_4C7F801D0304_impl*
 UpdateSubPanelDescription;
//#UC END# *4F82F18203A7_4C7F801D0304_impl*
end;//TExTextOptionsForm.TextCommentsVisibleChanged

procedure TExTextOptionsForm.TextShowDocumentPartsChanged(Sender: TObject);
//#UC START# *4F82F1A901BD_4C7F801D0304_var*
//#UC END# *4F82F1A901BD_4C7F801D0304_var*
begin
//#UC START# *4F82F1A901BD_4C7F801D0304_impl*
 Settings.SaveBoolean(pi_Document_ShowBlockBorders,
                      Text.ShowDocumentParts,
                      dv_Document_ShowBlockBorders);
//#UC END# *4F82F1A901BD_4C7F801D0304_impl*
end;//TExTextOptionsForm.TextShowDocumentPartsChanged

procedure TExTextOptionsForm.TextDrawSpecialChange(Sender: TObject);
//#UC START# *4F82F1CC00F6_4C7F801D0304_var*
//#UC END# *4F82F1CC00F6_4C7F801D0304_var*
begin
//#UC START# *4F82F1CC00F6_4C7F801D0304_impl*
 Settings.SaveBoolean(pi_Document_ShowSpatial,
                      Text.DrawSpecial,
                      dv_Document_ShowSpatial);
//#UC END# *4F82F1CC00F6_4C7F801D0304_impl*
end;//TExTextOptionsForm.TextDrawSpecialChange

function TExTextOptionsForm.SubPanelMouseOverSub(Sender: TObject;
  const Pt: Tl3SPoint;
  const R: Tl3SRect;
  const aSub: IevSub;
  aLayer: Integer): Boolean;
//#UC START# *4F82F1F10297_4C7F801D0304_var*
var
 l_Sep       : Il3CString;
 l_CT        : TeeCommentType;
 l_Hint      : Il3CString;

 procedure ParaProccessed(const aPara: IeePara);
 var
  l_ParaNumber : Integer;
  l_CurPara    : IeePara;
//  l_Subs       : IeeSubList;
  l_Marks       : IeeSubList;
  l_TextPara   : IeeTextPara;
 begin
  if (aPara <> nil) then
  begin
   l_CurPara := aPara;
   l_ParaNumber := 0;
   while l_CurPara <> nil do
   begin
    inc(l_ParaNumber);
    if Supports(l_CurPara, IeeTextPara, l_TextPara) then
     try
      if not l_TextPara.IsComment(l_CT) and
         not l3IsNil(l_TextPara.Text) then
       break;
(*    // ��� ������ � ��������� �� ����
      l_Subs := l_TextPara.Subs;
      if Assigned(l_Subs) then
       try
        if ((l_Subs.Count > 0) or (l_TextPara.IndexInParent = 0)) and (l_ParaNumber > 1) then //(���� ���� Sub) and (���� �������� �� ������)
         break; //��� ����������� � ���������� ���������
       finally
        l_Subs := nil
       end;*)

      if not l3IsNil(l_TextPara.Text) then
      begin
       l_Hint := l3Cat([l_Hint, l_Sep, l_TextPara.Text]);
       l_Sep := l3CStr(cc_HardEnter);
      end;//not l3IsNil(l_TextPara.Text)

      l_CurPara := eeNextOverallPara(l_TextPara, Text){.Next};
      // �������� ��������� - �����.
      if l_CurPara = nil then
       break;
      l_Marks := l_CurPara.Marks;
      //��� ����������� � ��������� ����� ����� - ����� ���
      if Assigned(l_Marks) and (l_Marks.Count > 0) then
       Break;
     finally
      l_TextPara := nil;
     end//try..finally
    else
     break;
   end;//while true
   if l3IsChar(l_Hint, l3Len(l_Hint) - 1, cc_HardEnter) then
    l_Hint := l3Copy(l_Hint, 0, l3Len(l_Hint) - 1);
  end;//aPara <> nil
 end;

var
 l_Para : IeePara;
 l_Sub  : IeeSub;
//#UC END# *4F82F1F10297_4C7F801D0304_var*
begin
//#UC START# *4F82F1F10297_4C7F801D0304_impl*
 Result := False;
 with Sender As TControl do
 begin
  ShowHint := false;
  try
   l_Hint := nil;
   try
    case aLayer of
     c_GarantComment:
      begin
       l_Sub := Text.Editor.Data.Document.Marks.SubsByID[aSub.ID];
       if (l_Sub <> nil) then
       begin
        l_Para := l_Sub.LeafPara;
        l_CT := ee_ctUsual;
        l_Hint := vcmCStr(str_nsGarantComment);
        if Text.ShowComments then
         Exit
        else
         l_Sep := vcmCStr(str_nsColonSpace);

        Result := True;
        ParaProccessed(l_Para);
       end;//l_Sub <> nil
      end; // c_GarantComment
     c_UserComment:
      begin
       l_Sub := Text.Editor.Data.Document.Marks.SubsByID[aSub.ID];
       if (l_Sub <> nil) then
       begin
        l_Para := l_Sub.LeafPara;
        l_CT := ee_ctUser;
        l_Hint := vcmCStr(str_nsUserComment);
        if Text.ShowUserComments then
         Exit
        else
         l_Sep := vcmCStr(str_nsColonSpace);

        Result := True;
        ParaProccessed(l_Para);
       end;//l_Sub <> nil
      end;// c_UserComment
     c_VersionComment:
      begin
       l_Sub := Text.Editor.Data.Document.Marks.SubsByID[aSub.ID];
       if (l_Sub <> nil) then
       begin
        l_Para := l_Sub.LeafPara;
        l_CT := ee_ctVersion;
        l_Hint := vcmCStr(str_nsVersionComment);
        if Text.ShowVersionComments then
         Exit
        else
         l_Sep := vcmCStr(str_nsColonSpace);

        Result := True;
        ParaProccessed(l_Para);
       end;//l_Sub <> nil
      end; // c_GarantComment
     else
      begin
       Result := True;
       if l3IsNil(l_Hint) then
       begin
        if (aSub.LayerID = ev_sbtSub) and
           ((aSub.SubPlace in ev_spInContents) OR
            (aSub.ID = c_DocumentSubID)) then
        begin
         if (aSub.ID <> c_DocumentSubID) then
          l_Hint := l3CStr(Text.GetDocumentPartHint(Text.Document.DocumentContainer.SubList.Block[aSub.ID]))
         else
          l_Hint := vcmCStr(str_WholeDocumentSubsMenu);
        end//aSub.LayerID = ev_sbtSub
        else
         l_Hint := l3CStr(aSub.Name);
        if l3IsNil(l_Hint) then
         l_Hint := l3CStr(evGetBlockName((aSub As Ik2Tag).Box).AsPCharLen);
        // ��� �������� � ��������� ����������� ��� �������
        if aSub.LayerID = ev_sbtBookmark then
         l_Hint := l3Cat([vcmCStr(str_nsBookmarkPrefix), l_Hint]);
       end;//l3IsNil(l_Hint)
      end;//else
    end;//case aLayer
   finally
    if not l3Same(l_Hint, Hint) then
     Application.CancelHint;
    Hint := l3Str(l_Hint);
   end;//try..finally
  finally
   ShowHint := true;
  end;//try..finally
 end;//Sender As TControl
//#UC END# *4F82F1F10297_4C7F801D0304_impl*
end;//TExTextOptionsForm.SubPanelMouseOverSub

procedure TExTextOptionsForm.SubPanelClickSub(Sender: TObject;
  SubType: Integer;
  SubHandle: Integer;
  aKind: TafwClickKind);
//#UC START# *4F82F22B023D_4C7F801D0304_var*
//#UC END# *4F82F22B023D_4C7F801D0304_var*
begin
//#UC START# *4F82F22B023D_4C7F801D0304_impl*
 if (aKind = afw_ckSingle) then
  SubPanel.ShowMenu;
(* if (SubType = c_GarantComment) and
     not Text.ShowComments then
  ChangeJurorCommentsVisibility
 else
  if (SubType = c_UserComment) and
     not Text.ShowUserComments then
   ChangeUserCommentsVisibility;*)
//#UC END# *4F82F22B023D_4C7F801D0304_impl*
end;//TExTextOptionsForm.SubPanelClickSub

procedure TExTextOptionsForm.VcmEntityFormRefGetStatus(aSender: TObject;
  out theStatus: TafwStatusInfo);
//#UC START# *4F82F2FF00B9_4C7F801D0304_var*
//#UC END# *4F82F2FF00B9_4C7F801D0304_var*
begin
//#UC START# *4F82F2FF00B9_4C7F801D0304_impl*
 if (UserType in [dftAutoreferatAfterSearch, dftAutoreferat]) and
    (Document <> nil) then
 begin
  SetLength(theStatus.rStrings, Length(theStatus.rStrings) + 1);
  theStatus.rStrings[Length(theStatus.rStrings) - 1] := vcmFmt(str_AnnotationCount, [Document.GetAutoReferatDocCount]);
 end;//UserType in [dftAutoreferatAfterSearch, dftAutoreferat]
//#UC END# *4F82F2FF00B9_4C7F801D0304_impl*
end;//TExTextOptionsForm.VcmEntityFormRefGetStatus

function TExTextOptionsForm.GetContentsElement(const aBlock: IevDocumentPart): IevDocumentPart;
//#UC START# *4F82FDD7022B_4C7F801D0304_var*
var
 l_Block: IevDocumentPart;
//#UC END# *4F82FDD7022B_4C7F801D0304_var*
begin
//#UC START# *4F82FDD7022B_4C7F801D0304_impl*
 Result := nil;
 if (aBlock <> nil) then
 begin
  l_Block := aBlock;
  while (l_Block <> nil) do
  begin
   if (l_Block.SubPlace in ev_spInContents) then
   begin
    Result := l_Block;
    break;
   end//l_Block.SubPlace in ev_spInContents
   else
    l_Block := l_Block.ParentDocumentPart;
  end;//while (l_Block <> nil)
 end;//aBlock <> nil
//#UC END# *4F82FDD7022B_4C7F801D0304_impl*
end;//TExTextOptionsForm.GetContentsElement

procedure TExTextOptionsForm.SetReminderOpParams(const aParams: IvcmTestParamsPrim;
  const aInfo: Il3CString;
  const aCaption: Il3CString = nil);

 function RefineBaloonHint(const aHint: Il3CString): Il3CString;

  procedure MergeText(const aRoot: Ik2Tag;
    var theText: Il3CString);

   function DoIt(const anItem: Ik2Tag;
     anIndex: Integer): Boolean;
   //#UC START# *66C7C35BA1A6__var*
   //#UC END# *66C7C35BA1A6__var*
   begin
   //#UC START# *66C7C35BA1A6__impl*
    Result := true;
    if anItem.InheritsFrom(k2_idParaList) then
     MergeText(anItem, theText)
    else
    begin
     if (theText = nil) then
      theText := l3CStr(anItem.PCharLenA[k2_tiText])
     else
     begin
      theText := l3Cat(theText, #10);
      theText := l3Cat([theText, l3CStr(anItem.PCharLenA[k2_tiText])]);
     end;//theText = nil
    end;//anItem.InheritsFrom(k2_idParaList)
   //#UC END# *66C7C35BA1A6__impl*
   end;//DoIt

  //#UC START# *4F916E210355__var*
  //#UC END# *4F916E210355__var*
  begin
   //#UC START# *4F916E210355iter*
   aRoot.
   //#UC END# *4F916E210355iter*
    IterateChildrenF(L2Ik2TagIterateChildrenFAction(@DoIt));
  end;//MergeText

 //#UC START# *4F916DF101C2__var*
 var
  l_R : TevCustomWikiReader;
  l_G : Tk2DocumentBuffer;
  l_S : Tl3ConstMemoryStream;
  l_W : Tl3WString;
 //#UC END# *4F916DF101C2__var*
 begin
 //#UC START# *4F916DF101C2__impl*
  //Result := aHint;
  Result := nil;
  l_R := TevCustomWikiReader.Create;
  try
   l_G := Tk2DocumentBuffer.Create;
   try
    l_R.Generator := l_G;
    l_W := aHint.AsWStr;
    l_S := Tl3ConstMemoryStream.Create(l_W.S, l_W.SLen);
    try
     l_R.Filer.NeedProcessMessages := false;
     l_R.Filer.Indicator.NeedProgressProc := false;
     l_R.Filer.COMStream := l_S;
     try
      l_R.Filer.CodePage := l_W.SCodePage;
      l_R.Execute;
     finally
      l_R.Filer.COMStream := nil;
     end;//try..finally
    finally
     FreeAndNil(l_S);
    end;//try..finally
    MergeText(l_G.Root, Result);
   finally
    FreeAndNil(l_G);
   end;//try..finally
  finally
   FreeAndNil(l_R);
  end;//try..finally
 //#UC END# *4F916DF101C2__impl*
 end;//RefineBaloonHint

//#UC START# *4C7FAE9B01E1_4C7F801D0304_var*
//#UC END# *4C7FAE9B01E1_4C7F801D0304_var*
begin
//#UC START# *4C7FAE9B01E1_4C7F801D0304_impl*
 with aParams.Op do
 begin
  Flag[vcm_ofVisible] := (aInfo <> nil);
  if Flag[vcm_ofVisible] then
  begin
   Hint := RefineBaloonHint(aInfo);
   LongHint := Hint;
   Caption := aCaption;
  end;//Flag[vcm_ofVisible]
 end;//with aParams.Op do
//#UC END# *4C7FAE9B01E1_4C7F801D0304_impl*
end;//TExTextOptionsForm.SetReminderOpParams

function TExTextOptionsForm.WarnJurorInfo: Il3CString;
//#UC START# *4C80CFC301F1_4C7F801D0304_var*
//#UC END# *4C80CFC301F1_4C7F801D0304_var*
begin
//#UC START# *4C80CFC301F1_4C7F801D0304_impl*
 if HasWarning and
    not (Document.GetStatus in [IS_ABOLISHED, IS_PREACTIVE]) and
    not (UserType in [dftAACRight]) then
  Result := nsGetDocumentWarning(Document)
 else
  Result := nil;
//#UC END# *4C80CFC301F1_4C7F801D0304_impl*
end;//TExTextOptionsForm.WarnJurorInfo

function TExTextOptionsForm.TimeMachineWarningOnInfo: Il3CString;
//#UC START# *4C80D03001DC_4C7F801D0304_var*
//#UC END# *4C80D03001DC_4C7F801D0304_var*
begin
//#UC START# *4C80D03001DC_4C7F801D0304_impl*
 if (UserType in [dftDocument, dftAACLeft]) and
   DefDataAdapter.TimeMachine.IsOn then
  Result := l3Fmt(vcmConstString(str_TimeMachineTurnOnOnDate),
   [DefDataAdapter.TimeMachine.DateStr])
 else
  Result := nil;
//#UC END# *4C80D03001DC_4C7F801D0304_impl*
end;//TExTextOptionsForm.TimeMachineWarningOnInfo

function TExTextOptionsForm.TimeMachineWarningOnHint: Il3CString;
//#UC START# *4C80D0730151_4C7F801D0304_var*
//#UC END# *4C80D0730151_4C7F801D0304_var*
begin
//#UC START# *4C80D0730151_4C7F801D0304_impl*
 if (UserType in [dftDocument, dftAACLeft]) and DefDataAdapter.TimeMachine.IsOn then
  Result := DefDataAdapter.TimeMachine.DateStr
 else
  Result := nil;
//#UC END# *4C80D0730151_4C7F801D0304_impl*
end;//TExTextOptionsForm.TimeMachineWarningOnHint

function TExTextOptionsForm.WarnPreActiveInfo: Il3CString;
//#UC START# *4C80D2370306_4C7F801D0304_var*
//#UC END# *4C80D2370306_4C7F801D0304_var*
begin
//#UC START# *4C80D2370306_4C7F801D0304_impl*
 Result := nil;
 if not (UserType in [dftAACRight]) then
  if HasWarning and (Document.GetStatus = IS_PREACTIVE) then
   Result := nsGetDocumentWarning(Document);
//#UC END# *4C80D2370306_4C7F801D0304_impl*
end;//TExTextOptionsForm.WarnPreActiveInfo

function TExTextOptionsForm.HasWarning: Boolean;
//#UC START# *4C80D52A007B_4C7F801D0304_var*
//#UC END# *4C80D52A007B_4C7F801D0304_var*
begin
//#UC START# *4C80D52A007B_4C7F801D0304_impl*
 Result := Assigned(Document) and Document.HasWarning;
//#UC END# *4C80D52A007B_4C7F801D0304_impl*
end;//TExTextOptionsForm.HasWarning

function TExTextOptionsForm.WarnOnControlInfo: Il3CString;
//#UC START# *4C80D61203E4_4C7F801D0304_var*
//#UC END# *4C80D61203E4_4C7F801D0304_var*
begin
//#UC START# *4C80D61203E4_4C7F801D0304_impl*
 if not (UserType in [dftAACRight])
  then Result := bsFullControlStatusHint(ucpUnderControl)
  else Result := nil;
//#UC END# *4C80D61203E4_4C7F801D0304_impl*
end;//TExTextOptionsForm.WarnOnControlInfo

function TExTextOptionsForm.WarnIsAbolishedInfo: Il3CString;
//#UC START# *4C80D65C01D8_4C7F801D0304_var*
//#UC END# *4C80D65C01D8_4C7F801D0304_var*
begin
//#UC START# *4C80D65C01D8_4C7F801D0304_impl*
 Result := nil;
 if not (UserType in [dftAACRight]) then
  if HasWarning and (Document.GetStatus = IS_ABOLISHED) then
   Result := nsGetDocumentWarning(Document);
//#UC END# *4C80D65C01D8_4C7F801D0304_impl*
end;//TExTextOptionsForm.WarnIsAbolishedInfo

function TExTextOptionsForm.BaseTimeMachineWarningInfo(aType: TTMWarningType): Il3CString;
//#UC START# *4C80D68600A1_4C7F801D0304_var*
//#UC END# *4C80D68600A1_4C7F801D0304_var*
begin
//#UC START# *4C80D68600A1_4C7F801D0304_impl*
 if not (defDataAdapter.TimeMachine.
   GetTimeMachineWarning(Document, Result) = aType) then
  Result := nil;
//#UC END# *4C80D68600A1_4C7F801D0304_impl*
end;//TExTextOptionsForm.BaseTimeMachineWarningInfo

function TExTextOptionsForm.TimeMachineWarningInfo: Il3CString;
//#UC START# *4C80D6CB002A_4C7F801D0304_var*
//#UC END# *4C80D6CB002A_4C7F801D0304_var*
begin
//#UC START# *4C80D6CB002A_4C7F801D0304_impl*
 Result := BaseTimeMachineWarningInfo(tmwWarning);
 if (Result = nil) and
   defDataAdapter.TimeMachine.HasNotSureWarning(Document) then
  Result := str_wgNotShureWarningHint.AsCStr;
//#UC END# *4C80D6CB002A_4C7F801D0304_impl*
end;//TExTextOptionsForm.TimeMachineWarningInfo

function TExTextOptionsForm.ExtractRangeFromSub(aID: Integer;
  aLayerID: Integer): InevRange;
//#UC START# *4F85B63D00DE_4C7F801D0304_var*
var
 l_Para: InevPara;
//#UC END# *4F85B63D00DE_4C7F801D0304_var*
begin
//#UC START# *4F85B63D00DE_4C7F801D0304_impl*
 if Text.Document.DocumentContainer.SubList.SubEx[aID, aLayerID].Para.QT(InevPara, l_Para) then
  Result := l_Para.SubRange(Text.View, 0, MaxInt).ParentRange(MaxInt)
 else
  Result := nil;
//#UC END# *4F85B63D00DE_4C7F801D0304_impl*
end;//TExTextOptionsForm.ExtractRangeFromSub

function TExTextOptionsForm.ExtractRangeFromList(const aList: InevFlatSubsList): InevRange;
//#UC START# *4F85B66E0260_4C7F801D0304_var*
var
 l_Ranges: TnevRangeList;
 l_IDX: Integer;
//#UC END# *4F85B66E0260_4C7F801D0304_var*
begin
//#UC START# *4F85B66E0260_4C7F801D0304_impl*
 if (aList.Count = 1) then
  with aList.First do
   Result := ExtractRangeFromSub(ID, LayerID)
 else
 begin
  l_Ranges := TnevRangeList.Make;
  try
   for l_IDX := 0 to aList.Count - 1 do
    nevAddRangeToList(l_Ranges, ExtractRangeFromSub(aList.Items[l_IDX].ID, aList.Items[l_IDX].LayerID));
   Result := TevMultiSelectionBlock.Make(Text.TextSource.Document, l_Ranges)
  finally
   FreeAndNil(l_Ranges);
  end;//try..finally
 end;//aList.Count = 1
//#UC END# *4F85B66E0260_4C7F801D0304_impl*
end;//TExTextOptionsForm.ExtractRangeFromList

function TExTextOptionsForm.CurrentParaPos: TbsDocPos;
//#UC START# *4F85B70C035A_4C7F801D0304_var*
var
 l_Para: IeePara;
//#UC END# *4F85B70C035A_4C7F801D0304_var*
begin
//#UC START# *4F85B70C035A_4C7F801D0304_impl*
 l_Para := GetTopParaID;
 try
  if Assigned(l_Para) then
   Result := TbsDocPos_P(l_Para)
  else
   Result := TbsDocPos_E;
 finally
  l_Para := nil;
 end;{try..finally}
//#UC END# *4F85B70C035A_4C7F801D0304_impl*
end;//TExTextOptionsForm.CurrentParaPos

function TExTextOptionsForm.ContextEntitiesGetTarget(aControl: TComponent;
  aX: Integer;
  aY: Integer;
  out theTarget: IUnknown): Boolean;
//#UC START# *4F88454E023C_4C7F801D0304_var*
//#UC END# *4F88454E023C_4C7F801D0304_var*
begin
//#UC START# *4F88454E023C_4C7F801D0304_impl*
 if (aControl is TeeEditor) then
 begin
  Result := True;
  TeeEditor(aControl).GetHotspotOnPoint(Point(aX, aY), IeeHotSpot(theTarget));
 end//aControl is TeeEditor
 else
  Result := False;
//#UC END# *4F88454E023C_4C7F801D0304_impl*
end;//TExTextOptionsForm.ContextEntitiesGetTarget

function TExTextOptionsForm.SubPanelEntitiesGetTarget(aControl: TComponent;
  aX: Integer;
  aY: Integer;
  out theTarget: IUnknown): Boolean;
//#UC START# *4F884583015D_4C7F801D0304_var*
//#UC END# *4F884583015D_4C7F801D0304_var*
begin
//#UC START# *4F884583015D_4C7F801D0304_impl*
 if (aControl is TeeSubPanel) then
 begin
  Result := True;
  TeeSubPanel(aControl).CheckSubOnPoint(aX, aY, IeeSub(theTarget));
 end//aControl is TeeSubPanel
 else
  Result := False;
//#UC END# *4F884583015D_4C7F801D0304_impl*
end;//TExTextOptionsForm.SubPanelEntitiesGetTarget

procedure TExTextOptionsForm.ReloadRedaction(aChangeType: TnsChangeRedactionType;
  aRedaction: TRedactionID = 0);
//#UC START# *4AE7354E03A4_4C7F801D0304_var*
var
 l_Para   : IeePara;
 l_Worker : IbsChangeRedactionWorker;
//#UC END# *4AE7354E03A4_4C7F801D0304_var*
begin
//#UC START# *4AE7354E03A4_4C7F801D0304_impl*
 if Assigned(dsDocument) and Assigned(dsDocument.DocInfo) then
 begin
  l_Para := RedactionCurrentPara;
  with DocumentSet do
  begin
   l_Worker := TbsChangeRedationById.Make(aChangeType, aRedaction);
   if Assigned(l_Para) then
    ChangeRedaction(l_Worker, TbsDocPos_P(l_Para))
   else
    ChangeRedaction(l_Worker, TbsDocPos_E);
  end;//with DocumentSet
 end;//Assigned(dsDocument)..
 SynchronizeWithRedationsForm;
//#UC END# *4AE7354E03A4_4C7F801D0304_impl*
end;//TExTextOptionsForm.ReloadRedaction

function TExTextOptionsForm.ReloadRedaction(const aDate: AdapterDate): Boolean;
//#UC START# *4AE7358F03E2_4C7F801D0304_var*
var
 l_Para   : IeePara;
 l_Worker : IbsChangeRedactionWorker;
//#UC END# *4AE7358F03E2_4C7F801D0304_var*
begin
//#UC START# *4AE7358F03E2_4C7F801D0304_impl*
 Result := False;
 if Assigned(dsDocument) and Assigned(dsDocument.DocInfo) then
 begin
  l_Para := RedactionCurrentPara;
  l_Worker := TbsChangeRelationByDate.Make(aDate);
  with DocumentSet do
   if Assigned(l_Para) then
    Result := ChangeRedaction(l_Worker, TbsDocPos_P(l_Para))
   else
    Result := ChangeRedaction(l_Worker, TbsDocPos_E);
 end;//if Assigned(dsDocument) and Assigned(dsDocument.DocInfo) then
 if Result then
  SynchronizeWithRedationsForm;
//#UC END# *4AE7358F03E2_4C7F801D0304_impl*
end;//TExTextOptionsForm.ReloadRedaction

procedure TExTextOptionsForm.SetActualRedaction;
//#UC START# *4AE73936003E_4C7F801D0304_var*
//#UC END# *4AE73936003E_4C7F801D0304_var*
begin
//#UC START# *4AE73936003E_4C7F801D0304_impl*
 if Assigned(dsDocument) and Assigned(dsDocument.DocInfo) then
  if not TdmStdRes.IsCurEditionActual(dsDocument.DocInfo.Doc) then
   ReloadRedaction(crtActual)
  else
  if (UserType = dftDocument) and
     Visible then
   DocumentSet.OpenWarning;
//#UC END# *4AE73936003E_4C7F801D0304_impl*
end;//TExTextOptionsForm.SetActualRedaction

function TExTextOptionsForm.ExtractRangeFromContents(const aData: IUnknown;
  aUserType: Integer): InevRange;
//#UC START# *4AE9DB55008E_4C7F801D0304_var*
var
 l_Sub  : IevSub;
 l_List : InevFlatSubsList;
//#UC END# *4AE9DB55008E_4C7F801D0304_var*
begin
//#UC START# *4AE9DB55008E_4C7F801D0304_impl*
 Result := nil;
 if not CheckParamForUserType(aUserType) then
  Exit;
 if Supports(aData, IevSub, l_Sub) then
  Result := ExtractRangeFromSub(l_Sub.ID, l_Sub.LayerID)
 else
 if Supports(aData, InevFlatSubsList, l_List) then
  Result := ExtractRangeFromList(l_List)
 else
 begin
  Result := nil;
  Assert(false);
 end;//Supports(aData, InevFlatSubsList, l_List)
//#UC END# *4AE9DB55008E_4C7F801D0304_impl*
end;//TExTextOptionsForm.ExtractRangeFromContents

procedure TExTextOptionsForm.ExportBlock(const aRange: InevRange;
  ToActiveWindow: Boolean);
//#UC START# *4AE9DC630356_4C7F801D0304_var*
const
 cMap: array [Boolean] of TnsExportKind = (ekShell, ekActiveWord);
//#UC END# *4AE9DC630356_4C7F801D0304_var*
begin
//#UC START# *4AE9DC630356_4C7F801D0304_impl*
 if Assigned(aRange) then
  DocumentExport(cMap[ToActiveWindow], true, aRange);
//#UC END# *4AE9DC630356_4C7F801D0304_impl*
end;//TExTextOptionsForm.ExportBlock

procedure TExTextOptionsForm.SelectBlock(const aRange: InevRange);
//#UC START# *4AEB099C0216_4C7F801D0304_var*
//#UC END# *4AEB099C0216_4C7F801D0304_var*
begin
//#UC START# *4AEB099C0216_4C7F801D0304_impl*
 if Assigned(aRange) then
  InevSelection(Text.Selection).Select(aRange, true);
//#UC END# *4AEB099C0216_4C7F801D0304_impl*
end;//TExTextOptionsForm.SelectBlock

procedure TExTextOptionsForm.CopyBlock(const aRange: InevRange);
//#UC START# *4AEB09F0027F_4C7F801D0304_var*
//#UC END# *4AEB09F0027F_4C7F801D0304_var*
begin
//#UC START# *4AEB09F0027F_4C7F801D0304_impl*
 if Assigned(aRange) then
  Text.CopyRange(aRange);
//#UC END# *4AEB09F0027F_4C7F801D0304_impl*
end;//TExTextOptionsForm.CopyBlock

procedure TExTextOptionsForm.PrintBlock(const aRange: InevRange);
//#UC START# *4AEB0A3A028D_4C7F801D0304_var*
var
 l_Preview : IafwComplexDocumentPreview;
//#UC END# *4AEB0A3A028D_4C7F801D0304_var*
begin
//#UC START# *4AEB0A3A028D_4C7F801D0304_impl*
 if Assigned(aRange) then
 begin
  l_Preview := Text.MakePreviewRangeAsDocument(aRange, nil);
  if (l_Preview <> nil) then
   l_Preview.Print;
 end;
//#UC END# *4AEB0A3A028D_4C7F801D0304_impl*
end;//TExTextOptionsForm.PrintBlock

procedure TExTextOptionsForm.PrintDialogBlock(const aRange: InevRange);
//#UC START# *4AEB0A7902CA_4C7F801D0304_var*
var
 l_Preview : IafwComplexDocumentPreview;
//#UC END# *4AEB0A7902CA_4C7F801D0304_var*
begin
//#UC START# *4AEB0A7902CA_4C7F801D0304_impl*
 if Assigned(aRange) and (afw.Application <> nil) AND
    (afw.Application.PrintManager <> nil) then
 begin
  l_Preview := Text.MakePreviewRangeAsDocument(aRange, nil);
  if (l_Preview <> nil) then
   afw.Application.PrintManager.PrintDialog(l_Preview);
 end;//if Assigned(aRange) and (afw.Application <> nil) AND...
//#UC END# *4AEB0A7902CA_4C7F801D0304_impl*
end;//TExTextOptionsForm.PrintDialogBlock

procedure TExTextOptionsForm.PreviewBlock(const aRange: InevRange);
//#UC START# *4AEB0AA60373_4C7F801D0304_var*
var
 l_Preview : IafwComplexDocumentPreview;
//#UC END# *4AEB0AA60373_4C7F801D0304_var*
begin
//#UC START# *4AEB0AA60373_4C7F801D0304_impl*
 if Assigned(aRange) and (afw.Application <> nil) AND
    (afw.Application.PrintManager <> nil) then
 begin
  l_Preview := Text.MakePreviewRangeAsDocument(aRange, nil);
  if (l_Preview <> nil) then
   afw.Application.PrintManager.ShowPreview(l_Preview);
 end;
//#UC END# *4AEB0AA60373_4C7F801D0304_impl*
end;//TExTextOptionsForm.PreviewBlock

function TExTextOptionsForm.FindBookmarkInText(const aBookmark: IBookmark;
  out aSub: IeeSub): Boolean;
//#UC START# *4AEEF8180282_4C7F801D0304_var*
var
 l_BookmarkID : Cardinal;
 l_Index      : Integer;
 l_Sub        : IeeSub;
//#UC END# *4AEEF8180282_4C7F801D0304_var*
begin
//#UC START# *4AEEF8180282_4C7F801D0304_impl*
 Result := False;
 aSub := nil;
 if Document.IsMyBookmark(aBookmark) then
  with Text.Editor.Data.Document.Bookmarks do
  begin
   l_BookmarkID := aBookmark.GetParagraph;
   for l_Index := 0 to Pred(Count) do
   begin
    l_Sub := Subs[l_Index];
    try
     if (l_Sub <> nil) and
        (LongWord(l_Sub.ID) = l_BookmarkID) then
     begin
      aSub := l_Sub;
      Result := True;
      Exit;
     end;//l_Sub <> nil
    finally
     l_Sub := nil;
    end;//try..finally
   end;//for l_Index
  end;//with Text.Editor.Data.Document.Bookmarks
//#UC END# *4AEEF8180282_4C7F801D0304_impl*
end;//TExTextOptionsForm.FindBookmarkInText

procedure TExTextOptionsForm.InitHyperLink(const aHyperLink: IevHyperlink;
  const aBaseEntity: IUnknown);
//#UC START# *4AEEFBF102AF_4C7F801D0304_var*
var
 l_Bookmark: IBookmark;
 l_PID: TPId;
 l_Entity: IEntityBase;
//#UC END# *4AEEFBF102AF_4C7F801D0304_var*
begin
//#UC START# *4AEEFBF102AF_4C7F801D0304_impl*
 if (aHyperLink <> nil) and
    Supports(aBaseEntity, IBookmark, l_Bookmark) then
  try
   l_Bookmark.GetPid(l_PID);
   aHyperlink.Address := TevAddress_C(l_PID.rObjectId,
                                   Integer(l_Bookmark.GetParagraph or POSITION_TYPE_PARA_ID),
                                   CI_TOPIC);
  finally
   l_Bookmark := nil;
  end//try..finall
 else
 if Supports(aBaseEntity, IEntityBase, l_Entity) then
  aHyperlink.Address := TevAddress_C(l_Entity.GetEid, 0, CI_FolderLink);

 aHyperlink.Hint := l3PCharLen;
//#UC END# *4AEEFBF102AF_4C7F801D0304_impl*
end;//TExTextOptionsForm.InitHyperLink

function TExTextOptionsForm.EnableRedactionOps(const aParams: IvcmTestParamsPrim): Boolean;
//#UC START# *4AFAF4620059_4C7F801D0304_var*
//#UC END# *4AFAF4620059_4C7F801D0304_var*
begin
//#UC START# *4AFAF4620059_4C7F801D0304_impl*
 Result := (ViewArea <> nil) and ViewArea.CanWorkWithRedactions;
 aParams.Op.Flag[vcm_ofEnabled] := Result;
//#UC END# *4AFAF4620059_4C7F801D0304_impl*
end;//TExTextOptionsForm.EnableRedactionOps

procedure TExTextOptionsForm.OpenInWindow(aNew: Boolean = true);
//#UC START# *4B04318202FC_4C7F801D0304_var*
var
 l_Cont : IvcmContainer;
//#UC END# *4B04318202FC_4C7F801D0304_var*
begin
//#UC START# *4B04318202FC_4C7F801D0304_impl*
 if (ViewArea <> nil) then
 begin
  if aNew then
   l_Cont := nsOpenNewWindowParams(NativeMainForm)
  else
   l_Cont := NativeMainForm;
  // http://mdp.garant.ru/pages/viewpage.action?pageId=414849606
  if (l_Cont <> nil) then
  try
   TdmStdRes.OpenDocument(ViewArea.NewDocInfo(CurrentParaPos),
                          l_Cont);
  finally
   l_Cont := nil;
  end;//try..finally
 end;//ViewArea <> nil
//#UC END# *4B04318202FC_4C7F801D0304_impl*
end;//TExTextOptionsForm.OpenInWindow

procedure TExTextOptionsForm.Openable_OpenInNewWindow_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C4EB6710127_4C7F801D0304test_var*
//#UC END# *4C4EB6710127_4C7F801D0304test_var*
begin
//#UC START# *4C4EB6710127_4C7F801D0304test_impl*
 HyperLink_OpenNewWindow_Test(aParams);
//#UC END# *4C4EB6710127_4C7F801D0304test_impl*
end;//TExTextOptionsForm.Openable_OpenInNewWindow_Test

procedure TExTextOptionsForm.Openable_OpenInNewWindow_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C4EB6710127_4C7F801D0304exec_var*
//#UC END# *4C4EB6710127_4C7F801D0304exec_var*
begin
//#UC START# *4C4EB6710127_4C7F801D0304exec_impl*
 HyperLink_OpenNewWindow_Execute(aParams);
//#UC END# *4C4EB6710127_4C7F801D0304exec_impl*
end;//TExTextOptionsForm.Openable_OpenInNewWindow_Execute

procedure TExTextOptionsForm.SubPanelSettings_Show_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C7F8DFF02BF_4C7F801D0304test_var*
//#UC END# *4C7F8DFF02BF_4C7F801D0304test_var*
begin
//#UC START# *4C7F8DFF02BF_4C7F801D0304test_impl*
 aParams.Op.Flag[vcm_ofVisible] := DefDataAdapter.IsInternal;
 aParams.Op.Flag[vcm_ofEnabled] := DefDataAdapter.IsInternal;
 aParams.Op.Flag[vcm_ofChecked] := SubPanel.SubDescriptors.SubsLayer.Visible;
//#UC END# *4C7F8DFF02BF_4C7F801D0304test_impl*
end;//TExTextOptionsForm.SubPanelSettings_Show_Test

procedure TExTextOptionsForm.SubPanelSettings_Show_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C7F8DFF02BF_4C7F801D0304exec_var*
//#UC END# *4C7F8DFF02BF_4C7F801D0304exec_var*
begin
//#UC START# *4C7F8DFF02BF_4C7F801D0304exec_impl*
 ShowSubNumbers;                     
//#UC END# *4C7F8DFF02BF_4C7F801D0304exec_impl*
end;//TExTextOptionsForm.SubPanelSettings_Show_Execute

procedure TExTextOptionsForm.Reminder_RemWarnJuror_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C7FACA8026E_4C7F801D0304test_var*
//#UC END# *4C7FACA8026E_4C7F801D0304test_var*
begin
//#UC START# *4C7FACA8026E_4C7F801D0304test_impl*
 SetReminderOpParams(aParams, WarnJurorInfo);
//#UC END# *4C7FACA8026E_4C7F801D0304test_impl*
end;//TExTextOptionsForm.Reminder_RemWarnJuror_Test

procedure TExTextOptionsForm.Reminder_RemWarnJuror_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C7FACA8026E_4C7F801D0304exec_var*
//#UC END# *4C7FACA8026E_4C7F801D0304exec_var*
begin
//#UC START# *4C7FACA8026E_4C7F801D0304exec_impl*
 ShowWarningPage(False);
 MessageDlg(l3Cat(WarnJurorInfo, '.'), 'TExTextOptionsForm.Reminder_RemWarnJuror_Execute', mtInformation);
//#UC END# *4C7FACA8026E_4C7F801D0304exec_impl*
end;//TExTextOptionsForm.Reminder_RemWarnJuror_Execute

procedure TExTextOptionsForm.Reminder_RemWarnTimeMachineOn_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C7FACBB005C_4C7F801D0304test_var*
//#UC END# *4C7FACBB005C_4C7F801D0304test_var*
begin
//#UC START# *4C7FACBB005C_4C7F801D0304test_impl*
 SetReminderOpParams(aParams, TimeMachineWarningOnInfo, TimeMachineWarningOnHint);
//#UC END# *4C7FACBB005C_4C7F801D0304test_impl*
end;//TExTextOptionsForm.Reminder_RemWarnTimeMachineOn_Test

procedure TExTextOptionsForm.Reminder_RemWarnTimeMachineOn_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C7FACBB005C_4C7F801D0304exec_var*
//#UC END# *4C7FACBB005C_4C7F801D0304exec_var*
begin
//#UC START# *4C7FACBB005C_4C7F801D0304exec_impl*
 ShowWarningPage(False, cNotSureWarningSub);
 MessageDlg(l3Cat(TimeMachineWarningOnInfo, '.'), 'TExTextOptionsForm.Reminder_RemWarnTimeMachineOn_Execute', mtInformation);
//#UC END# *4C7FACBB005C_4C7F801D0304exec_impl*
end;//TExTextOptionsForm.Reminder_RemWarnTimeMachineOn_Execute

procedure TExTextOptionsForm.Reminder_RemWarnRedaction_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C7FACCE013F_4C7F801D0304test_var*
//#UC END# *4C7FACCE013F_4C7F801D0304test_var*
begin
//#UC START# *4C7FACCE013F_4C7F801D0304test_impl*
 if Assigned(Document) then
  with defDataAdapter.TimeMachine do
   aParams.Op.Flag[vcm_ofVisible] := not HasNotSureWarning(Document) and
    not IsOn and not TdmStdRes.IsCurEditionActual(Document);
//#UC END# *4C7FACCE013F_4C7F801D0304test_impl*
end;//TExTextOptionsForm.Reminder_RemWarnRedaction_Test

procedure TExTextOptionsForm.Reminder_RemWarnRedaction_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C7FACCE013F_4C7F801D0304exec_var*
//#UC END# *4C7FACCE013F_4C7F801D0304exec_var*
begin
//#UC START# *4C7FACCE013F_4C7F801D0304exec_impl*
 ShowWarningPage(False, cEditionWarningSub);
 MessageDlg(l3Cat(l3CStr(WarnRedaction.Hint), '.'), 'TExTextOptionsForm.Reminder_RemWarnRedaction_Execute', mtInformation);
//#UC END# *4C7FACCE013F_4C7F801D0304exec_impl*
end;//TExTextOptionsForm.Reminder_RemWarnRedaction_Execute

procedure TExTextOptionsForm.Reminder_RemWarnOnControl_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C7FACFE01D3_4C7F801D0304test_var*
//#UC END# *4C7FACFE01D3_4C7F801D0304test_var*
begin
//#UC START# *4C7FACFE01D3_4C7F801D0304test_impl*
 SetReminderOpParams(aParams, WarnOnControlInfo);
//#UC END# *4C7FACFE01D3_4C7F801D0304test_impl*
end;//TExTextOptionsForm.Reminder_RemWarnOnControl_Test

procedure TExTextOptionsForm.Reminder_RemWarnOnControl_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C7FACFE01D3_4C7F801D0304exec_var*
//#UC END# *4C7FACFE01D3_4C7F801D0304exec_var*
begin
//#UC START# *4C7FACFE01D3_4C7F801D0304exec_impl*
 Op_Document_SetActive.Call(Aggregate, Byte(dftRelatedDoc));
 MessageDlg(l3Cat(WarnOnControlInfo, '.'), 'TExTextOptionsForm.Reminder_RemWarnOnControl_Execute', mtInformation);
//#UC END# *4C7FACFE01D3_4C7F801D0304exec_impl*
end;//TExTextOptionsForm.Reminder_RemWarnOnControl_Execute

procedure TExTextOptionsForm.Reminder_RemWarnIsAbolished_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C7FAD0F014A_4C7F801D0304test_var*
//#UC END# *4C7FAD0F014A_4C7F801D0304test_var*
begin
//#UC START# *4C7FAD0F014A_4C7F801D0304test_impl*
 SetReminderOpParams(aParams, WarnIsAbolishedInfo);
//#UC END# *4C7FAD0F014A_4C7F801D0304test_impl*
end;//TExTextOptionsForm.Reminder_RemWarnIsAbolished_Test

procedure TExTextOptionsForm.Reminder_RemWarnIsAbolished_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C7FAD0F014A_4C7F801D0304exec_var*
//#UC END# *4C7FAD0F014A_4C7F801D0304exec_var*
begin
//#UC START# *4C7FAD0F014A_4C7F801D0304exec_impl*
 ShowWarningPage(False);
 MessageDlg(l3Cat(WarnIsAbolishedInfo, '.'), 'TExTextOptionsForm.Reminder_RemWarnIsAbolished_Execute', mtInformation);
//#UC END# *4C7FAD0F014A_4C7F801D0304exec_impl*
end;//TExTextOptionsForm.Reminder_RemWarnIsAbolished_Execute

procedure TExTextOptionsForm.Reminder_RemWarnTimeMachineException_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C7FAD1D038F_4C7F801D0304test_var*
//#UC END# *4C7FAD1D038F_4C7F801D0304test_var*
begin
//#UC START# *4C7FAD1D038F_4C7F801D0304test_impl*
 SetReminderOpParams(aParams, BaseTimeMachineWarningInfo(tmwError));
//#UC END# *4C7FAD1D038F_4C7F801D0304test_impl*
end;//TExTextOptionsForm.Reminder_RemWarnTimeMachineException_Test

procedure TExTextOptionsForm.Reminder_RemWarnTimeMachineException_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C7FAD1D038F_4C7F801D0304exec_var*
//#UC END# *4C7FAD1D038F_4C7F801D0304exec_var*
begin
//#UC START# *4C7FAD1D038F_4C7F801D0304exec_impl*
 ShowWarningPage(False, cEditionWarningSub);
 MessageDlg(l3Cat(BaseTimeMachineWarningInfo(tmwError), '.'), 'TExTextOptionsForm.Reminder_RemWarnTimeMachineException_Execute', mtInformation);
//#UC END# *4C7FAD1D038F_4C7F801D0304exec_impl*
end;//TExTextOptionsForm.Reminder_RemWarnTimeMachineException_Execute

procedure TExTextOptionsForm.Reminder_RemWarnPreActive_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C7FAD310195_4C7F801D0304test_var*
//#UC END# *4C7FAD310195_4C7F801D0304test_var*
begin
//#UC START# *4C7FAD310195_4C7F801D0304test_impl*
 SetReminderOpParams(aParams, WarnPreActiveInfo);
//#UC END# *4C7FAD310195_4C7F801D0304test_impl*
end;//TExTextOptionsForm.Reminder_RemWarnPreActive_Test

procedure TExTextOptionsForm.Reminder_RemWarnPreActive_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C7FAD310195_4C7F801D0304exec_var*
//#UC END# *4C7FAD310195_4C7F801D0304exec_var*
begin
//#UC START# *4C7FAD310195_4C7F801D0304exec_impl*
 ShowWarningPage(False);
 MessageDlg(l3Cat(WarnPreActiveInfo, '.'), 'TExTextOptionsForm.Reminder_RemWarnPreActive_Execute', mtInformation);
//#UC END# *4C7FAD310195_4C7F801D0304exec_impl*
end;//TExTextOptionsForm.Reminder_RemWarnPreActive_Execute

procedure TExTextOptionsForm.Reminder_RemWarnTimeMachineWarning_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C7FAD470142_4C7F801D0304test_var*
//#UC END# *4C7FAD470142_4C7F801D0304test_var*
begin
//#UC START# *4C7FAD470142_4C7F801D0304test_impl*
 SetReminderOpParams(aParams, TimeMachineWarningInfo);
//#UC END# *4C7FAD470142_4C7F801D0304test_impl*
end;//TExTextOptionsForm.Reminder_RemWarnTimeMachineWarning_Test

procedure TExTextOptionsForm.Reminder_RemWarnTimeMachineWarning_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C7FAD470142_4C7F801D0304exec_var*
//#UC END# *4C7FAD470142_4C7F801D0304exec_var*
begin
//#UC START# *4C7FAD470142_4C7F801D0304exec_impl*
 ShowWarningPage(False, cNotSureWarningSub);
 MessageDlg(l3Cat(TimeMachineWarningInfo, '.'), 'TExTextOptionsForm.Reminder_RemWarnTimeMachineWarning_Execute', mtInformation);
//#UC END# *4C7FAD470142_4C7F801D0304exec_impl*
end;//TExTextOptionsForm.Reminder_RemWarnTimeMachineWarning_Execute

procedure TExTextOptionsForm.Reminder_ViewInactualDocument_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C7FAD5900EE_4C7F801D0304test_var*
//#UC END# *4C7FAD5900EE_4C7F801D0304test_var*
begin
//#UC START# *4C7FAD5900EE_4C7F801D0304test_impl*
 aParams.Op.Flag[vcm_ofEnabled] := NeedShowIntranetWarning;
 aParams.Op.Flag[vcm_ofVisible] := aParams.Op.Flag[vcm_ofEnabled];
 CheckForcedQueryForIntranet;
//#UC END# *4C7FAD5900EE_4C7F801D0304test_impl*
end;//TExTextOptionsForm.Reminder_ViewInactualDocument_Test

procedure TExTextOptionsForm.Reminder_ViewInactualDocument_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C7FAD5900EE_4C7F801D0304exec_var*
//#UC END# *4C7FAD5900EE_4C7F801D0304exec_var*
begin
//#UC START# *4C7FAD5900EE_4C7F801D0304exec_impl*
 GoToIntranet;
//#UC END# *4C7FAD5900EE_4C7F801D0304exec_impl*
end;//TExTextOptionsForm.Reminder_ViewInactualDocument_Execute

procedure TExTextOptionsForm.CreateTOC(const aTOC: IdeSimpleTree);
//#UC START# *4EBAA060033D_4C7F801D0304_var*
var
 l_TreeResetted: Boolean;
 l_Tree: InsContentsTree;
 l_FilterableTree: Il3FilterableTree;
 l_TOC: Il3SimpleTree;
 l_TOCData : IdeSimpleTree;
 l_Dummy: Integer;
//#UC END# *4EBAA060033D_4C7F801D0304_var*
begin
//#UC START# *4EBAA060033D_4C7F801D0304_impl*
 // � ��������� � f_RecallCreateTOCTree ��-�� ����, ��� CreateToc ��������� ������ ������, ��� �� �������
 // ����������� _DataSource.. ��� ��������� ���������� �� �����������. K-118392311
 if NeedShowTOC then
 begin
  l_TreeResetted := Supports(aTOC.Contents, InsContentsTree, l_Tree) and
                    (l_Tree.RootResetted or Assigned(f_RecallCreateTOCTree));
  l_TOC := FiltrateTOCTree(aTOC.Contents,
                           (f_RecallCreateTOCTree = nil)
                           { OR (f_RecallCreateTOCTree.Tree = nil)});
  f_RecallCreateTOCTree := nil;
  if not l_TreeResetted then
   l_TreeResetted := Op_ContentsValidator_IsDocumentAdornmentsChanged.Call(Aggregate, aTOC.Adornments);
  l_TOCData := TdeSimpleTree.Make(l_TOC, aTOC.Adornments);
  if (DocumentWithContents <> nil) then
  begin
   if (not Dispatcher.History.InBF or l_TreeResetted) then
    DocumentWithContents.OpenContents(l_TOCData, cBooleanToContentsOpenMode[l_TreeResetted], Text.TextSource.DocumentContainer);
  end//DocumentWithContents <> nil
  else
  if l_TreeResetted then
   f_RecallCreateTOCTree := l_TOCData;
 end;//NeedShowTOC
//#UC END# *4EBAA060033D_4C7F801D0304_impl*
end;//TExTextOptionsForm.CreateTOC

procedure TExTextOptionsForm.Document_ChangesButton_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4F88460903B1_4C7F801D0304test_var*

 function lp_MakeAvailableOps: IvcmItems;
   {-}
 begin//lp_MakeAvailableOps
  if (f_DocOpsList = nil) then
   f_DocOpsList := TvcmItems.Make;
  if (f_DocOpsList.Count = 0) then
  begin
   f_DocOpsList.AddOp(TdmStdRes.opcode_Document_CompareEditions);
   f_DocOpsList.AddOp(TdmStdRes.opcode_Document_ViewChangedFragments, str_ViewChangesOpName.AsCStr);
   f_DocOpsList.AddOp(TdmStdRes.opcode_TimeMachine_TimeMachineOnOffNew, vcmCStr(str_TimeMachineOp));
   f_DocOpsList.AddOp(TdmStdRes.opcode_Redactions_OpenRedactionListFrmAct);
   f_DocOpsList.AddOp(TdmStdRes.opcode_Document_ShowVersionComments, vcmCStr(str_ShowVersionCommentsOp));
  end;//f_DocOpsList.Count = 0
  Result := f_DocOpsList;
 end;//lp_MakeAvailableOps

var
 l_List : IvcmItems;
//#UC END# *4F88460903B1_4C7F801D0304test_var*
begin
//#UC START# *4F88460903B1_4C7F801D0304test_impl*
 l_List := lp_MakeAvailableOps;
 aParams.Op.SubItems := l_List;
 aParams.Op.Flag[vcm_ofEnabled] := (l_List <> nil) AND (l_List.Count > 0);
//#UC END# *4F88460903B1_4C7F801D0304test_impl*
end;//TExTextOptionsForm.Document_ChangesButton_Test

procedure TExTextOptionsForm.SubsPanel_CopySubNumber_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4F884EF30187_4C7F801D0304test_var*
var
 l_eeSub : IeeSub;
//#UC END# *4F884EF30187_4C7F801D0304test_var*
begin
//#UC START# *4F884EF30187_4C7F801D0304test_impl*
 aParams.Op.Flag[vcm_ofEnabled] := (afw.Application.IsInternal or
  Settings.LoadBoolean(pi_Document_SubPanel_ShowSubNumbers, dv_Document_SubPanel_ShowSubNumbers)) and
  Assigned(dsDocument) and
  Supports(aParams.Target, IeeSub, l_eeSub) and
  (l_eeSub.LayerID = ev_sbtSub);
//#UC END# *4F884EF30187_4C7F801D0304test_impl*
end;//TExTextOptionsForm.SubsPanel_CopySubNumber_Test

procedure TExTextOptionsForm.SubsPanel_CopySubNumber_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4F884EF30187_4C7F801D0304exec_var*
var
 l_eeSub : IeeSub;
//#UC END# *4F884EF30187_4C7F801D0304exec_var*
begin
//#UC START# *4F884EF30187_4C7F801D0304exec_impl*
 if Supports(aParams.Target, IeeSub, l_eeSub) and
    (l_eeSub.LayerID = ev_sbtSub) and
    Assigned(dsDocument) then
 begin
  l3System.SetClipboardData(
   TevConstStringData.Make(dsDocument.GetSubPosition(l_eeSub.ID), nil));
  TnsUseDocumentSubPanelOperationEvent.Instance.Log;
 end;//Supports(aParams.Target, IeeSub, l_eeSub)
//#UC END# *4F884EF30187_4C7F801D0304exec_impl*
end;//TExTextOptionsForm.SubsPanel_CopySubNumber_Execute

{$If not defined(NoVCM)}
procedure TExTextOptionsForm.NotifyDataSourceChanged(const anOld: IvcmViewAreaController;
  const aNew: IvcmViewAreaController);
//#UC START# *497469C90140_4C7F801D0304_var*
var
 l_FromHistory : Boolean;
//#UC END# *497469C90140_4C7F801D0304_var*
begin
//#UC START# *497469C90140_4C7F801D0304_impl*
 inherited;
 if (Dispatcher = nil) OR (Dispatcher.History = nil) then
  l_FromHistory := false
 else
  l_FromHistory := Dispatcher.History.InBF;
 // �������� ������ ����� ��������� ������, ����� ��������� ��� ������ ���������
 // ��� ���������������:
 FormDataChangedInfo.Init(l_FromHistory);
 // ���� ��������� ������, �� �������� ���������, ����� ��� ������ ���������
 // �������� ������:
 if not l_FromHistory then
 begin
  if (aNew <> nil) and not aNew.IsSame(anOld) then
   Text.TextSource.DocumentContainer := nil
  else
  begin
   // ���� ��������� ���������� - �� ���������������:
   if (ViewArea <> nil) then
    with ViewArea.DocInfo.Pos do
     GotoPoint(rPos, rRefType);
   InvalidateDataSources;
  end;//(aNew <> nil) and not aNew.IsSame(aOld)
 end//if not l_FromHistory then
 else
 begin
  // ���� �������� �� ������� �� ��� ������� ������ �� ��� ��� �� ������ ��� ��
  // �����, �������� ������� ����� �� �����������:
  if Text.HasDocument then
   InvalidateDataSources;
  if UserType in [dftAutoreferat, dftAutoreferatAfterSearch] then
   Dispatcher.UpdateStatus;
 end;
//#UC END# *497469C90140_4C7F801D0304_impl*
end;//TExTextOptionsForm.NotifyDataSourceChanged
{$IfEnd} //not NoVCM

{$If not defined(NoVCM)}
procedure TExTextOptionsForm.DoInit(aFromHistory: Boolean);
//#UC START# *49803F5503AA_4C7F801D0304_var*
//#UC END# *49803F5503AA_4C7F801D0304_var*
begin
//#UC START# *49803F5503AA_4C7F801D0304_impl*
 inherited;
 Self.OnGetStatus := VcmEntityFormRefGetStatus;
 f_ControlMap := nsStringMapManager.Map[smap_pi_DropChangeStatus];
//#UC END# *49803F5503AA_4C7F801D0304_impl*
end;//TExTextOptionsForm.DoInit
{$IfEnd} //not NoVCM

{$If not defined(NoVCM)}
procedure TExTextOptionsForm.InitControls;
//#UC START# *4A8E8F2E0195_4C7F801D0304_var*
//#UC END# *4A8E8F2E0195_4C7F801D0304_var*
begin
//#UC START# *4A8E8F2E0195_4C7F801D0304_impl*
 ActiveControl := Text;
 inherited;
 with WarnPreActive do
 begin
  Left := 352;
  Top := 12;
  Width := 48;
  Height := 48;
  Images := nsWarnImages.WarnImages;
  ImageIndex := 5;
  Visible := False;
 end;
 with WarnRedaction do
 begin
  Left := 152;
  Top := 12;
  Width := 48;
  Height := 48;
  Hint := l3Str(#1042#1085#1080#1084#1072#1085#1080#1077'! '#1053#1072#1089#1090#1086#1103#1097#1072#1103' '#1088#1077#1076#1072#1082#1094#1080#1103' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' '#1085#1077' '#1076#1077#1081#1089#1090#1074#1091#1077#1090);
  Images := nsWarnImages.WarnImages;
  ImageIndex := 3;
  Visible := False;
 end;
 with WarnIsAbolished do
 begin
  Left := 252;
  Top := 12;
  Width := 48;
  Height := 48;
  Images := nsWarnImages.WarnImages;
  ImageIndex := 0;
  Visible := False;
 end;
 with WarnJuror do
 begin
  Left := 52;
  Top := 12;
  Width := 48;
  Height := 48;
  Images := nsWarnImages.WarnImages;
  ImageIndex := 1;
  Visible := False;
 end;
 with WarnTimeMachineException do
 begin
  Left := 302;
  Top := 12;
  Width := 48;
  Height := 48;
  Images := nsWarnImages.WarnImages;
  ImageIndex := 8;
  Visible := False;
 end;
 with WarnOnControl do
 begin
  Left := 202;
  Top := 12;
  Width := 48;
  Height := 48;
  Images := nsWarnImages.WarnImages;
  ImageIndex := 2;
  Visible := False;
 end;
 with WarnTimeMachineOn do
 begin
  Left := 102;
  Top := 12;
  Width := 48;
  Height := 48;
  Hint := l3Str(#1052#1072#1096#1080#1085#1072' '#1074#1088#1077#1084#1077#1085#1080' '#1074#1082#1083#1102#1095#1077#1085#1072);
  Images := nsWarnImages.WarnImages;
  ImageIndex := 7;
  DrawCaption := True;
  Visible := False;
 end;
 with WarnTimeMachineWarning do
 begin
  Left := 402;
  Top := 12;
  Width := 48;
  Height := 48;
  Images := nsWarnImages.WarnImages;
  ImageIndex := 13;
  Visible := False;
 end;
 with WarnInactualDocument do
 begin
  Left := 452;
  Top := 12;
  Width := 48;
  Height := 48;
  Images := nsWarnImages.WarnImages;
  ImageIndex := 16;
  Visible := False;
 end;
 with RemindersLine do
 begin
  PosX := 52;
  PosY := 12;
  AddReminder(WarnJuror);
  AddReminder(WarnTimeMachineOn);
  AddReminder(WarnRedaction);
  AddReminder(WarnOnControl);
  AddReminder(WarnIsAbolished);
  AddReminder(WarnTimeMachineException);
  AddReminder(WarnPreActive);
  AddReminder(WarnTimeMachineWarning);
  AddReminder(WarnInactualDocument);
 end;//with RemindersLine
 with Text do
 begin
  Left := 45;
  Top := 0;
  Width := 600;
  Height := 336;
  Align := alClient;
  TabOrder := 0;
  TextSource := Self.TextSource;
  VSubPanel := Self.SubPanel;
  OnBlockChange := TextBlockChange;
  OnBlockScroll := TextBlockScroll;
  OnMouseAction := TextMouseAction;
  OnCanSplitPara := TextCanSplitPara;
  OnUserCommentsHidden := TextUserCommentsHidden;
  OnAfterFirstPaint := TextAfterFirstPaint;
  OnCommentsVisibleChanged := TextCommentsVisibleChanged;
  OnShowDocumentPartsChanged := TextShowDocumentPartsChanged;
  OnDrawSpecialChange := TextDrawSpecialChange;
 end;//with Text
 with SubPanel do
 begin
  Left := 0;
  Top := 0;
  Width := 5;
  Height := 336;
  Align := alLeft;
  TabOrder := 1;
  OnMouseOverSub := SubPanelMouseOverSub;
  OnClickSub := SubPanelClickSub;
 end;//with SubPanel
 {$If not defined(Admin) AND not defined(Monitorings)}
 if (DefDataAdapter <> nil) then
  Text.DisableDragAndDropSupport := DefDataAdapter.IsTrialMode;
 {$IfEnd} //not Admin AND not Monitorings
//#UC END# *4A8E8F2E0195_4C7F801D0304_impl*
end;//TExTextOptionsForm.InitControls
{$IfEnd} //not NoVCM

{$If not defined(NoVCM)}
procedure TExTextOptionsForm.EntitiesInited;
//#UC START# *4AE1948900DE_4C7F801D0304_var*
//#UC END# *4AE1948900DE_4C7F801D0304_var*
begin
//#UC START# *4AE1948900DE_4C7F801D0304_impl*
 inherited;
 with WarnPreActive do
 begin
  EntityName := en_Reminder;
  OperationName := op_RemWarnPreActive;
 end;
 with WarnRedaction do
 begin
  EntityName := en_Reminder;
  OperationName := op_RemWarnRedaction;
 end;
 with WarnIsAbolished do
 begin
  EntityName := en_Reminder;
  OperationName := op_RemWarnIsAbolished;
 end;
 with WarnJuror do
 begin
  EntityName := en_Reminder;
  OperationName := op_RemWarnJuror;
 end;
 with WarnTimeMachineException do
 begin
  EntityName := en_Reminder;
  OperationName := op_RemWarnTimeMachineException;
 end;
 with WarnOnControl do
 begin
  EntityName := en_Reminder;
  OperationName := op_RemWarnOnControl;
 end;
 with WarnTimeMachineOn do
 begin
  EntityName := en_Reminder;
  OperationName := op_RemWarnTimeMachineOn;
 end;
 with WarnTimeMachineWarning do
 begin
  EntityName := en_Reminder;
  OperationName := op_RemWarnTimeMachineWarning;
 end;
 with WarnInactualDocument do
 begin
  EntityName := en_Reminder;
  OperationName := op_ViewInactualDocument;
 end;

 SetTargetGetter(en_SubsPanel, SubPanelEntitiesGetTarget);
 SetTargetGetter(en_DocumentBlockHeader, SubPanelEntitiesGetTarget);
 SetTargetGetter(en_DocumentBlock, SubPanelEntitiesGetTarget);
 SetTargetGetter(en_DocumentBlockBookmarks, SubPanelEntitiesGetTarget);
 SetTargetGetter(en_BookmarkIcon, SubPanelEntitiesGetTarget);
 SetTargetGetter(en_UserCommentIcon, SubPanelEntitiesGetTarget);

 MakeEntitySupportedByControl(en_SubsPanel, SubPanel);
 MakeEntitySupportedByControl(en_DocumentBlockHeader, SubPanel);
 MakeEntitySupportedByControl(en_DocumentBlock, SubPanel);
 MakeEntitySupportedByControl(en_DocumentBlockBookmarks, SubPanel);
 MakeEntitySupportedByControl(en_BookmarkIcon, SubPanel);
 MakeEntitySupportedByControl(en_UserCommentIcon, SubPanel);

 SetTargetGetter(en_Text, ContextEntitiesGetTarget);
 SetTargetGetter(en_HyperLink, ContextEntitiesGetTarget);
 SetTargetGetter(en_Selection, ContextEntitiesGetTarget);
 SetTargetGetter(en_UserComment, ContextEntitiesGetTarget);
 SetTargetGetter(en_ExternalObject, ContextEntitiesGetTarget);

 MakeEntitySupportedByControl(en_Text, Text);
 MakeEntitySupportedByControl(en_HyperLink, Text);
 MakeEntitySupportedByControl(en_Selection, Text);
 MakeEntitySupportedByControl(en_UserComment, Text);
 MakeEntitySupportedByControl(en_ExternalObject, Text);
//#UC END# *4AE1948900DE_4C7F801D0304_impl*
end;//TExTextOptionsForm.EntitiesInited
{$IfEnd} //not NoVCM

{$If not defined(NoVCM)}
function TExTextOptionsForm.SaveOwnFormState(out theState: IvcmBase;
  aStateType: TvcmStateType): Boolean;
//#UC START# *4B4F49900003_4C7F801D0304_var*
var
 l_OldCanRefresh: Boolean;
//#UC END# *4B4F49900003_4C7F801D0304_var*
begin
//#UC START# *4B4F49900003_4C7F801D0304_impl*
 Result := inherited SaveOwnFormState(theState, aStateType);
 if (aStateType = vcm_stContent) then
 begin
  if UserType in [dftDocument, dftDictEntry, dftMedDictEntry, dftDrug] then
  begin
    // ������ �� ������ 
  end
  else
  if (UserType = dftConsultation) and Assigned(ViewArea)
     and (Consultation <> nil) and Consultation.NeedGiveMark
     and (not f_HyperlinkCallStatus)
     and Ask(qr_CloseUnmarkedConsultation) then
  begin
   l_OldCanRefresh := Consultation.FormSet.CanRefresh;
   Consultation.FormSet.PushFromHistory;
   try
    Consultation.GiveMark;
   finally
    with Consultation.FormSet do
     if l_OldCanRefresh then
      PushFromHistory
     else
      PopToHistory;
   end;//try..finally
  end;//UserType = dftConsultation) and Assigned(ViewArea)..
  f_HyperlinkCallStatus := false; // ����������, ����� �� ��������� �� ��������� ���
 end;//aStateType = vcm_stContent
//#UC END# *4B4F49900003_4C7F801D0304_impl*
end;//TExTextOptionsForm.SaveOwnFormState
{$IfEnd} //not NoVCM

procedure TExTextOptionsForm.ClearFields;
 {-}
begin
 f_DocOpsList := nil;
 inherited;
end;//TExTextOptionsForm.ClearFields

procedure TExTextOptionsForm.InitEntities;
begin
 inherited;
 with Entities.Entities do
 begin
  PublishFormEntity(en_Openable, nil);
  PublishFormEntity(en_SubPanelSettings, nil);
  PublishFormEntity(en_Reminder, nil);
  PublishFormEntity(en_Document, nil);
  PublishFormEntity(en_SubsPanel, nil);
  PublishFormEntity(en_WarnRedaction, nil);
  MakeEntitySupportedByControl(en_WarnRedaction, WarnRedaction);
  PublishFormEntity(en_WarnJuror, nil);
  MakeEntitySupportedByControl(en_WarnJuror, WarnJuror);
  PublishFormEntity(en_WarnOnControl, nil);
  MakeEntitySupportedByControl(en_WarnOnControl, WarnOnControl);
  PublishFormEntity(en_WarnTimeMachine, nil);
  MakeEntitySupportedByControl(en_WarnTimeMachine, WarnTimeMachineOn);
  PublishOp(en_Openable, op_OpenInNewWindow, Openable_OpenInNewWindow_Execute, Openable_OpenInNewWindow_Test, nil);
  PublishOp(en_SubPanelSettings, op_Show, SubPanelSettings_Show_Execute, SubPanelSettings_Show_Test, nil);
  ShowInContextMenu(en_SubPanelSettings, op_Show, true);
  ShowInToolbar(en_SubPanelSettings, op_Show, false);
  PublishOp(en_Reminder, op_RemWarnJuror, Reminder_RemWarnJuror_Execute, Reminder_RemWarnJuror_Test, nil);
  ShowInContextMenu(en_Reminder, op_RemWarnJuror, true);
  ShowInToolbar(en_Reminder, op_RemWarnJuror, false);
  PublishOp(en_Reminder, op_RemWarnTimeMachineOn, Reminder_RemWarnTimeMachineOn_Execute, Reminder_RemWarnTimeMachineOn_Test, nil);
  ShowInContextMenu(en_Reminder, op_RemWarnTimeMachineOn, true);
  ShowInToolbar(en_Reminder, op_RemWarnTimeMachineOn, false);
  PublishOp(en_Reminder, op_RemWarnRedaction, Reminder_RemWarnRedaction_Execute, Reminder_RemWarnRedaction_Test, nil);
  ShowInContextMenu(en_Reminder, op_RemWarnRedaction, true);
  ShowInToolbar(en_Reminder, op_RemWarnRedaction, false);
  PublishOp(en_Reminder, op_RemWarnOnControl, Reminder_RemWarnOnControl_Execute, Reminder_RemWarnOnControl_Test, nil);
  ShowInContextMenu(en_Reminder, op_RemWarnOnControl, true);
  ShowInToolbar(en_Reminder, op_RemWarnOnControl, false);
  PublishOp(en_Reminder, op_RemWarnIsAbolished, Reminder_RemWarnIsAbolished_Execute, Reminder_RemWarnIsAbolished_Test, nil);
  ShowInContextMenu(en_Reminder, op_RemWarnIsAbolished, true);
  ShowInToolbar(en_Reminder, op_RemWarnIsAbolished, false);
  PublishOp(en_Reminder, op_RemWarnTimeMachineException, Reminder_RemWarnTimeMachineException_Execute, Reminder_RemWarnTimeMachineException_Test, nil);
  ShowInContextMenu(en_Reminder, op_RemWarnTimeMachineException, true);
  ShowInToolbar(en_Reminder, op_RemWarnTimeMachineException, false);
  PublishOp(en_Reminder, op_RemWarnPreActive, Reminder_RemWarnPreActive_Execute, Reminder_RemWarnPreActive_Test, nil);
  ShowInContextMenu(en_Reminder, op_RemWarnPreActive, true);
  ShowInToolbar(en_Reminder, op_RemWarnPreActive, false);
  PublishOp(en_Reminder, op_RemWarnTimeMachineWarning, Reminder_RemWarnTimeMachineWarning_Execute, Reminder_RemWarnTimeMachineWarning_Test, nil);
  ShowInContextMenu(en_Reminder, op_RemWarnTimeMachineWarning, true);
  ShowInToolbar(en_Reminder, op_RemWarnTimeMachineWarning, false);
  PublishOp(en_Reminder, op_ViewInactualDocument, Reminder_ViewInactualDocument_Execute, Reminder_ViewInactualDocument_Test, nil);
  ShowInContextMenu(en_Reminder, op_ViewInactualDocument, true);
  ShowInToolbar(en_Reminder, op_ViewInactualDocument, false);
  PublishOp(en_Document, op_ChangesButton, nil, Document_ChangesButton_Test, nil);
  PublishOp(en_SubsPanel, op_CopySubNumber, SubsPanel_CopySubNumber_Execute, SubsPanel_CopySubNumber_Test, nil);
  ShowInContextMenu(en_SubsPanel, op_CopySubNumber, true);
  ShowInToolbar(en_SubsPanel, op_CopySubNumber, false);
  ShowInContextMenu(en_Edit, op_FindContext, true);
  ShowInToolbar(en_Edit, op_FindContext, true);
  
  ShowInContextMenu(en_Edit, op_FindNext, true);
  ShowInToolbar(en_Edit, op_FindNext, false);
  
  ShowInContextMenu(en_File, op_Print, false);
  ShowInToolbar(en_File, op_Print, true);
  
  ShowInContextMenu(en_File, op_PrintDialog, false);
  ShowInToolbar(en_File, op_PrintDialog, false);
  
  ShowInContextMenu(en_File, op_PrintPreview, false);
  ShowInToolbar(en_File, op_PrintPreview, true);
  
  ShowInContextMenu(en_File, op_Save, false);
  ShowInToolbar(en_File, op_Save, true);
  
  ShowInContextMenu(en_File, op_ToMSWord, false);
  ShowInToolbar(en_File, op_ToMSWord, true);
  
  ShowInContextMenu(en_File, op_SendMailAsAttachment, false, true);
  ShowInToolbar(en_File, op_SendMailAsAttachment, false, true);
  
  ShowInContextMenu(en_Document, op_NextDocumentInList, false);
  ShowInToolbar(en_Document, op_NextDocumentInList, true);
  
  ShowInContextMenu(en_Document, op_ReturnToList, false);
  ShowInToolbar(en_Document, op_ReturnToList, true);
  
  ShowInContextMenu(en_File, op_SaveToFolder, false);
  ShowInToolbar(en_File, op_SaveToFolder, true);
  
  ShowInContextMenu(en_File, op_LoadFromFolder, false);
  ShowInToolbar(en_File, op_LoadFromFolder, true);
  
  ShowInContextMenu(en_Document, op_GetAttributesFrmAct, false);
  ShowInToolbar(en_Document, op_GetAttributesFrmAct, true);
  
  ShowInContextMenu(en_Document, op_GetRelatedDocFrmAct, false);
  ShowInToolbar(en_Document, op_GetRelatedDocFrmAct, true);
  
  ShowInContextMenu(en_Document, op_AddBookmark, false);
  ShowInToolbar(en_Document, op_AddBookmark, false);
  
  ShowInContextMenu(en_Document, op_GetCorrespondentList, false);
  ShowInToolbar(en_Document, op_GetCorrespondentList, false);
  
  ShowInContextMenu(en_Document, op_GetRespondentList, false);
  ShowInToolbar(en_Document, op_GetRespondentList, false);
  
  ShowInContextMenu(en_Edit, op_Undo, false);
  ShowInToolbar(en_Edit, op_Undo, false);
  
  ShowInContextMenu(en_Edit, op_Redo, false);
  ShowInToolbar(en_Edit, op_Redo, false);
  
  ShowInContextMenu(en_Edit, op_FindPrev, true);
  ShowInToolbar(en_Edit, op_FindPrev, false);
  
  ShowInContextMenu(en_Document, op_ShowJurorComments, false);
  ShowInToolbar(en_Document, op_ShowJurorComments, true);
  
  ShowInContextMenu(en_SubPanelSettings, op_ShowSpecial, true);
  ShowInToolbar(en_SubPanelSettings, op_ShowSpecial, false);
  
  ShowInContextMenu(en_SubPanelSettings, op_ShowInfo, true);
  ShowInToolbar(en_SubPanelSettings, op_ShowInfo, false);
  
  ShowInContextMenu(en_Document, op_GetCorrespondentListExFrmAct, false);
  ShowInToolbar(en_Document, op_GetCorrespondentListExFrmAct, true);
  
  ShowInContextMenu(en_Document, op_GetRespondentListExFrmAct, false);
  ShowInToolbar(en_Document, op_GetRespondentListExFrmAct, true);
  
  ShowInContextMenu(en_Redactions, op_ActualRedaction, true);
  ShowInToolbar(en_Redactions, op_ActualRedaction, false);
  
  ShowInContextMenu(en_Redactions, op_OpenRedactionListFrmAct, false);
  ShowInToolbar(en_Redactions, op_OpenRedactionListFrmAct, true);
  
  ShowInContextMenu(en_Document, op_GetAnnotationDocFrmAct, false);
  ShowInToolbar(en_Document, op_GetAnnotationDocFrmAct, true);
  
  ShowInContextMenu(en_Document, op_SimilarDocuments, false);
  ShowInToolbar(en_Document, op_SimilarDocuments, true);
  
  ShowInContextMenu(en_Redactions, op_PrevRedaction, true);
  ShowInToolbar(en_Redactions, op_PrevRedaction, false);
  
  ShowInContextMenu(en_Redactions, op_NextRedaction, true);
  ShowInToolbar(en_Redactions, op_NextRedaction, false);
  
  ShowInContextMenu(en_Selection, op_ShowCorrespondentListToPart, true);
  ShowInToolbar(en_Selection, op_ShowCorrespondentListToPart, false);
  
  ShowInContextMenu(en_Selection, op_ShowRespondentListToPart, true);
  ShowInToolbar(en_Selection, op_ShowRespondentListToPart, false);
  
  ShowInContextMenu(en_WarnOnControl, op_ClearStatusSettings, true);
  ShowInToolbar(en_WarnOnControl, op_ClearStatusSettings, false);
  
  ShowInContextMenu(en_DocumentBlockHeader, op_Print, false);
  ShowInToolbar(en_DocumentBlockHeader, op_Print, false);
  
  ShowInContextMenu(en_DocumentBlockBookmarks, op_AddBookmark, true);
  ShowInToolbar(en_DocumentBlockBookmarks, op_AddBookmark, false);
  
  ShowInContextMenu(en_Document, op_OpenContentsFrmAct, false);
  ShowInToolbar(en_Document, op_OpenContentsFrmAct, true);
  
  ShowInContextMenu(en_Document, op_ShowDocumentPicture, true);
  ShowInToolbar(en_Document, op_ShowDocumentPicture, true);
  
  ShowInContextMenu(en_WarnRedaction, op_OpenActualRedaction, true, true);
  ShowInToolbar(en_WarnRedaction, op_OpenActualRedaction, false, true);
  
  ShowInContextMenu(en_WarnOnControl, op_ShowChanges, true);
  ShowInToolbar(en_WarnOnControl, op_ShowChanges, false);
  
  ShowInContextMenu(en_WarnOnControl, op_ClearStatus, true);
  ShowInToolbar(en_WarnOnControl, op_ClearStatus, false);
  
  ShowInContextMenu(en_Document, op_GetGraphicImage, false);
  ShowInToolbar(en_Document, op_GetGraphicImage, true);
  
  ShowInContextMenu(en_Document, op_DocumentSynchroOpenWindow, true, true);
  ShowInToolbar(en_Document, op_DocumentSynchroOpenWindow, false, true);
  
  ShowInContextMenu(en_Document, op_DocumentSynchroOpenNewWindow, true, true);
  ShowInToolbar(en_Document, op_DocumentSynchroOpenNewWindow, false, true);
  
  ShowInContextMenu(en_Document, op_DictListOpenFrmAct, true);
  ShowInToolbar(en_Document, op_DictListOpenFrmAct, true);
  
  ShowInContextMenu(en_Document, op_GotoBookmark, false);
  ShowInToolbar(en_Document, op_GotoBookmark, true);
  
  ShowInContextMenu(en_Document, op_LiteratureListForDictionary, false);
  ShowInToolbar(en_Document, op_LiteratureListForDictionary, true);
  
  ShowInContextMenu(en_Text, op_OpenNewWindow, true);
  ShowInToolbar(en_Text, op_OpenNewWindow, false);
  
  ShowInContextMenu(en_Document, op_OpenProducedDrugList, false);
  ShowInToolbar(en_Document, op_OpenProducedDrugList, false);
  
  ShowInContextMenu(en_Document, op_OpenSimilarDrugList, false);
  ShowInToolbar(en_Document, op_OpenSimilarDrugList, false);
  
  ShowInContextMenu(en_Document, op_ShowJurorComments, false);
  ShowInToolbar(en_Document, op_ShowJurorComments, true);
  
  ShowInContextMenu(en_Document, op_ShowUserComments, false);
  ShowInToolbar(en_Document, op_ShowUserComments, true);
  
  ShowInContextMenu(en_Document, op_ShowTechComments, true);
  ShowInToolbar(en_Document, op_ShowTechComments, false);
  
  ShowInContextMenu(en_Document, op_AddToControl, false);
  ShowInToolbar(en_Document, op_AddToControl, true);
  
  ShowInContextMenu(en_Document, op_UserCR1, false);
  ShowInToolbar(en_Document, op_UserCR1, true);
  
  ShowInContextMenu(en_Document, op_UserCR2, false);
  ShowInToolbar(en_Document, op_UserCR2, true);
  
  ShowInContextMenu(en_Document, op_ShowVersionComments, false);
  ShowInToolbar(en_Document, op_ShowVersionComments, true);
  
  ShowInContextMenu(en_Document, op_CompareEditions, false);
  ShowInToolbar(en_Document, op_CompareEditions, true);
  
  ShowInContextMenu(en_TimeMachine, op_TimeMachineOnOffNew, true);
  ShowInToolbar(en_TimeMachine, op_TimeMachineOnOffNew, false);
  
  ShowInContextMenu(en_Edit, op_Copy, true);
  ShowInToolbar(en_Edit, op_Copy, true);
  
  ShowInContextMenu(en_WarnJuror, op_ShowInfo, true, true);
  ShowInToolbar(en_WarnJuror, op_ShowInfo, false, true);
  
  ShowInContextMenu(en_WarnTimeMachine, op_ShowInfo, true);
  ShowInToolbar(en_WarnTimeMachine, op_ShowInfo, false);
  
  ShowInContextMenu(en_WarnTimeMachine, op_TimeMachineOnOffNew, true);
  ShowInToolbar(en_WarnTimeMachine, op_TimeMachineOnOffNew, false);
  
  ShowInContextMenu(en_WarnRedaction, op_ShowInfo, true, true);
  ShowInToolbar(en_WarnRedaction, op_ShowInfo, false, true);
  
  ShowInContextMenu(en_Document, op_PrevDocumentInList, false);
  ShowInToolbar(en_Document, op_PrevDocumentInList, false);
  
  ShowInContextMenu(en_Document, op_DocumentIsUseful, false);
  ShowInToolbar(en_Document, op_DocumentIsUseful, false);
  
  ShowInContextMenu(en_Document, op_DocumentIsUseless, false);
  ShowInToolbar(en_Document, op_DocumentIsUseless, false);
 end;//with Entities.Entities
end;

procedure TExTextOptionsForm.MakeControls;
begin
 inherited;
 f_WarnPreActive := TnscReminder.Create(Self);
 f_WarnPreActive.Name := 'WarnPreActive';
 f_WarnPreActive.Parent := Self;
 f_WarnRedaction := TnscReminder.Create(Self);
 f_WarnRedaction.Name := 'WarnRedaction';
 f_WarnRedaction.Parent := Self;
 f_WarnTimeMachineException := TnscReminder.Create(Self);
 f_WarnTimeMachineException.Name := 'WarnTimeMachineException';
 f_WarnTimeMachineException.Parent := Self;
 f_WarnIsAbolished := TnscReminder.Create(Self);
 f_WarnIsAbolished.Name := 'WarnIsAbolished';
 f_WarnIsAbolished.Parent := Self;
 f_WarnJuror := TnscReminder.Create(Self);
 f_WarnJuror.Name := 'WarnJuror';
 f_WarnJuror.Parent := Self;
 f_WarnOnControl := TnscReminder.Create(Self);
 f_WarnOnControl.Name := 'WarnOnControl';
 f_WarnOnControl.Parent := Self;
 f_WarnTimeMachineOn := TnscReminder.Create(Self);
 f_WarnTimeMachineOn.Name := 'WarnTimeMachineOn';
 f_WarnTimeMachineOn.Parent := Self;
 f_WarnTimeMachineWarning := TnscReminder.Create(Self);
 f_WarnTimeMachineWarning.Name := 'WarnTimeMachineWarning';
 f_WarnTimeMachineWarning.Parent := Self;
 f_WarnInactualDocument := TnscReminder.Create(Self);
 f_WarnInactualDocument.Name := 'WarnInactualDocument';
 f_WarnInactualDocument.Parent := Self;
 f_RemindersLine := TnscRemindersLine.Create(Self);
 f_RemindersLine.Name := 'RemindersLine';
 with DefineZone(vcm_ztChild, f_RemindersLine) do
 begin
 end;//with DefineZone(vcm_ztChild, f_RemindersLine)
end;

{$IfEnd} //not Admin AND not Monitorings

initialization
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_ExTextOptions_Control_WarnPreActive
 Tkw_ExTextOptions_Control_WarnPreActive.Register('�������::WarnPreActive', TnscReminder);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_ExTextOptions_Control_WarnPreActive_Push
 Tkw_ExTextOptions_Control_WarnPreActive_Push.Register('�������::WarnPreActive:push');
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_ExTextOptions_Control_WarnRedaction
 Tkw_ExTextOptions_Control_WarnRedaction.Register('�������::WarnRedaction', TnscReminder);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_ExTextOptions_Control_WarnRedaction_Push
 Tkw_ExTextOptions_Control_WarnRedaction_Push.Register('�������::WarnRedaction:push');
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_ExTextOptions_Control_WarnTimeMachineException
 Tkw_ExTextOptions_Control_WarnTimeMachineException.Register('�������::WarnTimeMachineException', TnscReminder);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_ExTextOptions_Control_WarnTimeMachineException_Push
 Tkw_ExTextOptions_Control_WarnTimeMachineException_Push.Register('�������::WarnTimeMachineException:push');
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_ExTextOptions_Control_WarnIsAbolished
 Tkw_ExTextOptions_Control_WarnIsAbolished.Register('�������::WarnIsAbolished', TnscReminder);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_ExTextOptions_Control_WarnIsAbolished_Push
 Tkw_ExTextOptions_Control_WarnIsAbolished_Push.Register('�������::WarnIsAbolished:push');
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_ExTextOptions_Control_WarnJuror
 Tkw_ExTextOptions_Control_WarnJuror.Register('�������::WarnJuror', TnscReminder);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_ExTextOptions_Control_WarnJuror_Push
 Tkw_ExTextOptions_Control_WarnJuror_Push.Register('�������::WarnJuror:push');
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_ExTextOptions_Control_WarnOnControl
 Tkw_ExTextOptions_Control_WarnOnControl.Register('�������::WarnOnControl', TnscReminder);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_ExTextOptions_Control_WarnOnControl_Push
 Tkw_ExTextOptions_Control_WarnOnControl_Push.Register('�������::WarnOnControl:push');
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_ExTextOptions_Control_WarnTimeMachineOn
 Tkw_ExTextOptions_Control_WarnTimeMachineOn.Register('�������::WarnTimeMachineOn', TnscReminder);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_ExTextOptions_Control_WarnTimeMachineOn_Push
 Tkw_ExTextOptions_Control_WarnTimeMachineOn_Push.Register('�������::WarnTimeMachineOn:push');
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_ExTextOptions_Control_WarnTimeMachineWarning
 Tkw_ExTextOptions_Control_WarnTimeMachineWarning.Register('�������::WarnTimeMachineWarning', TnscReminder);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_ExTextOptions_Control_WarnTimeMachineWarning_Push
 Tkw_ExTextOptions_Control_WarnTimeMachineWarning_Push.Register('�������::WarnTimeMachineWarning:push');
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_ExTextOptions_Control_WarnInactualDocument
 Tkw_ExTextOptions_Control_WarnInactualDocument.Register('�������::WarnInactualDocument', TnscReminder);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_ExTextOptions_Control_WarnInactualDocument_Push
 Tkw_ExTextOptions_Control_WarnInactualDocument_Push.Register('�������::WarnInactualDocument:push');
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_ExTextOptions_Component_RemindersLine
 Tkw_ExTextOptions_Component_RemindersLine.Register('���������::RemindersLine', TnscRemindersLine);
{$IfEnd} //not Admin AND not Monitorings

end.