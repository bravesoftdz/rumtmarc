unit Diff_Form;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "View"
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/View/Editions/Forms/Diff_Form.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<VCMForm::Class>> F1 ���������������� �������::CompareEditions::View::Editions::Diff
//
// ����� ��� ����������� ����������� ���������
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
  k2Interfaces,
  l3TreeInterfaces,
  l3Tree_TLB,
  nevTools,
  Controls,
  ExtCtrls,
  evEditorInterfaces,
  eeInterfaces
  {$If not defined(NoVCM)}
  ,
  vcmEntityForm
  {$IfEnd} //not NoVCM
  ,
  evSubWaiter,
  EditionsInterfaces,
  Base_Operations_Editions_Controls,
  vtPanel,
  vtComboBoxQS,
  CompareEditions_Controls,
  vtFocusLabel,
  BaseSearchInterfaces,
  ImgList,
  bsTypesNew
  {$If not defined(NoScripts)}
  ,
  kwBynameControlPush
  {$IfEnd} //not NoScripts
  
  {$If not defined(NoScripts)}
  ,
  tfwControlString
  {$IfEnd} //not NoScripts
  ,
  Base_Operations_View_Controls,
  Search_Strange_Controls,
  vcmExternalInterfaces {a},
  vcmInterfaces {a},
  nevBase,
  evCustomEditorWindow,
  ExternalOperationUnit,
  afwInterfaces,
  nevGUIInterfaces,
  afwNavigation,
  nevNavigation,
  NavigationInterfaces,
  DocumentInterfaces,
  l3Interfaces,
  l3InternalInterfaces,
  k2TagGen,
  k2CustomFileGenerator,
  l3BaseStream,
  DocumentAndListInterfaces
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
  nsTypes,
  Base_Operations_Strange_Controls,
  Common_Strange_Controls,
  vcmControllers {a},
  OfficeLike_Text_Controls,
  PrimBaseSearchInterfaces,
  UnderControlInterfaces,
  l3LongintList,
  nsFoundBlocksList
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}
type
 TnsCompareEditionKind = (
   cekOld
 , cekActual
 , cekNew
 );//TnsCompareEditionKind

 _DocumentPresentation_Parent_ = TvcmEntityForm;
 {$Include w:\garant6x\implementation\Garant\GbaNemesis\View\DocumentPresentation.imp.pas}
 _TextWithComments_Parent_ = _DocumentPresentation_;
 {$Include w:\garant6x\implementation\Garant\GbaNemesis\View\TextWithComments.imp.pas}
 _HyperlinkProcessorWithOwnLocalLink_Parent_ = _TextWithComments_;
 {$Include w:\garant6x\implementation\Garant\GbaNemesis\View\HyperlinkProcessorWithOwnLocalLink.imp.pas}
 _BaseSearchPresentation_Parent_ = _HyperlinkProcessorWithOwnLocalLink_;
 {$Include w:\garant6x\implementation\Garant\GbaNemesis\View\BaseSearchPresentation.imp.pas}
 _BaseTextOperations_Parent_ = _BaseSearchPresentation_;
 {$Include w:\garant6x\implementation\Garant\GbaNemesis\View\BaseTextOperations.imp.pas}
 _DocumentBaseSearcher_Parent_ = _BaseTextOperations_;
 {$Include w:\garant6x\implementation\Garant\GbaNemesis\View\DocumentBaseSearcher.imp.pas}
 _UnderControlResetter_Parent_ = _DocumentBaseSearcher_;
 {$Include w:\garant6x\implementation\Garant\GbaNemesis\View\UnderControlResetter.imp.pas}
 _BlockSelector_Parent_ = _UnderControlResetter_;
 {$Include w:\garant6x\implementation\Garant\GbaNemesis\View\BlockSelector.imp.pas}
 _HyperlinkProcessorForDocumentCompare_Parent_ = _BlockSelector_;
 {$Include w:\garant6x\implementation\Garant\GbaNemesis\View\HyperlinkProcessorForDocumentCompare.imp.pas}
 _HyperlinkOperations_Parent_ = _HyperlinkProcessorForDocumentCompare_;
 {$Include w:\garant6x\implementation\Garant\GbaNemesis\View\HyperlinkOperations.imp.pas}
 TDiffForm = {abstract form} class(_HyperlinkOperations_, InsBaseSearchPresentation, InsVScrollListner, InsEditionListner)
  {* ����� ��� ����������� ����������� ��������� }
 private
 // private fields
   f_InVScroll : Boolean;
   VScrollController : InsVScrollController;
   f_PrevPara : Integer;
    {* ���������� ������� ��������}
   f_PrevBlock : IevDocumentPart;
   f_InSearch : Boolean;
    {* ��������� ������ �������� ������}
   f_InOpenEditionLink : Boolean;
   f_PrevLine : Integer;
   f_ForceDrawFocusRectMoment : Cardinal;
    {* ������ ���������� ForceDrawFocusRect � true}
   f_WasInitedByChangedPara : Boolean;
   f_Header : TvtPanel;
    {* ���� ��� �������� Header}
   f_pnLeft : TvtPanel;
    {* ���� ��� �������� pnLeft}
   f_EditionLink : TvtFocusLabel;
    {* ���� ��� �������� EditionLink}
   f_pbIcon : TPaintBox;
    {* ���� ��� �������� pbIcon}
   f_pnCaption : TvtPanel;
    {* ���� ��� �������� pnCaption}
   f_EditionChoose : TvtComboBoxQS;
    {* ���� ��� �������� EditionChoose}
 protected
  procedure SignalDataSourceChanged(const anOld : IvcmViewAreaController;
                                const aDsNew : IvcmViewAreaController); override;
  procedure InitEntities; override;
  procedure MakeControls; override;
 private
 // private methods
   procedure MakeDocumentContainer(Sender: TObject;
     var aMade: InevDocumentContainer);
     {* ������ ��������� ��������� }
   procedure VScroll(aSender: TObject);
     {* ���������� ������������� ��������� }
   procedure UpdateCaptionFromDS;
     {* ��������� ��������� ����� }
   procedure OpenEditionInFullWindow(aSender: TObject);
     {* ������� �������� � ������ ���� }
   function GotoPara(aPara: Integer): TGotoParaResult;
   procedure PaintIcon(aSender: TObject);
   procedure ParaChange(aSender: TObject;
     const aTextPara: IedTextParagraph);
     {* ������� �������� �������� }
   procedure SignalParaChange;
   function EditionChooseGetItemImage(Sender: TObject;
     Index: Integer;
     var aImages: TCustomImageList): integer;
   procedure UpdateEditionsChoose;
     {* ��������� ������ �������� }
   procedure ChoosenEditionChanged(aSender: TObject);
     {* ������� ������ �������� }
   procedure CaptionResize(aSender: TObject);
   function CalcEditionKind: TnsCompareEditionKind;
   procedure UpdateIconHint;
   procedure SyncWithCursor(const aCursor: InevBasePoint;
     NeedCheckLine: Boolean);
     {* ���������������� ������ ���� � ��������� �������� }
   procedure DocumentTextChanged(aSender: TObject;
     const anOldDocument: Ik2Tag;
     const aNewDocument: Ik2Tag);
 protected
 // property methods
   function pm_GetHeader: TvtPanel;
   function pm_GetPnLeft: TvtPanel;
   function pm_GetEditionLink: TvtFocusLabel;
   function pm_GetPnCaption: TvtPanel;
 protected
 // realized methods
   function WindowRequired: Boolean;
   function WindowCloseable: Boolean;
   function CanCloseWindow: Boolean;
   function IsQueryCard: Boolean;
   function TreatSuccessSearchAsManualOpen: Boolean;
   function AutoActivateWindow: Boolean;
   function DocumentIsValid: Boolean; override;
     {* ���� �� ��������, ������� � ������ }
   procedure GotoPoint(aPointID: Cardinal;
    aPointType: TDocumentPositionType = dptSub); override;
     {* ������� �� ����� � ��������� }
   function HyperlinkDocument: IDocument; override;
     {* �������� �� �������� ���� ������ }
   function pm_GetHyperlinkText: TevCustomEditorWindow; override;
   procedure EditionChanged;
   function IsFloating: Boolean; override;
     {* ����� ��������� }
   function pm_GetTextWithComments: TevCustomEditorWindow; override;
   function Get_ContainerForBaseSearch: TnsContainerForBaseSearchInfo;
   function Get_ContextSearcher: InsContextSearcher;
   function Finder_GotoPara_Execute(aPara: Integer): TGotoParaResult;
     {* ������� � ��������� �� ������ }
   procedure Finder_GotoPara(const aParams: IvcmExecuteParams);
     {* ������� � ��������� �� ������ }
   function DocumentForExport: IDocument; override;
   function pm_GetHasDoc: Boolean; override;
   function IsDrug: Boolean; override;
   function Document_SetPosition_Execute(aPointID: Cardinal;
    aPointType: TDocumentPositionType = dptSub;
    aUserType: Integer = 0): Boolean;
   procedure Document_SetPosition(const aParams: IvcmExecuteParams);
   procedure Document_OpenEditionLocalLink_Execute(const aDocument: IDocument;
    aSub: Cardinal);
     {* ������� �� ��������� ������ �� �������� }
   procedure Document_OpenEditionLocalLink(const aParams: IvcmExecuteParams);
     {* ������� �� ��������� ������ �� �������� }
   function DocumentForSearch: IDocument; override;
   procedure Finder_DisableForceDrawFocusRect_Execute;
     {* ��������� ��������� �������� ����� }
   procedure Finder_DisableForceDrawFocusRect(const aParams: IvcmExecuteParams);
     {* ��������� ��������� �������� ����� }
   function CanUnControl: Boolean; override;
   function NeedGotoNeighbours: Boolean; override;
     {* ���� �� ���������� �� ������� ����� }
   function Get_NeedSaveActiveClassBeforeSearch: Boolean;
 public
 // realized methods
   procedure Sync(const aPara: TnsParaCoord);
     {* ���������������� ������� }
   procedure CurrentChangedFragmentChanged(aParaID: Integer);
     {* ���������� ��������� �������� ����������� ���������. ĸ����� � ��������� ������ ��� ��������. aParaID == GetParaForPositionning }
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* ������� ������� ����� �������. }
   procedure InitFields; override;
   procedure Loaded; override;
   {$If not defined(NoVCM)}
   procedure NotifyDataSourceChanged(const anOld: IvcmViewAreaController;
    const aNew: IvcmViewAreaController); override;
     {* ��������� �������� ������. ��� ���������� � �������� }
   {$IfEnd} //not NoVCM
   function DoProcessLocalLink(const aDocument: IDocument;
    aPointType: TDocumentPositionType;
    aSub: Cardinal): Boolean; override;
     {* ��������� ��������� ������ }
   procedure OpenRedactionLocalLink(const aDocument: IDocument;
    aSub: Cardinal); override;
     {* ��������� ��������� ������ �� ������ �������� }
   {$If not defined(NoVCM)}
   procedure InitControls; override;
     {* ��������� ������������� ���������. ��� ���������� � �������� }
   {$IfEnd} //not NoVCM
   function ContinueSearchInWholeBase: Boolean; override;
 public
 // overridden public methods
   {$If not defined(NoVCM)}
   function NeedDrawCaption: Boolean; override;
     {* ����� �� �������� ��������� ���� }
   {$IfEnd} //not NoVCM
 protected
 // protected fields
   EditionDiff : IdsEditionDiff;
    {* ��������� ��������� ��������}
   f_InChoosenEditionChanged : Boolean;
   CompareEditions : IsdsCompareEditions;
    {* ��������� ��������� ��������}
   f_WasInitedByDocPos : Boolean;
 protected
 // protected methods
   procedure ReturnToDocument;
     {* ��������� � �������� }
   function IsRight: Boolean;
     {* ����� �������� ������� ��������� (������) }
   procedure SetFocusToText;
     {* ������������� ����� ������ }
   function IsParaCurrent(aPara: Integer): Boolean;
     {* �������� �������� ������� }
   function Document: IDocument;
   function GetInitialDocumentPosition: TbsDocPos; virtual;
   procedure LinkWaiter(const aMade: InevDocumentContainer); virtual;
     {* ���������� Waiter'� � ���������� ��������� }
   procedure SignalEditionChanged; virtual;
     {* ��������� � ����� �������� }
   function EditionsChooseRoot: Il3Node; virtual; abstract;
   procedure DoEditionChanged(anEditionID: TRedactionID); virtual; abstract;
 public
 // public properties
   property Header: TvtPanel
     read pm_GetHeader;
     {* ����� ��� ����� �������� }
   property pnLeft: TvtPanel
     read pm_GetPnLeft;
   property EditionLink: TvtFocusLabel
     read pm_GetEditionLink;
     {* ������ �� �������� }
   property pbIcon: TPaintBox
     read f_pbIcon;
   property pnCaption: TvtPanel
     read pm_GetPnCaption;
   property EditionChoose: TvtComboBoxQS
     read f_EditionChoose;
 end;//TDiffForm

 TvcmEntityFormRef = TDiffForm;
{$IfEnd} //not Admin AND not Monitorings

implementation

{$If not defined(Admin) AND not defined(Monitorings)}
uses
  evTypes,
  deDocInfo,
  EditionsRes_Form,
  nsEditionsUtils,
  l3Nodes,
  nsEditionNodes,
  LeafPara_Const,
  k2Tags,
  eePara,
  evEditorWithOperations,
  Graphics,
  Classes
  {$If not defined(NoVCM)}
  ,
  vcmUserControls
  {$IfEnd} //not NoVCM
  ,
  Forms,
  evOp,
  Block_Const,
  DocumentRes,
  l3ControlsTypes,
  ctTypes,
  evdTypes,
  Document_Const,
  afwVCL,
  TableCell_Const
  {$If not defined(NoScripts)}
  ,
  tfwScriptingInterfaces
  {$IfEnd} //not NoScripts
  
  {$If not defined(NoVCM)}
  ,
  StdRes
  {$IfEnd} //not NoVCM
  ,
  DataAdapter,
  vtUtils,
  evdStyles,
  BitmapPara_Const,
  nsConst,
  afwFacade,
  SysUtils
  {$If not defined(NoVCM)}
  ,
  vcmBase
  {$IfEnd} //not NoVCM
  ,
  nsHyperLinkProcessor,
  nsOpenUtils,
  l3Base,
  l3InterfacesMisc,
  evdBlockNameAdder,
  nsDocumentTools,
  Windows,
  PresentationInterfaces,
  nsExternalObject,
  bsUtils,
  l3Stream,
  l3Types,
  nsToMSWordOp,
  l3String,
  nsTrialSupport,
  FoldersDomainInterfaces
  {$If not defined(NoVCM)}
  ,
  vcmMessagesSupport
  {$IfEnd} //not NoVCM
  ,
  Printers,
  nsExportToFileEvent,
  nsExportToWordEvent,
  nsSendDocumentByEMailEvent,
  nsDocumentPrintPreviewEvent,
  nsBaseTextOperationsConst,
  f1MultylinkResolver,
  nsQuestions,
  nsExternalObjectModelPart,
  eeInterfacesEx,
  eeParaTools,
  bsDocumentContextSearcher,
  nsSearchInDocumentEvent,
  BaseTypesUnit,
  Common_FormDefinitions_Controls,
  f1TextStyle_Const,
  TextSegment_Const,
  StyledLeafPara_Const,
  evSegLst,
  evCustomEditor
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}

type _Instance_R_ = TDiffForm;

{$Include w:\garant6x\implementation\Garant\GbaNemesis\View\DocumentPresentation.imp.pas}


{$Include w:\garant6x\implementation\Garant\GbaNemesis\View\TextWithComments.imp.pas}


{$Include w:\garant6x\implementation\Garant\GbaNemesis\View\HyperlinkProcessorWithOwnLocalLink.imp.pas}


{$Include w:\garant6x\implementation\Garant\GbaNemesis\View\BaseSearchPresentation.imp.pas}


{$Include w:\garant6x\implementation\Garant\GbaNemesis\View\BaseTextOperations.imp.pas}


{$Include w:\garant6x\implementation\Garant\GbaNemesis\View\DocumentBaseSearcher.imp.pas}


{$Include w:\garant6x\implementation\Garant\GbaNemesis\View\UnderControlResetter.imp.pas}


{$Include w:\garant6x\implementation\Garant\GbaNemesis\View\BlockSelector.imp.pas}

{$Include w:\garant6x\implementation\Garant\GbaNemesis\View\HyperlinkProcessorForDocumentCompare.imp.pas}

{$Include w:\garant6x\implementation\Garant\GbaNemesis\View\HyperlinkOperations.imp.pas}

const
   { Constants }
  cWaitDelta = 300;

type
  TnsChangedParaWaiter = class(TevSubWaiter)
   {* ������, �������������� ������� �� ���������� �������� }
  private
  // private fields
   f_Form : TDiffForm;
  protected
  // overridden protected methods
   function TrySelectPara(const aContainer: InevDocumentContainer;
    const aSel: InevSelection;
    aParaID: Integer): Boolean; override;
  public
  // public methods
   constructor Create(aForm: TDiffForm;
      aParaID: Integer); reintroduce;
   class function Make(aForm: TDiffForm;
      aParaID: Integer): InevWaiter; reintroduce;
     {* ��������� ������� TnsChangedParaWaiter.Make }
  end;//TnsChangedParaWaiter

// start class TnsChangedParaWaiter

constructor TnsChangedParaWaiter.Create(aForm: TDiffForm;
  aParaID: Integer);
//#UC START# *4BFFA1990245_4BFFA13500E1_var*
//#UC END# *4BFFA1990245_4BFFA13500E1_var*
begin
//#UC START# *4BFFA1990245_4BFFA13500E1_impl*
 inherited Create(aForm.Text, aParaID, ev_sbtPara);
 f_Form := aForm;
//#UC END# *4BFFA1990245_4BFFA13500E1_impl*
end;//TnsChangedParaWaiter.Create

class function TnsChangedParaWaiter.Make(aForm: TDiffForm;
  aParaID: Integer): InevWaiter;
var
 l_Inst : TnsChangedParaWaiter;
begin
 l_Inst := Create(aForm, aParaID);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

function TnsChangedParaWaiter.TrySelectPara(const aContainer: InevDocumentContainer;
  const aSel: InevSelection;
  aParaID: Integer): Boolean;
//#UC START# *4BFFA0FF01D2_4BFFA13500E1_var*
//#UC END# *4BFFA0FF01D2_4BFFA13500E1_var*
begin
//#UC START# *4BFFA0FF01D2_4BFFA13500E1_impl*
 Result := (f_Form.GotoPara(aParaID) <> gtprFail); 
//#UC END# *4BFFA0FF01D2_4BFFA13500E1_impl*
end;//TnsChangedParaWaiter.TrySelectPara

type
  THackWinControl = {abstract} class(TWinControl)
  end;//THackWinControl

  TvtComboBoxQSHack = {abstract} class(TvtComboBoxQS)
  end;//TvtComboBoxQSHack

  Tkw_Diff_Control_Header = class(TtfwControlString)
   {* ����� ������� ��� �������������� �������� Header
----
*������ �������������*:
[code]
�������::Header TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_Diff_Control_Header

// start class Tkw_Diff_Control_Header

{$If not defined(NoScripts)}
function Tkw_Diff_Control_Header.GetString: AnsiString;
 {-}
begin
 Result := 'Header';
end;//Tkw_Diff_Control_Header.GetString
{$IfEnd} //not NoScripts

type
  Tkw_Diff_Control_Header_Push = class(TkwBynameControlPush)
   {* ����� ������� ��� �������� Header
----
*������ �������������*:
[code]
�������::Header:push pop:control:SetFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_Diff_Control_Header_Push

// start class Tkw_Diff_Control_Header_Push

{$If not defined(NoScripts)}
procedure Tkw_Diff_Control_Header_Push.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString('Header');
 inherited;
end;//Tkw_Diff_Control_Header_Push.DoDoIt
{$IfEnd} //not NoScripts

type
  Tkw_Diff_Control_pnLeft = class(TtfwControlString)
   {* ����� ������� ��� �������������� �������� pnLeft
----
*������ �������������*:
[code]
�������::pnLeft TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_Diff_Control_pnLeft

// start class Tkw_Diff_Control_pnLeft

{$If not defined(NoScripts)}
function Tkw_Diff_Control_pnLeft.GetString: AnsiString;
 {-}
begin
 Result := 'pnLeft';
end;//Tkw_Diff_Control_pnLeft.GetString
{$IfEnd} //not NoScripts

type
  Tkw_Diff_Control_pnLeft_Push = class(TkwBynameControlPush)
   {* ����� ������� ��� �������� pnLeft
----
*������ �������������*:
[code]
�������::pnLeft:push pop:control:SetFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_Diff_Control_pnLeft_Push

// start class Tkw_Diff_Control_pnLeft_Push

{$If not defined(NoScripts)}
procedure Tkw_Diff_Control_pnLeft_Push.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString('pnLeft');
 inherited;
end;//Tkw_Diff_Control_pnLeft_Push.DoDoIt
{$IfEnd} //not NoScripts

type
  Tkw_Diff_Control_EditionLink = class(TtfwControlString)
   {* ����� ������� ��� �������������� �������� EditionLink
----
*������ �������������*:
[code]
�������::EditionLink TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_Diff_Control_EditionLink

// start class Tkw_Diff_Control_EditionLink

{$If not defined(NoScripts)}
function Tkw_Diff_Control_EditionLink.GetString: AnsiString;
 {-}
begin
 Result := 'EditionLink';
end;//Tkw_Diff_Control_EditionLink.GetString
{$IfEnd} //not NoScripts

type
  Tkw_Diff_Control_EditionLink_Push = class(TkwBynameControlPush)
   {* ����� ������� ��� �������� EditionLink
----
*������ �������������*:
[code]
�������::EditionLink:push pop:control:SetFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_Diff_Control_EditionLink_Push

// start class Tkw_Diff_Control_EditionLink_Push

{$If not defined(NoScripts)}
procedure Tkw_Diff_Control_EditionLink_Push.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString('EditionLink');
 inherited;
end;//Tkw_Diff_Control_EditionLink_Push.DoDoIt
{$IfEnd} //not NoScripts

type
  Tkw_Diff_Control_pbIcon = class(TtfwControlString)
   {* ����� ������� ��� �������������� �������� pbIcon
----
*������ �������������*:
[code]
�������::pbIcon TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_Diff_Control_pbIcon

// start class Tkw_Diff_Control_pbIcon

{$If not defined(NoScripts)}
function Tkw_Diff_Control_pbIcon.GetString: AnsiString;
 {-}
begin
 Result := 'pbIcon';
end;//Tkw_Diff_Control_pbIcon.GetString
{$IfEnd} //not NoScripts

type
  Tkw_Diff_Control_pbIcon_Push = class(TkwBynameControlPush)
   {* ����� ������� ��� �������� pbIcon
----
*������ �������������*:
[code]
�������::pbIcon:push pop:control:SetFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_Diff_Control_pbIcon_Push

// start class Tkw_Diff_Control_pbIcon_Push

{$If not defined(NoScripts)}
procedure Tkw_Diff_Control_pbIcon_Push.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString('pbIcon');
 inherited;
end;//Tkw_Diff_Control_pbIcon_Push.DoDoIt
{$IfEnd} //not NoScripts

type
  Tkw_Diff_Control_pnCaption = class(TtfwControlString)
   {* ����� ������� ��� �������������� �������� pnCaption
----
*������ �������������*:
[code]
�������::pnCaption TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_Diff_Control_pnCaption

// start class Tkw_Diff_Control_pnCaption

{$If not defined(NoScripts)}
function Tkw_Diff_Control_pnCaption.GetString: AnsiString;
 {-}
begin
 Result := 'pnCaption';
end;//Tkw_Diff_Control_pnCaption.GetString
{$IfEnd} //not NoScripts

type
  Tkw_Diff_Control_pnCaption_Push = class(TkwBynameControlPush)
   {* ����� ������� ��� �������� pnCaption
----
*������ �������������*:
[code]
�������::pnCaption:push pop:control:SetFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_Diff_Control_pnCaption_Push

// start class Tkw_Diff_Control_pnCaption_Push

{$If not defined(NoScripts)}
procedure Tkw_Diff_Control_pnCaption_Push.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString('pnCaption');
 inherited;
end;//Tkw_Diff_Control_pnCaption_Push.DoDoIt
{$IfEnd} //not NoScripts

type
  Tkw_Diff_Control_EditionChoose = class(TtfwControlString)
   {* ����� ������� ��� �������������� �������� EditionChoose
----
*������ �������������*:
[code]
�������::EditionChoose TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_Diff_Control_EditionChoose

// start class Tkw_Diff_Control_EditionChoose

{$If not defined(NoScripts)}
function Tkw_Diff_Control_EditionChoose.GetString: AnsiString;
 {-}
begin
 Result := 'EditionChoose';
end;//Tkw_Diff_Control_EditionChoose.GetString
{$IfEnd} //not NoScripts

type
  Tkw_Diff_Control_EditionChoose_Push = class(TkwBynameControlPush)
   {* ����� ������� ��� �������� EditionChoose
----
*������ �������������*:
[code]
�������::EditionChoose:push pop:control:SetFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_Diff_Control_EditionChoose_Push

// start class Tkw_Diff_Control_EditionChoose_Push

{$If not defined(NoScripts)}
procedure Tkw_Diff_Control_EditionChoose_Push.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString('EditionChoose');
 inherited;
end;//Tkw_Diff_Control_EditionChoose_Push.DoDoIt
{$IfEnd} //not NoScripts

procedure TDiffForm.MakeDocumentContainer(Sender: TObject;
  var aMade: InevDocumentContainer);
//#UC START# *4A785B8E009B_4A6EBE900233_var*
//#UC END# *4A785B8E009B_4A6EBE900233_var*
begin
//#UC START# *4A785B8E009B_4A6EBE900233_impl*
 aMade := EditionDiff.DocumentContainer;
 LinkWaiter(aMade);
//#UC END# *4A785B8E009B_4A6EBE900233_impl*
end;//TDiffForm.MakeDocumentContainer

procedure TDiffForm.VScroll(aSender: TObject);
//#UC START# *4A798D740347_4A6EBE900233_var*
var
 l_D : Cardinal;
//#UC END# *4A798D740347_4A6EBE900233_var*
var
 l_Cursor : InevBasePoint; // ������ �� ������ ������
begin
//#UC START# *4A798D740347_4A6EBE900233_impl*
 if not f_InVScroll AND (VScrollController <> nil) then
 begin
  f_InVScroll := true;
  try
   if not Text.ForceDrawFocusRect then
    Self.SignalParaChange
   else
   begin
    l_D := GetTickCount - f_ForceDrawFocusRectMoment;
    if (l_D >= cWaitDelta) then
     Self.SignalParaChange;
   end;//not Text.ForceDrawFocusRect
   if Text.GetTopCursor(l_Cursor) then
    SyncWithCursor(l_Cursor, true);
  finally
   f_InVScroll := false;
  end;//try..finally
 end;//not f_InVScroll
//#UC END# *4A798D740347_4A6EBE900233_impl*
end;//TDiffForm.VScroll

procedure TDiffForm.UpdateCaptionFromDS;
//#UC START# *4A83CDB902C2_4A6EBE900233_var*
//#UC END# *4A83CDB902C2_4A6EBE900233_var*
begin
//#UC START# *4A83CDB902C2_4A6EBE900233_impl*
 if (EditionDiff <> nil) then
  CCaption := EditionDiff.RedactionName;
//#UC END# *4A83CDB902C2_4A6EBE900233_impl*
end;//TDiffForm.UpdateCaptionFromDS

procedure TDiffForm.OpenEditionInFullWindow(aSender: TObject);
//#UC START# *4A9BAFD300BB_4A6EBE900233_var*
var
 l_Doc: IDocument;
 l_Para: IeeLeafPara;
//#UC END# *4A9BAFD300BB_4A6EBE900233_var*
begin
//#UC START# *4A9BAFD300BB_4A6EBE900233_impl*
 //ReturnToDocument;
 l_Doc := HyperlinkDocument;
 // http://mdp.garant.ru/pages/viewpage.action?pageId=477647712
 l_Para := GetParaForPositionning;
 if l_Doc.IsAlive then
  TdmStdRes.OpenDocument(TdeDocInfo.Make(l_Doc, TbsDocPos_C(dptPara, l_Para.ID)), nil);
 l_Doc := nil;
 l_Para := nil;
 (* TdmStdRes.OpenEntityAsDocument(l_Doc{HyperlinkDocument}, nil); *)
//#UC END# *4A9BAFD300BB_4A6EBE900233_impl*
end;//TDiffForm.OpenEditionInFullWindow

function TDiffForm.GotoPara(aPara: Integer): TGotoParaResult;
//#UC START# *4AE0421A018E_4A6EBE900233_var*
//#UC END# *4AE0421A018E_4A6EBE900233_var*
begin
//#UC START# *4AE0421A018E_4A6EBE900233_impl*
 Assert(not f_InSearch);
 f_InSearch := true;
 try
   if Text.ForceDrawFocusRect AND IsParaCurrent(aPara) then
   begin
    Result := gtprAlready;
    Text.ForceDrawFocusRect := true;
    f_ForceDrawFocusRectMoment := GetTickCount;
    Exit;
   end;//Text.ForceDrawFocusRect AND IsParaCurrent(aPara)
  if Text.GotoPara(aPara) then
  begin
   if IsParaCurrent(aPara) then
   // - �� ������ ����� �������� - �������, ���� ����� ����� ���������
   // http://mdp.garant.ru/pages/viewpage.action?pageId=208701209
    Result := gtprOk
   else
    Result := gtprFail;
  end//Text.GotoPara(aPara)
  else
   Result := gtprFail;
  if (Result = gtprOk) then
  begin
   Text.ScrollToCursor(Text.Selection.Cursor);
   //Text.Select(ev_stPara);
   SetFocusToText;
   Text.ForceDrawFocusRect := true;
   SyncWithCursor(Text.Selection.Cursor, false);
   // - ��� �.�. ����� �������� ��� http://mdp.garant.ru/pages/viewpage.action?pageId=205358039
   //   ���� - ���������, ����� ������ ������� �� ���������
   // !!! ������� ��� http://mdp.garant.ru/pages/viewpage.action?pageId=208701199
   f_ForceDrawFocusRectMoment := GetTickCount;
  end//Result
  else
   Text.ForceDrawFocusRect := false;
 finally
  f_InSearch := false;
 end;//try..finally
//#UC END# *4AE0421A018E_4A6EBE900233_impl*
end;//TDiffForm.GotoPara

procedure TDiffForm.PaintIcon(aSender: TObject);
//#UC START# *4B50A2E100B8_4A6EBE900233_var*

const
 cIconIndex: array [TnsCompareEditionKind] of integer = (
  1, //cekOld
  0, //cekActual
  2 //cekNew
 );
//#UC END# *4B50A2E100B8_4A6EBE900233_var*
begin
//#UC START# *4B50A2E100B8_4A6EBE900233_impl*
 with (aSender as TPaintBox) do
  TEditionsResForm.Instance.EditionsStateIcons.Draw(Canvas, Width - 32, (Height - 32) div 2, cIconIndex[CalcEditionKind]);
//#UC END# *4B50A2E100B8_4A6EBE900233_impl*
end;//TDiffForm.PaintIcon

procedure TDiffForm.ParaChange(aSender: TObject;
  const aTextPara: IedTextParagraph);
//#UC START# *4B547CBF0182_4A6EBE900233_var*
//#UC END# *4B547CBF0182_4A6EBE900233_var*
begin
//#UC START# *4B547CBF0182_4A6EBE900233_impl*
 if not f_InSearch then
  Text.ForceDrawFocusRect := false;
 if not f_InVScroll then
  SignalParaChange;
//#UC END# *4B547CBF0182_4A6EBE900233_impl*
end;//TDiffForm.ParaChange

procedure TDiffForm.SignalParaChange;
//#UC START# *4B547F9F029F_4A6EBE900233_var*
//#UC END# *4B547F9F029F_4A6EBE900233_var*
var
 l_Para : IeeLeafPara;
begin
//#UC START# *4B547F9F029F_4A6EBE900233_impl*
 if (VScrollController <> nil) then
 begin
  l_Para := GetParaForPositionning;
  if (l_Para <> nil) then
   if (l_Para.ID <> 0) then
    VScrollController.CurrentChangedFragmentChanged(l_Para.ID);
 end;//VScrollController <> nil
//#UC END# *4B547F9F029F_4A6EBE900233_impl*
end;//TDiffForm.SignalParaChange

function TDiffForm.EditionChooseGetItemImage(Sender: TObject;
  Index: Integer;
  var aImages: TCustomImageList): integer;
//#UC START# *4B2890E30181_4A6EBE900233_var*
//#UC END# *4B2890E30181_4A6EBE900233_var*
begin
//#UC START# *4B2890E30181_4A6EBE900233_impl*
 if (Index >= 0) then
  Result := NsCalcEditionImageIndex(EditionChoose.Tree.GetNode(Index), aImages, false)
 else
  Result := -1;
//#UC END# *4B2890E30181_4A6EBE900233_impl*
end;//TDiffForm.EditionChooseGetItemImage

procedure TDiffForm.UpdateEditionsChoose;
//#UC START# *4A84022E02F7_4A6EBE900233_var*

var
 l_Root : Il3Node;

 function FindEditionOnID(aRedactionID: TRedactionID): Il3Node;

  function FindNode(const anIntf: Il3Node): Boolean;
  var
   l_EditionNode : InsEditionNode;
  begin//FindNode
   Result := Supports(anIntf, InsEditionNode, l_EditionNode) and
             l_EditionNode.IsSameID(aRedactionID);
   l_EditionNode := nil;
  end;//FindNode

 begin//FindEditionOnID
  Result := l_Root.IterateF(l3L2NA(@FindNode), imCheckResult);
 end;//FindEditionOnID

var
 l_State : IDocumentState;
 l_Info  : TRedactionInfo; 
//#UC END# *4A84022E02F7_4A6EBE900233_var*
begin
//#UC START# *4A84022E02F7_4A6EBE900233_impl*
 if not f_InChoosenEditionChanged then
 begin
  f_InChoosenEditionChanged := true;
  try
   l_Root := EditionsChooseRoot;
   with EditionChoose do
   begin
    RootNode := l_Root;
    if (l_Root <> nil) then
     if (l_Root.Child <> nil) then
     begin
      HyperlinkDocument.GetCurrentState(l_State);
      l_State.GetCurrentRedaction(l_Info);
      CurrentNode := FindEditionOnID(l_Info.rId);
      //CurrentNode := l_Root.Child;
     end;//l_Root.Child <> nil
   end;//with EditionChoose
  finally
   f_InChoosenEditionChanged := false;
  end;//try..finally
 end;//not f_InChoosenEditionChanged
//#UC END# *4A84022E02F7_4A6EBE900233_impl*
end;//TDiffForm.UpdateEditionsChoose

procedure TDiffForm.ChoosenEditionChanged(aSender: TObject);
//#UC START# *4A8405A30085_4A6EBE900233_var*
//#UC END# *4A8405A30085_4A6EBE900233_var*
var
 l_Node : Il3SimpleNode;
begin
//#UC START# *4A8405A30085_4A6EBE900233_impl*
 if not f_InChoosenEditionChanged then
 begin
  l_Node := EditionChoose.CurrentNode;
  if (l_Node <> nil) then
   DoEditionChanged((l_Node As InsEditionNode).EditionID);
 end;//not f_InChoosenEditionChanged
//#UC END# *4A8405A30085_4A6EBE900233_impl*
end;//TDiffForm.ChoosenEditionChanged

procedure TDiffForm.CaptionResize(aSender: TObject);
//#UC START# *4B615A1F02B4_4A6EBE900233_var*
const
 cW = 10;
//#UC END# *4B615A1F02B4_4A6EBE900233_var*
begin
//#UC START# *4B615A1F02B4_4A6EBE900233_impl*
 with EditionChoose do
  afwSetBoundsWin2kFix(EditionChoose, Cw, Top, pnCaption.Width - 2 * cW, Height);
//#UC END# *4B615A1F02B4_4A6EBE900233_impl*
end;//TDiffForm.CaptionResize

function TDiffForm.CalcEditionKind: TnsCompareEditionKind;
//#UC START# *4B67F1DA011D_4A6EBE900233_var*
 var
  l_State : IDocumentState;
  l_Info  : TRedactionInfo;
//#UC END# *4B67F1DA011D_4A6EBE900233_var*
begin
//#UC START# *4B67F1DA011D_4A6EBE900233_impl*
 EditionDiff.Document.GetCurrentState(l_State);
 Assert(l_State <> nil);
 l_State.GetCurrentRedaction(l_Info);
 Case l_Info.rActualType of
  RT_ACTUAL,
  RT_ACTUAL_ABOLISHED,
  RT_ACTUAL_PREACTIVE:
   Result := cekActual;
  RT_OLD:
   Result := cekOld;
  RT_NEW,
  RT_NEW_ABOLISHED,
  RT_NEW_PREACTIVE:
   Result := cekNew;
  else
  begin
   Result := cekNew;
   Assert(false);
  end;//else
 end;//Case l_Info.rActualType
//#UC END# *4B67F1DA011D_4A6EBE900233_impl*
end;//TDiffForm.CalcEditionKind

procedure TDiffForm.UpdateIconHint;
//#UC START# *4B67F2200021_4A6EBE900233_var*
const
 cMap: array [TnsCompareEditionKind] of PvcmStringId = (
  @str_cekOld, // cekOld
  @str_cekActual, // cekActual
  @str_cekNew // cekNew
 );

//#UC END# *4B67F2200021_4A6EBE900233_var*
begin
//#UC START# *4B67F2200021_4A6EBE900233_impl*
 if (EditionDiff = nil) then
  pbIcon.Hint :=  ''
 else
  pbIcon.Hint := vcmConstString(cMap[CalcEditionKind]^);
//#UC END# *4B67F2200021_4A6EBE900233_impl*
end;//TDiffForm.UpdateIconHint

procedure TDiffForm.SyncWithCursor(const aCursor: InevBasePoint;
  NeedCheckLine: Boolean);
//#UC START# *4BDADD4101E1_4A6EBE900233_var*
//#UC END# *4BDADD4101E1_4A6EBE900233_var*
var
 l_MI : InevBasePoint; // ����� ��������� ������
 l_Line : Integer; // ������ ������ ���������
 l_Para : InevObject; // ������� ������� ��������
 l_ParaID : Integer; // ������������� �������� �������� ���������
 l_Block : IevDocumentPart; // ���� ��� ����� ������
begin
//#UC START# *4BDADD4101E1_4A6EBE900233_impl*
 //http://mdp.garant.ru/pages/viewpage.action?pageId=479945060
 if f_WasInitedByDocPos then
 begin
  f_WasInitedByDocPos := False;
  Exit;
 end;
 with Text do
 begin
  l_Para := aCursor.MostInner.Obj^;
  with l_Para do
  begin
   if InheritsFrom(k2_idLeafPara) then
   begin
    //http://mdp.garant.ru/pages/viewpage.action?pageId=476379343 
    if (l_Para.IntA[k2_tiStyle] <> ev_saVersionInfo) then
     l_ParaID := rLong(k2_tiHandle, 0)
    else
    begin
     l_Para := nil;
     l_ParaID := 0;
    end;
    if NeedCheckLine then
    begin
     l_MI := View.TopAnchor.MostInner;
     l_Line := l_MI.VertPosition(View, View.FormatInfoByPoint(l_MI));
    end//aCursor = View.TopAnchor
    else
     l_Line := 0;
    if (l_ParaID = 0) OR (l_ParaID <> f_PrevPara) OR (f_PrevLine <> l_Line) then
    begin
     f_PrevPara := l_ParaID;
     f_PrevLine := l_Line;
     l_Block := GetBlockByCursor(aCursor);
     if (l_Block <> nil) AND (f_PrevBlock <> nil) AND
        (l_Block.ID = f_PrevBlock.ID) then
     begin
      // - ���� �� ���������, �� � ������ ���������������
      l_Block := nil;
     end//l_Block <> nil
     else
      f_PrevBlock := l_Block;
     if (l_ParaID <> 0) OR (l_Block <> nil) then
      VScrollController.Sync(TnsParaCoord_C(TeePara.Make(l_Para, Self.Text), l_Block, l_Line, Self.Text));
    end;//l_Para <> f_PrevPara
   end;//InheritsFrom(k2_idLeafPara)
  end;//with l_Para
 end;//with Text
//#UC END# *4BDADD4101E1_4A6EBE900233_impl*
end;//TDiffForm.SyncWithCursor

procedure TDiffForm.DocumentTextChanged(aSender: TObject;
  const anOldDocument: Ik2Tag;
  const aNewDocument: Ik2Tag);
//#UC START# *4C93246B01B8_4A6EBE900233_var*
//#UC END# *4C93246B01B8_4A6EBE900233_var*
begin
//#UC START# *4C93246B01B8_4A6EBE900233_impl*
 TdmStdRes.CheckBaseSearchDataReady(NativeMainForm);
//#UC END# *4C93246B01B8_4A6EBE900233_impl*
end;//TDiffForm.DocumentTextChanged

function TDiffForm.pm_GetHeader: TvtPanel;
begin
 if (f_Header = nil) then
  f_Header := FindComponent('Header') As TvtPanel;
 Result := f_Header;
end;

function TDiffForm.pm_GetPnLeft: TvtPanel;
begin
 if (f_pnLeft = nil) then
  f_pnLeft := FindComponent('pnLeft') As TvtPanel;
 Result := f_pnLeft;
end;

function TDiffForm.pm_GetEditionLink: TvtFocusLabel;
begin
 if (f_EditionLink = nil) then
  f_EditionLink := FindComponent('EditionLink') As TvtFocusLabel;
 Result := f_EditionLink;
end;

function TDiffForm.pm_GetPnCaption: TvtPanel;
begin
 if (f_pnCaption = nil) then
  f_pnCaption := FindComponent('pnCaption') As TvtPanel;
 Result := f_pnCaption;
end;

procedure TDiffForm.ReturnToDocument;
//#UC START# *4B1E39750337_4A6EBE900233_var*
//#UC END# *4B1E39750337_4A6EBE900233_var*
begin
//#UC START# *4B1E39750337_4A6EBE900233_impl*
 Assert(EditionDiff.DocumentForReturn.rDoc <> nil);
 if (EditionDiff.DocumentForReturn.rPara <> nil) then
  TdmStdRes.OpenDocument(TdeDocInfo.Make(EditionDiff.DocumentForReturn.rDoc,
                                         TbsDocPos_P(EditionDiff.DocumentForReturn.rPara)),
                         nil)
 else
  TdmStdRes.OpenEntityAsDocument(EditionDiff.DocumentForReturn.rDoc, nil);
//#UC END# *4B1E39750337_4A6EBE900233_impl*
end;//TDiffForm.ReturnToDocument

function TDiffForm.IsRight: Boolean;
//#UC START# *4B69970A0029_4A6EBE900233_var*
//#UC END# *4B69970A0029_4A6EBE900233_var*
begin
//#UC START# *4B69970A0029_4A6EBE900233_impl*
 Result := NeedSetMyFocus;
//#UC END# *4B69970A0029_4A6EBE900233_impl*
end;//TDiffForm.IsRight

procedure TDiffForm.SetFocusToText;
//#UC START# *4B69A6BC0125_4A6EBE900233_var*
//#UC END# *4B69A6BC0125_4A6EBE900233_var*
begin
//#UC START# *4B69A6BC0125_4A6EBE900233_impl*
 if Text.CanFocus then
  Text.SetFocus;
//#UC END# *4B69A6BC0125_4A6EBE900233_impl*
end;//TDiffForm.SetFocusToText

function TDiffForm.IsParaCurrent(aPara: Integer): Boolean;
//#UC START# *4B6AE8B90254_4A6EBE900233_var*
var
 l_Tag : InevTag;
//#UC END# *4B6AE8B90254_4A6EBE900233_var*
begin
//#UC START# *4B6AE8B90254_4A6EBE900233_impl*
 if (Text.Selection = nil) OR (Text.Selection.Cursor = nil) then
  Result := false
 else
  with Text.Selection.Cursor.MostInner do
  begin
   Result := Obj.InheritsFrom(k2_idLeafPara) AND (IntA[k2_tiHandle] = aPara);
   if Result then
   // - �� ������ ����� �������� - �������, ���� ����� ����� ���������
   // http://mdp.garant.ru/pages/viewpage.action?pageId=208701209
   begin
    l_Tag := Obj.rAtomEx([k2_tiSegments, k2_tiChildren, k2_tiHandle, ev_slDiff]);
    if not l_Tag.IsValid OR (l_Tag.ChildrenCount <= 0) then
     Result := false;
   end;//Result
  end;//Text.Selection.Cursor.MostInner
//#UC END# *4B6AE8B90254_4A6EBE900233_impl*
end;//TDiffForm.IsParaCurrent

function TDiffForm.Document: IDocument;
//#UC START# *4F14091F01F1_4A6EBE900233_var*
//#UC END# *4F14091F01F1_4A6EBE900233_var*
begin
//#UC START# *4F14091F01F1_4A6EBE900233_impl*
 Result := EditionDiff.Document;
//#UC END# *4F14091F01F1_4A6EBE900233_impl*
end;//TDiffForm.Document

function TDiffForm.GetInitialDocumentPosition: TbsDocPos;
//#UC START# *5214AD4400DC_4A6EBE900233_var*
//#UC END# *5214AD4400DC_4A6EBE900233_var*
begin
//#UC START# *5214AD4400DC_4A6EBE900233_impl*
 Result := CompareEditions.Get_Position;
//#UC END# *5214AD4400DC_4A6EBE900233_impl*
end;//TDiffForm.GetInitialDocumentPosition

procedure TDiffForm.LinkWaiter(const aMade: InevDocumentContainer);
//#UC START# *4A85585102D2_4A6EBE900233_var*
var
 l_ChangedParas : IDiffIterator;
 l_Para : Integer;
//#UC END# *4A85585102D2_4A6EBE900233_var*
begin
//#UC START# *4A85585102D2_4A6EBE900233_impl*
 if (EditionDiff.RedactionCurrentPara = nil) then
 begin
  l_ChangedParas := CompareEditions.ChangedParas;
  if (l_ChangedParas <> nil) AND l_ChangedParas.HasNext then
  begin
   if IsRight then
    l_Para := l_ChangedParas.Next
   else
    l_Para := l_ChangedParas.AcquireNext;
    // - ��� ����� ��� ���� �������� �� ��������
   aMade.LinkWaiter(TnsChangedParaWaiter.Make(Self, l_Para));
  end;//l_ChangedParas <> nil..
 end;//EditionDiff.RedactionCurrentPara = nil
//#UC END# *4A85585102D2_4A6EBE900233_impl*
end;//TDiffForm.LinkWaiter

procedure TDiffForm.SignalEditionChanged;
//#UC START# *4A8559B0013B_4A6EBE900233_var*
//#UC END# *4A8559B0013B_4A6EBE900233_var*
begin
//#UC START# *4A8559B0013B_4A6EBE900233_impl*
//#UC END# *4A8559B0013B_4A6EBE900233_impl*
end;//TDiffForm.SignalEditionChanged

function TDiffForm.WindowRequired: Boolean;
//#UC START# *496B4C41023E_4A6EBE900233_var*
//#UC END# *496B4C41023E_4A6EBE900233_var*
begin
//#UC START# *496B4C41023E_4A6EBE900233_impl*
 Result := False;
//#UC END# *496B4C41023E_4A6EBE900233_impl*
end;//TDiffForm.WindowRequired

function TDiffForm.WindowCloseable: Boolean;
//#UC START# *496B4C500246_4A6EBE900233_var*
//#UC END# *496B4C500246_4A6EBE900233_var*
begin
//#UC START# *496B4C500246_4A6EBE900233_impl*
 Result := True;
//#UC END# *496B4C500246_4A6EBE900233_impl*
end;//TDiffForm.WindowCloseable

function TDiffForm.CanCloseWindow: Boolean;
//#UC START# *496B4CA000B6_4A6EBE900233_var*
//#UC END# *496B4CA000B6_4A6EBE900233_var*
begin
//#UC START# *496B4CA000B6_4A6EBE900233_impl*
 Result := True;
//#UC END# *496B4CA000B6_4A6EBE900233_impl*
end;//TDiffForm.CanCloseWindow

function TDiffForm.IsQueryCard: Boolean;
//#UC START# *496B4CD9005F_4A6EBE900233_var*
//#UC END# *496B4CD9005F_4A6EBE900233_var*
begin
//#UC START# *496B4CD9005F_4A6EBE900233_impl*
 Result := False;
//#UC END# *496B4CD9005F_4A6EBE900233_impl*
end;//TDiffForm.IsQueryCard

function TDiffForm.TreatSuccessSearchAsManualOpen: Boolean;
//#UC START# *496B4CE30132_4A6EBE900233_var*
//#UC END# *496B4CE30132_4A6EBE900233_var*
begin
//#UC START# *496B4CE30132_4A6EBE900233_impl*
 Result := False;
//#UC END# *496B4CE30132_4A6EBE900233_impl*
end;//TDiffForm.TreatSuccessSearchAsManualOpen

function TDiffForm.AutoActivateWindow: Boolean;
//#UC START# *496B4CED0306_4A6EBE900233_var*
//#UC END# *496B4CED0306_4A6EBE900233_var*
begin
//#UC START# *496B4CED0306_4A6EBE900233_impl*
 Result := False;
//#UC END# *496B4CED0306_4A6EBE900233_impl*
end;//TDiffForm.AutoActivateWindow

procedure TDiffForm.Sync(const aPara: TnsParaCoord);
//#UC START# *4A79AB290196_4A6EBE900233_var*

 function GotoTableCell : Boolean;
 var
  l_Tag   : InevTag;
  l_Owner : InevTag;
  l_Cell  : InevPara;
  l_Point : InevBasePoint;
 begin//GotoTableCell
  Result := false;
  if Supports(aPara.rPara, InevTag, l_Tag) then
   try
    l_Owner := l_Tag.Owner;
    // - ��������� (�����) ���� ����������������� ��������, � �� �����-�� ��� ������ ������
    if l_Owner.InheritsFrom(k2_idTableCell) then
    begin
     if l_Owner.QT(InevPara, l_Cell) then
      try
       l_Point := Text.Selection.Cursor.MostInner.ParentPoint;
       if (l_Point <> nil) AND l_Point.InheritsFrom(k2_idTableCell) then
       begin
        l_Point := l_Point.ParentPoint;
        l_Point.PositionW := l_Cell.PID + 1;
        l_Point.ToBottomChild(Text.View);
        Result := true;
       end;//l_Point <> nil
      finally
       l_Cell := nil;
      end;//try..finally
    end;//l_Owner.InheritsFrom(k2_idTableCell)
   finally
    l_Tag := nil;
   end;//try..finally
 end;//GotoTableCell

 function localGotoPara(aParaID : Integer): Boolean;
 begin
  if IsParaCurrent(aParaID) then
   Result := true
  else 
  if Text.ForceDrawFocusRect then
  // http://mdp.garant.ru/pages/viewpage.action?pageId=183337289&focusedCommentId=183337452#comment-183337452
  // ��� ���� ���� �������, �� ��� ������������� ������ �� ������������. � ������������ ������ ������� ���� ������.
  // �� ���� �����������, ��� ������� ����� �� ����� ����.
  // ! ���� �� ���������� � ����� ���������, �� ������� ������� ������� �� �������
  //   ���������������� �� ���������� �������� � �� ���� ���������, ��� ������� ����
  //   �� ������ ����.
  begin
   Result := Text.ScrollToPara(aParaID);
   if Result AND (GetTickCount - f_ForceDrawFocusRectMoment < cWaitDelta) then
   begin
    InevControl(Text).ForceRepaint;
    if not Text.View.IsCaretVisible then
    begin
     //Text.View.MakeCaretVisible;
     // - ���� ���������� ������� �� ����� (����� ����)
     Text.ScrollToCursor(Text.Selection.Cursor);
    end;//not Text.View.IsCaretVisible
   end;//Result...
  end//Text.ForceDrawFocusRect
  else
  begin
   Result := Text.GotoPara(aParaID);
   if Result then
    if Text.View.IsDocumentTailVisible then
     Text.ScrollToPara(aParaID);
     // http://mdp.garant.ru/pages/viewpage.action?pageId=192644951
  end;//Text.ForceDrawFocusRect
 end;

 function ChangedParaIsSelected : Boolean;
 begin//ChangedParaIsSelected
  Result := false;
  if Text.ForceDrawFocusRect then
   if (GetTickCount - f_ForceDrawFocusRectMoment < cWaitDelta) then
    Result := true;
 end;//ChangedParaIsSelected

 function NeedHackForChangedPara: Boolean;
 begin//NeedHackForChangedPara
  if not f_WasInitedByChangedPara AND
     (aPara.rParaID <> 0) AND
     (aPara.rEditor <> nil) AND
     (aPara.rEditor.Owner <> Self) AND
     (aPara.rEditor.View <> nil) AND
     aPara.rEditor.View.ForceDrawFocusRect then
  begin
   Result := true;
   f_WasInitedByChangedPara := true;
  end//f_WasInitedByChagedPara..
  else
   Result := false;
 end;//NeedHackForChangedPara

var
 l_Line  : Integer;
 l_TA    : InevBasePoint;
 l_MI    : InevBasePoint;
 l_Para  : InevPara;
 l_Pos   : Integer;
//#UC END# *4A79AB290196_4A6EBE900233_var*
begin
//#UC START# *4A79AB290196_4A6EBE900233_impl*
 if (not f_InVScroll OR
     NeedHackForChangedPara
    // - ��� ����� ���������������� � ���������� ����������, �� ����� �������� ��������� on demand
    )
    AND not f_InSearch then
 begin
  if InHistoryStep then
   Exit;
  f_InVScroll := true;
  try
   if (aPara.rParaID <> 0) AND localGotoPara(aPara.rParaID) then
   begin
    f_PrevPara := aPara.rParaID;
    f_PrevBlock := nil;
    if (aPara.rLine > 0) then
    begin
     l_Line := aPara.rLine;
     with Text do
     begin
      View.TopAnchor.MostInner.IncLine(View, l_Line, true);
      if (l_Line <> aPara.rLine) then
       // - ��� ��������, �.�. ����� ����������� �� ������������ �� ��������� �����
       (View As InevScrollListner).Signal;
     end;//with Text
    end;//aPara.rLine > 0
   end//aPara.rPara <> 0
   else
   begin
    if ChangedParaIsSelected then
     Exit;
    f_PrevPara := 0;
    f_PrevBlock := nil;
    // ���������� ���������� �� Sub
    if (aPara.rPara <> nil) then
    begin
     if GotoSub(aPara.rPara) then
      Exit;
     if GotoTableCell then
      // http://mdp.garant.ru/pages/viewpage.action?pageId=209584264
      // - �������� ������������� �� ������ �������
      Exit;
    end;//aPara.rPara <> nil
    // ���������� ���������� �� ����:
    if GotoBlock(aPara.rBlock) then
     Exit;
    // ����� ��� ���������� ��� http://mdp.garant.ru/pages/viewpage.action?pageId=172365317
    // � �� ��������� �� "���������" �� ���� ����� �� ������ ������������������
    if (aPara.rEditor <> nil) then
     if (aPara.rEditor.View <> nil) then
     begin
      if not Self.TextSource.HasDocument then
      begin
       Self.TextSource.DocumentContainer;
       Self.TextSource.Document;
       if ChangedParaIsSelected then
       // - ��������� �������� - ����� ���� �� ���, �.�. �� ����� ��������� ���������
       //   ����� ���������� �� ���������� ���������.
        Exit;
      end;//not Self.TextSource.HasDocument
      with aPara.rEditor do
      begin
       l_TA := View.TopAnchor;
       if l_TA.AtStart then
        Self.Text.GotoTop
       else
       begin
        InevControl(aPara.rEditor).ForceRepaint;
        // ����� �� �������� http://mdp.garant.ru/pages/viewpage.action?pageId=193823276
        // ��� ��������� 8802000
        if View.IsDocumentTailVisible then
         Self.Text.GotoBottom
        else
        begin
         // http://mdp.garant.ru/pages/viewpage.action?pageId=172365317&focusedCommentId=172365568&#comment-172365568
         // ����� ���������� ��� ������:
         l_Pos := l_TA.VertPosition(View, View.FormatInfoByPoint(l_TA));
         // !!! ��������� !!! l_Pos ��� �� �����, ��� ����� ���������/����� � ���������
         // http://mdp.garant.ru/pages/viewpage.action?pageId=294597544&focusedCommentId=294599305#comment-294599305
         if (l_Pos <= 5) then
         // http://mdp.garant.ru/pages/viewpage.action?pageId=175539661&focusedCommentId=175540041#comment-175540041
         begin
          l_MI := l_TA.MostInner;
          if (l_MI <> nil) then
          begin
           l_Para := l_MI.Obj.AsPara.Prev;
           if (l_Para <> nil) AND l_Para.IsValid then
            if View.FormatInfoByPara(l_Para).IsHidden(false, true) then
             if l_Para.Owner.IsSame(l_TA.Obj^) then
             // http://mdp.garant.ru/pages/viewpage.action?pageId=294597544
             // http://mdp.garant.ru/pages/viewpage.action?pageId=294597544&focusedCommentId=294599094#comment-294599094
              Self.Text.GotoTop;
          end;//l_MI <> nil
         end;//l_Pos <= 5
        end;//View.IsDocumentTailVisible
       end;//l_TA.AtStart
      end;//with aPara.rEditor
     end;//aPara.rEditor.View <> nil
   end;//aPara.rPara <> 0..
  finally
   f_InVScroll := false;
  end;//try..finally
 end;//not f_InVScroll
//#UC END# *4A79AB290196_4A6EBE900233_impl*
end;//TDiffForm.Sync

function TDiffForm.DocumentIsValid: Boolean;
//#UC START# *4A7C0E1A005C_4A6EBE900233_var*
//#UC END# *4A7C0E1A005C_4A6EBE900233_var*
begin
//#UC START# *4A7C0E1A005C_4A6EBE900233_impl*
 Result := TextSource.HasDocument;
//#UC END# *4A7C0E1A005C_4A6EBE900233_impl*
end;//TDiffForm.DocumentIsValid

procedure TDiffForm.GotoPoint(aPointID: Cardinal;
  aPointType: TDocumentPositionType = dptSub);
//#UC START# *4A8164E801AE_4A6EBE900233_var*
var
 l_Sub : IevSub;
//#UC END# *4A8164E801AE_4A6EBE900233_var*
begin
//#UC START# *4A8164E801AE_4A6EBE900233_impl*
 Case aPointType of
  dptSub :
  begin
   l_Sub := TextSource.DocumentContainer.SubList.Sub[aPointID];
   if (l_Sub <> nil) and
      l_Sub.Exists then
   begin
    l_Sub.Select(Text.Selection);
    SyncWithCursor(Text.Selection.Cursor, false);
   end;
  end;//dptSub
  else
   Assert(false);
 end;//Case aPointType
//#UC END# *4A8164E801AE_4A6EBE900233_impl*
end;//TDiffForm.GotoPoint

function TDiffForm.HyperlinkDocument: IDocument;
//#UC START# *4A8168BB0217_4A6EBE900233_var*
//#UC END# *4A8168BB0217_4A6EBE900233_var*
begin
//#UC START# *4A8168BB0217_4A6EBE900233_impl*
 Result := EditionDiff.Document;
//#UC END# *4A8168BB0217_4A6EBE900233_impl*
end;//TDiffForm.HyperlinkDocument

function TDiffForm.pm_GetHyperlinkText: TevCustomEditorWindow;
//#UC START# *4A82BC390036_4A6EBE900233get_var*
//#UC END# *4A82BC390036_4A6EBE900233get_var*
begin
//#UC START# *4A82BC390036_4A6EBE900233get_impl*
 Result := Text;
//#UC END# *4A82BC390036_4A6EBE900233get_impl*
end;//TDiffForm.pm_GetHyperlinkText

procedure TDiffForm.EditionChanged;
//#UC START# *4A841BEF002A_4A6EBE900233_var*
//#UC END# *4A841BEF002A_4A6EBE900233_var*
begin
//#UC START# *4A841BEF002A_4A6EBE900233_impl*
 SignalEditionChanged;
 f_PrevPara := 0;
 // - ��� ����� ����������� ��� �������������� �������
 f_PrevBlock := nil;
 ClearBlocksInfo;
 f_WasInitedByChangedPara := false;
 with TextSource do
 begin
(*  if HasDocument then
   Dispatcher.History.SaveState(Self.As_IvcmEntityForm, vcm_stContent);*)
  //DocumentContainer := nil;
 end;//with TextSource
//#UC END# *4A841BEF002A_4A6EBE900233_impl*
end;//TDiffForm.EditionChanged

function TDiffForm.IsFloating: Boolean;
//#UC START# *4A8A9DB0001A_4A6EBE900233_var*
//#UC END# *4A8A9DB0001A_4A6EBE900233_var*
begin
//#UC START# *4A8A9DB0001A_4A6EBE900233_impl*
 Result := false;
//#UC END# *4A8A9DB0001A_4A6EBE900233_impl*
end;//TDiffForm.IsFloating

function TDiffForm.pm_GetTextWithComments: TevCustomEditorWindow;
//#UC START# *4A8AAD450084_4A6EBE900233get_var*
//#UC END# *4A8AAD450084_4A6EBE900233get_var*
begin
//#UC START# *4A8AAD450084_4A6EBE900233get_impl*
 Result := Text;
//#UC END# *4A8AAD450084_4A6EBE900233get_impl*
end;//TDiffForm.pm_GetTextWithComments

function TDiffForm.Get_ContainerForBaseSearch: TnsContainerForBaseSearchInfo;
//#UC START# *4ACA195801CB_4A6EBE900233get_var*
//#UC END# *4ACA195801CB_4A6EBE900233get_var*
begin
//#UC START# *4ACA195801CB_4A6EBE900233get_impl*
 Result.rContainer := nil;
 Result.rZone := vcm_ztAny;
//#UC END# *4ACA195801CB_4A6EBE900233get_impl*
end;//TDiffForm.Get_ContainerForBaseSearch

function TDiffForm.Get_ContextSearcher: InsContextSearcher;
//#UC START# *4AD6EAA3034A_4A6EBE900233get_var*
//#UC END# *4AD6EAA3034A_4A6EBE900233get_var*
begin
//#UC START# *4AD6EAA3034A_4A6EBE900233get_impl*
 Result := Self;
//#UC END# *4AD6EAA3034A_4A6EBE900233get_impl*
end;//TDiffForm.Get_ContextSearcher

function TDiffForm.Finder_GotoPara_Execute(aPara: Integer): TGotoParaResult;
//#UC START# *4AE042520302_4A6EBE900233exec_var*
//#UC END# *4AE042520302_4A6EBE900233exec_var*
begin
//#UC START# *4AE042520302_4A6EBE900233exec_impl*
 Result := GotoPara(aPara);
//#UC END# *4AE042520302_4A6EBE900233exec_impl*
end;//TDiffForm.Finder_GotoPara_Execute

procedure TDiffForm.Finder_GotoPara(const aParams: IvcmExecuteParams);
begin
 with (aParams.Data As IFinder_GotoPara_Params) do
  ResultValue := Finder_GotoPara_Execute(Para);
end;

function TDiffForm.DocumentForExport: IDocument;
//#UC START# *4AE1B48A0120_4A6EBE900233_var*
//#UC END# *4AE1B48A0120_4A6EBE900233_var*
begin
//#UC START# *4AE1B48A0120_4A6EBE900233_impl*
 Result := EditionDiff.Document;
//#UC END# *4AE1B48A0120_4A6EBE900233_impl*
end;//TDiffForm.DocumentForExport

function TDiffForm.pm_GetHasDoc: Boolean;
//#UC START# *4AE1C7A8016C_4A6EBE900233get_var*
//#UC END# *4AE1C7A8016C_4A6EBE900233get_var*
begin
//#UC START# *4AE1C7A8016C_4A6EBE900233get_impl*
 Result := DocumentIsValid;
//#UC END# *4AE1C7A8016C_4A6EBE900233get_impl*
end;//TDiffForm.pm_GetHasDoc

function TDiffForm.IsDrug: Boolean;
//#UC START# *4AE1C9890311_4A6EBE900233_var*
//#UC END# *4AE1C9890311_4A6EBE900233_var*
begin
//#UC START# *4AE1C9890311_4A6EBE900233_impl*
 Result := false;
//#UC END# *4AE1C9890311_4A6EBE900233_impl*
end;//TDiffForm.IsDrug

function TDiffForm.Document_SetPosition_Execute(aPointID: Cardinal;
  aPointType: TDocumentPositionType = dptSub;
  aUserType: Integer = 0): Boolean;
//#UC START# *4AE9D38A02DA_4A6EBE900233exec_var*
//#UC END# *4AE9D38A02DA_4A6EBE900233exec_var*
begin
//#UC START# *4AE9D38A02DA_4A6EBE900233exec_impl*
 GotoPoint(aPointID, aPointType);
 Result := true;
//#UC END# *4AE9D38A02DA_4A6EBE900233exec_impl*
end;//TDiffForm.Document_SetPosition_Execute

procedure TDiffForm.Document_SetPosition(const aParams: IvcmExecuteParams);
begin
 with (aParams.Data As IDocument_SetPosition_Params) do
  ResultValue := Document_SetPosition_Execute(PointID, PointType, UserType);
end;

procedure TDiffForm.Document_OpenEditionLocalLink_Execute(const aDocument: IDocument;
  aSub: Cardinal);
//#UC START# *4B0650D4035A_4A6EBE900233exec_var*
//#UC END# *4B0650D4035A_4A6EBE900233exec_var*
begin
//#UC START# *4B0650D4035A_4A6EBE900233exec_impl*
 if not f_InOpenEditionLink then
 begin
  if HyperlinkDocument.IsSameRedaction(aDocument) then
  begin
   // ������� �� ��������� ������ � ������� �������� ���������
   Dispatcher.History.SaveState(Self.As_IvcmEntityForm, vcm_stPosition);
   GoToPoint(aSub);
   SetFocusToText;
  end//HyperlinkDocument.IsSameRedaction(aDocument)
  else
   inherited OpenRedactionLocalLink(aDocument, aSub);
 end;//not f_InOpenEditionLink
//#UC END# *4B0650D4035A_4A6EBE900233exec_impl*
end;//TDiffForm.Document_OpenEditionLocalLink_Execute

procedure TDiffForm.Document_OpenEditionLocalLink(const aParams: IvcmExecuteParams);
begin
 with (aParams.Data As IDocument_OpenEditionLocalLink_Params) do
  Document_OpenEditionLocalLink_Execute(Document, Sub);
end;

function TDiffForm.DocumentForSearch: IDocument;
//#UC START# *4B4EF0A200BD_4A6EBE900233_var*
//#UC END# *4B4EF0A200BD_4A6EBE900233_var*
begin
//#UC START# *4B4EF0A200BD_4A6EBE900233_impl*
 Result := EditionDiff.Document;
//#UC END# *4B4EF0A200BD_4A6EBE900233_impl*
end;//TDiffForm.DocumentForSearch

procedure TDiffForm.CurrentChangedFragmentChanged(aParaID: Integer);
//#UC START# *4B54676B0132_4A6EBE900233_var*
//#UC END# *4B54676B0132_4A6EBE900233_var*
begin
//#UC START# *4B54676B0132_4A6EBE900233_impl*
 // - ������ �� ������, �.�. ��� ����������� ��� �����������
//#UC END# *4B54676B0132_4A6EBE900233_impl*
end;//TDiffForm.CurrentChangedFragmentChanged

procedure TDiffForm.Finder_DisableForceDrawFocusRect_Execute;
//#UC START# *4B59C1F401F8_4A6EBE900233exec_var*
//#UC END# *4B59C1F401F8_4A6EBE900233exec_var*
begin
//#UC START# *4B59C1F401F8_4A6EBE900233exec_impl*
 Text.ForceDrawFocusRect := false;
//#UC END# *4B59C1F401F8_4A6EBE900233exec_impl*
end;//TDiffForm.Finder_DisableForceDrawFocusRect_Execute

procedure TDiffForm.Finder_DisableForceDrawFocusRect(const aParams: IvcmExecuteParams);
begin
 Finder_DisableForceDrawFocusRect_Execute;
end;

function TDiffForm.CanUnControl: Boolean;
//#UC START# *4BA0ACB501DA_4A6EBE900233_var*
//#UC END# *4BA0ACB501DA_4A6EBE900233_var*
begin
//#UC START# *4BA0ACB501DA_4A6EBE900233_impl*
 Result := True;
//#UC END# *4BA0ACB501DA_4A6EBE900233_impl*
end;//TDiffForm.CanUnControl

function TDiffForm.NeedGotoNeighbours: Boolean;
//#UC START# *4C068AB5026A_4A6EBE900233_var*
//#UC END# *4C068AB5026A_4A6EBE900233_var*
begin
//#UC START# *4C068AB5026A_4A6EBE900233_impl*
 Result := not IsRight;
//#UC END# *4C068AB5026A_4A6EBE900233_impl*
end;//TDiffForm.NeedGotoNeighbours

function TDiffForm.Get_NeedSaveActiveClassBeforeSearch: Boolean;
//#UC START# *4F1D607E0027_4A6EBE900233get_var*
//#UC END# *4F1D607E0027_4A6EBE900233get_var*
begin
//#UC START# *4F1D607E0027_4A6EBE900233get_impl*
 Result := false;
 // - ��� ������ ������ ������� �� ���� - ��������� ����� ��� ����������
//#UC END# *4F1D607E0027_4A6EBE900233get_impl*
end;//TDiffForm.Get_NeedSaveActiveClassBeforeSearch

procedure TDiffForm.Cleanup;
//#UC START# *479731C50290_4A6EBE900233_var*
//#UC END# *479731C50290_4A6EBE900233_var*
begin
//#UC START# *479731C50290_4A6EBE900233_impl*
 f_WasInitedByChangedPara := false;
 f_PrevBlock := nil;
 inherited;
//#UC END# *479731C50290_4A6EBE900233_impl*
end;//TDiffForm.Cleanup

procedure TDiffForm.InitFields;
//#UC START# *47A042E100E2_4A6EBE900233_var*
//#UC END# *47A042E100E2_4A6EBE900233_var*
begin
//#UC START# *47A042E100E2_4A6EBE900233_impl*
 inherited;
 f_PrevPara := 0;
//#UC END# *47A042E100E2_4A6EBE900233_impl*
end;//TDiffForm.InitFields

procedure TDiffForm.Loaded;
//#UC START# *484516C00214_4A6EBE900233_var*
//#UC END# *484516C00214_4A6EBE900233_var*
begin
//#UC START# *484516C00214_4A6EBE900233_impl*
 with EditionLink do
 begin
  Caption := '��������:';
  Hint := '������� ����� �������� � ������ ����';
 end;//with EditionLink
 inherited;
//#UC END# *484516C00214_4A6EBE900233_impl*
end;//TDiffForm.Loaded

{$If not defined(NoVCM)}
procedure TDiffForm.NotifyDataSourceChanged(const anOld: IvcmViewAreaController;
  const aNew: IvcmViewAreaController);
//#UC START# *497469C90140_4A6EBE900233_var*
//#UC END# *497469C90140_4A6EBE900233_var*
begin
//#UC START# *497469C90140_4A6EBE900233_impl*
 inherited;
 Text.ForceDrawFocusRect := false;
 f_PrevPara := 0;
 f_PrevBlock := nil;
 f_WasInitedByChangedPara := false;
 if (anOld <> nil) then
 begin
  anOld.Unsubscribe(InsVScrollListner(Self));
  anOld.Unsubscribe(InsEditionListner(Self));
 end;//anOld <> nil
 if (aNew <> nil) then
 begin
  aNew.Subscribe(InsVScrollListner(Self));
  aNew.Subscribe(InsEditionListner(Self));
 end;//aNew <> nil
 UpdateCaptionFromDS;
 UpdateEditionsChoose;
 UpdateIconHint;
 Invalidate;
 pbIcon.Invalidate; 
//#UC END# *497469C90140_4A6EBE900233_impl*
end;//TDiffForm.NotifyDataSourceChanged
{$IfEnd} //not NoVCM

function TDiffForm.DoProcessLocalLink(const aDocument: IDocument;
  aPointType: TDocumentPositionType;
  aSub: Cardinal): Boolean;
//#UC START# *4A8160720125_4A6EBE900233_var*
//#UC END# *4A8160720125_4A6EBE900233_var*
begin
//#UC START# *4A8160720125_4A6EBE900233_impl*
 Result := true;
 if aDocument.IsSameRedaction(HyperlinkDocument) then
 begin
  // � ������� ����� ��������� �� ������ ��� �����
  //http://mdp.garant.ru/pages/viewpage.action?pageId=337514320
  FormSet.SaveHistory;
  GoToPoint(aSub);
 end//aDocument.IsSameRedaction(HyperlinkDocument)
 else
  OpenRedactionLocalLink(aDocument, aSub);
//#UC END# *4A8160720125_4A6EBE900233_impl*
end;//TDiffForm.DoProcessLocalLink

procedure TDiffForm.OpenRedactionLocalLink(const aDocument: IDocument;
  aSub: Cardinal);
//#UC START# *4A81650B014A_4A6EBE900233_var*
//#UC END# *4A81650B014A_4A6EBE900233_var*
begin
//#UC START# *4A81650B014A_4A6EBE900233_impl*
 f_InOpenEditionLink := true;
 try
  Op_Document_OpenEditionLocalLink.Call(Aggregate, aDocument, aSub);
 finally
  f_InOpenEditionLink := false;
 end;//try..finally
//#UC END# *4A81650B014A_4A6EBE900233_impl*
end;//TDiffForm.OpenRedactionLocalLink

{$If not defined(NoVCM)}
function TDiffForm.NeedDrawCaption: Boolean;
//#UC START# *4A84183701B9_4A6EBE900233_var*
//#UC END# *4A84183701B9_4A6EBE900233_var*
begin
//#UC START# *4A84183701B9_4A6EBE900233_impl*
 Result := false;
//#UC END# *4A84183701B9_4A6EBE900233_impl*
end;//TDiffForm.NeedDrawCaption
{$IfEnd} //not NoVCM

{$If not defined(NoVCM)}
procedure TDiffForm.InitControls;
//#UC START# *4A8E8F2E0195_4A6EBE900233_var*
const
 cIconW = 32;
 cMinVisibleDrop = 1;
 cMaxVisibleDrop = 10;
//#UC END# *4A8E8F2E0195_4A6EBE900233_var*
begin
//#UC START# *4A8E8F2E0195_4A6EBE900233_impl*
 Style.Toolbars.Top.MergeWithContainer := vcm_bFalse;
 Style.Toolbars.Top.ImageSize := isSmall;
 with Header do
 begin
  Ctl3D := false;
  BevelInner := bvNone;
  BevelOuter := bvNone;
  // ������ ���� ���, �� �� [$172983988] ������ �����������..
  //BorderStyle := bsSingle;
  //  BevelOuter := bvRaised;
  Alignment := taLeftJustify;
  Height := 40;
  Align := alTop;
 end;//with Header
 with pbIcon do
 begin
  ShowHint := True;
  Left := 5;
  Width := cIconW;
  Height := cIconW;
  OnPaint := Self.PaintIcon;
 end;//with pbIcon
 with EditionLink do
 begin
  ShowHint := true;
  with Font do
  begin
   Size := 12;
   Style := [fsBold];
   Color := clGreen;
  end;//with Font
  HighlightColor := clGreen;
  Hyperlink := true;
  Cursor := crHandPoint;
  AutoWidth := true;
  Left := pbIcon.Left + pbIcon.Width + 2;
  OnClick := OpenEditionInFullWindow;
  TabStop := false;
 end;//with EditionLink
 with pnLeft do
 begin
  BevelInner := bvNone;
  BevelOuter := bvNone;
  Align := alLeft;
  Width := EditionLink.Left + EditionLink.Width;
 end;//with pnLeft
 with EditionLink do
 begin
  Top := (Parent.Height - Height) div 2;
 end;//with EditionLink
 with pbIcon do
 begin
  Top := (Parent.Height - Height) div 2;
 end;//with pbIcon
 with pnCaption do
 begin
  BevelInner := bvNone;
  BevelOuter := bvNone;
  Alignment := taLeftJustify;
  Align := alClient;
  with Font do
  begin
   Color := clNavy;
   Size := 12;
  end;//with Font
  onResize := CaptionResize;
 end;//with pnCaption
 with TextSource do
 begin
  OnMakeDocumentContainer := Self.MakeDocumentContainer;
  OnDocumentChanged := Self.DocumentTextChanged;
 end;
 with Text do
 begin
  //ProvideOperationTypes := ProvideOperationTypes - [potPrint];
  Align := alClient;
  TextSource := Self.TextSource;
  ShowComments := false;
  ShowVersionComments := false;
  ShowUserComments := false;
  ShowTechComments := false;
  OnVScroll := Self.VScroll;
  OnParaChange := Self.ParaChange;
  {$IfOpt D+}
  ShowDocumentParts := true;
  {$EndIf}
  AllowRubberTables := nev_rtmZoom;
  IsStaticText := true;
 end;//with Text
 with EditionChoose do
 begin
  ComboStyle := ct_cbDropDownList;
  {$IfNDef InsiderTest}
  Enabled := false;
  // http://mdp.garant.ru/pages/viewpage.action?pageId=224790135
  // bq. ���������� ������ �������� �����������.
  BorderStyle := bsNone;
  TvtComboBoxQSHack(EditionChoose).Button.Visible := false;
  {$EndIf  InsiderTest}
  //ComboStyle := ct_cbEdit;
  //IsStaticText := true;
  Top := (Parent.Height - Height) div 2;
  {$IfNDef InsiderTest}
  Top := Top + 2;
  {$EndIf  InsiderTest}
  OnEndTextPrint := ChoosenEditionChanged;
  Font := THackWinControl(EditionChoose.Parent).Font;
  Font.Style := [fsBold];
  //ParentFont := true;
  {$IfNDef InsiderTest}
  Font.Color := clBlack;
  {$EndIf  InsiderTest}
  OnGetItemImage := EditionChooseGetItemImage;
  //TreeImages := nsDocumentRes.DocumentItemsImageList;
  Tree.ViewOptions := Tree.ViewOptions + [voShowIcons] - [voShowLines];
  MinVisibleDropCount := cMinVisibleDrop;
  MaxVisibleDropCount := cMaxVisibleDrop;
  GrowDropTreeWidthByIcons := True;
 end;//with EditionChoose
 inherited;
//#UC END# *4A8E8F2E0195_4A6EBE900233_impl*
end;//TDiffForm.InitControls
{$IfEnd} //not NoVCM

function TDiffForm.ContinueSearchInWholeBase: Boolean;
//#UC START# *4B4EF0D2016A_4A6EBE900233_var*
//#UC END# *4B4EF0D2016A_4A6EBE900233_var*
begin
//#UC START# *4B4EF0D2016A_4A6EBE900233_impl*
 Result := False;
//#UC END# *4B4EF0D2016A_4A6EBE900233_impl*
end;//TDiffForm.ContinueSearchInWholeBase

procedure TDiffForm.SignalDataSourceChanged(const anOld : IvcmViewAreaController;
 const aDsNew : IvcmViewAreaController);
begin
 inherited;
 if (aDsNew = nil) then
 begin
  EditionDiff := nil;
  VScrollController := nil;
  CompareEditions := nil;
 end//aDsNew = nil
 else
 begin
  Supports(aDsNew, IdsEditionDiff, EditionDiff);
  aDsNew.CastUCC(InsVScrollController, VScrollController);
  aDsNew.CastUCC(IsdsCompareEditions, CompareEditions);
 end;//aDsNew = nil
end;

procedure TDiffForm.InitEntities;
begin
 inherited;
 with Entities.Entities do
 begin
  PublishFormEntity(en_Finder, nil);
  PublishFormEntity(en_Document, nil);
  PublishOpWithResult(en_Finder, op_GotoPara, Finder_GotoPara, nil, nil);
  PublishOpWithResult(en_Document, op_SetPosition, Document_SetPosition, nil, nil);
  PublishOpWithResult(en_Document, op_OpenEditionLocalLink, Document_OpenEditionLocalLink, nil, nil);
  PublishOpWithResult(en_Finder, op_DisableForceDrawFocusRect, Finder_DisableForceDrawFocusRect, nil, nil);
 end;//with Entities.Entities
end;

procedure TDiffForm.MakeControls;
begin
 inherited;
 Text.Parent := Self;
 f_pbIcon := TPaintBox.Create(Self);
 f_pbIcon.Name := 'pbIcon';
 f_pbIcon.Parent := pnLeft;
 f_EditionChoose := TvtComboBoxQS.Create(Self);
 f_EditionChoose.Name := 'EditionChoose';
 f_EditionChoose.Parent := pnCaption;
end;

{$IfEnd} //not Admin AND not Monitorings

initialization
{$If not defined(Admin) AND not defined(Monitorings)}
 {$Include w:\garant6x\implementation\Garant\GbaNemesis\View\BaseTextOperations.imp.pas}
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_Diff_Control_Header
 Tkw_Diff_Control_Header.Register('�������::Header', TvtPanel);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_Diff_Control_Header_Push
 Tkw_Diff_Control_Header_Push.Register('�������::Header:push');
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_Diff_Control_pnLeft
 Tkw_Diff_Control_pnLeft.Register('�������::pnLeft', TvtPanel);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_Diff_Control_pnLeft_Push
 Tkw_Diff_Control_pnLeft_Push.Register('�������::pnLeft:push');
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_Diff_Control_EditionLink
 Tkw_Diff_Control_EditionLink.Register('�������::EditionLink', TvtFocusLabel);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_Diff_Control_EditionLink_Push
 Tkw_Diff_Control_EditionLink_Push.Register('�������::EditionLink:push');
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_Diff_Control_pbIcon
 Tkw_Diff_Control_pbIcon.Register('�������::pbIcon', TPaintBox);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_Diff_Control_pbIcon_Push
 Tkw_Diff_Control_pbIcon_Push.Register('�������::pbIcon:push');
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_Diff_Control_pnCaption
 Tkw_Diff_Control_pnCaption.Register('�������::pnCaption', TvtPanel);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_Diff_Control_pnCaption_Push
 Tkw_Diff_Control_pnCaption_Push.Register('�������::pnCaption:push');
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_Diff_Control_EditionChoose
 Tkw_Diff_Control_EditionChoose.Register('�������::EditionChoose', TvtComboBoxQS);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_Diff_Control_EditionChoose_Push
 Tkw_Diff_Control_EditionChoose_Push.Register('�������::EditionChoose:push');
{$IfEnd} //not Admin AND not Monitorings

end.