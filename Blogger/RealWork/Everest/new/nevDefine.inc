{$IfNDef nevDefine}
 {$Define nevDefine}
{ ���������� "�������"    }
{ �����: ����� �.�. �     }
{ ������: nevDefine.inc - ���� ���������� �������� ���������� ���������� }
{ �����: 31.03.2005 13:10 }
{ $Id: nevDefine.inc,v 1.7 2012/06/05 13:10:55 voba Exp $ }

// $Log: nevDefine.inc,v $
// Revision 1.7  2012/06/05 13:10:55  voba
// no message
//
// Revision 1.6  2010/12/21 09:29:16  lulin
// {RequestLink:248189760}.
//
// Revision 1.5  2009/06/19 12:54:57  lulin
// - ��������� TnevAnchor �� ������.
//
// Revision 1.4  2008/02/21 19:32:44  lulin
// - ������ ������� ���������.
//
// Revision 1.3  2007/12/04 12:47:51  lulin
// - ������������� ����� � HEAD.
//
// Revision 1.2.6.6  2007/09/05 11:57:49  lulin
// - ������� ����������� ���������� ��������� ��������� � ���������� ���������� �����.
//
// Revision 1.2.6.5  2006/07/21 05:50:09  lulin
// - ��� ������ ������ �� ������������ - ����� �� ���������� ����������� �������.
//
// Revision 1.2.6.4  2006/06/26 14:06:42  mmorozov
// - new: ����� � ��� ���������� ���������� ���������;
//
// Revision 1.2.6.3  2006/01/11 14:12:31  mmorozov
// - bugfix: ��� ����������� ��������� ���������� �� ��������� ����������� ������� (cq: 00017579);
//
// Revision 1.2.6.2  2005/06/29 07:49:02  lulin
// - cleanup.
//
// Revision 1.2.6.1  2005/05/18 12:42:59  lulin
// - ����� ����� �����.
//
// Revision 1.1.2.1  2005/04/12 10:18:46  lulin
// - ����� ����� ��������� � ����� �������.
//
// Revision 1.2.2.2  2005/04/08 15:47:23  lulin
// - ��� Define _ItsLAW ��������� ����������� ������� ���������.
//
// Revision 1.2.2.1  2005/04/08 15:23:12  lulin
// - ��������� ����� ���������� ��������� - ����� ����� ���� ������ �� ���������.
//
// Revision 1.2  2005/04/07 17:17:27  lulin
// - new method: InevParaList._IndexOfPara.
//
// Revision 1.1  2005/03/31 09:12:30  lulin
// - ��������� � CVS.
//

{$Include evDefine.inc}

{.$IfDef Archi}
 {.$I ArchiDefine.inc}
{.$EndIf Archi}

{$IfDef UseProjectDefine}
 {$I ProjectDefine.inc}
{$EndIf UseProjectDefine}

{$EndIf nevDefine}
