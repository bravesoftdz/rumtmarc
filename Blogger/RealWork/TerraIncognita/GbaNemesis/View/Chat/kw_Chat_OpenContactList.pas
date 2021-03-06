unit kw_Chat_OpenContactList;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "View"
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/View/Chat/kw_Chat_OpenContactList.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> F1 ���������� ��������::Chat::View::Chat::Tkw_Chat_OpenContactList
//
// ����� ������� ��� ������ �������� ������ Chat.OpenContactList (���)
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
  Classes
  {$If not defined(NoVCM)}
  ,
  vcmExternalInterfaces
  {$IfEnd} //not NoVCM
  
  {$If not defined(NoScripts)}
  ,
  tfwScriptingInterfaces
  {$IfEnd} //not NoScripts
  
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}
type
 {$Include w:\common\components\rtl\Garant\ScriptEngine\tfwModuleOperationWord.imp.pas}
 Tkw_Chat_OpenContactList = class(_tfwModuleOperationWord_)
  {* ����� ������� ��� ������ �������� ������ Chat.OpenContactList (���) }
 protected
 // overridden protected methods
   {$If not defined(NoScripts)}
   class function GetModuleOperationCode: TvcmMOPID; override;
   {$IfEnd} //not NoScripts
 public
 // overridden public methods
   {$If not defined(NoScripts)}
   class function GetWordNameForRegister: AnsiString; override;
   {$IfEnd} //not NoScripts
 end;//Tkw_Chat_OpenContactList
{$IfEnd} //not Admin AND not Monitorings

implementation

{$If not defined(Admin) AND not defined(Monitorings)}
uses
  SysUtils
  {$If not defined(NoVCM)}
  ,
  StdResPrim
  {$IfEnd} //not NoVCM
  
  {$If not defined(NoVCM)}
  ,
  vcmBase
  {$IfEnd} //not NoVCM
  
  {$If not defined(NoScripts)}
  ,
  tfwAutoregisteredDiction
  {$IfEnd} //not NoScripts
  
  {$If not defined(NoScripts)}
  ,
  tfwScriptEngine
  {$IfEnd} //not NoScripts
  
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}

type _Instance_R_ = Tkw_Chat_OpenContactList;

{$Include w:\common\components\rtl\Garant\ScriptEngine\tfwModuleOperationWord.imp.pas}

// start class Tkw_Chat_OpenContactList

{$If not defined(NoScripts)}
class function Tkw_Chat_OpenContactList.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '���::���_OpenContactList';
end;//Tkw_Chat_OpenContactList.GetWordNameForRegister
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
class function Tkw_Chat_OpenContactList.GetModuleOperationCode: TvcmMOPID;
 {-}
begin
 Result := TdmStdRes.mod_opcode_Chat_OpenContactList;
end;//Tkw_Chat_OpenContactList.GetModuleOperationCode
{$IfEnd} //not NoScripts

{$IfEnd} //not Admin AND not Monitorings

initialization
{$If not defined(Admin) AND not defined(Monitorings)}
 {$Include w:\common\components\rtl\Garant\ScriptEngine\tfwModuleOperationWord.imp.pas}
{$IfEnd} //not Admin AND not Monitorings

end.