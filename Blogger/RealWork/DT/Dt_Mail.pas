Unit Dt_Mail;

{ $Id: Dt_Mail.pas,v 1.43 2013/04/19 13:07:39 lulin Exp $ }

// $Log: Dt_Mail.pas,v $
// Revision 1.43  2013/04/19 13:07:39  lulin
// - ���������.
//
// Revision 1.42  2010/09/28 13:06:08  fireton
// - ������������ ������ ��� PAnsiChar ������ ����������
//
// Revision 1.41  2010/02/02 14:06:33  voba
// - enh. ������� ������ �������� �� Tl3StrRecList (��������� Tl3FieldSortRecList)
//
// Revision 1.40  2009/10/14 11:06:00  voba
// - ����������� �� ���������� mg
//
// Revision 1.39  2009/04/13 07:10:58  narry
// - ���������� ����������� ����� � ����������
//
// Revision 1.38  2009/01/26 08:06:17  fireton
// - ������� � ������ b_archi_NewSrch2 (����� ��-������)
//
// Revision 1.37.8.1  2008/12/26 15:22:05  fireton
// - ��������� ����������� �� ������ �� DT_Srch
//
// Revision 1.37  2008/02/01 16:41:34  lulin
// - ���������� �������� ������.
//
// Revision 1.36  2007/08/14 20:25:14  lulin
// - bug fix: �� ���������� ����������.
//
// Revision 1.35  2007/08/14 14:30:08  lulin
// - ������������ ����������� ������ ������.
//
// Revision 1.34  2007/07/24 12:32:33  narry
// - ����������� ������� ���������
//
// Revision 1.33  2006/11/16 10:48:31  fireton
// - ���������� � �������� UserID
//
// Revision 1.32  2006/08/28 12:55:02  narry
// - �� ������� �� ��������� ������ � ����������� �������
//
// Revision 1.31  2006/03/21 07:15:59  narry
// - �����������: �������� ����� � �������
//
// Revision 1.30  2006/03/16 15:50:19  narry
// - ��� ���� ����� � ������� ������-�������
//
// Revision 1.29  2005/12/23 10:34:34  step
// �������������� Host --> Station
//
// Revision 1.28  2005/10/31 09:40:38  step
// ���������� PutMessage/GetMessage: ��� ���������� ��������� ������� (>64k) ���������
//
// Revision 1.27  2005/08/09 15:18:32  voba
// - improve : ������� � NeedAllocStr := False
//
// Revision 1.26  2005/06/23 08:35:54  step
// �������������� SendMessage --> SendNetMessage (�� ��������� ��������)
//
// Revision 1.25  2004/12/23 11:42:13  lulin
// - rename unit: User_Cfg -> l3IniFile.
//
// Revision 1.24  2004/09/14 15:58:14  lulin
// - ������ ������ Str_Man - ����������� ������ ���� - l3String.
//
// Revision 1.23  2004/08/03 08:52:50  step
// ������ dt_def.pas �� DtDefine.inc
//
// Revision 1.22  2004/05/18 09:51:46  step
// change: GlobalHTServer.MaxFamilyID --> GlobalHTServer.FamilyTbl.MaxFamilyID;
//
// Revision 1.21  2004/05/14 07:35:03  voba
// - replace NewSrch to ResetSearchStatus
//
// Revision 1.20  2004/03/29 09:32:44  voba
// no message
//
// Revision 1.19  2004/03/05 16:54:44  step
// ������ ����
//
// Revision 1.18  2002/11/21 17:14:54  law
// - bug fix: ����������� �������������� ��������� MonoUser.
//
// Revision 1.17  2002/01/10 14:14:38  voba
// -lib sincro: replace l3GetStrLen to l3StrLen
//
// Revision 1.16  2001/09/04 13:59:09  voba
// - rename unit: MyUtil -> l3FileUtils.
//
// Revision 1.15  2001/08/08 09:33:36  voba
// - new behavior: new notify procedure type
//
// Revision 1.14  2001/02/22 09:43:36  demon
// - fix grammatic errors in messages
//
// Revision 1.13  2000/12/15 15:36:17  law
// - ��������� ��������� Log.
//

{$I DtDefine.inc}

Interface
Uses
 SysUtils, Classes,
 l3Types, l3IniFile, l3Date,
 l3_String, {l3DatLst,} l3StrRecList,
 l3InternalInterfaces,
 Dt_Types,
 CsClient, csNotification, csMessageManager;
Const
 MailFileName = 'MailBox.ini';
 mlWasRead = $80;

Type
 TMailType = (mlNone,mlSrch,mlDoc,mlDocList);
 TMailArrivedEvent = procedure(Sender: TObject; aMailID : LongInt) of object;


 PMailRec = ^TMailRec;
 TMailRec = record
              rName     : Tl3_String;
              rID       : LongInt;
              rMType    : Byte;
              rFromUser : TUserID;
              rDateTime : TStDateTimeRec;
             end;

 TMailServer = Class(Tl3StrRecList, Il3HandledStringList)
  private
   f_CSClient: TcsClient;
   f_MessageManager: TcsMessageManager;
   procedure pm_SetCSClient(const Value: TcsClient);
   procedure pm_SetMessageManager(const Value: TcsMessageManager);
  protected
   fLastDateTime  : TStDateTimeRec;
   fOnMailArrived : TMailArrivedEvent;

   Function   GetMessage(DataName : TFileName) : PAnsiChar;
   Procedure  PutMessage(DataName : TFileName;aMessage : PAnsiChar);
   Function   AddMailToList(aMailFile : TCfgList;aMailID : LongInt) : TStDateTimeRec;

   function   pm_GetHandle(anIndex: Integer): Integer;
   procedure  pm_SetHandle(anIndex: Integer; aValue: Integer);
   function   pm_GetItems(anIndex: Integer): Tl3PCharLen;
   procedure  pm_SetItems(anIndex: Integer; const aValue: Tl3PCharLen);
   function   pm_GetCount: Integer;

  public
   Constructor Create; virtual;
   function   CSNotifyProc(aNotificationType: TCsNotificationType; aNumber: Integer; const aText: AnsiString): Boolean;

   Function   LoadMailList : TStDateTimeRec;

   procedure  ReciveMessage(aMessageNumber : Integer);

   Procedure  LoadMail(aMailIndex : LongInt;Var aMessage : PAnsiChar;Var aData : Pointer);

   Procedure  Delete(aMailIndex : LongInt); //override;

   function   SendMail(MailType : TMailType; UserID : TUserID;aName : ShortString;aMessage : PAnsiChar; aData : Pointer): Boolean;

   procedure  MarkRead(aMailIndex : Longint);
   function   IndexbyID(aID : Integer) : Integer;

   property  CSClient: TcsClient read f_CSClient write pm_SetCSClient;
   property  MessageManager: TcsMessageManager read f_MessageManager write pm_SetMessageManager;
   Property  LastDateTime : TStDateTimeRec read fLastDateTime;
   Property  OnMailArrived : TMailArrivedEvent read fOnMailArrived write fOnMailArrived;
 end;

Const
 MailServer : TMailServer = Nil;

Implementation
Uses
 WinTypes,

 l3Base,
 l3String,
 l3Stream,
 l3FileUtils,
 l3InterfacedString,

 Dt_Const, Dt_Serv, Dt_Err, Dt_User,
 Dt_Doc,

 csDataPipe, csQueryTypes;

type
 TSendMailQuery = class(Tl3Base)
 public
  MailNumber: Integer;
  Recepient: Integer;
  procedure Write2Pipe(aPipe: TcsDataPipe);
 end;

(************************* TMailList ***************************)

Constructor TMailServer.Create;
Begin
 Inherited Create(SizeOf(TMailRec), [SizeOf(PMailRec(nil).rName),
                                     SizeOf(PMailRec(nil).rID),
                                     SizeOf(PMailRec(nil).rMType),
                                     SizeOf(PMailRec(nil).rFromUser),
                                     SizeOf(PMailRec(nil).rDateTime.D),
                                     SizeOf(PMailRec(nil).rDateTime.T)],
                                     [-5, -6]);
end;

Function TMailServer.GetMessage(DataName : TFileName) : PAnsiChar;
Var
 DtFile   : Tl3FileStream;
 TmpSize  : Longint;
Begin
 Result:=Nil;
 DtFile:=Tl3FileStream.Create(DataName,l3_fmRead);
 Try
  DtFile.ReadBuffer(TmpSize,SizeOf(TmpSize));
  Result := l3StrAlloc(TmpSize+1);
  DtFile.ReadBuffer(Result^,TmpSize);
  Result[TmpSize]:=#0;
 finally
  l3Free(DtFile);
 end;
end;

Procedure TMailServer.PutMessage(DataName : TFileName;aMessage : PAnsiChar);
Var
 DtFile   : Tl3FileStream;
 TmpSize  : Longint;
Begin
 DtFile:=Tl3FileStream.Create(DataName,l3_fmWrite);
 Try
  TmpSize:=l3StrLen(aMessage);
  DtFile.WriteBuffer(TmpSize,SizeOf(TmpSize));
  DtFile.WriteBuffer(aMessage^,TmpSize);
 finally
  l3Free(DtFile);
 end;
end;

Function TMailServer.AddMailToList(aMailFile : TCfgList; aMailID : LongInt) : TStDateTimeRec;
Var
 lStr       : ShortString;
 TmpPChar   : PAnsiChar;
 TmpIndex   : LongInt;
 lRec       : TMailRec;
Begin
 Changing;
 l3FillChar(lRec, SizeOf(lRec));
 Result.D := 0;
 Result.T := 0;
 lRec.rID := aMailID;

 aMailFile.Section := 'MAIL' + IntToStr(aMailID);
 if aMailFile.ReadParamStr('Name', lStr) then
 begin
  lRec.rName := Tl3InterfacedString.Make(l3PCharLen(lStr));

  if aMailFile.ReadParamStr('Type', lStr) then
   lRec.rMType := StrToInt(lStr);

  if aMailFile.ReadParamStr('FromUser', lStr) then
   lRec.rFromUser := TDictID(StrToInt(lStr));

  aMailFile.ReadParamRec('DateTime', 'DD', Result);
  lRec.rDateTime := Result;
  Add(lRec);
 end;
 Changed;
end;

function TMailServer.CSNotifyProc(aNotificationType: TCsNotificationType; aNumber: Integer; const aText: AnsiString):
    Boolean;
begin
 if aNotificationType = ntMailArrived then
 begin
  Result := True;
  ReciveMessage(aNumber);
 end
 else
  Result := False;
end;

Function TMailServer.LoadMailList;
Var
 MailFile : TCfgList;
 J,MaxJ   : LongInt;
 TmpDate  : TStDateTimeRec;
Begin
 Changing;
 try
  fLastDateTime.D:=0;
  fLastDateTime.T:=0;
  if (Not l3FileUtils.FileExists(GlobalHTServer.CurHomePath+MailFileName)) then
   exit;

  MailFile := TCfgList.Create(GlobalHTServer.CurHomePath+MailFileName);
  try
   MailFile.Section:='MAIN';
   MailFile.ReadParamInt('MaxMail',MaxJ);
   for J := 1 to MaxJ do
   begin
    TmpDate := AddMailToList(MailFile, J);
    if fLastDateTime.D < TmpDate.D then
     fLastDateTime:=TmpDate
    else
     if (fLastDateTime.D = TmpDate.D) and
          (fLastDateTime.T < TmpDate.T) then
      fLastDateTime := TmpDate;
   end;
   Sorted := True;
  finally
   l3Free(MailFile);
  end;
 finally
  Changed;
 end;
end;

Procedure TMailServer.LoadMail(aMailIndex : LongInt;Var aMessage : PAnsiChar;Var aData : Pointer);
Var
 MailID    : LongInt;
 MailFile  : TCfgList;
 DataName  : TPathStr;

 lStr    : ShortString;
 TmpType   : Byte;
Begin
 MailID:=PMailRec(ItemSlot(aMailIndex))^.rID;

 If Not l3FileUtils.FileExists(GlobalHTServer.CurHomePath+MailFileName)
  then
   raise Exception.Create('INI ���� ��������� ����� �� ������!'#13+
                          '�������� ����������.');
 MailFile:=TCfgList.Create(GlobalHTServer.CurHomePath+MailFileName);
 Try
  MailFile.Section:='MAIL'+IntToStr(MailID);
  If Not MailFile.ReadParamStr('Type',lStr)
   then
    raise Exception.Create('INI ���� ��������� ����� ��������!'#13+
                           '�������� ����������.');
  TmpType:=StrToInt(lStr) and Not mlWasRead;
  If Not MailFile.ReadParamStr('File',DataName)
   then
    raise Exception.Create('INI ���� ��������� ����� ��������!'#13+
                           '�������� ����������.');
  If Not l3FileUtils.FileExists(GlobalHTServer.CurHomePath+DataName)
   then
    raise Exception.Create('������� ���� ������ ��������� �����!'#13+
                           '�������� ����������.');

  Case TMailType(TmpType) of
   mlNone :
    Begin
     aData:=Nil;
     aMessage:=GetMessage(GlobalHTServer.CurHomePath+DataName);
    end;
   mlSrch :
    Assert(False, 'TMailServer.LoadMail - mlSrch: �������� �� �������������');
    {
    Begin
     If TSrchServer(aData)=Nil
      then
       aData:=TSrchServer.Create;

     If Not MailFile.ReadParamStr('Family',TmpStr)
      then
       raise Exception.Create('INI ���� ��������� ����� ��������!'#13+
                              '�������� ����������.');
     TSrchServer(aData).Family:=StrToInt(TmpStr);
     TSrchServer(aData).ResetSearchStatus;
     If (TSrchServer(aData).Family>GlobalHtServer.FamilyTbl.MaxFamilyID) or
        (TSrchServer(aData).Family=MainTblsFamily)
      then
       raise Exception.Create('������������ ����� ���������!'#13+
                              '�������� ����������.');

     TSrchServer(aData).LoadAsk(srchDocs,GlobalHTServer.CurHomePath+DataName,aMessage,False);
    end;
    }
   mlDoc  :
    Begin
     aMessage:=GetMessage(GlobalHTServer.CurHomePath+DataName);
     If Not MailFile.ReadParamStr('DocID',lStr)
      then
       raise Exception.Create('INI ���� ��������� ����� ��������!'#13+
                              '�������� ����������.');
     aData:=Pointer(StrToInt(lStr));
    end;
   mlDocList  :
    Begin
     If TDocumentSabList(aData)=Nil
      then
       aData:=TDocumentSabList.Create;

     If Not MailFile.ReadParamStr('Family',lStr)
      then
       raise Exception.Create('INI ���� ��������� ����� ��������!'#13+
                              '�������� ����������.');
     TDocumentSabList(aData).Family:=StrToInt(lStr);
     If (TDocumentSabList(aData).Family>GlobalHtServer.FamilyTbl.MaxFamilyID) or
        (TDocumentSabList(aData).Family=MainTblsFamily)
      then
       raise Exception.Create('������������ ����� ���������!'#13+
                              '�������� ����������.');

     TDocumentSabList(aData).LoadList(GlobalHTServer.CurHomePath+DataName,aMessage);
    end;
  end;
 finally
  l3Free(MailFile);
 end;
end;

Procedure TMailServer.Delete(aMailIndex : LongInt);
Var
 MailID   : LongInt;
 MailFile : TCfgList;
 DataName : TPathStr;
 lStr   : ShortString;
Begin
 MailID:=PMailRec(ItemSlot(aMailIndex))^.rID;
 If l3FileUtils.FileExists(GlobalHTServer.CurHomePath + MailFileName)
  then
   Begin
    MailFile:=TCfgList.Create(GlobalHTServer.CurHomePath + MailFileName);
    Try
     lStr:=IntToStr(MailID);
     MailFile.Section:='MAIL' + lStr;
     MailFile.ReadParamStr('File', DataName);
     MailFile.DeleteSection('MAIL'+lStr);
     SysUtils.DeleteFile(GlobalHTServer.CurHomePath+DataName);
    finally
     l3Free(MailFile);
    end;
   end;
 Inherited Delete(aMailIndex);
end;

function TMailServer.SendMail(MailType : TMailType; UserID : TUserID; aName : ShortString;aMessage : PAnsiChar; aData :
    Pointer): Boolean;
Var
 MailFile    : TCfgList;
 J,MaxJ,
 CurSection  : LongInt;
 DataName    : TFileName;
 lStr      : ShortString;

 SUserPath   : TPathStr;

 TmpRecPos,
 TmpMessage  : PAnsiChar;
 TmpLen      : Word;
 FlH         : Integer;

 CurDateTime : TStDateTimeRec;
 l_Query : TSendMailQuery;
Begin
 Result := False;
 If (MailType = mlSrch) {and
    ((TSrchServer(aData)=Nil) or (TSrchServer(aData).SrchType = srchNone))}
  then raise EHtErrors.CreateInt(ecSrchEmpty);

 If (MailType = mlDoc) and (LongInt(aData) = 0)
  then raise EHtErrors.CreateInt(ecEmpty);

 If (MailType = mlDocList) and (TDocumentSabList(aData) = Nil)
  then raise EHtErrors.CreateInt(ecEmpty);

 SUserPath:=GlobalHTServer.GetHomePath(UserID);

 If Not l3FileUtils.FileExists(SUserPath+MailFileName)
  then
   Begin
    FlH:=FileCreate(SUserPath+MailFileName);
    FileClose(FlH);
    MailFile:=TCfgList.Create(SUserPath+MailFileName);
    MailFile.Section:='MAIN';
    MailFile.WriteParamInt('MaxMail',1);
   end
  else
   MailFile:=TCfgList.Create(SUserPath+MailFileName);
 Try
  MailFile.Section:='MAIN';
  MailFile.ReadParamInt('MaxMail',MaxJ);
  For J:=1 to MaxJ do
   Begin
    MailFile.Section:='MAIL'+IntToStr(J);
    If Not MailFile.ReadParamStr('Name',lStr)
     then
      Begin
       If J = MaxJ
        then
         Begin
          MailFile.Section:='MAIN';
          MailFile.WriteParamInt('MaxMail',MaxJ+1);
         end;
       CurSection:=J;
       MailFile.Section:='MAIL'+IntToStr(J);
       break;
      end;
   end;

  If aName=''
   then
    aName:='...�� '+UserManager.UserTbl.GetNameStr(GlobalHTServer.CurUserID);
  MailFile.WriteParamStr('Name',aName);
  DataName:=GetUniqFileName(SUserPath,'Mail','.dat',False);
  MailFile.WriteParamStr('Type',IntToStr(Byte(MailType)));
  MailFile.WriteParamStr('File',DataName);
  MailFile.WriteParamStr('FromUser',IntToStr(GlobalHTServer.CurUserID));
  With CurDateTime do
   Begin
    D:=CurrentDate;
    T:=CurrentTime;
   end;
  MailFile.WriteParamRec ('DateTime','DD',CurDateTime);

  Case MailType of
   mlNone : PutMessage(SUserPath+DataName,aMessage);
   mlSrch :
     Assert(False, 'TMailServer.LoadMail - mlSrch: �������� �� �������������');
     {
     Begin
      MailFile.WriteParamStr('Family',IntToStr(TSrchServer(aData).Family));
      TSrchServer(aData).SaveAsk(srchDocs,SUserPath+DataName,aMessage);
     end;
     }
   mlDoc :
     Begin
      MailFile.WriteParamStr('DocID',IntToStr(LongInt(aData)));
      PutMessage(SUserPath+DataName,aMessage);
     end;
   mlDocList :
     Begin
      MailFile.WriteParamStr('Family',IntToStr(TDocumentSabList(aData).Family));
      TDocumentSabList(aData).SaveList(SUserPath+DataName,aMessage);
     end;
  end;
 finally
  l3Free(MailFile);
 end;
 {$IFNDEF MonoUser}
 if (g_AppKind = akClient) and (CSClient <> nil) then
 begin
  l_Query := TSendMailQuery.Create(nil);
  try
   l_Query.Recepient := UserID;
   l_Query.MailNumber := CurSection;
   Result := CSClient.Exec(qtSendMail, l_Query.Write2Pipe);
  finally
   l3Free(l_Query);
  end;
 end
 else
 if (g_AppKind = akServer) and (MessageManager <> nil) then
 begin
  MessageManager.SendNotify(UserID, ntMailArrived, CurSection, '');
 end;
 (*
 If GlobalHTServer.SendServ <> Nil
  then
   Begin
    lStr:=StationJornal.GetHostName(UserID);
    //TmpStr:=StationJornal.GetStationName(UserID);
    If TmpStr<>''
     then
      Begin
       TmpLen:=msPrefLength+SizeOf(LongInt);
       TmpMessage := l3StrAlloc(TmpLen);
       Try
        l3Move(msChkMl,TmpMessage^,msPrefLength);
        TmpRecPos:=TmpMessage+msPrefLength;
        l3Move(CurSection,TmpRecPos^,SizeOf(LongInt));
        GlobalHTServer.SendNetMessage(TmpStr,TmpMessage,TmpLen);
       finally
        l3StrDispose(TmpMessage);
       end;
      end;
   end;
  *)
 {$ENDIF}
end;

Procedure TMailServer.MarkRead(aMailIndex : LongInt);
Var
 MailID   : LongInt;
 MailFile : TCfgList;
 lStr   : ShortString;
 lRec  : PMailRec;
Begin
 lRec := PMailRec(ItemSlot(aMailIndex));

 MailID := lRec^.rID;
 lRec^.rMType := lRec^.rMType or mlWasRead;
 If l3FileUtils.FileExists(GlobalHTServer.CurHomePath + MailFileName)
  then
   Begin
    MailFile := TCfgList.Create(GlobalHTServer.CurHomePath + MailFileName);
    Try
     lStr := IntToStr(MailID);
     MailFile.Section := 'MAIL' + lStr;
     MailFile.ReadParamStr('Type', lStr);
     MailFile.WriteParamStr('Type', IntToStr(Byte(StrToInt(lStr)) or mlWasRead));
    finally
     l3Free(MailFile);
    end;
   end;
end;

function TMailServer.IndexbyID(aID : Integer) : Integer;
var
 I : Integer;
begin
 Result := -1;
 for I := 0 to pred(Count) do
  if PMailRec(ItemSlot(I)).RID = aID then
  begin
   Result := I;
   Exit;
  end;
end;

procedure TMailServer.pm_SetCSClient(const Value: TcsClient);
begin
 if f_CSClient <> Value then
 begin
  f_CSClient := Value;
  f_CSClient.AddNotifyProc(CSNotifyProc);
 end;
end;

procedure TMailServer.pm_SetMessageManager(const Value: TcsMessageManager);
begin
 if f_MessageManager <> Value then
 begin
  f_MessageManager := Value;
 end;
end;

procedure TMailServer.ReciveMessage(aMessageNumber : Integer);
Var
 MailFile : TCfgList;
 TmpDate  : TStDateTimeRec;
Begin
 If (Not l3FileUtils.FileExists(GlobalHTServer.CurHomePath+MailFileName)) then
   exit;

 MailFile:=TCfgList.Create(GlobalHTServer.CurHomePath+MailFileName);
 Try
  TmpDate:= AddMailToList(MailFile, aMessageNumber);
  If Assigned(OnMailArrived) then OnMailArrived(Self, aMessageNumber);
  If fLastDateTime.D<TmpDate.D then
    fLastDateTime:=TmpDate
   else
    If (fLastDateTime.D=TmpDate.D) and
       (fLastDateTime.T<TmpDate.T) then
      fLastDateTime:=TmpDate;
 finally
  l3Free(MailFile);
 end;
end;

function  TMailServer.pm_GetHandle(anIndex: Integer): Integer;
begin
 Result := PMailRec(ItemSlot(anIndex)).RID;
end;

procedure TMailServer.pm_SetHandle(anIndex: Integer; aValue: Integer);
begin
 Assert(False);
end;

function  TMailServer.pm_GetItems(anIndex: Integer): Tl3PCharLen;
begin
 Result := Tl3PCharLen(PMailRec(MailServer.ItemSlot(anIndex)).rName.AsWStr);
end;

procedure TMailServer.pm_SetItems(anIndex: Integer; const aValue: Tl3PCharLen);
begin
 Assert(False);
end;

function  TMailServer.pm_GetCount: Integer;
begin
 Result := Count;
end;

procedure TSendMailQuery.Write2Pipe(aPipe: TcsDataPipe);
begin
 aPipe.Write(Recepient);
 aPipe.Write(MailNumber);
end;



end.
