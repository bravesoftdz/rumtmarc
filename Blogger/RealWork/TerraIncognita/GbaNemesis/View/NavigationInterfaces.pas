unit NavigationInterfaces;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "View"
// �����: ����� �.�.
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/View/NavigationInterfaces.pas"
// �����: 09.10.2009 19:06
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<Interfaces::Category>> F1 Core::Base Operations::View::NavigationInterfaces
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
  DocumentUnit,
  ExternalOperationUnit,
  l3Interfaces
  {$If not defined(NoVCM)}
  ,
  vcmInterfaces
  {$IfEnd} //not NoVCM
  ,
  bsTypes,
  DocumentAndListInterfaces,
  nevNavigation,
  DocumentInterfaces,
  bsTypesNew
  ;

type
 IbsHyperLinkProcessorHelper = interface(IUnknown)
   ['{61BEA4A9-16C3-4533-93D0-67B0AD286DCF}']
   function MakeContainer: IvcmContainer;
     {* ������� ��������� �� ������� ����� �������� ������ �������� }
   function MakeNewMainWindow: IvcmContainer;
     {* ������� ����� ������� ���� � ������� ��������� ��� ���� }
   function ProcessExternalOperation(const anOperation: IExternalOperation): Boolean;
   procedure CheckLinkInfo(const aLink: IevHyperlink);
   function MakeLinkDocInfo(const aDocument: IDocument;
    aPointType: TDocumentPositionType;
    aSub: Cardinal): IdeDocInfo;
   function ProcessLocalLink(const aDocument: IDocument;
    aPointType: TDocumentPositionType;
    aSub: Cardinal): Boolean;
 end;//IbsHyperLinkProcessorHelper

 InsOpenDocOnNumberData = interface(IUnknown)
  {* ������ ��� �������� ��������� �� ������ }
   ['{2892E567-2A20-435A-92CB-E234BAF0E258}']
   function Get_DocID: Integer;
   procedure Set_DocID(aValue: Integer);
   function Get_PosID: Integer;
   procedure Set_PosID(aValue: Integer);
   function Get_Internal: Boolean;
   procedure Set_Internal(aValue: Boolean);
   function Get_History: Il3CString;
   procedure Set_History(const aValue: Il3CString);
   function Get_Done: Boolean;
   procedure Set_Done(aValue: Boolean);
   function Get_PosType: TDocumentPositionType;
   procedure Set_PosType(aValue: TDocumentPositionType);
   property DocID: Integer
     read Get_DocID
     write Set_DocID;
   property PosID: Integer
     read Get_PosID
     write Set_PosID;
   property Internal: Boolean
     read Get_Internal
     write Set_Internal;
   property History: Il3CString
     read Get_History
     write Set_History;
   property Done: Boolean
     read Get_Done
     write Set_Done;
   property PosType: TDocumentPositionType
     read Get_PosType
     write Set_PosType;
 end;//InsOpenDocOnNumberData
{$IfEnd} //not Admin AND not Monitorings

implementation

end.