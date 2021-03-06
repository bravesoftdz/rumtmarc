unit PrimDiction_Form;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "View"
// �����: ����� �.�.
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/View/Diction/Forms/PrimDiction_Form.pas"
// �����: 23.01.2009 17:29
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<VCMForm::Class>> F1 ���������� ��������::Diction::View::Diction::PrimDiction
//
// �������� �������
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
  ,
  l3TreeInterfaces,
  Classes,
  l3ControlsTypes,
  bsTypes,
  nsLangToContextMap,
  DictionInterfaces,
  CommonDictionInterfaces,
  eeTreeView,
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
  vtPanel,
  ImgList,
  l3StringIDEx,
  Diction_Strange_Controls,
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
  DocumentAndListInterfaces,
  vcmInterfaces {a},
  vcmEntityForm {a},
  vcmControllers {a},
  PrimDiction_utDiction_UserType
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}
type
 _BaseDocument_Parent_ = TvcmEntityForm;
 {$Include w:\garant6x\implementation\Garant\GbaNemesis\View\Common\Forms\BaseDocument.imp.pas}
 TPrimDictionForm = {form} class(_BaseDocument_, IbsDictionListener)
  {* �������� ������� }
 private
 // private fields
   f_InternalChange : Integer;
   f_BackgroundPanel : TvtPanel;
    {* ���� ��� �������� BackgroundPanel}
   f_ContextFilter : TnscContextFilter;
    {* ���� ��� �������� ContextFilter}
   f_WordsTree : TnscTreeView;
    {* ���� ��� �������� WordsTree}
   f_ContextMap : TnsLangToContextMap;
    {* ���� ��� �������� ContextMap}
 protected
  procedure SignalDataSourceChanged(const anOld : IvcmViewAreaController;
                                const aDsNew : IvcmViewAreaController); override;
  procedure InitEntities; override;
  procedure MakeControls; override;
 private
 // private methods
   procedure ContextFilterChange(Sender: TObject);
     {* TNotifyEvent is used for events that do not require parameters. }
   procedure ContextFilterWrongContext(Sender: TObject);
     {* TNotifyEvent is used for events that do not require parameters. }
   function WordsTreeGetItemImage(Sender: TObject;
     Index: Integer;
     var aImages: TCustomImageList): Integer;
     {* Event to get Index of Bitmap in ImageIndex. }
   procedure WordsTreeNewCharPressed(aChar: AnsiChar);
   procedure WordsTreeActionElement(Sender: TObject;
     Index: LongInt);
   procedure WordsTreeMakeTreeSource(out theTree: Il3SimpleTree);
   procedure WordsTreeSelectCountChanged(aSender: TObject;
     anOldCount: Integer;
     aNewCount: Integer);
   procedure WordsTreeCountChanged(Sender: TObject;
     NewCount: LongInt);
   procedure WordsTreeCurrentChanged(Sender: TObject;
     aNewCurrent: LongInt;
     aOldCurrent: LongInt);
   procedure WordsTreeFormatStatusInfo(aSender: TObject;
     var Info: Il3CString;
     const aCurrent: Integer;
     const aCount: Integer;
     const aSelected: Integer);
 protected
 // property methods
   function pm_GetContextMap: TnsLangToContextMap;
 protected
 // realized methods
   procedure CurrentUpdated;
     {* ������� �������� ���������� }
   procedure UpdateLanguage(aLanguage: TbsLanguage);
     {* �������� ���� ������ ���������� }
   procedure Lang_Russian_Test(const aParams: IvcmTestParamsPrim);
   procedure Lang_Russian_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Lang_English_Test(const aParams: IvcmTestParamsPrim);
   procedure Lang_English_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Lang_French_Test(const aParams: IvcmTestParamsPrim);
   procedure Lang_French_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Lang_Deutch_Test(const aParams: IvcmTestParamsPrim);
   procedure Lang_Deutch_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Lang_Italian_Test(const aParams: IvcmTestParamsPrim);
   procedure Lang_Italian_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Lang_Spanish_Test(const aParams: IvcmTestParamsPrim);
   procedure Lang_Spanish_Execute(const aParams: IvcmExecuteParamsPrim);
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
   procedure FormInsertedIntoContainer; override;
    {$IfEnd} //not NoVCM
 public
 // overridden public methods
   {$If not defined(NoVCM)}
   function NeedDrawCaption: Boolean; override;
     {* ����� �� �������� ��������� ���� }
   {$IfEnd} //not NoVCM
 protected
 // protected fields
   CommonDiction : IdsCommonDiction;
   Diction : IdsDiction;
 protected
 // protected methods
   procedure ChangeLang(aLang: TbsLanguage);
     {* �������� ���� ������ ���������� }
   procedure CheckLang(aLang: TbsLanguage;
     const aParams: IvcmTestParamsPrim);
     {* �������� ������� ���������� ����� }
   procedure ChangeDiction(aItem: Integer;
     aUpdateWithDelay: Boolean = True);
     {* �������� ������� ���������� }
 private
 // private properties
   property ContextMap: TnsLangToContextMap
     read pm_GetContextMap;
 public
 // public properties
   property BackgroundPanel: TvtPanel
     read f_BackgroundPanel;
   property ContextFilter: TnscContextFilter
     read f_ContextFilter;
   property WordsTree: TnscTreeView
     read f_WordsTree;
 end;//TPrimDictionForm
{$IfEnd} //not Admin AND not Monitorings

implementation

{$If not defined(Admin) AND not defined(Monitorings)}
uses
  BaseTypesUnit,
  l3String,
  DictionRes,
  nsDictCache,
  nsUtils,
  nsDictionTree,
  DataAdapter
  {$If not defined(NoVCM)}
  ,
  vcmBase
  {$IfEnd} //not NoVCM
  ,
  Forms,
  Controls,
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

{$Include w:\garant6x\implementation\Garant\GbaNemesis\View\Common\Forms\BaseDocument.imp.pas}

var
   { ������������ ������ utDictionLocalConstants }
  str_utDictionCaption : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'utDictionCaption'; rValue : '�������� �������');
   { ��������� ����������������� ���� "�������� �������" }
  str_utDictionSettingsCaption : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'utDictionSettingsCaption'; rValue : '�������� �������: ������ �������� (�������)');
   { ��������� ����������������� ���� "�������� �������" ��� ��������� ������� ������������ }

type
  Tkw_PrimDiction_Control_BackgroundPanel = class(TtfwControlString)
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
  end;//Tkw_PrimDiction_Control_BackgroundPanel

// start class Tkw_PrimDiction_Control_BackgroundPanel

{$If not defined(NoScripts)}
function Tkw_PrimDiction_Control_BackgroundPanel.GetString: AnsiString;
 {-}
begin
 Result := 'BackgroundPanel';
end;//Tkw_PrimDiction_Control_BackgroundPanel.GetString
{$IfEnd} //not NoScripts

type
  Tkw_PrimDiction_Control_BackgroundPanel_Push = class(TkwBynameControlPush)
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
  end;//Tkw_PrimDiction_Control_BackgroundPanel_Push

// start class Tkw_PrimDiction_Control_BackgroundPanel_Push

{$If not defined(NoScripts)}
procedure Tkw_PrimDiction_Control_BackgroundPanel_Push.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString('BackgroundPanel');
 inherited;
end;//Tkw_PrimDiction_Control_BackgroundPanel_Push.DoDoIt
{$IfEnd} //not NoScripts

type
  Tkw_PrimDiction_Control_ContextFilter = class(TtfwControlString)
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
  end;//Tkw_PrimDiction_Control_ContextFilter

// start class Tkw_PrimDiction_Control_ContextFilter

{$If not defined(NoScripts)}
function Tkw_PrimDiction_Control_ContextFilter.GetString: AnsiString;
 {-}
begin
 Result := 'ContextFilter';
end;//Tkw_PrimDiction_Control_ContextFilter.GetString
{$IfEnd} //not NoScripts

type
  Tkw_PrimDiction_Control_ContextFilter_Push = class(TkwBynameControlPush)
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
  end;//Tkw_PrimDiction_Control_ContextFilter_Push

// start class Tkw_PrimDiction_Control_ContextFilter_Push

{$If not defined(NoScripts)}
procedure Tkw_PrimDiction_Control_ContextFilter_Push.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString('ContextFilter');
 inherited;
end;//Tkw_PrimDiction_Control_ContextFilter_Push.DoDoIt
{$IfEnd} //not NoScripts

type
  Tkw_PrimDiction_Control_WordsTree = class(TtfwControlString)
   {* ����� ������� ��� �������������� �������� WordsTree
----
*������ �������������*:
[code]
�������::WordsTree TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimDiction_Control_WordsTree

// start class Tkw_PrimDiction_Control_WordsTree

{$If not defined(NoScripts)}
function Tkw_PrimDiction_Control_WordsTree.GetString: AnsiString;
 {-}
begin
 Result := 'WordsTree';
end;//Tkw_PrimDiction_Control_WordsTree.GetString
{$IfEnd} //not NoScripts

type
  Tkw_PrimDiction_Control_WordsTree_Push = class(TkwBynameControlPush)
   {* ����� ������� ��� �������� WordsTree
----
*������ �������������*:
[code]
�������::WordsTree:push pop:control:SetFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_PrimDiction_Control_WordsTree_Push

// start class Tkw_PrimDiction_Control_WordsTree_Push

{$If not defined(NoScripts)}
procedure Tkw_PrimDiction_Control_WordsTree_Push.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString('WordsTree');
 inherited;
end;//Tkw_PrimDiction_Control_WordsTree_Push.DoDoIt
{$IfEnd} //not NoScripts

procedure TPrimDictionForm.ContextFilterChange(Sender: TObject);
//#UC START# *51B72C1D0310_4979D40E0180_var*
var
 l_Tree: Il3FilterableTree;
 l_Filtered: Il3SimpleTree;
 l_Node: Il3SimpleNode;
 l_NewNodeIndex: Integer;
//#UC END# *51B72C1D0310_4979D40E0180_var*
begin
//#UC START# *51B72C1D0310_4979D40E0180_impl*
 if Assigned(Diction) and
    Supports(WordsTree.TreeStruct, Il3FilterableTree, l_Tree) then
 begin
  // �������� ��������� ����������� ���������� ��� ������� �����
  ContextMap[Diction.Language] := ContextFilter.MakeState;
  l_Filtered := l_Tree.MakeFiltered(l_Tree.
                                     CloneFilters.
                                     SetContext(ContextFilter.ActiveContext),
                                    l_Node,
                                    l_NewNodeIndex,
                                    True,
                                    ContextFilter.NeedRefilterTree);

  if Assigned(l_Filtered) and (l_Filtered.CountView > 0) then
   with WordsTree do
   begin
    Changing;
    try
     TreeStruct := l_Filtered;
     vlbMakeItemVisible(Current);
    finally
     Changed;
    end;{try..finally}
   end;//with WordsTree do
 end;//if Supports(WordsTree.TreeStruct,
//#UC END# *51B72C1D0310_4979D40E0180_impl*
end;//TPrimDictionForm.ContextFilterChange

procedure TPrimDictionForm.ContextFilterWrongContext(Sender: TObject);
//#UC START# *51B72C29024A_4979D40E0180_var*
//#UC END# *51B72C29024A_4979D40E0180_var*
begin
//#UC START# *51B72C29024A_4979D40E0180_impl*
 nsBeepWrongContext;
//#UC END# *51B72C29024A_4979D40E0180_impl*
end;//TPrimDictionForm.ContextFilterWrongContext

function TPrimDictionForm.WordsTreeGetItemImage(Sender: TObject;
  Index: Integer;
  var aImages: TCustomImageList): Integer;
//#UC START# *51B72D1B027D_4979D40E0180_var*
//#UC END# *51B72D1B027D_4979D40E0180_var*
begin
//#UC START# *51B72D1B027D_4979D40E0180_impl*
 Result := cDictItemIcon;
//#UC END# *51B72D1B027D_4979D40E0180_impl*
end;//TPrimDictionForm.WordsTreeGetItemImage

procedure TPrimDictionForm.WordsTreeNewCharPressed(aChar: AnsiChar);
//#UC START# *51B72D240241_4979D40E0180_var*
//#UC END# *51B72D240241_4979D40E0180_var*
begin
//#UC START# *51B72D240241_4979D40E0180_impl*
 ContextFilter.PressChar(aChar);
//#UC END# *51B72D240241_4979D40E0180_impl*
end;//TPrimDictionForm.WordsTreeNewCharPressed

procedure TPrimDictionForm.WordsTreeActionElement(Sender: TObject;
  Index: LongInt);
//#UC START# *51B72D300088_4979D40E0180_var*
//#UC END# *51B72D300088_4979D40E0180_var*
begin
//#UC START# *51B72D300088_4979D40E0180_impl*
 ChangeDiction(Index, False);
//#UC END# *51B72D300088_4979D40E0180_impl*
end;//TPrimDictionForm.WordsTreeActionElement

procedure TPrimDictionForm.WordsTreeMakeTreeSource(out theTree: Il3SimpleTree);
//#UC START# *51B72D3B02F2_4979D40E0180_var*
//#UC END# *51B72D3B02F2_4979D40E0180_var*
begin
//#UC START# *51B72D3B02F2_4979D40E0180_impl*
 theTree := nil;
 if Assigned(Diction) and TnsDictCache.Instance.ContainsLang(Diction.Language) then
  with DefDataAdapter do
   theTree := TnsDictionTree.Make(Diction.Language, ContextMap[Diction.Language].ActiveContext);
//#UC END# *51B72D3B02F2_4979D40E0180_impl*
end;//TPrimDictionForm.WordsTreeMakeTreeSource

procedure TPrimDictionForm.WordsTreeSelectCountChanged(aSender: TObject;
  anOldCount: Integer;
  aNewCount: Integer);
//#UC START# *51B72D4603E7_4979D40E0180_var*
//#UC END# *51B72D4603E7_4979D40E0180_var*
begin
//#UC START# *51B72D4603E7_4979D40E0180_impl*
 UpdateStatusInfo;
//#UC END# *51B72D4603E7_4979D40E0180_impl*
end;//TPrimDictionForm.WordsTreeSelectCountChanged

procedure TPrimDictionForm.WordsTreeCountChanged(Sender: TObject;
  NewCount: LongInt);
//#UC START# *51B72D520161_4979D40E0180_var*
//#UC END# *51B72D520161_4979D40E0180_var*
begin
//#UC START# *51B72D520161_4979D40E0180_impl*
 UpdateStatusInfo;
//#UC END# *51B72D520161_4979D40E0180_impl*
end;//TPrimDictionForm.WordsTreeCountChanged

procedure TPrimDictionForm.WordsTreeCurrentChanged(Sender: TObject;
  aNewCurrent: LongInt;
  aOldCurrent: LongInt);
//#UC START# *51B72D5E02DC_4979D40E0180_var*
//#UC END# *51B72D5E02DC_4979D40E0180_var*
begin
//#UC START# *51B72D5E02DC_4979D40E0180_impl*
 UpdateStatusInfo;
 // ���� ���������� ������������ ����� ���������� ��������� ������� ������, �.�.
 // � �������� ������������ ���������� ����� �������� � ����� ������ ����������
 // � ���� ���������� �� ����� �������, �� � ����� ������ ���������� �� �����
 // ��������� �������:
 if f_InternalChange = 0 then
  ChangeDiction(aNewCurrent);
//#UC END# *51B72D5E02DC_4979D40E0180_impl*
end;//TPrimDictionForm.WordsTreeCurrentChanged

procedure TPrimDictionForm.WordsTreeFormatStatusInfo(aSender: TObject;
  var Info: Il3CString;
  const aCurrent: Integer;
  const aCount: Integer;
  const aSelected: Integer);
//#UC START# *51B72D6C0297_4979D40E0180_var*
//#UC END# *51B72D6C0297_4979D40E0180_var*
begin
//#UC START# *51B72D6C0297_4979D40E0180_impl*
 Info := vcmFmt(str_DictionStatusInfoFormat,[aCurrent, aCount]);
//#UC END# *51B72D6C0297_4979D40E0180_impl*
end;//TPrimDictionForm.WordsTreeFormatStatusInfo

procedure TPrimDictionForm.ChangeLang(aLang: TbsLanguage);
//#UC START# *4C85134102E7_4979D40E0180_var*
var
 l_Index: Integer;
//#UC END# *4C85134102E7_4979D40E0180_var*
begin
//#UC START# *4C85134102E7_4979D40E0180_impl*
 if (Assigned(Diction) and (Diction.Language <> aLang)) then
 begin
  inc(f_InternalChange);
  try
   with WordsTree do
    if Assigned(Diction) and (Current >= 0) then
      Diction.CurrentChanged(GetNode(Current));
   ContextMap[Diction.Language] := ContextFilter.MakeState;
   if Assigned(Diction) then
    Diction.Language := aLang;
   // ������� ����� ������
   with WordsTree do
   begin
    ContextFilter.BeginAssignState;
    try
     Changing;
     try
      ContextFilter.AssignState(ContextMap[aLang]);
      if ContextFilter.Active then
       TreeStruct := TnsDictionTree.Make(aLang, ContextMap[aLang].ActiveContext, True)
      else
       TreeStruct := TnsDictionTree.Make(aLang);
     finally
      Changed;
     end;{try..finally}
    finally
     ContextFilter.EndAssignState
    end;
    // ��� ����� ������� ���������� ����� �� ���� ��� � ���� ������� ����� ����
    // ��������� ������� ���������� ���������� (������������� � ������ �������,
    // ���������� ���, ������������� �������, ������� ����������
    // �����������������)
    if Assigned(Diction) and l3IsNil(ContextFilter.ActiveContext) then
    begin
     l_Index := Diction.MakeCurrentIndex(TreeStruct);
     if l_Index < 0 then
      SetNoCurrent
     else
     begin
       Current := l_Index;
       vlbMakeItemVisible(l_Index);
     end;//if l_Index < 0 then
    end;//if Assigned(Diction) then
   end;//with WordsTree do
  finally
   Dec(f_InternalChange);
  end;{try..finally}
 end;//if (Assigned(Diction) and (Diction.Language <> aLang))
//#UC END# *4C85134102E7_4979D40E0180_impl*
end;//TPrimDictionForm.ChangeLang

procedure TPrimDictionForm.CheckLang(aLang: TbsLanguage;
  const aParams: IvcmTestParamsPrim);
//#UC START# *4C8513680142_4979D40E0180_var*
//#UC END# *4C8513680142_4979D40E0180_var*
begin
//#UC START# *4C8513680142_4979D40E0180_impl*
 if Assigned(Diction) then
 begin
  aParams.Op.Flag[vcm_ofVisible] := TnsDictCache.Instance.ContainsLang(aLang);
  aParams.Op.Flag[vcm_ofEnabled] := aParams.Op.Flag[vcm_ofVisible];
  aParams.Op.Flag[vcm_ofChecked] := Diction.Language = aLang
 end
 else
  aParams.Op.Flag[vcm_ofEnabled] := False;
//#UC END# *4C8513680142_4979D40E0180_impl*
end;//TPrimDictionForm.CheckLang

procedure TPrimDictionForm.ChangeDiction(aItem: Integer;
  aUpdateWithDelay: Boolean = True);
//#UC START# *50056A9D02BE_4979D40E0180_var*
var
 l_l3Node : Il3SimpleNode;
//#UC END# *50056A9D02BE_4979D40E0180_var*
begin
//#UC START# *50056A9D02BE_4979D40E0180_impl*
 if aItem <> -1 then
 begin
  l_l3Node := WordsTree.GetNode(aItem);
  try
   if (CommonDiction <> nil) then
    CommonDiction.CurrentChanged(l_l3Node, aUpdateWithDelay);
  finally
   l_l3Node := nil;
  end;//try..finally
 end;//if Index <> -1 then
//#UC END# *50056A9D02BE_4979D40E0180_impl*
end;//TPrimDictionForm.ChangeDiction

function TPrimDictionForm.pm_GetContextMap: TnsLangToContextMap;
//#UC START# *51B7302E015F_4979D40E0180get_var*
//#UC END# *51B7302E015F_4979D40E0180get_var*
begin
//#UC START# *51B7302E015F_4979D40E0180get_impl*
 if not Assigned(f_ContextMap) then
  f_ContextMap := TnsLangToContextMap.Create(WordsTree);
 Result := f_ContextMap;
//#UC END# *51B7302E015F_4979D40E0180get_impl*
end;//TPrimDictionForm.pm_GetContextMap

procedure TPrimDictionForm.CurrentUpdated;
//#UC START# *493402BC0160_4979D40E0180_var*
//#UC END# *493402BC0160_4979D40E0180_var*
begin
//#UC START# *493402BC0160_4979D40E0180_impl*
 WordsTree.Current := Diction.MakeCurrentIndex(WordsTree.TreeStruct);
//#UC END# *493402BC0160_4979D40E0180_impl*
end;//TPrimDictionForm.CurrentUpdated

procedure TPrimDictionForm.UpdateLanguage(aLanguage: TbsLanguage);
//#UC START# *4934035F013E_4979D40E0180_var*
//#UC END# *4934035F013E_4979D40E0180_var*
begin
//#UC START# *4934035F013E_4979D40E0180_impl*
 ChangeLang(aLanguage);
//#UC END# *4934035F013E_4979D40E0180_impl*
end;//TPrimDictionForm.UpdateLanguage

procedure TPrimDictionForm.Lang_Russian_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C850FD40034_4979D40E0180test_var*
//#UC END# *4C850FD40034_4979D40E0180test_var*
begin
//#UC START# *4C850FD40034_4979D40E0180test_impl*
 CheckLang(LG_RUSSIAN, aParams);
//#UC END# *4C850FD40034_4979D40E0180test_impl*
end;//TPrimDictionForm.Lang_Russian_Test

procedure TPrimDictionForm.Lang_Russian_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C850FD40034_4979D40E0180exec_var*
//#UC END# *4C850FD40034_4979D40E0180exec_var*
begin
//#UC START# *4C850FD40034_4979D40E0180exec_impl*
 ChangeLang(LG_RUSSIAN);
//#UC END# *4C850FD40034_4979D40E0180exec_impl*
end;//TPrimDictionForm.Lang_Russian_Execute

procedure TPrimDictionForm.Lang_English_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C850FFB01EF_4979D40E0180test_var*
//#UC END# *4C850FFB01EF_4979D40E0180test_var*
begin
//#UC START# *4C850FFB01EF_4979D40E0180test_impl*
 CheckLang(LG_ENGLISH, aParams);
//#UC END# *4C850FFB01EF_4979D40E0180test_impl*
end;//TPrimDictionForm.Lang_English_Test

procedure TPrimDictionForm.Lang_English_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C850FFB01EF_4979D40E0180exec_var*
//#UC END# *4C850FFB01EF_4979D40E0180exec_var*
begin
//#UC START# *4C850FFB01EF_4979D40E0180exec_impl*
 ChangeLang(LG_ENGLISH);
//#UC END# *4C850FFB01EF_4979D40E0180exec_impl*
end;//TPrimDictionForm.Lang_English_Execute

procedure TPrimDictionForm.Lang_French_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C85100D0398_4979D40E0180test_var*
//#UC END# *4C85100D0398_4979D40E0180test_var*
begin
//#UC START# *4C85100D0398_4979D40E0180test_impl*
 CheckLang(LG_FRENCH, aParams);
//#UC END# *4C85100D0398_4979D40E0180test_impl*
end;//TPrimDictionForm.Lang_French_Test

procedure TPrimDictionForm.Lang_French_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C85100D0398_4979D40E0180exec_var*
//#UC END# *4C85100D0398_4979D40E0180exec_var*
begin
//#UC START# *4C85100D0398_4979D40E0180exec_impl*
 ChangeLang(LG_FRENCH);
//#UC END# *4C85100D0398_4979D40E0180exec_impl*
end;//TPrimDictionForm.Lang_French_Execute

procedure TPrimDictionForm.Lang_Deutch_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C85101F0258_4979D40E0180test_var*
//#UC END# *4C85101F0258_4979D40E0180test_var*
begin
//#UC START# *4C85101F0258_4979D40E0180test_impl*
 CheckLang(LG_GERMAN, aParams);
//#UC END# *4C85101F0258_4979D40E0180test_impl*
end;//TPrimDictionForm.Lang_Deutch_Test

procedure TPrimDictionForm.Lang_Deutch_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C85101F0258_4979D40E0180exec_var*
//#UC END# *4C85101F0258_4979D40E0180exec_var*
begin
//#UC START# *4C85101F0258_4979D40E0180exec_impl*
 ChangeLang(LG_GERMAN);
//#UC END# *4C85101F0258_4979D40E0180exec_impl*
end;//TPrimDictionForm.Lang_Deutch_Execute

procedure TPrimDictionForm.Lang_Italian_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C851041010D_4979D40E0180test_var*
//#UC END# *4C851041010D_4979D40E0180test_var*
begin
//#UC START# *4C851041010D_4979D40E0180test_impl*
 CheckLang(LG_ITALIAN, aParams);
//#UC END# *4C851041010D_4979D40E0180test_impl*
end;//TPrimDictionForm.Lang_Italian_Test

procedure TPrimDictionForm.Lang_Italian_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C851041010D_4979D40E0180exec_var*
//#UC END# *4C851041010D_4979D40E0180exec_var*
begin
//#UC START# *4C851041010D_4979D40E0180exec_impl*
 ChangeLang(LG_ITALIAN);
//#UC END# *4C851041010D_4979D40E0180exec_impl*
end;//TPrimDictionForm.Lang_Italian_Execute

procedure TPrimDictionForm.Lang_Spanish_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C8510570231_4979D40E0180test_var*
//#UC END# *4C8510570231_4979D40E0180test_var*
begin
//#UC START# *4C8510570231_4979D40E0180test_impl*
 CheckLang(LG_SPANISH, aParams);
//#UC END# *4C8510570231_4979D40E0180test_impl*
end;//TPrimDictionForm.Lang_Spanish_Test

procedure TPrimDictionForm.Lang_Spanish_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C8510570231_4979D40E0180exec_var*
//#UC END# *4C8510570231_4979D40E0180exec_var*
begin
//#UC START# *4C8510570231_4979D40E0180exec_impl*
 ChangeLang(LG_SPANISH);
//#UC END# *4C8510570231_4979D40E0180exec_impl*
end;//TPrimDictionForm.Lang_Spanish_Execute

procedure TPrimDictionForm.Cleanup;
//#UC START# *479731C50290_4979D40E0180_var*
//#UC END# *479731C50290_4979D40E0180_var*
begin
//#UC START# *479731C50290_4979D40E0180_impl*
 f_InternalChange := 0;
 vcmFree(f_ContextMap);
 if (DataSource <> nil) then
  DataSource.Unsubscribe(IbsDictionListener(Self));
 inherited;
//#UC END# *479731C50290_4979D40E0180_impl*
end;//TPrimDictionForm.Cleanup

{$If not defined(NoVCM)}
procedure TPrimDictionForm.NotifyDataSourceChanged(const anOld: IvcmViewAreaController;
  const aNew: IvcmViewAreaController);
//#UC START# *497469C90140_4979D40E0180_var*
 function lp_IsInit: Boolean;
 begin
  Result := (sdsBaseDocument <> nil) and not sdsBaseDocument.HasDocument;
 end;//lp_IsInit

var
 l_Index    : Integer;
//#UC END# *497469C90140_4979D40E0180_var*
begin
//#UC START# *497469C90140_4979D40E0180_impl*
 inherited;
 if (anOld <> nil) then
  anOld.Unsubscribe(IbsDictionListener(Self));
 if (aNew <> nil) then
  aNew.Subscribe(IbsDictionListener(Self));
 // ��������, ��� � ������� ����� �������� �� ����� ���� ��� ���, � ���������
 // ��������� ���� ��� ��������� ������� �� ����
 if (Diction <> nil) and
  TnsDictCache.Instance.ContainsLang(Diction.Language) then
 begin
  // ������� ������ ����������, � ������ ���� ��������� ����. ���� �� ��������,
  // ����� ���������� ������� �� ������ � ����������
  ChangeLang(Diction.Language);
  // ����� ����� � �������� �������
  if not Dispatcher.History.InBF then
  begin
   // ������� TreeStruct. K-147489521
   // �� �������� COntextMap ����� ���� �� ������� �� ds � ������� ��� MakeSimpleTree
   // � �������� ����������� �� ������������ TreeStruct ������
   WordsTree.TreeStruct;

   if not l3IsNil(Diction.Context) then
   begin
    ContextFilter.Context := Diction.Context;
    ContextFilter.ForceActive;
   end//if not l3IsNil(Diction.Context) then
   // ������� �� ������ � �����������
   else
   begin
    // ��������� �������� ����� �����������������
    ContextFilter.Active := False;
    // ��� �������� ������� ���������� ������� ���������� � ������ (������):
    if lp_IsInit then
    begin
     // ���� ������ �� ������, �� ������� ������ ����������:
     ChangeDiction(WordsTree.Current);
    end//if lp_IsInit then
    // ����������������
    else
    begin
     l_Index := Diction.MakeCurrentIndex(WordsTree.TreeStruct);
     if l_Index > -1 then
      WordsTree.Current := Pred(l_Index)
     else
      WordsTree.SetNoCurrent;
    end;//if lp_IsInit then
   end;//if not l3IsNil(Diction.Context) then
  end;//if not aFromHistory then
 end;//Diction <> nil
//#UC END# *497469C90140_4979D40E0180_impl*
end;//TPrimDictionForm.NotifyDataSourceChanged
{$IfEnd} //not NoVCM

{$If not defined(NoVCM)}
procedure TPrimDictionForm.DoInit(aFromHistory: Boolean);
//#UC START# *49803F5503AA_4979D40E0180_var*
//#UC END# *49803F5503AA_4979D40E0180_var*
begin
//#UC START# *49803F5503AA_4979D40E0180_impl*
 inherited;

 // ��������� ������������ ������ � ��, ����� �� ��������� ������ ����������
 // http://mdp.garant.ru/pages/viewpage.action?pageId=382410422
 // http://mdp.garant.ru/pages/viewpage.action?pageId=290947184
 // http://mdp.garant.ru/pages/viewpage.action?pageId=290947672
 //if Parent is TvtSizeablePanel then
  //TvtSizeablePanel(Parent).DisableAcceptInDockOver := true;

 WordsTree.Images := nsDictRes.DictImages;
 ContextFilter.Images := dmStdRes.SmallImageList;
 UpdateStatusInfo;
//#UC END# *49803F5503AA_4979D40E0180_impl*
end;//TPrimDictionForm.DoInit
{$IfEnd} //not NoVCM

{$If not defined(NoVCM)}
function TPrimDictionForm.NeedDrawCaption: Boolean;
//#UC START# *4A84183701B9_4979D40E0180_var*
//#UC END# *4A84183701B9_4979D40E0180_var*
begin
//#UC START# *4A84183701B9_4979D40E0180_impl*
 Result := false;
//#UC END# *4A84183701B9_4979D40E0180_impl*
end;//TPrimDictionForm.NeedDrawCaption
{$IfEnd} //not NoVCM

{$If not defined(NoVCM)}
procedure TPrimDictionForm.InitControls;
//#UC START# *4A8E8F2E0195_4979D40E0180_var*
//#UC END# *4A8E8F2E0195_4979D40E0180_var*
begin
//#UC START# *4A8E8F2E0195_4979D40E0180_impl*
 inherited;
 ActiveControl := WordsTree;
 Style.Toolbars.Bottom.MergeWithContainer := vcm_bFalse;
 Style.Toolbars.Bottom.ImageSize := isSmall;

 Width := 273;
 Height := 451;

 with BackgroundPanel do
 begin
  Align := alClient;
  BevelOuter := bvNone;
 end;

 with ContextFilter do
 begin
  ImageIndex := 77;
  LabelVisible := False;
  ContextFilterTarget := WordsTree;
  OnChange := ContextFilterChange;
  OnWrongContext := ContextFilterWrongContext;
 end;

 with WordsTree do
 begin
  OnCountChanged := WordsTreeCountChanged;
  Align := alClient;
  BorderStyle := bsNone;
  TabOrder := 1;
  ActionElementMode := l3_amSingleClick;
  NeedStatus := True;
  OnMakeTreeSource := WordsTreeMakeTreeSource;
  OnGetItemImage := WordsTreeGetItemImage;
  OnActionElement := WordsTreeActionElement;
  OnCurrentChanged := WordsTreeCurrentChanged;
  OnSelectCountChanged := WordsTreeSelectCountChanged;
  OnFormatStatusInfo := WordsTreeFormatStatusInfo;
  OnNewCharPressed := WordsTreeNewCharPressed;
  SettingId := 'stidDictionTree';
 end;
//#UC END# *4A8E8F2E0195_4979D40E0180_impl*
end;//TPrimDictionForm.InitControls
{$IfEnd} //not NoVCM

{$If not defined(NoVCM)}
procedure TPrimDictionForm.FormInsertedIntoContainer;
//#UC START# *4F7C65380244_4979D40E0180_var*
//#UC END# *4F7C65380244_4979D40E0180_var*
begin
//#UC START# *4F7C65380244_4979D40E0180_impl*
 inherited;
 WordsTree.Width := MaxInt; // ��� ����� �� ���������� ������ � ������ ������-��
//#UC END# *4F7C65380244_4979D40E0180_impl*
end;//TPrimDictionForm.FormInsertedIntoContainer
{$IfEnd} //not NoVCM

procedure TPrimDictionForm.SignalDataSourceChanged(const anOld : IvcmViewAreaController;
 const aDsNew : IvcmViewAreaController);
begin
 inherited;
 if (aDsNew = nil) then
 begin
  CommonDiction := nil;
  Diction := nil;
 end//aDsNew = nil
 else
 begin
  Supports(aDsNew, IdsCommonDiction, CommonDiction);
  Supports(aDsNew, IdsDiction, Diction);
 end;//aDsNew = nil
end;

procedure TPrimDictionForm.InitEntities;
begin
 inherited;
 with Entities.Entities do
 begin
  PublishFormEntity(en_Lang, nil);
  ToolbarAtBottom(en_Lang);
  PublishOp(en_Lang, op_Russian, Lang_Russian_Execute, Lang_Russian_Test, nil);
  ShowInContextMenu(en_Lang, op_Russian, false);
  ShowInToolbar(en_Lang, op_Russian, true);
  PublishOp(en_Lang, op_English, Lang_English_Execute, Lang_English_Test, nil);
  ShowInContextMenu(en_Lang, op_English, false);
  ShowInToolbar(en_Lang, op_English, true);
  PublishOp(en_Lang, op_French, Lang_French_Execute, Lang_French_Test, nil);
  ShowInContextMenu(en_Lang, op_French, false);
  ShowInToolbar(en_Lang, op_French, true);
  PublishOp(en_Lang, op_Deutch, Lang_Deutch_Execute, Lang_Deutch_Test, nil);
  ShowInContextMenu(en_Lang, op_Deutch, false);
  ShowInToolbar(en_Lang, op_Deutch, true);
  PublishOp(en_Lang, op_Italian, Lang_Italian_Execute, Lang_Italian_Test, nil);
  ShowInContextMenu(en_Lang, op_Italian, false);
  ShowInToolbar(en_Lang, op_Italian, true);
  PublishOp(en_Lang, op_Spanish, Lang_Spanish_Execute, Lang_Spanish_Test, nil);
  ShowInContextMenu(en_Lang, op_Spanish, false);
  ShowInToolbar(en_Lang, op_Spanish, true);
 end;//with Entities.Entities
end;

procedure TPrimDictionForm.MakeControls;
begin
 inherited;
 with AddUsertype(utDictionName,
  str_utDictionCaption,
  str_utDictionSettingsCaption,
  true,
  60,
  -1,
  '',
  nil,
  nil,
  nil,
  vcm_ccDisable) do
 begin
 end;//with AddUsertype(utDictionName
 f_BackgroundPanel := TvtPanel.Create(Self);
 f_BackgroundPanel.Name := 'BackgroundPanel';
 f_BackgroundPanel.Parent := Self;
 f_ContextFilter := TnscContextFilter.Create(Self);
 f_ContextFilter.Name := 'ContextFilter';
 f_ContextFilter.Parent := BackgroundPanel;
 f_WordsTree := TnscTreeView.Create(Self);
 f_WordsTree.Name := 'WordsTree';
 f_WordsTree.Parent := BackgroundPanel;
end;

{$IfEnd} //not Admin AND not Monitorings

initialization
{$If not defined(Admin) AND not defined(Monitorings)}
// ������������� str_utDictionCaption
 str_utDictionCaption.Init;
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ������������� str_utDictionSettingsCaption
 str_utDictionSettingsCaption.Init;
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimDiction_Control_BackgroundPanel
 Tkw_PrimDiction_Control_BackgroundPanel.Register('�������::BackgroundPanel', TvtPanel);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimDiction_Control_BackgroundPanel_Push
 Tkw_PrimDiction_Control_BackgroundPanel_Push.Register('�������::BackgroundPanel:push');
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimDiction_Control_ContextFilter
 Tkw_PrimDiction_Control_ContextFilter.Register('�������::ContextFilter', TnscContextFilter);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimDiction_Control_ContextFilter_Push
 Tkw_PrimDiction_Control_ContextFilter_Push.Register('�������::ContextFilter:push');
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimDiction_Control_WordsTree
 Tkw_PrimDiction_Control_WordsTree.Register('�������::WordsTree', TnscTreeView);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_PrimDiction_Control_WordsTree_Push
 Tkw_PrimDiction_Control_WordsTree_Push.Register('�������::WordsTree:push');
{$IfEnd} //not Admin AND not Monitorings

end.