unit dt_ImpExpTypes;
{ $Id: dt_ImpExpTypes.pas,v 1.4 2013/03/26 12:22:02 fireton Exp $ }

// $Log: dt_ImpExpTypes.pas,v $
// Revision 1.4  2013/03/26 12:22:02  fireton
// - ������� ���� Comment �� ���/�������
//
// Revision 1.3  2011/08/11 11:11:46  voba
// - k : 236721575
//
// Revision 1.2  2011/07/20 07:58:27  voba
// - k : 236721575
//
// Revision 1.1  2010/09/27 06:00:29  voba
// [$235058492].
//

{$I DtDefine.inc}
interface
 uses
  l3Base, l3Date,
  dt_Types, dt_AttrSchema;
 type
    PExpCardRec = ^TExpCardRec;
  TExpCardRec = Record
                 ID            : TDocID;    {!Topic    }
                 InternalType  : Byte;
                 ShortName     : String;    {!Topic    }
                 FullName      : String;    {!Name     }
                 Status        : Word;      {!PriceLevel ???}
                 Priority      : Word;      {!Priority }
                 SortDate      : TStDate;   {!SortDate }
                 Flag          : Byte;      {!NoDoc, !Edition }
                 Related       : TDocID;    {!Related  }
                 PriorFlag     : Boolean;
                 VerLink       : TDocID;    {!VerLink  }
                 HasAnno       : Boolean;
                 Urgency       : Byte;      {!*URGENCY }
                 Comment       : string     {!*NameComment }
                end;

  PExpResultRec = ^TExpResultRec;
  TExpResultRec = Record
                   FromPath,
                   ToPath     : ShortString;
                  end;

  PExpQueryRec = ^TExpQueryRec;
  TExpQueryRec = packed record
                  ExportEmpty           : Boolean;
                  ExportDocument        : Boolean;
                  ExportRTFBody         : Boolean;
                  ExportKW              : Boolean;
                  ExportDocImage        : Boolean;
                  MultiUser             : Boolean;
                  Family                : TFamilyID;
                  InternalFormat        : Boolean;
                  OutFileType           : Longint;
                  SeparateFiles         : Longint;
                  DocumentFileNameMask  : ShortString;
                  ReferenceFileNameMask : ShortString;
                  ObjTopicFileName      : ShortString;
                  ExportDirectory       : ShortString;
                  KWFileName            : ShortString;
                  WorkVAnonced          : Boolean;
                  OutputFileSize        : LongInt;
                  TaskPriority          : Longint;
                  ExportAnnoTopics      : Boolean;
                  AnnoTopicFileName     : ShortString;
                  OnlyStructure         : Boolean;
                 end;

  PImportParams = ^TImportParams;
  TImportParams = record
   IsReg          : Boolean;      // ����� ������� "���������� � �������"
   Folder         : ShortString;  // ����� � �����������
   IsAnnotation   : Boolean;      // ����������� (rtf) ���������
   DeleteIncluded : Boolean;      // ����� ������� ������������ ���-��
   TaskPriority   : Longint;      // ��������� �������
  end;

  PImpDocRec = ^TImpDocRec;
  TImpDocRec = Record
                ShortName     : Tl3CustomString;
                Name          : Tl3CustomString;
                DocType       : Byte;
                UserType      : TUserType;
                Status        : Word;
                Priority      : Word;
                SortDate      : TStDate;
                RelHandle     : TDocID;
                VerLink       : TDocID;
                rIsExtVerLink : boolean; // VerLink ��� ������� �����
                Urgency       : Byte;
                Comment       : Tl3CustomString;
                rHasAnno      : Byte;
               end;

  PImpDictRec = ^TImpDictRec;
  TImpDictRec = Record
                 DictID    : TDLType;
                 UserDict  : Boolean;
                 Handle    : TDictID;
                 ShortName : Tl3CustomString;
                 Name      : Tl3CustomString;
                 IsPrivate : TIsPrivate;
                end;

  PImpShortDictRec = ^TImpDictRec;
  TImpShortDictRec = Record
                      DictID    : TDLType;
                      UserDict  : Boolean;
                      Handle    : TDictID;
                     end;

  PImpDateNumRec = ^TImpDateNumRec;
  TImpDateNumRec = Record
                    Handle  : LongInt;
                    DNType  : TDNType;
                    Date    : TStDate;
                    Number  : Tl3CustomString;
                    LDocID  : TDocID;
                   end;

  PImpLogRec = ^TImpLogRec;
  TImpLogRec = Record
                LType : TLogActionType;
                Date  : TStDate;
                Time  : TStTime;
                User  : TUserID;
               end;

  PImpStageRec = ^TImpStageRec;
  TImpStageRec = Record
                  SType     : TStageType;
                  User      : TUserID;
                  BeginDate,
                  EndDate   : TStDate;
                 end;

  PImpActiveIntervalRec = ^TImpActiveIntervalRec;
  TImpActiveIntervalRec = Record
                           RecID   : Byte;
                           Typ     : Byte;
                           Start,
                           Finish  : TStDate;
                           Comment : Tl3CustomString;
                          end;

  PImpAlarmRec = ^TImpAlarmRec;
  TImpAlarmRec = Record
                  RecID   : Byte;
                  Start   : TStDate;
                  Comment : Tl3CustomString;
                 end;

  PImpCheckRec = ^TImpCheckRec;
  TImpCheckRec = Record
                  Handle  : LongInt;
                  Date    : TStDate;
                  PSour   : LongInt;
                  CType   : Byte;
                  User    : TUserID;
                  Comment : Tl3CustomString;
                 end;

  PImpPublishRec = ^TImpPublishRec;
  TImpPublishRec = Record
                    Handle  : LongInt;
                    Sour    : TDictID;
                    SDate   : TStDate;
                    EDate   : TStDate;
                    Number  : Tl3CustomString;
                    Comment : Tl3CustomString;
                    Pages   : Tl3CustomString;
                    LinkComment: Tl3CustomString;
                   end;

  PImpSubRec = ^TImpSubRec;
  TImpSubRec = Record
                ID     :  TSubID;
                Name   :  Tl3CustomString;
                RealFl :  Boolean;
               end;


  TAutoAnnotationExportNotify = procedure(UserID : TUserID; AnnoDate: TstDate) of object;
  {$IFNDEF NotImportTaskPriority}
  TAutoImportNotify = procedure(UserID : TUserID; TaskParams : TImportParams) of object;
  {$ELSE}
  TAutoImportNotify = procedure(UserID : TUserID; IsRegion: Boolean; Const
      Catalog : String; IsAnnotation, DeleteIncluded : Boolean) of object;
  {$ENDIF}
  TAutoExportNotify = Procedure (aUserID : TUserID; aExpType : TDiapType;
                                 aID : TDocID;const aFile : string;
                                 aParams : TExpQueryRec) of Object;

implementation

end.