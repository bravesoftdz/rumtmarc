unit PrimSaveLoad_Form;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "View$For F1 and Monitorings"
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/View/Search/Forms/PrimSaveLoad_Form.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<VCMContainer::Class>> F1 Common For Shell And Monitoring::Search::View$For F1 and Monitorings::Search$Presentation for F1 and Monitorings::PrimSaveLoad
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If not defined(Admin)}
uses
  SearchUnit
  {$If not defined(NoVCM)}
  ,
  vcmExternalInterfaces
  {$IfEnd} //not NoVCM
  ,
  bsTypes,
  ExtCtrls,
  SimpleListInterfaces
  {$If not defined(NoVCM)}
  ,
  vcmContainerForm
  {$IfEnd} //not NoVCM
  
  {$If not defined(Admin) AND not defined(Monitorings)}
  ,
  FoldersDomainInterfaces
  {$IfEnd} //not Admin AND not Monitorings
  
  {$If not defined(NoVCM)}
  ,
  vcmUserControls
  {$IfEnd} //not NoVCM
  ,
  vtPanel,
  OfficeLike_ResultEx_Controls,
  OfficeLike_Result_Controls
  {$If not defined(NoVCM)}
  ,
  vcmItems
  {$IfEnd} //not NoVCM
  ,
  SearchLite_Strange_Controls,
  vtLabel,
  Search_Strange_Controls,
  nsQuery,
  nsLogEvent,
  l3StringIDEx,
  PrimBaseSearchInterfaces,
  PrimWorkJournalInterfaces
  {$If not defined(NoScripts)}
  ,
  kwBynameControlPush
  {$IfEnd} //not NoScripts
  
  {$If not defined(NoScripts)}
  ,
  tfwControlString
  {$IfEnd} //not NoScripts
  ,
  bsInterfaces,
  Classes
  {$If not defined(NoVCM)}
  ,
  vcmInterfaces
  {$IfEnd} //not NoVCM
  ,
  eeInterfaces,
  nsTypes,
  PrimPrimListInterfaces,
  FiltersUnit,
  vcmEntityForm {a},
  vcmControllers {a}
  ;
{$IfEnd} //not Admin

{$If not defined(Admin)}
type
 _nsUserSettingsListener_Parent_ = TvcmContainerForm;
 {$Include w:\garant6x\implementation\Garant\GbaNemesis\Data\Common\nsUserSettingsListener.imp.pas}
 TPrimSaveLoadForm = {abstract form} class(_nsUserSettingsListener_, InsBaseSearchResultProcessor, InsWorkJournalListener)
 private
 // private fields
   f_LastQueryIndex : Integer;
   Filters : IucpFilters;
   f_pnHeader : TvtPanel;
    {* ���� ��� �������� pnHeader}
   f_lbHeader : TvtLabel;
    {* ���� ��� �������� lbHeader}
   f_pbHeader : TPaintBox;
    {* ���� ��� �������� pbHeader}
   f_ParentZone : TvtPanel;
    {* ���� ��� �������� ParentZone}
   f_QueryHistory : TvcmItems;
    {* ���� ��� �������� QueryHistory}
   f_SearchState : InsSearchTypeState;
    {* ���� ��� �������� SearchState}
 protected
  procedure SignalDataSourceChanged(const anOld : IvcmViewAreaController;
                                const aDsNew : IvcmViewAreaController); override;
  procedure InitEntities; override;
  procedure MakeControls; override;
 private
 // private methods
   procedure UpdateLabel(aSender: TObject);
   procedure PbHeaderPaint(aSender: TObject);
   procedure HeaderResize(aSender: TObject);
 protected
 // property methods
   function pm_GetQueryHistory: TvcmItems;
   function pm_GetSearchState: InsSearchTypeState;
 protected
 // realized methods
   procedure SearchResultEmpty(TryFullList: Boolean);
   procedure SearchResultExists;
   procedure AnotherSearchSuccessed;
   procedure File_SaveToFolder_Test(const aParams: IvcmTestParamsPrim);
     {* ��������� � ����� }
   procedure File_SaveToFolder_Execute(const aParams: IvcmExecuteParamsPrim);
     {* ��������� � ����� }
   procedure File_LoadFromFolder_Test(const aParams: IvcmTestParamsPrim);
     {* ��������� �� ����� }
   procedure File_LoadFromFolder_Execute(const aParams: IvcmExecuteParamsPrim);
     {* ��������� �� ����� }
   function Loadable_Load_Execute(const aNode: IeeNode;
    const aData: IUnknown;
    anOp: TListLogicOperation = LLO_NONE): Boolean;
     {* �������, ��� ����� ������� ���� �����? }
   procedure Loadable_Load(const aParams: IvcmExecuteParams);
     {* �������, ��� ����� ������� ���� �����? }
   procedure JournalShrinked;
   procedure Result_OkExt_Test(const aParams: IvcmTestParamsPrim);
     {* OK }
   procedure Result_OkExt_GetState(var State: TvcmOperationStateIndex);
     {* OK }
   procedure Result_OkExt_Execute(const aParams: IvcmExecuteParamsPrim);
     {* OK }
   procedure Result_Cancel_Test(const aParams: IvcmTestParamsPrim);
     {* ������ }
   procedure Result_Cancel_GetState(var State: TvcmOperationStateIndex);
     {* ������ }
   procedure Result_Cancel_Execute(const aParams: IvcmExecuteParamsPrim);
     {* ������ }
   procedure Query_ClearAll_Execute(aNotClearRange: Boolean);
   procedure Query_ClearAll(const aParams: IvcmExecuteParams);
   procedure Query_SetList_Execute(const aList: IdeList;
    aInList: Boolean);
   procedure Query_SetList(const aParams: IvcmExecuteParams);
   function Filterable_Add_Execute(const aFilter: IFilterFromQuery): Boolean;
   procedure Filterable_Add(const aParams: IvcmExecuteParams);
   function Filterable_Delete_Execute(const aFilter: IFilterFromQuery): Boolean;
   procedure Filterable_Delete(const aParams: IvcmExecuteParams);
   function Query_GetList_Execute: IdeList;
   procedure Query_GetList(const aParams: IvcmExecuteParams);
   procedure Filterable_ClearAll_Execute;
   procedure Filterable_ClearAll(const aParams: IvcmExecuteParams);
   function Filterable_Refresh_Execute: Boolean;
   procedure Filterable_Refresh(const aParams: IvcmExecuteParams);
   procedure AnotherSearchCancelled;
   procedure Result_ClearAll_Test(const aParams: IvcmTestParamsPrim);
   procedure Result_ClearAll_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Query_GetOldQuery_Test(const aParams: IvcmTestParamsPrim);
   procedure Query_GetOldQuery_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Query_SearchType_Test(const aParams: IvcmTestParamsPrim);
   procedure Query_SearchType_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure LogicOperation_LogicOr_Test(const aParams: IvcmTestParamsPrim);
   procedure LogicOperation_LogicOr_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure LogicOperation_LogicAnd_Test(const aParams: IvcmTestParamsPrim);
   procedure LogicOperation_LogicAnd_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure LogicOperation_LogicNot_Test(const aParams: IvcmTestParamsPrim);
   procedure LogicOperation_LogicNot_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Filters_FiltersListOpen_Test(const aParams: IvcmTestParamsPrim);
     {* ������� (�������) }
   procedure Filters_FiltersListOpen_Execute(const aParams: IvcmExecuteParamsPrim);
     {* ������� (�������) }
   function Filterable_GetListType_Execute: TbsListType;
   procedure Filterable_GetListType(const aParams: IvcmExecuteParams);
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* ������� ������� ����� �������. }
   procedure SettingsReplaceFinish; override;
   procedure UserSettingsChanged; override;
     {* ���������� ��������� ������������ }
   {$If not defined(NoVCM)}
   procedure DoInit(aFromHistory: Boolean); override;
     {* ������������� �����. ��� ���������� � �������� }
   {$IfEnd} //not NoVCM
   {$If not defined(NoVCM)}
   function DoLoadState(const aState: IvcmBase;
    aStateType: TvcmStateType): Boolean; override;
     {* ��������� ��������� �����. ��� ���������� � �������� }
   {$IfEnd} //not NoVCM
   {$If not defined(NoVCM)}
   procedure InitControls; override;
     {* ��������� ������������� ���������. ��� ���������� � �������� }
   {$IfEnd} //not NoVCM
   {$If not defined(NoVCM)}
   function SaveOwnFormState(out theState: IvcmBase;
    aStateType: TvcmStateType): Boolean; override;
   {$IfEnd} //not NoVCM
   procedure ClearFields; override;
 public
 // overridden public methods
   constructor Create(AOwner: TComponent); override;
    {$If not defined(NoVCM)}
   procedure NotifyUserTypeSet; override;
    {$IfEnd} //not NoVCM
 protected
 // protected methods
   function HideOpForPostingOrder(const aParams: IvcmTestParamsPrim): Boolean;
    {$If not defined(Admin) AND not defined(Monitorings)}
   function MakeFilterInfo: InsFolderFilterInfo;
    {$IfEnd} //not Admin AND not Monitorings
   function IsOkBtn: Boolean;
     {* ��������� �������� �� ������ ������� "��" }
   procedure LoadQueryHistory;
    {$If not defined(Admin) AND not defined(Monitorings)}
   procedure FillQueryAndSearch;
    {$IfEnd} //not Admin AND not Monitorings
   procedure EnResultopSaveExecute(const aParams: IvcmExecuteParamsPrim);
   class function IsDictionLike: Boolean; virtual;
     {* ����������, ��� ����� ������ �� "�������" }
   class function IsBaseSearchLike: Boolean; virtual;
   function IsNewQueryCard: Boolean;
   function ListType: TbsListType;
 public
 // public methods
   class function NsIsQueryTypeCompatibleToQueryFormType(aQueryType: TQueryType;
     aFormType: TvcmUserType): Boolean;
 protected
 // protected properties
   property QueryHistory: TvcmItems
     read pm_GetQueryHistory;
   property SearchState: InsSearchTypeState
     read pm_GetSearchState;
 public
 // public properties
   property pnHeader: TvtPanel
     read f_pnHeader;
   property lbHeader: TvtLabel
     read f_lbHeader;
   property pbHeader: TPaintBox
     read f_pbHeader;
   property ParentZone: TvtPanel
     read f_ParentZone;
 end;//TPrimSaveLoadForm
{$IfEnd} //not Admin

implementation

{$If not defined(Admin)}
uses
  LoggingUnit,
  DynamicDocListUnit,
  bsUtils,
  Controls,
  ConsultingUnit
  {$If defined(Monitorings) AND not defined(Admin)}
  ,
  nsPostingsTreeSingle
  {$IfEnd} //Monitorings AND not Admin
  
  {$If not defined(Admin) AND not defined(Monitorings)}
  ,
  nsFolders
  {$IfEnd} //not Admin AND not Monitorings
  ,
  nsQueryUtils
  {$If not defined(NoVCM)}
  ,
  vcmBase
  {$IfEnd} //not NoVCM
  ,
  l3Interfaces,
  BaseTypesUnit,
  lgTypes,
  nsbQueryUtils,
  nsUtils
  {$If not defined(Admin) AND not defined(Monitorings)}
  ,
  nsFolderFilterInfo
  {$IfEnd} //not Admin AND not Monitorings
  ,
  l3Base,
  l3String,
  DataAdapter,
  Search_FormDefinitions_Controls,
  BaseTreeSupportUnit,
  ActnList,
  vtF1InterfaceConst,
  nsConst,
  Graphics
  {$If not defined(NoVCM)}
  ,
  vcmBaseOperationsCollectionItem
  {$IfEnd} //not NoVCM
  ,
  StrUtils,
  Menus,
  PrimSaveLoadUserTypes_slqtAttribute_UserType,
  PrimSaveLoadUserTypes_slqtKW_UserType,
  PrimSaveLoadUserTypes_slqtOldKW_UserType,
  PrimSaveLoadUserTypes_slqtPublishSource_UserType,
  PrimSaveLoadUserTypes_slqtFilters_UserType,
  PrimSaveLoadUserTypes_slqtLegislationReview_UserType,
  PrimSaveLoadUserTypes_slqtPostingOrder_UserType,
  PrimSaveLoadUserTypes_slqtConsult_UserType,
  PrimSaveLoadUserTypes_slqtInpharmSearch_UserType,
  StdRes
  {$If not defined(NoScripts)}
  ,
  tfwScriptingInterfaces
  {$IfEnd} //not NoScripts
  ,
  l3MessageID,
  SysUtils,
  afwFacade
  ;
{$IfEnd} //not Admin

{$If not defined(Admin)}

{$Include w:\garant6x\implementation\Garant\GbaNemesis\Data\Common\nsUserSettingsListener.imp.pas}

var
   { ������������ ������ Local }
  str_FilterCaption : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'FilterCaption'; rValue : '������');
   { '������' }

{$If not defined(Admin) AND not defined(Monitorings)}
type
  TnsLoadQueryEvent = {final} class(TnsLogEvent)
  private
  // private methods
   class procedure Log(const aQuery: IQuery); virtual;
  end;//TnsLoadQueryEvent
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}

// start class TnsLoadQueryEvent

class procedure TnsLoadQueryEvent.Log(const aQuery: IQuery);
//#UC START# *4B138FE70017_4B138FD2022C_var*
var
 l_Data: ILogEventData;
//#UC END# *4B138FE70017_4B138FD2022C_var*
begin
//#UC START# *4B138FE70017_4B138FD2022C_impl*
 l_Data := MakeParamsList;
 l_Data.AddObject(aQuery);
 GetLogger.AddEvent(LE_LOAD_QUERY, l_Data);
//#UC END# *4B138FE70017_4B138FD2022C_impl*
end;//TnsLoadQueryEvent.Log

{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}

type
  TnsSendRequestToLegalAdviceEvent = class(TnsLogEvent)
  private
  // private methods
   class procedure Log;
  end;//TnsSendRequestToLegalAdviceEvent
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}

// start class TnsSendRequestToLegalAdviceEvent

class procedure TnsSendRequestToLegalAdviceEvent.Log;
//#UC START# *4C319C8D03C3_4C319C7A00C0_var*
//#UC END# *4C319C8D03C3_4C319C7A00C0_var*
begin
//#UC START# *4C319C8D03C3_4C319C7A00C0_impl*
 GetLogger.AddEvent(LE_SEND_REQUEST_TO_LEGAL_ADVISE, MakeParamsList);
//#UC END# *4C319C8D03C3_4C319C7A00C0_impl*
end;//TnsSendRequestToLegalAdviceEvent.Log

{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}

type
  TnsLoadQueryFromHistoryEvent = {final} class(TnsLogEvent)
  public
  // public methods
   class procedure Log;
  end;//TnsLoadQueryFromHistoryEvent
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}

// start class TnsLoadQueryFromHistoryEvent

class procedure TnsLoadQueryFromHistoryEvent.Log;
//#UC START# *4C31A2B4020F_4C31A29B00A3_var*
//#UC END# *4C31A2B4020F_4C31A29B00A3_var*
begin
//#UC START# *4C31A2B4020F_4C31A29B00A3_impl*
 GetLogger.AddEvent(LE_LOAD_QUERY_FROM_HISTORY, MakeParamsList);
//#UC END# *4C31A2B4020F_4C31A29B00A3_impl*
end;//TnsLoadQueryFromHistoryEvent.Log

{$IfEnd} //not Admin AND not Monitorings

type
  TvtLabelHack = class(TvtLabel)
  end;//TvtLabelHack

  Tkw_PrimSaveLoad_Control_pnHeader = class(TtfwControlString)
   {* ����� ������� ��� �������������� �������� pnHeader
----
*������ �������������*:
[code]
�������::pnHeader TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimSaveLoad_Control_pnHeader

// start class Tkw_PrimSaveLoad_Control_pnHeader

{$If not defined(NoScripts)}
function Tkw_PrimSaveLoad_Control_pnHeader.GetString: AnsiString;
 {-}
begin
 Result := 'pnHeader';
end;//Tkw_PrimSaveLoad_Control_pnHeader.GetString
{$IfEnd} //not NoScripts

type
  Tkw_PrimSaveLoad_Control_pnHeader_Push = class(TkwBynameControlPush)
   {* ����� ������� ��� �������� pnHeader
----
*������ �������������*:
[code]
�������::pnHeader:push pop:control:SetFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimSaveLoad_Control_pnHeader_Push

// start class Tkw_PrimSaveLoad_Control_pnHeader_Push

{$If not defined(NoScripts)}
procedure Tkw_PrimSaveLoad_Control_pnHeader_Push.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString('pnHeader');
 inherited;
end;//Tkw_PrimSaveLoad_Control_pnHeader_Push.DoDoIt
{$IfEnd} //not NoScripts

type
  Tkw_PrimSaveLoad_Control_lbHeader = class(TtfwControlString)
   {* ����� ������� ��� �������������� �������� lbHeader
----
*������ �������������*:
[code]
�������::lbHeader TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimSaveLoad_Control_lbHeader

// start class Tkw_PrimSaveLoad_Control_lbHeader

{$If not defined(NoScripts)}
function Tkw_PrimSaveLoad_Control_lbHeader.GetString: AnsiString;
 {-}
begin
 Result := 'lbHeader';
end;//Tkw_PrimSaveLoad_Control_lbHeader.GetString
{$IfEnd} //not NoScripts

type
  Tkw_PrimSaveLoad_Control_lbHeader_Push = class(TkwBynameControlPush)
   {* ����� ������� ��� �������� lbHeader
----
*������ �������������*:
[code]
�������::lbHeader:push pop:control:SetFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimSaveLoad_Control_lbHeader_Push

// start class Tkw_PrimSaveLoad_Control_lbHeader_Push

{$If not defined(NoScripts)}
procedure Tkw_PrimSaveLoad_Control_lbHeader_Push.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString('lbHeader');
 inherited;
end;//Tkw_PrimSaveLoad_Control_lbHeader_Push.DoDoIt
{$IfEnd} //not NoScripts

type
  Tkw_PrimSaveLoad_Control_pbHeader = class(TtfwControlString)
   {* ����� ������� ��� �������������� �������� pbHeader
----
*������ �������������*:
[code]
�������::pbHeader TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimSaveLoad_Control_pbHeader

// start class Tkw_PrimSaveLoad_Control_pbHeader

{$If not defined(NoScripts)}
function Tkw_PrimSaveLoad_Control_pbHeader.GetString: AnsiString;
 {-}
begin
 Result := 'pbHeader';
end;//Tkw_PrimSaveLoad_Control_pbHeader.GetString
{$IfEnd} //not NoScripts

type
  Tkw_PrimSaveLoad_Control_pbHeader_Push = class(TkwBynameControlPush)
   {* ����� ������� ��� �������� pbHeader
----
*������ �������������*:
[code]
�������::pbHeader:push pop:control:SetFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimSaveLoad_Control_pbHeader_Push

// start class Tkw_PrimSaveLoad_Control_pbHeader_Push

{$If not defined(NoScripts)}
procedure Tkw_PrimSaveLoad_Control_pbHeader_Push.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString('pbHeader');
 inherited;
end;//Tkw_PrimSaveLoad_Control_pbHeader_Push.DoDoIt
{$IfEnd} //not NoScripts

type
  Tkw_PrimSaveLoad_Control_ParentZone = class(TtfwControlString)
   {* ����� ������� ��� �������������� �������� ParentZone
----
*������ �������������*:
[code]
�������::ParentZone TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimSaveLoad_Control_ParentZone

// start class Tkw_PrimSaveLoad_Control_ParentZone

{$If not defined(NoScripts)}
function Tkw_PrimSaveLoad_Control_ParentZone.GetString: AnsiString;
 {-}
begin
 Result := 'ParentZone';
end;//Tkw_PrimSaveLoad_Control_ParentZone.GetString
{$IfEnd} //not NoScripts

type
  Tkw_PrimSaveLoad_Control_ParentZone_Push = class(TkwBynameControlPush)
   {* ����� ������� ��� �������� ParentZone
----
*������ �������������*:
[code]
�������::ParentZone:push pop:control:SetFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimSaveLoad_Control_ParentZone_Push

// start class Tkw_PrimSaveLoad_Control_ParentZone_Push

{$If not defined(NoScripts)}
procedure Tkw_PrimSaveLoad_Control_ParentZone_Push.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString('ParentZone');
 inherited;
end;//Tkw_PrimSaveLoad_Control_ParentZone_Push.DoDoIt
{$IfEnd} //not NoScripts

procedure TPrimSaveLoadForm.UpdateLabel(aSender: TObject);
//#UC START# *4D7131F40095_4958E3AB0247_var*

 function NotEmptySuffix(const aSt: String; const aSep : String): String;
 begin//NotEmptySuffix
  Result := Trim(ev_psSuffix(aSt, aSep));
  if (Result = '') then
   Result := aSt;
 end;//NotEmptySuffix

const
 cMagic1 = ' - ';
 cMagic2 = ' : ';
var
 l_S : String;
//#UC END# *4D7131F40095_4958E3AB0247_var*
begin
//#UC START# *4D7131F40095_4958E3AB0247_impl*
 if IsDictionLike then
  l_S := CurUserType.Caption
 else
 if (UserType = slqtFilters) then
  l_S := str_FilterCaption.AsStr
 else
 begin
  l_S := l3Str(NativeMainForm.AsForm.Caption);
  if ANSIEndsStr(cMagic1, l_S) then
   l_S := ''
  else
  begin
   l_S := NotEmptySuffix(l_S, cMagic1);
   l_S := NotEmptySuffix(l_S, cMagic2);
  end;//ANSIEndsStr(cMagic1, l_S)
 end;//IsDictionLike
 (aSender As TAction).Caption := l_S;
 (aSender As TAction).Enabled := true;
 if (pnHeader.Width - lbHeader.Left < lbHeader.Width) then
  TvtLabelHack(lbHeader).AdjustBounds;
//#UC END# *4D7131F40095_4958E3AB0247_impl*
end;//TPrimSaveLoadForm.UpdateLabel

procedure TPrimSaveLoadForm.PbHeaderPaint(aSender: TObject);
//#UC START# *4D722A0903AC_4958E3AB0247_var*
//#UC END# *4D722A0903AC_4958E3AB0247_var*
begin
//#UC START# *4D722A0903AC_4958E3AB0247_impl*
 if (CurUserType <> nil) AND (CurUserType.ImageIndex >= 0) then
  with (aSender as TPaintBox) do
   dmStdRes.LargeImageList.Draw(Canvas,
                                Width - c_LargeSizeIcon,
                                (Height - c_LargeSizeIcon) div 2 + 2,
                                CurUserType.ImageIndex);
//#UC END# *4D722A0903AC_4958E3AB0247_impl*
end;//TPrimSaveLoadForm.PbHeaderPaint

procedure TPrimSaveLoadForm.HeaderResize(aSender: TObject);
//#UC START# *4D7FA1E40348_4958E3AB0247_var*
//#UC END# *4D7FA1E40348_4958E3AB0247_var*
begin
//#UC START# *4D7FA1E40348_4958E3AB0247_impl*
 TvtLabelHack(lbHeader).AdjustBounds;
//#UC END# *4D7FA1E40348_4958E3AB0247_impl*
end;//TPrimSaveLoadForm.HeaderResize

function TPrimSaveLoadForm.HideOpForPostingOrder(const aParams: IvcmTestParamsPrim): Boolean;
//#UC START# *4C3180320290_4958E3AB0247_var*
//#UC END# *4C3180320290_4958E3AB0247_var*
begin
//#UC START# *4C3180320290_4958E3AB0247_impl*
 if not IsDictionLike AND (UserType = slqtPostingOrder) then
 // �.�. �������� �������� � ������� ����, �� ��-������� �� ������ ������
 begin
  aParams.Op.Flag[vcm_ofVisible] := False;
  Result := True;
 end//UserType = slqtPostingOrder
 else
  Result := False;
//#UC END# *4C3180320290_4958E3AB0247_impl*
end;//TPrimSaveLoadForm.HideOpForPostingOrder

{$If not defined(Admin) AND not defined(Monitorings)}
function TPrimSaveLoadForm.MakeFilterInfo: InsFolderFilterInfo;
//#UC START# *4C3184C400C5_4958E3AB0247_var*
var
 l_FilterType: TnsFolderFilter;
//#UC END# *4C3184C400C5_4958E3AB0247_var*
begin
//#UC START# *4C3184C400C5_4958E3AB0247_impl*
 if IsDictionLike then
 begin
  Result := nil;
  Assert(false);
 end//IsDictionLike
 else
 begin
  case UserType of
   slqtFilters:
   begin
    //l_FilterType := ffFilter;
    l_FilterType := ffQuery;
    Assert(false);
   end;//slqtFilters
   else
    l_FilterType := ffQuery;
  end;//case UserType
  Result := TnsFolderFilterInfo.Make(l_FilterType,
                                     nsListTypeToFilterFor(ListType));
 end;//IsDictionLike
//#UC END# *4C3184C400C5_4958E3AB0247_impl*
end;//TPrimSaveLoadForm.MakeFilterInfo
{$IfEnd} //not Admin AND not Monitorings

function TPrimSaveLoadForm.IsOkBtn: Boolean;
//#UC START# *4C3193B60045_4958E3AB0247_var*
{$If defined(Monitorings) or defined(Admin)}
{$Else}
var
 l_UserType: TvcmUserType;
{$IfEnd} 
//#UC END# *4C3193B60045_4958E3AB0247_var*
begin
//#UC START# *4C3193B60045_4958E3AB0247_impl*
 {$If defined(Monitorings) or defined(Admin)}
 Result := false;
 {$Else}
 if IsDictionLike then
 begin
  Result := false;
  Assert(false);
 end//IsDictionLike
 else
 begin
  l_UserType := UserType;
  Result := not ((l_UserType = slqtFilters) or (l_UserType = slqtPostingOrder));
 end;//IsDictionLike
 {$IfEnd}
//#UC END# *4C3193B60045_4958E3AB0247_impl*
end;//TPrimSaveLoadForm.IsOkBtn

procedure TPrimSaveLoadForm.LoadQueryHistory;
//#UC START# *4C3195370120_4958E3AB0247_var*
var
 l_HistoryType  : TQueryType;
 l_QueryHistory : IQueryList;
 I,
 l_HistoryCount : LongInt;
 l_Query        : IQuery;
 l_QueryName    : Il3CString;
 l_Item         : Tl3DataIntfString;
const
 cRecentlyOpenQueriesCount = 5;
//#UC END# *4C3195370120_4958E3AB0247_var*
begin
//#UC START# *4C3195370120_4958E3AB0247_impl*
 if IsDictionLike then
 begin
  Assert(false);
  Exit;
 end;//IsDictionLike
 QueryHistory.Clear;
 f_LastQueryIndex := 0;
 case UserType of
   slqtAttribute: l_HistoryType := QT_ATTRIBUTE;
   slqtKW,
   slqtOldKW : l_HistoryType := QT_KEYWORD;
   slqtPublishSource : l_HistoryType := QT_PUBLISHED_SOURCE;
   slqtLegislationReview : l_HistoryType := QT_REVIEW;
   slqtInpharmSearch : l_HistoryType := QT_PHARM_SEARCH;
  else
   exit; // ������� ��� �������� �� �������
 end;
 l_HistoryCount := cRecentlyOpenQueriesCount;
 try
  defDataAdapter.NativeAdapter.MakeUserJournal.GetQueryHistory(l_HistoryType, l_HistoryCount,
   l_QueryHistory);
  if (l_QueryHistory <> nil) then
   try
    l_HistoryCount := l_QueryHistory.Count;
    if (l_HistoryCount > 0) then
     for I := 0 to Pred(l_HistoryCount) do
     begin
      l_QueryHistory.pm_GetItem(I, l_Query);
      try
       l_QueryName := nsGetQueryName(l_Query);
       if l3IsNil(l_QueryName) then
       begin
        l_QueryName := nsCreateQueryName(l_Query);
        l_Query.SetName(nsIStr(l_QueryName));
       end;//l3IsNil(l_QueryName)
       l_Item := Tl3DataIntfString.Make(l_QueryName, l_Query);
       try
        QueryHistory.Add(l_Item);
       finally
        FreeAndNil(l_Item);
       end;//try..finally
      finally
       l_Query := nil;
      end;//try..finally
     end;//for I
   finally
    l_QueryHistory := nil;
   end;//try..finally
 except
  // � ������� �������� ���
  on ECanNotFindData do
 end;//try..except
//#UC END# *4C3195370120_4958E3AB0247_impl*
end;//TPrimSaveLoadForm.LoadQueryHistory

{$If not defined(Admin) AND not defined(Monitorings)}
procedure TPrimSaveLoadForm.FillQueryAndSearch;
//#UC START# *4C3195EA025F_4958E3AB0247_var*

 procedure lp_Search(const aQuery   : IQuery;
                     const aFilters : IFiltersFromQuery = nil;
                     const aList    : IDynList = nil);

   function GetPermanentFilters(aListType: TbsListType): IFiltersFromQuery;
   var
    l_Filters: IFiltersFromQuery;
    I: Integer;
    l_Filter: IFilterFromQuery;
   begin
    Result := DefDataAdapter.NativeAdapter.MakeFiltersFromQuery;
    case aListType of
     bs_ltDocument: DefDataAdapter.NativeAdapter.MakeFiltersManager.GetLegalFilters(l_Filters);
     bs_ltDrug: DefDataAdapter.NativeAdapter.MakeFiltersManager.GetPharmFilters(l_Filters);
    end;
    for I := 0 to l_Filters.Count - 1 do
    begin
     l_Filters.pm_GetItem(I, l_Filter);
     if l_Filter.GetPermanent then
      Result.Add(l_Filter);
    end;
   end;

 var
  l_Filters: IFiltersFromQuery;
 begin
  {$If not (defined(Monitorings) or defined(Admin))}
  // ��� ������ ��������� ���������������� ������� �� �����������
  // http://mdp.garant.ru/pages/viewpage.action?pageId=363584635
  if (aQuery.GetType <> QT_REVIEW) then
  begin
   if aFilters <> nil then
    l_Filters := aFilters
   else
    l_Filters := GetPermanentFilters(ListType);//defDataAdapter.FiltersContainer(ListType).PermanentFilters;
  end;
  {$ELSE Monitorings}
  l_Filters := aFilters;
  {$IfEnd not (defined(Monitorings) or defined(Admin))}
  nsSearch(aQuery,
           l_Filters,
           bsBuildFullList(aList),
           Self);
 end;//lp_Search

var
 l_ListData     : IdeList;
 l_List         : IDynList;
 l_FiltersIntf  : IFiltersFromQuery;
 l_QueryType    : TlgQueryType;
 l_QueryParams  : TnsQueryInfo;
//#UC END# *4C3195EA025F_4958E3AB0247_var*
begin
//#UC START# *4C3195EA025F_4958E3AB0247_impl*
 if IsDictionLike then
 begin
  Assert(false);
  Exit;
 end;//IsDictionLike
 // �������� ����������� Query �� ��
 if (Aggregate <> nil) then
 begin
  if UserType in [slqtPublishSource, slqtOldKW, slqtKW] then
   Op_AttributeTree_AddNodeIfEmpty.Call(Aggregate);

  l_QueryParams := Op_SearchParameters_GetQuery.Call(Aggregate);
  if not l_QueryParams.rHasErrors then
  begin
   l_QueryType := AdapterQueryToBusinessQuery(l_QueryParams.rQuery.GetType);
   // ��� ������ ���������������� ��������� ����� �� ������ ��
   if (l_QueryType = lg_qtLegislationReview) then
   begin
    if Op_SearchParameters_IsQueryEmpty.Call(Aggregate) then
    begin
     Say(inf_QueryIsEmptyCantBuild);
     exit;
    end;//Op_SearchParameters_IsQueryEmpty.Call(Aggregate)
   end;//l_QueryType = lg_qtLegislationReview

   if (l_QueryType = lg_qtSendConsultation) then
   begin
    if not defDataAdapter.ConsultationManager.CheckConsultingAvailable then
    begin
     Say(war_NoSubscription, [defDataAdapter.GetDealerInfo]);
     op_SearchParameter_QueryNotSaved.Call(Aggregate);
    end
    else
    begin
     try
      {$If not Defined(Admin) and not Defined(Monitorings)}
      TnsSendRequestToLegalAdviceEvent.Log;
      {$IfEnd}
      l_QueryParams.rQuery.SendQuery;
      Say(inf_ConsultationSuccessSend);
      op_SearchParameters_ClearQuery.Call(Aggregate);
     except
      on ENoConnection do
       begin
        Say(war_NoConnectionOnSend, [defDataAdapter.GetDealerInfo]);
        op_SearchParameter_QueryNotSaved.Call(Aggregate);
       end;
      on ENoSubscription do
       begin
        Say(war_NoSubscription, [defDataAdapter.GetDealerInfo]);
        op_SearchParameter_QueryNotSaved.Call(Aggregate);
       end;
     end;
    end;
   end//if (l_QueryType = lg_qtSendConsultation) then
   else
   begin
    l_ListData := Op_Query_GetList.Call(Self.As_IvcmEntityForm);
    try
     if (l_ListData <> nil) then
      l_List := l_ListData.List
     else
      l_List := nil;
    finally
     l_ListData := nil;
    end;//try..finally
    try
     if not l_QueryParams.rAskFilters then
     begin
      if (l_QueryParams.rFilter <> nil) then
      begin
       l_FiltersIntf := defDataAdapter.NativeAdapter.MakeFiltersFromQuery;
       l_FiltersIntf.Add(l_QueryParams.rFilter);
       lp_Search(l_QueryParams.rQuery,
                 l_FiltersIntf,
                 l_List);
      end//l_QueryParams.rNode <> nil
      else
       lp_Search(l_QueryParams.rQuery,
                 nil,
                 l_List);
     end//not l_QueryParams.rAskFilters
     else
      lp_Search(l_QueryParams.rQuery,
                op_Filters_GetSelected.Call(Aggregate),
                l_List);
    finally
     l_List := nil;
    end;//try..finally
   end;//l_QueryType = lg_qtSendConsultation
  end;//not l_QueryParams.rHasErrors
 end;//Aggregate <> nil
//#UC END# *4C3195EA025F_4958E3AB0247_impl*
end;//TPrimSaveLoadForm.FillQueryAndSearch
{$IfEnd} //not Admin AND not Monitorings

procedure TPrimSaveLoadForm.EnResultopSaveExecute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C31965803C6_4958E3AB0247_var*

{$IFNDEF Monitorings}
 procedure SaveQuery(const aQuery   : IQuery;
                     aIsFilterQuery : Boolean;
                     SaveAs         : Boolean);
 var
  l_Result: Boolean;
 begin//
  if not aQuery.IsFilterQuery AND not aIsFilterQuery then
  begin
   l_Result := false;
   Assert(false);
   // - ��������� - ��� �� � ���� ����� ������� ���������
(*   l_Result := TdmStdRes.SaveOpen(Self.As_IvcmEntityForm,
                         MakeFilterInfo,
                         fetFilter,
                         aQuery,
                         SaveAs) = mrOk*)
  end                       
  else
   l_Result := TdmStdRes.CreateFilter(aQuery) = mrOk;
  if l_Result AND (ZoneType = vcm_ztManualModal) then
   ModalResult := mrOk;
 end;//SaveQuery

var
 l_Params: TnsQueryInfo;
 l_CurEntity: IEntityBase;
 l_IsSave: Boolean;
 l_Desision: Boolean;
 l_EntityStorage: IEntityStorage;
{$ENDIF Monitorings}
//#UC END# *4C31965803C6_4958E3AB0247_var*
begin
//#UC START# *4C31965803C6_4958E3AB0247_impl*
 {$IFDEF Monitorings}
 if TnsPostingsTreeSingle.Instance.SaveOrCreateQuery then
  op_SearchParameter_QuerySaved.Call(Aggregate);
 {$ELSE}
 // �������� ����������� Query �� ��
 if (Aggregate <> nil) then
 begin
  // ��� ������ �������� ��������� ���������� ������ ��
  l_Params := Op_SearchParameters_GetQuery.Call(Aggregate);
  if not l_Params.rHasErrors then
  begin
   if Supports(l_Params.rQuery, IEntityBase, l_CurEntity) then
    try
     if l_CurEntity.GetIsSaved then
     begin
      // ��������� ��� �������
      if l_Params.rQuery.IsFilterQuery OR l_Params.rIsQueryForFilter then
       l_IsSave := Ask(qr_FilterWasSaved, [nsGetQueryName(l_Params.rQuery)])
      // ��������� ��� �������
      else
       l_IsSave := Ask(qr_QueryWasSaved);
      // ������������ ������� ������������
      if l_IsSave then
      begin
       try
        l_CurEntity.SaveTo(nil, l_EntityStorage);
       except
        on EAccessDenied do
        begin
         l_Desision := Ask(qr_SaveAsReadOnlyFilter);
         if l_Desision then
          SaveQuery(l_Params.rQuery, l_Params.rIsQueryForFilter, True);
         Exit;
        end;//on EAccessDenied
        on ECanNotSave do
        begin
         Say(err_CannotSave, [nsGetQueryName(l_Params.rQuery)]);
         Exit;
        end;//on ECanNotSave
        on ENotSaved do
        begin
         Say(err_NotSaved);
         Exit;
        end;//on ENotSaved
       end;//try..except
       if (ZoneType = vcm_ztManualModal) then
        ModalResult := mrOk;
      end//l_IsSave
      else
        SaveQuery(l_Params.rQuery, l_Params.rIsQueryForFilter, True);
     end//l_CurEntity.GetIsSaved
     else
      // ��������� Query � �����
      SaveQuery(l_Params.rQuery, l_Params.rIsQueryForFilter, false);
    finally
     l_CurEntity := nil;
    end//try..finally
  end;//not l_Params.rHasErrors
 end;//Aggregate <> nil
 {$ENDIF Monitorings}
//#UC END# *4C31965803C6_4958E3AB0247_impl*
end;//TPrimSaveLoadForm.EnResultopSaveExecute

class function TPrimSaveLoadForm.IsDictionLike: Boolean;
//#UC START# *4F5DB2320323_4958E3AB0247_var*
//#UC END# *4F5DB2320323_4958E3AB0247_var*
begin
//#UC START# *4F5DB2320323_4958E3AB0247_impl*
 Result := false;
//#UC END# *4F5DB2320323_4958E3AB0247_impl*
end;//TPrimSaveLoadForm.IsDictionLike

class function TPrimSaveLoadForm.NsIsQueryTypeCompatibleToQueryFormType(aQueryType: TQueryType;
  aFormType: TvcmUserType): Boolean;
//#UC START# *4F5E079B0368_4958E3AB0247_var*
//#UC END# *4F5E079B0368_4958E3AB0247_var*
begin
//#UC START# *4F5E079B0368_4958E3AB0247_impl*
 if IsDictionLike then
 begin
  Result := false;
  Assert(false);
  Exit;
 end;//IsDictionLike
 case aFormType of
  slqtAttribute:
   Result := aQueryType in [QT_ATTRIBUTE
                            {,
                            QT_OLD_ATTRIBUTE,
                            QT_OLD_FILTER}];
  slqtKW:
   Result := aQueryType = QT_KEYWORD;
  slqtOldKW:
   Result := aQueryType = QT_KEYWORD;
  slqtPublishSource:
   Result := aQueryType = QT_PUBLISHED_SOURCE;
(*  slqtFilters:
   Result := aQueryType = QT_OLD_FILTER;*)
  slqtLegislationReview:
   Result := aQueryType = QT_REVIEW;
  slqtPostingOrder:
   Result := aQueryType = QT_MAIL_LIST;
  slqtInpharmSearch:
   Result := aQueryType = QT_PHARM_SEARCH;
  else
   Result := False;
 end;//case aFormType
//#UC END# *4F5E079B0368_4958E3AB0247_impl*
end;//TPrimSaveLoadForm.NsIsQueryTypeCompatibleToQueryFormType

class function TPrimSaveLoadForm.IsBaseSearchLike: Boolean;
//#UC START# *502289FB008D_4958E3AB0247_var*
//#UC END# *502289FB008D_4958E3AB0247_var*
begin
//#UC START# *502289FB008D_4958E3AB0247_impl*
 Result := false;
//#UC END# *502289FB008D_4958E3AB0247_impl*
end;//TPrimSaveLoadForm.IsBaseSearchLike

function TPrimSaveLoadForm.pm_GetQueryHistory: TvcmItems;
//#UC START# *4C319872011D_4958E3AB0247get_var*
//#UC END# *4C319872011D_4958E3AB0247get_var*
begin
//#UC START# *4C319872011D_4958E3AB0247get_impl*
 if f_QueryHistory = nil then
  f_QueryHistory := TvcmItems.Create;
 Result := f_QueryHistory;
//#UC END# *4C319872011D_4958E3AB0247get_impl*
end;//TPrimSaveLoadForm.pm_GetQueryHistory

function TPrimSaveLoadForm.pm_GetSearchState: InsSearchTypeState;
//#UC START# *4C31AA0F017A_4958E3AB0247get_var*
//#UC END# *4C31AA0F017A_4958E3AB0247get_var*
begin
//#UC START# *4C31AA0F017A_4958E3AB0247get_impl*
 if (f_SearchState = nil) then
  f_SearchState := TnsSearchTypeState.Make;
 Result := f_SearchState;
//#UC END# *4C31AA0F017A_4958E3AB0247get_impl*
end;//TPrimSaveLoadForm.pm_GetSearchState

function TPrimSaveLoadForm.IsNewQueryCard: Boolean;
//#UC START# *4AE89F6E02E3_4958E3AB0247_var*
//#UC END# *4AE89F6E02E3_4958E3AB0247_var*
begin
//#UC START# *4AE89F6E02E3_4958E3AB0247_impl*
 Result := False;
 if IsDictionLike then
 begin
  Assert(false);
  Exit;
 end;//IsDictionLike
 case UserType of
  slqtAttribute,
  slqtLegislationReview,
  slqtPostingOrder,
  slqtConsult,
  slqtInpharmSearch :
   Result := True;
  slqtFilters:
   Result := HasForm(fm_enQueryCard.rFormID);
 end;//case UserType of
//#UC END# *4AE89F6E02E3_4958E3AB0247_impl*
end;//TPrimSaveLoadForm.IsNewQueryCard

function TPrimSaveLoadForm.ListType: TbsListType;
//#UC START# *4AE9C89601E6_4958E3AB0247_var*
//#UC END# *4AE9C89601E6_4958E3AB0247_var*
begin
//#UC START# *4AE9C89601E6_4958E3AB0247_impl*
 if IsDictionLike then
 begin
  Result := bs_ltNone;
  Assert(false);
  Exit;
 end;//IsDictionLike
 if UserType = slqtInpharmSearch then
  Result := bs_ltDrug
 else
  Result := bs_ltDocument;
//#UC END# *4AE9C89601E6_4958E3AB0247_impl*
end;//TPrimSaveLoadForm.ListType

procedure TPrimSaveLoadForm.SearchResultEmpty(TryFullList: Boolean);
//#UC START# *496B4FAA02FA_4958E3AB0247_var*
var
 l_Processor: InsBaseSearchResultProcessor;
//#UC END# *496B4FAA02FA_4958E3AB0247_var*
begin
//#UC START# *496B4FAA02FA_4958E3AB0247_impl*
 if Supports(NativeMainForm, InsBaseSearchResultProcessor, l_Processor) then
  l_Processor.SearchResultEmpty(TryFullList);
//#UC END# *496B4FAA02FA_4958E3AB0247_impl*
end;//TPrimSaveLoadForm.SearchResultEmpty

procedure TPrimSaveLoadForm.SearchResultExists;
//#UC START# *496B4FC70065_4958E3AB0247_var*
var
 l_Processor: InsBaseSearchResultProcessor;
//#UC END# *496B4FC70065_4958E3AB0247_var*
begin
//#UC START# *496B4FC70065_4958E3AB0247_impl*
 op_SearchParameter_ClearMistakes.Call(Aggregate);
 if Supports(NativeMainForm, InsBaseSearchResultProcessor, l_Processor) then
  l_Processor.SearchResultExists;
//#UC END# *496B4FC70065_4958E3AB0247_impl*
end;//TPrimSaveLoadForm.SearchResultExists

procedure TPrimSaveLoadForm.AnotherSearchSuccessed;
//#UC START# *496B4FD20320_4958E3AB0247_var*
var
 l_Processor: InsBaseSearchResultProcessor;
//#UC END# *496B4FD20320_4958E3AB0247_var*
begin
//#UC START# *496B4FD20320_4958E3AB0247_impl*
 if Supports(NativeMainForm, InsBaseSearchResultProcessor, l_Processor) then
  l_Processor.AnotherSearchSuccessed;
//#UC END# *496B4FD20320_4958E3AB0247_impl*
end;//TPrimSaveLoadForm.AnotherSearchSuccessed

procedure TPrimSaveLoadForm.File_SaveToFolder_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *49885D540232_4958E3AB0247test_var*
//#UC END# *49885D540232_4958E3AB0247test_var*
begin
//#UC START# *49885D540232_4958E3AB0247test_impl*
 if not HideOpForPostingOrder(aParams) and Assigned(Aggregate) then
  with aParams.Op.SubItems do
  begin
   Clear;
   if Op_SearchParameters_IsQuerySaved.Call(Aggregate) then
   begin
    Add(vcmCStr(str_SaveLoadOverride));
    Add(vcmCStr(str_SaveLoadSaveAs));
   end;//TSearchParameter_IsQuerySaved_Op.Call(Aggregate)
  end;//with aParams.Op.SubItems
//#UC END# *49885D540232_4958E3AB0247test_impl*
end;//TPrimSaveLoadForm.File_SaveToFolder_Test

procedure TPrimSaveLoadForm.File_SaveToFolder_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *49885D540232_4958E3AB0247exec_var*
var
 l_CurOpsIndex   : Integer;
 l_CurName       : Il3CString;
 l_QueryIsEmpty  : Boolean;
 l_EntityBase    : IEntityBase;
 l_EntityStorage : IEntityStorage;
 l_QueryType     : TlgQueryType;
 l_QueryParams   : TnsQueryInfo;
//#UC END# *49885D540232_4958E3AB0247exec_var*
begin
//#UC START# *49885D540232_4958E3AB0247exec_impl*
 if IsDictionLike then
 begin
  Assert(false);
  Exit;
 end;//IsDictionLike
 l_QueryIsEmpty := False;

 l_CurOpsIndex := aParams.ItemIndex;

 if (l_CurOpsIndex >= 0) and (Aggregate <> nil) then
 begin
  if Op_SearchParameters_IsQueryEmpty.Call(Aggregate) then
  begin
   l_QueryIsEmpty := True;
   if (UserType <> slqtLegislationReview) and
     not Ask(qr_QueryIsEmpty) then Exit;
  end;//Op_SearchParameters_IsQueryEmpty.Call(Aggregate)
  // �������� ����������� Query �� ��
  l_QueryParams := Op_SearchParameters_GetQuery.Call(Aggregate);
  if not l_QueryParams.rHasErrors then
   begin
    l_QueryType := AdapterQueryToBusinessQuery(l_QueryParams.rQuery.GetType);
    // ��� ������ ���������������� ��������� ���������� ������ ��
    if (l_QueryType = lg_qtLegislationReview) and
       l_QueryIsEmpty then
    begin
     Say(inf_QueryIsEmptyCantSave);
     exit;
    end;//l_QueryType = lg_qtLegislationReview
    if Supports(l_QueryParams.rQuery, IEntityBase, l_EntityBase) then
    try
     if l_EntityBase.GetIsSaved then
      case l_CurOpsIndex of
       1 :
       begin
        l_CurName := nsGetQueryName(l_QueryParams.rQuery);
        if Ask(qr_QueryWasSavedEx, [l_CurName]) then
         try
          /////////////////////////////////////////
          // ��������� http://mdp.garant.ru/pages/viewpage.action?pageId=321985983
          // -����������� �������� ����� ������� �� �������?
          // -���, ��� � ���������� ��������� ����������, ����� ������ �� ���������� ��� ��������, � ����� ��� (��. ������ ����) ������ ������
          if (l_CurOpsIndex >= 0) and (Aggregate <> nil) and (not l_QueryIsEmpty) and Op_SearchParameters_IsQueryEmpty.Call(Aggregate) then
          begin
           File_SaveToFolder_Execute(aParams);
           Exit;
          end;
          /////////////////////////////////////////
          l_EntityBase.SaveTo(nil, l_EntityStorage);
         except
          on EAccessDenied do
           Say(err_SaveReadOnlyQuery);
          on ECanNotSave do
           Say(err_CannotSave, [l_CurName]);
          on ENotSaved do
           Say(err_NotSaved);
         end;//try..except
       end;//1
       0, 2 :
        {$IFDEF Monitorings}
        Assert(false);
        {$Else  Monitorings}
        TdmStdRes.SaveOpen(Self.As_IvcmEntityForm,
                           MakeFilterInfo,
                           fetQuery,
                           l_EntityBase,
                           True);
        {$EndIF  Monitorings}
       else
        Assert(false);
      end//case l_CurOpsIndex
     else
     begin
      // ��������� Query � �����
      {$IFDEF Monitorings}
      Assert(false);
      {$Else  Monitorings}
      TdmStdRes.SaveOpen(Self.As_IvcmEntityForm,
                         MakeFilterInfo,
                         fetQuery,
                         l_EntityBase,
                         false);
      {$EndIF Monitorings}
     end;//l_EntityBase.GetIsSaved
    finally
     l_EntityBase := nil;
    end;//try..finally
   end;//not l_QueryParams.rHasErrors
 end//l_CurOpsIndex >= 0
 else
  aParams.DoneStatus := vcm_dsInvalidParams;
  // - ��� �����, ����� ���������� �� ShortCut'�
//#UC END# *49885D540232_4958E3AB0247exec_impl*
end;//TPrimSaveLoadForm.File_SaveToFolder_Execute

procedure TPrimSaveLoadForm.File_LoadFromFolder_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *49885D59018D_4958E3AB0247test_var*
//#UC END# *49885D59018D_4958E3AB0247test_var*
begin
//#UC START# *49885D59018D_4958E3AB0247test_impl*
 HideOpForPostingOrder(aParams);
//#UC END# *49885D59018D_4958E3AB0247test_impl*
end;//TPrimSaveLoadForm.File_LoadFromFolder_Test

procedure TPrimSaveLoadForm.File_LoadFromFolder_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *49885D59018D_4958E3AB0247exec_var*
//#UC END# *49885D59018D_4958E3AB0247exec_var*
begin
//#UC START# *49885D59018D_4958E3AB0247exec_impl*
 // ����� Query �� �����
 {$IFDEF Monitorings}
 Assert(false);
 {$Else  Monitorings}
 TdmStdRes.LoadOpen(Self.As_IvcmEntityForm, MakeFilterInfo);
 {$EndIF Monitorings}
//#UC END# *49885D59018D_4958E3AB0247exec_impl*
end;//TPrimSaveLoadForm.File_LoadFromFolder_Execute

function TPrimSaveLoadForm.Loadable_Load_Execute(const aNode: IeeNode;
  const aData: IUnknown;
  anOp: TListLogicOperation = LLO_NONE): Boolean;
//#UC START# *49895A2102E8_4958E3AB0247exec_var*
const
 cQueryType: array [TQueryType] of PvcmStringID =
                      (@str_qtKeyWord,
                       @str_qtAttribute,
                       //@str_qtOldAttribute,
                       //@str_qtOldFilter,
                       @str_qtPublishSource,
                       @str_qtComments,
                       @str_qtReview,
                       @str_qtMailList,
                       @str_qtRubricator,
                       @str_Empty,
                       @str_qtConsultation,
                       @str_Empty,
                       @str_qtBaseSearch,
                       @str_qtInpharmSearch);
var
 l_FolderNode : INode;
 l_BaseEntity : IUnknown;
 l_Query      : IQuery;
 l_QueryType  : TQueryType;
//#UC END# *49895A2102E8_4958E3AB0247exec_var*
begin
//#UC START# *49895A2102E8_4958E3AB0247exec_impl*
 Result := true;
 if Supports(aNode, INode, l_FolderNode) then
  try
   l_FolderNode.Open(l_BaseEntity);
   try
    if Supports(l_BaseEntity, IQuery, l_Query) then
     try
      l_QueryType := l_Query.GetType;
      if nsIsQueryTypeCompatibleToQueryFormType(l_QueryType,
                                                UserType) then
      begin
       {$If not defined(Monitorings)}
       TnsLoadQueryEvent.Log(l_Query);
       {$IfEnd}
       // �������� Query � �� ��� ����������
       op_SearchParameters_SetQuery.Call(Aggregate, l_Query);
      end
      else
      begin
       Assert(CurUserType <> nil);
       Say(inf_WrongQueryType, [vcmCStr(cQueryType[l_QueryType]^),
                                CurUserType.Caption]);
       Result := false;
      end;//nsIsQueryTypeCompatibleToQueryFormType
     finally
      l_Query := nil;
     end;//try..finally
   finally
    l_BaseEntity := nil;
   end;//try..finally
  finally
   l_FolderNode := nil;
  end;//try..finally
//#UC END# *49895A2102E8_4958E3AB0247exec_impl*
end;//TPrimSaveLoadForm.Loadable_Load_Execute

procedure TPrimSaveLoadForm.Loadable_Load(const aParams: IvcmExecuteParams);
begin
 with (aParams.Data As ILoadable_Load_Params) do
  ResultValue := Loadable_Load_Execute(Node, Data, nOp);
end;

procedure TPrimSaveLoadForm.JournalShrinked;
//#UC START# *4A83AA610299_4958E3AB0247_var*
//#UC END# *4A83AA610299_4958E3AB0247_var*
begin
//#UC START# *4A83AA610299_4958E3AB0247_impl*
 if not IsDictionLike then
  LoadQueryHistory;
//#UC END# *4A83AA610299_4958E3AB0247_impl*
end;//TPrimSaveLoadForm.JournalShrinked

procedure TPrimSaveLoadForm.Result_OkExt_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4A8AD47D0357_4958E3AB0247test_var*
//#UC END# *4A8AD47D0357_4958E3AB0247test_var*
begin
//#UC START# *4A8AD47D0357_4958E3AB0247test_impl*
 // - ������ �� ������
//#UC END# *4A8AD47D0357_4958E3AB0247test_impl*
end;//TPrimSaveLoadForm.Result_OkExt_Test

procedure TPrimSaveLoadForm.Result_OkExt_GetState(var State: TvcmOperationStateIndex);
//#UC START# *4A8AD47D0357_4958E3AB0247getstate_var*
var
 l_UserType: TvcmUserType;
//#UC END# *4A8AD47D0357_4958E3AB0247getstate_var*
begin
//#UC START# *4A8AD47D0357_4958E3AB0247getstate_impl*
 if IsDictionLike then
 begin
  Assert(false);
  Exit;
 end;//IsDictionLike
 l_UserType := UserType;
 if (l_UserType = slqtConsult) then 
  State := st_user_Result_OkExt_Consult
 else 
 if IsOkBtn then
  State := st_user_Result_OkExt_Search
 else
  State := st_user_Result_OkExt_Save;
//#UC END# *4A8AD47D0357_4958E3AB0247getstate_impl*
end;//TPrimSaveLoadForm.Result_OkExt_GetState

procedure TPrimSaveLoadForm.Result_OkExt_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4A8AD47D0357_4958E3AB0247exec_var*
//#UC END# *4A8AD47D0357_4958E3AB0247exec_var*
begin
//#UC START# *4A8AD47D0357_4958E3AB0247exec_impl*
 if IsOkBtn then
 begin
  {$If defined(Monitorings) or defined(Admin)}
  Assert(false);
  {$Else}
  FillQueryAndSearch;
  LoadQueryHistory;
  {$IfEnd}
 end//IsOkBtn
 else 
  enResultopSaveExecute(aParams);
//#UC END# *4A8AD47D0357_4958E3AB0247exec_impl*
end;//TPrimSaveLoadForm.Result_OkExt_Execute

procedure TPrimSaveLoadForm.Result_Cancel_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4AC5D61E0284_4958E3AB0247test_var*
//#UC END# *4AC5D61E0284_4958E3AB0247test_var*
begin
//#UC START# *4AC5D61E0284_4958E3AB0247test_impl*
 // - ������ �� ������
//#UC END# *4AC5D61E0284_4958E3AB0247test_impl*
end;//TPrimSaveLoadForm.Result_Cancel_Test

procedure TPrimSaveLoadForm.Result_Cancel_GetState(var State: TvcmOperationStateIndex);
//#UC START# *4AC5D61E0284_4958E3AB0247getstate_var*
//#UC END# *4AC5D61E0284_4958E3AB0247getstate_var*
begin
//#UC START# *4AC5D61E0284_4958E3AB0247getstate_impl*
 // - ������ �� ������
//#UC END# *4AC5D61E0284_4958E3AB0247getstate_impl*
end;//TPrimSaveLoadForm.Result_Cancel_GetState

procedure TPrimSaveLoadForm.Result_Cancel_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4AC5D61E0284_4958E3AB0247exec_var*
//#UC END# *4AC5D61E0284_4958E3AB0247exec_var*
begin
//#UC START# *4AC5D61E0284_4958E3AB0247exec_impl*
 if ZoneType = vcm_ztManualModal then
  ModalResult := mrCancel
 else
  vcmDispatcher.History.Back;
//#UC END# *4AC5D61E0284_4958E3AB0247exec_impl*
end;//TPrimSaveLoadForm.Result_Cancel_Execute

procedure TPrimSaveLoadForm.Query_ClearAll_Execute(aNotClearRange: Boolean);
//#UC START# *4AE8A0E10254_4958E3AB0247exec_var*
//#UC END# *4AE8A0E10254_4958E3AB0247exec_var*
begin
//#UC START# *4AE8A0E10254_4958E3AB0247exec_impl*
 if not aNotClearRange then
 begin
  with SearchState do
  begin
   if List <> nil then
    SearchType := stAllBase
   else
    SearchType := stNone;
  end;//SearchState
 end;//not aNotClearRange
 if (Aggregate <> nil) then
 begin
  op_SearchParameters_ClearQuery.Call(Aggregate);
  Op_List_SetNewContent.Call(Aggregate);
   // - �������� ������� �� ���������.
 end;//Aggregate <> nil
//#UC END# *4AE8A0E10254_4958E3AB0247exec_impl*
end;//TPrimSaveLoadForm.Query_ClearAll_Execute

procedure TPrimSaveLoadForm.Query_ClearAll(const aParams: IvcmExecuteParams);
begin
 with (aParams.Data As IQuery_ClearAll_Params) do
  Query_ClearAll_Execute(NotClearRange);
end;

procedure TPrimSaveLoadForm.Query_SetList_Execute(const aList: IdeList;
  aInList: Boolean);
//#UC START# *4AE96F6C0191_4958E3AB0247exec_var*
//#UC END# *4AE96F6C0191_4958E3AB0247exec_var*
begin
//#UC START# *4AE96F6C0191_4958E3AB0247exec_impl*
 if (aList <> nil) then
 begin
  SearchState.List := aList;
  if aInList then
   SearchState.SearchType := stInList
  else
   SearchState.SearchType := stAllBase;
 end//aList <> nil
 else
 begin
  SearchState.List := nil;
  SearchState.SearchType := stNone; {stAllBaseOnly;}
 end;//aList <> nil
//#UC END# *4AE96F6C0191_4958E3AB0247exec_impl*
end;//TPrimSaveLoadForm.Query_SetList_Execute

procedure TPrimSaveLoadForm.Query_SetList(const aParams: IvcmExecuteParams);
begin
 with (aParams.Data As IQuery_SetList_Params) do
  Query_SetList_Execute(List, InList);
end;

function TPrimSaveLoadForm.Filterable_Add_Execute(const aFilter: IFilterFromQuery): Boolean;
//#UC START# *4AEF0BF70306_4958E3AB0247exec_var*
//#UC END# *4AEF0BF70306_4958E3AB0247exec_var*
begin
//#UC START# *4AEF0BF70306_4958E3AB0247exec_impl*
 Result := true;
//#UC END# *4AEF0BF70306_4958E3AB0247exec_impl*
end;//TPrimSaveLoadForm.Filterable_Add_Execute

procedure TPrimSaveLoadForm.Filterable_Add(const aParams: IvcmExecuteParams);
begin
 with (aParams.Data As IFilterable_Add_Params) do
  ResultValue := Filterable_Add_Execute(Filter);
end;

function TPrimSaveLoadForm.Filterable_Delete_Execute(const aFilter: IFilterFromQuery): Boolean;
//#UC START# *4AEF0D1A01C3_4958E3AB0247exec_var*
//#UC END# *4AEF0D1A01C3_4958E3AB0247exec_var*
begin
//#UC START# *4AEF0D1A01C3_4958E3AB0247exec_impl*
 Result := true;
//#UC END# *4AEF0D1A01C3_4958E3AB0247exec_impl*
end;//TPrimSaveLoadForm.Filterable_Delete_Execute

procedure TPrimSaveLoadForm.Filterable_Delete(const aParams: IvcmExecuteParams);
begin
 with (aParams.Data As IFilterable_Delete_Params) do
  ResultValue := Filterable_Delete_Execute(Filter);
end;

function TPrimSaveLoadForm.Query_GetList_Execute: IdeList;
//#UC START# *4AF2AA2100CF_4958E3AB0247exec_var*
//#UC END# *4AF2AA2100CF_4958E3AB0247exec_var*
begin
//#UC START# *4AF2AA2100CF_4958E3AB0247exec_impl*
 if (SearchState.SearchType = stInList) and
    (SearchState.List <> nil) then
  Result := SearchState.List
 else
  Result := nil;
//#UC END# *4AF2AA2100CF_4958E3AB0247exec_impl*
end;//TPrimSaveLoadForm.Query_GetList_Execute

procedure TPrimSaveLoadForm.Query_GetList(const aParams: IvcmExecuteParams);
begin
 with (aParams.Data As IQuery_GetList_Params) do
  ResultValue := Query_GetList_Execute;
end;

procedure TPrimSaveLoadForm.Filterable_ClearAll_Execute;
//#UC START# *4AF80DB80383_4958E3AB0247exec_var*
//#UC END# *4AF80DB80383_4958E3AB0247exec_var*
begin
//#UC START# *4AF80DB80383_4958E3AB0247exec_impl*
 // - ������ �� ������
//#UC END# *4AF80DB80383_4958E3AB0247exec_impl*
end;//TPrimSaveLoadForm.Filterable_ClearAll_Execute

procedure TPrimSaveLoadForm.Filterable_ClearAll(const aParams: IvcmExecuteParams);
begin
 Filterable_ClearAll_Execute;
end;

function TPrimSaveLoadForm.Filterable_Refresh_Execute: Boolean;
//#UC START# *4AF810230307_4958E3AB0247exec_var*
//#UC END# *4AF810230307_4958E3AB0247exec_var*
begin
//#UC START# *4AF810230307_4958E3AB0247exec_impl*
 // - ������ �� ������
 Result := True;
//#UC END# *4AF810230307_4958E3AB0247exec_impl*
end;//TPrimSaveLoadForm.Filterable_Refresh_Execute

procedure TPrimSaveLoadForm.Filterable_Refresh(const aParams: IvcmExecuteParams);
begin
 with (aParams.Data As IFilterable_Refresh_Params) do
  ResultValue := Filterable_Refresh_Execute;
end;

procedure TPrimSaveLoadForm.AnotherSearchCancelled;
//#UC START# *4C04AFC8015D_4958E3AB0247_var*
var
 l_Processor: InsBaseSearchResultProcessor;
//#UC END# *4C04AFC8015D_4958E3AB0247_var*
begin
//#UC START# *4C04AFC8015D_4958E3AB0247_impl*
 if Supports(NativeMainForm, InsBaseSearchResultProcessor, l_Processor) then
  l_Processor.AnotherSearchCancelled;
//#UC END# *4C04AFC8015D_4958E3AB0247_impl*
end;//TPrimSaveLoadForm.AnotherSearchCancelled

procedure TPrimSaveLoadForm.Result_ClearAll_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C2DFEE000BA_4958E3AB0247test_var*
//#UC END# *4C2DFEE000BA_4958E3AB0247test_var*
begin
//#UC START# *4C2DFEE000BA_4958E3AB0247test_impl*
 // - ������ �� ������
//#UC END# *4C2DFEE000BA_4958E3AB0247test_impl*
end;//TPrimSaveLoadForm.Result_ClearAll_Test

procedure TPrimSaveLoadForm.Result_ClearAll_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C2DFEE000BA_4958E3AB0247exec_var*
//#UC END# *4C2DFEE000BA_4958E3AB0247exec_var*
begin
//#UC START# *4C2DFEE000BA_4958E3AB0247exec_impl*
 Query_ClearAll_Execute(false);
//#UC END# *4C2DFEE000BA_4958E3AB0247exec_impl*
end;//TPrimSaveLoadForm.Result_ClearAll_Execute

procedure TPrimSaveLoadForm.Query_GetOldQuery_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C31A4EC023F_4958E3AB0247test_var*
//#UC END# *4C31A4EC023F_4958E3AB0247test_var*
begin
//#UC START# *4C31A4EC023F_4958E3AB0247test_impl*
 if QueryHistory.Count > 0 then
 begin
  aParams.Op.Flag[vcm_ofEnabled] := True;
  aParams.Op.SubItems := QueryHistory;
 end//if QueryHistory.Count > 0 then
 else
  aParams.Op.Flag[vcm_ofEnabled] := False;
//#UC END# *4C31A4EC023F_4958E3AB0247test_impl*
end;//TPrimSaveLoadForm.Query_GetOldQuery_Test

procedure TPrimSaveLoadForm.Query_GetOldQuery_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C31A4EC023F_4958E3AB0247exec_var*
var
 l_Index    : Integer;
 l_NewQuery : IQuery;
 l_OldQuery : IQuery;
//#UC END# *4C31A4EC023F_4958E3AB0247exec_var*
begin
//#UC START# *4C31A4EC023F_4958E3AB0247exec_impl*
 l_Index := aParams.ItemIndex;
 if (l_Index = 0) then
 begin
  l_Index := f_LastQueryIndex;
  Inc(f_LastQueryIndex);
  if (f_LastQueryIndex >= QueryHistory.Count) then
   f_LastQueryIndex := 0;
 end//l_Index = 0
 else
  Dec(l_Index);
 if Supports(QueryHistory.Items[l_Index], IQuery, l_OldQuery) then
  try
   l_OldQuery.Clone(l_NewQuery);
   try
    // �������� Query � �� ��� ����������
    op_SearchParameters_SetQuery.Call(Aggregate, l_NewQuery);
    {$If not Defined(Admin) and not Defined(Monitorings)}
    TnsLoadQueryFromHistoryEvent.Log;
    {$IfEnd}
   finally
    l_NewQuery := nil;
   end;//try..finally
  finally
   l_OldQuery := nil;
  end;//try..finally
//#UC END# *4C31A4EC023F_4958E3AB0247exec_impl*
end;//TPrimSaveLoadForm.Query_GetOldQuery_Execute

procedure TPrimSaveLoadForm.Query_SearchType_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C31A68800FA_4958E3AB0247test_var*

  function lp_AllSearchCaption: IvcmCString;
  begin
   case ListType of
    bs_ltDocument:
     Result := vcmCStr(str_AllDocumentSearch);
    bs_ltDrug:
     Result := vcmCStr(str_AllDrugSearch);
    else
    begin
     Result := nil;
     Assert(False);
    end;//else
   end;//case ListType of
  end;//lp_AllSearchCaption

var
 l_Strings : IvcmStrings;
//#UC END# *4C31A68800FA_4958E3AB0247test_var*
begin
//#UC START# *4C31A68800FA_4958E3AB0247test_impl*
 case SearchState.SearchType of
  stNone :
    begin
     aParams.Op.Flag[vcm_ofEnabled] := False;
     aParams.Op.SelectedString := lp_AllSearchCaption;
     aParams.Op.SubNodes := nil;
    end;//stNone
//  stAllBaseOnly : aParams.Op.Flag[vcm_ofVisible] := False;
  stAllBase, stInList :
    begin
     aParams.Op.Flag[vcm_ofEnabled] := True;
     l_Strings := aParams.Op.SubItems;
     if (l_Strings <> nil) and
        (l_Strings.Count = 0) then
     begin
      l_Strings.Clear;
      l_Strings.Add(lp_AllSearchCaption);
      l_Strings.Add(vcmCStr(str_CurListSearch));
     end;
     case SearchState.SearchType of
      stAllBase:
       aParams.Op.SelectedString := lp_AllSearchCaption;
      stInList:
       aParams.Op.SelectedString := vcmCStr(str_CurListSearch);
     end;
    end//l_Strings <> nil..
 end;//case SearchState.SearchType
//#UC END# *4C31A68800FA_4958E3AB0247test_impl*
end;//TPrimSaveLoadForm.Query_SearchType_Test

procedure TPrimSaveLoadForm.Query_SearchType_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C31A68800FA_4958E3AB0247exec_var*
//#UC END# *4C31A68800FA_4958E3AB0247exec_var*
begin
//#UC START# *4C31A68800FA_4958E3AB0247exec_impl*
 if l3Same(aParams.SelectedString, vcmCStr(str_CurListSearch)) then
  SearchState.SearchType := stInList
 else
  SearchState.SearchType := stAllBase;
//#UC END# *4C31A68800FA_4958E3AB0247exec_impl*
end;//TPrimSaveLoadForm.Query_SearchType_Execute

procedure TPrimSaveLoadForm.LogicOperation_LogicOr_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C31B48D03BB_4958E3AB0247test_var*
//#UC END# *4C31B48D03BB_4958E3AB0247test_var*
begin
//#UC START# *4C31B48D03BB_4958E3AB0247test_impl*
 vcmDispatcher.EntityOperation(TdmStdRes.opcode_Attribute_LogicOr, aParams As IvcmTestParams);
 // �� ���������� ������ ������ �����
 aParams.Op.Flag[vcm_ofVisible] := True;
//#UC END# *4C31B48D03BB_4958E3AB0247test_impl*
end;//TPrimSaveLoadForm.LogicOperation_LogicOr_Test

procedure TPrimSaveLoadForm.LogicOperation_LogicOr_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C31B48D03BB_4958E3AB0247exec_var*
//#UC END# *4C31B48D03BB_4958E3AB0247exec_var*
begin
//#UC START# *4C31B48D03BB_4958E3AB0247exec_impl*
 vcmDispatcher.EntityOperation(TdmStdRes.opcode_Attribute_LogicOr, aParams As IvcmExecuteParams);
//#UC END# *4C31B48D03BB_4958E3AB0247exec_impl*
end;//TPrimSaveLoadForm.LogicOperation_LogicOr_Execute

procedure TPrimSaveLoadForm.LogicOperation_LogicAnd_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C31B4990225_4958E3AB0247test_var*
//#UC END# *4C31B4990225_4958E3AB0247test_var*
begin
//#UC START# *4C31B4990225_4958E3AB0247test_impl*
 vcmDispatcher.EntityOperation(TdmStdRes.opcode_Attribute_LogicAnd, aParams As IvcmTestParams);
 // �� ���������� ������ ������ �����
 aParams.Op.Flag[vcm_ofVisible] := True;
//#UC END# *4C31B4990225_4958E3AB0247test_impl*
end;//TPrimSaveLoadForm.LogicOperation_LogicAnd_Test

procedure TPrimSaveLoadForm.LogicOperation_LogicAnd_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C31B4990225_4958E3AB0247exec_var*
//#UC END# *4C31B4990225_4958E3AB0247exec_var*
begin
//#UC START# *4C31B4990225_4958E3AB0247exec_impl*
 vcmDispatcher.EntityOperation(TdmStdRes.opcode_Attribute_LogicAnd, aParams As IvcmExecuteParams);
//#UC END# *4C31B4990225_4958E3AB0247exec_impl*
end;//TPrimSaveLoadForm.LogicOperation_LogicAnd_Execute

procedure TPrimSaveLoadForm.LogicOperation_LogicNot_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C31B4A90088_4958E3AB0247test_var*
//#UC END# *4C31B4A90088_4958E3AB0247test_var*
begin
//#UC START# *4C31B4A90088_4958E3AB0247test_impl*
 vcmDispatcher.EntityOperation(TdmStdRes.opcode_Attribute_LogicNot, aParams As IvcmTestParams);
 // �� ���������� ������ ������ �����
 aParams.Op.Flag[vcm_ofVisible] := True;
//#UC END# *4C31B4A90088_4958E3AB0247test_impl*
end;//TPrimSaveLoadForm.LogicOperation_LogicNot_Test

procedure TPrimSaveLoadForm.LogicOperation_LogicNot_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C31B4A90088_4958E3AB0247exec_var*
//#UC END# *4C31B4A90088_4958E3AB0247exec_var*
begin
//#UC START# *4C31B4A90088_4958E3AB0247exec_impl*
 vcmDispatcher.EntityOperation(TdmStdRes.opcode_Attribute_LogicNot, aParams As IvcmExecuteParams);
//#UC END# *4C31B4A90088_4958E3AB0247exec_impl*
end;//TPrimSaveLoadForm.LogicOperation_LogicNot_Execute

procedure TPrimSaveLoadForm.Filters_FiltersListOpen_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C81191003E5_4958E3AB0247test_var*
//#UC END# *4C81191003E5_4958E3AB0247test_var*
begin
//#UC START# *4C81191003E5_4958E3AB0247test_impl*
 HideOpForPostingOrder(aParams);
//#UC END# *4C81191003E5_4958E3AB0247test_impl*
end;//TPrimSaveLoadForm.Filters_FiltersListOpen_Test

procedure TPrimSaveLoadForm.Filters_FiltersListOpen_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C81191003E5_4958E3AB0247exec_var*
//#UC END# *4C81191003E5_4958E3AB0247exec_var*
begin
//#UC START# *4C81191003E5_4958E3AB0247exec_impl*
 {$IFDEF Monitorings}
 Assert(false);
 {$Else  Monitorings}
 if (DataSource = nil) then
  TdmStdRes.OldSchoolFiltersOpen(Aggregate, nil, Self)
 else
  TdmStdRes.FiltersOpen(Self.Filters);
 {$EndIF Monitorings}
//#UC END# *4C81191003E5_4958E3AB0247exec_impl*
end;//TPrimSaveLoadForm.Filters_FiltersListOpen_Execute

function TPrimSaveLoadForm.Filterable_GetListType_Execute: TbsListType;
//#UC START# *4F99403A00A5_4958E3AB0247exec_var*
//#UC END# *4F99403A00A5_4958E3AB0247exec_var*
begin
//#UC START# *4F99403A00A5_4958E3AB0247exec_impl*
 Result := ListType;
//#UC END# *4F99403A00A5_4958E3AB0247exec_impl*
end;//TPrimSaveLoadForm.Filterable_GetListType_Execute

procedure TPrimSaveLoadForm.Filterable_GetListType(const aParams: IvcmExecuteParams);
begin
 with (aParams.Data As IFilterable_GetListType_Params) do
  ResultValue := Filterable_GetListType_Execute;
end;

procedure TPrimSaveLoadForm.Cleanup;
//#UC START# *479731C50290_4958E3AB0247_var*
//#UC END# *479731C50290_4958E3AB0247_var*
begin
//#UC START# *479731C50290_4958E3AB0247_impl*
 {$If not Defined(Admin) and not Defined(Monitorings)}
 TdmStdRes.MakeWorkJournal.UnRegisterListener(Self);
 {$IfEnd}
 FreeAndNil(f_QueryHistory);
 f_SearchState := nil;
 f_LastQueryIndex := 0;
 inherited;
//#UC END# *479731C50290_4958E3AB0247_impl*
end;//TPrimSaveLoadForm.Cleanup

constructor TPrimSaveLoadForm.Create(AOwner: TComponent);
//#UC START# *47D1602000C6_4958E3AB0247_var*
//#UC END# *47D1602000C6_4958E3AB0247_var*
begin
//#UC START# *47D1602000C6_4958E3AB0247_impl*
 inherited;
{$If defined(Monitorings) or defined(Admin)}
  with TvcmBaseOperationsCollectionItem(dmStdRes.MenuManager.GetItemByName('enFilters')
   .Operations.FindItemByName('opFiltersListOpen')) do
    Options := Options - [vcm_ooShowInMainMenu];
  with dmStdRes.MenuManager.GetItemByName('enFile') do
  begin
   with TvcmBaseOperationsCollectionItem(Operations.FindItemByName('opSaveToFolder')) do
    Options := Options - [vcm_ooShowInMainMenu];
   with TvcmBaseOperationsCollectionItem(Operations.FindItemByName('opLoadFromFolder')) do
    Options := Options - [vcm_ooShowInMainMenu];
  end;
{$IfEnd defined(Monitorings) or defined(Admin)}
//#UC END# *47D1602000C6_4958E3AB0247_impl*
end;//TPrimSaveLoadForm.Create

procedure TPrimSaveLoadForm.SettingsReplaceFinish;
//#UC START# *47EA8B9601FE_4958E3AB0247_var*
//#UC END# *47EA8B9601FE_4958E3AB0247_var*
begin
//#UC START# *47EA8B9601FE_4958E3AB0247_impl*
 inherited;
 UserSettingsChanged;
//#UC END# *47EA8B9601FE_4958E3AB0247_impl*
end;//TPrimSaveLoadForm.SettingsReplaceFinish

procedure TPrimSaveLoadForm.UserSettingsChanged;
//#UC START# *4958BE910345_4958E3AB0247_var*

 function lp_NeedExchangeForm: Boolean;
 begin
  Result := (UserType <> slqtPublishSource) and
            ((l3Same(afw.Settings.LoadString(pi_Search_SituationType,
                               dv_Search_SituationType),
                               li_NewSearch_SituationType)) and
             (UserType = slqtOldKW )) or
            ((l3Same(afw.Settings.LoadString(pi_Search_SituationType,
                               dv_Search_SituationType),
                               li_OldSearch_SituationType)) and
             (UserType = slqtKW ))
 end;//lp_NeedExchangeForm

 function lp_Query: IQuery;
 var
  l_QueryParams: TnsQueryInfo;
 begin
  l_QueryParams := Op_SearchParameters_GetQuery.Call(Aggregate);
  if not l_QueryParams.rHasErrors then
   Result := l_QueryParams.rQuery
  else
   Result := nil;
 end;//lp_Query

//#UC END# *4958BE910345_4958E3AB0247_var*
begin
//#UC START# *4958BE910345_4958E3AB0247_impl*
 inherited;
 if not IsDictionLike AND not IsBaseSearchLike then
  if lp_NeedExchangeForm then
  begin
   // �������� ��� ��
   case UserType of
    slqtAttribute:
     TdmStdRes.OpenQuery(lg_qtAttribute, lp_Query);
    slqtKW, slqtOldKW:
     TdmStdRes.OpenQuery(lg_qtKeyWord, lp_Query);
   end;//case UserType
  end;//not (UserType = slqtPublishSource)..
//#UC END# *4958BE910345_4958E3AB0247_impl*
end;//TPrimSaveLoadForm.UserSettingsChanged

{$If not defined(NoVCM)}
procedure TPrimSaveLoadForm.DoInit(aFromHistory: Boolean);
//#UC START# *49803F5503AA_4958E3AB0247_var*
//#UC END# *49803F5503AA_4958E3AB0247_var*
begin
//#UC START# *49803F5503AA_4958E3AB0247_impl*
 inherited;
 {$If not Defined(Admin) and not Defined(Monitorings)}
 TdmStdRes.MakeWorkJournal.RegisterListener(Self);
 {$IfEnd}
 if not IsDictionLike then
 begin
  LoadQueryHistory;
  if (UserType = slqtFilters) then
   CCaption := str_FilterCaption.AsCStr;
 end;//not IsDictionLike
//#UC END# *49803F5503AA_4958E3AB0247_impl*
end;//TPrimSaveLoadForm.DoInit
{$IfEnd} //not NoVCM

{$If not defined(NoVCM)}
function TPrimSaveLoadForm.DoLoadState(const aState: IvcmBase;
  aStateType: TvcmStateType): Boolean;
//#UC START# *49807428008C_4958E3AB0247_var*
//#UC END# *49807428008C_4958E3AB0247_var*
begin
//#UC START# *49807428008C_4958E3AB0247_impl*
 Result := true;
 if (aStateType = vcm_stContent) then
  if not Supports(aState, InsSearchTypeState, f_SearchState) then
   Assert(False);
//#UC END# *49807428008C_4958E3AB0247_impl*
end;//TPrimSaveLoadForm.DoLoadState
{$IfEnd} //not NoVCM

{$If not defined(NoVCM)}
procedure TPrimSaveLoadForm.InitControls;
//#UC START# *4A8E8F2E0195_4958E3AB0247_var*
//#UC END# *4A8E8F2E0195_4958E3AB0247_var*
begin
//#UC START# *4A8E8F2E0195_4958E3AB0247_impl*
 inherited;
 pnHeader.Align := alTop;
 pnHeader.Height := 60;
 pnHeader.BevelOuter := bvNone;
 pnHeader.TabOrder := 1;
 pnHeader.OnResize := HeaderResize;
 pnHeader.PopupMenu := TPopupMenu.Create(pnHeader);
 // - ������ ��������� ������ ����
 // http://mdp.garant.ru/pages/viewpage.action?pageId=278844700&focusedCommentId=294585427&#comment-294585427
 NotifyUserTypeSet;
 lbHeader.EndEllipsis := true;
 lbHeader.Font.Name := 'Arial';
 lbHeader.Font.Size := 30;
 lbHeader.Font.Style := [fsBold];
 lbHeader.Font.Color := cGarant2011GradientEndColor;
 lbHeader.Action := TAction.Create(lbHeader);
 lbHeader.Action.OnUpdate := UpdateLabel;
 // ��� ������� ����� 150% ������ lbHeader ����� ���� ������, ��� ������
 // pnHeader, ����� lbHeader.Top ������ ����� �� ������� ������
 // http://mdp.garant.ru/pages/viewpage.action?pageId=449678181
 if ((lbHeader.Height + 6) > pnHeader.Height) then
  pnHeader.Height := pnHeader.Height + ((lbHeader.Height + 6) - pnHeader.Height);
 lbHeader.Top := (pnHeader.Height - lbHeader.Height) - 6;
 lbHeader.PopupMenu := pnHeader.PopupMenu;
 // - ������ ��������� ������ ����
 // http://mdp.garant.ru/pages/viewpage.action?pageId=278844700&focusedCommentId=294585427&#comment-294585427
 pbHeader.Left := c_ControlBorder * 4;
 pbHeader.Width := 34;
 pbHeader.Height := 34;
(* pbHeader.Width := 48;
 pbHeader.Height := 48;*)
 pbHeader.Top := (pnHeader.Height -  pbHeader.Height) div 2 + 5;
 pbHeader.OnPaint := pbHeaderPaint;
 pbHeader.PopupMenu := pnHeader.PopupMenu;
 // - ������ ��������� ������ ����
 // http://mdp.garant.ru/pages/viewpage.action?pageId=278844700&focusedCommentId=294585427&#comment-294585427
 lbHeader.Left := pbHeader.Left + pbHeader.Width + c_ControlBorder * 3;
//#UC END# *4A8E8F2E0195_4958E3AB0247_impl*
end;//TPrimSaveLoadForm.InitControls
{$IfEnd} //not NoVCM

{$If not defined(NoVCM)}
function TPrimSaveLoadForm.SaveOwnFormState(out theState: IvcmBase;
  aStateType: TvcmStateType): Boolean;
//#UC START# *4B4F49900003_4958E3AB0247_var*
//#UC END# *4B4F49900003_4958E3AB0247_var*
begin
//#UC START# *4B4F49900003_4958E3AB0247_impl*
 Result := true;
 if (aStateType = vcm_stContent) then
  theState := SearchState as IvcmBase;
//#UC END# *4B4F49900003_4958E3AB0247_impl*
end;//TPrimSaveLoadForm.SaveOwnFormState
{$IfEnd} //not NoVCM

{$If not defined(NoVCM)}
procedure TPrimSaveLoadForm.NotifyUserTypeSet;
//#UC START# *4D78E2BB0211_4958E3AB0247_var*
//#UC END# *4D78E2BB0211_4958E3AB0247_var*
begin
//#UC START# *4D78E2BB0211_4958E3AB0247_impl*
 inherited;
 if IsDictionLike then
 begin
  ParentZone.Align := alClient;
  ParentZone.Color := clWhite;
  pnHeader.Color := clWhite;
  pnHeader.BevelOuter := bvSpace;
 end//IsDictionLike
 else
 begin
  ParentZone.Align := alClient;
  ParentZone.Color := cGarant2011BackColor;
  pnHeader.Color := cGarant2011BackColor;
  pnHeader.BevelOuter := bvNone;
 end;//IsDictionLike
//#UC END# *4D78E2BB0211_4958E3AB0247_impl*
end;//TPrimSaveLoadForm.NotifyUserTypeSet
{$IfEnd} //not NoVCM

procedure TPrimSaveLoadForm.ClearFields;
 {-}
begin
 f_SearchState := nil;
 inherited;
end;//TPrimSaveLoadForm.ClearFields

procedure TPrimSaveLoadForm.SignalDataSourceChanged(const anOld : IvcmViewAreaController;
 const aDsNew : IvcmViewAreaController);
begin
 inherited;
 if (aDsNew = nil) then
 begin
  Filters := nil;
 end//aDsNew = nil
 else
 begin
  aDsNew.CastUCC(IucpFilters, Filters);
 end;//aDsNew = nil
end;

procedure TPrimSaveLoadForm.InitEntities;
begin
 inherited;
 with Entities.Entities do
 begin
  PublishFormEntity(en_File, nil);
  PublishFormEntity(en_Loadable, nil);
  PublishFormEntity(en_Result, nil);
  PublishFormEntity(en_Query, nil);
  PublishFormEntity(en_Filterable, nil);
  PublishFormEntity(en_Filters, nil);
  PublishFormEntity(en_LogicOperation, nil);
  ToolbarAtBottom(en_Result);
  PublishOp(en_File, op_SaveToFolder, File_SaveToFolder_Execute, File_SaveToFolder_Test, nil);
  PublishOp(en_File, op_LoadFromFolder, File_LoadFromFolder_Execute, File_LoadFromFolder_Test, nil);
  PublishOpWithResult(en_Loadable, op_Load, Loadable_Load, nil, nil);
  PublishOp(en_Result, op_OkExt, Result_OkExt_Execute, Result_OkExt_Test, Result_OkExt_GetState);
  PublishOp(en_Result, op_Cancel, Result_Cancel_Execute, Result_Cancel_Test, Result_Cancel_GetState);
  PublishOpWithResult(en_Query, op_ClearAll, Query_ClearAll, nil, nil);
  PublishOpWithResult(en_Query, op_SetList, Query_SetList, nil, nil);
  PublishOpWithResult(en_Filterable, op_Add, Filterable_Add, nil, nil);
  PublishOpWithResult(en_Filterable, op_Delete, Filterable_Delete, nil, nil);
  PublishOpWithResult(en_Query, op_GetList, Query_GetList, nil, nil);
  PublishOpWithResult(en_Filterable, op_ClearAll, Filterable_ClearAll, nil, nil);
  PublishOpWithResult(en_Filterable, op_Refresh, Filterable_Refresh, nil, nil);
  PublishOp(en_Result, op_ClearAll, Result_ClearAll_Execute, Result_ClearAll_Test, nil);
  PublishOp(en_Query, op_GetOldQuery, Query_GetOldQuery_Execute, Query_GetOldQuery_Test, nil);
  PublishOp(en_Query, op_SearchType, Query_SearchType_Execute, Query_SearchType_Test, nil);
  PublishOp(en_LogicOperation, op_LogicOr, LogicOperation_LogicOr_Execute, LogicOperation_LogicOr_Test, nil);
  PublishOp(en_LogicOperation, op_LogicAnd, LogicOperation_LogicAnd_Execute, LogicOperation_LogicAnd_Test, nil);
  PublishOp(en_LogicOperation, op_LogicNot, LogicOperation_LogicNot_Execute, LogicOperation_LogicNot_Test, nil);
  PublishOp(en_Filters, op_FiltersListOpen, Filters_FiltersListOpen_Execute, Filters_FiltersListOpen_Test, nil);
  PublishOpWithResult(en_Filterable, op_GetListType, Filterable_GetListType, nil, nil);
 end;//with Entities.Entities
end;

procedure TPrimSaveLoadForm.MakeControls;
begin
 inherited;
 f_pnHeader := TvtPanel.Create(Self);
 f_pnHeader.Name := 'pnHeader';
 f_pnHeader.Parent := Self;
 f_lbHeader := TvtLabel.Create(Self);
 f_lbHeader.Name := 'lbHeader';
 f_lbHeader.Parent := pnHeader;
 f_pbHeader := TPaintBox.Create(Self);
 f_pbHeader.Name := 'pbHeader';
 f_pbHeader.Parent := pnHeader;
 f_ParentZone := TvtPanel.Create(Self);
 f_ParentZone.Name := 'ParentZone';
 f_ParentZone.Parent := Self;
 with DefineZone(vcm_ztParent, f_ParentZone) do
 begin
  FormStyle.Toolbars.Bottom.MergeWithContainer := vcm_bTrue;
 end;//with DefineZone(vcm_ztParent, f_ParentZone)
end;

{$IfEnd} //not Admin

initialization
{$If not defined(Admin)}
// ����������� Tkw_PrimSaveLoad_Control_pnHeader
 Tkw_PrimSaveLoad_Control_pnHeader.Register('�������::pnHeader', TvtPanel);
{$IfEnd} //not Admin
{$If not defined(Admin)}
// ����������� Tkw_PrimSaveLoad_Control_pnHeader_Push
 Tkw_PrimSaveLoad_Control_pnHeader_Push.Register('�������::pnHeader:push');
{$IfEnd} //not Admin
{$If not defined(Admin)}
// ����������� Tkw_PrimSaveLoad_Control_lbHeader
 Tkw_PrimSaveLoad_Control_lbHeader.Register('�������::lbHeader', TvtLabel);
{$IfEnd} //not Admin
{$If not defined(Admin)}
// ����������� Tkw_PrimSaveLoad_Control_lbHeader_Push
 Tkw_PrimSaveLoad_Control_lbHeader_Push.Register('�������::lbHeader:push');
{$IfEnd} //not Admin
{$If not defined(Admin)}
// ����������� Tkw_PrimSaveLoad_Control_pbHeader
 Tkw_PrimSaveLoad_Control_pbHeader.Register('�������::pbHeader', TPaintBox);
{$IfEnd} //not Admin
{$If not defined(Admin)}
// ����������� Tkw_PrimSaveLoad_Control_pbHeader_Push
 Tkw_PrimSaveLoad_Control_pbHeader_Push.Register('�������::pbHeader:push');
{$IfEnd} //not Admin
{$If not defined(Admin)}
// ����������� Tkw_PrimSaveLoad_Control_ParentZone
 Tkw_PrimSaveLoad_Control_ParentZone.Register('�������::ParentZone', TvtPanel);
{$IfEnd} //not Admin
{$If not defined(Admin)}
// ����������� Tkw_PrimSaveLoad_Control_ParentZone_Push
 Tkw_PrimSaveLoad_Control_ParentZone_Push.Register('�������::ParentZone:push');
{$IfEnd} //not Admin
{$If not defined(Admin)}
// ������������� str_FilterCaption
 str_FilterCaption.Init;
{$IfEnd} //not Admin

end.