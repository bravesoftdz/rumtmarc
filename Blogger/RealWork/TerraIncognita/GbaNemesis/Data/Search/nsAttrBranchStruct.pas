unit nsAttrBranchStruct;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Data"
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/Data/Search/nsAttrBranchStruct.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> F1 ������� ����������� ���������� �������::LegalDomain::Data::Search::TnsAttrBranchStruct
//
// ������������ ��� ����������� ������� ������ ������ � ������������� ��� (������ 5.�)
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

uses
  DynamicTreeUnit,
  nsAttributeOneLevelTreeStruct,
  bsInterfaces,
  l3TreeInterfaces,
  nsFilterableTreeStruct
  ;

type
 TnsAttrBranchStruct = class(TnsAttributeOneLevelTreeStruct, InsRootInfo)
  {* ������������ ��� ����������� ������� ������ ������ � ������������� ��� (������ 5.�) }
 private
 // private fields
   f_RootInfoNode : INodeBase;
    {* �������, ��� ���?}
 protected
 // realized methods
   function pm_GetRoot: INodeBase;
   procedure pm_SetRoot(const aValue: INodeBase);
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* ������� ������� ����� �������. }
   constructor CreateFiltered(const aNewRoot: INodeBase;
    aSource: TnsFilterableTreeStruct;
    const aFilters: Il3TreeFilters); override;
   function CanFiltrate: Boolean; override;
 end;//TnsAttrBranchStruct

implementation

// start class TnsAttrBranchStruct

function TnsAttrBranchStruct.pm_GetRoot: INodeBase;
//#UC START# *4909E0C00304_4909E1DD038Fget_var*
//#UC END# *4909E0C00304_4909E1DD038Fget_var*
begin
//#UC START# *4909E0C00304_4909E1DD038Fget_impl*
 Result := f_RootInfoNode;
//#UC END# *4909E0C00304_4909E1DD038Fget_impl*
end;//TnsAttrBranchStruct.pm_GetRoot

procedure TnsAttrBranchStruct.pm_SetRoot(const aValue: INodeBase);
//#UC START# *4909E0C00304_4909E1DD038Fset_var*
//#UC END# *4909E0C00304_4909E1DD038Fset_var*
begin
//#UC START# *4909E0C00304_4909E1DD038Fset_impl*
 f_RootInfoNode := aValue;
//#UC END# *4909E0C00304_4909E1DD038Fset_impl*
end;//TnsAttrBranchStruct.pm_SetRoot

procedure TnsAttrBranchStruct.Cleanup;
//#UC START# *479731C50290_4909E1DD038F_var*
//#UC END# *479731C50290_4909E1DD038F_var*
begin
//#UC START# *479731C50290_4909E1DD038F_impl*
 inherited;
 // �������� ��� �� ������ ���� ��������� _�����_ ���������� ������ ���� (��������
 // ������� ����� ��������� ����
 // ��25433
 f_RootInfoNode := nil;
//#UC END# *479731C50290_4909E1DD038F_impl*
end;//TnsAttrBranchStruct.Cleanup

constructor TnsAttrBranchStruct.CreateFiltered(const aNewRoot: INodeBase;
  aSource: TnsFilterableTreeStruct;
  const aFilters: Il3TreeFilters);
//#UC START# *48FF458602EC_4909E1DD038F_var*
//#UC END# *48FF458602EC_4909E1DD038F_var*
begin
//#UC START# *48FF458602EC_4909E1DD038F_impl*
 inherited CreateFiltered(aNewRoot, aSource, aFilters);
 if aSource is TnsAttrBranchStruct then
  f_RootInfoNode := TnsAttrBranchStruct(aSource).f_RootInfoNode;
//#UC END# *48FF458602EC_4909E1DD038F_impl*
end;//TnsAttrBranchStruct.CreateFiltered

function TnsAttrBranchStruct.CanFiltrate: Boolean;
//#UC START# *48FF4C3A00C4_4909E1DD038F_var*
//#UC END# *48FF4C3A00C4_4909E1DD038F_var*
begin
//#UC START# *48FF4C3A00C4_4909E1DD038F_impl*
 Result := False;
 // http://mdp.garant.ru/pages/viewpage.action?pageId=122650660
//#UC END# *48FF4C3A00C4_4909E1DD038F_impl*
end;//TnsAttrBranchStruct.CanFiltrate

end.