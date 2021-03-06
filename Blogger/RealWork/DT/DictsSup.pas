unit DictsSup;

{ $Id: DictsSup.pas,v 1.15 2013/04/19 13:07:39 lulin Exp $ }

interface
 Uses
  SysUtils, Classes, Graphics,
  k2Interfaces,
  l3DatLst,

  DT_Const,
  DT_Types,
  dt_AttrSchema,
  DT_Serv,
  DT_Dict,
  DT_Link,
  DT_Doc,
  DT_User,
  DT_Active,
  DT_Alarm,
  dt_DictTypes,
  l3Date,
  StDateSt;

 function GetAttrName(aAttrID : TdtAttribute) : AnsiString;
 function GetDictName(aDictID : TDLType) : AnsiString;
 //function GetAttrType(aAttrID : TdtAttribute) : TAttrType;
 function GetDictNameLength(aAttrID : TDLType) : integer;
 function GetAssGroupName(piAssGroupID : integer) : AnsiString;
 function GetAssMaskStr(aMask : Longint) : AnsiString;
 function GetAttrStructSize(aAttrID : TdtAttribute) : Integer;
 function GetAttrLogType(aAttrID : TdtAttribute; out aLogAction : TLogActionType) : Boolean;

 function GenIssueString(var aRec : TPublishedDictRec) : AnsiString;

 //function GetDNTypeName(aDNType : TDNType) : AnsiString;
 //procedure GetDNTypeList(aLst : TStrings);
 function GetLogJrnlName(aAction : TLogActionType): AnsiString;

 //function GenDateDiapasonString(aDateBounds : Tl3DateBounds) : AnsiString;

 //procedure GetDictItemBitmap(aAttrID : TdtAttribute; var ItemBMP: TBitmap);
 //procedure GetDictBitmap(aAttrID : TdtAttribute; var ItemBMP : TBitmap);
 function  GetDictItemImageIndex(aDictID : TDLType) : integer;
 function  GetDictImageIndex(aDictID : TDLType) : integer;

 function  AttributeIDToJournalAction(aAttrID : TdtAttribute) : TLogActionType;
 function  DictIDToJournalAction(aAttrID : TDLType) : TLogActionType;

 function IsLegalAttr(aDocType : TDocType; aAttrID : TdtAttribute) : Boolean;

 function MakeDateNumRec(aDate : TStDate; const aNum : AnsiString; aTyp : TDNType) : TDNDictRec;
 function MakeActiveIntervalRec(aStart, aFinish  : TStDate; const aComment : AnsiString = '') : TActiveIntervalRec;


function GetDictExtParams(aAttrID : TDLType) : TDictExtParams;
function GetDictExtNeedFillParams(aAttrID : TDLType) : TDictExtParams;

resourcestring
 rsCorSourcesDefItem = '[�������� �� ��������]';

implementation

uses
  l3Base,
  l3String,
  l3DateSt,
  l3Bits,
  l3IniFile,

  k2Tags,
  Com_Cnst,
  ResShop, //StrShop, IniShop,
  dt_DictConst,
  dt_LinkServ;
function IsLegalAttr(aDocType : TDocType; aAttrID : TdtAttribute) : Boolean;
begin
 Case aDocType of
  DT_Types.dtText    : Result := aAttrID in GlMainAttrSet + GlSubAttrSet;
  DT_Types.dtObject  : Result := aAttrID in GlMainAttrSetForObject;
  else                 Result := False;
 end;
end;


function GenIssueString(var aRec : TPublishedDictRec) : AnsiString;
var
// D1, M1, Y1,
// D2, M2, Y2 : Integer;
 CStr       : AnsiString;
begin
 Result := '';
 with aRec do
  begin
   (*
   try
    If Sour > 0 then
     Result := DictServer.DictTbl[dlCorSources].GetNameStr(Sour);
   except
   end;
   *)

   if SDate <> BlankDate then
    Result := Result + MakeHRDateIntervalStr(SDate, EDate);
    (*
   begin
    StDateToDMY(SDate, D1, M1, Y1);
    if SDate = EDate then
     Result := Result + Format(' %d/%d/%d', [D1, M1, Y1])
    else
    begin
     StDateToDMY(EDate, D2, M2, Y2);
     if (Y1 = Y2) and (M1 = M2) and (D1 = 1) and (D2 = DaysInMonth(M1, Y1)) then
      Result := Result + Format(' %d/%d', [M1, Y1])
     else
      if (Y1 = Y2) and (M1 = 1) and (M2 = 12) and (D1 = 1) and (D2 = 31) then
       Result := Result + Format(' %d', [Y1])
      else
       Result := Result + Format(' %d/%d/%d-%d/%d/%d', [D1, M1, Y1, D2, M2, Y2]);
    end;
   end;
   *)

   CStr := l3ArrayToString(Num, SizeOf(Num));
   if Length(CStr) > 0 then Result := Result + Format(' �%S', [CStr]);

   CStr := l3ArrayToString(Comment, SizeOf(Comment));
   If Length(CStr) > 0 then Result := Result + ' (' + CStr + ')';
  end;
end;

function GetAssMaskStr(aMask : Longint) : AnsiString;
var
 I : integer;
begin
 Result := '';
 I := 1;
 While aMask <> 0 do
 begin
  If (aMask and I) > 0 then
  begin
   If Result <> '' then Result := Result + ', ';
   Result := Result + GetAssGroupName(I);
   aMask := aMask and Not I;
  end;
  I := I shl 1;
 end;
end;

function GetAssGroupName(piAssGroupID : integer) : AnsiString;
var
 l_Res: AnsiString;

 procedure CheckGroup(aMask: Integer; aName: AnsiString);
 begin
  if l3TestMask(piAssGroupID, aMask) then
  begin
   if l_Res <> '' then
    l_Res := l_Res + ', ';
   l_Res := l_Res + aName;
  end;
 end;

begin
 l_Res := '';
 CheckGroup(romNameAttr,  '��������');
 CheckGroup(romText,      '����� � �������');
 CheckGroup(romHyperLink, '�����������');
 CheckGroup(romBlock,     '�����');
 CheckGroup(romSub,       '�����');
 CheckGroup(romKeyWord,   '�������� �����');
 CheckGroup(romClass,     '������');
 CheckGroup(romJurOp,     '����������� ��������');
 CheckGroup(romAnno,      '���������');
 CheckGroup(romDocGroup,  '������ ����������');
 Result := l_Res;
 //If piAssGroupID = romDocGroup then Result := '������ ����������';
end;

function GetLogJrnlName(aAction : TLogActionType) : AnsiString;
begin
 case aAction of
  //acRevision,
  acAttrWork        : Result := '�������� ��������';
  acTextWork        : Result := '����� �������';
  acHLWork          : Result := '������ ��������';
  acKWWork          : Result := '�������� ����� ��������';
  acClassWork       : Result := '������������� ��������';
  acNew             : Result := '������';
  acIncluded        : Result := '������� � ����';
  acChanged         : Result := '������� ����������� ���������';
  acAbolished       : Result := '������� ����';
  acLControl        : Result := '���� � ��������';
  acAnonced         : Result := '�����������';
  acPublInWork      : Result := '���������� �� ������������� ��������';
  acWasImported     : Result := '������������';
  acAnnoDate        : Result := '��������� �������� � ����';
  acAnnoWork        : Result := '��������� ��������';
  acAnnoWasImported : Result := '��������� �������������';
  acAnnoWasDeleted  : Result := '��������� �������';
  acScriptHadled_AddPublInfo : Result := '��������� �������� "���������� �� �������������"';
  else                Result := '?';
 end;
end;

function GetDictName(aDictID : TDLType) : AnsiString;
begin
 Result := cDLPassports[aDictID].rName;
end;

function GetAttrName(aAttrID : TdtAttribute) : AnsiString;
begin
 Result := cAttrPassport[aAttrID].rName;
end;

function GetDictNameLength(aAttrID : TDLType) : integer;
begin
 case aAttrID of
  dlSources     : Result := 195;
  dlTypes       : Result := 56;
  dlClasses     : Result := 95;
  dlNewClasses  : Result := 95;
  dlPrefixes    : Result := 79;
  dlKeyWords    : Result := 99;
  dlBases       : Result := 79;
  //aidDateNums    : Result := 0;
  dlWarnings    : Result := 1000;
  dlCorrects    : Result := 79;
  dlCorSources  : Result := 100;
  dlTerritories : Result := 79;
  dlNorms       : Result := 19;
  dlAccGroups   : Result := 200;
  dlServiceInfo : Result := 100;
  //aidPaperWhere  : Result := 200;
  dlTextInsert  : Result := 200;

  else             Result := 0;
 end;
end;

function GetAttrLogType(aAttrID : TdtAttribute; out aLogAction : TLogActionType) : Boolean;
begin
 Result := True;
 case aAttrID of
  atSources,
  atTypes,
  atDateNums,
  atWarnings,
  atAccGroups,
  atBases,
  atVerLink,
  atActiveIntervals,
  atAlarms,
  atServiceInfo     : aLogAction := acAttrWork;

  atClasses,
  atPrefixes,
  atTerritories,
  atNorms           : aLogAction := acClassWork;
  atAnnoClasses     : aLogAction := acAnnoWork;
  atKeyWords        : aLogAction := acKWWork;
  atPublisheds      : aLogAction := acPublInWork;

  atCorrects        : aLogAction := acAttrWork;
  else
   {aidTextInsert, aidJurOperation, aidDocIDs}
   Result := False;
 end;
end;

function GetAttrStructSize(aAttrID : TdtAttribute) : Integer;
begin
 case aAttrID of
  atRenum        : Result := SizeOf(TDocIDsRec);
  atDoc2DocLink  : Result := SizeOf(TDoc2DocRec);
 else              Result := SizeOf(TDictID);
 end;
end;

function GetDictImageIndex(aDictID : TDLType) : integer;
begin
 case aDictID of
  dlSources     : Result := picDicPublisher;
  dlTypes       : Result := picDicDocType;
  dlClasses     : Result := picDicTree;
  dlNewClasses  : Result := picDicTree;
  dlPrefixes    : Result := picDicTree;
  dlKeyWords    : Result := picDicKey;
  dlBases       : Result := picDicDocGroup;
  dlDateNums    : Result := -1;
  dlWarnings    : Result := picDicWarning;
  dlCorrects    : Result := picSrcCheck;
  dlCorSources  : Result := picPublishSrc;
  dlTerritories : Result := picTerritory;
  dlTextInsert  : Result := picTextInsert;
  else             Result := picDicTree;
 end;
end;
{
procedure GetDictBitmap(aAttrID : TdtAttribute; var ItemBMP : TBitmap);
begin
 ItemBMP := GetDocBMP(GetDictImageIndex(aAttrID));
end;

procedure GetDictItemBitmap(aAttrID : TdtAttribute; var ItemBMP: TBitmap);
begin
 ItemBMP := GetDocBMP(GetDictItemImageIndex(aAttrID));
end;
}

function GetDictItemImageIndex(aDictID : TDLType) : integer;
begin
 case aDictID of
   dlTypes       : Result := picBlueBall;
   dlClasses     : Result := picDiamond;
   dlPrefixes    : Result := picDiamond;
   dlKeyWords    : Result := picKey;
   dlWarnings    : Result := picWarning;
   dlCorrects    : Result := picSrcCheck;
   dlCorSources  : Result := picPublishSrc;
   else             Result := picDiamond;
  end;
end;

function  AttributeIDToJournalAction(aAttrID : TdtAttribute) : TLogActionType;
begin
 case aAttrID of
  atClasses,
  atPrefixes    : Result := acClassWork;
  atKeyWords    : Result := acKWWork;
 else
  Result := acAttrWork;
 end;
end;

function  DictIDToJournalAction(aAttrID : TDLType) : TLogActionType;
begin
 case aAttrID of
  dlClasses,
  dlPrefixes    : Result := acClassWork;
  dlKeyWords    : Result := acKWWork;
 else
  Result := acAttrWork;
 end;
end;

function MakeActiveIntervalRec(aStart, aFinish  : TStDate; const aComment : AnsiString = '') : TActiveIntervalRec;
begin
 with Result do
 begin
  RecID := 0;
  Typ := 0;

  if aStart > 0 then
   Start := aStart
  else
   Start := minActiveDate;

  if aFinish > 0 then
   Finish := aFinish
  else
   Finish := maxActiveDate;

  l3StringToArray(Comment, SizeOf(Comment), aComment);
 end;
end;

function MakeDateNumRec(aDate : TStDate; const aNum : AnsiString; aTyp : TDNType) : TDNDictRec;
begin
 with Result do
 begin
  ID := cUndefDictID;
  Date := aDate;
  Typ  := aTyp;
  l3StringToArray(Num, SizeOf(Num), aNum);
 end;
end;

function GetDictExtParams(aAttrID : TDLType) : TDictExtParams;
begin
 Result := [];
 if aAttrID in GlAttrWithCodeSet then
  Result := Result + [depCode];

 if aAttrID in GlAttrWithPrivateSet then
  Result := Result + [depPrivate];

 if (aAttrID in GlAttrWithNonPeriodicSet) {and (GlobalHtServer.AdminRights)} then
  Result := Result + [depNonPeriodic];

 if (aAttrID in GlAttrWithIDEdit) then
  Result := Result + [depID]; 
end;

function GetDictExtNeedFillParams(aAttrID : TDLType) : TDictExtParams;
begin
 Result := [];
 if aAttrID in GlAttrCodeNeedFillSet then
  Result := Result + [depCode];
 {if aAttrID in GlAttrWithPrivateSet then
  Result := Result + [depPrivate];
 }
end;

end.
