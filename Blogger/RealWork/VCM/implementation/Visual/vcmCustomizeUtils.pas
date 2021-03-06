unit vcmCustomizeUtils;

////////////////////////////////////////////////////////////////////////////////
// ���������� : VCM
// ���������� : ����� ������� ��� ���������
// ������     : $Id: vcmCustomizeUtils.pas,v 1.8 2013/08/05 12:21:59 morozov Exp $
////////////////////////////////////////////////////////////////////////////////

(*-------------------------------------------------------------------------------
  $Log: vcmCustomizeUtils.pas,v $
  Revision 1.8  2013/08/05 12:21:59  morozov
  {RequestLink:471774446}

  Revision 1.7  2013/07/26 10:32:43  morozov
  {RequestLink: 471774401}

  Revision 1.6  2013/07/05 14:34:53  lulin
  - ������������ �������� ��� ����������� �������������� ������� � ������� ��������� ������ ������� ���������� �������������� �������� �� ���������� ������.

  Revision 1.5  2013/04/25 13:44:53  morozov
  {RequestLink:363571639}

  Revision 1.4  2013/04/25 13:20:27  morozov
  {RequestLink:363571639}

  Revision 1.3  2008/09/15 11:19:50  oman
  - fix: �������� �� �������������� (�-115803119)

  Revision 1.2  2008/06/25 11:23:44  mmorozov
  - new: ����������� ������� ������������ ... ������ ���� ��� ��������� ��������� ��������  (CQ: OIT5-28281);

  Revision 1.1  2008/06/25 09:24:51  mmorozov
  - new: ����������� ������� ������������ ---|> � ������ ��������� ���� ���������� ������ ������������ ������ ������������ + ����������� + ������ ���� ������� ��� �������������� ��������� ��� ������ �������� (CQ: OIT5-28281);

-------------------------------------------------------------------------------*)

interface

uses
  StdCtrls,

  vcmInterfaces,
  vcmEntityForm,
  Classes,
  vcmUserTypeDescr
  ;

type
  vcmFormCustomize = class
  {* ������� ��� ��������� �����. }
      {-}
    class function MakeVirtualForm(const aUserType  : IvcmUserTypeDef;
                                   out NeedFreeForm : Boolean): TvcmEntityForm;
      {-}
    class function FindUserTypeByCaption(const aSettingsCaption: String): IvcmUserTypeDef;
     overload;
      {-}
    class function FindUserTypeByCaption(const aSettingsCaption : String;
                                                     aFormClass : TClass): IvcmUserTypeDef;
     overload;
      {-}
    class function GetUserTypeDescrList(const aUserType : IvcmUserTypeDef;
                                         out aItemIndex : Integer): TvcmUserTypeDescrList;
      {-}
    class function MakeUserTypeCaption(const aUserTypeCaption : String;
                                                   aFormClass : TClass;
                                                   aToolbar   : TComponent = nil;
                                                   anInternal : Boolean = False): String;
      {-}
  end;//vcmFormCustomize

implementation

uses
  SysUtils,

  l3Types,
  l3Base,
  l3String,

  vcmBase,

  vcmBaseMenuManager,
  vcmMenuManager,
  vcmStringList,
  vcmContainerForm
  ;

const
 cUntranslatedCaption = 'Translation is not available';

{ vcmFormCustomize }

class function vcmFormCustomize.MakeVirtualForm(const aUserType  : IvcmUserTypeDef;
                                          out NeedFreeForm : Boolean): TvcmEntityForm;
begin
 Result := g_MenuManager.BuildVirtualForm(RvcmEntityForm(aUserType.FormClass),
                                          NeedFreeForm,
                                          aUserType.ID);
 Assert(Result <> nil);
end;

class function vcmFormCustomize.FindUserTypeByCaption(
  const aSettingsCaption: String): IvcmUserTypeDef;
begin
 Result := (g_MenuManager As TvcmCustomMenuManager).
  UserTypeByCaption(aSettingsCaption);
 Assert(Result <> nil);
end;

class function vcmFormCustomize.FindUserTypeByCaption(const aSettingsCaption : String;
                                                 aFormClass : TClass): IvcmUserTypeDef;
begin
 Result := (g_MenuManager As TvcmCustomMenuManager).
  UserTypeByCaption(aSettingsCaption, aFormClass);
 Assert(Result <> nil);
end;

class function vcmFormCustomize.GetUserTypeDescrList(const aUserType: IvcmUserTypeDef;
 out aItemIndex: Integer): TvcmUserTypeDescrList;

 function lp_FindDuplicateCaption(const aCaption: String;
  aList: TvcmUserTypeDescrList; out aDuplicateIndex: Integer): Boolean;
 var
  l_DupIndex: Integer;
 begin
  Result := False;
  aDuplicateIndex := -1;
  for l_DupIndex := 0 to aList.Count - 1 do
   if aList.Items[l_DupIndex].SettingsCaption = aCaption then
   begin
    Result := True;
    aDuplicateIndex := l_DupIndex;
   end;
 end;

 procedure lp_CorrectDupUTCaption(aFirst: TvcmUserTypeDescr; aSecond: TvcmUserTypeDescr);
 begin
  if (aFirst.FormClass.InheritsFrom(aSecond.FormClass)) then
   aFirst.SettingsCaption := aFirst.SettingsCaption + ' (�������� ��������)'
  else
  if (aSecond.FormClass.InheritsFrom(aFirst.FormClass)) then
   lp_CorrectDupUTCaption(aSecond, aFirst);
 end;

var
 l_Index: Integer;
 l_List: TvcmUserTypeDescrList;
 l_UT: IvcmUserTypeDef;
 l_UTDescr: TvcmUserTypeDescr;
 l_DupIndex: Integer;
 l_DupUTDescr: TvcmUserTypeDescr;
 l_Caption: String;
begin
 l_List := TvcmUserTypeDescrList.Create;
 l_List.Sorted := True;
 l_List.Duplicates := l3_dupAccept;
 with (g_MenuManager As TvcmCustomMenuManager).UserTypes do
  for l_Index := 0 to Hi do
  begin
   l_UT := IvcmUserTypeDef(Items[l_Index]);
   if not l_UT.UseToolbarAnotherUserType then
    if (l_UT.UserVisibleOpCount > 0) then
     if TvcmUserTypeInfo.AllowCustomizeToolbars(l_UT) then
      if (l_UT.SettingsCaption <> cUntranslatedCaption) then
      begin
       l_UTDescr.IsCustomizationInternal := TvcmUserTypeInfo.IsCustomizationInternal(l_UT);
       l_UTDescr.SettingsCaption := l_UT.SettingsCaption;
       l_UTDescr.FormClass := l_UT.FormClass;
       l_List.Add(l_UTDescr);
      end;
  end;//for l_Index
 if (l_List.Count > 0) then
 begin
  if (aUserType <> nil) then
  begin
   l_UTDescr.FormClass := aUserType.FormClass;
   l_UTDescr.SettingsCaption := aUserType.SettingsCaption;
   aItemIndex := l_List.IndexOf(l_UTDescr);
  end
  else
   aItemIndex := 0;
 end;
 Result := l_List;
end;

class function vcmFormCustomize.MakeUserTypeCaption(
  const aUserTypeCaption: String; aFormClass: TClass;
  aToolbar: TComponent; anInternal: Boolean): String;
const
 c_ToolBarCaptionDelimiter = '-';
(* c_ContainerCaption        = '(���������)'; *)
 c_InternalCaption         = '(��������� ���������)';
var
 l_UserTypeCaption: String;
begin
 l_UserTypeCaption := aUserTypeCaption;
(* if (aFormClass.InheritsFrom(TvcmContainerForm)) then
  l_UserTypeCaption := Format('%s %s', [l_UserTypeCaption, c_ContainerCaption]); *)

 if (aToolbar <> nil) AND (aToolbar Is TvcmToolbarDef) AND
  not l3Starts(vcmCStr(TvcmToolbarDef(aToolbar).Caption), l3CStr(aUserTypeCaption), true) then
   l_UserTypeCaption := Format('%s %s %s', [l_UserTypeCaption, c_ToolBarCaptionDelimiter,
    TvcmToolbarDef(aToolbar).Caption]);

 if anInternal then
  l_UserTypeCaption := Format('%s %s', [l_UserTypeCaption, c_InternalCaption]);

 Result := l_UserTypeCaption;
end;

end.
