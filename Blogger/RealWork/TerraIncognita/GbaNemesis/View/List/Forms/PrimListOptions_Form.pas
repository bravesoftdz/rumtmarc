unit PrimListOptions_Form;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "View"
// �����: ����� �.�.
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/View/List/Forms/PrimListOptions_Form.pas"
// �����: 21.07.2010 12:05
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<VCMContainer::Class>> F1 ������ � ���������� � ������� ����������::WorkWithList::View::List::PrimListOptions
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
  afwInterfaces
  {$If not defined(NoVCM)}
  ,
  vcmExternalInterfaces
  {$IfEnd} //not NoVCM
  ,
  bsTypes,
  OfficeLike_Usual_Controls
  {$If defined(Nemesis)}
  ,
  nscEditor
  {$IfEnd} //Nemesis
  ,
  Base_Operations_F1Specific_Controls,
  PrimList_Form,
  afwNavigation,
  k2Prim,
  Base_Operations_Strange_Controls,
  Base_Operations_Editions_Controls,
  BaseSearchInterfaces,
  Common_Strange_Controls,
  OfficeLike_Tree_Controls,
  WorkWithList_ListOperations_Controls
  {$If defined(Nemesis)}
  ,
  nscReminder
  {$IfEnd} //Nemesis
  ,
  Hypertext_Controls_Controls
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
  l3Interfaces,
  DynamicDocListUnit,
  l3TreeInterfaces,
  FiltersUnit,
  FoldersDomainInterfaces,
  vcmInterfaces {a},
  vcmEntityForm {a}
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}
type
 TPrimListOptionsForm = {form} class(TPrimListForm, InsBaseSearchListSource)
 private
 // private fields
   f_remListFiltered : TnscReminder;
    {* ���� ��� �������� remListFiltered}
   f_remListModified : TnscReminder;
    {* ���� ��� �������� remListModified}
   f_remTimeMachineWarning : TnscReminder;
    {* ���� ��� �������� remTimeMachineWarning}
   f_RemindersLine : TnscRemindersLine;
    {* ���� ��� �������� RemindersLine}
   f_EmptyListEditor : TnscEditor;
    {* ���� ��� �������� EmptyListEditor}
 protected
  procedure InitEntities; override;
  procedure MakeControls; override;
 private
 // private methods
   procedure GenerateText(const aGen: Ik2TagGenerator);
     {* ���������� �����, � ������ ����� ������ ���������������/
          ��������������� ��������� ���� ���. }
   procedure ChangeControlsVisible(aShowList: Boolean);
     {* �������� � ������ ����� ��������� ���� �����, �������� ������������
           ��� ������� ������ � ������������ ������ ������ ������ }
   function EditorJumpTo(Sender: TObject;
     anEffects: TafwJumpToEffects;
     const aMoniker: IevMoniker): Boolean;
 protected
 // realized methods
   procedure Edit_Delete_Test(const aParams: IvcmTestParamsPrim);
     {* ������� }
   procedure Edit_Delete_GetState(var State: TvcmOperationStateIndex);
     {* ������� }
   procedure Edit_Delete_Execute(const aParams: IvcmExecuteParamsPrim);
     {* ������� }
   procedure File_Print_Test(const aParams: IvcmTestParamsPrim);
     {* ������ }
   procedure File_Print_Execute(const aParams: IvcmExecuteParamsPrim);
     {* ������ }
   procedure File_PrintDialog_Test(const aParams: IvcmTestParamsPrim);
     {* ������... }
   procedure File_PrintDialog_Execute(const aParams: IvcmExecuteParamsPrim);
     {* ������... }
   procedure File_PrintPreview_Test(const aParams: IvcmTestParamsPrim);
     {* ��������������� �������� }
   procedure File_PrintPreview_Execute(const aParams: IvcmExecuteParamsPrim);
     {* ��������������� �������� }
   procedure File_Save_Test(const aParams: IvcmTestParamsPrim);
     {* ��������� }
   procedure File_Save_Execute(const aParams: IvcmExecuteParamsPrim);
     {* ��������� }
   procedure File_ToMSWord_Test(const aParams: IvcmTestParamsPrim);
     {* ������� � Word }
   procedure File_ToMSWord_Execute(const aParams: IvcmExecuteParamsPrim);
     {* ������� � Word }
   procedure File_SendMailAsAttachment_Test(const aParams: IvcmTestParamsPrim);
     {* ������� �� e-mail }
   procedure File_SendMailAsAttachment_Execute(const aParams: IvcmExecuteParamsPrim);
     {* ������� �� e-mail }
   procedure Document_AddBookmark_Test(const aParams: IvcmTestParamsPrim);
     {* �������� �������� }
   procedure Document_AddBookmark_Execute(const aParams: IvcmExecuteParamsPrim);
     {* �������� �������� }
   function Get_SearchList: IDynList;
   procedure Edit_SelectAll_Test(const aParams: IvcmTestParamsPrim);
     {* �������� �� }
   procedure Edit_SelectAll_Execute(const aParams: IvcmExecuteParamsPrim);
     {* �������� �� }
   procedure ShowEditorOrList(const aTree: Il3SimpleTree); override;
   function ApplyFilter(const aFilter: IFilterFromQuery;
    aAdd: Boolean = False): Boolean; override;
   function IsListEmpty: Boolean; override;
   procedure QueryMaximized; override;
   procedure QueryOpen; override;
   procedure Tree_ExpandAll_Execute(const aParams: IvcmExecuteParamsPrim);
     {* ���������� ��� }
   procedure Tree_CollapseAll_Execute(const aParams: IvcmExecuteParamsPrim);
     {* �������� ��� }
   procedure Tree_Wrap_Test(const aParams: IvcmTestParamsPrim);
     {* ������� �� ������ }
   procedure SaveToFolders(aOperation: Integer = 0); override;
   function MakeFilterInfo(aType: TnsFolderFilter): InsFolderFilterInfo; override;
   procedure ResetSaveToFolderOperations; override;
   function CheckValidSortTypes(aSortType: TbsValidSortTypes): Boolean; override;
   procedure List_OrAnotherList_Test(const aParams: IvcmTestParamsPrim);
   procedure List_OrAnotherList_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure List_AndAnotherList_Test(const aParams: IvcmTestParamsPrim);
   procedure List_AndAnotherList_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure List_AndNotAnotherList_Test(const aParams: IvcmTestParamsPrim);
   procedure List_AndNotAnotherList_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Document_Open_Test(const aParams: IvcmTestParamsPrim);
   procedure Document_Open_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Document_OpenNewWindow_Test(const aParams: IvcmTestParamsPrim);
   procedure Document_OpenNewWindow_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Openable_OpenInNewWindow_Test(const aParams: IvcmTestParamsPrim);
   procedure Openable_OpenInNewWindow_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Document_PrintDialog_Test(const aParams: IvcmTestParamsPrim);
   procedure Document_PrintDialog_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Document_PrintPreview_Test(const aParams: IvcmTestParamsPrim);
   procedure Document_PrintPreview_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Document_Save_Test(const aParams: IvcmTestParamsPrim);
   procedure Document_Save_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Document_Print_Test(const aParams: IvcmTestParamsPrim);
   procedure Document_Print_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure WarnListFiltered_ClearAll_Execute(const aParams: IvcmExecuteParamsPrim);
     {* �������� ��� ������� }
   procedure Reminder_RemListModified_Test(const aParams: IvcmTestParamsPrim);
   procedure Reminder_RemListModified_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Reminder_RemListFiltered_Test(const aParams: IvcmTestParamsPrim);
   procedure Reminder_RemListFiltered_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Reminder_RemListTimeMachineWarning_Test(const aParams: IvcmTestParamsPrim);
   procedure List_WorkWithList_Test(const aParams: IvcmTestParamsPrim);
     {* ������ �� ������� }
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* ������� ������� ����� �������. }
   procedure InitFields; override;
   procedure FinishDataUpdate; override;
   procedure SettingsReplaceFinish; override;
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
   procedure ClearFields; override;
 public
 // overridden public methods
   {$If not defined(NoVCM)}
   function DoGetTabInfo(out theCaption: Il3CString;
    out theItemIndex: Integer): Boolean; override;
     {* ���������� � ��������, � ������� ����������� �����. ��� ���������� � �������� }
   {$IfEnd} //not NoVCM
 protected
 // protected fields
   f_ListOpsList : IvcmItems;
   f_ValidSortTypes : TbsValidSortTypes;
 protected
 // protected methods
   function CurrentImageIndex: Integer;
   procedure DefineCaption;
 public
 // public properties
   property remListFiltered: TnscReminder
     read f_remListFiltered;
   property remListModified: TnscReminder
     read f_remListModified;
   property remTimeMachineWarning: TnscReminder
     read f_remTimeMachineWarning;
   property RemindersLine: TnscRemindersLine
     read f_RemindersLine;

   property EmptyListEditor: TnscEditor
     read f_EmptyListEditor;
 end;//TPrimListOptionsForm

 TvcmContainerFormRef = TPrimListOptionsForm;
{$IfEnd} //not Admin AND not Monitorings

implementation

{$If not defined(Admin) AND not defined(Monitorings)}
uses
  nsToMSWordOp,
  afwFacade,
  Controls,
  nsExternalObject
  {$If not defined(NoVCM)}
  ,
  vcmBase
  {$IfEnd} //not NoVCM
  ,
  nsTypes,
  bsUtils
  {$If not defined(NoVCM)}
  ,
  vcmMessagesSupport
  {$IfEnd} //not NoVCM
  ,
  DocumentUnit,
  nsUtils,
  DocumentInterfaces,
  PresentationInterfaces,
  BaseTypesUnit,
  nsDocumentTools,
  l3String,
  DataAdapter,
  l3Base,
  nsConst,
  resWarnImages,
  SysUtils,
  TextPara_Const,
  Document_Const,
  k2Tags,
  l3Chars,
  nevNavigation,
  Windows,
  nsListSortTypeMap,
  nsFolderFilterInfo,
  ListUserTypes_lftConsultation_UserType,
  ListUserTypes_lftCorrespondent_UserType,
  ListUserTypes_lftCorrespondentsSynchroForm_UserType,
  ListUserTypes_lftDrugInternationalNameSynonyms_UserType,
  ListUserTypes_lftDrugInternationalNameSynonymsSynchroForm_UserType,
  ListUserTypes_lftRespondent_UserType,
  ListUserTypes_lftSynchroView_UserType,
  ListUserTypes_lftUserCR1_UserType,
  ListUserTypes_lftUserCR2_UserType,
  ListUserTypes_lftRCToPart_UserType,
  nsValueMaps,
  Common_FormDefinitions_Controls,
  ListUserTypes_lftSimilarDocumentsSynchroView_UserType,
  ListUserTypes_lftProducedDrugsSynchroForm_UserType,
  ListUserTypes_lftNone_UserType,
  ListUserTypes_lftProducedDrugs_UserType,
  ListUserTypes_lftSimilarDocuments_UserType,
  nsValueMapsIDs,
  ListUserTypes_lftDrugList_UserType
  {$If not defined(NoVCM)}
  ,
  vcmItems
  {$IfEnd} //not NoVCM
  ,
  vtReminderUtils,
  nsQuestions,
  nsExternalObjectModelPart
  {$If not defined(NoScripts)}
  ,
  tfwScriptingInterfaces
  {$IfEnd} //not NoScripts
  ,
  StdRes {a},
  OfficeLike_Text_Controls,
  Search_Strange_Controls,
  WorkWithList_StatusBar_Controls
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}

const
   { LinkHandles }
  c_nsClearFiltersLink = 1;
   { ������ � ��������� �������� ��� ������� }
  c_nsOpenReferenceLink = 2;
   { ������ � ������ ������� � ������ }

type
  Tkw_PrimListOptions_Control_remListFiltered = class(TtfwControlString)
   {* ����� ������� ��� �������������� �������� remListFiltered
----
*������ �������������*:
[code]
�������::remListFiltered TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimListOptions_Control_remListFiltered

// start class Tkw_PrimListOptions_Control_remListFiltered

{$If not defined(NoScripts)}
function Tkw_PrimListOptions_Control_remListFiltered.GetString: AnsiString;
 {-}
begin
 Result := 'remListFiltered';
end;//Tkw_PrimListOptions_Control_remListFiltered.GetString
{$IfEnd} //not NoScripts

type
  Tkw_PrimListOptions_Control_remListFiltered_Push = class(TkwBynameControlPush)
   {* ����� ������� ��� �������� remListFiltered
----
*������ �������������*:
[code]
�������::remListFiltered:push pop:control:SetFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimListOptions_Control_remListFiltered_Push

// start class Tkw_PrimListOptions_Control_remListFiltered_Push

{$If not defined(NoScripts)}
procedure Tkw_PrimListOptions_Control_remListFiltered_Push.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString('remListFiltered');
 inherited;
end;//Tkw_PrimListOptions_Control_remListFiltered_Push.DoDoIt
{$IfEnd} //not NoScripts

type
  Tkw_PrimListOptions_Control_remListModified = class(TtfwControlString)
   {* ����� ������� ��� �������������� �������� remListModified
----
*������ �������������*:
[code]
�������::remListModified TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimListOptions_Control_remListModified

// start class Tkw_PrimListOptions_Control_remListModified

{$If not defined(NoScripts)}
function Tkw_PrimListOptions_Control_remListModified.GetString: AnsiString;
 {-}
begin
 Result := 'remListModified';
end;//Tkw_PrimListOptions_Control_remListModified.GetString
{$IfEnd} //not NoScripts

type
  Tkw_PrimListOptions_Control_remListModified_Push = class(TkwBynameControlPush)
   {* ����� ������� ��� �������� remListModified
----
*������ �������������*:
[code]
�������::remListModified:push pop:control:SetFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimListOptions_Control_remListModified_Push

// start class Tkw_PrimListOptions_Control_remListModified_Push

{$If not defined(NoScripts)}
procedure Tkw_PrimListOptions_Control_remListModified_Push.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString('remListModified');
 inherited;
end;//Tkw_PrimListOptions_Control_remListModified_Push.DoDoIt
{$IfEnd} //not NoScripts

type
  Tkw_PrimListOptions_Control_remTimeMachineWarning = class(TtfwControlString)
   {* ����� ������� ��� �������������� �������� remTimeMachineWarning
----
*������ �������������*:
[code]
�������::remTimeMachineWarning TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimListOptions_Control_remTimeMachineWarning

// start class Tkw_PrimListOptions_Control_remTimeMachineWarning

{$If not defined(NoScripts)}
function Tkw_PrimListOptions_Control_remTimeMachineWarning.GetString: AnsiString;
 {-}
begin
 Result := 'remTimeMachineWarning';
end;//Tkw_PrimListOptions_Control_remTimeMachineWarning.GetString
{$IfEnd} //not NoScripts

type
  Tkw_PrimListOptions_Control_remTimeMachineWarning_Push = class(TkwBynameControlPush)
   {* ����� ������� ��� �������� remTimeMachineWarning
----
*������ �������������*:
[code]
�������::remTimeMachineWarning:push pop:control:SetFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimListOptions_Control_remTimeMachineWarning_Push

// start class Tkw_PrimListOptions_Control_remTimeMachineWarning_Push

{$If not defined(NoScripts)}
procedure Tkw_PrimListOptions_Control_remTimeMachineWarning_Push.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString('remTimeMachineWarning');
 inherited;
end;//Tkw_PrimListOptions_Control_remTimeMachineWarning_Push.DoDoIt
{$IfEnd} //not NoScripts

type
  Tkw_PrimListOptions_Component_RemindersLine = class(TtfwControlString)
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
  end;//Tkw_PrimListOptions_Component_RemindersLine

// start class Tkw_PrimListOptions_Component_RemindersLine

{$If not defined(NoScripts)}
function Tkw_PrimListOptions_Component_RemindersLine.GetString: AnsiString;
 {-}
begin
 Result := 'RemindersLine';
end;//Tkw_PrimListOptions_Component_RemindersLine.GetString
{$IfEnd} //not NoScripts

type
  Tkw_PrimListOptions_Control_EmptyListEditor = class(TtfwControlString)
   {* ����� ������� ��� �������������� �������� EmptyListEditor
----
*������ �������������*:
[code]
�������::EmptyListEditor TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimListOptions_Control_EmptyListEditor

// start class Tkw_PrimListOptions_Control_EmptyListEditor

{$If not defined(NoScripts)}
function Tkw_PrimListOptions_Control_EmptyListEditor.GetString: AnsiString;
 {-}
begin
 Result := 'EmptyListEditor';
end;//Tkw_PrimListOptions_Control_EmptyListEditor.GetString
{$IfEnd} //not NoScripts

type
  Tkw_PrimListOptions_Control_EmptyListEditor_Push = class(TkwBynameControlPush)
   {* ����� ������� ��� �������� EmptyListEditor
----
*������ �������������*:
[code]
�������::EmptyListEditor:push pop:control:SetFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimListOptions_Control_EmptyListEditor_Push

// start class Tkw_PrimListOptions_Control_EmptyListEditor_Push

{$If not defined(NoScripts)}
procedure Tkw_PrimListOptions_Control_EmptyListEditor_Push.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString('EmptyListEditor');
 inherited;
end;//Tkw_PrimListOptions_Control_EmptyListEditor_Push.DoDoIt
{$IfEnd} //not NoScripts

procedure TPrimListOptionsForm.GenerateText(const aGen: Ik2TagGenerator);
//#UC START# *4F82B4C6025F_4C46AA3401DB_var*

  procedure lpOutString(const aValue: Il3CString);

   procedure lpAddParagraph(const aValue: Il3CString);
   begin//lpAddParagraph
    aGen.StartChild(k2_idTextPara);
    try
     if (aValue <> nil) then
      aGen.AddPCharLenAtom(k2_tiText, aValue.AsWStr);
    finally
     aGen.Finish;
    end;//StartChild(ee_idTextPara);
   end;//lpAddParagraph

  var
   lPos   : Integer;
   l_Temp : Il3CString;
   lStr   : Il3CString;
   l_TerminateInc: Integer;
  begin//lpOutString
   if l3ISNil(aValue)  then
    lpAddParagraph(nil)
   else
   begin
    l_Temp := aValue;
    while not l3IsNil(l_Temp) do
    begin
     lPos := l3Pos(l_Temp, cc_EOLStr);
     if (lPos > 0) then
      l_TerminateInc := 2
     else
     begin
      l_TerminateInc := 1;
      lPos := l3Pos(l_Temp, cc_HardEnterNativeStr);
      if (lPos = 0) then
       lPos := l3Pos(l_Temp, cc_SoftEnterNativeStr);
     end;//lPos > 0
     if (lPos > 0) then
      lStr := l3Copy(l_Temp, 0, lPos)
     else
      lStr := l_Temp;
     lpAddParagraph(lStr);
     if (lPos > 0) then
     begin
      Inc(lPos, l_TerminateInc);
      l_Temp := l3Copy(l_Temp, lPos + l_TerminateInc - 1, l3Len(l_Temp));
     end//lPos > 0
     else
      l_Temp := nil;
    end;//while not l3IsNil(l_Temp)
   end;//l3ISNil(aValue)
  end;//lpOutString

  procedure lpOutCRInfo(const aHas        : Boolean;
                        //const aCRTemplate : TvcmStringID;
                        const aCRType     : Il3CString);
(*  var
   l_Str: Tl3WString;*)
  begin//lpOutCRInfo
   if not aHas then
    lpOutString(vcmCStr(str_CommonCRNotFound))
   else
   begin
(*    l_Str := dsDocumentList.CRMissingBlocks;
    if not l3IsNil(l_Str) then
    begin
     lpOutString(vcmFmt(aCRTemplate, [aCRType]));
     lpOutString(nil);
     lpOutString(nsCStr(l_Str));
    end//not l3IsNil(l_Str)
    else*)
     lpOutString(vcmCStr(str_CommonCRNotFound));
   end;//not aHas
  end;//lpOutCRInfo

  procedure lp_AddLink(aStrId: TvcmStringId; aLinkId: Integer);
  var
   l_Text  : IvcmCString;
  begin//lp_AddLink
   lpOutString(nil);
   aGen.StartChild(k2_idTextPara);
   try
    l_Text := vcmCStr(aStrId);
    bsAddLink(aGen, aLinkId, 1, l_Text.AsWStr.SLen);
    aGen.AddPCharLenAtom(k2_tiText, l_Text.AsWStr);
   finally
    aGen.Finish;
   end;//StartChild(ee_idTextPara);
  end;//lp_AddLink

  procedure lp_AllDocumentFiltered;
  var
   l_Index : Integer;
   l_Filter: IFilterFromQuery;
  begin
   lpOutString(vcmCStr(str_AllDocumentFiltered));
   lpOutString(nil);
   with dsList do
    for l_Index := 0 to Pred(ActiveFilters.Count) do
    begin
     ActiveFilters.pm_GetItem(l_Index, l_Filter);
     lpOutString(l3Cat(' - ', nsGetFilterCaption(l_Filter)));
    end;//for l_Index
   lp_AddLink(str_ClearFilters, c_nsClearFiltersLink);
  end;//lp_AllDocumentFiltered

  procedure lp_AllDocumentDeleted;
  begin//lp_AllDocumentDeleted
   lpOutString(vcmCStr(str_AllDocumentsInListDeleted));
   lpOutString(nil);
   lp_AddLink(str_ReferenceLinkList, c_nsOpenReferenceLink);
  end;//lp_AllDocumentDeleted

//#UC END# *4F82B4C6025F_4C46AA3401DB_var*
begin
//#UC START# *4F82B4C6025F_4C46AA3401DB_impl*
 with aGen do
 begin
  Start;
  try
   StartChild(k2_idDocument);
   try
    if dsList.AllDocumentFiltered then
     lp_AllDocumentFiltered
    else
    if (dsList.IsChanged) and (dsList.IsListEmpty) then
     lp_AllDocumentDeleted
    else
     case UserType of
      lftRespondent:
       lpOutString(vcmCStr(str_UsualRespondentsNotFound));
      lftCorrespondent:
        lpOutString(vcmCStr(str_UsualCorrespondentsFound));
      lftSynchroView, lftUserCR1, lftUserCR2:
       with dsDocumentList do
        case DocumentListType of
         crtRespondents:
          lpOutCRInfo(HasRespondents, {str_RespondetnsInOtherBlock, }CRTypeName);
         crtCorrespondents:
          lpOutCRInfo(HasCorrespondents, {str_CorrespondetnsInOtherBlock, }CRTypeName);
        end;//case DocumentListType of
      else
       lpOutString(vcmCStr(str_CommonCRNotFound));
     end;//case UserType of
   finally
    Finish;
   end;//StartChild(ee_idDocument);
  finally
   Finish;
  end;//Start;
 end;//with aGen do
//#UC END# *4F82B4C6025F_4C46AA3401DB_impl*
end;//TPrimListOptionsForm.GenerateText

procedure TPrimListOptionsForm.ChangeControlsVisible(aShowList: Boolean);
//#UC START# *4F82B4EE0330_4C46AA3401DB_var*

 procedure lp_Show(const aControl: TWinControl);
   {* - ���������� ����� ������ ����� ��������� ������, ��� �� ������� �
        �������� CQ: OIT500021506 �� ��������. }
 const
  c_Show: array [Boolean] of UINT = (SWP_HIDEWINDOW, SWP_SHOWWINDOW);
 begin//lp_Show
  SetWindowPos(aControl.Handle, 0, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE or
   SWP_NOZORDER or c_Show[aControl.Visible]);
  // ������� ������ ��������� (<K>: 105578851):
  // ����� ��� ���������, ��� ������� �������, ����� ����� ��������� ����������:
  // http://mdp.garant.ru/pages/viewpage.action?pageId=469809301
  if aControl.Visible and (IsMainObjectForm or IsActiveInParent) then
  begin
   SetFocusedControl(aControl);
   Dispatcher.UpdateStatus;
  end;//aControl.Visible
 end;//lp_Show

//#UC END# *4F82B4EE0330_4C46AA3401DB_var*
begin
//#UC START# *4F82B4EE0330_4C46AA3401DB_impl*
 tvList.Visible := aShowList;
 lp_Show(tvList);
 f_EmptyListEditor.Visible := not aShowList;
 lp_Show(f_EmptyListEditor);
 BringRemindersToFront; // ������� � 348685171
//#UC END# *4F82B4EE0330_4C46AA3401DB_impl*
end;//TPrimListOptionsForm.ChangeControlsVisible

function TPrimListOptionsForm.EditorJumpTo(Sender: TObject;
  anEffects: TafwJumpToEffects;
  const aMoniker: IevMoniker): Boolean;
//#UC START# *4F82B51B0333_4C46AA3401DB_var*
var
 l_HL   : IevHyperlink;
 l_Form : IvcmEntityForm;
//#UC END# *4F82B51B0333_4C46AA3401DB_var*
begin
//#UC START# *4F82B51B0333_4C46AA3401DB_impl*
 Result := False;
 if Supports(aMoniker, IevHyperlink, l_HL) then
 begin
  case l_HL.ID of
   c_nsClearFiltersLink:
   begin
    ClearFilters;
    Result := True;
   end;//c_nsClearFiltersLink
   c_nsOpenReferenceLink:
   begin
    if NativeMainForm.HasForm(fm_efListInfo.rFormID, vcm_ztChild, True, @l_Form) then
     l_Form.SetActiveInParent;
    Result := True;
   end;//c_nsOpenReferenceLink
  end;//case l_HL.ID of
 end;//if Supports(aMoniker, IevHyperlink, l_HL) then
//#UC END# *4F82B51B0333_4C46AA3401DB_impl*
end;//TPrimListOptionsForm.EditorJumpTo

function TPrimListOptionsForm.CurrentImageIndex: Integer;
//#UC START# *4F82B02C00CC_4C46AA3401DB_var*
//#UC END# *4F82B02C00CC_4C46AA3401DB_var*
begin
//#UC START# *4F82B02C00CC_4C46AA3401DB_impl*
 Result := UserTypes[UserType].ImageIndex;
 if (UserType in [lftSynchroView,
                  lftRCToPart,
                  lftUserCR1,
                  lftUserCR2]) then
 begin
  if (Container <> nil) and Assigned(dsDocumentList) then
   case dsDocumentList.DocumentListType of
    crtRespondents:
     Result := UserTypes[Integer(lftRespondent)].ImageIndex;
    crtCorrespondents:
     Result := UserTypes[Integer(lftCorrespondent)].ImageIndex;
   end;//case dsDocumentList.DocumentListType of
 end;//if (UserType in [lftSynchroView,
//#UC END# *4F82B02C00CC_4C46AA3401DB_impl*
end;//TPrimListOptionsForm.CurrentImageIndex

procedure TPrimListOptionsForm.DefineCaption;
//#UC START# *4F82BF6E011A_4C46AA3401DB_var*

  function lp_DefineByListName(const aListName: Il3CString): Il3CString;
  begin
   if l3IsNil(aListName) and (CurUserTypeDef <> nil) then
    Result := CurUserTypeDef.Caption
   else
    Result := aListName;
  end;//lp_DefineByListName

  function lp_UseListNameForUserTypes: Boolean;
  begin
   Result := UserType in [lftSynchroView,
                                     lftSimilarDocumentsSynchroView,
                                     lftProducedDrugsSynchroForm,
                                     lftDrugInternationalNameSynonymsSynchroForm];
  end;//lp_UserListNameForUserTypes

  function lp_UseListNameForDocumentList: Boolean;
  begin
   Result := (dsDocumentList <> nil) and (dsDocumentList.
    OpenFrom in [lofRubricator, lofMultilink, lofFullScreenCR]) and
     not dsDocumentList.IsSaved;
  end;//lp_UseListNameForDocumentList

//#UC END# *4F82BF6E011A_4C46AA3401DB_var*
begin
//#UC START# *4F82BF6E011A_4C46AA3401DB_impl*
 CCaption := nil;
 if Assigned(dsList) then
 begin
  if lp_UseListNameForUserTypes or lp_UseListNameForDocumentList then
   CCaption := lp_DefineByListName(dsList.ListName)
  else
   case UserType of
    lftNone,
    lftDrugList:
     if dsList.IsSaved then
      CCaption := l3Cat([vcmCStr(str_lcSavedList), dsList.ListName])
     else
      CCaption := l3Cat([vcmCStr(str_lcUsualList), dsList.ListName]);
    lftRespondent:
     CCaption := vcmCStr(str_lcRespondents);
    lftCorrespondent:
     CCaption := vcmCStr(str_lcCorrespondents);
    lftRCToPart:
    begin
     Assert(dsDocumentList <> nil);
     case dsDocumentList.DocumentListType of
      crtRespondents:
       CCaption := vcmCStr(str_lcFragmentRespondents);
      crtCorrespondents:
       CCaption := vcmCStr(str_lcFragmentCorrespondents);
     end;//case f_ListType of
    end;
    lftUserCR1, lftUserCR2:
    begin
     Assert(dsDocumentList <> nil);
     CCaption := dsDocumentList.CRTypeName;
    end;
    lftConsultation:
     CCaption := vcmCStr(str_lcConsultation);
    lftSimilarDocuments:
     CCaption := vcmCStr(str_lcSimilarDocuments);
    lftProducedDrugs:
     CCaption := vcmCStr(str_lcProducedDrugs);
    lftDrugInternationalNameSynonyms:
     CCaption := vcmCStr(str_lcDrugInternationalName);
    else
     CCaption := l3Cat([vcmCStr(str_lcUsualList), dsList.ListName]);
   end;//case (UserType of
 end;//if Assigned(dsList) then
//#UC END# *4F82BF6E011A_4C46AA3401DB_impl*
end;//TPrimListOptionsForm.DefineCaption

procedure TPrimListOptionsForm.Edit_Delete_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *494F89C30197_4C46AA3401DBtest_var*
//#UC END# *494F89C30197_4C46AA3401DBtest_var*
begin
//#UC START# *494F89C30197_4C46AA3401DBtest_impl*
 SelectionOpsTest(aParams);
//#UC END# *494F89C30197_4C46AA3401DBtest_impl*
end;//TPrimListOptionsForm.Edit_Delete_Test

procedure TPrimListOptionsForm.Edit_Delete_GetState(var State: TvcmOperationStateIndex);
//#UC START# *494F89C30197_4C46AA3401DBgetstate_var*
//#UC END# *494F89C30197_4C46AA3401DBgetstate_var*
begin
//#UC START# *494F89C30197_4C46AA3401DBgetstate_impl*
 // - ������ �� ������
//#UC END# *494F89C30197_4C46AA3401DBgetstate_impl*
end;//TPrimListOptionsForm.Edit_Delete_GetState

procedure TPrimListOptionsForm.Edit_Delete_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *494F89C30197_4C46AA3401DBexec_var*
//#UC END# *494F89C30197_4C46AA3401DBexec_var*
begin
//#UC START# *494F89C30197_4C46AA3401DBexec_impl*
 if aParams.Control = tvList then
  DeleteSelectionFromList
 else
  aParams.CallControl;
//#UC END# *494F89C30197_4C46AA3401DBexec_impl*
end;//TPrimListOptionsForm.Edit_Delete_Execute

procedure TPrimListOptionsForm.File_Print_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *49521D8E0295_4C46AA3401DBtest_var*
//#UC END# *49521D8E0295_4C46AA3401DBtest_var*
begin
//#UC START# *49521D8E0295_4C46AA3401DBtest_impl*
 ListOpsWithTrialModeTest(aParams);
//#UC END# *49521D8E0295_4C46AA3401DBtest_impl*
end;//TPrimListOptionsForm.File_Print_Test

procedure TPrimListOptionsForm.File_Print_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *49521D8E0295_4C46AA3401DBexec_var*
var
 l_Preview : IafwComplexDocumentPreview;
//#UC END# *49521D8E0295_4C46AA3401DBexec_var*
begin
//#UC START# *49521D8E0295_4C46AA3401DBexec_impl*
 l_Preview := MakePreview(False);
 if (l_Preview <> nil) then
 begin
  l_Preview.Print;
 end;//if (l_Preview <> nil) then
//#UC END# *49521D8E0295_4C46AA3401DBexec_impl*
end;//TPrimListOptionsForm.File_Print_Execute

procedure TPrimListOptionsForm.File_PrintDialog_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *495220DE0298_4C46AA3401DBtest_var*
//#UC END# *495220DE0298_4C46AA3401DBtest_var*
begin
//#UC START# *495220DE0298_4C46AA3401DBtest_impl*
 ListOpsWithTrialModeTest(aParams);
//#UC END# *495220DE0298_4C46AA3401DBtest_impl*
end;//TPrimListOptionsForm.File_PrintDialog_Test

procedure TPrimListOptionsForm.File_PrintDialog_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *495220DE0298_4C46AA3401DBexec_var*
var
 l_Preview : IafwComplexDocumentPreview;
//#UC END# *495220DE0298_4C46AA3401DBexec_var*
begin
//#UC START# *495220DE0298_4C46AA3401DBexec_impl*
 if (afw.Application <> nil) AND (afw.Application.PrintManager <> nil) then
 begin
  l_Preview := MakePreview(True);
  with l_Preview do
  begin
   if (ContentKind = afw_pckSelection) then
    case MessageDlg(str_ListPrintSelectedConfirmation) of
     -1:
      ;
     -2:
      ContentKind := afw_pckDocument;
     mrCancel:
      Exit;
    end;//MessageDlg(str_DocumentPrintSelectedConfirmation)
  end;//with l_Preview
  afw.Application.PrintManager.PrintDialog(l_Preview);
  // ������������ ������� ������, ��� ��������, ��� ������ ������������� ����
  // ���������. �.�. ������������ � ������� ��� ������ ������ ������:
 end;//if (afw.Application <> nil)...
//#UC END# *495220DE0298_4C46AA3401DBexec_impl*
end;//TPrimListOptionsForm.File_PrintDialog_Execute

procedure TPrimListOptionsForm.File_PrintPreview_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *495220F2033A_4C46AA3401DBtest_var*
//#UC END# *495220F2033A_4C46AA3401DBtest_var*
begin
//#UC START# *495220F2033A_4C46AA3401DBtest_impl*
 ListopPrintTest(aParams);
//#UC END# *495220F2033A_4C46AA3401DBtest_impl*
end;//TPrimListOptionsForm.File_PrintPreview_Test

procedure TPrimListOptionsForm.File_PrintPreview_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *495220F2033A_4C46AA3401DBexec_var*
var
 l_Preview: IafwComplexDocumentPreview;
//#UC END# *495220F2033A_4C46AA3401DBexec_var*
begin
//#UC START# *495220F2033A_4C46AA3401DBexec_impl*
 l_Preview := MakePreview(False);
 if dsList <> nil then
  TnsListPrintPreviewEvent.Log(dsList.List, ApproxExportCount(l_Preview.ContentKind =  afw_pckSelection), l_Preview.ContentKind =  afw_pckSelection);
 TdmStdRes.MakePreview(l_Preview);
//#UC END# *495220F2033A_4C46AA3401DBexec_impl*
end;//TPrimListOptionsForm.File_PrintPreview_Execute

procedure TPrimListOptionsForm.File_Save_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *495235F401C0_4C46AA3401DBtest_var*
//#UC END# *495235F401C0_4C46AA3401DBtest_var*
begin
//#UC START# *495235F401C0_4C46AA3401DBtest_impl*
 ListOpsWithTrialModeTest(aParams);
//#UC END# *495235F401C0_4C46AA3401DBtest_impl*
end;//TPrimListOptionsForm.File_Save_Test

procedure TPrimListOptionsForm.File_Save_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *495235F401C0_4C46AA3401DBexec_var*
//#UC END# *495235F401C0_4C46AA3401DBexec_var*
begin
//#UC START# *495235F401C0_4C46AA3401DBexec_impl*
 SaveList(True);
//#UC END# *495235F401C0_4C46AA3401DBexec_impl*
end;//TPrimListOptionsForm.File_Save_Execute

procedure TPrimListOptionsForm.File_ToMSWord_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *495238EB0160_4C46AA3401DBtest_var*
//#UC END# *495238EB0160_4C46AA3401DBtest_var*
begin
//#UC START# *495238EB0160_4C46AA3401DBtest_impl*
 ListOpsWithTrialModeTest(aParams);
 TnsToMSWordOp.Test(aParams);
//#UC END# *495238EB0160_4C46AA3401DBtest_impl*
end;//TPrimListOptionsForm.File_ToMSWord_Test

procedure TPrimListOptionsForm.File_ToMSWord_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *495238EB0160_4C46AA3401DBexec_var*
var
 //l_PathName   : Il3CString;
 l_Output: TnsGetGenOutputStruct;
 l_Stream     : IStream;
 l_Visualizer : IafwLongProcessVisualizer;
 l_ExportSelection : Boolean;
//#UC END# *495238EB0160_4C46AA3401DBexec_var*
begin
//#UC START# *495238EB0160_4C46AA3401DBexec_impl*
 if Assigned(dsList) then
 try
  l_ExportSelection := tvList.TreeView.Tree.SelectedCount > 1;
  if (l_ExportSelection) then
   case MessageDlg(str_ListExportSelectionToWord) of
     -1:
      ;
     -2:
      l_ExportSelection := False;
     mrCancel:
      Exit;
   end;//case MessageDlg(str_ListExportSelectionToWord)

  if (ApproxExportCount(l_ExportSelection) > c_MaxTotalDocumentInListLimit) then
   if not afw.Application.IsInternal or
      not afw.Settings.LoadBoolean(pi_List_ExportWORestrictions,
                                   dv_List_ExportWORestrictions) then
   begin
    Say(war_TryToExportTooManyTotalDocs, [c_MaxTotalDocumentInListLimit]);
    Exit;
   end;//not afw.Application.IsInternal

   // �������������� � Word
//  l_PathName := nsMakeTemporaryFileName(nsPrepareFileName(CreateListName(l_ExportSelection)),
//   nsGetFileFormatExt(ns_ffRTF), False);
  l_Output := TnsGetGenOutputStruct_Create(
    nsMakeTemporaryFileName(nsPrepareFileName(CreateListName(l_ExportSelection)),
    nsGetFileFormatExt(ns_ffRTF), False)
     );
  l_Visualizer := bsMakeExportVisualizer(vcmCStr(str_ExportListVisualizer));
  try
   l_Stream := dsList.ListAsText(CalcSaveListKind, l_ExportSelection);
   try
    nsEvdStreamSaveAs(l_Stream, l_Output, ns_ffRTF, False);
    TnsListExportToWordEvent.Log(dsList.List, ApproxExportCount(l_ExportSelection), l_ExportSelection);
   finally
    l_Stream := nil;
   end;//try..finally
  finally
   l_Visualizer := nil;
  end;//try..finally
  if not TnsToMSWordOp.Execute(l_Output.rName, aParams) then
   Say(err_CannotOpen, [dsList.ListName]);
 except
  on E: Exception do
   l3System.Exception2Log(E);
 end;//if Assigned(dsDocumentList) then
//#UC END# *495238EB0160_4C46AA3401DBexec_impl*
end;//TPrimListOptionsForm.File_ToMSWord_Execute

procedure TPrimListOptionsForm.File_SendMailAsAttachment_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *495253870002_4C46AA3401DBtest_var*
//#UC END# *495253870002_4C46AA3401DBtest_var*
begin
//#UC START# *495253870002_4C46AA3401DBtest_impl*
 ListOpsWithTrialModeTest(aParams);
//#UC END# *495253870002_4C46AA3401DBtest_impl*
end;//TPrimListOptionsForm.File_SendMailAsAttachment_Test

procedure TPrimListOptionsForm.File_SendMailAsAttachment_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *495253870002_4C46AA3401DBexec_var*
var
 //l_PathName   : Il3CString;
 l_Output: TnsGetGenOutputStruct;
 l_Stream     : IStream;
 l_Visualizer : IafwLongProcessVisualizer;
 l_ExportSelection : Boolean;
//#UC END# *495253870002_4C46AA3401DBexec_var*
begin
//#UC START# *495253870002_4C46AA3401DBexec_impl*
 if Assigned(dsList) then
 try
  l_ExportSelection := tvList.TreeView.Tree.SelectedCount > 1;
  if (l_ExportSelection) then
   case MessageDlg(str_ListEMailSelection) of
     -1:
      ;
     -2:
      l_ExportSelection := False;
     mrCancel:
      Exit;
   end;//case MessageDlg(str_ListEMailSelection)
   // �������������� � Word
//  l_PathName := nsMakeTemporaryFileName(nsPrepareFileName(CreateListName(l_ExportSelection)),
//   nsGetFileFormatExt(ns_ffRTF), False);
  l_Output := TnsGetGenOutputStruct_Create(
   nsMakeTemporaryFileName(nsPrepareFileName(CreateListName(l_ExportSelection)),
   nsGetFileFormatExt(ns_ffRTF), False)
  );
  l_Visualizer := bsMakeEMailVisualizer;
  try
   l_Stream := dsList.ListAsText(CalcSaveListKind, l_ExportSelection);
   try
    nsEvdStreamSaveAs(l_Stream, l_Output, ns_ffRTF, False);
   finally
    l_Stream := nil;
   end;//try..finally
  finally
   l_Visualizer := nil;
  end;//try..finally
  try
   nsSendAttachedFile(l_Output.rName);
   TnsSendListByEmailEvent.Log(dsList.List, ApproxExportCount(l_ExportSelection),
    l_ExportSelection);
  except
   on EDefaultMailCLientAbsent do
    Say(err_DefaultMailCLientAbsent);
  end;//try..except
 except
  on E: Exception do
   l3System.Exception2Log(E);
 end;//if Assigned(dsDocumentList) then
//#UC END# *495253870002_4C46AA3401DBexec_impl*
end;//TPrimListOptionsForm.File_SendMailAsAttachment_Execute

procedure TPrimListOptionsForm.Document_AddBookmark_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4989D06D014E_4C46AA3401DBtest_var*
//#UC END# *4989D06D014E_4C46AA3401DBtest_var*
begin
//#UC START# *4989D06D014E_4C46AA3401DBtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := NoMoreThanOneSelected and IsHasCurrent;
//#UC END# *4989D06D014E_4C46AA3401DBtest_impl*
end;//TPrimListOptionsForm.Document_AddBookmark_Test

procedure TPrimListOptionsForm.Document_AddBookmark_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4989D06D014E_4C46AA3401DBexec_var*

  function lp_FolderElementType: TFoldersElementType;
  begin//lp_FolderElementType
   case dsList.ListType of
    bs_ltDocument:
     Result := fetBookmark;
    bs_ltDrug:
     Result := fetDrugBookmark;
    else
    begin
     Assert(False);
     Result := Low(TFoldersElementType);
    end;//else
   end;//case dsList.ListType
  end;//lp_FolderElementType
  
var
 l_Bookmark: IBookmark;
//#UC END# *4989D06D014E_4C46AA3401DBexec_var*
begin
//#UC START# *4989D06D014E_4C46AA3401DBexec_impl*
 if (dsList <> nil) then
 begin
  l_Bookmark := dsList.CreateBookmark;
  if (l_Bookmark <> nil) then
   TdmStdRes.SaveOpen(Self.As_IvcmEntityForm,
                      MakeFilterInfo(ffBookmark),
                      lp_FolderElementType,
                      l_Bookmark,
                      false);
 end;//dsList <> nil
//#UC END# *4989D06D014E_4C46AA3401DBexec_impl*
end;//TPrimListOptionsForm.Document_AddBookmark_Execute

function TPrimListOptionsForm.Get_SearchList: IDynList;
//#UC START# *49916C1E001D_4C46AA3401DBget_var*
//#UC END# *49916C1E001D_4C46AA3401DBget_var*
begin
//#UC START# *49916C1E001D_4C46AA3401DBget_impl*
 if (f_SearchArea in [ns_saText, ns_saTitlesOnly]) and (dsList <> nil) then
  Result := dsList.List
 else
  Result := nil;
//#UC END# *49916C1E001D_4C46AA3401DBget_impl*
end;//TPrimListOptionsForm.Get_SearchList

procedure TPrimListOptionsForm.Edit_SelectAll_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *49EE01AA02BE_4C46AA3401DBtest_var*
//#UC END# *49EE01AA02BE_4C46AA3401DBtest_var*
begin
//#UC START# *49EE01AA02BE_4C46AA3401DBtest_impl*
 aParams.CallControl;
//#UC END# *49EE01AA02BE_4C46AA3401DBtest_impl*
end;//TPrimListOptionsForm.Edit_SelectAll_Test

procedure TPrimListOptionsForm.Edit_SelectAll_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *49EE01AA02BE_4C46AA3401DBexec_var*
//#UC END# *49EE01AA02BE_4C46AA3401DBexec_var*
begin
//#UC START# *49EE01AA02BE_4C46AA3401DBexec_impl*
 aParams.CallControl;
//#UC END# *49EE01AA02BE_4C46AA3401DBexec_impl*
end;//TPrimListOptionsForm.Edit_SelectAll_Execute

procedure TPrimListOptionsForm.ShowEditorOrList(const aTree: Il3SimpleTree);
//#UC START# *4AEAD69A0151_4C46AA3401DB_var*
//#UC END# *4AEAD69A0151_4C46AA3401DB_var*
begin
//#UC START# *4AEAD69A0151_4C46AA3401DB_impl*
 if dsList <> nil then
 begin
  if IsListEmpty then
  begin
   //CreateEditor
   GenerateText(EmptyListEditor.TextSource.GetGenerator(EmptyListEditor.View, nil));
   ChangeControlsVisible(False);
  end else
  if Assigned(aTree) then
  begin
   ChangeControlsVisible(True);
   if not Dispatcher.History.InBF then
    dsList.CurrentChanged(tvList.GetCurrentNode);
  end;//if Assigned(aTree) then
 end;//if dsList <> nil then
//#UC END# *4AEAD69A0151_4C46AA3401DB_impl*
end;//TPrimListOptionsForm.ShowEditorOrList

function TPrimListOptionsForm.ApplyFilter(const aFilter: IFilterFromQuery;
  aAdd: Boolean = False): Boolean;
//#UC START# *4AEF0A9403DD_4C46AA3401DB_var*

 procedure lp_ResetTree;
 begin//lp_ResetTree
  cfList.BeginAssignState;
  try
   tvList.TreeStruct := nil;
   tvList.TreeStruct;
  finally
   cfList.EndAssignState;
  end;//try..finally
 end;//lp_ResetTree

var
 l_Applied: Boolean;
 l_NeedResetTree: Boolean;
//#UC END# *4AEF0A9403DD_4C46AA3401DB_var*
begin
//#UC START# *4AEF0A9403DD_4C46AA3401DB_impl*
 Result := True;
 // ��������� ������ ������ � ��������� ������, ����� � ����� � �������� ��
 // ������������ ������ ��� � ������� ����������� ��������� (cq: 00018368);
 if Assigned(dsList) and dsList.IsMain then
 begin
  l_NeedResetTree := false;
  try
   l_NeedResetTree := Assigned(dsDocumentList) and dsDocumentList.IsSnippet;
   l_Applied := dsList.ApplyFilter(aFilter, aAdd);
  except
   on ENotAllAttributesRestored do
   begin
    l_Applied := False;
    if aAdd then
    begin
     Say(war_NotAllAttributesRestored);
     Result := False;
     Exit;
    end;//if aAdd then
   end;//on ENotAllAttributesRestored do
  end;//try..except
  // ������� ���������� � ����������� ��������:
  if l_Applied then
  begin
   if dsList.AllDocumentFiltered then
   begin
    //if l_NeedResetTree then
     lp_ResetTree;
    ShowEditorOrList(nil);
   end//dsList.AllDocumentFiltered
   // ������� ������:
   else
    lp_ResetTree;
  end;//if l_Applied then
 end;//if Assigned(dsDocumentList) then
//#UC END# *4AEF0A9403DD_4C46AA3401DB_impl*
end;//TPrimListOptionsForm.ApplyFilter

function TPrimListOptionsForm.IsListEmpty: Boolean;
//#UC START# *4AEF2BEB032D_4C46AA3401DB_var*
//#UC END# *4AEF2BEB032D_4C46AA3401DB_var*
begin
//#UC START# *4AEF2BEB032D_4C46AA3401DB_impl*
 Result := (dsList <> nil) and dsList.IsListEmpty;
//#UC END# *4AEF2BEB032D_4C46AA3401DB_impl*
end;//TPrimListOptionsForm.IsListEmpty

procedure TPrimListOptionsForm.QueryMaximized;
//#UC START# *4BD5912900BD_4C46AA3401DB_var*
//#UC END# *4BD5912900BD_4C46AA3401DB_var*
begin
//#UC START# *4BD5912900BD_4C46AA3401DB_impl*
 if not IsListEmpty then
  OpenInNewWindow;
//#UC END# *4BD5912900BD_4C46AA3401DB_impl*
end;//TPrimListOptionsForm.QueryMaximized

procedure TPrimListOptionsForm.QueryOpen;
//#UC START# *4BD5913B0204_4C46AA3401DB_var*
//#UC END# *4BD5913B0204_4C46AA3401DB_var*
begin
//#UC START# *4BD5913B0204_4C46AA3401DB_impl*
 if not IsListEmpty then
  OpenCurrentList(NativeMainForm);
//#UC END# *4BD5913B0204_4C46AA3401DB_impl*
end;//TPrimListOptionsForm.QueryOpen

procedure TPrimListOptionsForm.Tree_ExpandAll_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4BDAF7880236_4C46AA3401DBexec_var*
//#UC END# *4BDAF7880236_4C46AA3401DBexec_var*
begin
//#UC START# *4BDAF7880236_4C46AA3401DBexec_impl*
 tvList.LockChangeSelected;
 try
  aParams.CallControl;
 finally
  tvList.UnLockChangeSelected;
 end;//try..finally
//#UC END# *4BDAF7880236_4C46AA3401DBexec_impl*
end;//TPrimListOptionsForm.Tree_ExpandAll_Execute

procedure TPrimListOptionsForm.Tree_CollapseAll_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4BDAF7A2005C_4C46AA3401DBexec_var*
//#UC END# *4BDAF7A2005C_4C46AA3401DBexec_var*
begin
//#UC START# *4BDAF7A2005C_4C46AA3401DBexec_impl*
 tvList.LockChangeSelected;
 try
  aParams.CallControl;
 finally
  tvList.UnLockChangeSelected;
 end;//try..finally
//#UC END# *4BDAF7A2005C_4C46AA3401DBexec_impl*
end;//TPrimListOptionsForm.Tree_CollapseAll_Execute

procedure TPrimListOptionsForm.Tree_Wrap_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4BDAF7B803CF_4C46AA3401DBtest_var*
//#UC END# *4BDAF7B803CF_4C46AA3401DBtest_var*
begin
//#UC START# *4BDAF7B803CF_4C46AA3401DBtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := False;
 aParams.Op.Flag[vcm_ofVisible] := False;
//#UC END# *4BDAF7B803CF_4C46AA3401DBtest_impl*
end;//TPrimListOptionsForm.Tree_Wrap_Test

procedure TPrimListOptionsForm.SaveToFolders(aOperation: Integer = 0);
//#UC START# *4C3418190372_4C46AA3401DB_var*
var
 l_CurEntity: IEntityBase;

 procedure lpOverrideList;
 var
  l_Storage: IEntityStorage;
 begin
  if l_CurEntity.GetIsSaved and Ask(qr_ListOverride) then
  try
   l_CurEntity.SaveTo(nil, l_Storage);
  except
   on EAccessDenied do
    Say(err_SaveReadOnlyList);
   on ECanNotSave do
    Say(err_CannotSaveSomething);
   on ENotSaved do
    Say(err_NotSaved);
  end;{try..except}
 end;//lpOverrideList

 procedure lpSaveToFolders;

  function lp_FolderElementType: TFoldersElementType;
  begin
   case dsList.ListType of
    bs_ltDocument:
     Result := fetList;
    bs_ltDrug:
     Result := fetDrugList;
    else
    begin
     Result := Low(TFoldersElementType);
     Assert(False);
    end;
   end;
  end;

 begin
  TdmStdRes.SaveOpen(Self.As_IvcmEntityForm,
                     MakeFilterInfo(ffListAndBookMarks),
                     lp_FolderElementType,
                     l_CurEntity,
                     True);
  DefineCaption;
 end;//lpSaveToFolders

//#UC END# *4C3418190372_4C46AA3401DB_var*
begin
//#UC START# *4C3418190372_4C46AA3401DB_impl*
 l_CurEntity := nil;
 // ��� ���������� � ���������� ������ � �����
 if aOperation <> g_SaveToFoldersSelected then
  Supports(dsList.List, IEntityBase, l_CurEntity)
 else
  // ���������� ���������� � �����:
  Supports(dsList.NewListFromSelected, IEntityBase, l_CurEntity);
 if Assigned(l_CurEntity) then
 try
  // ��������� ������ � ��� ��������� ������� ��� ������ ����������
  if (aOperation = g_SaveToFolders) or
   (aOperation = g_SaveToFoldersSelected) then
   lpSaveToFolders
  else
   // ������������ ������
   if aOperation = g_OverrideList then
    lpOverrideList;
 finally
  l_CurEntity := nil;
 end;//try..finally
//#UC END# *4C3418190372_4C46AA3401DB_impl*
end;//TPrimListOptionsForm.SaveToFolders

function TPrimListOptionsForm.MakeFilterInfo(aType: TnsFolderFilter): InsFolderFilterInfo;
//#UC START# *4C34188000A6_4C46AA3401DB_var*
//#UC END# *4C34188000A6_4C46AA3401DB_var*
begin
//#UC START# *4C34188000A6_4C46AA3401DB_impl*
 Result := TnsFolderFilterInfo.Make(aType,
  nsListTypeToFilterFor(dsList.ListType));
//#UC END# *4C34188000A6_4C46AA3401DB_impl*
end;//TPrimListOptionsForm.MakeFilterInfo

procedure TPrimListOptionsForm.ResetSaveToFolderOperations;
//#UC START# *4C341C77005C_4C46AA3401DB_var*
//#UC END# *4C341C77005C_4C46AA3401DB_var*
begin
//#UC START# *4C341C77005C_4C46AA3401DB_impl*
 g_SaveToFolders := -1;
 g_SaveToFoldersSelected := -1;
 g_OverrideList := -1;
//#UC END# *4C341C77005C_4C46AA3401DB_impl*
end;//TPrimListOptionsForm.ResetSaveToFolderOperations

function TPrimListOptionsForm.CheckValidSortTypes(aSortType: TbsValidSortTypes): Boolean;
//#UC START# *4C3722EE03A8_4C46AA3401DB_var*
//#UC END# *4C3722EE03A8_4C46AA3401DB_var*
begin
//#UC START# *4C3722EE03A8_4C46AA3401DB_impl*
 Result := (f_ValidSortTypes <> aSortType);
 if Result then
 begin
  f_ValidSortTypes := aSortType;
  if (f_ValidSortTypes = cDefaultListSortTypes) then
   f_SortTypeMap := nsIntegerMapManager.Map[imap_pi_List_SortType]
  else
   f_SortTypeMap := TnsListSortTypeMap.Make(f_ValidSortTypes);
 end;//Result
//#UC END# *4C3722EE03A8_4C46AA3401DB_impl*
end;//TPrimListOptionsForm.CheckValidSortTypes

procedure TPrimListOptionsForm.List_OrAnotherList_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C46E1A20174_4C46AA3401DBtest_var*
//#UC END# *4C46E1A20174_4C46AA3401DBtest_var*
begin
//#UC START# *4C46E1A20174_4C46AA3401DBtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := not IsListEmpty;
//#UC END# *4C46E1A20174_4C46AA3401DBtest_impl*
end;//TPrimListOptionsForm.List_OrAnotherList_Test

procedure TPrimListOptionsForm.List_OrAnotherList_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C46E1A20174_4C46AA3401DBexec_var*
//#UC END# *4C46E1A20174_4C46AA3401DBexec_var*
begin
//#UC START# *4C46E1A20174_4C46AA3401DBexec_impl*
 TdmStdRes.SelectOpenWithOperation(Self.as_IvcmEntityForm,
                                   MakeFilterInfo(ffList),
                                   str_ListAppend,
                                   LLO_OR);
 StatusParamsShow;
//#UC END# *4C46E1A20174_4C46AA3401DBexec_impl*
end;//TPrimListOptionsForm.List_OrAnotherList_Execute

procedure TPrimListOptionsForm.List_AndAnotherList_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C46E1BD0315_4C46AA3401DBtest_var*
//#UC END# *4C46E1BD0315_4C46AA3401DBtest_var*
begin
//#UC START# *4C46E1BD0315_4C46AA3401DBtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := not IsListEmpty;
//#UC END# *4C46E1BD0315_4C46AA3401DBtest_impl*
end;//TPrimListOptionsForm.List_AndAnotherList_Test

procedure TPrimListOptionsForm.List_AndAnotherList_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C46E1BD0315_4C46AA3401DBexec_var*
//#UC END# *4C46E1BD0315_4C46AA3401DBexec_var*
begin
//#UC START# *4C46E1BD0315_4C46AA3401DBexec_impl*
 TdmStdRes.SelectOpenWithOperation(Self.as_IvcmEntityForm,
                                   MakeFilterInfo(ffList),
                                   str_ListIntersect,
                                   LLO_AND);
 StatusParamsShow;
//#UC END# *4C46E1BD0315_4C46AA3401DBexec_impl*
end;//TPrimListOptionsForm.List_AndAnotherList_Execute

procedure TPrimListOptionsForm.List_AndNotAnotherList_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C46E1E302A8_4C46AA3401DBtest_var*
//#UC END# *4C46E1E302A8_4C46AA3401DBtest_var*
begin
//#UC START# *4C46E1E302A8_4C46AA3401DBtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := not IsListEmpty;
//#UC END# *4C46E1E302A8_4C46AA3401DBtest_impl*
end;//TPrimListOptionsForm.List_AndNotAnotherList_Test

procedure TPrimListOptionsForm.List_AndNotAnotherList_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C46E1E302A8_4C46AA3401DBexec_var*
//#UC END# *4C46E1E302A8_4C46AA3401DBexec_var*
begin
//#UC START# *4C46E1E302A8_4C46AA3401DBexec_impl*
 TdmStdRes.SelectOpenWithOperation(Self.as_IvcmEntityForm,
                                   MakeFilterInfo(ffList),
                                   str_ListSubtract,
                                   LLO_AND_NOT);
 StatusParamsShow;
//#UC END# *4C46E1E302A8_4C46AA3401DBexec_impl*
end;//TPrimListOptionsForm.List_AndNotAnotherList_Execute

procedure TPrimListOptionsForm.Document_Open_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C4EAC0701B4_4C46AA3401DBtest_var*
//#UC END# *4C4EAC0701B4_4C46AA3401DBtest_var*
begin
//#UC START# *4C4EAC0701B4_4C46AA3401DBtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := NoMoreThanOneSelected and IsHasCurrent;
//#UC END# *4C4EAC0701B4_4C46AA3401DBtest_impl*
end;//TPrimListOptionsForm.Document_Open_Test

procedure TPrimListOptionsForm.Document_Open_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C4EAC0701B4_4C46AA3401DBexec_var*
var
 l_DataInfo: IdeDocInfo;
//#UC END# *4C4EAC0701B4_4C46AA3401DBexec_var*
begin
//#UC START# *4C4EAC0701B4_4C46AA3401DBexec_impl*
 if Assigned(dsList) and dsList.OpenDocument(l_DataInfo) then
 try
  OpenDocument(l_DataInfo, nil);
 finally
  l_DataInfo := nil;
 end;//try..finally
//#UC END# *4C4EAC0701B4_4C46AA3401DBexec_impl*
end;//TPrimListOptionsForm.Document_Open_Execute

procedure TPrimListOptionsForm.Document_OpenNewWindow_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C4EAC20007F_4C46AA3401DBtest_var*
//#UC END# *4C4EAC20007F_4C46AA3401DBtest_var*
begin
//#UC START# *4C4EAC20007F_4C46AA3401DBtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := NoMoreThanOneSelected and IsHasCurrent;
//#UC END# *4C4EAC20007F_4C46AA3401DBtest_impl*
end;//TPrimListOptionsForm.Document_OpenNewWindow_Test

procedure TPrimListOptionsForm.Document_OpenNewWindow_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C4EAC20007F_4C46AA3401DBexec_var*
var
 l_DataInfo: IdeDocInfo;
 l_Container: IvcmContainer;
//#UC END# *4C4EAC20007F_4C46AA3401DBexec_var*
begin
//#UC START# *4C4EAC20007F_4C46AA3401DBexec_impl*
 if Assigned(dsList) and dsList.OpenDocument(l_DataInfo) then
 try
  // http://mdp.garant.ru/pages/viewpage.action?pageId=414849606
  l_Container := nsNewWindow(NativeMainForm);
  if (l_Container <> nil) then
   OpenDocument(l_DataInfo, (*nsNewWindow(NativeMainForm)*) l_Container);
 finally
  l_DataInfo := nil;
 end;{try..finally}
//#UC END# *4C4EAC20007F_4C46AA3401DBexec_impl*
end;//TPrimListOptionsForm.Document_OpenNewWindow_Execute

procedure TPrimListOptionsForm.Openable_OpenInNewWindow_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C4EB6710127_4C46AA3401DBtest_var*
//#UC END# *4C4EB6710127_4C46AA3401DBtest_var*
begin
//#UC START# *4C4EB6710127_4C46AA3401DBtest_impl*
 Document_Open_Test(aParams);
//#UC END# *4C4EB6710127_4C46AA3401DBtest_impl*
end;//TPrimListOptionsForm.Openable_OpenInNewWindow_Test

procedure TPrimListOptionsForm.Openable_OpenInNewWindow_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C4EB6710127_4C46AA3401DBexec_var*
//#UC END# *4C4EB6710127_4C46AA3401DBexec_var*
begin
//#UC START# *4C4EB6710127_4C46AA3401DBexec_impl*
 Document_OpenNewWindow_Execute(aParams);
//#UC END# *4C4EB6710127_4C46AA3401DBexec_impl*
end;//TPrimListOptionsForm.Openable_OpenInNewWindow_Execute

procedure TPrimListOptionsForm.Document_PrintDialog_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C5285F5004B_4C46AA3401DBtest_var*
//#UC END# *4C5285F5004B_4C46AA3401DBtest_var*
begin
//#UC START# *4C5285F5004B_4C46AA3401DBtest_impl*
 if not ForbidOpForDocumentSchema(aParams) then
  DocumentOpsWithTrialModeTest(aParams);
//#UC END# *4C5285F5004B_4C46AA3401DBtest_impl*
end;//TPrimListOptionsForm.Document_PrintDialog_Test

procedure TPrimListOptionsForm.Document_PrintDialog_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C5285F5004B_4C46AA3401DBexec_var*
//#UC END# *4C5285F5004B_4C46AA3401DBexec_var*
begin
//#UC START# *4C5285F5004B_4C46AA3401DBexec_impl*
 if Assigned(dsList) and (afw.Application <> nil) AND
   (afw.Application.PrintManager <> nil) then
  afw.Application.PrintManager.PrintDialog(dsList.MakeDocumentPreview);
//#UC END# *4C5285F5004B_4C46AA3401DBexec_impl*
end;//TPrimListOptionsForm.Document_PrintDialog_Execute

procedure TPrimListOptionsForm.Document_PrintPreview_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C52860A017C_4C46AA3401DBtest_var*
//#UC END# *4C52860A017C_4C46AA3401DBtest_var*
begin
//#UC START# *4C52860A017C_4C46AA3401DBtest_impl*
 if not ForbidOpForDocumentSchema(aParams) then
  DocumentOpsTest(aParams);
//#UC END# *4C52860A017C_4C46AA3401DBtest_impl*
end;//TPrimListOptionsForm.Document_PrintPreview_Test

procedure TPrimListOptionsForm.Document_PrintPreview_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C52860A017C_4C46AA3401DBexec_var*
//#UC END# *4C52860A017C_4C46AA3401DBexec_var*
begin
//#UC START# *4C52860A017C_4C46AA3401DBexec_impl*
 if Assigned(dsList) then
  TdmStdRes.MakePreview(dsList.MakeDocumentPreview);
//#UC END# *4C52860A017C_4C46AA3401DBexec_impl*
end;//TPrimListOptionsForm.Document_PrintPreview_Execute

procedure TPrimListOptionsForm.Document_Save_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C52861800F7_4C46AA3401DBtest_var*
//#UC END# *4C52861800F7_4C46AA3401DBtest_var*
begin
//#UC START# *4C52861800F7_4C46AA3401DBtest_impl*
 if not ForbidOpForDocumentSchema(aParams) then
  DocumentOpsWithTrialModeTest(aParams);
//#UC END# *4C52861800F7_4C46AA3401DBtest_impl*
end;//TPrimListOptionsForm.Document_Save_Test

procedure TPrimListOptionsForm.Document_Save_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C52861800F7_4C46AA3401DBexec_var*
var
 l_Visualizer : IafwLongProcessVisualizer;
 l_Document   : IDocument;
//#UC END# *4C52861800F7_4C46AA3401DBexec_var*
begin
//#UC START# *4C52861800F7_4C46AA3401DBexec_impl*
 if Assigned(dsList) then
 begin
  with dmStdRes do
  begin
   SaveDialog.DialogKind := ns_sdkDocument;
   SaveDialog.SelectedOnlyEnabled := false;
   SaveDialog.SelectedOnlyChecked := false;
   l_Document := bsExtractDocument(tvList.GetCurrentNode);
   if Assigned(l_Document) then
   begin
    SaveDialog.FileName := nsEStr(CreateFileName(l_Document));
    if SaveDialog.Execute then
    begin
     afw.ProcessMessages;
     try
      l_Visualizer := bsMakeSaveVisualizer(vcmCStr(str_SaveDocumentVisualizer));
      try
       dsList.ExportDocument(l_Document, nsCStr(SaveDialog.FileName),
        SaveDialog.SelectedFileFormat);
      finally
       l_Visualizer := nil;
      end//try..finally
     except
      on ECannotSave do
       Say(err_ListSaveToFileError);
     end{try..except}
    end;//if SaveDialog.Execute then
   end;//if Assigned(l_Document) then
  end;//with dmStdRes do
 end;//if Assigned(dsDocumentList) then
//#UC END# *4C52861800F7_4C46AA3401DBexec_impl*
end;//TPrimListOptionsForm.Document_Save_Execute

procedure TPrimListOptionsForm.Document_Print_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C52879C00F4_4C46AA3401DBtest_var*
//#UC END# *4C52879C00F4_4C46AA3401DBtest_var*
begin
//#UC START# *4C52879C00F4_4C46AA3401DBtest_impl*
 if not ForbidOpForDocumentSchema(aParams) then
  DocumentOpsWithTrialModeTest(aParams);
//#UC END# *4C52879C00F4_4C46AA3401DBtest_impl*
end;//TPrimListOptionsForm.Document_Print_Test

procedure TPrimListOptionsForm.Document_Print_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C52879C00F4_4C46AA3401DBexec_var*
var
 l_Preview : IafwComplexDocumentPreview;
//#UC END# *4C52879C00F4_4C46AA3401DBexec_var*
begin
//#UC START# *4C52879C00F4_4C46AA3401DBexec_impl*
 if Assigned(dsList) then
 begin
  l_Preview := dsList.MakeDocumentPreview;
  if (l_Preview <> nil) then
   l_Preview.Print;
 end;//if Assigned(dsDocumentList) then
//#UC END# *4C52879C00F4_4C46AA3401DBexec_impl*
end;//TPrimListOptionsForm.Document_Print_Execute

procedure TPrimListOptionsForm.WarnListFiltered_ClearAll_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C5290E2008C_4C46AA3401DBexec_var*
//#UC END# *4C5290E2008C_4C46AA3401DBexec_var*
begin
//#UC START# *4C5290E2008C_4C46AA3401DBexec_impl*
 ClearFilters;
//#UC END# *4C5290E2008C_4C46AA3401DBexec_impl*
end;//TPrimListOptionsForm.WarnListFiltered_ClearAll_Execute

procedure TPrimListOptionsForm.Reminder_RemListModified_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C52914202E1_4C46AA3401DBtest_var*
//#UC END# *4C52914202E1_4C46AA3401DBtest_var*
begin
//#UC START# *4C52914202E1_4C46AA3401DBtest_impl*
 aParams.Op.Flag[vcm_ofVisible] := Assigned(dsList) and dsList.IsChanged;
//#UC END# *4C52914202E1_4C46AA3401DBtest_impl*
end;//TPrimListOptionsForm.Reminder_RemListModified_Test

procedure TPrimListOptionsForm.Reminder_RemListModified_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C52914202E1_4C46AA3401DBexec_var*
//#UC END# *4C52914202E1_4C46AA3401DBexec_var*
begin
//#UC START# *4C52914202E1_4C46AA3401DBexec_impl*
 Say(inf_ListWasModified);
//#UC END# *4C52914202E1_4C46AA3401DBexec_impl*
end;//TPrimListOptionsForm.Reminder_RemListModified_Execute

procedure TPrimListOptionsForm.Reminder_RemListFiltered_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C52915602E4_4C46AA3401DBtest_var*
//#UC END# *4C52915602E4_4C46AA3401DBtest_var*
begin
//#UC START# *4C52915602E4_4C46AA3401DBtest_impl*
 aParams.Op.Flag[vcm_ofVisible] := Assigned(dsList) and dsList.IsFiltered;
//#UC END# *4C52915602E4_4C46AA3401DBtest_impl*
end;//TPrimListOptionsForm.Reminder_RemListFiltered_Test

procedure TPrimListOptionsForm.Reminder_RemListFiltered_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C52915602E4_4C46AA3401DBexec_var*
//#UC END# *4C52915602E4_4C46AA3401DBexec_var*
begin
//#UC START# *4C52915602E4_4C46AA3401DBexec_impl*
 MessageDlg(l3Cat(l3CStr(remListFiltered.Hint), '.'), 'TPrimListOptionsForm.Reminder_RemListFiltered_Execute');
//#UC END# *4C52915602E4_4C46AA3401DBexec_impl*
end;//TPrimListOptionsForm.Reminder_RemListFiltered_Execute

procedure TPrimListOptionsForm.Reminder_RemListTimeMachineWarning_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C5292A60085_4C46AA3401DBtest_var*
//#UC END# *4C5292A60085_4C46AA3401DBtest_var*
begin
//#UC START# *4C5292A60085_4C46AA3401DBtest_impl*
 aParams.Op.Flag[vcm_ofVisible] := Assigned(dsList) and
  dsList.IsTimeMachineEnable and defDataAdapter.TimeMachine.IsOn;
 if aParams.Op.Flag[vcm_ofVisible] then
  aParams.Op.Caption := DefDataAdapter.TimeMachine.DateStr
 else
  aParams.Op.Caption := nil;
//#UC END# *4C5292A60085_4C46AA3401DBtest_impl*
end;//TPrimListOptionsForm.Reminder_RemListTimeMachineWarning_Test

procedure TPrimListOptionsForm.List_WorkWithList_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4F82C5D50033_4C46AA3401DBtest_var*

 function lp_MakeAvailableOps: IvcmItems;
   {-}
 begin//lp_MakeAvailableOps
  if (f_ListOpsList = nil) then
   f_ListOpsList := TvcmItems.Make;
  if (f_ListOpsList.Count = 0) then
  begin
   f_ListOpsList.AddOp(TdmStdRes.opcode_Selection_Analize);
   f_ListOpsList.AddOp(TdmStdRes.opcode_List_SwitchToFullList);
   f_ListOpsList.AddOp(TdmStdRes.opcode_Filters_FiltersListOpen, vcmCStr(str_ApplyFilters));
   f_ListOpsList.AddOp(TdmStdRes.opcode_LocalList_SearchInList);
   f_ListOpsList.AddOp(TdmStdRes.opcode_List_Sort);
  end;//f_ListOpsList.Count = 0
  Result := f_ListOpsList;
 end;//lp_MakeAvailableOps

var
 l_List : IvcmItems;
//#UC END# *4F82C5D50033_4C46AA3401DBtest_var*
begin
//#UC START# *4F82C5D50033_4C46AA3401DBtest_impl*
 l_List := lp_MakeAvailableOps;
 aParams.Op.SubItems := l_List;
 aParams.Op.Flag[vcm_ofEnabled] := (l_List <> nil) AND (l_List.Count > 0);
//#UC END# *4F82C5D50033_4C46AA3401DBtest_impl*
end;//TPrimListOptionsForm.List_WorkWithList_Test

procedure TPrimListOptionsForm.Cleanup;
//#UC START# *479731C50290_4C46AA3401DB_var*
//#UC END# *479731C50290_4C46AA3401DB_var*
begin
//#UC START# *479731C50290_4C46AA3401DB_impl*
 f_SortTypeMap := nil;
 f_ListOpsList := nil;
 inherited;
//#UC END# *479731C50290_4C46AA3401DB_impl*
end;//TPrimListOptionsForm.Cleanup

procedure TPrimListOptionsForm.InitFields;
//#UC START# *47A042E100E2_4C46AA3401DB_var*
//#UC END# *47A042E100E2_4C46AA3401DB_var*
begin
//#UC START# *47A042E100E2_4C46AA3401DB_impl*
 inherited;
 f_ValidSortTypes := cDefaultListSortTypes;
 f_SortTypeMap := nsIntegerMapManager.Map[imap_pi_List_SortType];
//#UC END# *47A042E100E2_4C46AA3401DB_impl*
end;//TPrimListOptionsForm.InitFields

procedure TPrimListOptionsForm.FinishDataUpdate;
//#UC START# *47EA4E9002C6_4C46AA3401DB_var*
//#UC END# *47EA4E9002C6_4C46AA3401DB_var*
begin
//#UC START# *47EA4E9002C6_4C46AA3401DB_impl*
 inherited;
 f_NeedDropCRList := True;
//#UC END# *47EA4E9002C6_4C46AA3401DB_impl*
end;//TPrimListOptionsForm.FinishDataUpdate

procedure TPrimListOptionsForm.SettingsReplaceFinish;
//#UC START# *47EA8B9601FE_4C46AA3401DB_var*
//#UC END# *47EA8B9601FE_4C46AA3401DB_var*
begin
//#UC START# *47EA8B9601FE_4C46AA3401DB_impl*
 inherited;
 f_NeedDropCRList := True;
//#UC END# *47EA8B9601FE_4C46AA3401DB_impl*
end;//TPrimListOptionsForm.SettingsReplaceFinish

{$If not defined(NoVCM)}
procedure TPrimListOptionsForm.NotifyDataSourceChanged(const anOld: IvcmViewAreaController;
  const aNew: IvcmViewAreaController);
//#UC START# *497469C90140_4C46AA3401DB_var*

 procedure lp_NodeForPositioning;
 begin
  if (dsList <> nil) then
  begin
   with dsList do
    if NodeForPositioning <> nil then
    begin
     with tvList do
     begin
      TreeStruct;
       // - ������� TreeStruct, ����� ���������������� �� ����������;
      GotoOnNode(NodeForPositioning);
     end;
     ReleaseNodeForPositioning;
    end;//if NodeForPositioning <> nil then
  end;//try..finally
 end;//lp_InitDocumentList

 procedure lp_UpdateTreeStruct;
 begin//lp_UpdateTreeStruct
  tvList.TreeStruct := nil;
  ChangeControlsVisible(true);
 end;//lp_UpdateTreeStruct

//#UC END# *497469C90140_4C46AA3401DB_var*
begin
//#UC START# *497469C90140_4C46AA3401DB_impl*
 inherited;
 if (dsList <> nil) then
 begin
  // �������� ������ �������
  if dsList.TimeMachineOff then
   DefDataAdapter.TimeMachine.SwitchOff;
  with tvList do
  begin
   Images := dsList.ImageList.Hack;
   if not Dispatcher.History.InBF then
   begin
    lp_UpdateTreeStruct;
    lp_NodeForPositioning;
   end//not Dispatcher.History.InBF
   else
   if tvList.IsTreeAssign then
   begin
    // ��� �������� �� ������� ��������� �������� ������, ����� ��������
    // ������:
    if Assigned(dsSimpleTree) and
       (tvList.TreeStruct <> dsSimpleTree.SimpleTree) then
     lp_UpdateTreeStruct
    else
     ShowEditorOrList(tvList.TreeStruct);
     // - ��� �������� �� ������� ������� ��������������� TreeStruct, �����
     //   _DataSource. ������� ������ ������ �� ����� ������, ����� ����������
     //   �������� ��� ���;
    UpdateFooter;
   end;//not Dispatcher.History.InBF
  end;//with tvList do
  DefineCaption;
 end;//dsList <> nil
//#UC END# *497469C90140_4C46AA3401DB_impl*
end;//TPrimListOptionsForm.NotifyDataSourceChanged
{$IfEnd} //not NoVCM

{$If not defined(NoVCM)}
procedure TPrimListOptionsForm.DoInit(aFromHistory: Boolean);
//#UC START# *49803F5503AA_4C46AA3401DB_var*
//#UC END# *49803F5503AA_4C46AA3401DB_var*
begin
//#UC START# *49803F5503AA_4C46AA3401DB_impl*
 inherited;
 nsWarnImages;
 f_NeedDropCRList := True;
 cfList.Visible := HasContextFiltration;
 StatusParamsShow;
 cfList.Images := dmStdRes.SmallImageList;
//#UC END# *49803F5503AA_4C46AA3401DB_impl*
end;//TPrimListOptionsForm.DoInit
{$IfEnd} //not NoVCM

{$If not defined(NoVCM)}
procedure TPrimListOptionsForm.InitControls;
//#UC START# *4A8E8F2E0195_4C46AA3401DB_var*
//#UC END# *4A8E8F2E0195_4C46AA3401DB_var*
begin
//#UC START# *4A8E8F2E0195_4C46AA3401DB_impl*
 inherited;
 with remListModified do
 begin
  Left := 16;
  Top := 16;
  Width := 48;
  Height := 48;
  Hint := '������ ��� �������';
  Images := nsWarnImages.WarnImages;
  ImageIndex := 10;
  Visible := False;
 end;
 with remListFiltered do
 begin
  Left := 66;
  Top := 16;
  Width := 48;
  Height := 48;
  Hint := '������ ������������';
  Images := nsWarnImages.WarnImages;
  ImageIndex := 9;
  Visible := False;
 end;
 with remTimeMachineWarning do
 begin
  Left := 116;
  Top := 16;
  Width := 48;
  Height := 48;
  Hint := '������ ������� ��������';
  Images := nsWarnImages.WarnImages;
  ImageIndex := 7;
  DrawCaption := True;
  Visible := False;
 end;
 with RemindersLine do
 begin
  PosX := 16;
  PosY := 16;
  AddReminder(remListModified);
  AddReminder(remListFiltered);
  AddReminder(remTimeMachineWarning);
 end;
 with EmptyListEditor do
 begin
  Align := alClient;
  IsStaticText := True;
  OnJumpTo := EditorJumpTo;
 end;
//#UC END# *4A8E8F2E0195_4C46AA3401DB_impl*
end;//TPrimListOptionsForm.InitControls
{$IfEnd} //not NoVCM

{$If not defined(NoVCM)}
function TPrimListOptionsForm.DoGetTabInfo(out theCaption: Il3CString;
  out theItemIndex: Integer): Boolean;
//#UC START# *4AC497FD00A2_4C46AA3401DB_var*
//#UC END# *4AC497FD00A2_4C46AA3401DB_var*
begin
//#UC START# *4AC497FD00A2_4C46AA3401DB_impl*
 Result := true;
 theCaption := nil;
 theItemIndex := CurrentImageIndex;
//#UC END# *4AC497FD00A2_4C46AA3401DB_impl*
end;//TPrimListOptionsForm.DoGetTabInfo
{$IfEnd} //not NoVCM

{$If not defined(NoVCM)}
procedure TPrimListOptionsForm.EntitiesInited;
//#UC START# *4AE1948900DE_4C46AA3401DB_var*
//#UC END# *4AE1948900DE_4C46AA3401DB_var*
begin
//#UC START# *4AE1948900DE_4C46AA3401DB_impl*
 inherited;
 with remListModified do
 begin
  EntityName := en_Reminder;
  OperationName := op_RemListModified;
 end;
 with remListFiltered do
 begin
  EntityName := en_Reminder;
  OperationName := op_RemListFiltered;
 end;
 with remTimeMachineWarning do
 begin
  EntityName := en_Reminder;
  OperationName := op_RemListTimeMachineWarning;
 end;
//#UC END# *4AE1948900DE_4C46AA3401DB_impl*
end;//TPrimListOptionsForm.EntitiesInited
{$IfEnd} //not NoVCM

procedure TPrimListOptionsForm.ClearFields;
 {-}
begin
 f_ListOpsList := nil;
 inherited;
end;//TPrimListOptionsForm.ClearFields

procedure TPrimListOptionsForm.InitEntities;
begin
 inherited;
 with Entities.Entities do
 begin
  PublishFormEntity(en_Edit, nil);
  PublishFormEntity(en_File, nil);
  PublishFormEntity(en_Tree, nil);
  PublishFormEntity(en_Document, nil);
  PublishFormEntity(en_Openable, nil);
  PublishFormEntity(en_WarnListFiltered, nil);
  PublishFormEntity(en_Reminder, nil);
  PublishFormEntity(en_List, nil);
  ContextMenuWeight(en_Edit, 50);
  ContextMenuWeight(en_List, 60);
  ContextMenuWeight(en_LocalList, 70);
  ContextMenuWeight(en_Selection, 80);
  ContextMenuWeight(en_Document, 90);
  ContextMenuWeight(en_Tree, 100);
  ContextMenuWeight(en_WarnListFiltered, 110);
  MakeEntitySupportedByControl(en_WarnListFiltered, remListFiltered);
  PublishFormEntity(en_Text, nil);
  MakeEntitySupportedByControl(en_Text, EmptyListEditor);
  PublishOp(en_Edit, op_Delete, Edit_Delete_Execute, Edit_Delete_Test, Edit_Delete_GetState);
  ShowInContextMenu(en_Edit, op_Delete, true);
  ShowInToolbar(en_Edit, op_Delete, true);
  ContextMenuWeight(en_Edit, op_Delete, 20);
  PublishOp(en_File, op_Print, File_Print_Execute, File_Print_Test, nil);
  ShowInContextMenu(en_File, op_Print, false);
  ShowInToolbar(en_File, op_Print, true);
  PublishOp(en_File, op_PrintDialog, File_PrintDialog_Execute, File_PrintDialog_Test, nil);
  ShowInContextMenu(en_File, op_PrintDialog, false);
  ShowInToolbar(en_File, op_PrintDialog, true);
  PublishOp(en_File, op_PrintPreview, File_PrintPreview_Execute, File_PrintPreview_Test, nil);
  ShowInContextMenu(en_File, op_PrintPreview, false);
  ShowInToolbar(en_File, op_PrintPreview, true);
  PublishOp(en_File, op_Save, File_Save_Execute, File_Save_Test, nil);
  ShowInContextMenu(en_File, op_Save, false);
  ShowInToolbar(en_File, op_Save, true);
  PublishOp(en_File, op_ToMSWord, File_ToMSWord_Execute, File_ToMSWord_Test, nil);
  ShowInContextMenu(en_File, op_ToMSWord, false);
  ShowInToolbar(en_File, op_ToMSWord, true);
  PublishOp(en_File, op_SendMailAsAttachment, File_SendMailAsAttachment_Execute, File_SendMailAsAttachment_Test, nil, true);
  ShowInContextMenu(en_File, op_SendMailAsAttachment, false, true);
  ShowInToolbar(en_File, op_SendMailAsAttachment, false, true);
  PublishOp(en_Document, op_AddBookmark, Document_AddBookmark_Execute, Document_AddBookmark_Test, nil);
  ShowInContextMenu(en_Document, op_AddBookmark, true);
  ContextMenuWeight(en_Document, op_AddBookmark, 70);
  PublishOp(en_Edit, op_Paste, nil, nil, nil);
  ShowInContextMenu(en_Edit, op_Paste, true);
  ShowInToolbar(en_Edit, op_Paste, true);
  ContextMenuWeight(en_Edit, op_Paste, 15);
  PublishOp(en_Edit, op_SelectAll, Edit_SelectAll_Execute, Edit_SelectAll_Test, nil);
  ContextMenuWeight(en_Edit, op_SelectAll, 30);
  PublishOp(en_Tree, op_ExpandAll, Tree_ExpandAll_Execute, nil, nil);
  ShowInContextMenu(en_Tree, op_ExpandAll, true);
  ContextMenuWeight(en_Tree, op_ExpandAll, 10);
  PublishOp(en_Tree, op_CollapseAll, Tree_CollapseAll_Execute, nil, nil);
  ShowInContextMenu(en_Tree, op_CollapseAll, true);
  ContextMenuWeight(en_Tree, op_CollapseAll, 20);
  PublishOp(en_Tree, op_Wrap, nil, Tree_Wrap_Test, nil);
  ShowInContextMenu(en_Tree, op_Wrap, false);
  ShowInToolbar(en_Tree, op_Wrap, false);
  PublishOp(en_List, op_OrAnotherList, List_OrAnotherList_Execute, List_OrAnotherList_Test, nil);
  ShowInToolbar(en_List, op_OrAnotherList, true);
  ContextMenuWeight(en_List, op_OrAnotherList, 40);
  PublishOp(en_List, op_AndAnotherList, List_AndAnotherList_Execute, List_AndAnotherList_Test, nil);
  ShowInToolbar(en_List, op_AndAnotherList, true);
  ContextMenuWeight(en_List, op_AndAnotherList, 50);
  PublishOp(en_List, op_AndNotAnotherList, List_AndNotAnotherList_Execute, List_AndNotAnotherList_Test, nil);
  ShowInToolbar(en_List, op_AndNotAnotherList, true);
  ContextMenuWeight(en_List, op_AndNotAnotherList, 60);
  PublishOp(en_Document, op_Open, Document_Open_Execute, Document_Open_Test, nil);
  ShowInContextMenu(en_Document, op_Open, true);
  ContextMenuWeight(en_Document, op_Open, 10);
  PublishOp(en_Document, op_OpenNewWindow, Document_OpenNewWindow_Execute, Document_OpenNewWindow_Test, nil);
  ShowInContextMenu(en_Document, op_OpenNewWindow, true);
  ContextMenuWeight(en_Document, op_OpenNewWindow, 20);
  PublishOp(en_Openable, op_OpenInNewWindow, Openable_OpenInNewWindow_Execute, Openable_OpenInNewWindow_Test, nil);
  PublishOp(en_Document, op_PrintDialog, Document_PrintDialog_Execute, Document_PrintDialog_Test, nil);
  ShowInContextMenu(en_Document, op_PrintDialog, true);
  ContextMenuWeight(en_Document, op_PrintDialog, 40);
  PublishOp(en_Document, op_PrintPreview, Document_PrintPreview_Execute, Document_PrintPreview_Test, nil);
  ShowInContextMenu(en_Document, op_PrintPreview, true);
  ContextMenuWeight(en_Document, op_PrintPreview, 50);
  PublishOp(en_Document, op_Save, Document_Save_Execute, Document_Save_Test, nil);
  ShowInContextMenu(en_Document, op_Save, true);
  ContextMenuWeight(en_Document, op_Save, 60);
  PublishOp(en_Document, op_Print, Document_Print_Execute, Document_Print_Test, nil);
  ShowInContextMenu(en_Document, op_Print, true);
  PublishOp(en_WarnListFiltered, op_ClearAll, WarnListFiltered_ClearAll_Execute, nil, nil);
  ShowInContextMenu(en_WarnListFiltered, op_ClearAll, true);
  PublishOp(en_Reminder, op_RemListModified, Reminder_RemListModified_Execute, Reminder_RemListModified_Test, nil);
  ShowInContextMenu(en_Reminder, op_RemListModified, true);
  ShowInToolbar(en_Reminder, op_RemListModified, true);
  PublishOp(en_Reminder, op_RemListFiltered, Reminder_RemListFiltered_Execute, Reminder_RemListFiltered_Test, nil);
  ShowInContextMenu(en_Reminder, op_RemListFiltered, true);
  ShowInToolbar(en_Reminder, op_RemListFiltered, true);
  PublishOp(en_Reminder, op_RemListTimeMachineWarning, nil, Reminder_RemListTimeMachineWarning_Test, nil);
  PublishOp(en_List, op_WorkWithList, nil, List_WorkWithList_Test, nil);
  ShowInContextMenu(en_Edit, op_Copy, true);
  ShowInToolbar(en_Edit, op_Copy, true);
  ContextMenuWeight(en_Edit, op_Copy, 10);
  
  ShowInContextMenu(en_Edit, op_FindContext, true);
  ShowInToolbar(en_Edit, op_FindContext, true);
  ContextMenuWeight(en_Edit, op_FindContext, 50);
  
  ShowInContextMenu(en_File, op_SaveToFolder, false);
  ShowInToolbar(en_File, op_SaveToFolder, true);
  
  ShowInContextMenu(en_File, op_LoadFromFolder, false);
  ShowInToolbar(en_File, op_LoadFromFolder, true);
  
  ShowInContextMenu(en_Document, op_AddToControl, true);
  ContextMenuWeight(en_Document, op_AddToControl, 90);
  
  ShowInContextMenu(en_Document, op_GetAttributesFrmAct, true);
  ContextMenuWeight(en_Document, op_GetAttributesFrmAct, 30);
  
  ShowInContextMenu(en_Document, op_GetRelatedDocFrmAct, true);
  ContextMenuWeight(en_Document, op_GetRelatedDocFrmAct, 35);
  
  ContextMenuWeight(en_Edit, op_Deselect, 40);
  
  ShowInContextMenu(en_TimeMachine, op_TimeMachineOnOffNew, false);
  ShowInToolbar(en_TimeMachine, op_TimeMachineOnOffNew, false);
  
  ContextMenuWeight(en_List, op_SwitchToFullList, 100);
  
  ShowInToolbar(en_List, op_ListInfo, true);
  ContextMenuWeight(en_List, op_ListInfo, 10);
  
  ContextMenuWeight(en_List, op_Sort, 20);
  
  ContextMenuWeight(en_List, op_SortDirection, 30);
  
  ShowInToolbar(en_List, op_SpecifyList, true);
  ContextMenuWeight(en_List, op_SpecifyList, 70);
  
  ShowInContextMenu(en_List, op_ExportToXML, true);
  ContextMenuWeight(en_List, op_ExportToXML, 90);
  
  ShowInContextMenu(en_Filters, op_FiltersList, false);
  ShowInToolbar(en_Filters, op_FiltersList, false);
  
  ShowInContextMenu(en_LocalList, op_PublishSourceSearchInList, true);
  ShowInToolbar(en_LocalList, op_PublishSourceSearchInList, true);
  ContextMenuWeight(en_LocalList, op_PublishSourceSearchInList, 30);
  
  ContextMenuWeight(en_Document, op_SimilarDocuments, 95);
  
  ShowInToolbar(en_CRList, op_SetType, true, true);
  
  ShowInContextMenu(en_LocalList, op_OpenNewWindow, true);
  ContextMenuWeight(en_LocalList, op_OpenNewWindow, 10);
  
  ShowInContextMenu(en_Selection, op_CopyToNewList, true);
  ContextMenuWeight(en_Selection, op_CopyToNewList, 10);
  
  ShowInContextMenu(en_Selection, op_Analize, true);
  ShowInToolbar(en_Selection, op_Analize, true);
  ContextMenuWeight(en_Selection, op_Analize, 20);
  
  ShowInContextMenu(en_LocalList, op_SearchInList, true);
  ShowInToolbar(en_LocalList, op_SearchInList, true);
  ContextMenuWeight(en_LocalList, op_SearchInList, 20);
  
  ShowInContextMenu(en_Filters, op_FiltersListOpen, false);
  ShowInToolbar(en_Filters, op_FiltersListOpen, false);
  
  ShowInContextMenu(en_Text, op_MakeHyperlinkToDocument, false);
  ShowInToolbar(en_Text, op_MakeHyperlinkToDocument, false);
  
  ShowInContextMenu(en_Document, op_MakeHyperlinkToDocument, true);
  ShowInToolbar(en_Document, op_MakeHyperlinkToDocument, false);
  ContextMenuWeight(en_Document, op_MakeHyperlinkToDocument, 80);
 end;//with Entities.Entities
end;

procedure TPrimListOptionsForm.MakeControls;
begin
 inherited;
 f_remListFiltered := TnscReminder.Create(Self);
 f_remListFiltered.Name := 'remListFiltered';
 f_remListFiltered.Parent := Self;
 f_remListModified := TnscReminder.Create(Self);
 f_remListModified.Name := 'remListModified';
 f_remListModified.Parent := Self;
 f_remTimeMachineWarning := TnscReminder.Create(Self);
 f_remTimeMachineWarning.Name := 'remTimeMachineWarning';
 f_remTimeMachineWarning.Parent := Self;
 f_RemindersLine := TnscRemindersLine.Create(Self);
 f_RemindersLine.Name := 'RemindersLine';
 with DefineZone(vcm_ztChild, f_RemindersLine) do
 begin
 end;//with DefineZone(vcm_ztChild, f_RemindersLine)
 ListPanel.Parent := Self;
 f_EmptyListEditor := TnscEditor.Create(Self);
 f_EmptyListEditor.Name := 'EmptyListEditor';
 f_EmptyListEditor.Parent := ListPanel;
end;

{$IfEnd} //not Admin AND not Monitorings

initialization
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimListOptions_Control_remListFiltered
 Tkw_PrimListOptions_Control_remListFiltered.Register('�������::remListFiltered', TnscReminder);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimListOptions_Control_remListFiltered_Push
 Tkw_PrimListOptions_Control_remListFiltered_Push.Register('�������::remListFiltered:push');
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimListOptions_Control_remListModified
 Tkw_PrimListOptions_Control_remListModified.Register('�������::remListModified', TnscReminder);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimListOptions_Control_remListModified_Push
 Tkw_PrimListOptions_Control_remListModified_Push.Register('�������::remListModified:push');
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimListOptions_Control_remTimeMachineWarning
 Tkw_PrimListOptions_Control_remTimeMachineWarning.Register('�������::remTimeMachineWarning', TnscReminder);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimListOptions_Control_remTimeMachineWarning_Push
 Tkw_PrimListOptions_Control_remTimeMachineWarning_Push.Register('�������::remTimeMachineWarning:push');
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimListOptions_Component_RemindersLine
 Tkw_PrimListOptions_Component_RemindersLine.Register('���������::RemindersLine', TnscRemindersLine);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimListOptions_Control_EmptyListEditor
 Tkw_PrimListOptions_Control_EmptyListEditor.Register('�������::EmptyListEditor', TnscEditor);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimListOptions_Control_EmptyListEditor_Push
 Tkw_PrimListOptions_Control_EmptyListEditor_Push.Register('�������::EmptyListEditor:push');
{$IfEnd} //not Admin AND not Monitorings

end.