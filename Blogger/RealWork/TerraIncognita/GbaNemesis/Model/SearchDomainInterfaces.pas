unit SearchDomainInterfaces;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Model"
// �����: ����� �.�.
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/Model/SearchDomainInterfaces.pas"
// �����: 09.02.2009 18:52
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<Interfaces::Category>> F1 ������� ����������� ���������� �������::LegalDomain::Model::SearchDomainInterfaces
//
// �����
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

uses
  l3Interfaces
  ;

type
 TLogicOperation = (
   loNone
 , loOr
 , loAnd
 , loNot
 );//TLogicOperation

 InsLogicOperation = interface(IUnknown)
   ['{6FF60911-661A-4835-9C7D-D3A8553EDE96}']
   function pm_GetOperation: TLogicOperation;
   procedure pm_SetOperation(aValue: TLogicOperation);
   property Operation: TLogicOperation
     read pm_GetOperation
     write pm_SetOperation;
 end;//InsLogicOperation

 TLogicOperationSet = set of TLogicOperation;

 InsTaggedTreeInfo = interface(IUnknown)
   ['{255BD920-7322-4C04-A208-161C9656148B}']
   function pm_GetTag: Il3CString;
   procedure pm_SetTag(const aValue: Il3CString);
   function pm_GetLogicOperations: TLogicOperationSet;
   procedure pm_SetLogicOperations(aValue: TLogicOperationSet);
   function pm_GetServerOneLevel: Boolean;
   procedure pm_SetServerOneLevel(aValue: Boolean);
   function pm_GetIsOneLogicOperation: Boolean;
   procedure AssignInfo(const aInfo: InsTaggedTreeInfo);
   function IsDataOneLevel: Boolean;
   property Tag: Il3CString
     read pm_GetTag
     write pm_SetTag;
   property LogicOperations: TLogicOperationSet
     read pm_GetLogicOperations
     write pm_SetLogicOperations;
     {* ���������� ��� ������ ���������� �������� }
   property ServerOneLevel: Boolean
     read pm_GetServerOneLevel
     write pm_SetServerOneLevel;
   property IsOneLogicOperation: Boolean
     read pm_GetIsOneLogicOperation;
     {* ���������� ���������� �������� - ���� }
 end;//InsTaggedTreeInfo

implementation

end.