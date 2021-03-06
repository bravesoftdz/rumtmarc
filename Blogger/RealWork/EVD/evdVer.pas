unit evdVer;
{* ���������� � ������� �������. }

{ ���������� "K-2"        }
{ �����: ����� �.�. �     }
{ ������: k2Ver -         }
{ �����: 18.09.2002 10:18 }
{ $Id: evdVer.pas,v 1.15 2012/11/01 09:42:50 lulin Exp $ }

// $Log: evdVer.pas,v $
// Revision 1.15  2012/11/01 09:42:50  lulin
// - ����� ����� � �������.
//
// Revision 1.14  2012/11/01 07:44:53  lulin
// - ������ ����������� ����������� �������� �������� �������.
//
// Revision 1.13  2011/05/06 14:28:12  lulin
// - ������ IfDef'�.
//
// Revision 1.12  2010/06/21 06:42:25  lulin
// - bug fix: ����������� ����� ����������� ��������� ������ ������� > 999.
//
// Revision 1.11  2010/06/18 14:11:31  lulin
// {RequestLink:182452717}.
// - ������ ������ ����������� ������. ������ ������ �������� � ����� 20. 0-� - ��� ����������, 1-� - ��� F1.
//
// Revision 1.9  2010/06/18 14:04:05  lulin
// {RequestLink:182452717}.
// - ������ ������ ����������� ������. ������ ������ �������� � ����� 20. 0-� - ��� ����������, 1-� - ��� F1.
//
// Revision 1.8  2010/06/18 14:01:41  lulin
// {RequestLink:182452717}.
// - ������ ������ ����������� ������. ������ ������ �������� � ����� 20. 0-� - ��� ����������, 1-� - ��� F1.
//
// Revision 1.7  2009/08/07 09:57:07  lulin
// �������, ��� � ���� ������ � ��������� ��� �� ��������� �����.
//
// Revision 1.6  2009/07/22 06:59:54  lulin
// - ���������� SBS �� ����� ������.
//
// Revision 1.5  2009/07/20 14:52:07  lulin
// - bug fix: �� ������� ���������� � �����.
//
// Revision 1.4  2009/07/17 07:53:03  lulin
// - ������ ����� ������.
//
// Revision 1.3  2008/02/26 12:42:01  lulin
// - <K>: 85168943. �� ����������� ������������ �����, ������� �� F1.
//
// Revision 1.2  2007/08/29 14:27:02  lulin
// - ������ EVD-���� - ������ �����, ����� ����.
//
// Revision 1.1  2007/08/29 12:37:08  lulin
// - ���� ������ �������� � ���������� �����.
//
// Revision 1.12  2007/03/16 14:47:29  lulin
// - cleanup.
//
// Revision 1.11  2004/05/31 15:21:39  law
// - new prop: idBlock.tiType.
//
// Revision 1.10  2004/05/12 12:13:10  law
// - change: ������� ����� ������ ������� - ����� �������� ����� � ������������� ���������-������������� ���������.
//
// Revision 1.9  2004/04/12 13:29:32  law
// - new: �������� ��� ���������� "��������� ������", �� �������� ShortName ������ �������������� �� �������, � �������� �����.
//
// Revision 1.8  2003/09/10 12:18:39  law
// - new type: idMark.
// - new const: ev_sbtMark.
//
// Revision 1.7  2003/09/09 14:56:23  law
// - new prop: Address.ShortName, Address.Revision.
//
// Revision 1.6  2003/09/01 15:44:44  law
// - new: �������� ��� k2_idBookmark.
//
// Revision 1.5  2003/05/14 13:17:14  law
// - change _format: ���������� ��������� �������� ������ ������� ���������.
//
// Revision 1.4  2003/04/29 16:08:21  law
// - bug fix: �������� �������� ��������� ��� ������ - �������� ������������� �����.
//
// Revision 1.3  2003/03/18 09:17:36  law
// - change version: ��� ������� ������ (AV) � ����������� ����� �����.
//
// Revision 1.2  2002/09/18 09:33:27  law
// - new behavior: ��� ������ � evd-binary �������� ��� ��������� ���� �� ���������.
//
// Revision 1.1  2002/09/18 07:08:03  law
// - new units: k2StackGenerator, k2Ver.
// - new behavior: Tk2CustomReader ������ ����������� �� Tk2CustomStackGenerator � �������������� ��������� ��� ���������.
//

{$Include evdDefine.inc }

interface

const
 {0.01 '07/12/1998';  {-������� ������ ������ ���� k2_tiChildren
                        (��. k2_tiOldChildren)}
 {0.02 '10/11/1999';  {-������� ������ ������ evd-����� ��������� ���� "�����")}
 {0.03 '15/12/1999';  {-�������� ��� k2_tiExternalHandle � k2_idBlock}
 {0.04 '21/01/2000';  {-��������� ������ CodePage ��� �����}
 {0.05 '28/01/2000';  {-�������� ��� k2_idTableContinue}
 {0.06 '01/02/2000';  {-�������� ��� k2_tiURL}
 {0.07 '21/02/2000';  {-��������� ��������� ������� ev_tkStream � ��������� ������}
 {0.08 '22/02/2000';  {-������ ���� ��������������� �����, ����������� � NSRC}
 {0.09 '25/02/2000';  {-�������� ��� k2_tiComment � k2_idDocument
                       -��������� ��������� Bitmap'��
                       -�������� ��� k2_tiExternalPath � k2_idBitmapPara}
 {0.095 '01/03/2000'; {-��������� ReadOnly ��������}
 {0.096 '10/03/2000'; {-�������� ��� k2_tiExternalHandle � k2_idBitmapPara}
 {0.097 '10/03/2000'; {-�������� ��� k2_tiSubs � k2_idBitmapPara}
 {0.098 '13/03/2000'; {-�������� ��� k2_tiFirstLineIndent � k2_idTextStyle}
 {0.099 - � �������� ����� (head) CVS }
 {0.100 '14/04/2000'; {-������ ��� k2_tiHeightInParas}
 {0.101 '19/04/2000'; - � �������� ����� (head) CVS }
 {0.102 '19/04/2000'; {-������ ��� k2_tiHeightInParas}
 {0.103 '24/05/2000'; {-���������� ��������� ������ ����}
 {0.104 '29/05/2000'; {-��������� ���� k2_tiFormatted � k2_tiFormattedCount}
 {0.105 '31/05/2000'; {-����� ��� k2_tiNeedAutoFormat}
 {0.106 '01/06/2000'; {-����� ��� k2_tiFormattedCount}
 {0.107 '05/06/2000'; {-������� �������� ����� = DefaultValue}
 {0.108 '07/06/2000'; {-������� �������������� ������ � ���������
                        ���������� �� ������ ��������}
 {0.109 '08/06/2000'; {-������ �������� �� ���������
                        k2_tiWidth ��� k2_idTextPara}
 {'0.110' '19/06/2000'; {-��������� ���� k2_idHeader,
                                         k2_idFooter,
                                         k2_idDivizion}
 {'0.111' '26/07/2000'; {-�������� ����������� ����� "�������� �����"}
 {'0.112' '07/09/2000'; {-�������� ��� k2_tiJustification � k2_idBitmap}
 {'0.113' '02/10/2000'; {-������ ������ �� ��������� �������� ������� � ������}
 {'0.114' '04/10/2000'; {-��������� ��������� �������� �������}
 {'0.115' '12/10/2000'; {-��������� ��������� ����� "����������" ������}
 {'0.116' '14/11/2000'; {-������ ������ ��� ������������ ����� �� ���������}
 {'0.117' '21/11/2000'; {-� ������ ���������� �������� ��� k2_tiBackColor}
 {'0.118' '07/12/2000'; {-������� ����������� ����� �� ���������}
 {'0.119' '24/01/2001'; {-������� ����� ���������� ���������� ���� �������}
 {'0.120'               {-� ���������� ��������� �������� ��� k2_tiAllowHyphen}
  evNonPackedVer = 132;
  evPackedVer = 133;
  evVer20Step = 140;
  // - ������ � ������� ������� �� ��������� � ����� 20
  {$IfDef evdPack}
  evFormatCurVersionStep = 20;
  evFormatCurVersionBase = 7 * evFormatCurVersionStep;
    {* ���� ������� ������. }
  {$If Defined(Nemesis) AND (not Defined(nsTest) OR Defined(InsiderTest))}
  evFormatCurVersionI  = evFormatCurVersionBase + 1;
    {* - ������� ������ ������� (� ������������� ����). }
  {$Else}
  evFormatCurVersionI  = evFormatCurVersionBase + 0;
    {* - ������� ������ ������� (� ������������� ����). }
  {$IfEnd}
  evEVDCurRevisionDate = '18/06/2010';
    {* - ������� ���� ������� �������. }
  {$Else  evdPack}
  evFormatCurVersionStep = 1;
  evEVDCurRevisionDate = '31/05/2004';
    {* - ������� ���� ������� �������. }
  evFormatCurVersionI  = 132;
    {* - ������� ������ ������� (� ������������� ����). }
  {$EndIf evdPack}
  evFormatOldInch = 124;
    {* - ������ �� "�������" �������. }

var
  evFormatCurVersionS  : String = '';
    {* - ������� ������ ������� (� ��������� ����). }

implementation

uses
  SysUtils
  ;

initialization
{!touched!}{$IfDef LogInit} WriteLn('W:\common\components\rtl\Garant\EVD\evdVer.pas initialization enter'); {$EndIf}
 evFormatCurVersionS := IntToStr(evFormatCurVersionI div 1000) + '.' + IntToStr(evFormatCurVersionI mod 1000);

{!touched!}{$IfDef LogInit} WriteLn('W:\common\components\rtl\Garant\EVD\evdVer.pas initialization leave'); {$EndIf}
end.

