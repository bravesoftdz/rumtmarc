unit nsQuestionsWithChoices;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Data"
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/Data/nsQuestionsWithChoices.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<UtilityPack::Class>> F1 ������� ����������� ���������� �������::LegalDomain::Data::���� ����� ��� ��������� �� StdRes � Choices::nsQuestionsWithChoices
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

uses
  l3StringIDEx,
  l3MessageID
  ;

var
  { ������������ ������ Questions }
 str_ChangedDocumentOnControl : Tl3MessageID = (rS : -1; rLocalized : false; rKey : 'ChangedDocumentOnControl'; rValue : '� �������� �� �������� ������� ���������. �������� ��������:');
  { '� �������� �� �������� ������� ���������. �������� ��������:' }
 str_SearchUnresolvedContext : Tl3MessageID = (rS : -1; rLocalized : false; rKey : 'SearchUnresolvedContext'; rValue : '� ������� ���� �����, ����� �� ������� ����� �� ���� ����������� ����������: {color:Red}{italic:true}%s{italic}{color}.');
  { '� ������� ���� �����, ����� �� ������� ����� �� ���� ����������� ����������: [color:Red][italic:true]%s[italic][color].' }
 str_DropListToList : Tl3MessageID = (rS : -1; rLocalized : false; rKey : 'DropListToList'; rValue : '���������� ��������:');
  { '���������� ��������:' }
 str_mtNotGarantDomain : Tl3MessageID = (rS : -1; rLocalized : false; rKey : 'mtNotGarantDomain'; rValue : '������� �� ������� ������');
  { '������� �� ������� ������' }
 str_EmptySearchResultInBaseList : Tl3MessageID = (rS : -1; rLocalized : false; rKey : 'EmptySearchResultInBaseList'; rValue : '����� � ������� (�����������) ������ �� ��� ����������� �� ��������� ���� �������. �������� �������� ��� ����������� ������:');
  { '����� � ������� (�����������) ������ �� ��� ����������� �� ��������� ���� �������. �������� �������� ��� ����������� ������:' }
 str_AutologinDuplicate : Tl3MessageID = (rS : -1; rLocalized : false; rKey : 'AutologinDuplicate'; rValue : '������������ � ����� ������ ��� ����������. �������� �����:');
  { '������������ � ����� ������ ��� ����������. �������� �����:' }
 str_ChangedDocumentOnControl_SettingsCaption : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'ChangedDocumentOnControl_SettingsCaption'; rValue : '�������� ��� ������ ����������� ��������� �� ��������');
  { undefined }

implementation

uses
  Dialogs
  ;

var
  { �������� ������ ��� ������� ChangedDocumentOnControl }
 str_ChangedDocumentOnControl_Choice_Open : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'ChangedDocumentOnControl_Choice_Open'; rValue : '������� ����� ���������');
  { '������� ����� ���������' }
 str_ChangedDocumentOnControl_Choice_Compare : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'ChangedDocumentOnControl_Choice_Compare'; rValue : '�������� � ���������� ���������');
  { '�������� � ���������� ���������' }

var
  { �������� ������ ��� ������� SearchUnresolvedContext }
 str_SearchUnresolvedContext_Choice_Back : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'SearchUnresolvedContext_Choice_Back'; rValue : '��������� � �������� � ��������������� ������');
  { '��������� � �������� � ��������������� ������' }
 str_SearchUnresolvedContext_Choice_Continue : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'SearchUnresolvedContext_Choice_Continue'; rValue : '���������� �����');
  { '���������� �����' }

var
  { �������� ������ ��� ������� DropListToList }
 str_DropListToList_Choice_Append : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'DropListToList_Choice_Append'; rValue : '�������� � ������������ ������');
  { '�������� � ������������ ������' }
 str_DropListToList_Choice_Copy : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'DropListToList_Choice_Copy'; rValue : '���������� � ����� ������');
  { '���������� � ����� ������' }

var
  { �������� ������ ��� ������� mtNotGarantDomain }
 str_mtNotGarantDomain_Choice_Open : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'mtNotGarantDomain_Choice_Open'; rValue : '�������, ������ �� ������� �������� ');
  { '�������, ������ �� ������� �������� ' }
 str_mtNotGarantDomain_Choice_Stay : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'mtNotGarantDomain_Choice_Stay'; rValue : '�� ����������');
  { '�� ����������' }

var
  { �������� ������ ��� ������� EmptySearchResultInBaseList }
 str_EmptySearchResultInBaseList_Choice_Expand : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'EmptySearchResultInBaseList_Choice_Expand'; rValue : '��������� ������� ������ �� ������� � ���������� ����� � ���');
  { '��������� ������� ������ �� ������� � ���������� ����� � ���' }
 str_EmptySearchResultInBaseList_Choice_AllBase : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'EmptySearchResultInBaseList_Choice_AllBase'; rValue : '���������� ����� �� ����� ��������������� �����');
  { '���������� ����� �� ����� ��������������� �����' }

var
  { �������� ������ ��� ������� AutologinDuplicate }
 str_AutologinDuplicate_Choice_Back : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'AutologinDuplicate_Choice_Back'; rValue : '��������� � ����������� ������ ������������, ������� ��������������� ������');
  { '��������� � ����������� ������ ������������, ������� ��������������� ������' }
 str_AutologinDuplicate_Choice_Login : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'AutologinDuplicate_Choice_Login'; rValue : '����� � ������� � ���������� ���������������� �������, ����������� ��������� ��� ������������');
  { '����� � ������� � ���������� ���������������� �������, ����������� ��������� ��� ������������' }


initialization
// ������������� str_ChangedDocumentOnControl_Choice_Open
 str_ChangedDocumentOnControl_Choice_Open.Init;
// ������������� str_ChangedDocumentOnControl_Choice_Compare
 str_ChangedDocumentOnControl_Choice_Compare.Init;
// ������������� str_SearchUnresolvedContext_Choice_Back
 str_SearchUnresolvedContext_Choice_Back.Init;
// ������������� str_SearchUnresolvedContext_Choice_Continue
 str_SearchUnresolvedContext_Choice_Continue.Init;
// ������������� str_DropListToList_Choice_Append
 str_DropListToList_Choice_Append.Init;
// ������������� str_DropListToList_Choice_Copy
 str_DropListToList_Choice_Copy.Init;
// ������������� str_mtNotGarantDomain_Choice_Open
 str_mtNotGarantDomain_Choice_Open.Init;
// ������������� str_mtNotGarantDomain_Choice_Stay
 str_mtNotGarantDomain_Choice_Stay.Init;
// ������������� str_EmptySearchResultInBaseList_Choice_Expand
 str_EmptySearchResultInBaseList_Choice_Expand.Init;
// ������������� str_EmptySearchResultInBaseList_Choice_AllBase
 str_EmptySearchResultInBaseList_Choice_AllBase.Init;
// ������������� str_AutologinDuplicate_Choice_Back
 str_AutologinDuplicate_Choice_Back.Init;
// ������������� str_AutologinDuplicate_Choice_Login
 str_AutologinDuplicate_Choice_Login.Init;
// ������������� str_ChangedDocumentOnControl
 str_ChangedDocumentOnControl.Init;
 str_ChangedDocumentOnControl.AddChoice(str_ChangedDocumentOnControl_Choice_Open);
 str_ChangedDocumentOnControl.AddChoice(str_ChangedDocumentOnControl_Choice_Compare);
 str_ChangedDocumentOnControl.SetDlgType(mtConfirmation);
 str_ChangedDocumentOnControl.SetSettingsCaption(str_ChangedDocumentOnControl_SettingsCaption);
// ������������� str_SearchUnresolvedContext
 str_SearchUnresolvedContext.Init;
 str_SearchUnresolvedContext.AddChoice(str_SearchUnresolvedContext_Choice_Back);
 str_SearchUnresolvedContext.AddChoice(str_SearchUnresolvedContext_Choice_Continue);
 str_SearchUnresolvedContext.SetDlgType(mtConfirmation);
// ������������� str_DropListToList
 str_DropListToList.Init;
 str_DropListToList.AddChoice(str_DropListToList_Choice_Append);
 str_DropListToList.AddChoice(str_DropListToList_Choice_Copy);
 str_DropListToList.SetDlgType(mtConfirmation);
// ������������� str_mtNotGarantDomain
 str_mtNotGarantDomain.Init;
 str_mtNotGarantDomain.AddChoice(str_mtNotGarantDomain_Choice_Open);
 str_mtNotGarantDomain.AddChoice(str_mtNotGarantDomain_Choice_Stay);
 str_mtNotGarantDomain.SetDlgType(mtConfirmation);
// ������������� str_EmptySearchResultInBaseList
 str_EmptySearchResultInBaseList.Init;
 str_EmptySearchResultInBaseList.AddChoice(str_EmptySearchResultInBaseList_Choice_Expand);
 str_EmptySearchResultInBaseList.AddChoice(str_EmptySearchResultInBaseList_Choice_AllBase);
 str_EmptySearchResultInBaseList.SetDlgType(mtConfirmation);
// ������������� str_AutologinDuplicate
 str_AutologinDuplicate.Init;
 str_AutologinDuplicate.AddChoice(str_AutologinDuplicate_Choice_Back);
 str_AutologinDuplicate.AddChoice(str_AutologinDuplicate_Choice_Login);
 str_AutologinDuplicate.SetDlgType(mtWarning);
// ������������� str_ChangedDocumentOnControl_SettingsCaption
 str_ChangedDocumentOnControl_SettingsCaption.Init;

end.