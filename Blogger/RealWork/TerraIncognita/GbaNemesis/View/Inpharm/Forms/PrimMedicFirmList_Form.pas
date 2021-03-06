unit PrimMedicFirmList_Form;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "View"
// �����: ����� �.�.
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/View/Inpharm/Forms/PrimMedicFirmList_Form.pas"
// �����: 27.01.2009 13:42
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<VCMForm::Class>> F1 ���������� ��������::Inpharm::View::Inpharm::PrimMedicFirmList
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
  l3Interfaces,
  afwInterfaces
  {$If not defined(NoVCM)}
  ,
  vcmExternalInterfaces
  {$IfEnd} //not NoVCM
  ,
  l3TreeInterfaces,
  Classes,
  l3ControlsTypes,
  MedicInterfaces,
  eeTreeView,
  OfficeLike_Usual_Controls,
  Base_Operations_F1Specific_Controls
  {$If not defined(NoVCM)}
  ,
  vcmEntityForm
  {$IfEnd} //not NoVCM
  ,
  eeTreeViewExport
  {$If defined(Nemesis)}
  ,
  nscTreeView
  {$IfEnd} //Nemesis
  
  {$If not defined(NoVCM)}
  ,
  vcmUserControls
  {$IfEnd} //not NoVCM
  
  {$If defined(Nemesis)}
  ,
  nscContextFilter
  {$IfEnd} //Nemesis
  ,
  nsTypes,
  vtPanel,
  Base_Operations_Strange_Controls,
  Base_Operations_Editions_Controls,
  ImgList,
  Common_Strange_Controls,
  l3StringIDEx,
  OfficeLike_Tree_Controls,
  vtLister
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
  vtOutliner,
  BaseDocumentWithAttributesInterfaces,
  vcmInterfaces {a},
  vcmControllers {a},
  DocumentAndListInterfaces,
  PrimMedicFirmList_mflMain_UserType
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}
type
 _CommonForTextAndFlashAndMedicFirmList_Parent_ = TvcmEntityForm;
 {$Include w:\garant6x\implementation\Garant\GbaNemesis\View\Common\Forms\CommonForTextAndFlashAndMedicFirmList.imp.pas}
 _BaseDocument_Parent_ = _CommonForTextAndFlashAndMedicFirmList_;
 {$Include w:\garant6x\implementation\Garant\GbaNemesis\View\Common\Forms\BaseDocument.imp.pas}
 TPrimMedicFirmListForm = {form} class(_BaseDocument_)
  {* ������ ����-�������������� }
 private
 // private fields
   f_BackgroundPanel : TvtPanel;
    {* ���� ��� �������� BackgroundPanel}
   f_ContextFilter : TnscContextFilter;
    {* ���� ��� �������� ContextFilter}
   f_ListTree : TnscTreeView;
    {* ���� ��� �������� ListTree}
 protected
  procedure SignalDataSourceChanged(const anOld : IvcmViewAreaController;
                                const aDsNew : IvcmViewAreaController); override;
  procedure InitEntities; override;
  procedure MakeControls; override;
 private
 // private methods
   procedure ListTreeNewCharPressed(aChar: AnsiChar);
   procedure ListTreeSelectCountChanged(aSender: TObject;
     anOldCount: Integer;
     aNewCount: Integer);
   procedure ListTreeCountChanged(Sender: TObject;
     NewCount: LongInt);
   procedure ListTreeCurrentChanged(Sender: TObject;
     aNewCurrent: LongInt;
     aOldCurrent: LongInt);
   procedure ListTreeFormatStatusInfo(aSender: TObject;
     var Info: Il3CString;
     const aCurrent: Integer;
     const aCount: Integer;
     const aSelected: Integer);
   procedure ContextFilterChange(Sender: TObject);
     {* TNotifyEvent is used for events that do not require parameters. }
   procedure ListTreeTreeChanged(aSender: TObject;
     const anOldTree: Il3SimpleTree;
     const aNewTree: Il3SimpleTree);
   function ListTreeGetItemImage(Sender: TObject;
     Index: Integer;
     var aImages: TCustomImageList): Integer;
     {* Event to get Index of Bitmap in ImageIndex. }
   procedure ListTreeActionElement(Sender: TObject;
     Index: LongInt);
   procedure ContextFilterWrongContext(Sender: TObject);
     {* TNotifyEvent is used for events that do not require parameters. }
 protected
 // realized methods
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
   procedure Tree_ExpandAll_Test(const aParams: IvcmTestParamsPrim);
     {* ���������� ��� }
   procedure Tree_CollapseAll_Test(const aParams: IvcmTestParamsPrim);
     {* �������� ��� }
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
   procedure FocusIsSetToUs; override;
    {$IfEnd} //not NoVCM
 protected
 // protected fields
   dsMedicFirmList : IdsMedicFirmList;
 protected
 // protected methods
   function HasCurrent: Boolean;
   procedure ListExport(anExportKind: TnsExportKind;
     aExportSelection: Boolean);
   procedure ListOpsWithTrialModeTest(const aParams: IvcmTestParamsPrim);
   procedure ListOpsTest(const aParams: IvcmTestParamsPrim);
   function MakePreview(WithTexts: Boolean): IafwComplexDocumentPreview;
   procedure SaveDialogCanClose(Sender: TObject;
     var CanClose: Boolean);
   function HasSelection: Boolean;
   function ApproxExportCount(aUseSelection: Boolean): Integer;
 public
 // public properties
   property BackgroundPanel: TvtPanel
     read f_BackgroundPanel;
   property ContextFilter: TnscContextFilter
     read f_ContextFilter;
   property ListTree: TnscTreeView
     read f_ListTree;
 end;//TPrimMedicFirmListForm
{$IfEnd} //not Admin AND not Monitorings

implementation

{$If not defined(Admin) AND not defined(Monitorings)}
uses
  l3BaseStream,
  k2CustomFileGenerator,
  nevTools,
  Windows,
  l3String,
  PresentationInterfaces,
  afwFacade,
  bsUtils
  {$If not defined(NoVCM)}
  ,
  vcmBase
  {$IfEnd} //not NoVCM
  ,
  nsExternalObject,
  l3Stream,
  evTypes
  {$If not defined(NoVCM)}
  ,
  vcmMessagesSupport
  {$IfEnd} //not NoVCM
  ,
  evTreeStorable,
  k2Const,
  DynamicTreeUnit,
  BaseTypesUnit,
  l3Types,
  nsTrialSupport,
  PreviewInterfaces,
  nsSaveDialog,
  nsConst,
  nsToMSWordOp,
  Controls,
  k2TagGen,
  nsQuestions,
  nsExternalObjectModelPart,
  nsUtils,
  Forms,
  l3MessageID
  {$If not defined(NoScripts)}
  ,
  tfwScriptingInterfaces
  {$IfEnd} //not NoScripts
  ,
  SysUtils {a},
  StdRes {a}
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}

{$Include w:\garant6x\implementation\Garant\GbaNemesis\View\Common\Forms\CommonForTextAndFlashAndMedicFirmList.imp.pas}

{$Include w:\garant6x\implementation\Garant\GbaNemesis\View\Common\Forms\BaseDocument.imp.pas}

var
   { ������������ ������ mflMainLocalConstants }
  str_mflMainCaption : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'mflMainCaption'; rValue : '���������������� ����� (������ ������)');
   { ��������� ����������������� ���� "���������������� ����� (������ ������)" }

type
  Tkw_PrimMedicFirmList_Control_BackgroundPanel = class(TtfwControlString)
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
  end;//Tkw_PrimMedicFirmList_Control_BackgroundPanel

// start class Tkw_PrimMedicFirmList_Control_BackgroundPanel

{$If not defined(NoScripts)}
function Tkw_PrimMedicFirmList_Control_BackgroundPanel.GetString: AnsiString;
 {-}
begin
 Result := 'BackgroundPanel';
end;//Tkw_PrimMedicFirmList_Control_BackgroundPanel.GetString
{$IfEnd} //not NoScripts

type
  Tkw_PrimMedicFirmList_Control_BackgroundPanel_Push = class(TkwBynameControlPush)
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
  end;//Tkw_PrimMedicFirmList_Control_BackgroundPanel_Push

// start class Tkw_PrimMedicFirmList_Control_BackgroundPanel_Push

{$If not defined(NoScripts)}
procedure Tkw_PrimMedicFirmList_Control_BackgroundPanel_Push.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString('BackgroundPanel');
 inherited;
end;//Tkw_PrimMedicFirmList_Control_BackgroundPanel_Push.DoDoIt
{$IfEnd} //not NoScripts

type
  Tkw_PrimMedicFirmList_Control_ContextFilter = class(TtfwControlString)
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
  end;//Tkw_PrimMedicFirmList_Control_ContextFilter

// start class Tkw_PrimMedicFirmList_Control_ContextFilter

{$If not defined(NoScripts)}
function Tkw_PrimMedicFirmList_Control_ContextFilter.GetString: AnsiString;
 {-}
begin
 Result := 'ContextFilter';
end;//Tkw_PrimMedicFirmList_Control_ContextFilter.GetString
{$IfEnd} //not NoScripts

type
  Tkw_PrimMedicFirmList_Control_ContextFilter_Push = class(TkwBynameControlPush)
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
  end;//Tkw_PrimMedicFirmList_Control_ContextFilter_Push

// start class Tkw_PrimMedicFirmList_Control_ContextFilter_Push

{$If not defined(NoScripts)}
procedure Tkw_PrimMedicFirmList_Control_ContextFilter_Push.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString('ContextFilter');
 inherited;
end;//Tkw_PrimMedicFirmList_Control_ContextFilter_Push.DoDoIt
{$IfEnd} //not NoScripts

type
  Tkw_PrimMedicFirmList_Control_ListTree = class(TtfwControlString)
   {* ����� ������� ��� �������������� �������� ListTree
----
*������ �������������*:
[code]
�������::ListTree TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimMedicFirmList_Control_ListTree

// start class Tkw_PrimMedicFirmList_Control_ListTree

{$If not defined(NoScripts)}
function Tkw_PrimMedicFirmList_Control_ListTree.GetString: AnsiString;
 {-}
begin
 Result := 'ListTree';
end;//Tkw_PrimMedicFirmList_Control_ListTree.GetString
{$IfEnd} //not NoScripts

type
  Tkw_PrimMedicFirmList_Control_ListTree_Push = class(TkwBynameControlPush)
   {* ����� ������� ��� �������� ListTree
----
*������ �������������*:
[code]
�������::ListTree:push pop:control:SetFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimMedicFirmList_Control_ListTree_Push

// start class Tkw_PrimMedicFirmList_Control_ListTree_Push

{$If not defined(NoScripts)}
procedure Tkw_PrimMedicFirmList_Control_ListTree_Push.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString('ListTree');
 inherited;
end;//Tkw_PrimMedicFirmList_Control_ListTree_Push.DoDoIt
{$IfEnd} //not NoScripts

procedure TPrimMedicFirmListForm.ListTreeNewCharPressed(aChar: AnsiChar);
//#UC START# *51CC283001B4_497EE4EB00CB_var*
//#UC END# *51CC283001B4_497EE4EB00CB_var*
begin
//#UC START# *51CC283001B4_497EE4EB00CB_impl*
 ContextFilter.PressChar(aChar);
//#UC END# *51CC283001B4_497EE4EB00CB_impl*
end;//TPrimMedicFirmListForm.ListTreeNewCharPressed

procedure TPrimMedicFirmListForm.ListTreeSelectCountChanged(aSender: TObject;
  anOldCount: Integer;
  aNewCount: Integer);
//#UC START# *51CC28E300C7_497EE4EB00CB_var*
//#UC END# *51CC28E300C7_497EE4EB00CB_var*
begin
//#UC START# *51CC28E300C7_497EE4EB00CB_impl*
 UpdateStatusInfo;
//#UC END# *51CC28E300C7_497EE4EB00CB_impl*
end;//TPrimMedicFirmListForm.ListTreeSelectCountChanged

procedure TPrimMedicFirmListForm.ListTreeCountChanged(Sender: TObject;
  NewCount: LongInt);
//#UC START# *51CC28F00163_497EE4EB00CB_var*
//#UC END# *51CC28F00163_497EE4EB00CB_var*
begin
//#UC START# *51CC28F00163_497EE4EB00CB_impl*
 UpdateStatusInfo;
//#UC END# *51CC28F00163_497EE4EB00CB_impl*
end;//TPrimMedicFirmListForm.ListTreeCountChanged

procedure TPrimMedicFirmListForm.ListTreeCurrentChanged(Sender: TObject;
  aNewCurrent: LongInt;
  aOldCurrent: LongInt);
//#UC START# *51CC28FB00C1_497EE4EB00CB_var*
//#UC END# *51CC28FB00C1_497EE4EB00CB_var*
begin
//#UC START# *51CC28FB00C1_497EE4EB00CB_impl*
 UpdateStatusInfo;
 dsMedicFirmList.CurrentChanged(ListTree.GetCurrentNode);
//#UC END# *51CC28FB00C1_497EE4EB00CB_impl*
end;//TPrimMedicFirmListForm.ListTreeCurrentChanged

procedure TPrimMedicFirmListForm.ListTreeFormatStatusInfo(aSender: TObject;
  var Info: Il3CString;
  const aCurrent: Integer;
  const aCount: Integer;
  const aSelected: Integer);
//#UC START# *51CC290E033F_497EE4EB00CB_var*
//#UC END# *51CC290E033F_497EE4EB00CB_var*
begin
//#UC START# *51CC290E033F_497EE4EB00CB_impl*
 Info := vcmFmt(str_MedicFirmListStatusInfoFormat,[aCurrent, aCount]);
//#UC END# *51CC290E033F_497EE4EB00CB_impl*
end;//TPrimMedicFirmListForm.ListTreeFormatStatusInfo

procedure TPrimMedicFirmListForm.ContextFilterChange(Sender: TObject);
//#UC START# *51CC292100EF_497EE4EB00CB_var*
var
 l_TreeSource: Il3SimpleTree;
 l_Current: Integer;
//#UC END# *51CC292100EF_497EE4EB00CB_var*
begin
//#UC START# *51CC292100EF_497EE4EB00CB_impl*
 with ListTree do
 begin
  l_TreeSource := dsMedicFirmList.FiltrateByContext(TreeStruct, GetCurrentNode,
   ContextFilter.MakeState, l_Current);
  if Assigned(l_TreeSource) and (l_TreeSource.CountView > 0) then
  begin
   Changing;
   try
    TreeStruct := l_TreeSource;
    vlbMakeItemVisible(Current);
   finally
    Changed;
   end;{try..finally}
  end;
 end;
//#UC END# *51CC292100EF_497EE4EB00CB_impl*
end;//TPrimMedicFirmListForm.ContextFilterChange

procedure TPrimMedicFirmListForm.ListTreeTreeChanged(aSender: TObject;
  const anOldTree: Il3SimpleTree;
  const aNewTree: Il3SimpleTree);
//#UC START# *51CC2931009B_497EE4EB00CB_var*
//#UC END# *51CC2931009B_497EE4EB00CB_var*
begin
//#UC START# *51CC2931009B_497EE4EB00CB_impl*
 if not Dispatcher.History.InBF then
  dsMedicFirmList.CurrentChanged(ListTree.GetCurrentNode);
//#UC END# *51CC2931009B_497EE4EB00CB_impl*
end;//TPrimMedicFirmListForm.ListTreeTreeChanged

function TPrimMedicFirmListForm.ListTreeGetItemImage(Sender: TObject;
  Index: Integer;
  var aImages: TCustomImageList): Integer;
//#UC START# *51CC294901A6_497EE4EB00CB_var*
//#UC END# *51CC294901A6_497EE4EB00CB_var*
begin
//#UC START# *51CC294901A6_497EE4EB00CB_impl*
 Result := cMedicFirmImage;
//#UC END# *51CC294901A6_497EE4EB00CB_impl*
end;//TPrimMedicFirmListForm.ListTreeGetItemImage

procedure TPrimMedicFirmListForm.ListTreeActionElement(Sender: TObject;
  Index: LongInt);
//#UC START# *51CC2956000E_497EE4EB00CB_var*
//#UC END# *51CC2956000E_497EE4EB00CB_var*
begin
//#UC START# *51CC2956000E_497EE4EB00CB_impl*
 if HasCurrent and Assigned(dsMedicFirmList) then
  TdmStdRes.OpenDocument(dsMedicFirmList.MakeNewDocInfo, nil);
//#UC END# *51CC2956000E_497EE4EB00CB_impl*
end;//TPrimMedicFirmListForm.ListTreeActionElement

procedure TPrimMedicFirmListForm.ContextFilterWrongContext(Sender: TObject);
//#UC START# *51CC29600188_497EE4EB00CB_var*
//#UC END# *51CC29600188_497EE4EB00CB_var*
begin
//#UC START# *51CC29600188_497EE4EB00CB_impl*
 nsBeepWrongContext;
//#UC END# *51CC29600188_497EE4EB00CB_impl*
end;//TPrimMedicFirmListForm.ContextFilterWrongContext

function TPrimMedicFirmListForm.HasCurrent: Boolean;
//#UC START# *4C52FA220387_497EE4EB00CB_var*
//#UC END# *4C52FA220387_497EE4EB00CB_var*
begin
//#UC START# *4C52FA220387_497EE4EB00CB_impl*
 Result := ListTree.TreeView.Current >= 0;
//#UC END# *4C52FA220387_497EE4EB00CB_impl*
end;//TPrimMedicFirmListForm.HasCurrent

procedure TPrimMedicFirmListForm.ListExport(anExportKind: TnsExportKind;
  aExportSelection: Boolean);
//#UC START# *4C52FB46037A_497EE4EB00CB_var*
var
 l_Ext        : String;
 //l_PathName   : Il3CString;
 l_Output: TnsGetGenOutputStruct;
 l_Stream     : Tl3Stream;
 l_Format     : Tl3ClipboardFormat;
 l_F          : TnsFileFormat;
 l_G          : Tk2CustomFileGenerator;
 l_Visualizer : IafwLongProcessVisualizer;
 l_Data       : InevStorable;
 l_Saved      : Boolean;
 l_H          : Tk2TagGenerator;
//#UC END# *4C52FB46037A_497EE4EB00CB_var*
begin
//#UC START# *4C52FB46037A_497EE4EB00CB_impl*
 l_Format := CF_LOCALE;
 if anExportKind = ekDisk then
 begin
  with dmStdRes do
  begin
   SaveDialog.DialogKind := ns_sdkList;
   SaveDialog.MergeChecked := False;
   SaveDialog.SelectedOnlyEnabled := aExportSelection and (ListTree.TreeView.Tree.SelectedCount >= 2);
   SaveDialog.SelectedOnlyChecked := SaveDialog.SelectedOnlyEnabled;
   //l_PathName := dsMedicFirmList.FullName;
   l_Output := TnsGetGenOutputStruct_Create(dsMedicFirmList.FullName);
   if SaveDialog.SelectedOnlyChecked then
   begin
    l_Output.rName := l3Fmt(vcmCStr(str_SaveSelectedListPrefix),[l_Output.rName])
   end;//if SaveDialog.SelectedOnlyChecked then
   SaveDialog.FileName := l3Str(nsPrepareFileName(l_Output.rName));
   SaveDialog.OnCanClose := SaveDialogCanClose;
   if not SaveDialog.Execute then
    Exit;
   aExportSelection := SaveDialog.SelectedOnlyChecked;
   if SaveDialog.SaveListTarget = ns_sdlkContents then
   begin
    afw.ProcessMessages;
    try
     l_Visualizer := bsMakeSaveVisualizer(vcmCStr(str_SaveDocumentsVisualizer));
     try
      if SaveDialog.MergeChecked then
       l_Saved := dsMedicFirmList.MergeDocuments(ListTree.TreeStruct,
        SaveDialog.SelectedOnlyChecked, nsCStr(SaveDialog.FileName),
        SaveDialog.SelectedFileFormat, afw.Application.IsInternal)
      else
       l_Saved := dsMedicFirmList.ExportDocuments(ListTree.TreeStruct,
        SaveDialog.SelectedOnlyChecked, nsCStr(ExtractFilePath(SaveDialog.FileName)),
        SaveDialog.SelectedFileFormat);
      if not l_Saved then
       Say(inf_ExportForThisDocumentsImpossible);
      Exit;
     finally
      l_Visualizer := nil;
     end
    except
     on ECannotSave do
      Say(err_ListSaveToFileError);
    end{try..except}
   end;
   l_Output := TnsGetGenOutputStruct_Create(nsCStr(SaveDialog.FileName));
   l_F := SaveDialog.SelectedFileFormat;
   l_Ext := nsGetFileFormatExt(l_F);
   case l_F of
    ns_ffRTF :
     l_Format := CF_RTF;
    ns_ffTxt:
     l_Format := CF_TEXT;
    ns_ffHTML:
     l_Format := CF_HTML;
    ns_ffEvd:
     l_Format := CF_EverestTxt;
   end;//case SaveDialogFileFormat of
   l_Output.rName := nsCStr(ChangeFileExt(l3PStr(l_Output.rName), l_Ext));
  end;
 end
 else
 begin
  l_Output := TnsGetGenOutputStruct_Create(dsMedicFirmList.FullName);
  if aExportSelection and (ListTree.TreeView.Tree.SelectedCount >= 2) then
   l_Output.rName := l3Fmt(vcmCStr(str_SaveSelectedListPrefix), [l_Output.rName]);
  l_Output.rName := nsMakeTemporaryFileName(l_Output.rName, '.rtf');
  l_Format := CF_RTF;
  l_F := ns_ffRTF;
 end;//aNeedDialog
 try
  case anExportKind of
   ekShell, ekActiveWord:
    l_Visualizer := bsMakeExportVisualizer(vcmCStr(str_ExportListVisualizer));
   ekDisk:
    l_Visualizer := bsMakeSaveVisualizer(vcmCStr(str_SaveListVisualizer));
   ekEMail:
    l_Visualizer := bsMakeEMailVisualizer;
  else
   Assert(False);                                                                                            
  end;
  try
   l_Stream := Tl3NamedTextStream.Create(l3PStr(l_Output.rName), l3_fmWrite, 0);
   try
    if nsGetGen(l_Output, l_F, l_G, l_H) then
    try
     l_G.Filer.Mode := l3_fmWrite;
     l_G.Filer.Stream := l_Stream;
     try
      l_H.Start;
      try
       if aExportSelection then
        l_Data := TevTreeStorable.MakeStorable(TevTreeStorableData_C(ListTree.TreeStruct, k2_tiVoid, FM_SELECTION))
       else
        l_Data := TevTreeStorable.MakeStorable(TevTreeStorableData_C(ListTree.TreeStruct));
       l_Data.Store(nil, l_H);
      finally
       l_H.Finish;
      end;//try..finally
     finally
      l_G.Filer.Stream := nil;
     end;//try..finally
    finally
     FreeAndNil(l_H);
     FreeAndNil(l_G);
    end;//try..finally
   finally
    FreeAndNil(l_Stream);
   end;//try..finally
  finally
   l_Visualizer := nil;
  end;//try..finally
  case anExportKind of
   ekShell, ekActiveWord:
     if anExportKind  = ekShell then
      TnsToMSWordOp.Execute(l_Output.rName, mswekNewFile)
     else
      TnsToMSWordOp.Execute(l_Output.rName, mswekActiveWindow);
   ekEMail:
    try
     nsSendAttachedFile(l_Output.rName);
    except
     on EDefaultMailCLientAbsent do
      Say(err_DefaultMailCLientAbsent);
    end;
  else
   Assert(False);
  end;
 except
  on EStreamError do
  begin
   DeleteFile(l3PStr(l_Output.rName));
   Say(err_NotEnoughRoom, [ExtractFileName(l3PStr(l_Output.rName))]);
  end;
  on EOsError do
   Say(err_CannotCreateFile, [ExtractFileName(l3PStr(l_Output.rName))]);
 end;//try..except
//#UC END# *4C52FB46037A_497EE4EB00CB_impl*
end;//TPrimMedicFirmListForm.ListExport

procedure TPrimMedicFirmListForm.ListOpsWithTrialModeTest(const aParams: IvcmTestParamsPrim);
//#UC START# *4C52FB790374_497EE4EB00CB_var*
//#UC END# *4C52FB790374_497EE4EB00CB_var*
begin
//#UC START# *4C52FB790374_497EE4EB00CB_impl*
 ListOpsTest(aParams);
 nsDisableOperationInTrialMode(aParams);
//#UC END# *4C52FB790374_497EE4EB00CB_impl*
end;//TPrimMedicFirmListForm.ListOpsWithTrialModeTest

procedure TPrimMedicFirmListForm.ListOpsTest(const aParams: IvcmTestParamsPrim);
//#UC START# *4C52FBA30173_497EE4EB00CB_var*
//#UC END# *4C52FBA30173_497EE4EB00CB_var*
begin
//#UC START# *4C52FBA30173_497EE4EB00CB_impl*
 aParams.Op.Flag[vcm_ofEnabled] := Assigned(dsMedicFirmList) and
  ListTree.TreeView.Tree.Root.HasChild and (ListTree.TreeView.Current >= 0);
//#UC END# *4C52FBA30173_497EE4EB00CB_impl*
end;//TPrimMedicFirmListForm.ListOpsTest

function TPrimMedicFirmListForm.MakePreview(WithTexts: Boolean): IafwComplexDocumentPreview;
//#UC START# *4C52FCFD0242_497EE4EB00CB_var*
var
 l_Node: Il3SimpleNode;
 l_Super: InsSuperComplexDocumentPreview;
//#UC END# *4C52FCFD0242_497EE4EB00CB_var*
begin
//#UC START# *4C52FCFD0242_497EE4EB00CB_impl*
 Result := nil;
 if Assigned(dsMedicFirmList) then
 begin
  l_Super := dsMedicFirmList.MakeSuperPreview(ListTree.TreeSTruct, WithTexts);
  if (l_Super <> nil) and (l_Super.DocumentTitles <> nil) and (l_Super.DocumentTitles.Document <> nil) and
   Supports(ListTree.TreeView.CurrentNode, Il3SimpleNode, l_Node) then
   l_Super.DocumentTitles.Document.SetCurrentPagePara(dsMedicFirmList.GetNodeID(l_Node));
  Result := l_Super;
 end;//if Assigned(dsMedicFirmList) then
//#UC END# *4C52FCFD0242_497EE4EB00CB_impl*
end;//TPrimMedicFirmListForm.MakePreview

procedure TPrimMedicFirmListForm.SaveDialogCanClose(Sender: TObject;
  var CanClose: Boolean);
//#UC START# *4C52FD2B0136_497EE4EB00CB_var*
//#UC END# *4C52FD2B0136_497EE4EB00CB_var*
begin
//#UC START# *4C52FD2B0136_497EE4EB00CB_impl*
 with Sender as TnsSaveDIalog do
 begin
  if not afw.Application.IsInternal and (SaveListTarget = ns_sdlkContents) and (ApproxExportCount(SelectedOnlyChecked) > c_MaxDocumentInListLimit) then
  begin
   CanClose := False;
   Say(war_TryToExportTooManyDocs, [c_MaxDocumentInListLimit]);
  end;
  if (SaveListTarget = ns_sdlkTitles) and (ApproxExportCount(SelectedOnlyChecked) > c_MaxTotalDocumentInListLimit) then
   if not afw.Application.IsInternal or not afw.Settings.LoadBoolean(pi_List_ExportWORestrictions, dv_List_ExportWORestrictions) then
   begin
    CanClose := False;
    Say(war_TryToExportTooManyTotalDocs, [c_MaxTotalDocumentInListLimit]);
   end;
 end;
//#UC END# *4C52FD2B0136_497EE4EB00CB_impl*
end;//TPrimMedicFirmListForm.SaveDialogCanClose

function TPrimMedicFirmListForm.HasSelection: Boolean;
//#UC START# *4C52FE120029_497EE4EB00CB_var*
//#UC END# *4C52FE120029_497EE4EB00CB_var*
begin
//#UC START# *4C52FE120029_497EE4EB00CB_impl*
 Result := ListTree.TreeView.Tree.SelectedCount > 1;
//#UC END# *4C52FE120029_497EE4EB00CB_impl*
end;//TPrimMedicFirmListForm.HasSelection

function TPrimMedicFirmListForm.ApproxExportCount(aUseSelection: Boolean): Integer;
//#UC START# *4C764E150319_497EE4EB00CB_var*
//#UC END# *4C764E150319_497EE4EB00CB_var*
begin
//#UC START# *4C764E150319_497EE4EB00CB_impl*
 if aUseSelection then
  Result := ListTree.TreeView.Tree.SelectedCount
 else
  Result := ListTree.TreeView.Tree.Root.ThisChildrenCount;
//#UC END# *4C764E150319_497EE4EB00CB_impl*
end;//TPrimMedicFirmListForm.ApproxExportCount

procedure TPrimMedicFirmListForm.File_Print_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *49521D8E0295_497EE4EB00CBtest_var*
//#UC END# *49521D8E0295_497EE4EB00CBtest_var*
begin
//#UC START# *49521D8E0295_497EE4EB00CBtest_impl*
 ListOpsWithTrialModeTest(aParams);
//#UC END# *49521D8E0295_497EE4EB00CBtest_impl*
end;//TPrimMedicFirmListForm.File_Print_Test

procedure TPrimMedicFirmListForm.File_Print_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *49521D8E0295_497EE4EB00CBexec_var*
var
 l_Preview : IafwComplexDocumentPreview;
//#UC END# *49521D8E0295_497EE4EB00CBexec_var*
begin
//#UC START# *49521D8E0295_497EE4EB00CBexec_impl*
 l_Preview := MakePreview(False);
 if (l_Preview <> nil) then
  l_Preview.Print;
//#UC END# *49521D8E0295_497EE4EB00CBexec_impl*
end;//TPrimMedicFirmListForm.File_Print_Execute

procedure TPrimMedicFirmListForm.File_PrintDialog_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *495220DE0298_497EE4EB00CBtest_var*
//#UC END# *495220DE0298_497EE4EB00CBtest_var*
begin
//#UC START# *495220DE0298_497EE4EB00CBtest_impl*
 ListOpsWithTrialModeTest(aParams);
//#UC END# *495220DE0298_497EE4EB00CBtest_impl*
end;//TPrimMedicFirmListForm.File_PrintDialog_Test

procedure TPrimMedicFirmListForm.File_PrintDialog_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *495220DE0298_497EE4EB00CBexec_var*
var
 l_Preview : IafwComplexDocumentPreview;
//#UC END# *495220DE0298_497EE4EB00CBexec_var*
begin
//#UC START# *495220DE0298_497EE4EB00CBexec_impl*
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
 end;//if (afw.Application <> nil)...
//#UC END# *495220DE0298_497EE4EB00CBexec_impl*
end;//TPrimMedicFirmListForm.File_PrintDialog_Execute

procedure TPrimMedicFirmListForm.File_PrintPreview_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *495220F2033A_497EE4EB00CBtest_var*
//#UC END# *495220F2033A_497EE4EB00CBtest_var*
begin
//#UC START# *495220F2033A_497EE4EB00CBtest_impl*
 ListOpsWithTrialModeTest(aParams);
//#UC END# *495220F2033A_497EE4EB00CBtest_impl*
end;//TPrimMedicFirmListForm.File_PrintPreview_Test

procedure TPrimMedicFirmListForm.File_PrintPreview_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *495220F2033A_497EE4EB00CBexec_var*
//#UC END# *495220F2033A_497EE4EB00CBexec_var*
begin
//#UC START# *495220F2033A_497EE4EB00CBexec_impl*
 TdmStdRes.MakePreview(MakePreview(false));
//#UC END# *495220F2033A_497EE4EB00CBexec_impl*
end;//TPrimMedicFirmListForm.File_PrintPreview_Execute

procedure TPrimMedicFirmListForm.File_Save_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *495235F401C0_497EE4EB00CBtest_var*
//#UC END# *495235F401C0_497EE4EB00CBtest_var*
begin
//#UC START# *495235F401C0_497EE4EB00CBtest_impl*
 ListOpsWithTrialModeTest(aParams);
//#UC END# *495235F401C0_497EE4EB00CBtest_impl*
end;//TPrimMedicFirmListForm.File_Save_Test

procedure TPrimMedicFirmListForm.File_Save_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *495235F401C0_497EE4EB00CBexec_var*
//#UC END# *495235F401C0_497EE4EB00CBexec_var*
begin
//#UC START# *495235F401C0_497EE4EB00CBexec_impl*
 ListExport(ekDisk, HasSelection);
//#UC END# *495235F401C0_497EE4EB00CBexec_impl*
end;//TPrimMedicFirmListForm.File_Save_Execute

procedure TPrimMedicFirmListForm.File_ToMSWord_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *495238EB0160_497EE4EB00CBtest_var*
//#UC END# *495238EB0160_497EE4EB00CBtest_var*
begin
//#UC START# *495238EB0160_497EE4EB00CBtest_impl*
 ListOpsWithTrialModeTest(aParams);
 TnsToMSWordOp.Test(aParams);
//#UC END# *495238EB0160_497EE4EB00CBtest_impl*
end;//TPrimMedicFirmListForm.File_ToMSWord_Test

procedure TPrimMedicFirmListForm.File_ToMSWord_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *495238EB0160_497EE4EB00CBexec_var*
var
 l_ExportSelection : Boolean;
const
 cMap: array [Boolean] of TnsExportKind = (ekShell, ekActiveWord);
//#UC END# *495238EB0160_497EE4EB00CBexec_var*
begin
//#UC START# *495238EB0160_497EE4EB00CBexec_impl*
 l_ExportSelection := HasSelection;
 // �������������� ���������� ��������� � Word
 if (l_ExportSelection) then
  case MessageDlg(str_ListExportSelectionToWord) of
    -1:
     // - ���������
     ;
    -2:
     l_ExportSelection := False;
    mrCancel:
     Exit;
  end;

 if (ApproxExportCount(l_ExportSelection) > c_MaxTotalDocumentInListLimit) then
  if not afw.Application.IsInternal or not afw.Settings.LoadBoolean(pi_List_ExportWORestrictions, dv_List_ExportWORestrictions) then
  begin
   Say(war_TryToExportTooManyTotalDocs, [c_MaxTotalDocumentInListLimit]);
   Exit;
  end;

 ListExport(cMap[aParams.ItemIndex>1], l_ExportSelection);
//#UC END# *495238EB0160_497EE4EB00CBexec_impl*
end;//TPrimMedicFirmListForm.File_ToMSWord_Execute

procedure TPrimMedicFirmListForm.File_SendMailAsAttachment_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *495253870002_497EE4EB00CBtest_var*
//#UC END# *495253870002_497EE4EB00CBtest_var*
begin
//#UC START# *495253870002_497EE4EB00CBtest_impl*
 ListOpsWithTrialModeTest(aParams);
//#UC END# *495253870002_497EE4EB00CBtest_impl*
end;//TPrimMedicFirmListForm.File_SendMailAsAttachment_Test

procedure TPrimMedicFirmListForm.File_SendMailAsAttachment_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *495253870002_497EE4EB00CBexec_var*
var
 l_ExportSelection : Boolean;
//#UC END# *495253870002_497EE4EB00CBexec_var*
begin
//#UC START# *495253870002_497EE4EB00CBexec_impl*
 l_ExportSelection := HasSelection;
 // �������������� ���������� ��������� � Word
 if (l_ExportSelection) then
  case MessageDlg(str_ListEMailSelection) of
    -1:
     ; // ���������
    -2:
     l_ExportSelection := False;
    mrCancel:
     Exit;
  end;
 ListExport(ekEMail, l_ExportSelection);
//#UC END# *495253870002_497EE4EB00CBexec_impl*
end;//TPrimMedicFirmListForm.File_SendMailAsAttachment_Execute

procedure TPrimMedicFirmListForm.Tree_ExpandAll_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4BDAF7880236_497EE4EB00CBtest_var*
//#UC END# *4BDAF7880236_497EE4EB00CBtest_var*
begin
//#UC START# *4BDAF7880236_497EE4EB00CBtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := False;
//#UC END# *4BDAF7880236_497EE4EB00CBtest_impl*
end;//TPrimMedicFirmListForm.Tree_ExpandAll_Test

procedure TPrimMedicFirmListForm.Tree_CollapseAll_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4BDAF7A2005C_497EE4EB00CBtest_var*
//#UC END# *4BDAF7A2005C_497EE4EB00CBtest_var*
begin
//#UC START# *4BDAF7A2005C_497EE4EB00CBtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := False;
//#UC END# *4BDAF7A2005C_497EE4EB00CBtest_impl*
end;//TPrimMedicFirmListForm.Tree_CollapseAll_Test

{$If not defined(NoVCM)}
procedure TPrimMedicFirmListForm.NotifyDataSourceChanged(const anOld: IvcmViewAreaController;
  const aNew: IvcmViewAreaController);
//#UC START# *497469C90140_497EE4EB00CB_var*
//#UC END# *497469C90140_497EE4EB00CB_var*
begin
//#UC START# *497469C90140_497EE4EB00CB_impl*
 // ��������, ��� � ������� ����� �������� �� ����� ���� ��� ���, � ���������
 // ��������� ���� ��� ��������� ������� �� ����
 if (dsMedicFirmList <> nil) then
 begin
  // ����� ����� � �������� �������
  //if not aFromHistory then
  begin
   ListTree.TreeStruct := dsMedicFirmList.SimpleTree;
   ContextFilter.AssignState(dsMedicFirmList.CurrentContextFilter);
  end;//if not aFromHistory then
 end;//dsMedicFirmList <> nil
 ContextFilter.UpdateIsContextWrong;
//#UC END# *497469C90140_497EE4EB00CB_impl*
end;//TPrimMedicFirmListForm.NotifyDataSourceChanged
{$IfEnd} //not NoVCM

{$If not defined(NoVCM)}
procedure TPrimMedicFirmListForm.DoInit(aFromHistory: Boolean);
//#UC START# *49803F5503AA_497EE4EB00CB_var*
//#UC END# *49803F5503AA_497EE4EB00CB_var*
begin
//#UC START# *49803F5503AA_497EE4EB00CB_impl*
 inherited;
 ListTree.Images := dmStdRes.SmallImageList;
 ContextFilter.Images := dmStdRes.SmallImageList;
 UpdateStatusInfo;
//#UC END# *49803F5503AA_497EE4EB00CB_impl*
end;//TPrimMedicFirmListForm.DoInit
{$IfEnd} //not NoVCM

{$If not defined(NoVCM)}
procedure TPrimMedicFirmListForm.InitControls;
//#UC START# *4A8E8F2E0195_497EE4EB00CB_var*
//#UC END# *4A8E8F2E0195_497EE4EB00CB_var*
begin
//#UC START# *4A8E8F2E0195_497EE4EB00CB_impl*
 ActiveControl := ListTree;
 with BackgroundPanel do
 begin
  Align := alClient;
  BevelOuter := bvNone;
  TabOrder := 0;
 end;
 with ContextFilter do
 begin
  ImageIndex := 77;
  ContextFilterTarget := ListTree;
  OnChange := ContextFilterChange;
  OnWrongContext := ContextFilterWrongContext;
 end;
 with ListTree do
 begin
  TabOrder := 1;
  Align := alClient;
  BorderStyle := bsNone;
  ActionElementMode := l3_amSecondSingleClick;
  NeedStatus := True;
  OnGetItemImage := ListTreeGetItemImage;
  OnActionElement := ListTreeActionElement;
  OnCurrentChanged := ListTreeCurrentChanged;
  OnTreeChanged := ListTreeTreeChanged;
  OnSelectCountChanged := ListTreeSelectCountChanged;
  OnFormatStatusInfo := ListTreeFormatStatusInfo;
  OnNewCharPressed := ListTreeNewCharPressed;
  OnCountChanged := ListTreeCountChanged;
 end;
//#UC END# *4A8E8F2E0195_497EE4EB00CB_impl*
end;//TPrimMedicFirmListForm.InitControls
{$IfEnd} //not NoVCM

{$If not defined(NoVCM)}
procedure TPrimMedicFirmListForm.FocusIsSetToUs;
//#UC START# *4F7C6D6801F4_497EE4EB00CB_var*
//#UC END# *4F7C6D6801F4_497EE4EB00CB_var*
begin
//#UC START# *4F7C6D6801F4_497EE4EB00CB_impl*
 if ListTree.CanFocus then
  ListTree.SetFocus;
//#UC END# *4F7C6D6801F4_497EE4EB00CB_impl*
end;//TPrimMedicFirmListForm.FocusIsSetToUs
{$IfEnd} //not NoVCM

procedure TPrimMedicFirmListForm.SignalDataSourceChanged(const anOld : IvcmViewAreaController;
 const aDsNew : IvcmViewAreaController);
begin
 inherited;
 if (aDsNew = nil) then
 begin
  dsMedicFirmList := nil;
 end//aDsNew = nil
 else
 begin
  Supports(aDsNew, IdsMedicFirmList, dsMedicFirmList);
 end;//aDsNew = nil
end;

procedure TPrimMedicFirmListForm.InitEntities;
begin
 inherited;
 with Entities.Entities do
 begin
  PublishFormEntity(en_File, nil);
  PublishFormEntity(en_Tree, nil);
  PublishFormEntity(en_Document, nil);
  MakeEntitySupportedByControl(en_Document, ListTree);
  PublishFormEntity(en_LocalList, nil);
  MakeEntitySupportedByControl(en_LocalList, ListTree);
  MakeEntitySupportedByControl(en_Tree, ListTree);
  MakeEntitySupportedByControl(en_Document, ListTree);
  PublishOp(en_File, op_Print, File_Print_Execute, File_Print_Test, nil);
  ShowInContextMenu(en_File, op_Print, false);
  ShowInToolbar(en_File, op_Print, false);
  PublishOp(en_File, op_PrintDialog, File_PrintDialog_Execute, File_PrintDialog_Test, nil);
  ShowInContextMenu(en_File, op_PrintDialog, false);
  ShowInToolbar(en_File, op_PrintDialog, false);
  PublishOp(en_File, op_PrintPreview, File_PrintPreview_Execute, File_PrintPreview_Test, nil);
  ShowInContextMenu(en_File, op_PrintPreview, false);
  ShowInToolbar(en_File, op_PrintPreview, false);
  PublishOp(en_File, op_Save, File_Save_Execute, File_Save_Test, nil);
  ShowInContextMenu(en_File, op_Save, false);
  ShowInToolbar(en_File, op_Save, false);
  PublishOp(en_File, op_ToMSWord, File_ToMSWord_Execute, File_ToMSWord_Test, nil);
  ShowInContextMenu(en_File, op_ToMSWord, false);
  ShowInToolbar(en_File, op_ToMSWord, true);
  PublishOp(en_File, op_SendMailAsAttachment, File_SendMailAsAttachment_Execute, File_SendMailAsAttachment_Test, nil, true);
  ShowInContextMenu(en_File, op_SendMailAsAttachment, false, true);
  ShowInToolbar(en_File, op_SendMailAsAttachment, false, true);
  PublishOp(en_Tree, op_ExpandAll, nil, Tree_ExpandAll_Test, nil);
  PublishOp(en_Tree, op_CollapseAll, nil, Tree_CollapseAll_Test, nil);
 end;//with Entities.Entities
end;

procedure TPrimMedicFirmListForm.MakeControls;
begin
 inherited;
 with AddUsertype(mflMainName,
  str_mflMainCaption,
  str_mflMainCaption,
  true,
  178,
  -1,
  '',
  nil,
  nil,
  nil,
  vcm_ccNone) do
 begin
 end;//with AddUsertype(mflMainName
 f_BackgroundPanel := TvtPanel.Create(Self);
 f_BackgroundPanel.Name := 'BackgroundPanel';
 f_BackgroundPanel.Parent := Self;
 f_ContextFilter := TnscContextFilter.Create(Self);
 f_ContextFilter.Name := 'ContextFilter';
 f_ContextFilter.Parent := BackgroundPanel;
 f_ListTree := TnscTreeView.Create(Self);
 f_ListTree.Name := 'ListTree';
 f_ListTree.Parent := BackgroundPanel;
end;

{$IfEnd} //not Admin AND not Monitorings

initialization
{$If not defined(Admin) AND not defined(Monitorings)}
// ������������� str_mflMainCaption
 str_mflMainCaption.Init;
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimMedicFirmList_Control_BackgroundPanel
 Tkw_PrimMedicFirmList_Control_BackgroundPanel.Register('�������::BackgroundPanel', TvtPanel);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimMedicFirmList_Control_BackgroundPanel_Push
 Tkw_PrimMedicFirmList_Control_BackgroundPanel_Push.Register('�������::BackgroundPanel:push');
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimMedicFirmList_Control_ContextFilter
 Tkw_PrimMedicFirmList_Control_ContextFilter.Register('�������::ContextFilter', TnscContextFilter);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimMedicFirmList_Control_ContextFilter_Push
 Tkw_PrimMedicFirmList_Control_ContextFilter_Push.Register('�������::ContextFilter:push');
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimMedicFirmList_Control_ListTree
 Tkw_PrimMedicFirmList_Control_ListTree.Register('�������::ListTree', TnscTreeView);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimMedicFirmList_Control_ListTree_Push
 Tkw_PrimMedicFirmList_Control_ListTree_Push.Register('�������::ListTree:push');
{$IfEnd} //not Admin AND not Monitorings

end.