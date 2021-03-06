unit dsCreateFilter;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Filters"
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/Filters/dsCreateFilter.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<ViewAreaControllerImp::Class>> F1 �������� ����������::Filters::Filters::Filters::TdsCreateFilter
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
  SimpleListInterfaces,
  FiltersInterfaces
  {$If not defined(NoVCM)}
  ,
  vcmInterfaces
  {$IfEnd} //not NoVCM
  
  {$If not defined(NoVCM)}
  ,
  vcmExternalInterfaces
  {$IfEnd} //not NoVCM
  
  {$If not defined(NoVCM)}
  ,
  vcmLocalInterfaces
  {$IfEnd} //not NoVCM
  ,
  l3ProtoObjectWithCOMQI,
  l3Interfaces,
  l3NotifyPtrList
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}
type
 _FormDataSourceType_ = IdsCreateFilter;
 _InitDataType_ = IdeFilter;
 {$Include w:\common\components\gui\Garant\VCM\implementation\vcmFormDataSource.imp.pas}
 TdsCreateFilter = {vac} class(_vcmFormDataSource_, IdsCreateFilter)
 protected
 // realized methods
   function Get_Name: Il3CString;
   procedure CreateFilter(const aName: Il3CString);
   procedure RenameFilter(const aName: Il3CString);
 end;//TdsCreateFilter
{$IfEnd} //not Admin AND not Monitorings

implementation

{$If not defined(Admin) AND not defined(Monitorings)}
uses
  nsQueryUtils,
  nsFiltersContainer,
  nsTypes,
  DataAdapter,
  l3InterfacesMisc,
  SysUtils,
  l3Base
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}

type _Instance_R_ = TdsCreateFilter;

{$Include w:\common\components\gui\Garant\VCM\implementation\vcmFormDataSource.imp.pas}

// start class TdsCreateFilter

function TdsCreateFilter.Get_Name: Il3CString;
//#UC START# *4CB6C9330040_4CB6C9B20187get_var*
//#UC END# *4CB6C9330040_4CB6C9B20187get_var*
begin
//#UC START# *4CB6C9330040_4CB6C9B20187get_impl*
 Result := nsGetQueryName(PartData.Query);
//#UC END# *4CB6C9330040_4CB6C9B20187get_impl*
end;//TdsCreateFilter.Get_Name

procedure TdsCreateFilter.CreateFilter(const aName: Il3CString);
//#UC START# *4CB6C9490358_4CB6C9B20187_var*
//#UC END# *4CB6C9490358_4CB6C9B20187_var*
begin
//#UC START# *4CB6C9490358_4CB6C9B20187_impl*
 //TnsFiltersContainer.ConvertToFilter(PartData.Query, aName);
 defDataAdapter.NativeAdapter.MakeFiltersManager.CreateFilter(PartData.Query, nsIStr(aName));
//#UC END# *4CB6C9490358_4CB6C9B20187_impl*
end;//TdsCreateFilter.CreateFilter

procedure TdsCreateFilter.RenameFilter(const aName: Il3CString);
//#UC START# *4CB6C966029D_4CB6C9B20187_var*
//#UC END# *4CB6C966029D_4CB6C9B20187_var*
begin
//#UC START# *4CB6C966029D_4CB6C9B20187_impl*
 //TnsFiltersContainer.RenameFilter(PartData.Filter, aName);
 PartData.Filter.SetName(nsIStr(aName));
//#UC END# *4CB6C966029D_4CB6C9B20187_impl*
end;//TdsCreateFilter.RenameFilter

{$IfEnd} //not Admin AND not Monitorings

end.