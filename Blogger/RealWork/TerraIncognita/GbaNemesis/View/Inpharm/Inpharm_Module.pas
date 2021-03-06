unit Inpharm_Module;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "View"
// �����: ����� �.�.
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/View/Inpharm/Inpharm_Module.pas"
// �����: 04.09.2009 12:57
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<VCMFormsPack::Class>> F1 ���������� ��������::Inpharm::View::Inpharm::Inpharm
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
  DocumentUnit
  {$If not defined(NoVCM)}
  ,
  vcmInterfaces
  {$IfEnd} //not NoVCM
  
  {$If not defined(NoVCM)}
  ,
  vcmFormSetFactory
  {$IfEnd} //not NoVCM
  ,
  DocumentAndListInterfaces,
  MedicInterfaces,
  CommonDictionInterfaces,
  InpharmMainMenu_Form,
  PrimMedicListSynchroView_Form
  {$If not defined(NoVCM)}
  ,
  vcmUserControls
  {$IfEnd} //not NoVCM
  ,
  DocumentUserTypes_dftMedDictEntry_UserType,
  DocumentUserTypes_dftDrug_UserType,
  DocumentUserTypes_dftMedicFirm_UserType,
  DocumentUserTypes_dftMedicFirmSynchroView_UserType,
  DocumentUserTypes_dftDrugSynchroView_UserType,
  nsLogEvent,
  PrimPrimListInterfaces,
  DocumentInterfaces,
  l3StringIDEx,
  ListUserTypes_lftDrugList_UserType,
  ListUserTypes_lftDrugInternationalNameSynonyms_UserType,
  ListUserTypes_lftProducedDrugs_UserType,
  ListUserTypes_lftProducedDrugsSynchroForm_UserType,
  ListUserTypes_lftDrugInternationalNameSynonymsSynchroForm_UserType,
  ListInfoUserTypes_liListInfo_UserType,
  AttributesUserTypes_fDocAttribute_UserType,
  AttributesUserTypes_fAttributeSynchroView_UserType,
  PrimMedicListSynchroView_mlsfDrugList_UserType,
  PrimMedicListSynchroView_mlsfMedicFirm_UserType,
  PrimMedicFirmList_mflMain_UserType,
  PrimCommonDiction_utMedicDiction_UserType,
  ContentsUserTypes_utDrugContents_UserType,
  FiltersUserTypes_utFilters_UserType,
  Common_FormDefinitions_Controls,
  PrimMedicFirmListOptions_Form,
  WorkWithDocumentInterfaces,
  BaseDocumentWithAttributesInterfaces,
  DictionContainerUserTypes_slqtMedicDiction_UserType
  {$If not defined(NoScripts)}
  ,
  tfwScriptingInterfaces
  {$IfEnd} //not NoScripts
  ,
  BaloonWarningUserTypes_remListModified_UserType,
  BaloonWarningUserTypes_remListFiltered_UserType,
  BaloonWarningUserTypes_remTimeMachineWarning_UserType,
  F1Like_FormDefinitions_Controls
  {$If not defined(NoVCM)}
  ,
  vcmFormSetFormsCollectionItemPrim
  {$IfEnd} //not NoVCM
  
  {$If not defined(NoScripts)}
  ,
  tfwControlString
  {$IfEnd} //not NoScripts
  ,
  fsMedicDiction,
  fsMedicFirmDocument,
  fsDrugDocument,
  fsDrugList,
  fsMedicFirmList,
  MedicMainMenu_Form,
  MedicFirmList_Form,
  MedicListSynchroView_Form,
  vcmExternalInterfaces {a},
  vcmModule {a},
  vcmBase {a}
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}
type
 TnsOpenPharmFirmDocumentEvent = class(TnsLogEvent)
 public
 // public methods
   class procedure Log(const aDoc: IDocument);
 end;//TnsOpenPharmFirmDocumentEvent

 TnsOpenPharmDocumentEvent = class(TnsLogEvent)
 public
 // public methods
   class procedure Log(const aDoc: IDocument);
 end;//TnsOpenPharmDocumentEvent

 TnsOpenMedicDictionaryEvent = class(TnsLogEvent)
 public
 // public methods
   class procedure Log;
 end;//TnsOpenMedicDictionaryEvent

 TnsOpenMedicFirmsEvent = class(TnsLogEvent)
 public
 // public methods
   class procedure Log;
 end;//TnsOpenMedicFirmsEvent

 TInpharmModule = {formspack} class(TvcmModule)
 protected
  procedure Loaded; override;
  class procedure GetEntityForms(aList : TvcmClassList); override;
 protected
 // protected methods
   class procedure OpenMedicDictionPrim(const aSDS: IsdsCommonDiction;
     const aContainer: IvcmContainer);
   procedure opMedicDictionTest(const aParams: IvcmTestParamsPrim);
     {* ������� ����������� �������� }
   procedure opMedicDiction(const aParams: IvcmExecuteParamsPrim);
     {* ������� ����������� �������� }
   procedure opMedicFirmsTest(const aParams: IvcmTestParamsPrim);
     {* ���������������� ����� }
   procedure opMedicFirms(const aParams: IvcmExecuteParamsPrim);
     {* ���������������� ����� }
   procedure opDrugListTest(const aParams: IvcmTestParamsPrim);
     {* ������ ����������� ���������� }
   procedure opDrugList(const aParams: IvcmExecuteParamsPrim);
     {* ������ ����������� ���������� }
   procedure opMedicMainMenu(const aParams: IvcmExecuteParamsPrim);
     {* �������� ���� ������ }
 public
 // public methods
   class procedure OpenMedicDiction(const aDocInfo: IdeDocInfo;
     const aContainer: IvcmContainer);
   class procedure OpenMedicFirmDocument(const aDocInfo: IdeDocInfo;
     const aContainer: IvcmContainer);
   class procedure OpenDrugDocument(const aDocInfo: IdeDocInfo;
     const aContainer: IvcmContainer);
   class procedure OpenDrugList(const aList: IdeList;
     const aContainer: IvcmContainer);
   class procedure MedicFirms(const aContainer: IvcmContainer);
 end;//TInpharmModule
{$IfEnd} //not Admin AND not Monitorings

implementation

{$If not defined(Admin) AND not defined(Monitorings)}
uses
  sdsMedicDiction,
  sdsMedicFirmDocument,
  sdsDrugDocument,
  l3Base {a},
  l3MessageID,
  SysUtils {a},
  sdsDrugList
  {$If not defined(NoScripts)}
  ,
  tfwScriptEngine
  {$IfEnd} //not NoScripts
  ,
  DataAdapter,
  deListSet,
  DynamicDocListUnit,
  sdsMedicFirmList,
  LoggingUnit,
  InpharmMainMenu_ut_mmmMain_UserType,
  kw_Inpharm_MedicDiction,
  kw_Inpharm_MedicFirms,
  kw_Inpharm_DrugList,
  kw_Inpharm_MedicMainMenu,
  StdRes {a},
  vcmModuleDef {a}
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}

type
  Tkw_Form_MedicMainMenu = class(TtfwControlString)
   {* ����� ������� ��� �������������� ����� MedicMainMenu
----
*������ �������������*:
[code]
'aControl' �����::MedicMainMenu TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_Form_MedicMainMenu

// start class Tkw_Form_MedicMainMenu

{$If not defined(NoScripts)}
function Tkw_Form_MedicMainMenu.GetString: AnsiString;
 {-}
begin
 Result := 'en_MedicMainMenu';
end;//Tkw_Form_MedicMainMenu.GetString
{$IfEnd} //not NoScripts

type
  Tkw_MedicMainMenu_pnlMain_ControlInstance = class(TtfwWord)
   {* ����� ������� ��� ������� � ���������� �������� pnlMain ����� MedicMainMenu }
  protected
  // realized methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_MedicMainMenu_pnlMain_ControlInstance

// start class Tkw_MedicMainMenu_pnlMain_ControlInstance

{$If not defined(NoScripts)}
procedure Tkw_MedicMainMenu_pnlMain_ControlInstance.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushObj((aCtx.rEngine.PopObj As Ten_MedicMainMenu).pnlMain);
end;//Tkw_MedicMainMenu_pnlMain_ControlInstance.DoDoIt
{$IfEnd} //not NoScripts

type
  Tkw_MedicMainMenu_hfLastOpenDocs_ControlInstance = class(TtfwWord)
   {* ����� ������� ��� ������� � ���������� �������� hfLastOpenDocs ����� MedicMainMenu }
  protected
  // realized methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_MedicMainMenu_hfLastOpenDocs_ControlInstance

// start class Tkw_MedicMainMenu_hfLastOpenDocs_ControlInstance

{$If not defined(NoScripts)}
procedure Tkw_MedicMainMenu_hfLastOpenDocs_ControlInstance.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushObj((aCtx.rEngine.PopObj As Ten_MedicMainMenu).hfLastOpenDocs);
end;//Tkw_MedicMainMenu_hfLastOpenDocs_ControlInstance.DoDoIt
{$IfEnd} //not NoScripts

type
  Tkw_MedicMainMenu_tvLastOpenDocs_ControlInstance = class(TtfwWord)
   {* ����� ������� ��� ������� � ���������� �������� tvLastOpenDocs ����� MedicMainMenu }
  protected
  // realized methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_MedicMainMenu_tvLastOpenDocs_ControlInstance

// start class Tkw_MedicMainMenu_tvLastOpenDocs_ControlInstance

{$If not defined(NoScripts)}
procedure Tkw_MedicMainMenu_tvLastOpenDocs_ControlInstance.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushObj((aCtx.rEngine.PopObj As Ten_MedicMainMenu).tvLastOpenDocs);
end;//Tkw_MedicMainMenu_tvLastOpenDocs_ControlInstance.DoDoIt
{$IfEnd} //not NoScripts

type
  Tkw_Form_MedicListSynchroView = class(TtfwControlString)
   {* ����� ������� ��� �������������� ����� MedicListSynchroView
----
*������ �������������*:
[code]
'aControl' �����::MedicListSynchroView TryFocus ASSERT
[code] }
  protected
  // overridden protected methods
    {$If not defined(NoScripts)}
   function GetString: AnsiString; override;
    {$IfEnd} //not NoScripts
  end;//Tkw_Form_MedicListSynchroView

// start class Tkw_Form_MedicListSynchroView

{$If not defined(NoScripts)}
function Tkw_Form_MedicListSynchroView.GetString: AnsiString;
 {-}
begin
 Result := 'en_MedicListSynchroView';
end;//Tkw_Form_MedicListSynchroView.GetString
{$IfEnd} //not NoScripts

type
  Tkw_MedicListSynchroView_ztChild_ControlInstance = class(TtfwWord)
   {* ����� ������� ��� ������� � ���������� �������� ztChild ����� MedicListSynchroView }
  protected
  // realized methods
    {$If not defined(NoScripts)}
   procedure DoDoIt(const aCtx: TtfwContext); override;
    {$IfEnd} //not NoScripts
  end;//Tkw_MedicListSynchroView_ztChild_ControlInstance

// start class Tkw_MedicListSynchroView_ztChild_ControlInstance

{$If not defined(NoScripts)}
procedure Tkw_MedicListSynchroView_ztChild_ControlInstance.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushObj((aCtx.rEngine.PopObj As Ten_MedicListSynchroView).ztChild);
end;//Tkw_MedicListSynchroView_ztChild_ControlInstance.DoDoIt
{$IfEnd} //not NoScripts

class procedure TInpharmModule.OpenMedicDiction(const aDocInfo: IdeDocInfo;
  const aContainer: IvcmContainer);
var
 __WasEnter : Boolean;
//#UC START# *4AA11B7A0009_4AA0D66F0159_var*
//#UC END# *4AA11B7A0009_4AA0D66F0159_var*
begin
 __WasEnter := vcmEnterFactory;
 try
//#UC START# *4AA11B7A0009_4AA0D66F0159_impl*
 OpenMedicDictionPrim(TsdsMedicDiction.Make(aDocInfo), aContainer);
//#UC END# *4AA11B7A0009_4AA0D66F0159_impl*
 finally
  if __WasEnter then
   vcmLeaveFactory;
 end;//try..finally
end;//TInpharmModule.OpenMedicDiction

class procedure TInpharmModule.OpenMedicFirmDocument(const aDocInfo: IdeDocInfo;
  const aContainer: IvcmContainer);
var
 __WasEnter : Boolean;
//#UC START# *4AA11BE70139_4AA0D66F0159_var*
//#UC END# *4AA11BE70139_4AA0D66F0159_var*
begin
 __WasEnter := vcmEnterFactory;
 try
//#UC START# *4AA11BE70139_4AA0D66F0159_impl*
 TnsOpenPharmFirmDocumentEvent.Log(aDocInfo.Doc);
 Tfs_MedicFirmDocument.Make(TsdsMedicFirmDocument.Make(aDocInfo),
                            aContainer);
//#UC END# *4AA11BE70139_4AA0D66F0159_impl*
 finally
  if __WasEnter then
   vcmLeaveFactory;
 end;//try..finally
end;//TInpharmModule.OpenMedicFirmDocument

class procedure TInpharmModule.OpenDrugDocument(const aDocInfo: IdeDocInfo;
  const aContainer: IvcmContainer);
var
 __WasEnter : Boolean;
//#UC START# *4AA11CE70112_4AA0D66F0159_var*
//#UC END# *4AA11CE70112_4AA0D66F0159_var*
begin
 __WasEnter := vcmEnterFactory;
 try
//#UC START# *4AA11CE70112_4AA0D66F0159_impl*
 TnsOpenPharmDocumentEvent.Log(aDocInfo.Doc);
 Tfs_DrugDocument.Make(TsdsDrugDocument.Make(aDocInfo), aContainer);
//#UC END# *4AA11CE70112_4AA0D66F0159_impl*
 finally
  if __WasEnter then
   vcmLeaveFactory;
 end;//try..finally
end;//TInpharmModule.OpenDrugDocument

class procedure TInpharmModule.OpenDrugList(const aList: IdeList;
  const aContainer: IvcmContainer);
var
 __WasEnter : Boolean;
//#UC START# *4AA4D413008C_4AA0D66F0159_var*
//#UC END# *4AA4D413008C_4AA0D66F0159_var*
begin
 __WasEnter := vcmEnterFactory;
 try
//#UC START# *4AA4D413008C_4AA0D66F0159_impl*
 Tfs_DrugList.Make(TsdsDrugList.Make(aList), aContainer);
//#UC END# *4AA4D413008C_4AA0D66F0159_impl*
 finally
  if __WasEnter then
   vcmLeaveFactory;
 end;//try..finally
end;//TInpharmModule.OpenDrugList

class procedure TInpharmModule.OpenMedicDictionPrim(const aSDS: IsdsCommonDiction;
  const aContainer: IvcmContainer);
//#UC START# *4AA52C670101_4AA0D66F0159_var*
//#UC END# *4AA52C670101_4AA0D66F0159_var*
begin
//#UC START# *4AA52C670101_4AA0D66F0159_impl*
 TnsOpenMedicDictionaryEvent.Log;
 Tfs_MedicDiction.Make(aSDS, aContainer);
//#UC END# *4AA52C670101_4AA0D66F0159_impl*
end;//TInpharmModule.OpenMedicDictionPrim

procedure TInpharmModule.opMedicDictionTest(const aParams: IvcmTestParamsPrim);
//#UC START# *4AB9FC8F027A_4AA0D66F0159test_var*
//#UC END# *4AB9FC8F027A_4AA0D66F0159test_var*
begin
//#UC START# *4AB9FC8F027A_4AA0D66F0159test_impl*
 aParams.Op.Flag[vcm_ofEnabled] := defDataAdapter.IsInpharmExists;
//#UC END# *4AB9FC8F027A_4AA0D66F0159test_impl*
end;//TInpharmModule.opMedicDictionTest

procedure TInpharmModule.opMedicDiction(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4AB9FC8F027A_4AA0D66F0159exec_var*
  
 function lp_HasDictionForm: Boolean;
 begin
  Result := CheckContainer(nil).HasForm(fm_en_CommonDiction.rFormID,
                                        vcm_ztNavigator,
                                        True, nil, Ord(utMedicDiction));
 end;//lp_HasTipsForm

(*var
 l_SDS: IsdsCommonDiction;*)
//#UC END# *4AB9FC8F027A_4AA0D66F0159exec_var*
begin
//#UC START# *4AB9FC8F027A_4AA0D66F0159exec_impl*
 Assert(((aParams As IvcmExecuteParams).Data = nil),
        '����������� �������� OpenMedicDictionPrim');
(* if Supports(aParams.Data, IsdsCommonDiction, l_SDS) AND (l_SDS <> nil) then
  OpenMedicDictionPrim(l_SDS, aParams.Container)
 else*)
 if {(l_SDS = nil) AND} not lp_HasDictionForm {or Assigned(l_SDS)} then
  OpenMedicDiction(nil, CheckContainer(nil));
//#UC END# *4AB9FC8F027A_4AA0D66F0159exec_impl*
end;//TInpharmModule.opMedicDiction

procedure TInpharmModule.opMedicFirmsTest(const aParams: IvcmTestParamsPrim);
//#UC START# *4AB9FCE902EC_4AA0D66F0159test_var*
//#UC END# *4AB9FCE902EC_4AA0D66F0159test_var*
begin
//#UC START# *4AB9FCE902EC_4AA0D66F0159test_impl*
 aParams.Op.Flag[vcm_ofEnabled] := defDataAdapter.IsInpharmExists;
//#UC END# *4AB9FCE902EC_4AA0D66F0159test_impl*
end;//TInpharmModule.opMedicFirmsTest

procedure TInpharmModule.opMedicFirms(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4AB9FCE902EC_4AA0D66F0159exec_var*
//#UC END# *4AB9FCE902EC_4AA0D66F0159exec_var*
begin
//#UC START# *4AB9FCE902EC_4AA0D66F0159exec_impl*
 MedicFirms(nil);
//#UC END# *4AB9FCE902EC_4AA0D66F0159exec_impl*
end;//TInpharmModule.opMedicFirms

procedure TInpharmModule.opDrugListTest(const aParams: IvcmTestParamsPrim);
//#UC START# *4AB9FD0601CF_4AA0D66F0159test_var*
//#UC END# *4AB9FD0601CF_4AA0D66F0159test_var*
begin
//#UC START# *4AB9FD0601CF_4AA0D66F0159test_impl*
 aParams.Op.Flag[vcm_ofEnabled] := defDataAdapter.IsInpharmExists;
//#UC END# *4AB9FD0601CF_4AA0D66F0159test_impl*
end;//TInpharmModule.opDrugListTest

procedure TInpharmModule.opDrugList(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4AB9FD0601CF_4AA0D66F0159exec_var*
//#UC END# *4AB9FD0601CF_4AA0D66F0159exec_var*
begin
//#UC START# *4AB9FD0601CF_4AA0D66F0159exec_impl*
 TdmStdRes.OpenList(
  TdeListSet.Make(
   defDataAdapter.NativeAdapter.MakeDynList(SLK_ALL_ALLOWED_DRUGS)), nil);
//#UC END# *4AB9FD0601CF_4AA0D66F0159exec_impl*
end;//TInpharmModule.opDrugList

procedure TInpharmModule.opMedicMainMenu(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4AB9FD6F017A_4AA0D66F0159exec_var*
//#UC END# *4AB9FD6F017A_4AA0D66F0159exec_var*
begin
//#UC START# *4AB9FD6F017A_4AA0D66F0159exec_impl*
 if defDataAdapter.IsInpharmExists then
 begin
  if CheckContainer(nil).NativeMainForm.
    HasForm(fm_en_MedicMainMenu.rFormID, vcm_ztParent, true, nil) then
    exit;
  Ten_MedicMainMenu.Make(vcmMakeParams(nil, CheckContainer(nil)),
                         vcm_ztParent,
                         Ord(ut_mmmMain));
 end;//defDataAdapter.IsInpharmExists
//#UC END# *4AB9FD6F017A_4AA0D66F0159exec_impl*
end;//TInpharmModule.opMedicMainMenu

class procedure TInpharmModule.MedicFirms(const aContainer: IvcmContainer);
var
 __WasEnter : Boolean;
//#UC START# *4AC0F93D01AB_4AA0D66F0159_var*
//#UC END# *4AC0F93D01AB_4AA0D66F0159_var*
begin
 __WasEnter := vcmEnterFactory;
 try
//#UC START# *4AC0F93D01AB_4AA0D66F0159_impl*
 if defDataAdapter.IsInpharmExists AND
    not CheckContainer(aContainer).HasForm(fm_en_MedicFirmList.rFormID,
                                           vcm_ztMain,
                                           True,
                                           nil,
                                           Ord(mflMain)) then
 begin
  TnsOpenMedicFirmsEvent.Log;
  Tfs_MedicFirmList.Make(TsdsMedicFirmList.Make(nil),
                         CheckContainer(aContainer));
 end;//not lp_HasListForm
//#UC END# *4AC0F93D01AB_4AA0D66F0159_impl*
 finally
  if __WasEnter then
   vcmLeaveFactory;
 end;//try..finally
end;//TInpharmModule.MedicFirms
// start class TnsOpenPharmFirmDocumentEvent

class procedure TnsOpenPharmFirmDocumentEvent.Log(const aDoc: IDocument);
//#UC START# *4B14D8D10222_4B14D8AE00D4_var*
var
 l_Data: ILogEventData;
//#UC END# *4B14D8D10222_4B14D8AE00D4_var*
begin
//#UC START# *4B14D8D10222_4B14D8AE00D4_impl*
 l_Data := MakeParamsList;
 l_Data.AddObject(aDoc);
 GetLogger.AddEvent(LE_OPEN_PHARM_FIRM_DOCUMENT, l_Data);
//#UC END# *4B14D8D10222_4B14D8AE00D4_impl*
end;//TnsOpenPharmFirmDocumentEvent.Log
// start class TnsOpenPharmDocumentEvent

class procedure TnsOpenPharmDocumentEvent.Log(const aDoc: IDocument);
//#UC START# *4B14D98900BD_4B14D96C038A_var*
var
 l_Data: ILogEventData;
//#UC END# *4B14D98900BD_4B14D96C038A_var*
begin
//#UC START# *4B14D98900BD_4B14D96C038A_impl*
 l_Data := MakeParamsList;
 l_Data.AddObject(aDoc);
 GetLogger.AddEvent(LE_OPEN_PHARM_DOCUMENT, l_Data);
//#UC END# *4B14D98900BD_4B14D96C038A_impl*
end;//TnsOpenPharmDocumentEvent.Log
// start class TnsOpenMedicDictionaryEvent

class procedure TnsOpenMedicDictionaryEvent.Log;
//#UC START# *4B14DA27026F_4B14DA170298_var*
//#UC END# *4B14DA27026F_4B14DA170298_var*
begin
//#UC START# *4B14DA27026F_4B14DA170298_impl*
 GetLogger.AddEvent(LE_OPEN_MEDIC_DICTIONARY, MakeParamsList);
//#UC END# *4B14DA27026F_4B14DA170298_impl*
end;//TnsOpenMedicDictionaryEvent.Log
// start class TnsOpenMedicFirmsEvent

class procedure TnsOpenMedicFirmsEvent.Log;
//#UC START# *4B14DA6B00F9_4B14DA6101E3_var*
//#UC END# *4B14DA6B00F9_4B14DA6101E3_var*
begin
//#UC START# *4B14DA6B00F9_4B14DA6101E3_impl*
 GetLogger.AddEvent(LE_OPEN_MEDIC_FIRMS, MakeParamsList);
//#UC END# *4B14DA6B00F9_4B14DA6101E3_impl*
end;//TnsOpenMedicFirmsEvent.Log

procedure TInpharmModule.Loaded;
begin
 inherited;
 PublishOp('opMedicDiction', opMedicDiction, opMedicDictionTest);
 PublishOp('opMedicFirms', opMedicFirms, opMedicFirmsTest);
 PublishOp('opDrugList', opDrugList, opDrugListTest);
 PublishOp('opMedicMainMenu', opMedicMainMenu, nil);
end;

class procedure TInpharmModule.GetEntityForms(aList : TvcmClassList);
begin
 inherited;
 aList.Add(Ten_MedicMainMenu);
 aList.Add(Ten_MedicFirmList);
 aList.Add(Ten_MedicListSynchroView);
end;

{$IfEnd} //not Admin AND not Monitorings

initialization
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� ������� ����� MedicMainMenu
 fm_en_MedicMainMenu.SetFactory(Ten_MedicMainMenu.Make);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_Form_MedicMainMenu
 Tkw_Form_MedicMainMenu.Register('�����::MedicMainMenu', Ten_MedicMainMenu);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_MedicMainMenu_pnlMain_ControlInstance
 TtfwScriptEngine.GlobalAddWord('.Ten_MedicMainMenu.pnlMain', Tkw_MedicMainMenu_pnlMain_ControlInstance);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_MedicMainMenu_hfLastOpenDocs_ControlInstance
 TtfwScriptEngine.GlobalAddWord('.Ten_MedicMainMenu.hfLastOpenDocs', Tkw_MedicMainMenu_hfLastOpenDocs_ControlInstance);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_MedicMainMenu_tvLastOpenDocs_ControlInstance
 TtfwScriptEngine.GlobalAddWord('.Ten_MedicMainMenu.tvLastOpenDocs', Tkw_MedicMainMenu_tvLastOpenDocs_ControlInstance);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� ������� ����� MedicListSynchroView
 fm_en_MedicListSynchroView.SetFactory(Ten_MedicListSynchroView.Make);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_Form_MedicListSynchroView
 Tkw_Form_MedicListSynchroView.Register('�����::MedicListSynchroView', Ten_MedicListSynchroView);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ����������� Tkw_MedicListSynchroView_ztChild_ControlInstance
 TtfwScriptEngine.GlobalAddWord('.Ten_MedicListSynchroView.ztChild', Tkw_MedicListSynchroView_ztChild_ControlInstance);
{$IfEnd} //not Admin AND not Monitorings

end.