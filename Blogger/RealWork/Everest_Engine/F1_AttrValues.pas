unit F1_AttrValues;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest Engine"
// ������: "w:/common/components/gui/Garant/Everest_Engine/F1_AttrValues.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<UtilityPack::Class>> Shared Delphi For F1::Everest Engine::EVD::F1_AttrValues
//
// ������������ �������� ��������� �������� ����� ������� ����� F1
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\Everest_Engine\eeDefine.inc}

interface

uses
  l3StringIDEx
  ;

var
  { ������������ ������ AttrValues }
 str_TextStyle_ANSIDOS_Name_Value : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'TextStyle_ANSIDOS_Name_Value'; rValue : '������������');
  { ������������ �������� �������� TextStyle_ANSIDOS_Name_Value }
 str_TextStyle_CompareEditionsText_Name_Value : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'TextStyle_CompareEditionsText_Name_Value'; rValue : '��������� ��������');
  { ������������ �������� �������� TextStyle_CompareEditionsText_Name_Value }
 str_TextStyle_DeletedText_Name_Value : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'TextStyle_DeletedText_Name_Value'; rValue : '�������� �����');
  { ������������ �������� �������� TextStyle_DeletedText_Name_Value }
 str_TextStyle_ChatHeaderSender_Name_Value : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'TextStyle_ChatHeaderSender_Name_Value'; rValue : '��������� ������������ ���������');
  { ������������ �������� �������� TextStyle_ChatHeaderSender_Name_Value }
 str_TextStyle_ChatHeaderRecipient_Name_Value : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'TextStyle_ChatHeaderRecipient_Name_Value'; rValue : '��������� ����������� ���������');
  { ������������ �������� �������� TextStyle_ChatHeaderRecipient_Name_Value }
 str_TextStyle_AddedText_Name_Value : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'TextStyle_AddedText_Name_Value'; rValue : '����������� �����');
  { ������������ �������� �������� TextStyle_AddedText_Name_Value }
 str_TextStyle_NewSchoolMainMenu_Name_Value : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'TextStyle_NewSchoolMainMenu_Name_Value'; rValue : '�������� ���� (��-���������)');
  { ������������ �������� �������� TextStyle_NewSchoolMainMenu_Name_Value }
 str_TextStyle_MainMenu_Font_Name_Value : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'TextStyle_MainMenu_Font_Name_Value'; rValue : 'Verdana');
  { ������������ �������� �������� TextStyle_MainMenu_Font_Name_Value }
 str_TextStyle_MainMenu_Name_Value : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'TextStyle_MainMenu_Name_Value'; rValue : '�������� ���� (�������������)');
  { ������������ �������� �������� TextStyle_MainMenu_Name_Value }
 str_TextStyle_MainMenuHeader_Name_Value : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'TextStyle_MainMenuHeader_Name_Value'; rValue : '��������� *');
  { ������������ �������� �������� TextStyle_MainMenuHeader_Name_Value }
 str_TextStyle_MainMenuConstPath_Name_Value : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'TextStyle_MainMenuConstPath_Name_Value'; rValue : '���������� ����� *');
  { ������������ �������� �������� TextStyle_MainMenuConstPath_Name_Value }
 str_TextStyle_NewSchoolMainMenuConstPath_Font_Name_Value : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'TextStyle_NewSchoolMainMenuConstPath_Font_Name_Value'; rValue : 'Arial');
  { ������������ �������� �������� TextStyle_NewSchoolMainMenuConstPath_Font_Name_Value }
 str_TextStyle_NewSchoolMainMenuConstPath_Name_Value : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'TextStyle_NewSchoolMainMenuConstPath_Name_Value'; rValue : '���������� �����');
  { ������������ �������� �������� TextStyle_NewSchoolMainMenuConstPath_Name_Value }
 str_TextStyle_NewSchoolMainMenuHeader_Font_Name_Value : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'TextStyle_NewSchoolMainMenuHeader_Font_Name_Value'; rValue : 'Arial');
  { ������������ �������� �������� TextStyle_NewSchoolMainMenuHeader_Font_Name_Value }
 str_TextStyle_NewSchoolMainMenuHeader_Name_Value : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'TextStyle_NewSchoolMainMenuHeader_Name_Value'; rValue : '���������');
  { ������������ �������� �������� TextStyle_NewSchoolMainMenuHeader_Name_Value }
 str_TextStyle_MainMenuChangePath_Name_Value : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'TextStyle_MainMenuChangePath_Name_Value'; rValue : '���������� �����');
  { ������������ �������� �������� TextStyle_MainMenuChangePath_Name_Value }
 str_TextStyle_MainMenuInteractiveHeader_Name_Value : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'TextStyle_MainMenuInteractiveHeader_Name_Value'; rValue : '������������� ���������');
  { ������������ �������� �������� TextStyle_MainMenuInteractiveHeader_Name_Value }
 str_TextStyle_Changes1_Name_Value : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'TextStyle_Changes1_Name_Value'; rValue : '����� ��������� ��������� 1');
  { ������������ �������� �������� TextStyle_Changes1_Name_Value }
 str_TextStyle_Changes2_Name_Value : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'TextStyle_Changes2_Name_Value'; rValue : '����� ��������� ��������� 2');
  { ������������ �������� �������� TextStyle_Changes2_Name_Value }
 str_TextStyle_EnclosureHeader_Name_Value : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'TextStyle_EnclosureHeader_Name_Value'; rValue : '��������� ����������');
  { ������������ �������� �������� TextStyle_EnclosureHeader_Name_Value }
 str_TextStyle_EditionInterval_Name_Value : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'TextStyle_EditionInterval_Name_Value'; rValue : '�������� �������� ��������');
  { ������������ �������� �������� TextStyle_EditionInterval_Name_Value }
 str_TextStyle_Edition_Name_Value : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'TextStyle_Edition_Name_Value'; rValue : '��������');
  { ������������ �������� �������� TextStyle_Edition_Name_Value }
 str_TextStyle_EditionNumber_Name_Value : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'TextStyle_EditionNumber_Name_Value'; rValue : '����� ��������');
  { ������������ �������� �������� TextStyle_EditionNumber_Name_Value }
 str_TextStyle_Snippet_Name_Value : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'TextStyle_Snippet_Name_Value'; rValue : '�������� ������� ������');
  { ������������ �������� �������� TextStyle_Snippet_Name_Value }

implementation

uses
  l3MessageID
  ;


initialization
// ������������� str_TextStyle_ANSIDOS_Name_Value
 str_TextStyle_ANSIDOS_Name_Value.Init;
// ������������� str_TextStyle_CompareEditionsText_Name_Value
 str_TextStyle_CompareEditionsText_Name_Value.Init;
// ������������� str_TextStyle_DeletedText_Name_Value
 str_TextStyle_DeletedText_Name_Value.Init;
// ������������� str_TextStyle_ChatHeaderSender_Name_Value
 str_TextStyle_ChatHeaderSender_Name_Value.Init;
// ������������� str_TextStyle_ChatHeaderRecipient_Name_Value
 str_TextStyle_ChatHeaderRecipient_Name_Value.Init;
// ������������� str_TextStyle_AddedText_Name_Value
 str_TextStyle_AddedText_Name_Value.Init;
// ������������� str_TextStyle_NewSchoolMainMenu_Name_Value
 str_TextStyle_NewSchoolMainMenu_Name_Value.Init;
// ������������� str_TextStyle_MainMenu_Font_Name_Value
 str_TextStyle_MainMenu_Font_Name_Value.Init;
// ������������� str_TextStyle_MainMenu_Name_Value
 str_TextStyle_MainMenu_Name_Value.Init;
// ������������� str_TextStyle_MainMenuHeader_Name_Value
 str_TextStyle_MainMenuHeader_Name_Value.Init;
// ������������� str_TextStyle_MainMenuConstPath_Name_Value
 str_TextStyle_MainMenuConstPath_Name_Value.Init;
// ������������� str_TextStyle_NewSchoolMainMenuConstPath_Font_Name_Value
 str_TextStyle_NewSchoolMainMenuConstPath_Font_Name_Value.Init;
// ������������� str_TextStyle_NewSchoolMainMenuConstPath_Name_Value
 str_TextStyle_NewSchoolMainMenuConstPath_Name_Value.Init;
// ������������� str_TextStyle_NewSchoolMainMenuHeader_Font_Name_Value
 str_TextStyle_NewSchoolMainMenuHeader_Font_Name_Value.Init;
// ������������� str_TextStyle_NewSchoolMainMenuHeader_Name_Value
 str_TextStyle_NewSchoolMainMenuHeader_Name_Value.Init;
// ������������� str_TextStyle_MainMenuChangePath_Name_Value
 str_TextStyle_MainMenuChangePath_Name_Value.Init;
// ������������� str_TextStyle_MainMenuInteractiveHeader_Name_Value
 str_TextStyle_MainMenuInteractiveHeader_Name_Value.Init;
// ������������� str_TextStyle_Changes1_Name_Value
 str_TextStyle_Changes1_Name_Value.Init;
// ������������� str_TextStyle_Changes2_Name_Value
 str_TextStyle_Changes2_Name_Value.Init;
// ������������� str_TextStyle_EnclosureHeader_Name_Value
 str_TextStyle_EnclosureHeader_Name_Value.Init;
// ������������� str_TextStyle_EditionInterval_Name_Value
 str_TextStyle_EditionInterval_Name_Value.Init;
// ������������� str_TextStyle_Edition_Name_Value
 str_TextStyle_Edition_Name_Value.Init;
// ������������� str_TextStyle_EditionNumber_Name_Value
 str_TextStyle_EditionNumber_Name_Value.Init;
// ������������� str_TextStyle_Snippet_Name_Value
 str_TextStyle_Snippet_Name_Value.Init;

end.