unit PrimBaseSearch_Form;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "View"
// �����: ����� �.�.
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/View/BaseSearch/Forms/PrimBaseSearch_Form.pas"
// �����: 21.09.2009 18:43
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<VCMForm::Class>> F1 �������� ����������::BaseSearch::View::BaseSearch$Module::PrimBaseSearch
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
  l3Interfaces
  {$If not defined(NoVCM)}
  ,
  vcmExternalInterfaces
  {$IfEnd} //not NoVCM
  
  {$If not defined(NoVCM)}
  ,
  vcmInterfaces
  {$IfEnd} //not NoVCM
  ,
  Messages,
  ExtCtrls
  {$If not defined(NoVCM)}
  ,
  vcmEntityForm
  {$IfEnd} //not NoVCM
  
  {$If not defined(NoVCM)}
  ,
  vcmUserControls
  {$IfEnd} //not NoVCM
  ,
  l3ProtoObject,
  OfficeLike_Result_Controls,
  OfficeLike_ResultEx_Controls,
  BaseSearchInterfaces,
  nsCounterEvent,
  l3StringIDEx,
  BaseSearch_Controls
  {$If defined(Nemesis)}
  ,
  nscTreeComboWithHistoryAndOperations
  {$IfEnd} //Nemesis
  
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
  Graphics,
  l3Region,
  Controls {a},
  LoggingUnit,
  PrimBaseSearch_BaseSearch_UserType,
  vcmBase {a}
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}
type
 InsBaseSearchFormState = interface(IUnknown{, IvcmBase, ������ ����� �� ������������, ����� �� ���� ���������� ����� "��������� ����", ��� �������� �� ������� ����� ������ �����������������})
  {* ��������� ����� "�������� �����" }
   ['{239F47AA-B37E-447C-BE52-E487DE8A8397}']
   function Get_ActiveClass: TnsBaseSearchClass;
   function Get_Data: InsBaseSearcherWindowData;
   property ActiveClass: TnsBaseSearchClass
     read Get_ActiveClass;
   property Data: InsBaseSearcherWindowData
     read Get_Data;
  // ������ �������������� � ����������� �����������
   function As_IvcmBase: IvcmBase;
 end;//InsBaseSearchFormState

 TnsUseBaseSearchExampleEvent = class(TnsCounterEvent)
 protected
 // realized methods
   function EventID: TLogEvent; override;
 public
 // singleton factory method
   class function Instance: TnsUseBaseSearchExampleEvent;
    {- ���������� ��������� ����������. }
 end;//TnsUseBaseSearchExampleEvent

 TnsUseBaseSearchHintEvent = class(TnsCounterEvent)
 protected
 // realized methods
   function EventID: TLogEvent; override;
 public
 // singleton factory method
   class function Instance: TnsUseBaseSearchHintEvent;
    {- ���������� ��������� ����������. }
 end;//TnsUseBaseSearchHintEvent

 TnsUseBackSearchButtonEvent = class(TnsCounterEvent)
 protected
 // realized methods
   function EventID: TLogEvent; override;
 public
 // singleton factory method
   class function Instance: TnsUseBackSearchButtonEvent;
    {- ���������� ��������� ����������. }
 end;//TnsUseBackSearchButtonEvent

 _BaseSearch2010_Parent_ = TvcmEntityForm;
 {$Include w:\garant6x\implementation\Garant\GbaNemesis\Skins\BaseSearch2010.imp.pas}
 TPrimBaseSearchForm = {form} class(_BaseSearch2010_, InsSearchWindow, InsContextSearchHistoryNotifier {$If not defined(NoVCM)}, IvcmLockListener{$IfEnd} //not NoVCM
 )
 private
 // private fields
   f_InCreate : Boolean;
   f_ContextHistory : InsContextSearchHistory;
   f_NeedParamsChanged : Boolean;
   f_NeedPresentationChanged : Boolean;
   f_FlashCounter : Integer;
   f_ContextEdit : TnscTreeComboWithHistoryAndOperations;
    {* ���� ��� �������� ContextEdit}
   f_FlashTimer : TTimer;
    {* ���� ��� �������� FlashTimer}
 protected
  procedure InitEntities; override;
  procedure MakeControls; override;
 private
 // private methods
   procedure AfterSearcherSet;
   function MainMenuLikeBaseSearch: Boolean;
   procedure CMVisibleChanged(var Msg: TMessage); message CM_VISIBLECHANGED;
 protected
 // property methods
   function pm_GetContextEdit: TnscTreeComboWithHistoryAndOperations;
   procedure pm_SetFindBtnEnabled(aValue: Boolean); virtual; abstract;
   procedure pm_SetFindBackBtnEnabled(aValue: Boolean); virtual; abstract;
   function pm_GetContextLabelVisible: Boolean; virtual; abstract;
   procedure pm_SetContextLabelVisible(aValue: Boolean); virtual; abstract;
   function pm_GetCloseBtnEnabled: Boolean; virtual; abstract;
   procedure pm_SetCloseBtnEnabled(aValue: Boolean); virtual; abstract;
 protected
 // realized methods
   procedure ParamsChanged;
   procedure PresentationChanged;
   procedure ExampleChanged;
   procedure CheckFindEnabled;
   procedure ClassNamesChanged;
   procedure CloseWindow;
   procedure ActivateWindow(aNeedFlash: Boolean = True);
   procedure HistoryChanged(const aNewHistory: IvcmStrings);
   procedure ContextSearched;
     {$If not defined(NoVCM)}
   procedure Lock;
     {* ��������� ��������� }
     {$IfEnd} //not NoVCM
     {$If not defined(NoVCM)}
   procedure BeforeUnlock;
     {* ���������� �������� ��� �����������, �� ��������� ��� ��������� }
     {$IfEnd} //not NoVCM
     {$If not defined(NoVCM)}
   procedure Unlock;
     {* ��������� ��������� }
     {$IfEnd} //not NoVCM
   procedure CheckFragmentsCount;
   procedure Result_OkExt_Test(const aParams: IvcmTestParamsPrim);
     {* OK }
   procedure Result_OkExt_Execute(const aParams: IvcmExecuteParamsPrim);
     {* OK }
   procedure Result_Ok_Test(const aParams: IvcmTestParamsPrim);
     {* OK }
   procedure Result_Ok_Execute(const aParams: IvcmExecuteParamsPrim);
     {* OK }
   procedure Result_Cancel_Test(const aParams: IvcmTestParamsPrim);
     {* ������ }
   procedure Result_Cancel_Execute(const aParams: IvcmExecuteParamsPrim);
     {* ������ }
   function Get_Container: IvcmContainer;
   procedure EnclosedForms_CloseChild_Test(const aParams: IvcmTestParamsPrim);
   procedure EnclosedForms_CloseChild_Execute(const aParams: IvcmExecuteParamsPrim);
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* ������� ������� ����� �������. }
   procedure FinishDataUpdate; override;
   {$If not defined(NoVCM)}
   procedure DoInit(aFromHistory: Boolean); override;
     {* ������������� �����. ��� ���������� � �������� }
   {$IfEnd} //not NoVCM
   {$If not defined(NoVCM)}
   function DoSaveState(out theState: IvcmBase;
    aStateType: TvcmStateType): Boolean; override;
     {* ��������� ��������� �����. ��� ���������� � �������� }
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
   procedure CreateFormGUID(var theGUID: TGUID); override;
     {* ������ ������������� �����. ��� ����, ����� �������� ���������� ����� ���� �� �����. � ��������� ��� �������. }
    {$IfEnd} //not NoVCM
   procedure ClearFields; override;
 public
 // overridden public methods
   {$If not defined(NoVCM)}
   function NeedDrawCaption: Boolean; override;
     {* ����� �� �������� ��������� ���� }
   {$IfEnd} //not NoVCM
 protected
 // protected fields
   f_BaseSearcher : InsBaseSearcherWindowData;
   f_LockParamsChange : Integer;
   f_ActiveClassForSaveInHistory : TnsBaseSearchClass;
 protected
 // protected methods
   procedure ApplyCurrentExample; virtual;
   procedure UnregisterFromSearcher;
   procedure DoFindBtnClick;
   procedure SearchByContext(const aClassToSaveInHistory: TnsBaseSearchClass;
     aNeedUpdateAndStoreActiveClass: Boolean);
   procedure ContextEditPastingString(Sender: TObject;
     var aText: Il3CString);
   procedure StopFlash;
   procedure UpdateSearcherContext;
   procedure ContextEditChange(Sender: TObject);
   procedure CheckParamsPagesCount(aCount: Integer); virtual; abstract;
   procedure SetCurrentContextKind(aKind: TnsBaseSearchKind); virtual; abstract;
   procedure FlashTimerTimer(Sender: TObject);
   procedure ChangeFlash;
   procedure StartFlash;
   procedure ContextEditSelect(Sender: TObject);
   procedure DoCloseBtnClick;
   procedure SetCurrentSearchArea(anArea: TnsSearchArea); virtual; abstract;
   procedure SetupThemePages; virtual; abstract;
   procedure DoCheckFragmentsCount(const aFragmentsCountSuffix: Il3CString); virtual; abstract;
   procedure DoExampleChanged(const anExampleText: Il3CString); virtual; abstract;
   procedure UpdateSearcherArea(anArea: TnsSearchArea;
     anKind: TnsBaseSearchKind);
   procedure DoFindBackBtnClick;
   procedure AdjustParamsPagesHeight; virtual; abstract;
   procedure SetUpFindButtons; virtual; abstract;
   procedure SetupClasses(aFromUpdate: Boolean); virtual; abstract;
   procedure UpdateExamplePanelWidthAndPosition; virtual; abstract;
 public
 // public methods
   class function MakeSingleChild(const aData: InsBaseSearcherWindowData;
    const aCont   : IvcmContainer;
    aZoneType     : TvcmZoneType = vcm_ztAny;
    aUserType     : TvcmEffectiveUserType = 0;
    aDataSource   : IvcmFormDataSource = nil): IvcmEntityForm; reintroduce;
 protected
 // protected properties
   property FindBtnEnabled: Boolean
     write pm_SetFindBtnEnabled;
   property FindBackBtnEnabled: Boolean
     write pm_SetFindBackBtnEnabled;
   property ContextLabelVisible: Boolean
     read pm_GetContextLabelVisible
     write pm_SetContextLabelVisible;
   property CloseBtnEnabled: Boolean
     read pm_GetCloseBtnEnabled
     write pm_SetCloseBtnEnabled;
 public
 // public properties
   property ContextEdit: TnscTreeComboWithHistoryAndOperations
     read pm_GetContextEdit;
   property FlashTimer: TTimer
     read f_FlashTimer;
 end;//TPrimBaseSearchForm
{$IfEnd} //not Admin AND not Monitorings

implementation

{$If not defined(Admin) AND not defined(Monitorings)}
uses
  afwFacade,
  l3Base {a},
  l3Chars,
  SysUtils,
  nsContextHistory,
  l3String,
  nsTypes,
  nsQuery,
  Dialogs,
  l3Const,
  Forms,
  Common_FormDefinitions_Controls,
  nsBaseSearchFormGUIDFactory
  {$If not defined(NoScripts)}
  ,
  tfwScriptingInterfaces
  {$IfEnd} //not NoScripts
  ,
  l3MessageID,
  l3Units,
  nsConst,
  Themes,
  Windows,
  afwInterfaces,
  StdRes {a}
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}

type _Instance_R_ = TPrimBaseSearchForm;

{$Include w:\garant6x\implementation\Garant\GbaNemesis\Skins\BaseSearch2010.imp.pas}

const
   { Const }
  cMaxLen = 300;
  c_FlashTimes = 2;

var
   { ������������ ������ BaseSearchLocalConstants }
  str_BaseSearchCaption : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'BaseSearchCaption'; rValue : '������� �����');
   { ��������� ����������������� ���� "������� �����" }

type
  _afwApplicationDataUpdate_Parent_ = Tl3ProtoObject;
 {$Include w:\common\components\gui\Garant\AFW\implementation\afwApplicationDataUpdate.imp.pas}
  TnsBaseSearchFormState = class(_afwApplicationDataUpdate_, InsBaseSearchFormState, IvcmBase {from InsBaseSearchFormState})
  private
  // private fields
   f_ActiveClass : TnsBaseSearchClass;
   f_Data : InsBaseSearcherWindowData;
  protected
  // realized methods
   function Get_Data: InsBaseSearcherWindowData;
   function Get_ActiveClass: TnsBaseSearchClass;
  protected
  // overridden protected methods
   procedure Cleanup; override;
     {* ������� ������� ����� �������. }
   procedure FinishDataUpdate; override;
   procedure ClearFields; override;
  public
  // public methods
   constructor Create(const aData: InsBaseSearcherWindowData;
      const anActiveClass: TnsBaseSearchClass); reintroduce;
   class function Make(const aData: InsBaseSearcherWindowData;
      const anActiveClass: TnsBaseSearchClass): InsBaseSearchFormState; reintroduce;
     {* ��������� ������� TnsBaseSearchFormState.Make }
  protected
  // ������ �������������� � ����������� �����������
   function As_IvcmBase: IvcmBase;
  end;//TnsBaseSearchFormState

{$Include w:\common\components\gui\Garant\AFW\implementation\afwApplicationDataUpdate.imp.pas}

// start class TnsBaseSearchFormState

constructor TnsBaseSearchFormState.Create(const aData: InsBaseSearcherWindowData;
  const anActiveClass: TnsBaseSearchClass);
//#UC START# *4CF4F8470359_4ACB57C4023E_var*
//#UC END# *4CF4F8470359_4ACB57C4023E_var*
begin
//#UC START# *4CF4F8470359_4ACB57C4023E_impl*
 inherited Create;
 Assert(aData <> nil);
 f_Data := aData;
 Assert(anActiveClass <> nil);
 f_ActiveClass := anActiveClass;
 //f_ActiveClass := f_Data.ActiveClassForSaveState{ActiveClass};
//#UC END# *4CF4F8470359_4ACB57C4023E_impl*
end;//TnsBaseSearchFormState.Create

class function TnsBaseSearchFormState.Make(const aData: InsBaseSearcherWindowData;
  const anActiveClass: TnsBaseSearchClass): InsBaseSearchFormState;
var
 l_Inst : TnsBaseSearchFormState;
begin
 l_Inst := Create(aData, anActiveClass);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

function TnsBaseSearchFormState.Get_Data: InsBaseSearcherWindowData;
//#UC START# *4ACB5763027B_4ACB57C4023Eget_var*
//#UC END# *4ACB5763027B_4ACB57C4023Eget_var*
begin
//#UC START# *4ACB5763027B_4ACB57C4023Eget_impl*
 Result := f_Data;
//#UC END# *4ACB5763027B_4ACB57C4023Eget_impl*
end;//TnsBaseSearchFormState.Get_Data

function TnsBaseSearchFormState.Get_ActiveClass: TnsBaseSearchClass;
//#UC START# *4EB7CC550343_4ACB57C4023Eget_var*
//#UC END# *4EB7CC550343_4ACB57C4023Eget_var*
begin
//#UC START# *4EB7CC550343_4ACB57C4023Eget_impl*
 Result := f_ActiveClass;
//#UC END# *4EB7CC550343_4ACB57C4023Eget_impl*
end;//TnsBaseSearchFormState.Get_ActiveClass

procedure TnsBaseSearchFormState.Cleanup;
//#UC START# *479731C50290_4ACB57C4023E_var*
//#UC END# *479731C50290_4ACB57C4023E_var*
begin
//#UC START# *479731C50290_4ACB57C4023E_impl*
 f_Data := nil;
 inherited;
//#UC END# *479731C50290_4ACB57C4023E_impl*
end;//TnsBaseSearchFormState.Cleanup

procedure TnsBaseSearchFormState.FinishDataUpdate;
//#UC START# *47EA4E9002C6_4ACB57C4023E_var*
//#UC END# *47EA4E9002C6_4ACB57C4023E_var*
begin
//#UC START# *47EA4E9002C6_4ACB57C4023E_impl*
 inherited;
 f_ActiveClass := nil;
 // - ���������, ����� �������/������ �����������
//#UC END# *47EA4E9002C6_4ACB57C4023E_impl*
end;//TnsBaseSearchFormState.FinishDataUpdate

procedure TnsBaseSearchFormState.ClearFields;
 {-}
begin
 f_ActiveClass := nil;
 inherited;
end;//TnsBaseSearchFormState.ClearFields

// ������ �������������� � ����������� �����������

function TnsBaseSearchFormState.As_IvcmBase: IvcmBase;
begin
 Result := Self;
end;

type
  Tkw_PrimBaseSearch_Control_ContextEdit = class(TtfwControlString)
   {* ����� ������� ��� �������������� �������� ContextEdit
----
*������ �������������*:
[code]
�������::ContextEdit TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimBaseSearch_Control_ContextEdit

// start class Tkw_PrimBaseSearch_Control_ContextEdit

{$If not defined(NoScripts)}
function Tkw_PrimBaseSearch_Control_ContextEdit.GetString: AnsiString;
 {-}
begin
 Result := 'ContextEdit';
end;//Tkw_PrimBaseSearch_Control_ContextEdit.GetString
{$IfEnd} //not NoScripts

type
  Tkw_PrimBaseSearch_Control_ContextEdit_Push = class(TkwBynameControlPush)
   {* ����� ������� ��� �������� ContextEdit
----
*������ �������������*:
[code]
�������::ContextEdit:push pop:control:SetFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimBaseSearch_Control_ContextEdit_Push

// start class Tkw_PrimBaseSearch_Control_ContextEdit_Push

{$If not defined(NoScripts)}
procedure Tkw_PrimBaseSearch_Control_ContextEdit_Push.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString('ContextEdit');
 inherited;
end;//Tkw_PrimBaseSearch_Control_ContextEdit_Push.DoDoIt
{$IfEnd} //not NoScripts

type
  Tkw_PrimBaseSearch_Component_FlashTimer = class(TtfwControlString)
   {* ����� ������� ��� �������������� ���������� FlashTimer
----
*������ �������������*:
[code]
���������::FlashTimer TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimBaseSearch_Component_FlashTimer

// start class Tkw_PrimBaseSearch_Component_FlashTimer

{$If not defined(NoScripts)}
function Tkw_PrimBaseSearch_Component_FlashTimer.GetString: AnsiString;
 {-}
begin
 Result := 'FlashTimer';
end;//Tkw_PrimBaseSearch_Component_FlashTimer.GetString
{$IfEnd} //not NoScripts

procedure TPrimBaseSearchForm.AfterSearcherSet;
//#UC START# *4ACB59F7011B_4AB791130260_var*
//#UC END# *4ACB59F7011B_4AB791130260_var*
begin
//#UC START# *4ACB59F7011B_4AB791130260_impl*
 //Assert(Assigned(f_BaseSearcher));
 //Assert(Assigned(f_BaseSearcher.Presentation));
 // - ���������������, ����� �������� http://mdp.garant.ru/pages/viewpage.action?pageId=297714750

 // http://mdp.garant.ru/pages/viewpage.action?pageId=297714750 
 if (f_BaseSearcher = nil) OR (f_BaseSearcher.Presentation = nil) then
 begin
  SafeClose;
  Exit;
 end;

 CheckParamsPagesCount((Ord(High(TnsBaseSearchKind)) - Ord(Low(TnsBaseSearchKind)) + 1));
 f_BaseSearcher.ValidateBaseSearchForm(Self.As_IvcmEntityForm);
 f_BaseSearcher.SearchWindow := Self;
 f_InCreate := True;
 try
  ClassNamesChanged;
  PresentationChanged;
 finally
  f_InCreate := False;
 end;//try..finally
//#UC END# *4ACB59F7011B_4AB791130260_impl*
end;//TPrimBaseSearchForm.AfterSearcherSet

function TPrimBaseSearchForm.MainMenuLikeBaseSearch: Boolean;
//#UC START# *4F2021110102_4AB791130260_var*
var
 l_O : InsMainMenuLikeBaseSearchOwner;
//#UC END# *4F2021110102_4AB791130260_var*
begin
//#UC START# *4F2021110102_4AB791130260_impl*
 Assert(Owner Is TvcmEntityForm);
(* if TvcmEntityForm(Owner).As_IvcmEntityForm.SameName(fm_en_MainMenuNew)
 // - ��������� ������ ����� �� ������� � �� � ��� ���������, � ����� ��� ��������
 //   �� ������� ��������� �� �� ��
   OR TvcmEntityForm(Owner).As_IvcmEntityForm.SameName(fm_BaseSearchContainerForm)
   // http://mdp.garant.ru/pages/viewpage.action?pageId=300515366*)
 if Supports(Owner, InsMainMenuLikeBaseSearchOwner, l_O) AND
    l_O.IsIt 
 // - ��������� ������ ����� �� ������� � �� � ��� ���������, � ����� ��� ��������
 //   �� ������� ��������� �� �� ��
 then
  Result := true
 else
  Result := false;
//#UC END# *4F2021110102_4AB791130260_impl*
end;//TPrimBaseSearchForm.MainMenuLikeBaseSearch

procedure TPrimBaseSearchForm.ApplyCurrentExample;
//#UC START# *4B13B419036C_4AB791130260_var*
//#UC END# *4B13B419036C_4AB791130260_var*
begin
//#UC START# *4B13B419036C_4AB791130260_impl*
 if Assigned(f_BaseSearcher) then
 begin
  TnsUseBaseSearchExampleEvent.Instance.Log;
  f_BaseSearcher.ApplyCurrentExample;
 end;//if Assigned(f_BaseSearcher) then
//#UC END# *4B13B419036C_4AB791130260_impl*
end;//TPrimBaseSearchForm.ApplyCurrentExample

function TPrimBaseSearchForm.pm_GetContextEdit: TnscTreeComboWithHistoryAndOperations;
begin
 if (f_ContextEdit = nil) then
  f_ContextEdit := FindComponent('ContextEdit') As TnscTreeComboWithHistoryAndOperations;
 Result := f_ContextEdit;
end;

procedure TPrimBaseSearchForm.UnregisterFromSearcher;
//#UC START# *4CF4D7110264_4AB791130260_var*
//#UC END# *4CF4D7110264_4AB791130260_var*
begin
//#UC START# *4CF4D7110264_4AB791130260_impl*
 if Assigned(f_BaseSearcher) then
 begin
  Inc(f_LockParamsChange);
  f_BaseSearcher.SearchWindow := nil;
 end;//Assigned(f_BaseSearcher)
 f_BaseSearcher := nil;
 f_ActiveClassForSaveInHistory := nil;
 // - ����� ����� �������� ����� �� ������ �� ����������
 if (Dispatcher <> nil) then
  if (Dispatcher.History <> nil) then
   Dispatcher.History.RemoveForm(Self.As_IvcmEntityForm);
  // - ��� �� ��������� f_BaseSearcher, �� �� �� ����� ������ ���� � �������
  // http://mdp.garant.ru/pages/viewpage.action?pageId=297708319
  // http://mdp.garant.ru/pages/viewpage.action?pageId=257393788
  // http://mdp.garant.ru/pages/viewpage.action?pageId=269069309
  // http://mdp.garant.ru/pages/viewpage.action?pageId=269069309&focusedCommentId=296636403#comment-296636403
//#UC END# *4CF4D7110264_4AB791130260_impl*
end;//TPrimBaseSearchForm.UnregisterFromSearcher

procedure TPrimBaseSearchForm.DoFindBtnClick;
//#UC START# *4CFCCEAC01C9_4AB791130260_var*
//#UC END# *4CFCCEAC01C9_4AB791130260_var*
begin
//#UC START# *4CFCCEAC01C9_4AB791130260_impl*
 try
  SearchByContext(f_BaseSearcher.ActiveClass, false);
 except
  on ETryToFindEmptyContext do
   Ask(inf_SimpleMainMenuSearchCondition);
 end;//try..except
//#UC END# *4CFCCEAC01C9_4AB791130260_impl*
end;//TPrimBaseSearchForm.DoFindBtnClick

procedure TPrimBaseSearchForm.SearchByContext(const aClassToSaveInHistory: TnsBaseSearchClass;
  aNeedUpdateAndStoreActiveClass: Boolean);
//#UC START# *4CFCCFCE0297_4AB791130260_var*

(*var
 l_Class : TnsBaseSearchClass;*)

 procedure UpdateSearcherClass;
 begin//UpdateSearcherClass
  Inc(f_LockParamsChange);
  try
(*   if not Focused and ThemePages.ChangingActivePageByMouse then
    ActivateWindow(False);*)

   if Assigned(f_BaseSearcher) and
      (not f_BaseSearcher.ActiveClass.IsSameNode(aClassToSaveInHistory))
   // �������� �������� ��������� ��������� ��� ���������� ���� ����������,
   // ��� ������ ��������, � vgscene ��������� �������� ��������� ��� �����
   // �� ���� �� ���� ���������� - http://mdp.garant.ru/pages/viewpage.action?pageId=327353074
    then
   begin
    f_BaseSearcher.ActiveClass := aClassToSaveInHistory;

    // � ����������� ��� �������������, �� vgscene ����� ��������� ��������� � ��������
    //if (f_BaseSearcher <> nil) then
    //begin
    // if (ActiveClassTab <> nil) then
    //  ActiveClassTab.Repaint;
    // Application.ProcessMessages;
    //end;//f_BaseSearcher <> nil
   end;//Assigned(f_BaseSearcher)
   if FlashTimer.Enabled then
    StopFlash;
  finally
   Dec(f_LockParamsChange);
  end;//try..finally
 end;//UpdateSearcherClass

var
 l_ErrMessage : Il3CString;
//#UC END# *4CFCCFCE0297_4AB791130260_var*
begin
//#UC START# *4CFCCFCE0297_4AB791130260_impl*
 Assert(f_BaseSearcher <> nil);
 Assert(f_BaseSearcher.Presentation <> nil);
 if f_BaseSearcher.Presentation.NeedSaveActiveClassBeforeSearch then
 // http://mdp.garant.ru/pages/viewpage.action?pageId=327826220
  f_ActiveClassForSaveInHistory := f_BaseSearcher.ActiveClass
 else
  f_ActiveClassForSaveInHistory := aClassToSaveInHistory;

 if aNeedUpdateAndStoreActiveClass then
 begin
  f_BaseSearcher.StoreActiveClass;

  // ����� �������� http://mdp.garant.ru/pages/viewpage.action?pageId=326775251
  // UpdateSearcherClass ��������, ���� l_NeedSearch
  UpdateSearcherClass;
 end;//aNeedUpdateAndStoreActiveClass

 if not l3IsNil(ContextEdit.Text) and
    (CheckContext6x(ContextEdit.Text, l_ErrMessage) <> l3NotFound) then
 begin
  Self.MessageDlg(l_ErrMessage, 'TPrimBaseSearchForm.SearchByContext', mtError);
  exit;
 end;//not l3IsNil(ContextEdit.Text)..
 if ContextEdit.PropmtTreeUsed then
  TnsUseBaseSearchHintEvent.Instance.Log;
 ContextEdit.ResetPropmtTreeUsage;
 if Assigned(f_BaseSearcher) then
   f_BaseSearcher.Find;
//#UC END# *4CFCCFCE0297_4AB791130260_impl*
end;//TPrimBaseSearchForm.SearchByContext

procedure TPrimBaseSearchForm.ContextEditPastingString(Sender: TObject;
  var aText: Il3CString);
//#UC START# *4CFCD7CF000D_4AB791130260_var*
//#UC END# *4CFCD7CF000D_4AB791130260_var*
begin
//#UC START# *4CFCD7CF000D_4AB791130260_impl*
 if (l3Len(aText) > cMaxLen) then
  l3SetLen(aText, cMaxLen);
 aText := l3StringReplace(aText, cc_TabStr, cc_EmptyTabSymbol, [rfReplaceAll]);
 aText := l3StringReplace(aText, cc_EOLStr, cc_EmptyTabSymbol, [rfReplaceAll]);
 aText := l3StringReplace(aText, cc_HardEnterNativeStr, cc_EmptyTabSymbol, [rfReplaceAll]);
 aText := l3StringReplace(aText, cc_SoftEnterNativeStr, cc_EmptyTabSymbol, [rfReplaceAll]);
 aText := RepairContext6x(aText);
//#UC END# *4CFCD7CF000D_4AB791130260_impl*
end;//TPrimBaseSearchForm.ContextEditPastingString

procedure TPrimBaseSearchForm.StopFlash;
//#UC START# *4CFCDAD5031E_4AB791130260_var*
//#UC END# *4CFCDAD5031E_4AB791130260_var*
begin
//#UC START# *4CFCDAD5031E_4AB791130260_impl*
 f_FlashCounter := 0;
 FlashTimer.Enabled := False;
 ContextLabelVisible := false{not ContextLabelVisible};
//#UC END# *4CFCDAD5031E_4AB791130260_impl*
end;//TPrimBaseSearchForm.StopFlash

procedure TPrimBaseSearchForm.UpdateSearcherContext;
//#UC START# *4CFCDAF50114_4AB791130260_var*
//#UC END# *4CFCDAF50114_4AB791130260_var*
begin
//#UC START# *4CFCDAF50114_4AB791130260_impl*
 Inc(f_LockParamsChange);
 try
  if (f_BaseSearcher <> nil) then
   f_BaseSearcher.Context := ContextEdit.Text;
  StopFlash;
 finally
  Dec(f_LockParamsChange);
 end;//try..finally
//#UC END# *4CFCDAF50114_4AB791130260_impl*
end;//TPrimBaseSearchForm.UpdateSearcherContext

procedure TPrimBaseSearchForm.ContextEditChange(Sender: TObject);
//#UC START# *4CFCDB2B01F6_4AB791130260_var*
//#UC END# *4CFCDB2B01F6_4AB791130260_var*
begin
//#UC START# *4CFCDB2B01F6_4AB791130260_impl*
 UpdateSearcherContext;
//#UC END# *4CFCDB2B01F6_4AB791130260_impl*
end;//TPrimBaseSearchForm.ContextEditChange

procedure TPrimBaseSearchForm.FlashTimerTimer(Sender: TObject);
//#UC START# *4CFCE2CC0186_4AB791130260_var*
//#UC END# *4CFCE2CC0186_4AB791130260_var*
begin
//#UC START# *4CFCE2CC0186_4AB791130260_impl*
 if FlashTimer.Enabled then
  ChangeFlash
 else
  StopFlash;
//#UC END# *4CFCE2CC0186_4AB791130260_impl*
end;//TPrimBaseSearchForm.FlashTimerTimer

procedure TPrimBaseSearchForm.ChangeFlash;
//#UC START# *4CFCE338038E_4AB791130260_var*
//#UC END# *4CFCE338038E_4AB791130260_var*
begin
//#UC START# *4CFCE338038E_4AB791130260_impl*
 Inc(f_FlashCounter);
 if f_FlashCounter > (2*c_FlashTimes) then
  StopFlash
 else
  ContextLabelVisible := not ContextLabelVisible;
//#UC END# *4CFCE338038E_4AB791130260_impl*
end;//TPrimBaseSearchForm.ChangeFlash

procedure TPrimBaseSearchForm.StartFlash;
//#UC START# *4CFCE36D00DF_4AB791130260_var*
//#UC END# *4CFCE36D00DF_4AB791130260_var*
begin
//#UC START# *4CFCE36D00DF_4AB791130260_impl*
 f_FlashCounter := 0;
 FlashTimer.Enabled := True;
 ContextLabelVisible := true{not ContextLabelVisible};
//#UC END# *4CFCE36D00DF_4AB791130260_impl*
end;//TPrimBaseSearchForm.StartFlash

procedure TPrimBaseSearchForm.ContextEditSelect(Sender: TObject);
//#UC START# *4CFCE40A036B_4AB791130260_var*
//#UC END# *4CFCE40A036B_4AB791130260_var*
begin
//#UC START# *4CFCE40A036B_4AB791130260_impl*
 try
  SearchByContext(f_BaseSearcher.ActiveClass, false);
 except
  on ETryToFindEmptyContext do
   Ask(inf_SimpleMainMenuSearchCondition);
 end;//try..except
//#UC END# *4CFCE40A036B_4AB791130260_impl*
end;//TPrimBaseSearchForm.ContextEditSelect

procedure TPrimBaseSearchForm.DoCloseBtnClick;
//#UC START# *4CFCEC8B030B_4AB791130260_var*
//#UC END# *4CFCEC8B030B_4AB791130260_var*
begin
//#UC START# *4CFCEC8B030B_4AB791130260_impl*
 if (f_BaseSearcher = nil) OR
    // http://mdp.garant.ru/pages/viewpage.action?pageId=321989072
    (f_BaseSearcher.Presentation = nil) then
 // http://mdp.garant.ru/pages/viewpage.action?pageId=297714750
  SafeClose
 else
 if f_BaseSearcher.Presentation.CanCloseWindow then
 begin
  UnregisterFromSearcher;
  SafeClose;
 end;//f_BaseSearcher.Presentation.CanCloseWindow
//#UC END# *4CFCEC8B030B_4AB791130260_impl*
end;//TPrimBaseSearchForm.DoCloseBtnClick

procedure TPrimBaseSearchForm.UpdateSearcherArea(anArea: TnsSearchArea;
  anKind: TnsBaseSearchKind);
//#UC START# *4CFE398A0128_4AB791130260_var*
//#UC END# *4CFE398A0128_4AB791130260_var*
begin
//#UC START# *4CFE398A0128_4AB791130260_impl*
 Inc(f_LockParamsChange);
 try
  if Assigned(f_BaseSearcher) and (f_BaseSearcher.ContextKind = anKind) then
   f_BaseSearcher.Area := anArea;
  StopFlash;
  SetUpFindButtons;
 finally
  Dec(f_LockParamsChange);
 end;//try..finally
//#UC END# *4CFE398A0128_4AB791130260_impl*
end;//TPrimBaseSearchForm.UpdateSearcherArea

procedure TPrimBaseSearchForm.DoFindBackBtnClick;
//#UC START# *4CFE48BF01E2_4AB791130260_var*
//#UC END# *4CFE48BF01E2_4AB791130260_var*
begin
//#UC START# *4CFE48BF01E2_4AB791130260_impl*
 f_BaseSearcher.FindBack;
 TnsUseBackSearchButtonEvent.Instance.Log;
//#UC END# *4CFE48BF01E2_4AB791130260_impl*
end;//TPrimBaseSearchForm.DoFindBackBtnClick

// start class TnsUseBaseSearchExampleEvent

var g_TnsUseBaseSearchExampleEvent : TnsUseBaseSearchExampleEvent = nil;

procedure TnsUseBaseSearchExampleEventFree;
begin
 l3Free(g_TnsUseBaseSearchExampleEvent);
end;

class function TnsUseBaseSearchExampleEvent.Instance: TnsUseBaseSearchExampleEvent;
begin
 if (g_TnsUseBaseSearchExampleEvent = nil) then
 begin
  l3System.AddExitProc(TnsUseBaseSearchExampleEventFree);
  g_TnsUseBaseSearchExampleEvent := Create;
 end;
 Result := g_TnsUseBaseSearchExampleEvent;
end;


function TnsUseBaseSearchExampleEvent.EventID: TLogEvent;
//#UC START# *4B13A26203DB_4B13B3BD01CD_var*
//#UC END# *4B13A26203DB_4B13B3BD01CD_var*
begin
//#UC START# *4B13A26203DB_4B13B3BD01CD_impl*
 Result := LE_USE_BASE_SEARCH_EXAMPLE;
//#UC END# *4B13A26203DB_4B13B3BD01CD_impl*
end;//TnsUseBaseSearchExampleEvent.EventID

// start class TnsUseBaseSearchHintEvent

var g_TnsUseBaseSearchHintEvent : TnsUseBaseSearchHintEvent = nil;

procedure TnsUseBaseSearchHintEventFree;
begin
 l3Free(g_TnsUseBaseSearchHintEvent);
end;

class function TnsUseBaseSearchHintEvent.Instance: TnsUseBaseSearchHintEvent;
begin
 if (g_TnsUseBaseSearchHintEvent = nil) then
 begin
  l3System.AddExitProc(TnsUseBaseSearchHintEventFree);
  g_TnsUseBaseSearchHintEvent := Create;
 end;
 Result := g_TnsUseBaseSearchHintEvent;
end;


function TnsUseBaseSearchHintEvent.EventID: TLogEvent;
//#UC START# *4B13A26203DB_4B13B90D007E_var*
//#UC END# *4B13A26203DB_4B13B90D007E_var*
begin
//#UC START# *4B13A26203DB_4B13B90D007E_impl*
 Result := LE_USE_BASE_SEARCH_HINT;
//#UC END# *4B13A26203DB_4B13B90D007E_impl*
end;//TnsUseBaseSearchHintEvent.EventID

// start class TnsUseBackSearchButtonEvent

var g_TnsUseBackSearchButtonEvent : TnsUseBackSearchButtonEvent = nil;

procedure TnsUseBackSearchButtonEventFree;
begin
 l3Free(g_TnsUseBackSearchButtonEvent);
end;

class function TnsUseBackSearchButtonEvent.Instance: TnsUseBackSearchButtonEvent;
begin
 if (g_TnsUseBackSearchButtonEvent = nil) then
 begin
  l3System.AddExitProc(TnsUseBackSearchButtonEventFree);
  g_TnsUseBackSearchButtonEvent := Create;
 end;
 Result := g_TnsUseBackSearchButtonEvent;
end;


function TnsUseBackSearchButtonEvent.EventID: TLogEvent;
//#UC START# *4B13A26203DB_4B13B9AA029F_var*
//#UC END# *4B13A26203DB_4B13B9AA029F_var*
begin
//#UC START# *4B13A26203DB_4B13B9AA029F_impl*
 Result := LE_USE_BACK_SEARCH_BUTTON;
//#UC END# *4B13A26203DB_4B13B9AA029F_impl*
end;//TnsUseBackSearchButtonEvent.EventID

class function TPrimBaseSearchForm.MakeSingleChild(const aData: InsBaseSearcherWindowData;
  const aCont   : IvcmContainer;
  aZoneType     : TvcmZoneType = vcm_ztAny;
  aUserType     : TvcmEffectiveUserType = 0;
  aDataSource   : IvcmFormDataSource = nil): IvcmEntityForm;

 procedure AfterCreate(aForm : TPrimBaseSearchForm);
 begin
  with aForm do
  begin
//#UC START# *4AC4E7DA017F_4AB791130260_impl*
   Assert(aData <> nil);
   f_BaseSearcher := aData;
   f_BaseSearcher.ValidateBaseSearchForm(aForm.As_IvcmEntityForm);
   AfterSearcherSet;
//#UC END# *4AC4E7DA017F_4AB791130260_impl*
  end;//with aForm
 end;

var
 l_AC : TvcmInitProc;
 l_ACHack : Pointer absolute l_AC;
begin
 l_AC := l3LocalStub(@AfterCreate);
 try
  Result := inherited MakeSingleChild(aCont, vcmMakeParams, aZoneType, aUserType, nil, aDataSource, vcm_utAny, l_AC);
 finally
  l3FreeLocalStub(l_ACHack);
 end;//try..finally
end;

procedure TPrimBaseSearchForm.CMVisibleChanged(var Msg: TMessage);
//#UC START# *506AB26A0032_4AB791130260_var*
//#UC END# *506AB26A0032_4AB791130260_var*
begin
//#UC START# *506AB26A0032_4AB791130260_impl*
 inherited;

 if not Assigned(ContextEdit) then
  Exit;

 if not MainMenuLikeBaseSearch then
  Exit;

 if not Visible then
  Exit;

 if not Assigned(Dispatcher) or
    not Assigned(Dispatcher.History) or
    not Dispatcher.History.InBF then
  if ContextEdit.CanFocus and (Windows.GetFocus <> ContextEdit.Handle) then
   ContextEdit.SetFocus;
//#UC END# *506AB26A0032_4AB791130260_impl*
end;//TPrimBaseSearchForm.CMVisibleChanged

procedure TPrimBaseSearchForm.ParamsChanged;
//#UC START# *496B51AA02C3_4AB791130260_var*
var
 l_Area : TnsSearchArea;
//#UC END# *496B51AA02C3_4AB791130260_var*
begin
//#UC START# *496B51AA02C3_4AB791130260_impl*
 if VCMClosing or l3SystemDown then
  exit;
 Assert(Assigned(f_BaseSearcher));
 if Dispatcher.FormDispatcher.Locked and not f_InCreate then
 begin
  f_NeedParamsChanged := true;
  Dispatcher.FormDispatcher.AddLockListener(IvcmLockListener(Self));
 end//Dispatcher.FormDispatcher.Locked and not f_InCreate then
 else
 begin
  if (f_LockParamsChange = 0) then
  begin
   ContextEdit.Text := f_BaseSearcher.Context;

   ContextEdit.PaintMistakes(f_BaseSearcher.ErrorWords);

   l_Area := f_BaseSearcher.Area;
   SetCurrentContextKind(f_BaseSearcher.ContextKind);
   AdjustParamsPagesHeight;

   SetCurrentSearchArea(l_Area);

   SetUpFindButtons;
  end;//f_LockParamsChange = 0

  ContextEdit.PromptTree := f_BaseSearcher.MakePromptTree;

  SetupThemePages;
  f_NeedParamsChanged := false;
  CheckFindEnabled;
  CheckFragmentsCount;
 end;//Dispatcher.FormDispatcher.Locked and not f_InCreate
//#UC END# *496B51AA02C3_4AB791130260_impl*
end;//TPrimBaseSearchForm.ParamsChanged

procedure TPrimBaseSearchForm.PresentationChanged;
//#UC START# *496B51B500C8_4AB791130260_var*
//#UC END# *496B51B500C8_4AB791130260_var*
begin
//#UC START# *496B51B500C8_4AB791130260_impl*
 if VCMClosing then
  exit;
 if Dispatcher.FormDispatcher.Locked and not f_InCreate then
 begin
  f_NeedPresentationChanged := True;
  Dispatcher.FormDispatcher.AddLockListener(IvcmLockListener(Self));
 end//Dispatcher.FormDispatcher.Locked..
 else
 begin
  CloseBtnEnabled := f_BaseSearcher.Presentation.WindowCloseable;
  f_NeedPresentationChanged := False;
  ParamsChanged;
  ExampleChanged;
  ContextEdit.SelectAll;
 end;//Dispatcher.FormDispatcher.Locked..
//#UC END# *496B51B500C8_4AB791130260_impl*
end;//TPrimBaseSearchForm.PresentationChanged

procedure TPrimBaseSearchForm.ExampleChanged;
//#UC START# *496B51BF02D2_4AB791130260_var*
//#UC END# *496B51BF02D2_4AB791130260_var*
begin
//#UC START# *496B51BF02D2_4AB791130260_impl*
 if Assigned(f_BaseSearcher) then
  DoExampleChanged(f_BaseSearcher.ExampleText);
//#UC END# *496B51BF02D2_4AB791130260_impl*
end;//TPrimBaseSearchForm.ExampleChanged

procedure TPrimBaseSearchForm.CheckFindEnabled;
//#UC START# *496B51C90345_4AB791130260_var*
//#UC END# *496B51C90345_4AB791130260_var*
begin
//#UC START# *496B51C90345_4AB791130260_impl*
 Self.FindBtnEnabled := Assigned(f_BaseSearcher) and f_BaseSearcher.FindEnabled;
 Self.FindBackBtnEnabled := Assigned(f_BaseSearcher) and f_BaseSearcher.FindBackEnabled;
//#UC END# *496B51C90345_4AB791130260_impl*
end;//TPrimBaseSearchForm.CheckFindEnabled

procedure TPrimBaseSearchForm.ClassNamesChanged;
//#UC START# *496B51D40055_4AB791130260_var*
//#UC END# *496B51D40055_4AB791130260_var*
begin
//#UC START# *496B51D40055_4AB791130260_impl*
 if VCMClosing then
  exit;
 SetupClasses(not f_InCreate);
//#UC END# *496B51D40055_4AB791130260_impl*
end;//TPrimBaseSearchForm.ClassNamesChanged

procedure TPrimBaseSearchForm.CloseWindow;
//#UC START# *496B51DC037D_4AB791130260_var*
//#UC END# *496B51DC037D_4AB791130260_var*
begin
//#UC START# *496B51DC037D_4AB791130260_impl*
 UnregisterFromSearcher;
 SafeClose;
//#UC END# *496B51DC037D_4AB791130260_impl*
end;//TPrimBaseSearchForm.CloseWindow

procedure TPrimBaseSearchForm.ActivateWindow(aNeedFlash: Boolean = True);
//#UC START# *496B51F202B1_4AB791130260_var*
var
 l_F : TafwCustomForm;
//#UC END# *496B51F202B1_4AB791130260_var*
begin
//#UC START# *496B51F202B1_4AB791130260_impl*
 if aNeedFlash then
  StartFlash;
 if ContextEdit.CanFocus then
 begin
  l_F := afw.GetParentForm(ContextEdit);
  if (l_F = nil) then
   Exit;
  while (l_F <> nil) do
  begin
   if not l_F.Visible then
    Exit;
   l_F := afw.GetAnotherParentForm(l_F);
  end;//l_F <> nil
  ContextEdit.SetFocus;
 end;//ContextEdit.CanFocus
//#UC END# *496B51F202B1_4AB791130260_impl*
end;//TPrimBaseSearchForm.ActivateWindow

procedure TPrimBaseSearchForm.HistoryChanged(const aNewHistory: IvcmStrings);
//#UC START# *496B53B70380_4AB791130260_var*
//#UC END# *496B53B70380_4AB791130260_var*
begin
//#UC START# *496B53B70380_4AB791130260_impl*
 ContextEdit.HistoryItems.Assign(aNewHistory);
//#UC END# *496B53B70380_4AB791130260_impl*
end;//TPrimBaseSearchForm.HistoryChanged

procedure TPrimBaseSearchForm.ContextSearched;
//#UC START# *496B53C30337_4AB791130260_var*
//#UC END# *496B53C30337_4AB791130260_var*
begin
//#UC START# *496B53C30337_4AB791130260_impl*
 // DoNothings;
//#UC END# *496B53C30337_4AB791130260_impl*
end;//TPrimBaseSearchForm.ContextSearched

{$If not defined(NoVCM)}
procedure TPrimBaseSearchForm.Lock;
//#UC START# *4995562701A0_4AB791130260_var*
//#UC END# *4995562701A0_4AB791130260_var*
begin
//#UC START# *4995562701A0_4AB791130260_impl*
 // DoNothings;
//#UC END# *4995562701A0_4AB791130260_impl*
end;//TPrimBaseSearchForm.Lock
{$IfEnd} //not NoVCM

{$If not defined(NoVCM)}
procedure TPrimBaseSearchForm.BeforeUnlock;
//#UC START# *4995563201CA_4AB791130260_var*
//#UC END# *4995563201CA_4AB791130260_var*
begin
//#UC START# *4995563201CA_4AB791130260_impl*
 // DoNothings;
//#UC END# *4995563201CA_4AB791130260_impl*
end;//TPrimBaseSearchForm.BeforeUnlock
{$IfEnd} //not NoVCM

{$If not defined(NoVCM)}
procedure TPrimBaseSearchForm.Unlock;
//#UC START# *4995563E01A9_4AB791130260_var*
//#UC END# *4995563E01A9_4AB791130260_var*
begin
//#UC START# *4995563E01A9_4AB791130260_impl*
 if not VCMCLosing then
 begin
  if f_NeedPresentationChanged then
   PresentationChanged;
  if f_NeedParamsChanged then
   ParamsChanged;
 end;//if not VCMCLosing then
//#UC END# *4995563E01A9_4AB791130260_impl*
end;//TPrimBaseSearchForm.Unlock
{$IfEnd} //not NoVCM

procedure TPrimBaseSearchForm.CheckFragmentsCount;
//#UC START# *49FFD8050279_4AB791130260_var*
//#UC END# *49FFD8050279_4AB791130260_var*
begin
//#UC START# *49FFD8050279_4AB791130260_impl*
 DoCheckFragmentsCount(f_BaseSearcher.FragmentsCountSuffix);
//#UC END# *49FFD8050279_4AB791130260_impl*
end;//TPrimBaseSearchForm.CheckFragmentsCount

procedure TPrimBaseSearchForm.Result_OkExt_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4A8AD47D0357_4AB791130260test_var*
//#UC END# *4A8AD47D0357_4AB791130260test_var*
begin
//#UC START# *4A8AD47D0357_4AB791130260test_impl*
 aParams.Op.Flag[vcm_ofVisible] := False;
//#UC END# *4A8AD47D0357_4AB791130260test_impl*
end;//TPrimBaseSearchForm.Result_OkExt_Test

procedure TPrimBaseSearchForm.Result_OkExt_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4A8AD47D0357_4AB791130260exec_var*
//#UC END# *4A8AD47D0357_4AB791130260exec_var*
begin
//#UC START# *4A8AD47D0357_4AB791130260exec_impl*
 DoFindBtnClick;
//#UC END# *4A8AD47D0357_4AB791130260exec_impl*
end;//TPrimBaseSearchForm.Result_OkExt_Execute

procedure TPrimBaseSearchForm.Result_Ok_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4A97EBE702F8_4AB791130260test_var*
//#UC END# *4A97EBE702F8_4AB791130260test_var*
begin
//#UC START# *4A97EBE702F8_4AB791130260test_impl*
 aParams.Op.Flag[vcm_ofVisible] := False;
//#UC END# *4A97EBE702F8_4AB791130260test_impl*
end;//TPrimBaseSearchForm.Result_Ok_Test

procedure TPrimBaseSearchForm.Result_Ok_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4A97EBE702F8_4AB791130260exec_var*
//#UC END# *4A97EBE702F8_4AB791130260exec_var*
begin
//#UC START# *4A97EBE702F8_4AB791130260exec_impl*
 DoFindBtnClick;
//#UC END# *4A97EBE702F8_4AB791130260exec_impl*
end;//TPrimBaseSearchForm.Result_Ok_Execute

procedure TPrimBaseSearchForm.Result_Cancel_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4AC5D61E0284_4AB791130260test_var*
//#UC END# *4AC5D61E0284_4AB791130260test_var*
begin
//#UC START# *4AC5D61E0284_4AB791130260test_impl*
 aParams.Op.Flag[vcm_ofVisible] := False;
//#UC END# *4AC5D61E0284_4AB791130260test_impl*
end;//TPrimBaseSearchForm.Result_Cancel_Test

procedure TPrimBaseSearchForm.Result_Cancel_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4AC5D61E0284_4AB791130260exec_var*
//#UC END# *4AC5D61E0284_4AB791130260exec_var*
begin
//#UC START# *4AC5D61E0284_4AB791130260exec_impl*
 if CloseBtnEnabled then
  DoCloseBtnClick
 else
  aParams.DoneStatus := vcm_dsNotDone; 
//#UC END# *4AC5D61E0284_4AB791130260exec_impl*
end;//TPrimBaseSearchForm.Result_Cancel_Execute

function TPrimBaseSearchForm.Get_Container: IvcmContainer;
//#UC START# *4ACB63B502EA_4AB791130260get_var*
//#UC END# *4ACB63B502EA_4AB791130260get_var*
begin
//#UC START# *4ACB63B502EA_4AB791130260get_impl*
 Result := inherited Get_Container;
//#UC END# *4ACB63B502EA_4AB791130260get_impl*
end;//TPrimBaseSearchForm.Get_Container

procedure TPrimBaseSearchForm.EnclosedForms_CloseChild_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C43D2F002EC_4AB791130260test_var*
//#UC END# *4C43D2F002EC_4AB791130260test_var*
begin
//#UC START# *4C43D2F002EC_4AB791130260test_impl*
 aParams.Op.Flag[vcm_ofVisible] := False;
//#UC END# *4C43D2F002EC_4AB791130260test_impl*
end;//TPrimBaseSearchForm.EnclosedForms_CloseChild_Test

procedure TPrimBaseSearchForm.EnclosedForms_CloseChild_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C43D2F002EC_4AB791130260exec_var*
//#UC END# *4C43D2F002EC_4AB791130260exec_var*
begin
//#UC START# *4C43D2F002EC_4AB791130260exec_impl*
 DoCloseBtnClick;
//#UC END# *4C43D2F002EC_4AB791130260exec_impl*
end;//TPrimBaseSearchForm.EnclosedForms_CloseChild_Execute

procedure TPrimBaseSearchForm.Cleanup;
//#UC START# *479731C50290_4AB791130260_var*
//#UC END# *479731C50290_4AB791130260_var*
begin
//#UC START# *479731C50290_4AB791130260_impl*
 if (Dispatcher <> nil) then
  if (Dispatcher.History <> nil) then
   Dispatcher.History.RemoveForm(Self.As_IvcmEntityForm);
  // http://mdp.garant.ru/pages/viewpage.action?pageId=257393788
  // http://mdp.garant.ru/pages/viewpage.action?pageId=269069309
  // http://mdp.garant.ru/pages/viewpage.action?pageId=269069309&focusedCommentId=296636403#comment-296636403
 Dispatcher.FormDispatcher.RemoveLockListener(IvcmLockListener(Self));
 if Assigned(f_ContextHistory) then
  f_ContextHistory.RemoveNotifier(Self);
 f_ContextHistory := nil;
 UnregisterFromSearcher;
 f_BaseSearcher := nil;
 inherited;
//#UC END# *479731C50290_4AB791130260_impl*
end;//TPrimBaseSearchForm.Cleanup

procedure TPrimBaseSearchForm.FinishDataUpdate;
//#UC START# *47EA4E9002C6_4AB791130260_var*
//#UC END# *47EA4E9002C6_4AB791130260_var*
begin
//#UC START# *47EA4E9002C6_4AB791130260_impl*
 inherited;
 f_ActiveClassForSaveInHistory := nil;
//#UC END# *47EA4E9002C6_4AB791130260_impl*
end;//TPrimBaseSearchForm.FinishDataUpdate

{$If not defined(NoVCM)}
procedure TPrimBaseSearchForm.DoInit(aFromHistory: Boolean);
//#UC START# *49803F5503AA_4AB791130260_var*
//#UC END# *49803F5503AA_4AB791130260_var*
begin
//#UC START# *49803F5503AA_4AB791130260_impl*
 inherited;
// if not aFromHistory then
 begin
(*  Assert(Dispatcher <> nil);
  Assert(Dispatcher.History <> nil);*)
 if not MainMenuLikeBaseSearch then
 // http://mdp.garant.ru/pages/viewpage.action?pageId=326773370
 // - ��������� ����� � �������, ������ ����� ��� "����� � �������"
 //   � �� ����������� � ������� ������ �� ������ ����������.
 // http://mdp.garant.ru/pages/viewpage.action?pageId=326773370&focusedCommentId=330698567#comment-330698567  
  if (Dispatcher <> nil) then
   if (Dispatcher.History <> nil) then
    Dispatcher.History.AddForm(Self.As_IvcmEntityForm);
   // http://mdp.garant.ru/pages/viewpage.action?pageId=257393788
   // http://mdp.garant.ru/pages/viewpage.action?pageId=269069309
   // http://mdp.garant.ru/pages/viewpage.action?pageId=269069309&focusedCommentId=296636403#comment-296636403
 end;//not aFromHistory
 f_ContextHistory := nsGetContextHistory(ns_chkDocument);
 f_ContextHistory.AddNotifier(Self);
 HistoryChanged(f_ContextHistory.History);
//#UC END# *49803F5503AA_4AB791130260_impl*
end;//TPrimBaseSearchForm.DoInit
{$IfEnd} //not NoVCM

{$If not defined(NoVCM)}
function TPrimBaseSearchForm.DoSaveState(out theState: IvcmBase;
  aStateType: TvcmStateType): Boolean;
//#UC START# *49806ED503D5_4AB791130260_var*
//#UC END# *49806ED503D5_4AB791130260_var*
begin
//#UC START# *49806ED503D5_4AB791130260_impl*
 if true{(aStateType = vcm_stContent)} then
 begin
  (*if not g_Dispatcher.History.InBF then
  // http://mdp.garant.ru/pages/viewpage.action?pageId=300515366
  // http://mdp.garant.ru/pages/viewpage.action?pageId=300515366&focusedCommentId=326769653#comment-326769653*)
  // - � ��� ����� - ��������, ���� � CreateFormGUID ����
  //if not WasSaved AND not VCMClosing then
  // http://mdp.garant.ru/pages/viewpage.action?pageId=326773370
  // - ������ ��� ������ ��� �������� � ������:
  //   http://mdp.garant.ru/pages/viewpage.action?pageId=326773370&focusedCommentId=330698406#comment-330698406
   Assert(f_BaseSearcher <> nil, '����� ��, ������� �������� ������ � ������� �� ���� �������� ���������������� ��� ��������� � �������� �����������');
  // - ������ ��� ����, �� �������� ���� K265406789, ���� ����� ��� ���-�� � ��
  //   ������. ����� ��� �������� �� ����� ����.

  if (f_BaseSearcher = nil) then
   Result := false
  else
  if (f_BaseSearcher.Presentation <> nil) AND
     f_BaseSearcher.Presentation.FormCloseWasRequested then
  begin
   // ������� �:
   // http://mdp.garant.ru/pages/viewpage.action?pageId=321989072&focusedCommentId=330698655#comment-330698655
   // bq. � ����� ���� �� ����������� ������� ������  ����� ������ �������� ProcessMessages. �� � - ������. ���� �� ��� ����������� � ������� ��� ��. � ����� ��� ����� �������� �����������������. �� � - �����.
   Result := false;
   f_BaseSearcher.RemovePresentation(f_BaseSearcher.Presentation);
   // ƨ���� ��������� ���������� �������������, ����� ��������� ���� ���� ������
  end//f_BaseSearcher.Presentation <> nil
  else
  begin
   f_BaseSearcher.ValidateBaseSearchForm(Self.As_IvcmEntityForm);
   if (f_ActiveClassForSaveInHistory <> nil) then
   begin
    theState := TnsBaseSearchFormState.Make(f_BaseSearcher, f_ActiveClassForSaveInHistory).As_IvcmBase;
    f_ActiveClassForSaveInHistory := nil;
    // - �������, �.�. ������ ��� ���������� ��� ��, ��� ���� ����� ������
   end//f_ActiveClassForSaveInHistory <> nil
   else
    theState := TnsBaseSearchFormState.Make(f_BaseSearcher, f_BaseSearcher.ActiveClassForSaveState).As_IvcmBase;
   Result := true;
  end;//f_BaseSearcher = nil
 end//aStateType = vcm_stContent
 else
  Result := inherited DoSaveState(theState, aStateType);
//#UC END# *49806ED503D5_4AB791130260_impl*
end;//TPrimBaseSearchForm.DoSaveState
{$IfEnd} //not NoVCM

{$If not defined(NoVCM)}
function TPrimBaseSearchForm.DoLoadState(const aState: IvcmBase;
  aStateType: TvcmStateType): Boolean;
//#UC START# *49807428008C_4AB791130260_var*
var
 l_State : InsBaseSearchFormState;
//#UC END# *49807428008C_4AB791130260_var*
begin
//#UC START# *49807428008C_4AB791130260_impl*
 if true{(aStateType = vcm_stContent)} then
 begin
  l_State := aState As InsBaseSearchFormState;
  Assert(l_State <> nil);
  // ������� Assert
   // ������� �:
   // http://mdp.garant.ru/pages/viewpage.action?pageId=321989072&focusedCommentId=330698655#comment-330698655
   // bq. � ����� ���� �� ����������� ������� ������  ����� ������ �������� ProcessMessages. �� � - ������. ���� �� ��� ����������� � ������� ��� ��. � ����� ��� ����� �������� �����������������. �� � - �����.
  // ������ Assert
   // ��. TPrimBaseSearchForm.DoSaveState
   //  f_BaseSearcher.Presentation := nil
  if (l_State = nil) then
  begin
   Result := false;
   Self.SafeClose;
  end//l_State = nil
  else
  begin
   f_BaseSearcher := l_State.Data;
   Assert(f_BaseSearcher <> nil);
   f_BaseSearcher.ActiveClass := l_State.ActiveClass;
   // http://mdp.garant.ru/pages/viewpage.action?pageId=269069309&focusedCommentId=296635902#comment-296635902
   Self.f_ActiveClassForSaveInHistory := l_State.ActiveClass;
   // http://mdp.garant.ru/pages/viewpage.action?pageId=327826220
   AfterSearcherSet;
   Result := true;
  end;//l_State = nil
 end//aStateType = vcm_stContent
 else
  Result := inherited DoLoadState(aState, aStateType);
//#UC END# *49807428008C_4AB791130260_impl*
end;//TPrimBaseSearchForm.DoLoadState
{$IfEnd} //not NoVCM

{$If not defined(NoVCM)}
function TPrimBaseSearchForm.NeedDrawCaption: Boolean;
//#UC START# *4A84183701B9_4AB791130260_var*
//#UC END# *4A84183701B9_4AB791130260_var*
begin
//#UC START# *4A84183701B9_4AB791130260_impl*
 Result := false;
//#UC END# *4A84183701B9_4AB791130260_impl*
end;//TPrimBaseSearchForm.NeedDrawCaption
{$IfEnd} //not NoVCM

{$If not defined(NoVCM)}
procedure TPrimBaseSearchForm.InitControls;
//#UC START# *4A8E8F2E0195_4AB791130260_var*
//#UC END# *4A8E8F2E0195_4AB791130260_var*
begin
//#UC START# *4A8E8F2E0195_4AB791130260_impl*
 inherited;
 with ContextEdit do
 begin
  BorderStyle := bsNone;
  MaxLength := cMaxLen;
  OnPastingString := Self.ContextEditPastingString;
  OnChange := Self.ContextEditChange;
  OnSelect := Self.ContextEditSelect;
 end;//with ContextEdit
 with FlashTimer do
 begin
  Enabled := False;
  Interval := 250;
  OnTimer := Self.FlashTimerTimer;
 end;//with FlashTimer
//#UC END# *4A8E8F2E0195_4AB791130260_impl*
end;//TPrimBaseSearchForm.InitControls
{$IfEnd} //not NoVCM

{$If not defined(NoVCM)}
procedure TPrimBaseSearchForm.CreateFormGUID(var theGUID: TGUID);
//#UC START# *4EBBC63E032A_4AB791130260_var*
//#UC END# *4EBBC63E032A_4AB791130260_var*
begin
//#UC START# *4EBBC63E032A_4AB791130260_impl*
 if MainMenuLikeBaseSearch then
 // - ��������� ������ ����� �� ������� � �� � ��� ���������, � ����� ��� ��������
 //   �� ������� ��������� �� �� ��
  inherited CreateFormGUID(theGUID)
 else
  //theGUID := NewBaseSearchFormDef;
  // http://mdp.garant.ru/pages/viewpage.action?pageId=297701079
  // - �������� ���� � ���, ��� ����� ��� �������� ����� �� ������� MakeSingleChild
  //   �� ������� ��� ��������� �����.
  TnsBaseSearchFormGUIDFactory.Instance.CreateFormGUID(Self.As_IvcmEntityForm, theGUID);
  // http://mdp.garant.ru/pages/viewpage.action?pageId=330139744
  // http://mdp.garant.ru/pages/viewpage.action?pageId=330139744&focusedCommentId=330142549#comment-330142549
//#UC END# *4EBBC63E032A_4AB791130260_impl*
end;//TPrimBaseSearchForm.CreateFormGUID
{$IfEnd} //not NoVCM

procedure TPrimBaseSearchForm.ClearFields;
 {-}
begin
 f_ActiveClassForSaveInHistory := nil;
 inherited;
end;//TPrimBaseSearchForm.ClearFields

procedure TPrimBaseSearchForm.InitEntities;
begin
 inherited;
 with Entities.Entities do
 begin
  PublishFormEntity(en_Result, nil);
  PublishFormEntity(en_EnclosedForms, nil);
  PublishOp(en_Result, op_OkExt, Result_OkExt_Execute, Result_OkExt_Test, nil);
  ShowInContextMenu(en_Result, op_OkExt, true);
  ShowInToolbar(en_Result, op_OkExt, true);
  PublishOp(en_Result, op_Ok, Result_Ok_Execute, Result_Ok_Test, nil);
  ShowInContextMenu(en_Result, op_Ok, false);
  ShowInToolbar(en_Result, op_Ok, false);
  PublishOp(en_Result, op_Cancel, Result_Cancel_Execute, Result_Cancel_Test, nil);
  ShowInContextMenu(en_Result, op_Cancel, false);
  ShowInToolbar(en_Result, op_Cancel, false);
  PublishOp(en_EnclosedForms, op_CloseChild, EnclosedForms_CloseChild_Execute, EnclosedForms_CloseChild_Test, nil);
  ShowInContextMenu(en_EnclosedForms, op_CloseChild, false);
  ShowInToolbar(en_EnclosedForms, op_CloseChild, false);
 end;//with Entities.Entities
end;

procedure TPrimBaseSearchForm.MakeControls;
begin
 inherited;
 f_FlashTimer := TTimer.Create(Self);
 f_FlashTimer.Name := 'FlashTimer';
 with AddUsertype(BaseSearchName,
  str_BaseSearchCaption,
  str_BaseSearchCaption,
  true,
  -1,
  -1,
  '',
  nil,
  nil,
  nil,
  vcm_ccNone) do
 begin
 end;//with AddUsertype(BaseSearchName
end;

{$IfEnd} //not Admin AND not Monitorings

initialization
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimBaseSearch_Control_ContextEdit
 Tkw_PrimBaseSearch_Control_ContextEdit.Register('�������::ContextEdit', TnscTreeComboWithHistoryAndOperations);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimBaseSearch_Control_ContextEdit_Push
 Tkw_PrimBaseSearch_Control_ContextEdit_Push.Register('�������::ContextEdit:push');
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimBaseSearch_Component_FlashTimer
 Tkw_PrimBaseSearch_Component_FlashTimer.Register('���������::FlashTimer', TTimer);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ������������� str_BaseSearchCaption
 str_BaseSearchCaption.Init;
{$IfEnd} //not Admin AND not Monitorings

end.