unit ConsultationDomainInterfaces;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Consultation$Lib"
// �����: ����� �.�.
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/Consultation/ConsultationDomainInterfaces.pas"
// �����: 25.09.2009 20:31
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<ControllerInterfaces::Category>> F1 Core::Base Operations::Consultation$Lib::ConsultationDomainInterfaces
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
  ConsultingUnit,
  DocumentUnit,
  l3Interfaces,
  bsTypes,
  DocumentAndListInterfaces,
  SysUtils,
  DocumentInterfaces,
  bsTypesNew,
  vcmInterfaces {a},
  vcmControllers {a}
  ;

type
 SysDateTime = System.TDateTime;

 IbsConsultation = interface(IUnknown)
  {* ������������. ������� ������� ��� �������� ������ � ��������� �������������, ��� ������ � �������� ������� ����� ���������� EDeleted }
   ['{0E7541E5-05E6-4A9C-A10B-71A3253B3E8E}']
   function pm_GetStatus: TbsConsultationStatuses;
   function pm_GetIsStatusChached: Boolean;
   procedure pm_SetIsStatusChached(aValue: Boolean);
   function pm_GetData: IConsultation;
   function pm_GetWasDeleted: Boolean;
   function pm_GetId: Il3CString;
   function pm_GetWasCreated: SysDateTime;
   function pm_GetWasModified: SysDateTime;
   function pm_GetCaption: Il3CString;
   function pm_GetText: IDocument;
   procedure RefreshText;
     {* �������� �����. ����������� ��� ��������� ��������� ������������ }
   property Status: TbsConsultationStatuses
     read pm_GetStatus;
     {* ������ ������������ }
   property IsStatusChached: Boolean
     read pm_GetIsStatusChached
     write pm_SetIsStatusChached;
     {* �������� �� ������ ������������. ����� ����� ��� ��������
             ������������ ������� ���-�� ��������� � ������� }
   property Data: IConsultation
     read pm_GetData;
     {* ������������ }
   property WasDeleted: Boolean
     read pm_GetWasDeleted;
     {* ������������ ���� ������� }
   property Id: Il3CString
     read pm_GetId;
     {* ������������� ������������ }
   property WasCreated: SysDateTime
     read pm_GetWasCreated;
     {* ���� �������� }
   property WasModified: SysDateTime
     read pm_GetWasModified;
     {* ���� ��������� (��������������� � ������� ��������� �������
             ������������) }
   property Caption: Il3CString
     read pm_GetCaption;
     {* �������� ������������ }
   property Text: IDocument
     read pm_GetText;
     {* ����� ������������ ������������ ������������. ���� � ������������
             ���� �����, �� ������������ �����, ���� ���, �� ������������ �����
             ������� }
 end;//IbsConsultation

 EbsConsultationAlreadyConfirmed = class(Exception)
  {* ������ ������������ ��� ������������/���������� }
 end;//EbsConsultationAlreadyConfirmed

 EbsConsultationAlreadyMark = class(Exception)
  {* ������������ ��� ���� ������� }
 end;//EbsConsultationAlreadyMark

 EbsConsultationWasDeleted = class(Exception)
  {* ������������ ���� ������� }
 end;//EbsConsultationWasDeleted

 EbsPaymentForbidden = class(Exception)
  {* ������� ������������ ��� ������������ ��������� }
 end;//EbsPaymentForbidden

 IdsConsultation = interface(IdsBaseDocument)
  {* ��� ������������ }
   ['{2BA5B54E-CFAD-47B8-9DAC-04914173BFD8}']
   function pm_GetShowingStatus: TbsConsultationStatuses;
   property ShowingStatus: TbsConsultationStatuses
     read pm_GetShowingStatus;
     {* ������������ �� ������ ������ ������������. ����� ������ ����� ���
             ������ ��������� ������������ �� ������ ������������ ������
             �������� ������ � ����� ������������, �.�. �� �� ������������ ��
             ���������� � ����� ���������� ���� ������������ ������������ ��
             ������. ��������, ��������� ������ �� ��������, ����� ��������
             �����������, ��� ���� ������ ������������ �������� }
 end;//IdsConsultation

 IdsConsultationMark = interface(IvcmViewAreaController)
  {* ��� ������ ������������ }
   ['{20808CC0-584C-48C5-A167-7DEDB7D3C1BF}']
   function pm_GetMark: TbsConsultationMark;
   procedure pm_SetMark(aValue: TbsConsultationMark);
   function pm_GetComment: Tl3WString;
   procedure pm_SetComment(const aValue: Tl3WString);
   function pm_GetCanSend: Boolean;
   procedure Send;
     {* ������� ������ }
   property Mark: TbsConsultationMark
     read pm_GetMark
     write pm_SetMark;
     {* ������ }
   property Comment: Tl3WString
     read pm_GetComment
     write pm_SetComment;
     {* ����������� }
   property CanSend: Boolean
     read pm_GetCanSend;
     {* ����� �� ��������� ������ }
 end;//IdsConsultationMark

 IsdsConsultation = interface(IvcmUseCaseController{, IsdsGotoPointDataMaker, ������������ ������ ������������ ������ �� ��������� �������})
  {* ������ ������ ���������� "������������" }
   ['{005BCE3D-3D26-4B47-80B4-BB7580EE147F}']
   function pm_GetDsConsultation: IdsConsultation;
   function pm_GetDsList: IdsDocumentList;
   function pm_GetDSConsultationMark(aForce: Boolean): IdsConsultationMark;
   function Get_BsConsultation: IbsConsultation;
   procedure GiveMark; // can raise EbsConsultationAlreadyMark, EbsConsultationWasDeleted
     {* ���� ������.
           ��������� ����������:
           - EbsConsultationAlreadyMark }
   function NeedGiveMark: Boolean;
   procedure ConfirmPayment(anAccept: Boolean); // can raise EbsPaymentForbidden, EbsConsultationWasDeleted, EbsConsultationAlreadyConfirmed
     {* ����������� ������ ������������. ��/���;
           ����������:
             - EbsPaymentForbidden }
   procedure UpdateAnswer;
     {* ���������� ����� }
   procedure ListChanged;
     {* ������ ���������� ������������ ������� �������������. ������������
           ��� ������������ ������������ }
   procedure ConsultationWasMarked(const aConsultation: IsdsConsultation);
     {* ������������ ���� �������. ��� ������ ����� ������������ ������� �
           ������, ��� ���� ��� �� ������������ ������� �� ������ � �� �����
           ����������, ����� ������ ������� ������� }
   procedure MarkSended;
   property dsConsultation: IdsConsultation
     read pm_GetDsConsultation;
     {* �� ������������ }
   property dsList: IdsDocumentList
     read pm_GetDsList;
     {* �� ������ ������������ }
   property DSConsultationMark[aForce: Boolean]: IdsConsultationMark
     read pm_GetDSConsultationMark;
     {* �� ������ ������������ }
   property bsConsultation: IbsConsultation
     read Get_BsConsultation;
  // ������ �������������� � ����������� �����������
   function As_IsdsGotoPointDataMaker: IsdsGotoPointDataMaker;
 end;//IsdsConsultation
{$IfEnd} //not Admin AND not Monitorings

implementation

end.