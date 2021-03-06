unit MainMenuDomainInterfaces;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Common$Lib"
// �����: ����� �.�.
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/Common/MainMenuDomainInterfaces.pas"
// �����: 09.02.2009 18:26
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<Interfaces::Category>> F1 Core::Common::Common$Lib::MainMenuDomainInterfaces
//
// ������� ����
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
  SearchUnit,
  l3Interfaces,
  l3TreeInterfaces,
  OldTreeInterfaces
  ;

type
 InsMainMenuNode = interface(Il3SimpleNode)
  {* ������� ������ �������� ��������� ���� }
   ['{F66C6EFD-42D9-495B-8598-53375CF94925}']
   function pm_GetNodeType: Integer;
   property NodeType: Integer
     read pm_GetNodeType;
 end;//InsMainMenuNode

 InsDocumentNode = interface(IUnknown)
  {* ���� ������� �������� �������� }
   ['{CB2D4809-618E-4A09-822A-EF66239CA8E5}']
   function pm_GetData: IDocument;
   property Data: IDocument
     read pm_GetData;
 end;//InsDocumentNode

 InsQueryNode = interface(InsWrapperNode)
   ['{91E2885F-DB08-40D1-B272-3B342E791954}']
   function pm_GetDocCount: Integer;
   function pm_GetQuery: IQuery;
   property DocCount: Integer
     read pm_GetDocCount;
   property Query: IQuery
     read pm_GetQuery;
     {* ���������� ������ }
 end;//InsQueryNode

 InsJournalBookmarkNode = interface(InsWrapperNode)
   ['{3D80D697-C525-428C-A010-4B946FEE49CD}']
   function Get_DocName: Il3CString;
   function Get_Bookmark: IJournalBookmark;
   property DocName: Il3CString
     read Get_DocName;
   property Bookmark: IJournalBookmark
     read Get_Bookmark;
 end;//InsJournalBookmarkNode
{$IfEnd} //not Admin AND not Monitorings

implementation

end.