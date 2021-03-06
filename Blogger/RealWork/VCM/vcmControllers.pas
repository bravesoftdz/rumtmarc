unit vcmControllers;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "VCM"
// �����: ����� �.�.
// ������: "w:/common/components/gui/Garant/VCM/vcmControllers.pas"
// �����: 30.01.2009 11:45
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<Interfaces::Category>> Shared Delphi::VCM::vcmControllers
//
// ���������� ������������
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\VCM\vcmDefine.inc}

interface

{$If not defined(NoVCM)}
uses
  vcmInterfaces
  ;

type
 TvcmNeedMakeDS = (
  {* ������������ ��� ������������ ������������� �������� ��� }
   vcm_nmForce // ��������� �� ������ �� �� ���
 , vcm_nmYes // ��������� ���������
 , vcm_nmNo // ������ ���������, �������� ������, ��� ����� ���� ������� ������������� � ��� ���������� ������ �� ��������� �� �����
 );//TvcmNeedMakeDS

 IvcmFormDataSourceRef = interface(IUnknown)
  {* ������������� ������ �� ������ ������ �����. }
   ['{F5C8B83F-1541-4055-A90B-32A85E5C3969}']
   function pm_GetIsEmpty: Boolean;
   function pm_GetCanBeClosed: Boolean;
   function pm_GetReferred: IvcmFormDataSource;
   procedure pm_SetReferred(const aValue: IvcmFormDataSource);
   function pm_GetNeedMake: TvcmNeedMakeDS;
   procedure pm_SetNeedMake(aValue: TvcmNeedMakeDS);
   procedure Clear;
     {* ���������� ������ �� _DataSource � NeedMake ������������� ��� vcm_nmNo }
   procedure SetIfNeedMakeNo(aValue: TvcmNeedMakeDS);
     {* ������������� ���� ���� ��� �������� vcm_nmNo }
   procedure Assign(const aSource: IvcmFormDataSourceRef);
     {* ����������� ������ aSource }
   property IsEmpty: Boolean
     read pm_GetIsEmpty;
     {* ���������� ������� ��������� ������. }
   property CanBeClosed: Boolean
     read pm_GetCanBeClosed;
     {* ����� �� ������� }
   property Referred: IvcmFormDataSource
     read pm_GetReferred
     write pm_SetReferred;
     {* ������ �� ���������� ������� ������ }
   property NeedMake: TvcmNeedMakeDS
     read pm_GetNeedMake
     write pm_SetNeedMake;
     {* ���������� ������������� �������� ��� }
 end;//IvcmFormDataSourceRef

 IvcmViewAreaControllerRef = IvcmFormDataSourceRef;

 IvcmViewAreaController = vcmInterfaces.IvcmFormDataSource;
  {* ������ �� IvcmFormDataSource. ��� ������������� � �������������� ����. � ������ ���� ��������� ������, ���� ��������� IvcmFormDataSource }

 IvcmUseCaseController = vcmInterfaces.IvcmFormSetDataSource;
  {* ������ �� IvcmFormSetDataSource. ��� ������������� � �������������� ����. � ������ ���� ��������� ������, ���� ��������� IvcmFormSetDataSource }
{$IfEnd} //not NoVCM

implementation

end.