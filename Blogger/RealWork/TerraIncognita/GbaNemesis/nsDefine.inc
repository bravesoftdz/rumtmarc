
// $Id: nsDefine.inc,v 1.19 2012/04/23 09:13:18 lulin Exp $

// $Log: nsDefine.inc,v $
// Revision 1.19  2012/04/23 09:13:18  lulin
// {RequestLink:357338233}
//
// Revision 1.18  2012/03/27 15:00:17  lulin
// - �������� ����� �����.
//
// Revision 1.17  2011/05/06 16:31:09  dinishev
// [$265390437]
//
// Revision 1.16  2010/09/22 10:27:42  oman
// - new: {RequestLink:234366672}
//
// Revision 1.15  2009/09/18 12:21:32  lulin
// - ������������� �������, ������ ��������� �� ������.
//
// Revision 1.14  2009/09/09 18:55:14  lulin
// - ��������� �� ������ ��� ��������.
//
// Revision 1.13  2006/05/23 07:30:43  mmorozov
// - add: vcmDefine.inc;
//
// Revision 1.12  2005/09/08 13:13:41  lulin
// - bug fix: ����������� �������� ����� ����� �������� ������ ��������.
//
// Revision 1.11  2005/09/05 10:04:32  lulin
// - ������ � ����� ������ ���������� ��������� ����� ���������� ���������� ����� � Sub'� - � ���������� � ���������� ����� ���������� ���������� ������.
//
// Revision 1.10  2005/08/25 11:28:56  mmorozov
// - add define _nsNewDocument;
//
// Revision 1.9  2005/08/22 15:37:01  mmorozov
// new: define _nsNewQueryExecute;
//
// Revision 1.8  2005/08/18 14:07:34  mmorozov
// new: �������� ��������� _nsNewList;
//
// Revision 1.7  2005/08/10 14:03:39  mmorozov
// - ��������� ������������� ������ ������;
//
// Revision 1.6  2005/08/09 10:28:00  mmorozov
// new: define _nsNewList;
//
// Revision 1.5  2005/04/13 12:05:16  lulin
// - ������� ��� �����.
//
// Revision 1.4  2005/01/21 14:55:44  lulin
// - new unit: nsApplication.
//
// Revision 1.3  2004/11/17 18:20:17  lulin
// - new library folder: Nemesis.
//
// Revision 1.2  2004/08/25 09:23:21  mmorozov
// new: {$Include evDefine.inc};
//
// Revision 1.1  2003/07/02 19:45:58  law
// - ����� �� ������������� IDocument � TextSource.
//

{$Include nscDefine.inc}
{$Include nevDefine.inc}
{$Include vcmDefine.inc}

{$Include W:\common\components\gui\f1LikeAppDefine.inc}

{$If not Defined(Admin) AND not Defined(Monitorings)}
 {$Define Shell}
{$IfEnd}

{$IfDef Monitorings}
 {$Define nsWithoutLogin}
{$EndIf Monitorings}

{$I w:\garant6x\implementation\Garant\GbaNemesis\nsProfile.inc}

{$If not defined(Admin) AND not defined(Monitorings)}
 {$Define HasRightNavigator}
{$IfEnd} //not Admin AND not Monitorings

