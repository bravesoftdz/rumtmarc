unit nsSettings;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Data"
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/Data/Settings/nsSettings.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> F1 ������� ����������� ���������� �������::LegalDomain::Data::Settings::TnsSettings
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

uses
  SettingsUnit,
  afwInterfaces,
  bsInterfaces,
  IafwSettingListenerPtrList,
  IafwSettingsReplaceListenerPtrList,
  InsUserSettingsListenerPtrList,
  InsUserSettingsEditListenerPtrList,
  l3ProtoObject,
  l3IID,
  l3Interfaces,
  IOUnit
  ;

type
 _SettingsClass_ = ISettingsManager;
 _l3COMQueryInterface_Parent_ = Tl3ProtoObject;
 {$Include w:\common\components\rtl\Garant\L3\l3COMQueryInterface.imp.pas}
 _nsSettings_Parent_ = _l3COMQueryInterface_;
 {$Include ..\Settings\nsSettings.imp.pas}
 TnsSettings = class(_nsSettings_, IafwSettings, IafwSettingsNotify, InsSettingsNotify, InsSettings)
 private
 // private fields
   f_SettingListeners : TIafwSettingListenerPtrList;
   f_ReplaceListeners : TIafwSettingsReplaceListenerPtrList;
   f_SettingsListeners : TInsUserSettingsListenerPtrList;
   f_SettingsEditListeners : TInsUserSettingsEditListenerPtrList;
   f_ConfigurationManager : IConfigurationManager;
   f_State : TafwSettingsState;
 private
 // private methods
   procedure NotifySettingsChanged;
   procedure NotifyReplace(aStart: Boolean = True);
 protected
 // realized methods
   function Clone(const aConf: IUnknown): IafwSettings;
   procedure AddListener(const aListener: IafwSettingListener); overload; 
   procedure RemoveListener(const aListener: IafwSettingListener); overload; 
   procedure AddListener(const aListener: IafwSettingsReplaceListener); overload; 
   procedure RemoveListener(const aListener: IafwSettingsReplaceListener); overload; 
   function pm_GetNotify: IafwSettingsNotify;
   function pm_GetState: TafwSettingsState;
   procedure pm_SetState(aValue: TafwSettingsState);
   procedure AddListener(const aListener: InsUserSettingsEditListener); overload; 
   procedure RemoveListener(const aListener: InsUserSettingsEditListener); overload; 
   procedure AddListener(const aListener: InsUserSettingsListener); overload; 
   procedure RemoveListener(const aListener: InsUserSettingsListener); overload; 
   procedure StartEdit;
     {* ���������� ����� ������� �������������� }
   procedure UserSettingsChanged;
     {* ��� ���������\�������������� ���������������� �������� }
   procedure StartReplace;
     {* ���������� ����� ������������� ������������ }
   procedure FinishReplace;
     {* ���������� �� ��������� ������������ ������������ }
   function pm_GetSettingsNotify: InsSettingsNotify;
   function pm_GetData: ISettingsManager;
   procedure pm_SetData(const aValue: ISettingsManager);
   function LoadDouble(const aSettingId: TafwSettingId;
    aDefault: Double = 0;
    aRestoreDefault: Boolean = False): Double;
   procedure SaveDouble(const aSettingId: TafwSettingId;
    aValue: Double;
    aDefault: Double = 0;
    aSetAsDefault: Boolean = False);
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* ������� ������� ����� �������. }
   function COMQueryInterface(const IID: Tl3GUID;
    out Obj): Tl3HResult; override;
     {* ���������� ������� ���������� }
   procedure NotifySettingChanged(const aSettingID: TafwSettingId); override;
   function TryToRestore(const aSettingID: TafwSettingId): Boolean; override;
   procedure DoSaveParam(const aTarget: _SettingsClass_;
    const aSettingId: TafwSettingId;
    aType: byte;
    const aValue;
    const aDefault;
    aSetAsDefault: Boolean); override;
   procedure DoSetAsDefault(const aTarget: _SettingsClass_;
    const aSettingId: TafwSettingId); override;
 public
 // public methods
   constructor Create(const aSettings: ISettingsManager;
    const aManager: IConfigurationManager); reintroduce;
   class function Make(const aSettings: ISettingsManager;
    const aManager: IConfigurationManager): IafwSettings; reintroduce;
 end;//TnsSettings

implementation

uses
  l3InterfacesMisc,
  l3Base,
  nsTypes,
  SysUtils,
  l3String,
  l3VCLStrings
  ;

{$Include w:\common\components\rtl\Garant\L3\l3COMQueryInterface.imp.pas}

{$Include ..\Settings\nsSettings.imp.pas}

// start class TnsSettings

constructor TnsSettings.Create(const aSettings: ISettingsManager;
  const aManager: IConfigurationManager);
//#UC START# *4AD6FE86005C_4AD6FDC802F3_var*
//#UC END# *4AD6FE86005C_4AD6FDC802F3_var*
begin
//#UC START# *4AD6FE86005C_4AD6FDC802F3_impl*
 inherited Create(aSettings);
 f_ConfigurationManager := aManager;
 f_State := afw_ssNone;
//#UC END# *4AD6FE86005C_4AD6FDC802F3_impl*
end;//TnsSettings.Create

class function TnsSettings.Make(const aSettings: ISettingsManager;
  const aManager: IConfigurationManager): IafwSettings;
var
 l_Inst : TnsSettings;
begin
 l_Inst := Create(aSettings, aManager);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

procedure TnsSettings.NotifySettingsChanged;
//#UC START# *4AD70DA301DF_4AD6FDC802F3_var*
var
 l_Index: Integer;
//#UC END# *4AD70DA301DF_4AD6FDC802F3_var*
begin
//#UC START# *4AD70DA301DF_4AD6FDC802F3_impl*
 if f_SettingsListeners <> nil then
  for l_Index := 0 to Pred(f_SettingsListeners.Count) do
   f_SettingsListeners.Items[l_Index].Changed;
//#UC END# *4AD70DA301DF_4AD6FDC802F3_impl*
end;//TnsSettings.NotifySettingsChanged

procedure TnsSettings.NotifyReplace(aStart: Boolean = True);
//#UC START# *4AD70DBD01E5_4AD6FDC802F3_var*
var
 l_Index : Integer;
//#UC END# *4AD70DBD01E5_4AD6FDC802F3_var*
begin
//#UC START# *4AD70DBD01E5_4AD6FDC802F3_impl*
 if (f_ReplaceListeners <> nil) then
  for l_Index := Pred(f_ReplaceListeners.Count) downto 0 do
   with f_ReplaceListeners[l_Index] do
    if aStart then
     Start
    else
     Finish;
//#UC END# *4AD70DBD01E5_4AD6FDC802F3_impl*
end;//TnsSettings.NotifyReplace

function TnsSettings.Clone(const aConf: IUnknown): IafwSettings;
//#UC START# *473D9F0F033A_4AD6FDC802F3_var*
var
 l_Class : TnsSettings;
//#UC END# *473D9F0F033A_4AD6FDC802F3_var*
begin
//#UC START# *473D9F0F033A_4AD6FDC802F3_impl*
 Result := Self;
 if (aConf <> nil) AND not l3IEQ(aConf, Settings) then
 begin
  l_Class := TnsSettings.Create(aConf As ISettingsManager,
                                f_ConfigurationManager);
  try
   l3Set(l_Class.f_SettingListeners, f_SettingListeners);
   l3Set(l_Class.f_ReplaceListeners, f_ReplaceListeners);
   Result := l_Class;
  finally
   FreeAndNil(l_Class);
  end;//try..finally
 end;//aConf <> nil
//#UC END# *473D9F0F033A_4AD6FDC802F3_impl*
end;//TnsSettings.Clone

procedure TnsSettings.AddListener(const aListener: IafwSettingListener);
//#UC START# *475E8E410197_4AD6FDC802F3_var*
//#UC END# *475E8E410197_4AD6FDC802F3_var*
begin
//#UC START# *475E8E410197_4AD6FDC802F3_impl*
 if (f_SettingListeners = nil) then
  f_SettingListeners := TIafwSettingListenerPtrList.Make;
 if f_SettingListeners.IndexOf(aListener) = -1 then
  f_SettingListeners.Add(aListener);
//#UC END# *475E8E410197_4AD6FDC802F3_impl*
end;//TnsSettings.AddListener

procedure TnsSettings.RemoveListener(const aListener: IafwSettingListener);
//#UC START# *475E8E4D03E4_4AD6FDC802F3_var*
//#UC END# *475E8E4D03E4_4AD6FDC802F3_var*
begin
//#UC START# *475E8E4D03E4_4AD6FDC802F3_impl*
 if (f_SettingListeners <> nil) then
  f_SettingListeners.Remove(aListener);
//#UC END# *475E8E4D03E4_4AD6FDC802F3_impl*
end;//TnsSettings.RemoveListener

procedure TnsSettings.AddListener(const aListener: IafwSettingsReplaceListener);
//#UC START# *475E8E5E0286_4AD6FDC802F3_var*
//#UC END# *475E8E5E0286_4AD6FDC802F3_var*
begin
//#UC START# *475E8E5E0286_4AD6FDC802F3_impl*
 if (f_ReplaceListeners = nil) then
  f_ReplaceListeners := TIafwSettingsReplaceListenerPtrList.Make;
 if f_ReplaceListeners.IndexOf(aListener) = -1 then
  f_ReplaceListeners.Add(aListener);
//#UC END# *475E8E5E0286_4AD6FDC802F3_impl*
end;//TnsSettings.AddListener

procedure TnsSettings.RemoveListener(const aListener: IafwSettingsReplaceListener);
//#UC START# *475E8E7900A3_4AD6FDC802F3_var*
//#UC END# *475E8E7900A3_4AD6FDC802F3_var*
begin
//#UC START# *475E8E7900A3_4AD6FDC802F3_impl*
 if f_ReplaceListeners <> nil then
  f_ReplaceListeners.Remove(aListener);
//#UC END# *475E8E7900A3_4AD6FDC802F3_impl*
end;//TnsSettings.RemoveListener

function TnsSettings.pm_GetNotify: IafwSettingsNotify;
//#UC START# *475E8F5A0198_4AD6FDC802F3get_var*
//#UC END# *475E8F5A0198_4AD6FDC802F3get_var*
begin
//#UC START# *475E8F5A0198_4AD6FDC802F3get_impl*
 Result := Self;
//#UC END# *475E8F5A0198_4AD6FDC802F3get_impl*
end;//TnsSettings.pm_GetNotify

function TnsSettings.pm_GetState: TafwSettingsState;
//#UC START# *48896A7B0311_4AD6FDC802F3get_var*
//#UC END# *48896A7B0311_4AD6FDC802F3get_var*
begin
//#UC START# *48896A7B0311_4AD6FDC802F3get_impl*
 Result := f_State;
//#UC END# *48896A7B0311_4AD6FDC802F3get_impl*
end;//TnsSettings.pm_GetState

procedure TnsSettings.pm_SetState(aValue: TafwSettingsState);
//#UC START# *48896A7B0311_4AD6FDC802F3set_var*
//#UC END# *48896A7B0311_4AD6FDC802F3set_var*
begin
//#UC START# *48896A7B0311_4AD6FDC802F3set_impl*
 f_State := aValue;
//#UC END# *48896A7B0311_4AD6FDC802F3set_impl*
end;//TnsSettings.pm_SetState

procedure TnsSettings.AddListener(const aListener: InsUserSettingsEditListener);
//#UC START# *4914446E0280_4AD6FDC802F3_var*
//#UC END# *4914446E0280_4AD6FDC802F3_var*
begin
//#UC START# *4914446E0280_4AD6FDC802F3_impl*
 if f_SettingsEditListeners  = nil then
  f_SettingsEditListeners := TInsUserSettingsEditListenerPtrList.Make;
 if f_SettingsEditListeners.IndexOf(aListener) = -1 then
  f_SettingsEditListeners.Add(aListener);
//#UC END# *4914446E0280_4AD6FDC802F3_impl*
end;//TnsSettings.AddListener

procedure TnsSettings.RemoveListener(const aListener: InsUserSettingsEditListener);
//#UC START# *4914447B01C4_4AD6FDC802F3_var*
//#UC END# *4914447B01C4_4AD6FDC802F3_var*
begin
//#UC START# *4914447B01C4_4AD6FDC802F3_impl*
 if (f_SettingsEditListeners <> nil) then
  f_SettingsEditListeners.Remove(aListener);
//#UC END# *4914447B01C4_4AD6FDC802F3_impl*
end;//TnsSettings.RemoveListener

procedure TnsSettings.AddListener(const aListener: InsUserSettingsListener);
//#UC START# *491444880189_4AD6FDC802F3_var*
//#UC END# *491444880189_4AD6FDC802F3_var*
begin
//#UC START# *491444880189_4AD6FDC802F3_impl*
 if f_SettingsListeners  = nil then
  f_SettingsListeners := TInsUserSettingsListenerPtrList.Make;
 if f_SettingsListeners.IndexOf(aListener) = -1 then
  f_SettingsListeners.Add(aListener);
//#UC END# *491444880189_4AD6FDC802F3_impl*
end;//TnsSettings.AddListener

procedure TnsSettings.RemoveListener(const aListener: InsUserSettingsListener);
//#UC START# *4914449202EA_4AD6FDC802F3_var*
//#UC END# *4914449202EA_4AD6FDC802F3_var*
begin
//#UC START# *4914449202EA_4AD6FDC802F3_impl*
 if (f_SettingsListeners <> nil) then
  f_SettingsListeners.Remove(aListener);
//#UC END# *4914449202EA_4AD6FDC802F3_impl*
end;//TnsSettings.RemoveListener

procedure TnsSettings.StartEdit;
//#UC START# *491444D00360_4AD6FDC802F3_var*
var
 l_Index: Integer;
//#UC END# *491444D00360_4AD6FDC802F3_var*
begin
//#UC START# *491444D00360_4AD6FDC802F3_impl*
 if f_SettingsEditListeners <> nil then
  for l_Index := 0 to Pred(f_SettingsEditListeners.Count) do
   f_SettingsEditListeners.Items[l_Index].StartEdit;
//#UC END# *491444D00360_4AD6FDC802F3_impl*
end;//TnsSettings.StartEdit

procedure TnsSettings.UserSettingsChanged;
//#UC START# *491444E70109_4AD6FDC802F3_var*
//#UC END# *491444E70109_4AD6FDC802F3_var*
begin
//#UC START# *491444E70109_4AD6FDC802F3_impl*
 NotifySettingsChanged;
//#UC END# *491444E70109_4AD6FDC802F3_impl*
end;//TnsSettings.UserSettingsChanged

procedure TnsSettings.StartReplace;
//#UC START# *491444FB0228_4AD6FDC802F3_var*
//#UC END# *491444FB0228_4AD6FDC802F3_var*
begin
//#UC START# *491444FB0228_4AD6FDC802F3_impl*
 NotifyReplace;
//#UC END# *491444FB0228_4AD6FDC802F3_impl*
end;//TnsSettings.StartReplace

procedure TnsSettings.FinishReplace;
//#UC START# *4914450A01D2_4AD6FDC802F3_var*
//#UC END# *4914450A01D2_4AD6FDC802F3_var*
begin
//#UC START# *4914450A01D2_4AD6FDC802F3_impl*
 NotifyReplace(False);
//#UC END# *4914450A01D2_4AD6FDC802F3_impl*
end;//TnsSettings.FinishReplace

function TnsSettings.pm_GetSettingsNotify: InsSettingsNotify;
//#UC START# *4914451B03BB_4AD6FDC802F3get_var*
//#UC END# *4914451B03BB_4AD6FDC802F3get_var*
begin
//#UC START# *4914451B03BB_4AD6FDC802F3get_impl*
 Result := Self;
//#UC END# *4914451B03BB_4AD6FDC802F3get_impl*
end;//TnsSettings.pm_GetSettingsNotify

function TnsSettings.pm_GetData: ISettingsManager;
//#UC START# *49144567028A_4AD6FDC802F3get_var*
//#UC END# *49144567028A_4AD6FDC802F3get_var*
begin
//#UC START# *49144567028A_4AD6FDC802F3get_impl*
 Result := Settings;
//#UC END# *49144567028A_4AD6FDC802F3get_impl*
end;//TnsSettings.pm_GetData

procedure TnsSettings.pm_SetData(const aValue: ISettingsManager);
//#UC START# *49144567028A_4AD6FDC802F3set_var*
//#UC END# *49144567028A_4AD6FDC802F3set_var*
begin
//#UC START# *49144567028A_4AD6FDC802F3set_impl*
 Settings := aValue;
//#UC END# *49144567028A_4AD6FDC802F3set_impl*
end;//TnsSettings.pm_SetData

function TnsSettings.LoadDouble(const aSettingId: TafwSettingId;
  aDefault: Double = 0;
  aRestoreDefault: Boolean = False): Double;
//#UC START# *4AB729980069_4AD6FDC802F3_var*
//#UC END# *4AB729980069_4AD6FDC802F3_var*
begin
//#UC START# *4AB729980069_4AD6FDC802F3_impl*
 LoadParam(aSettingId, vtExtended, Result, aDefault, aRestoreDefault);
//#UC END# *4AB729980069_4AD6FDC802F3_impl*
end;//TnsSettings.LoadDouble

procedure TnsSettings.SaveDouble(const aSettingId: TafwSettingId;
  aValue: Double;
  aDefault: Double = 0;
  aSetAsDefault: Boolean = False);
//#UC START# *4AB729A702A2_4AD6FDC802F3_var*
//#UC END# *4AB729A702A2_4AD6FDC802F3_var*
begin
//#UC START# *4AB729A702A2_4AD6FDC802F3_impl*
 SaveParam(aSettingId, vtExtended, aValue, aDefault, aSetAsDefault);
//#UC END# *4AB729A702A2_4AD6FDC802F3_impl*
end;//TnsSettings.SaveDouble

procedure TnsSettings.Cleanup;
//#UC START# *479731C50290_4AD6FDC802F3_var*
//#UC END# *479731C50290_4AD6FDC802F3_var*
begin
//#UC START# *479731C50290_4AD6FDC802F3_impl*
 FreeAndNil(f_SettingsEditListeners);
 FreeAndNil(f_SettingListeners);
 FreeAndNil(f_ReplaceListeners);
 FreeAndNil(f_SettingsListeners);
 inherited;
//#UC END# *479731C50290_4AD6FDC802F3_impl*
end;//TnsSettings.Cleanup

function TnsSettings.COMQueryInterface(const IID: Tl3GUID;
  out Obj): Tl3HResult;
//#UC START# *4A60B23E00C3_4AD6FDC802F3_var*
//#UC END# *4A60B23E00C3_4AD6FDC802F3_var*
begin
//#UC START# *4A60B23E00C3_4AD6FDC802F3_impl*
 Result := inherited COMQueryInterface(IID, Obj);
 if Result.Fail AND IID.EQ(InsSettings) then
 begin
  //Assert(false, '����� ����� ������ ������ ����������, ������ �� ����� ��������?');
  Result.SetOK;
  InsSettings(Obj) := Self;
 end //l3IFail(Result)
 else
 if Result.Fail AND IID.EQ(ISettingsManager) then
 begin
  //Assert(false, '����� ����� ������ ������ ����������, ������ �� ����� ��������?');
  Result.SetOk;
  ISettingsManager(Obj) := Settings;
 end;//l3IFail(Result)
//#UC END# *4A60B23E00C3_4AD6FDC802F3_impl*
end;//TnsSettings.COMQueryInterface

procedure TnsSettings.NotifySettingChanged(const aSettingID: TafwSettingId);
//#UC START# *4AD5979E01BB_4AD6FDC802F3_var*
var
 l_Index : Integer;
//#UC END# *4AD5979E01BB_4AD6FDC802F3_var*
begin
//#UC START# *4AD5979E01BB_4AD6FDC802F3_impl*
 if (f_SettingListeners <> nil) then
  for l_Index := 0 to Pred(f_SettingListeners.Count) do
   f_SettingListeners[l_Index].Changed(aSettingId);
//#UC END# *4AD5979E01BB_4AD6FDC802F3_impl*
end;//TnsSettings.NotifySettingChanged

function TnsSettings.TryToRestore(const aSettingID: TafwSettingId): Boolean;
//#UC START# *4AD597CE0390_4AD6FDC802F3_var*
//#UC END# *4AD597CE0390_4AD6FDC802F3_var*
begin
//#UC START# *4AD597CE0390_4AD6FDC802F3_impl*
 Result := Settings.IsExist(nsAStr(aSettingId)) and Settings.IsChanged(nsAStr(aSettingId));
 if Result then
  Settings.RestoreDefault(nsAStr(aSettingId));
//#UC END# *4AD597CE0390_4AD6FDC802F3_impl*
end;//TnsSettings.TryToRestore

procedure TnsSettings.DoSaveParam(const aTarget: _SettingsClass_;
  const aSettingId: TafwSettingId;
  aType: byte;
  const aValue;
  const aDefault;
  aSetAsDefault: Boolean);
//#UC START# *4AD59C2C027D_4AD6FDC802F3_var*

 procedure lp_SaveInAllSettings;
 var
  l_Index          : Integer;
  l_Configurations : IConfigurations;
  l_Configuration  : IConfiguration;
  l_Settings       : ISettingsManager;
 begin//lp_SaveInAllSettings
  Assert(f_ConfigurationManager <> nil);
  f_ConfigurationManager.GetConfigurations(l_Configurations);
  for l_Index := 0 to l_Configurations.Count - 1 do
  begin
   l_Configurations.pm_GetItem(l_Index, l_Configuration);
   try
    l_Configuration.GetSettings(l_Settings);
     try
      inherited DoSaveParam(l_Settings, aSettingId, aType, aValue, aDefault, aSetAsDefault);
       // - �������� ��������� � ������������;
     finally
      l_Settings := nil;
     end;//try..finally
   finally
    l_Configuration := nil;
   end;//try..finally
  end;//for l_Index
 end;//lp_SaveInAllSettings

//#UC END# *4AD59C2C027D_4AD6FDC802F3_var*
begin
//#UC START# *4AD59C2C027D_4AD6FDC802F3_impl*
 case f_State of
  afw_ssNone:
   inherited DoSaveParam(aTarget, aSettingId, aType, aValue, aDefault, aSetAsDefault);
  afw_ssSaveInAllSettings:
   lp_SaveInAllSettings;
 end;//case State of
//#UC END# *4AD59C2C027D_4AD6FDC802F3_impl*
end;//TnsSettings.DoSaveParam

procedure TnsSettings.DoSetAsDefault(const aTarget: _SettingsClass_;
  const aSettingId: TafwSettingId);
//#UC START# *4AD5AA940324_4AD6FDC802F3_var*
//#UC END# *4AD5AA940324_4AD6FDC802F3_var*
begin
//#UC START# *4AD5AA940324_4AD6FDC802F3_impl*
 aTarget.SaveAsDefault(nsAStr(aSettingId))
//#UC END# *4AD5AA940324_4AD6FDC802F3_impl*
end;//TnsSettings.DoSetAsDefault

end.