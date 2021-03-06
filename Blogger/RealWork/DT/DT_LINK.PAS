Unit Dt_Link;

{ $Id: DT_LINK.PAS,v 1.187 2013/04/19 13:07:39 lulin Exp $ }

// $Log: DT_LINK.PAS,v $
// Revision 1.187  2013/04/19 13:07:39  lulin
// - ���������.
//
// Revision 1.186  2012/04/20 15:20:01  lulin
// {RequestLink:283610570}
//
// Revision 1.185  2012/03/06 13:00:34  fireton
// - ������� � ������ B_archi_base132
//
// Revision 1.184.6.1  2012/02/13 06:24:07  fireton
// - ��������� Flags � ���������� ������������� ���������
//
// Revision 1.184  2011/07/07 12:47:34  fireton
// - ������� ����������������� �� MDP
//
// Revision 1.183  2010/09/24 12:11:14  voba
// - k : 235046326
//
// Revision 1.182  2009/07/22 11:27:26  narry
// - ��������� ������� � DictServer
//
// Revision 1.181  2009/06/23 07:32:59  voba
// - �������������� ������� � ���������
//
// Revision 1.180  2009/06/08 13:23:25  voba
// - enh. ���������� ���������. ��������� �� ��������������� atDateNumsChDate, atRelHLink,
//
// Revision 1.179  2009/06/02 17:23:22  lulin
// - ������� �������� ���������� � ��������������� �����.
//
// Revision 1.178  2009/05/19 12:13:33  voba
// - ���������� ���������
//
// Revision 1.177  2009/05/13 12:17:17  voba
// - ����� �������� (�������) ���������
//
// Revision 1.176  2009/05/12 14:12:46  voba
// - use DeleteRecsByKeys in procedure TLinkTbl.DelAllLinkItems
//
// Revision 1.175  2009/05/08 11:10:07  voba
// - ������� TblH �� Handle
//
// Revision 1.174  2009/05/08 08:39:44  voba
// - del function TLinkTbl.LoadFRecByKey
//
// Revision 1.173  2009/04/13 07:10:58  narry
// - ���������� ����������� ����� � ����������
//
// Revision 1.172  2009/03/02 08:15:08  voba
// - ������� ������ ���������� � constructor TPrometTbl.Create
//
// Revision 1.171  2009/02/20 13:27:58  fireton
// - ������� !CHANGE (K 77235676)
// - 131 ������ ����
//
// Revision 1.170  2009/02/03 12:00:23  voba
// - �� ������� �������� �������
//
// Revision 1.169  2008/11/10 14:31:06  fireton
// - ����� ��� (links)
// - ������ �������� �������
//
// Revision 1.168  2008/07/15 12:48:19  voba
// - refact. �������������� ������� � TDictionary
//
// Revision 1.167  2008/07/07 09:40:10  voba
// - refact. ������� ������ ��� ������ �� �������� (TDictionary)
//
// Revision 1.166  2008/05/05 10:38:37  voba
// - ���������� �� ������ �����������������
//
// Revision 1.165  2008/04/07 11:38:37  voba
// - refact.
//
// Revision 1.164  2008/03/27 09:46:23  voba
// - cng DelAllNodesOnBody -> DelAllRecsByDictID
//
// Revision 1.163  2008/03/24 13:39:40  narry
// - ����� ��������� ReplaceLinks
//
// Revision 1.162  2008/03/20 09:48:36  lulin
// - cleanup.
//
// Revision 1.161  2008/02/13 14:53:18  voba
// - refact. Sab -> ISab
//
// Revision 1.160  2008/02/07 14:44:40  lulin
// - ����� _Tl3LongintList �������� � ����������� ������.
//
// Revision 1.159  2008/02/04 12:31:04  voba
// - add procedure VerifyLink
//
// Revision 1.158  2007/12/13 08:57:28  narry
// - Range check error
//
// Revision 1.157  2007/12/06 11:40:59  lulin
// - cleanup.
//
// Revision 1.156  2007/12/05 11:24:08  voba
// - refact
//
// Revision 1.155  2007/12/03 08:30:58  voba
// - add comment
//
// Revision 1.154  2007/12/03 08:22:53  voba
// - refact. procedure TSubLinkTbl.DelAllSubNodes
// - bug fix procedure TLinkServer.SetGroupAttributeList ����������� �������� ������� � ����� ����� ��������� ������ �� �����
//
// Revision 1.153  2007/11/26 09:38:27  voba
// - use cUndefDictID, cUndefDocID, cUndefSubID
// - use type TDictID
//
// Revision 1.152  2007/09/06 15:59:49  lulin
// - cleanup.
//
// Revision 1.151  2007/08/14 20:25:14  lulin
// - bug fix: �� ���������� ����������.
//
// Revision 1.150  2007/08/14 14:30:08  lulin
// - ������������ ����������� ������ ������.
//
// Revision 1.149  2007/07/11 13:20:22  fireton
// + LoadFRecByKey
//
// Revision 1.148  2007/07/05 15:02:00  voba
// - bug fix
//
// Revision 1.147  2007/06/28 11:16:25  voba
// - refact. ����� �� function TAbstractList.GetItem ������ ��������
//
// Revision 1.146  2007/06/22 14:38:03  voba
// - bug fix
//
// Revision 1.145  2007/05/25 15:21:42  voba
// - DeleteRecsByKeys ������ ���������� ���������� ��������� � ��������� exception � ������ ������
//
// Revision 1.144  2007/05/18 12:23:40  fireton
// - ������������� �������� �����:
//   * ������ ���������� �� ����������� ���� � ��
//   * ���������� OperationHandle
//
// Revision 1.143  2007/04/27 14:28:07  voba
// - ren  L2RecModifyProc -> L2RecAccessProc
//
// Revision 1.142  2007/04/26 10:01:43  fireton
// - ����������� DT. ������� DT_Link � DT_Dict �� ������ � ����� ��������.
//
// Revision 1.141  2007/03/30 13:57:52  voba
// - merge
//
// Revision 1.140  2007/03/30 08:37:10  voba
// - cc
//
// Revision 1.139.2.1  2007/03/30 13:40:17  voba
// - changeTSab to ISab
//
// Revision 1.139  2007/03/15 12:26:22  voba
// - merge with b_archi_BigDictID
//
// Revision 1.138.4.1  2007/03/09 13:35:42  voba
// no message
//
// Revision 1.138  2007/02/22 09:23:34  voba
// - ren DelRecsOnKeys -> DeleteRecsByKeys, _move this to TdtTable
//
// Revision 1.137  2007/02/16 16:15:29  voba
// - refact. procedure TLinkServer.CopyLinks
//
// Revision 1.136  2007/02/12 16:11:00  voba
// - ������� ������������� htModifyRecs �� ����� TAbsHtTbl.ModifyRecs
// - ������� TdtTable � ������ dt_Table (������� ������ ������� HyTech �� ������ � �������� �������)
// - ������� ������� HyTech �� ������ � Sab � dt_Sab, ����� ������ ������
//
// Revision 1.135  2007/01/22 13:56:35  voba
// - new beh.  procedure   ModifyAllNodesOnBody
//
// Revision 1.134  2006/11/28 08:29:47  narry
// - ������������ ����� (��� �����)
//
// Revision 1.133  2006/11/17 15:23:08  voba
// - ������� ���� �������������� � ���� ������� !!�������� ����� �� ��� ������������ � ����� ��� ������
//
// Revision 1.132  2006/11/07 16:15:06  voba
// - cc
//
// Revision 1.131  2006/10/04 08:35:24  voba
// - merge with b_archi_ht64
//
// Revision 1.130.2.1  2006/09/19 08:17:12  voba
// - ������� �� HTStub
//
// Revision 1.130  2006/06/23 11:20:50  narry
// -merge
//
// Revision 1.127.2.4  2006/06/19 09:09:54  voba
// - add func LinkServer.GetSelfMask
//
// Revision 1.129  2006/05/18 12:09:39  fireton
// - new: LoadFRecByKey
//
// Revision 1.128  2006/04/17 12:51:59  voba
// - refactoring
//
// Revision 1.127  2006/03/27 13:20:10  lulin
// - cleanup.
//
// Revision 1.126  2006/01/26 11:30:08  step
// ���������� ��������� ��� ���������� ���������� � THtCachedUpdates.ApplyUpdates
//
// Revision 1.125  2006/01/11 07:33:33  step
// ������ ������������
//
// Revision 1.124  2005/12/28 11:23:09  step
// ��������� TLinkServer.CopyLinks (������ �������� ������ � �� ������ ���������)
//
// Revision 1.123  2005/11/11 15:11:29  voba
// - ����������� �� stDone
//
// Revision 1.122  2005/11/03 11:27:51  voba
// - �������  � ���������� ������� Tl3DataList �� Tl3CustomDataList
//
// Revision 1.121  2005/10/06 11:16:56  step
// ����������� TSubLinkTbl.DelAllSubNodes
//
// Revision 1.120  2005/09/08 09:28:34  step
// �������� �������� aOtherDocIds � ��������� TLinkServer.ReplaceLinks
//
// Revision 1.119  2005/07/21 10:48:18  step
// bug fix: TLinkServer.CopyLinks
//
// Revision 1.118  2005/06/27 14:24:15  step
// ���������� TLinkServer.CopyLinks
//
// Revision 1.117  2005/06/24 17:49:58  step
// new: TLinkServer.CopyLinks
//
// Revision 1.116  2005/06/15 15:03:50  fireton
// - �������������� ����
//
// Revision 1.115  2005/06/15 08:21:16  step
// ���������� TLinkTbl.DelAllNodesOnIDs
//
// Revision 1.114  2005/06/15 08:18:39  step
// ���������� TLinkTbl.DelAllNodesOnIDs
//
// Revision 1.113  2005/06/14 15:43:56  step
// � ����� TLinkTbl.DelAllNodesOnIDs �������� ��������, ����������� ����� ������ �������� � ������ - ���������� ��� �������
//
// Revision 1.112  2005/06/09 10:55:25  step
// new: TLinkTbl.DelAllNodesOnIDs(aDocIds: _Tl3LongintList)
//
// Revision 1.111  2005/05/30 13:53:03  lulin
// - bug fix: �� ���������������.
//
// Revision 1.110  2005/03/22 14:42:19  step
// ���������� �������� ������ � TLinkServer
//
// Revision 1.109  2005/03/14 09:42:59  step
// no message
//
// Revision 1.108  2004/12/23 08:40:43  lulin
// - ������� �������� ������.
//
// Revision 1.107  2004/11/30 13:27:50  step
// ����� ����� b_change_linkserver1
//
// Revision 1.106.10.2  2004/11/30 12:47:13  voba
// - ������� ������� ���������� ���������� � ReplaceLinks
//
// Revision 1.106.10.1  2004/11/26 15:08:30  step
// new: TLinkServer.ReplaceLinks
//
// Revision 1.106  2004/09/21 12:04:20  lulin
// - Release ������� �� Cleanup.
//
// Revision 1.105  2004/09/14 15:58:14  lulin
// - ������ ������ Str_Man - ����������� ������ ���� - l3String.
//
// Revision 1.104  2004/08/05 18:01:10  step
// � TLinkTbl.GetNodes ��������� ��������
//
// Revision 1.103  2004/08/03 08:52:48  step
// ������ dt_def.pas �� DtDefine.inc
//
// Revision 1.102  2004/07/20 13:58:17  step
// �������������� TLinkTbl.CheckRecord --> TLinkTbl.RecordExists
//
// Revision 1.101  2004/07/14 15:27:14  step
// ������ Buffering �� StartCaching/StopCaching
//
// Revision 1.100  2004/07/14 13:28:28  step
// ����������������� ���������� �������� � StartTA
//
// Revision 1.99  2004/07/01 14:14:27  voba
// - merge newCashe
//
// Revision 1.98.2.1  2004/06/17 18:03:49  step
// � ������� TAbsHtTbl.AddRec � TAbsHtTbl.UpdRec ����� �������� AbsNum.
//
// Revision 1.98  2004/06/03 11:31:49  step
// change: TLinkServer.AddLinksToGroupDict
//
// Revision 1.97  2004/06/02 18:10:55  step
// change: fn_AddBatchToGroupDictLinks
//
// Revision 1.96  2004/06/01 15:17:59  law
// - ������� ������������ Tl3VList.MakeLongint, MakeLongintSorted - ����������� _Tl3LongintList.
// - ��������� Archi, �� ������������ ����������� ������.
//
// Revision 1.95  2004/05/28 18:49:56  step
// new: TLinkServer.AddLinksToGroupDict
//
// Revision 1.94  2004/05/26 19:27:31  law
// - new behavior: TvtCustomOutliner ������ ����� ������ ��� ���������� Il3SimpleTree � Il3Tree, � �� ��� ������ Tl3Tree. ������� ���������, ����� ��������� ����������.
//
// Revision 1.93  2004/03/05 17:25:25  step
// ������ ����
//
// Revision 1.92  2004/03/05 16:54:43  step
// ������ ����
//
// Revision 1.91  2004/03/03 18:22:21  law
// - rename unit: l3Tree2 -> l3Tree.
//
// Revision 1.90  2004/02/10 18:04:22  step
// bug fix
//
// Revision 1.89  2004/02/10 16:29:34  step
// bug fix: TLinkTbl.ModifyBody � ��.
//
// Revision 1.88  2004/02/10 13:34:05  step
// bug fix: �������� ��� TTypesLinkRec
//
// Revision 1.87  2004/02/06 16:58:32  step
// bug fix
//
// Revision 1.86  2004/02/05 09:05:16  step
// ������ ����
//
// Revision 1.85  2004/02/03 10:37:33  step
// ������ ����
//
// Revision 1.84  2004/02/02 11:08:44  step
// bug fix: TLinkTbl.EditData
//
// Revision 1.83  2004/02/02 09:16:45  step
// bug fix: TLinkServer.GetDataListEx
//
// Revision 1.82  2004/01/30 18:32:24  step
// ������� ������� �������� TLinkServer.GetDataListEx
//
// Revision 1.81  2004/01/29 15:16:28  step
// �������� TExportFilter.GetLinkSab (������ ��������� ��������� LNK#B)
//
// Revision 1.80  2004/01/28 20:20:17  step
// TLinkServer.SetDataListEx ��������� ������ ������� ���� DictId
//
// Revision 1.79  2004/01/26 17:03:27  step
// TLinkServer.SetDataListEx ��������� ���������� � � � �������
//
// Revision 1.78  2004/01/21 14:43:30  step
// �������� TLinkTbl.CalcUniqKeyNum
//
// Revision 1.77  2004/01/20 15:36:18  step
// �������� TLinkRec � TLinkServer.SetDataListEx
//
// Revision 1.76  2004/01/19 16:01:01  step
// ������ lnkBothKey �� UniqKeyNum � bug fix�
//
// Revision 1.75  2004/01/19 12:14:31  step
// bug fix: TLinkServer.SetDataListEx
//
// Revision 1.74  2004/01/16 15:00:25  step
// bug fix: TLinkServer.SetDataListEx
//
// Revision 1.73  2004/01/16 14:02:57  step
// bug fix: TLinkServer.SetDataListEx
//
// Revision 1.72  2004/01/14 16:56:12  step
// add: TLinkServer.GetDocList
//
// Revision 1.71  2004/01/14 11:54:17  step
// bug fix: TLinkServer.GetDataListEx
//
// Revision 1.70  2004/01/13 16:43:56  step
// bug fix: TLinkServer.GetDataListEx
//
// Revision 1.69  2004/01/12 14:17:22  step
// �������� TLinkServer.SetDataListEx � ��������� ���������. �������
//
// Revision 1.68  2004/01/09 14:56:13  step
// �������� ����� TLinkServer.GetDataListEx
//
// Revision 1.67  2003/12/18 14:30:26  step
// �������� ����� TLinkServer.LinkExists
//
// Revision 1.66  2003/12/05 17:03:49  voba
// - refactoring SetSubAttributeList
//
// Revision 1.65  2003/09/22 13:59:45  voba
// code clean
//
// Revision 1.64  2003/08/29 08:11:05  voba
// - add: function TLinkTbl. CheckRecord
//
// Revision 1.63  2003/07/17 14:04:24  voba
// - bug fix: ������ ����������
//
// Revision 1.62  2003/07/17 13:43:43  demon
// - bug fix: ����� ������������� ���� �� ������. �� ���������� word (TDictID) ����� ���� ������� ������ Long, �.�. � ��������� �������� ������������� Long.
//
// Revision 1.61  2003/06/19 09:13:27  voba
// - ������� ������ ������ ����� � GetTreeListOnTree � GetTreeList
//
// Revision 1.60  2003/06/06 12:26:56  voba
// - improvement _expand all tree
//
// Revision 1.59  2003/06/03 15:30:01  voba
// - rename Tl3StringDataList AddData to Add
//
// Revision 1.58  2003/05/20 09:21:29  demon
// - add: �������� ����� ���������� � �������������� ����-�������� SearchAutoClassifiedDocs
//
// Revision 1.57  2003/05/19 15:41:43  demon
// - add: �������� ����� ������� dlAutoClasses � ����� ��� �����������
//
// Revision 1.56  2003/02/11 10:04:38  voba
// - rename proc: l3NodeActionL2FA -> l3L2IA.
//
// Revision 1.55  2003/01/24 15:28:07  narry
// - bug fix
//
// Revision 1.54  2003/01/23 16:39:26  demon
// - new: ������� �������� GetBodiesListOnID � ������ TLinkTbl
//
// Revision 1.53  2002/11/14 16:59:17  voba
// - bug fix: SetDateNumList ����������� ��������� ����������� ���� (�� ��������� ������)
//
// Revision 1.52  2002/07/02 12:09:31  demon
// - fix bugs in packed modification operation
//
// Revision 1.51  2002/05/28 11:14:21  demon
// - add new function GetHistogramOfDictElementUsing
//
// Revision 1.50  2002/04/12 10:43:22  voba
// -improve : ����� ���������� FAR
//
// Revision 1.49  2002/04/02 12:17:22  demon
// - new behavior: add methods for copyTo and copyFrom JournaledDicts
//
// Revision 1.48  2001/11/21 12:50:31  demon
// - new: add new doc attribute - _dictionary #F (dlAccGroups)
//
// Revision 1.47  2001/10/26 13:12:55  law
// - new procs: MinIntValue � MaxIntValue.
//
// Revision 1.46  2001/10/26 12:57:43  law
// - new behavior: �������� ������ ����� ��������� GetSubFlags.
//
// Revision 1.45  2001/10/26 11:15:52  law
// - change: ������� ������ �������� ���������.
//
// Revision 1.44  2001/10/25 13:29:09  voba
// - new behavior: ������� ������� ������ �� �����.
//
// Revision 1.43  2001/10/08 11:38:48  voba
// - bug fix: AddSubNode, DelSubNode DictID now has LongInt type
//
// Revision 1.42  2001/09/27 10:58:46  demon
// - new: add functions AddSubNode DelSubNode in LinkServer
//
// Revision 1.41  2001/09/04 13:59:09  voba
// - rename unit: MyUtil -> l3FileUtils.
//
// Revision 1.40  2001/07/06 14:38:15  demon
// - new behavior: add transactions to all massive operation of Add, Modify and Delete of tbl records
//
// Revision 1.39  2001/01/19 16:21:23  demon
// - now Warning link tbl become usual link tbl (witout uniq key and additional feelds)
//
// Revision 1.38  2001/01/11 10:59:57  demon
// fix some Delphi Warnings
//
// Revision 1.37  2000/12/15 15:36:16  law
// - ��������� ��������� Log.
//

{$I DtDefine.inc}

interface

Uses WinTypes, Classes,
     HT_Const,
     dtIntf,
     dt_aTbl, dt_Sab,
     dt_Types, dt_Const,
     dt_AttrSchema,
     dt_Prior,
     l3Base, l3Date, l3TreeInterfaces, l3Tree_TLB, l3Tree, l3DatLst,
     evTypes, evInternalInterfaces,
     l3LongintList,

     nevTools
     ;

Const
 lnkDocIDFld  : SmallInt = 1;
 lnkDictIDFld : SmallInt = 2;
 lnkSubIDFld  : SmallInt = 3;

 tlnkUniKey   = 4;

 lnkPublihedsPages  = 3;
 lnkPublihedsComent = 4;
 lnkPublihedsFlags  = 5;

 wlnkText_fld = 3;

 aclnkBWeight = 4;
 aclnkFlags   = 5;
 aclnkDate    = 6;
 aclnkUniKey  = 7;

 lddLinkTypeFld  = 2;
 lddLinkedDocFld = 3;

 // doc2doc link types
 dltChanged = 0; // ��������� �������� �������
 dltStaled  = 1; // ��������� �������� ������� ����
 dltFromMDP = 3; // �������� ������� �� MDP (����� MDP-������ ��������� � LinkDocID)

type
 PLinkRec = ^TLinkRec;
 TLinkRec = packed record
  DocId  : TDocID;
  DictId : TDictID;
 end;

 PSubLinkRec = ^TSubLinkRec;  // ����, ���������� Sub
 TSubLinkRec = packed record
                DocID  : TDocID;
                DictID : TDictID;
                SubID  : TSubID;
               end;


type
 PDoc2DocRec = ^TDoc2DocRec;
 TDoc2DocRec = packed record
  rDocID       : TDocID;
  rLinkType    : Byte;
  rLinkedDocID : TDocID;
 end;

 TTblUtil = Class(Tl3Base, ITblInfo)
 protected
  fTable : TPrometTbl;
  procedure Cleanup; override;

 public
  constructor Create(aFamily    : TFamilyID;
                     aTblID     : Integer;
                     aTblPart   : TdtAttrTblPart = atpMain;
                     aWithFlush : boolean = false);

  property Table : TPrometTbl read fTable implements ITblInfo;
 end;

 TDocAttrTbl = Class(TTblUtil {TPrometTbl})
  private
   f_Family: TFamilyID;
  protected
   fAttribute : TdtAttribute;
  protected
   function DocLinkField : ThtField;

  public
   constructor Create(aFamily : TFamilyID; aAttr : TdtAttribute); overload; virtual;

   function  DelAllLinkItems(const aDocIDs: ISab) : integer;  overload;
    {* - ������� ��� ����� �� ����� ����������, ���������� ���������� ���������}
   procedure DelAllLinkItems(aDocID : TDocID); overload;
   property Family: TFamilyID read f_Family write f_Family;
    {* - ������� ��� ����� ��� ���������}

 end;

 TLinkTbl = Class(TDocAttrTbl)
  public
   constructor CreateMain(aTable: TMainTbls);

   procedure   AddNode(aDoc : TDocID;var aBody); virtual;
   procedure   AddNodeEx(aNewRec: PAnsiChar);

   procedure   DelNode(aDoc : TDocID;var aBody); virtual;

   procedure   DelAllRecsByDictID(aDictID : TDictID);
   procedure   DelAllNodesOnBodies(aBodies : Sab);

   procedure   GetNodes(aDoc : TDocID;var Bodies : SAB;WithRefresh : Boolean);
   procedure   GetOnID(aDoc : TDocID;MaskSab : LPSab;var FullRecs : SAB);
   //function    GetAllBodies : SAB;
   //function    GetAllIDs : SAB;
   function    GetHistogramOfBodies(MinCount : LongInt = 1) : SAB;

   function    RecordExists(aDoc : TDocID; var aBody) : Boolean;
    {- ���������� true, ���� ����� ������ ���� � �������}
   procedure   SrchOnBody(var Body;var IDs : SAB;WithRefresh : Boolean);
   //procedure   SrchOnID(aDoc : TDocID;var Bodies : SAB;WithRefresh : Boolean);
   //procedure   SrchOnIDs(IDs : SAB; var Bodies : SAB);
   procedure   EditData(aUniqKeyValue: PAnsiChar; aData: PAnsiChar); virtual;
end;

 TSubLinkTbl = Class(TLinkTbl)
  protected
   fNewSub     : TSubID;
   fUniKey_fld : SmallInt;

  public
   constructor Create(aFamily : TFamilyID; aAttr : TdtAttribute); override;

   procedure   AddNode(aDoc : TDocID;var aBody); override;
   procedure   DelNode(aDoc : TDocID;var aBody); override;
   procedure   DelSubNode(aDoc : TDocID; aSub : TSubID; aDictID : TDictID);
    {* - ������� ������� aDictID �� ����� aDoc.aSub, ���� aSub = cAllSubs, �� �� ���� ����� ���������}
   procedure   DelAllSubNodes(aDocID : TDocID;aSubID : TSubID); overload;
   //procedure   DelAllSubNodes(aDoc: TDocID; var aSubIds: Sab); overload;
   procedure   GetSubNodes(aDoc : TDocID;aSub : TSubID;var Bodies : SAB);
   function    GetAssignedSubsOnID(aDoc : TDocID;aDict : TDictID) : SAB;

   procedure   SetNewDestSub(aDoc : TDocID; aOldSub, aNewSub : TSubID);
   procedure   SetEmptyDestSub(aDoc : TDocID;aSub : TSubID);
 end;

implementation
uses SysUtils, WinProcs,
     HT_Dll,
     Dt_Err, Dt_Misc,
     dt_Table,
     Dt_Doc, Dt_Dict, Dt_Acces, Dt_List, Dt_Serv,
     Dt_Hyper, DT_BBLog, Dt_ReNum,
     l3MinMax, l3Nodes, dt_DictConst;

{TTblUtil}
constructor TTblUtil.Create(aFamily    : TFamilyID;
                            aTblID     : Integer;
                            aTblPart   : TdtAttrTblPart = atpMain;
                            aWithFlush : boolean = false);
begin
 Inherited Create;
 fTable := GlobalHtServer.GetTblObject(aFamily, aTblID, aTblPart).Use;
 if fTable = nil then
  fTable := TPrometTbl.Create(aFamily, aTblID, aTblPart, aWithFlush);
end;

procedure TTblUtil.Cleanup;
begin
 l3Free(fTable);
 Inherited;
end;

{TDocAttrTbl}
constructor TDocAttrTbl.Create(aFamily : TFamilyID; aAttr : TdtAttribute);
begin
 Assert(aFamily <> MainTblsFamily);
 fAttribute := aAttr;
 inherited Create(aFamily, Ord(cAttrPassport[fAttribute].rLink));
 f_Family:= aFamily;
end;

function TDocAttrTbl.DocLinkField : ThtField;
begin
 if fAttribute = atHLink then
  Result := 2
 else
  Result := 1;
 // ���� � ���� ��������� DocID ������ ����, ����� Hlink
end;

function TDocAttrTbl.DelAllLinkItems(const aDocIDs: ISab) : integer;
var
 lSabDict : ISab;
begin
 Result := 0;
 with cAttrPassport[fAttribute] do
  if (rDict <> dlNone) and (cDLPassports[rDict].rClass = atcSingle) then  // ���������� ��� dlDateNums � dlCorrects
   with MakeSabCopy(aDocIDs) do
   begin
    TransferToPhoto(DocLinkField, fTable);
    ValuesOfKey(lnkDictIDFld);
    TransferToPhoto(dtIDFld, DictServer(Family).GroupTbl[rDict]);
    RecordsByKey;
    Result := Count;
    DeleteFromTable;
   end;

 fTable.DeleteRecsByKeys(aDocIDs, DocLinkField);
end;

procedure TDocAttrTbl.DelAllLinkItems(aDocID : TDocID);
var
 lSab : ISab;
 lSabDict : ISab;
begin
 lSab := MakeSab(fTable);
 lSab.Select(DocLinkField, aDocID);

 with cAttrPassport[fAttribute] do
  if (rDict <> dlNone) and (cDLPassports[rDict].rClass = atcSingle) then  // ���������� ��� dlDateNums � dlCorrects
   with MakeSabCopy(lSab) do
   begin
    ValuesOfKey(lnkDictIDFld);
    TransferToPhoto(dtIDFld, DictServer(Family).GroupTbl[rDict]);
    RecordsByKey;
    DeleteFromTable;
   end;

 lSab.DeleteFromTable;
end;

{ TLinkTbl }
constructor TLinkTbl.CreateMain(aTable: TMainTbls);
begin
 inherited Create(MainTblsFamily, Ord(aTable));
end;

procedure TLinkTbl.AddNode(aDoc: TDocID; var aBody);
begin
 with fTable do
 begin
  CheckIsOpen;

  ClearFullRec;
  PutToFullRec(lnkDocIDFld,aDoc);
  PutToFullRec(lnkDictIDFld,aBody);
  try
   AddFRec;
  except
   on TmpErr:EHtErrors do
    begin
     if TmpErr.ErrorValue<>-25 then
      raise;
    end;
  end;
 end;
end;

procedure TLinkTbl.AddNodeEx(aNewRec: PAnsiChar);
begin
 with fTable do
 begin
  ClearFullRec;
  l3Move(aNewRec^, FullRecord^, RecSize);
  try
   AddFRec;
  except
   on TmpErr:EHtErrors do
   begin
    if TmpErr.ErrorValue <> -25 then
     raise;
   end;
  end;
 end; //with fTable do
end;

procedure TLinkTbl.DelNode(aDoc : TDocID; var aBody);
var
 AbsNum : LongInt;
 RecH   : RHANDLE;
begin
 with fTable do
 begin
  CheckIsOpen;
  ClearFullRec;
  PutToFullRec(lnkDocIDFld,aDoc);
  PutToFullRec(lnkDictIDFld,aBody);
  AbsNum:=Ht(htRecordByUniq(nil, Handle, UniqKeyElemNum, FullRecord, @RecH));
  if AbsNum<>0 then
    DelRec(AbsNum);
 end;
end;

procedure TLinkTbl.DelAllRecsByDictID(aDictID : TDictID);
begin
 with MakeSab(fTable) do
 begin
  Select(lnkDictIDFld, aDictID);
  DeleteFromTable;
 end;
end;

procedure TLinkTbl.DelAllNodesOnBodies(aBodies : Sab);
begin
 fTable.DeleteRecsByKeys(aBodies,lnkDictIDFld);
end;

procedure TLinkTbl.GetNodes(aDoc : TDocID;var Bodies : SAB;WithRefresh : Boolean);
var
 TmpList : SAB;
begin
 l3FillChar(TmpList,SizeOf(SAB));
 with fTable do
 begin

  if WithRefresh then RefreshSrchList;

  htSearch(@fSrchList,TmpList,Handle,lnkDocIDFld,EQUAL,@aDoc,nil);
  Ht(TmpList.nRetCode);
  try
   htValuesOfKey(Bodies,lnkDictIDFld,TmpList);
   Ht(Bodies.nRetCode);
  finally
   htClearResults(TmpList);
  end;
 end;
end;

procedure TLinkTbl.GetOnID(aDoc : TDocID;MaskSab : LPSab;var FullRecs : SAB);
begin
 with fTable do
 begin
 l3FillChar(FullRecs,SizeOf(SAB));
 if MaskSab <> nil then
  htSearch(MaskSab,FullRecs,Handle,lnkDocIDFld,EQUAL,@aDoc,nil)
 else
 begin
  RefreshSrchList;
  htSearch(@fSrchList,FullRecs,Handle,lnkDocIDFld,EQUAL,@aDoc,nil);
 end;
 end;
end;

function TLinkTbl.GetHistogramOfBodies(MinCount : LongInt) : SAB;
const
 MaxCount = $7FFFFFFF;
begin
 with fTable do
 begin

 l3FillChar(Result,SizeOf(SAB));
 RefreshSrchList;
 Ht(htHistogramByCount(Result,lnkDictIDFld,fSrchList,MinCount,MaxCount));
 end;
end;

function  TLinkTbl.RecordExists(aDoc : TDocID; var aBody) : Boolean;
var
 AbsNum : LongInt;
 RecH   : RHANDLE;
begin
 with fTable do
 begin

 CheckIsOpen;

 ClearFullRec;
 PutToFullRec(lnkDocIDFld, aDoc);
 PutToFullRec(lnkDictIDFld, aBody);
 AbsNum := Ht(htRecordByUniq(nil, Handle, UniqKeyElemNum, FullRecord, @RecH));
 Result := AbsNum <> 0;
 end;
end;

procedure TLinkTbl.SrchOnBody(var Body;var IDs : SAB;WithRefresh : Boolean);
var
 TmpList : SAB;
begin
 with fTable do
 begin

 l3FillChar(TmpList,SizeOf(SAB));
 if WithRefresh then RefreshSrchList;

 htSearch(@fSrchList,TmpList,Handle,lnkDictIDFld,EQUAL,@Body,nil);
 try
  htValuesOfKey(IDs,lnkDocIDFld,TmpList);
 finally
  htClearResults(TmpList);
 end;
 end;
end;

procedure TLinkTbl.EditData(aUniqKeyValue: PAnsiChar; aData: PAnsiChar);
var
 l_RecNo : LongInt;
begin
 with fTable do
 begin

 if fldCount <= FieldsInGroup(UniqKeyElemNum) then
  Exit; // �.�. ��� ���� ������ � ����, � ������ ���������� ������

 l_RecNo := Ht(htRecordByUniq(nil, Handle, UniqKeyElemNum, aUniqKeyValue, nil));
 if l_RecNo > 0 then
 begin
  GetFullRec(l_RecNo, True);
  try
   // � ����� ������ ���������� �� ������?
   // ���� �� ������� �� ����, ��� fldLength[UniqKeyElemNum] = ����� ���� �������� �����
   // �, ����� ����, ��� ���� ������������ ����, ����� � ������ ������.
   if not CompareMem(aData,
                     FullRecord + fldLength[UniqKeyElemNum],
                     RecSize - fldLength[UniqKeyElemNum]) then
   begin
    l3Move(aData^,
         (FullRecord + fldLength[UniqKeyElemNum])^,
          RecSize - fldLength[UniqKeyElemNum]);
    UpdFRec(l_RecNo);
   end;
  finally
   FreeRec(l_RecNo);
  end;
 end
 else
  raise EHtErrors.CreateInt(ecNotFound);
 end;
end;

{ TSubLinkTbl }
constructor TSubLinkTbl.Create(aFamily : TFamilyID; aAttr : TdtAttribute);
begin
 inherited;
 fUniKey_fld := tlnkUniKey;
end;

procedure TSubLinkTbl.AddNode(aDoc : TDocID;var aBody);
begin
 with fTable do
 begin

 CheckIsOpen;

 ClearFullRec;
 PutToFullRec(lnkDocIDFld,aDoc);
 PutToFullRec(lnkDictIDFld,TSublinkDataRec(aBody).DictID);
 PutToFullRec(lnkSubIDFld, TSublinkDataRec(aBody).SubID);
 try
  AddFRec;
 except
  on TmpErr:EHtErrors do
   begin
    if TmpErr.ErrorValue<>-25
     then raise;
   end;
 end;
 end;
end;

procedure TSubLinkTbl.DelNode(aDoc : TDocID;var aBody);
begin
 DelSubNode(aDoc, TDestHLinkRec(aBody).Sub, TDestHLinkRec(aBody).Doc);
end;

procedure TSubLinkTbl.DelSubNode(aDoc : TDocID;aSub : TSubID; aDictID : TDictID);
var
 aSab   : ISab;

 AbsNum : LongInt;
 RecH   : RHANDLE;
begin
 with fTable do
 begin

 CheckIsOpen;
 if aSub = cAllSubs then
 begin
  aSab := MakeSab(fTable);
  aSab.Select(lnkDocIDFld, aDoc);
  aSab.SubSelect(lnkDictIDFld, aDictID);
  aSab.DeleteFromTable;
 end
 else
 begin
  ClearFullRec;
  PutToFullRec(lnkDocIDFld, aDoc);
  PutToFullRec(lnkDictIDFld, aDictID);
  PutToFullRec(lnkSubIDFld, aSub);
  AbsNum:=Ht(htRecordByUniq(@fSrchList, Handle, fUniKey_fld, FullRecord, @RecH));
  if AbsNum <> 0 then
   DelRec(AbsNum);
 end;
 end;
end;

procedure TSubLinkTbl.DelAllSubNodes(aDocID : TDocID; aSubID : TSubID);
var
 aSab : ISab;
begin
 aSab := MakeSab(fTable);
  aSab.Select(lnkDocIDFld, aDocID);
  if aSubID <> cAllSubs then
   aSab.SubSelect(lnkSubIDFld, aSubID);
  aSab.DeleteFromTable;
end;

procedure TSubLinkTbl.GetSubNodes(aDoc : TDocID;aSub : TSubID;var Bodies : SAB);
var
 TmpList1,
 TmpList2,
 TmpList3 : SAB;
begin
 with fTable do
 begin

 l3FillChar(TmpList1,SizeOf(SAB));
 l3FillChar(TmpList2,SizeOf(SAB));
 l3FillChar(TmpList3,SizeOf(SAB));
 RefreshSrchList;

 htSearch(@fSrchList,TmpList1,Handle,lnkDocIDFld,EQUAL,@aDoc,nil);
 if aSub <> cAllSubs
  then
   begin
    htSearch(@fSrchList,TmpList2,Handle,lnkSubIDFld,EQUAL,@aSub,nil);
    htAndResults(TmpList3,TmpList1,TmpList2);
    htClearResults(TmpList1);
    htClearResults(TmpList2);
   end
  else
   TmpList3:=TmpList1;
 htValuesOfKey(Bodies,lnkDictIDFld,TmpList3);
 htClearResults(TmpList3);
 end;
end;

function TSubLinkTbl.GetAssignedSubsOnID(aDoc : TDocID;aDict : TDictID) : SAB;
var
 TmpSab1,
 TmpSab2,
 TmpSab3 : SAB;
begin
 with fTable do
 begin

 RefreshSrchList;

 htSearch(@fSrchList,TmpSab1,Handle,lnkDocIDFld,EQUAL,@aDoc,nil);
 try
  htSearch(@fSrchList,TmpSab2,Handle,lnkDictIDFld,EQUAL,@aDict,nil);
  try
   htAndResults(TmpSab3,TmpSab1,TmpSab2);
   try
    htValuesOfKey(Result,lnkSubIDFld,TmpSab3);
   finally
    htClearResults(TmpSab3);
   end;
  finally
   htClearResults(TmpSab2);
  end;
 finally
  htClearResults(TmpSab1);
 end;
 end;
end;

procedure TSubLinkTbl.SetNewDestSub(aDoc : LongInt; aOldSub, aNewSub : TSubID);
var
 TmpSAB1,
 TmpSAB2,
 TmpSAB3 : SAB;
begin
 with fTable do
 begin
 htSearch(nil,TmpSAB1,Handle,lnkDocIDFld,Equal,@aDoc,nil);
 try
  htSearch(@TmpSAB1, TmpSAB2, Handle, lnkSubIDFld, Equal, @aOldSub, nil);
  try
   htAndResults(TmpSab3, TmpSab1, TmpSab2);
   try
    if TmpSab3.gFoundCnt <> 0 then
      ModifyRecs(TmpSab3, lnkSubIDFld, @aNewSub, True {DupIgnore});
   finally
    htClearResults(TmpSab3);
   end;
  finally
   htClearResults(TmpSab2);
  end;
 finally
  htClearResults(TmpSab1);
 end;
 end;
end;

procedure TSubLinkTbl.SetEmptyDestSub(aDoc : LongInt;aSub : TSubID);
begin
 SetNewDestSub(aDoc,aSub,0);
end;

end.
