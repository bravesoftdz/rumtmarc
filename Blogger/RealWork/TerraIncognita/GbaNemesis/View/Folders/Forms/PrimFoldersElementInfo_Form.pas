unit PrimFoldersElementInfo_Form;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "View"
// �����: ����� �.�.
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/View/Folders/Forms/PrimFoldersElementInfo_Form.pas"
// �����: 27.10.2009 17:42
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<VCMForm::Class>> F1 �������� ����������::Folders::View::Folders::PrimFoldersElementInfo
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
  FoldersUnit,
  DocumentUnit,
  SearchUnit,
  l3Interfaces
  {$If not defined(NoVCM)}
  ,
  vcmInterfaces
  {$IfEnd} //not NoVCM
  ,
  Classes,
  Forms
  {$If not defined(NoVCM)}
  ,
  vcmForm
  {$IfEnd} //not NoVCM
  ,
  nsFolders,
  StdCtrls,
  eeInterfaces,
  FoldersDomainInterfaces
  {$If not defined(NoVCM)}
  ,
  vcmUserControls
  {$IfEnd} //not NoVCM
  ,
  nsTypes,
  vtPanel,
  Folders_Strange_Controls,
  eeMemoWithEditOperations,
  eeCheckBox,
  vtLabel
  {$If defined(Nemesis)}
  ,
  nscComboBoxWithReadOnly
  {$IfEnd} //Nemesis
  ,
  nsLogEvent,
  l3StringIDEx
  {$If not defined(NoScripts)}
  ,
  tfwInteger
  {$IfEnd} //not NoScripts
  
  {$If not defined(NoScripts)}
  ,
  kwBynameControlPush
  {$IfEnd} //not NoScripts
  
  {$If not defined(NoScripts)}
  ,
  tfwControlString
  {$IfEnd} //not NoScripts
  ,
  PrimFoldersElementInfo_utFoldersProperty_UserType,
  BaseTypesUnit,
  vcmExternalInterfaces {a},
  vcmEntityForm {a}
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}
type
 TTypeMap = array [TFoldersElementType] of TFoldersItemType;

const
  { cTypeMap }
 FIT_BOOKMARK = FoldersUnit.FIT_BOOKMARK;
 cTypeMap : TTypeMap = (FIT_BOOKMARK, FIT_BOOKMARK, FIT_LIST, FIT_QUERY, {FIT_QUERY, }FIT_PHARM_BOOKMARK, FIT_PHARM_LIST);

type
 TnsSaveDocumentToFoldersEvent = class(TnsLogEvent)
 public
 // public methods
   class procedure Log(const aDoc: IDocument);
 end;//TnsSaveDocumentToFoldersEvent

 TnsSaveQueryEvent = class(TnsLogEvent)
 public
 // public methods
   class procedure Log(const aQuery: IQuery);
 end;//TnsSaveQueryEvent

 TPrimFoldersElementInfoForm = {form} class(TvcmEntityForm)
 private
 // private fields
   f_EDoChangedAlreadyDoneFired : Boolean;
    {* ���� ��� ������ ��� ��������� CHanged ����������� ��� ������ Changing/Changed � �������� EDoChangedAlreadyDone - ����������� ��� � ����� ��������� ���������� ����������� ���}
   f_CommentPanel : TvtPanel;
    {* ���� ��� �������� CommentPanel}
   f_ElementComment : TeeMemoWithEditOperations;
    {* ���� ��� �������� ElementComment}
   f_CaptionPanel : TvtPanel;
    {* ���� ��� �������� CaptionPanel}
   f_lblComment : TvtLabel;
    {* ���� ��� �������� lblComment}
   f_TopPanel : TvtPanel;
    {* ���� ��� �������� TopPanel}
   f_NamePanel : TvtPanel;
    {* ���� ��� �������� NamePanel}
   f_lblElementName : TvtLabel;
    {* ���� ��� �������� lblElementName}
   f_ElementName : TnscComboBoxWithReadOnly;
    {* ���� ��� �������� ElementName}
   f_cbShared : TeeCheckBox;
    {* ���� ��� �������� cbShared}
   f_InfoName : TvtLabel;
    {* ���� ��� �������� InfoName}
 protected
  procedure InitEntities; override;
  procedure MakeControls; override;
 private
 // private methods
   procedure NamePanelResize(Sender: TObject);
     {* TNotifyEvent is used for events that do not require parameters. }
   procedure VcmEntityFormCloseQueryEx(Sender: TObject;
     var CanClose: Boolean;
     aCaller: TCustomForm);
   procedure RegisterSaveOperation;
     {* �������� ���������� �������������� � ���� ������������ }
   procedure BeginSetCurInfo;
     {* ��������� ������ BeginSetCurInfo }
   procedure EndSetCurInfo;
     {* ��������� ������ EndSetCurInfo }
   function IsDocumentAlive: Boolean;
 protected
 // realized methods
   function FolderElement_GetState_Execute: TFoldersInfoType;
     {* ���������� ������ �������� }
   procedure FolderElement_GetState(const aParams: IvcmExecuteParams);
     {* ���������� ������ �������� }
   procedure FolderElement_SetLoadInfo_Execute(const aForm: IvcmEntityForm;
    const aFolderFilterInfo: InsFolderFilterInfo;
    const aCaption: Il3CString;
    const aData: IUnknown;
    anOp: TListLogicOperation);
     {* ������������� ��������� �������� }
   procedure FolderElement_SetLoadInfo(const aParams: IvcmExecuteParams);
     {* ������������� ��������� �������� }
   procedure FolderElement_SetContent_Execute(const aNode: IeeNode;
    aIsNewFolder: Boolean = false);
     {* SetContent }
   procedure FolderElement_SetContent(const aParams: IvcmExecuteParams);
     {* SetContent }
   procedure FolderElement_SetSaveInfo_Execute(const aForm: IvcmEntityForm;
    const aFilterInfo: InsFolderFilterInfo;
    anElementType: TFoldersElementType;
    const anEntity: IEntityBase;
    aSaveAs: Boolean);
   procedure FolderElement_SetSaveInfo(const aParams: IvcmExecuteParams);
   procedure FolderElement_SetState_Execute(aInfoType: TFoldersInfoType);
   procedure FolderElement_SetState(const aParams: IvcmExecuteParams);
   procedure UsersRights_UpdateRights_Execute(const aNode: IeeNode);
   procedure UsersRights_UpdateRights(const aParams: IvcmExecuteParams);
   procedure FolderElement_ResetModificationOnDelete_Execute(const aNode: IeeNode);
   procedure FolderElement_ResetModificationOnDelete(const aParams: IvcmExecuteParams);
   procedure FolderElement_SetFocus_Execute;
   procedure FolderElement_SetFocus(const aParams: IvcmExecuteParams);
   procedure FolderElement_Redraw_Execute;
   procedure FolderElement_Redraw(const aParams: IvcmExecuteParams);
   procedure Result_ExternalOk_Execute;
   procedure Result_ExternalOk(const aParams: IvcmExecuteParams);
   procedure UsersRights_FolderShareChanged_Execute;
   procedure UsersRights_FolderShareChanged(const aParams: IvcmExecuteParams);
   procedure FolderElement_DisableSecurityPage_Execute;
   procedure FolderElement_DisableSecurityPage(const aParams: IvcmExecuteParams);
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* ������� ������� ����� �������. }
   procedure InitFields; override;
   {$If not defined(NoVCM)}
   procedure DoInit(aFromHistory: Boolean); override;
     {* ������������� �����. ��� ���������� � �������� }
   {$IfEnd} //not NoVCM
   {$If not defined(NoVCM)}
   procedure InitControls; override;
     {* ��������� ������������� ���������. ��� ���������� � �������� }
   {$IfEnd} //not NoVCM
   procedure ClearFields; override;
 public
 // overridden public methods
   {$If not defined(NoVCM)}
   procedure SetActiveControl; override;
     {* ������������� ������� �������. �����? ���� ����� ������. ��� ���������� � �������� }
   {$IfEnd} //not NoVCM
 protected
 // protected fields
   f_CurType : TFoldersInfoType;
   f_UserLoadParam : IUnknown;
   f_RequestingForm : IvcmEntityForm;
   f_CurNode : IeeNode;
   f_SaveControlState : TCheckBoxState;
   f_SavedObjType : TFoldersElementType;
   f_SavedName : Il3CString;
   f_SavedComment : Il3CString;
   f_SavedObject : IUnknown;
   f_SaveAsFlag : Boolean;
   f_Op : TListLogicOperation;
   f_FolderSecurity : TFolderSecurity;
 protected
 // protected methods
   function SendChosenObject: Boolean;
   function SaveCurInfo(aCheckNameModifiers: Boolean = True;
     aNamesOnly: Boolean = False;
     const aNode: IeeNode = nil): Boolean;
     {* ����� ������ ������ ��� ����������� ��������� � ����� ��� ����������� ���� ������� AfterSaveExceptionCheck, ����� ��� ������������� ����������� EDoChangedAlreadyDone }
   function SaveOrOverrideCurObj: Boolean;
   function DoSaveCurObj(const aFolderNode: IeeNode): Boolean;
   function DoOverrideCurObj(const aNode: IeeNode): Boolean;
   function CheckAdapterNodeType(const aNode: IeeNode;
     aType: TFoldersItemType): Boolean;
   function FindCorrespondingFolder(const aNode: IeeNode): IeeNode;
   function FindNodeByName(const aFolderNode: IeeNode;
     const aName: Il3CString;
     aType: TFoldersItemType): IeeNode;
   procedure AfterSaveExceptionCheck;
     {* ���� ��� ������ ��� ��������� CHanged ����������� ��� ������ Changing/Changed � �������� EDoChangedAlreadyDone - ����������� ��� � ����� ��������� ��������� ����������� ��� }
   procedure ShowCurInfo(NeedSuppressComment: Boolean = False);
   procedure SetSavedInfo;
     {* ��������� ������ SetSavedInfo }
   procedure ShowSavedInfo;
     {* ��������� ������ ShowSavedInfo }
   function SetSavedObjectName: Boolean;
   function CheckModifiedState: Boolean;
   procedure DropModifiedState;
     {* ��������� ������ DropModifiedState }
   procedure SetReadOnlyState(aState: Boolean);
   procedure LoadFolderRights(const aTreeNode: IeeNode);
   function CheckUnsaved: Boolean;
     {* ��������� ������������ ���������. ���������� ������� ����, ��� �� ����������� ��������� ��� (��� ������������� ��������� ������������ � �������� ���������) }
 public
 // public properties
   property CommentPanel: TvtPanel
     read f_CommentPanel;
   property ElementComment: TeeMemoWithEditOperations
     read f_ElementComment;
   property CaptionPanel: TvtPanel
     read f_CaptionPanel;
   property lblComment: TvtLabel
     read f_lblComment;
     {* ����������: }
   property TopPanel: TvtPanel
     read f_TopPanel;
   property NamePanel: TvtPanel
     read f_NamePanel;
   property lblElementName: TvtLabel
     read f_lblElementName;
     {* ���: }
   property ElementName: TnscComboBoxWithReadOnly
     read f_ElementName;
   property cbShared: TeeCheckBox
     read f_cbShared;
     {* ����� ������ }
   property InfoName: TvtLabel
     read f_InfoName;
     {* �������� }
 end;//TPrimFoldersElementInfoForm
{$IfEnd} //not Admin AND not Monitorings

implementation

{$If not defined(Admin) AND not defined(Monitorings)}
uses
  SysUtils
  {$If not defined(NoVCM)}
  ,
  vcmBase
  {$IfEnd} //not NoVCM
  ,
  Search_Strange_Controls,
  l3InterfacesMisc,
  BaseTreeSupportUnit,
  DynamicDocListUnit,
  nsDocumentTools,
  bsUtils,
  nsQueryUtils,
  Windows,
  Controls,
  DataAdapter,
  l3String,
  Base_Operations_Strange_Controls,
  Base_Operations_Editions_Controls,
  l3Types,
  nsFolderNodes,
  nsNodes,
  LoggingUnit,
  Graphics,
  l3MessageID
  {$If not defined(NoScripts)}
  ,
  tfwScriptingInterfaces
  {$IfEnd} //not NoScripts
  ,
  StdRes {a}
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}

var
   { ������������ ������ utFoldersPropertyLocalConstants }
  str_utFoldersPropertyCaption : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'utFoldersPropertyCaption'; rValue : '������ �������');
   { ��������� ����������������� ���� "������ �������" }

type
  Tkw_PrimFoldersElementInfo_Control_CommentPanel = class(TtfwControlString)
   {* ����� ������� ��� �������������� �������� CommentPanel
----
*������ �������������*:
[code]
�������::CommentPanel TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimFoldersElementInfo_Control_CommentPanel

// start class Tkw_PrimFoldersElementInfo_Control_CommentPanel

{$If not defined(NoScripts)}
function Tkw_PrimFoldersElementInfo_Control_CommentPanel.GetString: AnsiString;
 {-}
begin
 Result := 'CommentPanel';
end;//Tkw_PrimFoldersElementInfo_Control_CommentPanel.GetString
{$IfEnd} //not NoScripts

type
  Tkw_PrimFoldersElementInfo_Control_CommentPanel_Push = class(TkwBynameControlPush)
   {* ����� ������� ��� �������� CommentPanel
----
*������ �������������*:
[code]
�������::CommentPanel:push pop:control:SetFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimFoldersElementInfo_Control_CommentPanel_Push

// start class Tkw_PrimFoldersElementInfo_Control_CommentPanel_Push

{$If not defined(NoScripts)}
procedure Tkw_PrimFoldersElementInfo_Control_CommentPanel_Push.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString('CommentPanel');
 inherited;
end;//Tkw_PrimFoldersElementInfo_Control_CommentPanel_Push.DoDoIt
{$IfEnd} //not NoScripts

type
  Tkw_PrimFoldersElementInfo_Control_ElementComment = class(TtfwControlString)
   {* ����� ������� ��� �������������� �������� ElementComment
----
*������ �������������*:
[code]
�������::ElementComment TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimFoldersElementInfo_Control_ElementComment

// start class Tkw_PrimFoldersElementInfo_Control_ElementComment

{$If not defined(NoScripts)}
function Tkw_PrimFoldersElementInfo_Control_ElementComment.GetString: AnsiString;
 {-}
begin
 Result := 'ElementComment';
end;//Tkw_PrimFoldersElementInfo_Control_ElementComment.GetString
{$IfEnd} //not NoScripts

type
  Tkw_PrimFoldersElementInfo_Control_ElementComment_Push = class(TkwBynameControlPush)
   {* ����� ������� ��� �������� ElementComment
----
*������ �������������*:
[code]
�������::ElementComment:push pop:control:SetFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimFoldersElementInfo_Control_ElementComment_Push

// start class Tkw_PrimFoldersElementInfo_Control_ElementComment_Push

{$If not defined(NoScripts)}
procedure Tkw_PrimFoldersElementInfo_Control_ElementComment_Push.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString('ElementComment');
 inherited;
end;//Tkw_PrimFoldersElementInfo_Control_ElementComment_Push.DoDoIt
{$IfEnd} //not NoScripts

type
  Tkw_PrimFoldersElementInfo_Control_CaptionPanel = class(TtfwControlString)
   {* ����� ������� ��� �������������� �������� CaptionPanel
----
*������ �������������*:
[code]
�������::CaptionPanel TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimFoldersElementInfo_Control_CaptionPanel

// start class Tkw_PrimFoldersElementInfo_Control_CaptionPanel

{$If not defined(NoScripts)}
function Tkw_PrimFoldersElementInfo_Control_CaptionPanel.GetString: AnsiString;
 {-}
begin
 Result := 'CaptionPanel';
end;//Tkw_PrimFoldersElementInfo_Control_CaptionPanel.GetString
{$IfEnd} //not NoScripts

type
  Tkw_PrimFoldersElementInfo_Control_CaptionPanel_Push = class(TkwBynameControlPush)
   {* ����� ������� ��� �������� CaptionPanel
----
*������ �������������*:
[code]
�������::CaptionPanel:push pop:control:SetFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimFoldersElementInfo_Control_CaptionPanel_Push

// start class Tkw_PrimFoldersElementInfo_Control_CaptionPanel_Push

{$If not defined(NoScripts)}
procedure Tkw_PrimFoldersElementInfo_Control_CaptionPanel_Push.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString('CaptionPanel');
 inherited;
end;//Tkw_PrimFoldersElementInfo_Control_CaptionPanel_Push.DoDoIt
{$IfEnd} //not NoScripts

type
  Tkw_PrimFoldersElementInfo_Control_lblComment = class(TtfwControlString)
   {* ����� ������� ��� �������������� �������� lblComment
----
*������ �������������*:
[code]
�������::lblComment TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimFoldersElementInfo_Control_lblComment

// start class Tkw_PrimFoldersElementInfo_Control_lblComment

{$If not defined(NoScripts)}
function Tkw_PrimFoldersElementInfo_Control_lblComment.GetString: AnsiString;
 {-}
begin
 Result := 'lblComment';
end;//Tkw_PrimFoldersElementInfo_Control_lblComment.GetString
{$IfEnd} //not NoScripts

type
  Tkw_PrimFoldersElementInfo_Control_lblComment_Push = class(TkwBynameControlPush)
   {* ����� ������� ��� �������� lblComment
----
*������ �������������*:
[code]
�������::lblComment:push pop:control:SetFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimFoldersElementInfo_Control_lblComment_Push

// start class Tkw_PrimFoldersElementInfo_Control_lblComment_Push

{$If not defined(NoScripts)}
procedure Tkw_PrimFoldersElementInfo_Control_lblComment_Push.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString('lblComment');
 inherited;
end;//Tkw_PrimFoldersElementInfo_Control_lblComment_Push.DoDoIt
{$IfEnd} //not NoScripts

type
  Tkw_PrimFoldersElementInfo_Control_TopPanel = class(TtfwControlString)
   {* ����� ������� ��� �������������� �������� TopPanel
----
*������ �������������*:
[code]
�������::TopPanel TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimFoldersElementInfo_Control_TopPanel

// start class Tkw_PrimFoldersElementInfo_Control_TopPanel

{$If not defined(NoScripts)}
function Tkw_PrimFoldersElementInfo_Control_TopPanel.GetString: AnsiString;
 {-}
begin
 Result := 'TopPanel';
end;//Tkw_PrimFoldersElementInfo_Control_TopPanel.GetString
{$IfEnd} //not NoScripts

type
  Tkw_PrimFoldersElementInfo_Control_TopPanel_Push = class(TkwBynameControlPush)
   {* ����� ������� ��� �������� TopPanel
----
*������ �������������*:
[code]
�������::TopPanel:push pop:control:SetFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimFoldersElementInfo_Control_TopPanel_Push

// start class Tkw_PrimFoldersElementInfo_Control_TopPanel_Push

{$If not defined(NoScripts)}
procedure Tkw_PrimFoldersElementInfo_Control_TopPanel_Push.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString('TopPanel');
 inherited;
end;//Tkw_PrimFoldersElementInfo_Control_TopPanel_Push.DoDoIt
{$IfEnd} //not NoScripts

type
  Tkw_PrimFoldersElementInfo_Control_NamePanel = class(TtfwControlString)
   {* ����� ������� ��� �������������� �������� NamePanel
----
*������ �������������*:
[code]
�������::NamePanel TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimFoldersElementInfo_Control_NamePanel

// start class Tkw_PrimFoldersElementInfo_Control_NamePanel

{$If not defined(NoScripts)}
function Tkw_PrimFoldersElementInfo_Control_NamePanel.GetString: AnsiString;
 {-}
begin
 Result := 'NamePanel';
end;//Tkw_PrimFoldersElementInfo_Control_NamePanel.GetString
{$IfEnd} //not NoScripts

type
  Tkw_PrimFoldersElementInfo_Control_NamePanel_Push = class(TkwBynameControlPush)
   {* ����� ������� ��� �������� NamePanel
----
*������ �������������*:
[code]
�������::NamePanel:push pop:control:SetFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimFoldersElementInfo_Control_NamePanel_Push

// start class Tkw_PrimFoldersElementInfo_Control_NamePanel_Push

{$If not defined(NoScripts)}
procedure Tkw_PrimFoldersElementInfo_Control_NamePanel_Push.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString('NamePanel');
 inherited;
end;//Tkw_PrimFoldersElementInfo_Control_NamePanel_Push.DoDoIt
{$IfEnd} //not NoScripts

type
  Tkw_PrimFoldersElementInfo_Control_lblElementName = class(TtfwControlString)
   {* ����� ������� ��� �������������� �������� lblElementName
----
*������ �������������*:
[code]
�������::lblElementName TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimFoldersElementInfo_Control_lblElementName

// start class Tkw_PrimFoldersElementInfo_Control_lblElementName

{$If not defined(NoScripts)}
function Tkw_PrimFoldersElementInfo_Control_lblElementName.GetString: AnsiString;
 {-}
begin
 Result := 'lblElementName';
end;//Tkw_PrimFoldersElementInfo_Control_lblElementName.GetString
{$IfEnd} //not NoScripts

type
  Tkw_PrimFoldersElementInfo_Control_lblElementName_Push = class(TkwBynameControlPush)
   {* ����� ������� ��� �������� lblElementName
----
*������ �������������*:
[code]
�������::lblElementName:push pop:control:SetFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimFoldersElementInfo_Control_lblElementName_Push

// start class Tkw_PrimFoldersElementInfo_Control_lblElementName_Push

{$If not defined(NoScripts)}
procedure Tkw_PrimFoldersElementInfo_Control_lblElementName_Push.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString('lblElementName');
 inherited;
end;//Tkw_PrimFoldersElementInfo_Control_lblElementName_Push.DoDoIt
{$IfEnd} //not NoScripts

type
  Tkw_PrimFoldersElementInfo_Control_ElementName = class(TtfwControlString)
   {* ����� ������� ��� �������������� �������� ElementName
----
*������ �������������*:
[code]
�������::ElementName TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimFoldersElementInfo_Control_ElementName

// start class Tkw_PrimFoldersElementInfo_Control_ElementName

{$If not defined(NoScripts)}
function Tkw_PrimFoldersElementInfo_Control_ElementName.GetString: AnsiString;
 {-}
begin
 Result := 'ElementName';
end;//Tkw_PrimFoldersElementInfo_Control_ElementName.GetString
{$IfEnd} //not NoScripts

type
  Tkw_PrimFoldersElementInfo_Control_ElementName_Push = class(TkwBynameControlPush)
   {* ����� ������� ��� �������� ElementName
----
*������ �������������*:
[code]
�������::ElementName:push pop:control:SetFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimFoldersElementInfo_Control_ElementName_Push

// start class Tkw_PrimFoldersElementInfo_Control_ElementName_Push

{$If not defined(NoScripts)}
procedure Tkw_PrimFoldersElementInfo_Control_ElementName_Push.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString('ElementName');
 inherited;
end;//Tkw_PrimFoldersElementInfo_Control_ElementName_Push.DoDoIt
{$IfEnd} //not NoScripts

type
  Tkw_PrimFoldersElementInfo_Control_cbShared = class(TtfwControlString)
   {* ����� ������� ��� �������������� �������� cbShared
----
*������ �������������*:
[code]
�������::cbShared TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimFoldersElementInfo_Control_cbShared

// start class Tkw_PrimFoldersElementInfo_Control_cbShared

{$If not defined(NoScripts)}
function Tkw_PrimFoldersElementInfo_Control_cbShared.GetString: AnsiString;
 {-}
begin
 Result := 'cbShared';
end;//Tkw_PrimFoldersElementInfo_Control_cbShared.GetString
{$IfEnd} //not NoScripts

type
  Tkw_PrimFoldersElementInfo_Control_cbShared_Push = class(TkwBynameControlPush)
   {* ����� ������� ��� �������� cbShared
----
*������ �������������*:
[code]
�������::cbShared:push pop:control:SetFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimFoldersElementInfo_Control_cbShared_Push

// start class Tkw_PrimFoldersElementInfo_Control_cbShared_Push

{$If not defined(NoScripts)}
procedure Tkw_PrimFoldersElementInfo_Control_cbShared_Push.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString('cbShared');
 inherited;
end;//Tkw_PrimFoldersElementInfo_Control_cbShared_Push.DoDoIt
{$IfEnd} //not NoScripts

type
  Tkw_PrimFoldersElementInfo_Control_InfoName = class(TtfwControlString)
   {* ����� ������� ��� �������������� �������� InfoName
----
*������ �������������*:
[code]
�������::InfoName TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimFoldersElementInfo_Control_InfoName

// start class Tkw_PrimFoldersElementInfo_Control_InfoName

{$If not defined(NoScripts)}
function Tkw_PrimFoldersElementInfo_Control_InfoName.GetString: AnsiString;
 {-}
begin
 Result := 'InfoName';
end;//Tkw_PrimFoldersElementInfo_Control_InfoName.GetString
{$IfEnd} //not NoScripts

type
  Tkw_PrimFoldersElementInfo_Control_InfoName_Push = class(TkwBynameControlPush)
   {* ����� ������� ��� �������� InfoName
----
*������ �������������*:
[code]
�������::InfoName:push pop:control:SetFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimFoldersElementInfo_Control_InfoName_Push

// start class Tkw_PrimFoldersElementInfo_Control_InfoName_Push

{$If not defined(NoScripts)}
procedure Tkw_PrimFoldersElementInfo_Control_InfoName_Push.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString('InfoName');
 inherited;
end;//Tkw_PrimFoldersElementInfo_Control_InfoName_Push.DoDoIt
{$IfEnd} //not NoScripts

procedure TPrimFoldersElementInfoForm.NamePanelResize(Sender: TObject);
//#UC START# *51BECEAD0398_4AE706BB029F_var*
const
 cBorder = 7;
//#UC END# *51BECEAD0398_4AE706BB029F_var*
begin
//#UC START# *51BECEAD0398_4AE706BB029F_impl*
 ElementName.Width := NamePanel.Width - 2 * cBorder;
//#UC END# *51BECEAD0398_4AE706BB029F_impl*
end;//TPrimFoldersElementInfoForm.NamePanelResize

procedure TPrimFoldersElementInfoForm.VcmEntityFormCloseQueryEx(Sender: TObject;
  var CanClose: Boolean;
  aCaller: TCustomForm);
//#UC START# *51BECFEB023A_4AE706BB029F_var*
//#UC END# *51BECFEB023A_4AE706BB029F_var*
begin
//#UC START# *51BECFEB023A_4AE706BB029F_impl*
 if not defDataAdapter.InTerminateProcess then
  CheckUnsaved;
//#UC END# *51BECFEB023A_4AE706BB029F_impl*
end;//TPrimFoldersElementInfoForm.VcmEntityFormCloseQueryEx

procedure TPrimFoldersElementInfoForm.RegisterSaveOperation;
//#UC START# *51BED096010D_4AE706BB029F_var*
var
 l_Bookmark: IBookmark;
 l_Document: IDocument;
//#UC END# *51BED096010D_4AE706BB029F_var*
begin
//#UC START# *51BED096010D_4AE706BB029F_impl*
 if (f_SavedObjType in [fetBookmark, fetDrugBookMark]) and
   Supports(f_SavedObject, IBookmark, l_Bookmark) then
 try
  l_Bookmark.GetDocument(l_Document);
  try
   TnsSaveDocumentToFoldersEvent.Log(l_Document);
  finally
   l_Document := nil;
  end;{try..finally}
 finally
  l_Bookmark := nil;
 end;{try..finally}
//#UC END# *51BED096010D_4AE706BB029F_impl*
end;//TPrimFoldersElementInfoForm.RegisterSaveOperation

procedure TPrimFoldersElementInfoForm.BeginSetCurInfo;
//#UC START# *51BED0FE017A_4AE706BB029F_var*
//#UC END# *51BED0FE017A_4AE706BB029F_var*
begin
//#UC START# *51BED0FE017A_4AE706BB029F_impl*
// nop
//#UC END# *51BED0FE017A_4AE706BB029F_impl*
end;//TPrimFoldersElementInfoForm.BeginSetCurInfo

procedure TPrimFoldersElementInfoForm.EndSetCurInfo;
//#UC START# *51BED1130294_4AE706BB029F_var*
//#UC END# *51BED1130294_4AE706BB029F_var*
begin
//#UC START# *51BED1130294_4AE706BB029F_impl*
 DropModifiedState;
//#UC END# *51BED1130294_4AE706BB029F_impl*
end;//TPrimFoldersElementInfoForm.EndSetCurInfo

function TPrimFoldersElementInfoForm.IsDocumentAlive: Boolean;
//#UC START# *51BED12403CA_4AE706BB029F_var*
var
 l_Bookmark: IBookmark;
 l_Document: IDocument;
//#UC END# *51BED12403CA_4AE706BB029F_var*
begin
//#UC START# *51BED12403CA_4AE706BB029F_impl*
 Result := False;
 if Supports(f_SavedObject, IBookmark, l_Bookmark) then
  try
   try
    l_Bookmark.GetDocument(l_Document);
   except
    on ECanNotFindData do
     l_Document := nil;
   end;
   Result := (l_Document <> nil) and l_Document.IsAlive;
   l_Document := nil;
  finally
   l_Bookmark := nil;
  end;
//#UC END# *51BED12403CA_4AE706BB029F_impl*
end;//TPrimFoldersElementInfoForm.IsDocumentAlive

function TPrimFoldersElementInfoForm.SendChosenObject: Boolean;
//#UC START# *4AE75C84001D_4AE706BB029F_var*
//#UC END# *4AE75C84001D_4AE706BB029F_var*
begin
//#UC START# *4AE75C84001D_4AE706BB029F_impl*
 Result := Op_Loadable_Load.Call(f_RequestingForm, f_CurNode, f_UserLoadParam, f_Op);
//#UC END# *4AE75C84001D_4AE706BB029F_impl*
end;//TPrimFoldersElementInfoForm.SendChosenObject

function TPrimFoldersElementInfoForm.SaveCurInfo(aCheckNameModifiers: Boolean = True;
  aNamesOnly: Boolean = False;
  const aNode: IeeNode = nil): Boolean;
//#UC START# *51BED14D03C0_4AE706BB029F_var*
var
 l_Node: INode;
 l_NewName: Il3CString;
 l_BaseEntity: IUnknown;
 l_eeNode: IeeNode;
//#UC END# *51BED14D03C0_4AE706BB029F_var*
begin
//#UC START# *51BED14D03C0_4AE706BB029F_impl*
 l_eeNode := aNode;
 if l_eeNode = nil then
  l_eeNode := f_CurNode;
 Result := False;
 l_NewName := l3Trim(ElementName.Text);
 if not l3IsNil(l_NewName) then
 begin
  if Supports(l_eeNode, INode, l_Node) then
  try
   l_eeNode.Changing;
   try
    try
     if not aCheckNameModifiers or
        ElementName.Modified then
      l_Node.SetCaption(nsIStr(l_NewName));

     if not aNamesOnly and
        (TFoldersItemType(l_Node.GetObjectType) in [FIT_BOOKMARK, FIT_PHARM_BOOKMARK]) then
     begin
      try
       l_Node.Open(l_BaseEntity);
       try
        Op_Document_ModifyBookmarkNotify.Broadcast(l_BaseEntity);
       finally
        l_BaseEntity := nil;
       end;//try..finally
      except
       on ECanNotFindData do ;
      end;//try..except
     end;//not aNamesOnly
    except
     on EDuplicateNode do
     begin
      Say(err_DuplicateNameError);
      exit;
     end;//on EDuplicateNode
    end;//try..except
    l_eeNode.Text := l_NewName;
    if not aCheckNameModifiers or
       ElementComment.Modified then
     l_Node.SetHint(nsIStr(l3Trim(ElementComment.Buffer)));

    if not aNamesOnly then
    begin
     { ������ �� ����� }
     f_FolderSecurity.Save;
    end;

   finally
    l_Node := nil;
    try
     l_eeNode.Changed;
     l_eeNode.ParentNode.RelocateChild(f_CurNode);
    except
     on EDoChangedAlreadyDone do f_EDoChangedAlreadyDoneFired := True;
    end;
   end;
  except
   on ECanNotFindData do exit;
  end;

  DropModifiedState;
  Result := True;
 end
 else
  Say(err_EmptyItemNameError);
//#UC END# *51BED14D03C0_4AE706BB029F_impl*
end;//TPrimFoldersElementInfoForm.SaveCurInfo

function TPrimFoldersElementInfoForm.SaveOrOverrideCurObj: Boolean;
//#UC START# *51BED197007E_4AE706BB029F_var*
var
 l_Folder: IeeNode;
 l_NodeToOverride: IeeNode;
//#UC END# *51BED197007E_4AE706BB029F_var*
begin
//#UC START# *51BED197007E_4AE706BB029F_impl*
 l_Folder := FindCorrespondingFolder(f_CurNode);
 Assert(Assigned(l_Folder));
 l_NodeToOverride := FindNodeByName(l_Folder, ElementName.Text, cTypeMap[f_SavedObjType]);
 if l_NodeToOverride = nil then
  Result := DoSaveCurObj(l_Folder)
 else
  Result := DoOverrideCurObj(l_NodeToOverride);
//#UC END# *51BED197007E_4AE706BB029F_impl*
end;//TPrimFoldersElementInfoForm.SaveOrOverrideCurObj

function TPrimFoldersElementInfoForm.DoSaveCurObj(const aFolderNode: IeeNode): Boolean;
//#UC START# *51BED25503AD_4AE706BB029F_var*
  procedure lp_RegisterSaveQuery;
  var
   l_Query: IQuery;
  begin
   if (f_SavedObjType = fetQuery) and
    Supports(f_SavedObject, IQuery, l_Query) then
   try
    TnsSaveQueryEvent.Log(l_Query);
   finally
    l_Query := nil;
   end;//try..finally
  end;//lp_RegisterSaveQuery

var
 l_NewNode: IeeNode;
 l_NewAdapterNode: INode;
 l_AdapterNode: INode;
 l_Entity: IEntityBase;
 l_EntityStorage: IEntityStorage;
//#UC END# *51BED25503AD_4AE706BB029F_var*
begin
//#UC START# *51BED25503AD_4AE706BB029F_impl*
 Result := True;
 l_NewNode := nil;
 if Supports(aFolderNode, INode, l_AdapterNode) then
 begin
  try
   if (TFoldersItemType(l_AdapterNode.GetObjectType) = FIT_FOLDER) then
   begin
    case f_SavedObjType of
     fetBookmark, fetDrugBookMark:
      UserFoldersTree.BookmarkSavedFolder := aFolderNode;
     fetList, fetDrugList:
      UserFoldersTree.ListSavedFolder := aFolderNode;
     fetQuery{, fetFilter}:
      UserFoldersTree.QuerySavedFolder := aFolderNode;
     else
      Assert(false); 
    end;//case f_SavedObjType of
    // ������� ��������� �������� �� ������������� ����� ���������� ��������
    if (f_SavedObjType in [fetBookmark, fetDrugBookMark]) and
       not IsDocumentAlive then
    begin
     Say(war_SaveMissingDocument);
     f_SavedObject := nil;
     Result := False;
     exit;
    end;//f_SavedObjType in [fetBookmark, fetDrugBookMark]

    if SetSavedObjectName then
    begin
     try
      lp_RegisterSaveQuery;
      if f_SaveAsFlag and
         Supports(f_SavedObject, IEntityBase, l_Entity) then
      begin
       l_Entity.SaveTo(l_AdapterNode, l_EntityStorage);
       Supports(l_EntityStorage, INode, l_NewAdapterNode);
      end//f_SaveAsFlag..
      else
       l_AdapterNode.AddChildNode(f_SavedObject, l_NewAdapterNode);
      RegisterSaveOperation;
     except
      on EDuplicateNode do
      begin
       Say(err_DuplicateNameError);
       Result := False;
       exit;
      end;//on EDuplicateNode
      on EAccessDenied do
      begin
       Say(err_SaveReadOnlyObject);
       Result := False;
       exit;
      end;//on EAccessDenied
      on ECanNotSave do
      begin
       Say(err_CannotSaveSomething);
       Result := False;
       exit;
      end;//on ECanNotSave
      on ENotSaved do
      begin
       Say(err_NotSaved);
       Result := False;
       exit;
      end;//on ENotSaved
     end;//try..execpt
     l_NewAdapterNode.SetHint(nsIStr(l3Trim(ElementComment.Buffer)));
     l_NewNode := aFolderNode.InsertChild(TnsFoldersNode.Make(l_NewAdapterNode) as IeeNode);
     try
      aFolderNode.SortChilds;
     finally
      l_NewNode := nil;
     end;//try..finally
(*     if (f_SavedObjType = fetFilter) then
      op_SavedQuery_SetFilterState.Call(Aggregate, l_NewAdapterNode);*)

     if (f_SavedObjType in [fetBookmark, fetDrugBookMark]) then
      defDataAdapter.DocumentCacheSinchronize(fotAdd, f_SavedObject);
    end//SetSavedObjectName
    else
    begin
     Say(err_EmptyItemNameError);
     Result := False;
    end;//SetSavedObjectName
   end//TFoldersItemType(l_AdapterNode.GetObjectType) = FIT_FOLDER
   else
    Result := DoOverrideCurObj(aFolderNode);
  finally
   l_AdapterNode := nil;
  end;//try..finally
 end;//Supports(aFolderNode, INode, l_AdapterNode)
//#UC END# *51BED25503AD_4AE706BB029F_impl*
end;//TPrimFoldersElementInfoForm.DoSaveCurObj

function TPrimFoldersElementInfoForm.DoOverrideCurObj(const aNode: IeeNode): Boolean;
//#UC START# *51BED29502DC_4AE706BB029F_var*
var
 l_AdapterNode: INode;
 l_Object: IUnknown;
 l_Entity: IEntityBase;
 l_Storage: IEntityStorage;
 l_Bookmark: IBookmark;
 l_Query: IQuery;
//#UC END# *51BED29502DC_4AE706BB029F_var*
begin
//#UC START# *51BED29502DC_4AE706BB029F_impl*
 Result := False;
 if Ask(qr_FolderSave, [aNode.Text]) AND
    SaveCurInfo(False, True, aNode) then
 begin
  if Supports(aNode, INode, l_AdapterNode) then
   try
    try
     l_AdapterNode.Open(l_Object);
    except
     on ECanNotFindData do
      exit; //TODO: ���� "�������" ��� ������?
    end;//try..except
    l_Query := nil;
    if not Supports(l_Object, IQuery, l_Query) then
    begin
     if Supports(f_SavedObject, IBookmark, l_Bookmark) then
      try
       // ������ �������� ���
       l_Bookmark.SetName(nsIStr(l3Trim(ElementName.Text)));
       // ����������� �� �������� ��������, ������� ����� ������������
       defDataAdapter.DocumentCacheSinchronize(fotDelete, l_Object);
      finally
       l_Bookmark := nil;
      end;//try..finally
    end;//not Supports(l_Object, IQuery, l_Query)

    if Supports(f_SavedObject, IEntityBase, l_Entity) then
     try
      try
       l_Entity.SaveTo(l_AdapterNode, l_Storage);
       RegisterSaveOperation;
       Result := True;
      except
       on EDuplicateNode do
       begin
        Say(err_DuplicateNameError);
        exit;
       end;//on EDuplicateNode
       on EAccessDenied do
       begin
        Say(err_SaveReadOnlyObject);
        exit;
       end;//on EAccessDenied
       on ECanNotSave do
       begin
        Say(err_CannotSaveSomething);
        exit;
       end;//on ECanNotSave
       on ENotSaved do
       begin
        Say(err_NotSaved);
        exit;
       end;//on ENotSaved
      end;//try..except

      if (f_SavedObjType in [fetBookmark, fetDrugBookmark]) then
       defDataAdapter.DocumentCacheSinchronize(fotAdd, f_SavedObject);
     finally
      if (l_Query <> nil) then
       l_Query := nil;
     end;//try..finally

(*    if (f_SavedObjType = fetFilter) then
     op_SavedQuery_SetFilterState.Call(Aggregate, l_AdapterNode);*)

   finally
    l_AdapterNode := nil;
   end;//try..finally
 end;//Ask(qr_FolderSave, [aNode.Text])
//#UC END# *51BED29502DC_4AE706BB029F_impl*
end;//TPrimFoldersElementInfoForm.DoOverrideCurObj

function TPrimFoldersElementInfoForm.CheckAdapterNodeType(const aNode: IeeNode;
  aType: TFoldersItemType): Boolean;
//#UC START# *51BED2C201CC_4AE706BB029F_var*
var
 l_Node: INode;
//#UC END# *51BED2C201CC_4AE706BB029F_var*
begin
//#UC START# *51BED2C201CC_4AE706BB029F_impl*
 Result := Supports(aNode, INode, l_Node) and (TFoldersItemType(l_Node.GetObjectType) = aType);
//#UC END# *51BED2C201CC_4AE706BB029F_impl*
end;//TPrimFoldersElementInfoForm.CheckAdapterNodeType

function TPrimFoldersElementInfoForm.FindCorrespondingFolder(const aNode: IeeNode): IeeNode;
//#UC START# *51BED301019F_4AE706BB029F_var*
//#UC END# *51BED301019F_4AE706BB029F_var*
begin
//#UC START# *51BED301019F_4AE706BB029F_impl*
 Result := aNode;
 while Assigned(Result) and not CheckAdapterNodeType(Result, FIT_FOLDER) do
  Result := Result.ParentNode;
 if not Supports(Result, INode) then
  Result := nil;
//#UC END# *51BED301019F_4AE706BB029F_impl*
end;//TPrimFoldersElementInfoForm.FindCorrespondingFolder

function TPrimFoldersElementInfoForm.FindNodeByName(const aFolderNode: IeeNode;
  const aName: Il3CString;
  aType: TFoldersItemType): IeeNode;
//#UC START# *51BED32D01C5_4AE706BB029F_var*
//#UC END# *51BED32D01C5_4AE706BB029F_var*
begin
//#UC START# *51BED32D01C5_4AE706BB029F_impl*
 Result := aFolderNode.ChildNode;
 while Assigned(Result) and not (l3Same(Result.Text, aName) and CheckAdapterNodeType(Result, aType)) do
 begin
  if Result.IsLast then
   Result := nil
  else
   Result := Result.NextNode;
 end;
//#UC END# *51BED32D01C5_4AE706BB029F_impl*
end;//TPrimFoldersElementInfoForm.FindNodeByName

procedure TPrimFoldersElementInfoForm.AfterSaveExceptionCheck;
//#UC START# *51BED38C01FC_4AE706BB029F_var*
//#UC END# *51BED38C01FC_4AE706BB029F_var*
begin
//#UC START# *51BED38C01FC_4AE706BB029F_impl*
 if f_EDoChangedAlreadyDoneFired then
 begin
  f_EDoChangedAlreadyDoneFired := False;
  raise EDoChangedAlreadyDone.Create('');
 end;
//#UC END# *51BED38C01FC_4AE706BB029F_impl*
end;//TPrimFoldersElementInfoForm.AfterSaveExceptionCheck

procedure TPrimFoldersElementInfoForm.ShowCurInfo(NeedSuppressComment: Boolean = False);
//#UC START# *51BED3EA03BB_4AE706BB029F_var*
var
 l_Node: INode;
//#UC END# *51BED3EA03BB_4AE706BB029F_var*
begin
//#UC START# *51BED3EA03BB_4AE706BB029F_impl*
 if f_CurType = fiEdit then
  if CheckFolderElementRights(f_CurNode, faModify) then
   SetReadOnlyState(False)
  else
   SetReadOnlyState(True);

 BeginSetCurInfo;
 try
  if (f_CurNode <> nil) then
  begin
   SetSavedInfo;
   ElementName.Text := f_CurNode.Text;
   ElementName.ClearUndoRedoLists;
   if Supports(f_CurNode, INode, l_Node) then
    try
     if not NeedSuppressComment then
      ElementComment.Buffer := nsGetHint(l_Node).AsWStr;

     { ������ � ������ }
     LoadFolderRights(f_CurNode);
     
    finally
     l_Node := nil;
    end
   else
   begin
    ElementComment.Text := '';
   end;
  end;
 finally
  EndSetCurInfo;
 end;
//#UC END# *51BED3EA03BB_4AE706BB029F_impl*
end;//TPrimFoldersElementInfoForm.ShowCurInfo

procedure TPrimFoldersElementInfoForm.SetSavedInfo;
//#UC START# *51BED4720039_4AE706BB029F_var*
//#UC END# *51BED4720039_4AE706BB029F_var*
begin
//#UC START# *51BED4720039_4AE706BB029F_impl*
 if (f_CurType = fiSave) then
 begin
  if ElementName.Modified or ElementComment.Modified then
  begin
   f_SavedName := l3Trim(ElementName.Text);
   f_SavedComment := l3Trim(nsCStr(ElementComment.Buffer));
  end;//ElementName.Modified..
 end;
//#UC END# *51BED4720039_4AE706BB029F_impl*
end;//TPrimFoldersElementInfoForm.SetSavedInfo

procedure TPrimFoldersElementInfoForm.ShowSavedInfo;
//#UC START# *51BED482026B_4AE706BB029F_var*
//#UC END# *51BED482026B_4AE706BB029F_var*
begin
//#UC START# *51BED482026B_4AE706BB029F_impl*
 SetSavedInfo;

 ElementName.Text := f_SavedName;
 ElementName.Hint := l3Str(f_SavedName);
 ElementName.SelectAll;

 ElementComment.Buffer := nsWStr(f_SavedComment);

 DropModifiedState;
//#UC END# *51BED482026B_4AE706BB029F_impl*
end;//TPrimFoldersElementInfoForm.ShowSavedInfo

function TPrimFoldersElementInfoForm.SetSavedObjectName: Boolean;
//#UC START# *51BED493009F_4AE706BB029F_var*
var
 l_List: IDynList;
 l_Query: IQuery;
 l_Bookmark: IBookmark;
 l_ElementName: Il3CString;
//#UC END# *51BED493009F_4AE706BB029F_var*
begin
//#UC START# *51BED493009F_4AE706BB029F_impl*
 l_ElementName := l3Trim(ElementName.Text);
 Result := not l3IsNil(l_ElementName);
 if Result then
  case f_SavedObjType of
   fetBookmark, fetDrugBookMark :
    if Supports(f_SavedObject, IBookmark, l_Bookmark) then
     try
      l_Bookmark.SetName(nsIStr(l_ElementName));
     finally
      l_Bookmark := nil;
     end;//Supports(f_SavedObject, IBookmark, l_Bookmark)
   fetList, fetDrugList:
    if Supports(f_SavedObject, IDynList, l_List) then
     try
      l_List.SetName(nsIStr(l_ElementName));
     finally
      l_List := nil;
     end;//Supports(f_SavedObject, IDynList, l_List)
   fetQuery{, fetFilter}:
    if Supports(f_SavedObject, IQuery, l_Query) then
     try
      l_Query.SetName(nsIStr(l_ElementName));
     finally
      l_Query := nil;
     end;//Supports(f_SavedObject, IQuery, l_Query)
   else
    Assert(false);
  end;//case f_SavedObjType
//#UC END# *51BED493009F_4AE706BB029F_impl*
end;//TPrimFoldersElementInfoForm.SetSavedObjectName

function TPrimFoldersElementInfoForm.CheckModifiedState: Boolean;
//#UC START# *51BED50202F0_4AE706BB029F_var*
//#UC END# *51BED50202F0_4AE706BB029F_var*
begin
//#UC START# *51BED50202F0_4AE706BB029F_impl*
 if f_CurType in [fiNewFolder, fiEdit] then
 begin
  { �������� ����� }
  Result := ElementName.Modified or ElementComment.Modified;
  { �������� ��������� ������� }
  if not Result then
   Result := f_FolderSecurity.Modified;
 end
 else
  Result := False;
//#UC END# *51BED50202F0_4AE706BB029F_impl*
end;//TPrimFoldersElementInfoForm.CheckModifiedState

procedure TPrimFoldersElementInfoForm.DropModifiedState;
//#UC START# *51BED51F009F_4AE706BB029F_var*
//#UC END# *51BED51F009F_4AE706BB029F_var*
begin
//#UC START# *51BED51F009F_4AE706BB029F_impl*
 ElementName.Modified := False;
 ElementComment.Modified := False;
 f_FolderSecurity.Modified := False;
//#UC END# *51BED51F009F_4AE706BB029F_impl*
end;//TPrimFoldersElementInfoForm.DropModifiedState

procedure TPrimFoldersElementInfoForm.SetReadOnlyState(aState: Boolean);
//#UC START# *51BED52F0054_4AE706BB029F_var*
//#UC END# *51BED52F0054_4AE706BB029F_var*
begin
//#UC START# *51BED52F0054_4AE706BB029F_impl*
 ElementName.Enabled := not aState;
 ElementComment.ReadOnly := aState;
//#UC END# *51BED52F0054_4AE706BB029F_impl*
end;//TPrimFoldersElementInfoForm.SetReadOnlyState

procedure TPrimFoldersElementInfoForm.LoadFolderRights(const aTreeNode: IeeNode);
//#UC START# *51BED550018B_4AE706BB029F_var*
var
 lCursor: TCursor;
//#UC END# *51BED550018B_4AE706BB029F_var*
begin
//#UC START# *51BED550018B_4AE706BB029F_impl*
 lCursor := Screen.Cursor;
 try
  Screen.Cursor := crHourGlass;
  f_FolderSecurity.eeFolder := aTreeNode;
 finally
  Screen.Cursor := lCursor;
 end;
//#UC END# *51BED550018B_4AE706BB029F_impl*
end;//TPrimFoldersElementInfoForm.LoadFolderRights

function TPrimFoldersElementInfoForm.CheckUnsaved: Boolean;
//#UC START# *51BED56C0178_4AE706BB029F_var*
//#UC END# *51BED56C0178_4AE706BB029F_var*
begin
//#UC START# *51BED56C0178_4AE706BB029F_impl*
 Result := true;
 if CheckModifiedState then
 begin
  if Ask(qr_SaveItemQuery) then
  begin
   Result := SaveCurInfo;
   AfterSaveExceptionCheck;
  end
  else
   DropModifiedState;
 end;
//#UC END# *51BED56C0178_4AE706BB029F_impl*
end;//TPrimFoldersElementInfoForm.CheckUnsaved
// start class TnsSaveDocumentToFoldersEvent

class procedure TnsSaveDocumentToFoldersEvent.Log(const aDoc: IDocument);
//#UC START# *51BEFAC50138_51BEFA3D019E_var*
var
 l_Data: ILogEventData;
//#UC END# *51BEFAC50138_51BEFA3D019E_var*
begin
//#UC START# *51BEFAC50138_51BEFA3D019E_impl*
 l_Data := MakeParamsList;
 l_Data.AddObject(aDoc);
 GetLogger.AddEvent(LE_SAVE_DOCUMENT_TO_FOLDERS, l_Data);
//#UC END# *51BEFAC50138_51BEFA3D019E_impl*
end;//TnsSaveDocumentToFoldersEvent.Log
// start class TnsSaveQueryEvent

class procedure TnsSaveQueryEvent.Log(const aQuery: IQuery);
//#UC START# *51BEFAF401A3_51BEFA6F00E3_var*
var
 l_Data: ILogEventData;
//#UC END# *51BEFAF401A3_51BEFA6F00E3_var*
begin
//#UC START# *51BEFAF401A3_51BEFA6F00E3_impl*
 l_Data := MakeParamsList;
 l_Data.AddObject(aQuery);
 GetLogger.AddEvent(LE_SAVE_QUERY, l_Data);
//#UC END# *51BEFAF401A3_51BEFA6F00E3_impl*
end;//TnsSaveQueryEvent.Log

function TPrimFoldersElementInfoForm.FolderElement_GetState_Execute: TFoldersInfoType;
//#UC START# *4AE7073F0388_4AE706BB029Fexec_var*
//#UC END# *4AE7073F0388_4AE706BB029Fexec_var*
begin
//#UC START# *4AE7073F0388_4AE706BB029Fexec_impl*
 if (Parent = nil) or Parent.Visible then
  Result := f_CurType
 else
  Result := fiNone;
//#UC END# *4AE7073F0388_4AE706BB029Fexec_impl*
end;//TPrimFoldersElementInfoForm.FolderElement_GetState_Execute

procedure TPrimFoldersElementInfoForm.FolderElement_GetState(const aParams: IvcmExecuteParams);
begin
 with (aParams.Data As IFolderElement_GetState_Params) do
  ResultValue := FolderElement_GetState_Execute;
end;

procedure TPrimFoldersElementInfoForm.FolderElement_SetLoadInfo_Execute(const aForm: IvcmEntityForm;
  const aFolderFilterInfo: InsFolderFilterInfo;
  const aCaption: Il3CString;
  const aData: IUnknown;
  anOp: TListLogicOperation);
//#UC START# *4AE74E1C007F_4AE706BB029Fexec_var*
//#UC END# *4AE74E1C007F_4AE706BB029Fexec_var*
begin
//#UC START# *4AE74E1C007F_4AE706BB029Fexec_impl*
 f_RequestingForm := aForm;
 if (Aggregate <> nil) then
 begin
  op_Folders_FiltrateByFilterInfo.Call(Aggregate, aFolderFilterInfo);
  Op_FolderElement_DisableFilter.Call(Aggregate);

  if (aCaption <> nil) then
   Op_AdditionInfo_SetCaption.Call(Aggregate, aCaption)
  else
   Op_AdditionInfo_SetCaption.Call(Aggregate, vcmCStr(str_SelectCaption));
 end;//Aggregate <> nil

 f_UserLoadParam := aData;
 f_Op := anOp;
//#UC END# *4AE74E1C007F_4AE706BB029Fexec_impl*
end;//TPrimFoldersElementInfoForm.FolderElement_SetLoadInfo_Execute

procedure TPrimFoldersElementInfoForm.FolderElement_SetLoadInfo(const aParams: IvcmExecuteParams);
begin
 with (aParams.Data As IFolderElement_SetLoadInfo_Params) do
  FolderElement_SetLoadInfo_Execute(Form, FolderFilterInfo, Caption, Data, nOp);
end;

procedure TPrimFoldersElementInfoForm.FolderElement_SetContent_Execute(const aNode: IeeNode;
  aIsNewFolder: Boolean = false);
//#UC START# *4AE85279013B_4AE706BB029Fexec_var*
var
 l_AdapterNode: INode;
//#UC END# *4AE85279013B_4AE706BB029Fexec_var*
begin
//#UC START# *4AE85279013B_4AE706BB029Fexec_impl*
 if (aNode <> nil) then
 begin
  if not l3IEQ(f_CurNode, aNode) then
  begin
   if CheckModifiedState then
   begin
    if Ask(qr_SaveItemQuery) then
     SaveCurInfo;
   end;
   f_CurNode := aNode;
  end
  else
   Exit;
 end//aNode <> nil
 else
  f_CurNode := nil;

 if (Parent = nil) or
    Parent.Visible then
 begin
  if not aIsNewFolder and
     (f_CurType = fiNewFolder) then
  begin
   f_CurType := fiEdit;
   InfoName.CCaption := vcmCStr(cInfoCaptions[f_CurType]^);
  end;

  if (f_CurType <> fiSave) then
   ShowCurInfo
  else
   if Supports(f_CurNode, INode, l_AdapterNode) and
      (TFoldersItemType(l_AdapterNode.GetObjectType) = FIT_FOLDER) then
    ShowSavedInfo
   else
   begin
    ShowCurInfo(TFoldersItemType(l_AdapterNode.GetObjectType) = cTypeMap[f_SavedObjType]);
   end;
 end;
 AfterSaveExceptionCheck;
//#UC END# *4AE85279013B_4AE706BB029Fexec_impl*
end;//TPrimFoldersElementInfoForm.FolderElement_SetContent_Execute

procedure TPrimFoldersElementInfoForm.FolderElement_SetContent(const aParams: IvcmExecuteParams);
begin
 with (aParams.Data As IFolderElement_SetContent_Params) do
  FolderElement_SetContent_Execute(Node, IsNewFolder);
end;

procedure TPrimFoldersElementInfoForm.FolderElement_SetSaveInfo_Execute(const aForm: IvcmEntityForm;
  const aFilterInfo: InsFolderFilterInfo;
  anElementType: TFoldersElementType;
  const anEntity: IEntityBase;
  aSaveAs: Boolean);
//#UC START# *4AE857EF0085_4AE706BB029Fexec_var*

 procedure lp_FoldersFiltrate;
 begin
  if (Aggregate <> nil) then
  begin
   Assert(aFilterInfo <> nil);
   Op_Folders_FiltrateByFilterInfo.Call(Aggregate, aFilterInfo);
  end;//Aggregate <> nil
 end;//procedure lp_FoldersFiltrate;

var
 l_List: IDynList;
 l_Query: IQuery;
 l_Bookmark: IBookmark;
 l_CurFolder: IeeNode;
//#UC END# *4AE857EF0085_4AE706BB029Fexec_var*
begin
//#UC START# *4AE857EF0085_4AE706BB029Fexec_impl*
 f_SaveControlState := cbUnChecked;
 f_SavedObjType := anElementType;
 case f_SavedObjType of
  fetBookmark, fetDrugBookMark :
   begin
    if Supports(anEntity, IBookmark, l_Bookmark) then
     try
      f_SavedName := nsGetBookmarkName(l_Bookmark);
      f_SavedComment := nsGetBookmarkComment(l_Bookmark);
     finally
      l_Bookmark := nil;
     end;
    l_CurFolder := UserFoldersTree.BookmarkSavedFolder;
   end;//fetBookmark, fetDrugBookMark
  fetList, fetDrugList:
   begin
    if Supports(anEntity, IDynList, l_List) then
     try
      f_SavedName := bsListName(l_List);
      f_SavedComment := nil;
     finally
      l_List := nil;
     end;
    l_CurFolder := UserFoldersTree.ListSavedFolder;
   end;//fetList, fetDrugList
  fetQuery    :
   begin
    if Supports(anEntity, IQuery, l_Query) then
     try
      f_SavedName := nsCreateQueryName(l_Query);
      f_SavedComment := nil;
     finally
      l_Query := nil;
     end;
    l_CurFolder := UserFoldersTree.QuerySavedFolder;
   end;//fetQuery
(*  fetFilter   :
   begin
    if Supports(anEntity, IQuery, l_Query) then
     try
      case l_Query.GetType of
       QT_KEYWORD:
        f_SavedName := vcmFmt(str_SituationFilterName, [DateTimeToStr(Now)]);
       QT_ATTRIBUTE{,
       QT_OLD_ATTRIBUTE}:
        f_SavedName := vcmFmt(str_AttributesFilterName, [DateTimeToStr(Now)]);
//       QT_OLD_FILTER:
//        f_SavedName := vcmFmt(str_SimpleFilterName, [DateTimeToStr(Now)]);
       QT_PUBLISHED_SOURCE:
        f_SavedName := vcmFmt(str_PublishSourceFilterName, [DateTimeToStr(Now)]);
       QT_BASE_SEARCH:
        f_SavedName := vcmFmt(str_BaseSearchFilterName, [DateTimeToStr(Now)]);
       QT_PHARM_SEARCH:
        f_SavedName := vcmFmt(str_InpharmSearchFilterName, [DateTimeToStr(Now)]);
       else
        Assert(false); 
      end;//case l_Query.GetType
      f_SavedComment := nil;
     finally
      l_Query := nil;
     end;//try..finally
    l_CurFolder := UserFoldersTree.QuerySavedFolder;
   end;//fetFilter*)
   else
    Assert(false);
 end;//case f_SavedObjType
 f_SavedObject := anEntity;
 f_SaveAsFlag := aSaveAs;
 if (l_CurFolder <> nil) then
  Op_Folders_SetCurrent.Call(Aggregate, l_CurFolder);
 f_RequestingForm := aForm;
 lp_FoldersFiltrate;
//#UC END# *4AE857EF0085_4AE706BB029Fexec_impl*
end;//TPrimFoldersElementInfoForm.FolderElement_SetSaveInfo_Execute

procedure TPrimFoldersElementInfoForm.FolderElement_SetSaveInfo(const aParams: IvcmExecuteParams);
begin
 with (aParams.Data As IFolderElement_SetSaveInfo_Params) do
  FolderElement_SetSaveInfo_Execute(Form, FilterInfo, nElementType, nEntity, SaveAs);
end;

procedure TPrimFoldersElementInfoForm.FolderElement_SetState_Execute(aInfoType: TFoldersInfoType);
//#UC START# *4AE9C01201BA_4AE706BB029Fexec_var*
//#UC END# *4AE9C01201BA_4AE706BB029Fexec_var*
begin
//#UC START# *4AE9C01201BA_4AE706BB029Fexec_impl*
 f_CurType := aInfoType;
 InfoName.CCaption := vcmCStr(cInfoCaptions[f_CurType]^);

 SetReadOnlyState(f_CurType in [fiNone, fiLoad, fiSelect]);

 if not ((f_CurType = fiNewFolder) or
         ((f_CurType = fiEdit) and (f_SavedObjType = fetNone) and
         CheckAdapterNodeType(f_CurNode, FIT_FOLDER))) then
  if (f_CurType = fiSave) then
   ShowSavedInfo;
//#UC END# *4AE9C01201BA_4AE706BB029Fexec_impl*
end;//TPrimFoldersElementInfoForm.FolderElement_SetState_Execute

procedure TPrimFoldersElementInfoForm.FolderElement_SetState(const aParams: IvcmExecuteParams);
begin
 with (aParams.Data As IFolderElement_SetState_Params) do
  FolderElement_SetState_Execute(InfoType);
end;

procedure TPrimFoldersElementInfoForm.UsersRights_UpdateRights_Execute(const aNode: IeeNode);
//#UC START# *4AEEC5EA03DC_4AE706BB029Fexec_var*
//#UC END# *4AEEC5EA03DC_4AE706BB029Fexec_var*
begin
//#UC START# *4AEEC5EA03DC_4AE706BB029Fexec_impl*
 LoadFolderRights(aNode);
//#UC END# *4AEEC5EA03DC_4AE706BB029Fexec_impl*
end;//TPrimFoldersElementInfoForm.UsersRights_UpdateRights_Execute

procedure TPrimFoldersElementInfoForm.UsersRights_UpdateRights(const aParams: IvcmExecuteParams);
begin
 with (aParams.Data As IUsersRights_UpdateRights_Params) do
  UsersRights_UpdateRights_Execute(Node);
end;

procedure TPrimFoldersElementInfoForm.FolderElement_ResetModificationOnDelete_Execute(const aNode: IeeNode);
//#UC START# *4AEEC8810299_4AE706BB029Fexec_var*
//#UC END# *4AEEC8810299_4AE706BB029Fexec_var*
begin
//#UC START# *4AEEC8810299_4AE706BB029Fexec_impl*
 if l3IEQ(f_CurNode, aNode) and CheckModifiedState then
 begin
  DropModifiedState;
  FolderElement_SetContent_Execute(aNode);
 end;//l3IEQ(f_CurNode, aNode)..
//#UC END# *4AEEC8810299_4AE706BB029Fexec_impl*
end;//TPrimFoldersElementInfoForm.FolderElement_ResetModificationOnDelete_Execute

procedure TPrimFoldersElementInfoForm.FolderElement_ResetModificationOnDelete(const aParams: IvcmExecuteParams);
begin
 with (aParams.Data As IFolderElement_ResetModificationOnDelete_Params) do
  FolderElement_ResetModificationOnDelete_Execute(Node);
end;

procedure TPrimFoldersElementInfoForm.FolderElement_SetFocus_Execute;
//#UC START# *4AF46E0C017F_4AE706BB029Fexec_var*
//#UC END# *4AF46E0C017F_4AE706BB029Fexec_var*
begin
//#UC START# *4AF46E0C017F_4AE706BB029Fexec_impl*
 Windows.SetFocus(ElementName.Handle);
//#UC END# *4AF46E0C017F_4AE706BB029Fexec_impl*
end;//TPrimFoldersElementInfoForm.FolderElement_SetFocus_Execute

procedure TPrimFoldersElementInfoForm.FolderElement_SetFocus(const aParams: IvcmExecuteParams);
begin
 FolderElement_SetFocus_Execute;
end;

procedure TPrimFoldersElementInfoForm.FolderElement_Redraw_Execute;
//#UC START# *4AF4727C0020_4AE706BB029Fexec_var*
var
 l_AdapterNode: INode;
//#UC END# *4AF4727C0020_4AE706BB029Fexec_var*
begin
//#UC START# *4AF4727C0020_4AE706BB029Fexec_impl*
 if (f_CurType <> fiSave) then
  ShowCurInfo
 else
 if Supports(f_CurNode, INode, l_AdapterNode) and
    (TFoldersItemType(l_AdapterNode.GetObjectType) = FIT_FOLDER) then
  ShowSavedInfo
 else
  ShowCurInfo;
//#UC END# *4AF4727C0020_4AE706BB029Fexec_impl*
end;//TPrimFoldersElementInfoForm.FolderElement_Redraw_Execute

procedure TPrimFoldersElementInfoForm.FolderElement_Redraw(const aParams: IvcmExecuteParams);
begin
 FolderElement_Redraw_Execute;
end;

procedure TPrimFoldersElementInfoForm.Result_ExternalOk_Execute;
//#UC START# *4AF4768A0372_4AE706BB029Fexec_var*
var
 l_AdapterNode: INode;
 l_OpsResult: Boolean;
//#UC END# *4AF4768A0372_4AE706BB029Fexec_var*
begin
//#UC START# *4AF4768A0372_4AE706BB029Fexec_impl*
 if f_CurType in [fiLoad, fiSelect, fiSave] then
 begin
  case f_CurType of
   fiLoad,
   fiSelect:
      begin
       if Supports(f_CurNode, INode, l_AdapterNode) and
          (TFoldersItemType(l_AdapterNode.GetObjectType) <> FIT_FOLDER) then
        l_OpsResult := SendChosenObject
       else
        l_OpsResult := False;

       l_AdapterNode := nil;
      end;
   fiSave :
      begin
       if CheckFolderElementRights(f_CurNode, faModify) then
        l_OpsResult := SaveOrOverrideCurObj
       else
        l_OpsResult := False;

       l_AdapterNode := nil;
      end;
   else
    l_OpsResult := False;
  end;

  if l_OpsResult then
  begin
   if (Aggregate <> nil) then
    if Container.AsForm.ZoneType = vcm_ztManualModal then
     Op_AdditionInfo_Close.Call(Aggregate, mrOK)
    else
    begin
     f_CurType := fiNone;
     Container.Operation(TdmStdRes.opcode_AdditionInfo_Hide);
    end;
  end;
 end;
//#UC END# *4AF4768A0372_4AE706BB029Fexec_impl*
end;//TPrimFoldersElementInfoForm.Result_ExternalOk_Execute

procedure TPrimFoldersElementInfoForm.Result_ExternalOk(const aParams: IvcmExecuteParams);
begin
 Result_ExternalOk_Execute;
end;

procedure TPrimFoldersElementInfoForm.UsersRights_FolderShareChanged_Execute;
//#UC START# *4AF4797100E8_4AE706BB029Fexec_var*
//#UC END# *4AF4797100E8_4AE706BB029Fexec_var*
begin
//#UC START# *4AF4797100E8_4AE706BB029Fexec_impl*
 with f_FolderSecurity do
 begin
  ShareChanged;
  Modified := False;
 end;
//#UC END# *4AF4797100E8_4AE706BB029Fexec_impl*
end;//TPrimFoldersElementInfoForm.UsersRights_FolderShareChanged_Execute

procedure TPrimFoldersElementInfoForm.UsersRights_FolderShareChanged(const aParams: IvcmExecuteParams);
begin
 UsersRights_FolderShareChanged_Execute;
end;

procedure TPrimFoldersElementInfoForm.FolderElement_DisableSecurityPage_Execute;
//#UC START# *4AF814650325_4AE706BB029Fexec_var*
//#UC END# *4AF814650325_4AE706BB029Fexec_var*
begin
//#UC START# *4AF814650325_4AE706BB029Fexec_impl*
 cbShared.Enabled := False;
//#UC END# *4AF814650325_4AE706BB029Fexec_impl*
end;//TPrimFoldersElementInfoForm.FolderElement_DisableSecurityPage_Execute

procedure TPrimFoldersElementInfoForm.FolderElement_DisableSecurityPage(const aParams: IvcmExecuteParams);
begin
 FolderElement_DisableSecurityPage_Execute;
end;

procedure TPrimFoldersElementInfoForm.Cleanup;
//#UC START# *479731C50290_4AE706BB029F_var*
//#UC END# *479731C50290_4AE706BB029F_var*
begin
//#UC START# *479731C50290_4AE706BB029F_impl*
 f_SavedComment := nil;
 f_SavedName := nil;
 f_SavedObject := nil;
 vcmFree(f_FolderSecurity);
 inherited;
//#UC END# *479731C50290_4AE706BB029F_impl*
end;//TPrimFoldersElementInfoForm.Cleanup

procedure TPrimFoldersElementInfoForm.InitFields;
//#UC START# *47A042E100E2_4AE706BB029F_var*
//#UC END# *47A042E100E2_4AE706BB029F_var*
begin
//#UC START# *47A042E100E2_4AE706BB029F_impl*
 inherited;
 f_Op := LLO_NONE;
//#UC END# *47A042E100E2_4AE706BB029F_impl*
end;//TPrimFoldersElementInfoForm.InitFields

{$If not defined(NoVCM)}
procedure TPrimFoldersElementInfoForm.DoInit(aFromHistory: Boolean);
//#UC START# *49803F5503AA_4AE706BB029F_var*
//#UC END# *49803F5503AA_4AE706BB029F_var*
begin
//#UC START# *49803F5503AA_4AE706BB029F_impl*
 f_FolderSecurity := TFolderSecurity.Create(cbShared);

 // http://mdp.garant.ru/pages/viewpage.action?pageId=303858572&focusedCommentId=305955493#comment-305955493
 // �� ������ ������, �.�. ����������� ������ ��� ��������
 {$If not defined(Admin) AND not defined(Monitorings)}
  if (DefDataAdapter <> nil) then
  begin
    ElementName.DisableDragAndDropSupport := DefDataAdapter.IsTrialMode;
    ElementComment.DisableDragAndDropSupport := DefDataAdapter.IsTrialMode;
  end;
 {$IfEnd} //not Admin AND not Monitorings
//#UC END# *49803F5503AA_4AE706BB029F_impl*
end;//TPrimFoldersElementInfoForm.DoInit
{$IfEnd} //not NoVCM

{$If not defined(NoVCM)}
procedure TPrimFoldersElementInfoForm.InitControls;
//#UC START# *4A8E8F2E0195_4AE706BB029F_var*
//#UC END# *4A8E8F2E0195_4AE706BB029F_var*
begin
//#UC START# *4A8E8F2E0195_4AE706BB029F_impl*
 BorderIcons := [biSystemMenu];
 BorderStyle := bsDialog;
 ClientHeight := 260;
 ClientWidth := 344;
 Scaled := False;
 OnCloseQueryEx := vcmEntityFormCloseQueryEx;

 with InfoName do
 begin
  Left := 0;
  Top := 0;
  Width := 344;
  Height := 15;
  Align := alTop;
  Font.Height := -12;
  Font.Style := [fsBold];
 end;
 with CommentPanel do
 begin
  Align := alClient;
  BevelOuter := bvNone;
  BorderWidth := 7;
  TabOrder := 1;
 end;
 with ElementComment do
 begin
  Align := alClient;
  BorderStyle := bsSingle;
  TabOrder := 0;
  TabStop := True;
 end;
 with CaptionPanel do
 begin
  Height := 18;
  Align := alTop;
  BevelOuter := bvNone;
  TabOrder := 1;
 end;
 with lblComment do
 begin
  Left := 0;
  Top := 0;
  Width := 78;
  Height := 16;
 end;
 with TopPanel do
 begin
  Height := 66;
  Align := alTop;
  BevelOuter := bvNone;
  TabOrder := 0;
 end;
 with NamePanel do
 begin
  Align := alClient;
  BevelOuter := bvNone;
  TabOrder := 0;
  OnResize := NamePanelResize;
 end;
 with lblElementName do
 begin
  Left := 8;
  Top := 1;
  Width := 29;
  Height := 16;
 end;
 with ElementName do
 begin
  Left := 7;
  Top := 17;
  Width := 326;
  Height := 22;
  Anchors := [akLeft, akTop, akRight];
  TabOrder := 0;
  ShowHint := True;
 end;
 with cbShared do
 begin
  Left := 8;
  Top := 48;
  Width := 321;
  Height := 17;
  TabOrder := 1;
 end;
//#UC END# *4A8E8F2E0195_4AE706BB029F_impl*
end;//TPrimFoldersElementInfoForm.InitControls
{$IfEnd} //not NoVCM

{$If not defined(NoVCM)}
procedure TPrimFoldersElementInfoForm.SetActiveControl;
//#UC START# *4AC3803A03CD_4AE706BB029F_var*
//#UC END# *4AC3803A03CD_4AE706BB029F_var*
begin
//#UC START# *4AC3803A03CD_4AE706BB029F_impl*
 Windows.SetFocus(ElementName.Handle);
//#UC END# *4AC3803A03CD_4AE706BB029F_impl*
end;//TPrimFoldersElementInfoForm.SetActiveControl
{$IfEnd} //not NoVCM

procedure TPrimFoldersElementInfoForm.ClearFields;
 {-}
begin
 f_UserLoadParam := nil;
 f_RequestingForm := nil;
 f_CurNode := nil;
 f_SavedName := nil;
 f_SavedComment := nil;
 f_SavedObject := nil;
 inherited;
end;//TPrimFoldersElementInfoForm.ClearFields

procedure TPrimFoldersElementInfoForm.InitEntities;
begin
 inherited;
 with Entities.Entities do
 begin
  PublishFormEntity(en_FolderElement, nil);
  PublishFormEntity(en_UsersRights, nil);
  PublishFormEntity(en_Result, nil);
  PublishOpWithResult(en_FolderElement, op_GetState, FolderElement_GetState, nil, nil);
  PublishOpWithResult(en_FolderElement, op_SetLoadInfo, FolderElement_SetLoadInfo, nil, nil);
  PublishOpWithResult(en_FolderElement, op_SetContent, FolderElement_SetContent, nil, nil);
  PublishOpWithResult(en_FolderElement, op_SetSaveInfo, FolderElement_SetSaveInfo, nil, nil);
  PublishOpWithResult(en_FolderElement, op_SetState, FolderElement_SetState, nil, nil);
  PublishOpWithResult(en_UsersRights, op_UpdateRights, UsersRights_UpdateRights, nil, nil);
  PublishOpWithResult(en_FolderElement, op_ResetModificationOnDelete, FolderElement_ResetModificationOnDelete, nil, nil);
  PublishOpWithResult(en_FolderElement, op_SetFocus, FolderElement_SetFocus, nil, nil);
  PublishOpWithResult(en_FolderElement, op_Redraw, FolderElement_Redraw, nil, nil);
  PublishOpWithResult(en_Result, op_ExternalOk, Result_ExternalOk, nil, nil);
  PublishOpWithResult(en_UsersRights, op_FolderShareChanged, UsersRights_FolderShareChanged, nil, nil);
  PublishOpWithResult(en_FolderElement, op_DisableSecurityPage, FolderElement_DisableSecurityPage, nil, nil);
 end;//with Entities.Entities
end;

procedure TPrimFoldersElementInfoForm.MakeControls;
begin
 inherited;
 with AddUsertype(utFoldersPropertyName,
  str_utFoldersPropertyCaption,
  str_utFoldersPropertyCaption,
  false,
  -1,
  -1,
  '',
  nil,
  nil,
  nil,
  vcm_ccNone) do
 begin
 end;//with AddUsertype(utFoldersPropertyName
 f_CommentPanel := TvtPanel.Create(Self);
 f_CommentPanel.Name := 'CommentPanel';
 f_CommentPanel.Parent := Self;
 f_ElementComment := TeeMemoWithEditOperations.Create(Self);
 f_ElementComment.Name := 'ElementComment';
 f_ElementComment.Parent := CommentPanel;
 f_CaptionPanel := TvtPanel.Create(Self);
 f_CaptionPanel.Name := 'CaptionPanel';
 f_CaptionPanel.Parent := CommentPanel;
 f_lblComment := TvtLabel.Create(Self);
 f_lblComment.Name := 'lblComment';
 f_lblComment.Parent := CaptionPanel;
 f_lblComment.Caption := '����������:';
 f_TopPanel := TvtPanel.Create(Self);
 f_TopPanel.Name := 'TopPanel';
 f_TopPanel.Parent := Self;
 f_NamePanel := TvtPanel.Create(Self);
 f_NamePanel.Name := 'NamePanel';
 f_NamePanel.Parent := TopPanel;
 f_lblElementName := TvtLabel.Create(Self);
 f_lblElementName.Name := 'lblElementName';
 f_lblElementName.Parent := NamePanel;
 f_lblElementName.Caption := '���:';
 f_ElementName := TnscComboBoxWithReadOnly.Create(Self);
 f_ElementName.Name := 'ElementName';
 f_ElementName.Parent := NamePanel;
 f_cbShared := TeeCheckBox.Create(Self);
 f_cbShared.Name := 'cbShared';
 f_cbShared.Parent := NamePanel;
 f_cbShared.Caption := '����� ������';
 f_InfoName := TvtLabel.Create(Self);
 f_InfoName.Name := 'InfoName';
 f_InfoName.Parent := Self;
 f_InfoName.Caption := '��������';
end;

{$IfEnd} //not Admin AND not Monitorings

initialization
{$If not defined(Admin) AND not defined(Monitorings)}
// ������������� str_utFoldersPropertyCaption
 str_utFoldersPropertyCaption.Init;
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimFoldersElementInfo_Control_CommentPanel
 Tkw_PrimFoldersElementInfo_Control_CommentPanel.Register('�������::CommentPanel', TvtPanel);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimFoldersElementInfo_Control_CommentPanel_Push
 Tkw_PrimFoldersElementInfo_Control_CommentPanel_Push.Register('�������::CommentPanel:push');
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimFoldersElementInfo_Control_ElementComment
 Tkw_PrimFoldersElementInfo_Control_ElementComment.Register('�������::ElementComment', TeeMemoWithEditOperations);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimFoldersElementInfo_Control_ElementComment_Push
 Tkw_PrimFoldersElementInfo_Control_ElementComment_Push.Register('�������::ElementComment:push');
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimFoldersElementInfo_Control_CaptionPanel
 Tkw_PrimFoldersElementInfo_Control_CaptionPanel.Register('�������::CaptionPanel', TvtPanel);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimFoldersElementInfo_Control_CaptionPanel_Push
 Tkw_PrimFoldersElementInfo_Control_CaptionPanel_Push.Register('�������::CaptionPanel:push');
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimFoldersElementInfo_Control_lblComment
 Tkw_PrimFoldersElementInfo_Control_lblComment.Register('�������::lblComment', TvtLabel);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimFoldersElementInfo_Control_lblComment_Push
 Tkw_PrimFoldersElementInfo_Control_lblComment_Push.Register('�������::lblComment:push');
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimFoldersElementInfo_Control_TopPanel
 Tkw_PrimFoldersElementInfo_Control_TopPanel.Register('�������::TopPanel', TvtPanel);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimFoldersElementInfo_Control_TopPanel_Push
 Tkw_PrimFoldersElementInfo_Control_TopPanel_Push.Register('�������::TopPanel:push');
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimFoldersElementInfo_Control_NamePanel
 Tkw_PrimFoldersElementInfo_Control_NamePanel.Register('�������::NamePanel', TvtPanel);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimFoldersElementInfo_Control_NamePanel_Push
 Tkw_PrimFoldersElementInfo_Control_NamePanel_Push.Register('�������::NamePanel:push');
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimFoldersElementInfo_Control_lblElementName
 Tkw_PrimFoldersElementInfo_Control_lblElementName.Register('�������::lblElementName', TvtLabel);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimFoldersElementInfo_Control_lblElementName_Push
 Tkw_PrimFoldersElementInfo_Control_lblElementName_Push.Register('�������::lblElementName:push');
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimFoldersElementInfo_Control_ElementName
 Tkw_PrimFoldersElementInfo_Control_ElementName.Register('�������::ElementName', TnscComboBoxWithReadOnly);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimFoldersElementInfo_Control_ElementName_Push
 Tkw_PrimFoldersElementInfo_Control_ElementName_Push.Register('�������::ElementName:push');
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimFoldersElementInfo_Control_cbShared
 Tkw_PrimFoldersElementInfo_Control_cbShared.Register('�������::cbShared', TeeCheckBox);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimFoldersElementInfo_Control_cbShared_Push
 Tkw_PrimFoldersElementInfo_Control_cbShared_Push.Register('�������::cbShared:push');
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimFoldersElementInfo_Control_InfoName
 Tkw_PrimFoldersElementInfo_Control_InfoName.Register('�������::InfoName', TvtLabel);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimFoldersElementInfo_Control_InfoName_Push
 Tkw_PrimFoldersElementInfo_Control_InfoName_Push.Register('�������::InfoName:push');
{$IfEnd} //not Admin AND not Monitorings

end.