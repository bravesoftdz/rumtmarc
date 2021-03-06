unit ControlStatusUtils;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "UnderControl$Resetter"
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/UnderControl/ControlStatusUtils.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<UtilityPack::Class>> F1 Core::Common::UnderControl$Resetter::UnderControlImpl::ControlStatusUtils
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
  l3Interfaces,
  l3StringIDEx,
  UnderControlInterfaces,
  l3MessageID
  ;

var
  { ������������ ������ Messages }
 str_InActualDocumentAction : Tl3MessageID = (rS : -1; rLocalized : false; rKey : 'InActualDocumentAction'; rValue : '%s ' + #13#10 +
'���������� ���������� ������������ � ��������-������ ������� ������');
  { '%s ' + #13#10 +
'���������� ���������� ������������ � ��������-������ ������� ������' }
 str_InActualDocumentAction_CheckCaption : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'InActualDocumentAction_CheckCaption'; rValue : '�� ��������� �� ���������� � ���� ��������� � �������� ������');
  { undefined }
function BsControlStatusHint(aStatus: Integer;
  aNeedPrefix: Boolean): Il3CString;
   {* ���������� ���� ��� ������� ��������� ������� �� �������� }
function BsFullControlStatusHint(const aUC: IucpUnderControl): Il3CString;
   {* ���������� ���� ��� ������� ��������� ������� �� �������� }
{$IfEnd} //not Admin AND not Monitorings

implementation

{$If not defined(Admin) AND not defined(Monitorings)}
uses
  UnderControlUnit,
  l3String
  {$If not defined(NoVCM)}
  ,
  vcmBase
  {$IfEnd} //not NoVCM
  ,
  StdRes,
  l3Bits,
  l3Base,
  Dialogs
  ;

var
  { ������������ ������ Local }
 str_csStatusChanged : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'csStatusChanged'; rValue : '������ ��������� �� �������� ���������:  %s  ��������� [��. � �������|script:��::��������_�������_�_���������] � ���������');
  { '������ ��������� �� �������� ���������:  %s  ��������� [��. � �������|script:��::��������_�������_�_���������] � ���������' }
 str_csDeletedStatusChanged : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'csDeletedStatusChanged'; rValue : '������ ��������� �� �������� ���������:  %s');
  { '������ ��������� �� �������� ���������:  %s' }
 str_csDeleted : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'csDeleted'; rValue : '������');
  { '������' }
 str_csActive : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'csActive'; rValue : '������� � ����');
  { '������� � ����' }
 str_csChanged : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'csChanged'; rValue : '�������');
  { '�������' }
 str_csAbolished : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'csAbolished'; rValue : '������� ����');
  { '������� ����' }
 str_csRegistered : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'csRegistered'; rValue : '��������������� � ������� ��');
  { '��������������� � ������� ��' }
 str_csNotRegistered : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'csNotRegistered'; rValue : '�������� � ����������� � ������� ��');
  { '�������� � ����������� � ������� ��' }
 str_csDocument : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'csDocument'; rValue : '��������');
  { '��������' }
 str_csDocumentu : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'csDocumentu'; rValue : '���������');
  { '���������' }
 str_csDocumentEvents : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'csDocumentEvents'; rValue : '� ���������� ��������� ��������� �������:');
  { '� ���������� ��������� ��������� �������:' }

var
  { �������� ������ ��� ������� InActualDocumentAction }
 str_InActualDocumentAction_Choice_OpenInternetVersion : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'InActualDocumentAction_Choice_OpenInternetVersion'; rValue : '������� ��������-������');
  { '������� ��������-������' }
 str_InActualDocumentAction_Choice_StayInCurrentEdition : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'InActualDocumentAction_Choice_StayInCurrentEdition'; rValue : '�������� � ������� ��������');
  { '�������� � ������� ��������' }

// unit methods

function BsControlStatusHint(aStatus: Integer;
  aNeedPrefix: Boolean): Il3CString;
//#UC START# *4E7C52D400DA_4E7C528C00BE_var*

 procedure AddSeparator;
 begin
  if not l3IsNil(Result) then
   Result := l3Cat(Result, ', ');
(*   Result := l3Cat(Result, ','#10);*)
 end;

//#UC END# *4E7C52D400DA_4E7C528C00BE_var*
begin
//#UC START# *4E7C52D400DA_4E7C528C00BE_impl*
 Result := nil;
 if (aStatus > 0) then
 begin
  if (l3BitCount(aStatus) = 1) then
  begin
   Case aStatus of
    CS_DELETED:
     Result := l3Cat([str_csDocument.AsCStr, l3CStr(#32), str_csDeleted.AsCStr]);
    CS_ACTIVE:
     Result := l3Cat([str_csDocument.AsCStr, l3CStr(#32), str_csActive.AsCStr]);
    CS_CHANGED:
     Result := l3Cat([str_csDocument.AsCStr, l3CStr(#32), str_csChanged.AsCStr]);
    CS_ABOLISHED:
     Result := l3Cat([str_csDocument.AsCStr, l3CStr(#32), str_csAbolished.AsCStr]);
    CS_REGISTERED:
     Result := l3Cat([str_csDocument.AsCStr, l3CStr(#32), str_csRegistered.AsCStr]);
    CS_NOT_REGISTERED:
     Result := l3Cat([str_csDocumentu.AsCStr, l3CStr(#32), str_csNotRegistered.AsCStr]);
    else
     Assert(false);
   end;//Case aStatus
  end//l3BitCount(aStatus) = 1
  else
  begin
   if (aStatus and CS_NOT_REGISTERED = CS_NOT_REGISTERED) then
   begin
    AddSeparator;
    Result := l3Cat([Result, str_csNotRegistered.AsCStr])
   end;//aStatus and CS_NOT_REGISTERED = CS_NOT_REGISTERED)
   if (aStatus and CS_REGISTERED = CS_REGISTERED) then
   begin
    AddSeparator;
    Result := l3Cat([Result, str_csRegistered.AsCStr])
   end;//aStatus and CS_REGISTERED = CS_REGISTERED
   if (aStatus and CS_ACTIVE = CS_ACTIVE) then
   begin
    AddSeparator;
    Result := l3Cat([Result, str_csActive.AsCStr]);
   end;//aStatus and CS_ACTIVE = CS_ACTIVE
   if (aStatus and CS_CHANGED = CS_CHANGED) then
   begin
    AddSeparator;
    Result := l3Cat([Result, str_csChanged.AsCStr]);
   end;//aStatus and CS_CHANGED = CS_CHANGED
   if (aStatus and CS_ABOLISHED = CS_ABOLISHED) then
   begin
    AddSeparator;
    Result := l3Cat([Result, str_csAbolished.AsCStr])
   end;//aStatus and CS_ABOLISHED = CS_ABOLISHED
   if (aStatus and CS_DELETED = CS_DELETED) then
   begin
    AddSeparator;
    Result := l3Cat([Result, str_csDeleted.AsCStr]);
   end;//aStatus and CS_ACTIVE = CS_ACTIVE
   l3MakeUpperCase(Result.AsWStr.S, 1);
   if aNeedPrefix then
    Result := l3Cat([str_csDocumentEvents.AsCStr, l3CStr(#13#10), Result]);
  end;//l3BitCount(aStatus) = 1
 end;//if aStatus > 0 then
//#UC END# *4E7C52D400DA_4E7C528C00BE_impl*
end;//BsControlStatusHint

function BsFullControlStatusHint(const aUC: IucpUnderControl): Il3CString;
//#UC START# *4E7C531601A3_4E7C528C00BE_var*
var
 l_Status : Integer;
//#UC END# *4E7C531601A3_4E7C528C00BE_var*
begin
//#UC START# *4E7C531601A3_4E7C528C00BE_impl*
 if (aUC <> nil) AND aUC.HasControlStatus then
 begin
  l_Status := aUC.ControlStatus;
  if (l_Status > 0) then
  begin
   if (l_Status and CS_DELETED = CS_DELETED) then
    Result := vcmFmt(str_csDeletedStatusChanged,
                    [bsControlStatusHint(l_Status, false)])
   else
    Result := vcmFmt(str_csStatusChanged,
                    [bsControlStatusHint(l_Status, false)]);
  end//l_Status > 0
  else
   Result := nil;
 end//aUC.HasControlStatus
 else
  Result := nil;
//#UC END# *4E7C531601A3_4E7C528C00BE_impl*
end;//BsFullControlStatusHint
{$IfEnd} //not Admin AND not Monitorings

initialization
{$If not defined(Admin) AND not defined(Monitorings)}
// ������������� str_csStatusChanged
 str_csStatusChanged.Init;
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ������������� str_csDeletedStatusChanged
 str_csDeletedStatusChanged.Init;
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ������������� str_csDeleted
 str_csDeleted.Init;
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ������������� str_csActive
 str_csActive.Init;
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ������������� str_csChanged
 str_csChanged.Init;
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ������������� str_csAbolished
 str_csAbolished.Init;
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ������������� str_csRegistered
 str_csRegistered.Init;
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ������������� str_csNotRegistered
 str_csNotRegistered.Init;
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ������������� str_csDocument
 str_csDocument.Init;
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ������������� str_csDocumentu
 str_csDocumentu.Init;
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ������������� str_csDocumentEvents
 str_csDocumentEvents.Init;
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ������������� str_InActualDocumentAction_Choice_OpenInternetVersion
 str_InActualDocumentAction_Choice_OpenInternetVersion.Init;
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ������������� str_InActualDocumentAction_Choice_StayInCurrentEdition
 str_InActualDocumentAction_Choice_StayInCurrentEdition.Init;
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ������������� str_InActualDocumentAction
 str_InActualDocumentAction.Init;
 str_InActualDocumentAction.AddChoice(str_InActualDocumentAction_Choice_OpenInternetVersion);
 str_InActualDocumentAction.AddChoice(str_InActualDocumentAction_Choice_StayInCurrentEdition);
 str_InActualDocumentAction.AddDefaultChoice(str_InActualDocumentAction_Choice_StayInCurrentEdition);
 str_InActualDocumentAction.SetDlgType(mtConfirmation);
 str_InActualDocumentAction.SetCheckCaption(str_InActualDocumentAction_CheckCaption);
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ������������� str_InActualDocumentAction_CheckCaption
 str_InActualDocumentAction_CheckCaption.Init;
{$IfEnd} //not Admin AND not Monitorings

end.