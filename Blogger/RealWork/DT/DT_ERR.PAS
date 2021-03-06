Unit Dt_err;

{ $Id: DT_ERR.PAS,v 1.29 2013/04/19 13:07:39 lulin Exp $ }

// $Log: DT_ERR.PAS,v $
// Revision 1.29  2013/04/19 13:07:39  lulin
// - ���������.
//
// Revision 1.28  2008/04/04 15:16:32  fireton
// - ������� ������ ���������� �� ���������
//
// Revision 1.27  2008/02/06 16:16:31  voba
// no message
//
// Revision 1.26  2007/02/12 16:11:00  voba
// - ������� ������������� htModifyRecs �� ����� TAbsHtTbl.ModifyRecs
// - ������� TdtTable � ������ dt_Table (������� ������ ������� HyTech �� ������ � �������� �������)
// - ������� ������� HyTech �� ������ � Sab � dt_Sab, ����� ������ ������
//
// Revision 1.25  2006/12/01 11:39:05  voba
// no message
//
// Revision 1.24  2006/08/29 15:28:08  voba
// - add procedure HTErr_NeedStackOut
//
// Revision 1.23  2005/10/21 08:09:36  step
// ������ StrAlloc �� EHtErrors.CreateInt
//
// Revision 1.22  2005/04/28 15:04:06  lulin
// - ��������� ����� B_Tag_Box � HEAD.
//
// Revision 1.21  2005/04/25 08:56:48  voba
// - add type of exception
//
// Revision 1.20.12.1  2005/04/25 14:05:05  lulin
// - bug fix: �� �������������� ����������.
//
// Revision 1.21  2005/04/25 08:56:48  voba
// - add type of exception
//
// Revision 1.20  2005/01/20 09:27:55  step
// ��������� ����� ���������� (�� ������� �����)
//
// Revision 1.19  2004/08/03 08:52:50  step
// ������ dt_def.pas �� DtDefine.inc
//
// Revision 1.18  2004/07/22 10:33:49  voba
// - ������� ��������� ��������� ecUnableUpd
//
// Revision 1.17  2004/07/16 14:55:36  step
// ��������� ����� ������
//
// Revision 1.16  2004/01/14 11:53:13  step
// ��������� const ecCanNotRead
//
// Revision 1.15  2003/05/06 14:04:57  step
// ��������� �������� �� ������������� ������ � TDocumentData.GetVersionsList
//
// Revision 1.14  2003/04/29 15:47:27  voba
// - ������� ���� ��������� �� ������
//
// Revision 1.13  2003/04/16 09:19:00  voba
// - improvement: ��������� ����������� �������� ���������� � ��������� �� exception
//
// Revision 1.12  2003/03/13 10:03:20  demon
// - new: ecIDAlreadyUsed (������� �������� ������������ �������������)
//
// Revision 1.11  2003/01/16 15:30:35  demon
// - new behavior: ����� ������ - �� ����� ������������� (��� �������� ���������� � �����)
//
// Revision 1.10  2002/01/16 11:03:06  demon
// - cleanup HtDebugInfo and merge with tag NullJournal_bug
//
// Revision 1.9.2.2  2001/09/06 12:05:53  narry
// - change: ������������� � Delphi 6.
//
// Revision 1.9.2.1  2001/07/09 15:28:47  demon
// no message
//
// Revision 1.9  2001/04/18 08:51:37  voba
// �������� ����������. ������, �� ��������� :)
//
// Revision 1.8  2000/12/15 15:36:15  law
// - ��������� ��������� Log.
//

{$I DtDefine.inc}

Interface
Uses
 Dt_Types,
 SysUtils;

Const
 ecOk                 =  0;
 ecNotFound           =  101;
 ecNotEmpty           =  102;
 ecTblNotOpen         =  103;
 ecTblOpen            =  104;
 ecUnableDel          =  105;
 ecNotFamilyID        =  106;
 ecFreeTblErr         =  107;
 ecNotFreeMem         =  108;
 ecUnableUpd          =  109;
 ecSrchNotOpen        =  110;
 ecPathNotFound       =  111;
 ecLocked             =  112;
 ecImportAbort        =  113;
 ecNotAssigned        =  114;
 ecNotGroup           =  115;
 ecUnSynhronize       =  116;
 ecNotEnable          =  117;
 ecNotUniqName        =  118;
 ecCircleLabel        =  119;
 ecTooManyElements    =  120;
 ecFamilyLocked       =  121;
 ecUnableLockFamily   =  122;
 ecAccessDenied       =  123;
 ecEmpty              =  124;
 ecNotField           =  125;
 ecInvalidHome        =  126;
 ecSrchEmpty          =  127;
 ecNotValidSrchType   =  128;
 ecNotValidSab        =  129;
 ecDataCorrupted      =  130;
 ecNotKeyField        =  131;
 ecNotUniqID          =  132;
 ecIDNotAssigned      =  133;
 ecIDAlreadyUsed      =  134;
 ecIDAlreadyUsedParam =  135;
 ecIDAlreadyUsedInDoc =  136;
 ecWrongVerLink       =  137;
 ecCanNotRead         =  138;
 ecWrongFieldNumber   =  139;
 ecWrongFieldValue    =  140;
 ecFullRecordNotInit  =  141;
 ecUserRejectedOperation = 142;
Type
 ETableError = class(Exception);

 EHtErrors = Class(Exception)
  ErrorValue : Integer;
  Constructor CreateInt(ErrCode : Integer); overload;
  Constructor CreateInt(ErrCode : Integer; const Params : array of const); overload;
 end;

 EHtErrors_IDAlreadyUsed = Class(EHtErrors)
 end;

 EHtErrors_LockTblError = class(EHterrors)
 end;

 function  DTErrMsg(ErrCode : Integer) : ShortString;
 function  Ht(ID : Integer) : LongInt;

 procedure HTErr_NeedStackOut(aErrNum : Integer);
  {* - ���������� �� DT_Serv.fn_OnIOError, ������� ���� ������������� ��������� ���� � ���, ������� ����������� � Ht() }
Implementation
Uses
 HT_Dll,
 l3Base;

var
 lNeedStackOut_ErrNum : Integer = 0;

procedure HTErr_NeedStackOut(aErrNum : Integer);
begin
 lNeedStackOut_ErrNum := aErrNum;
end;

Constructor EHtErrors.CreateInt(ErrCode : Integer);
begin
 CreateInt(ErrCode, []);
end;

Constructor  EHtErrors.CreateInt(ErrCode : Integer; const Params : array of const);
var
 ErrStr : AnsiString;
 l_Buff220: array[0..220] of AnsiChar;
begin
 if ErrCode<>0 then
 begin
  if ErrCode<0 then
  begin
   {��� ������ � ���������� �� ������ HT}
   htMessage(ErrCode, @l_Buff220);
   ErrStr:=SysUtils.Format('%s; Code: %d', [PAnsiChar(@l_Buff220), ErrCode]);
  end
  else
   {��� ������ � ���������� �� ������ ������ ���������}
   ErrStr:=DTErrMsg(ErrCode);

  if High(Params) >= Low(Params) then
   ErrStr:=Format(ErrStr, Params);
 end
 else
  ErrStr:='������ ��� !!!';

 Inherited Create(ErrStr);
 ErrorValue:=ErrCode;
end;

Function DTErrMsg(ErrCode : Integer) : ShortString;
Begin
 Case ErrCode of
  ecOk               : Result:= '������ ���';
  ecNotFound         : Result:= '������� �� ������';
  ecTblNotOpen       : Result:= '������� �� �������';
  ecSrchNotOpen      : Result:= '������� �� �������';
  ecTblOpen          : Result:= '������� �������';
  ecUnableDel        : Result:= '�������� ����������';
  ecUnableUpd        : Result:= '���������� ��������� ����������';
  ecNotEmpty         : Result:= '������� �� ������';
  ecEmpty            : Result:= '������� ������';
  ecNotFamilyID      : Result:= '��������� ������ �� ������';
  ecFamilyLocked     : Result:= '��������� ������ �������';
  ecUnableLockFamily : Result:= '���������� ������� ��������� ������';
  ecFreeTblErr       : Result:= '������ ��������� ���������� ������';
  ecNotFreeMem       : Result:= '���� ��������� ������';
  ecPathNotFound     : Result:= '���� �� ������';
  ecLocked           : Result:= '������� ������';
  ecImportAbort      : Result:= '������ ������ �� ������';
  ecNotAssigned      : Result:= '�������� �������� �� ������';
  ecNotGroup         : Result:= '������ �����������';
  ecUnSynhronize     : Result:= '����������������';
  ecNotEnable        : Result:= '�������� ����������';
  ecNotUniqName      : Result:= '��� �� ����������';
  ecCircleLabel      : Result:= '����������� ������';
  ecTooManyElements  : Result:= '������� ����� ���������';
  ecAccessDenied     : Result:= '��� ���� ��� �������';
  ecNotField         : Result:= '�� ���� �������';
  ecInvalidHome      : Result:= '�������� ������ �������';
  ecSrchEmpty        : Result:= '������� ������';
  ecNotValidSrchType : Result:= '�������� ��� �������';
  ecNotValidSab      : Result:= '������������ ���';
  ecDataCorrupted    : Result:= '�������� ��������� ������ �������';
  ecNotKeyField      : Result:= '���� �� ��������';
  ecNotUniqID        : Result:= '������������ �������������';
  ecIDNotAssigned    : Result:= '������������� �� �����';
  ecIDAlreadyUsed    : Result:= '������������� ��� ������������';
  ecIDAlreadyUsedParam  : Result:= '������������� %d ��� ������������';
  ecIDAlreadyUsedInDoc : Result:= '������������� #%d ��� ������������ (� ��������� #%d)';
  ecWrongVerLink     : Result:= '��������� ���� � ������ �������� ���������';
  ecCanNotRead       : Result:= '������ ��� ������ ����������� ������';
  ecWrongFieldNumber : Result:= '�������� ����� ���� �������';
  ecWrongFieldValue  : Result:= '�������� %s ����������� ��� ���� %s ������� %s.';
  ecFullRecordNotInit: Result:= 'fFullRecord �� ���������������';
  ecUserrejectedOperation: Result:= '�������� ���������� �������������';
  else
   Result:= '����������� ������';
 end;
end;

function Ht(ID : LongInt) : LongInt;
{var
 nDosError : SmallInt; // ���� ������� ���, ������������ ���
 nOperation: SmallInt; // ���� ������� ��� ��������, ��������� � ������
 lErrstr : array[0..1000] of AnsiChar;
 lErrstr2 : PAnsiChar;
}
begin
 Result := ID;

 if lNeedStackOut_ErrNum <> 0 then
 begin
  l3System.Stack2Log(Format('HTERROR = %d STACK OUT', [lNeedStackOut_ErrNum]));
  lNeedStackOut_ErrNum := 0;
 end;

{ if ID = -1 then
  lErrstr2 := htExtError(nDosError, nOperation, @lErrstr[0]);
}
 if ID < 0 then
  raise EHtErrors.CreateInt(ID);
end;
end.