{$IfNDef vtDefine}
{ ���������� "VT"         }
{ �����: ������� �.�. �   }
{ ������: vtDefine -      }
{ �����: 19.04.2003 15:19 }
{ $Id: vtDefine.inc,v 1.15 2013/04/25 14:56:19 lulin Exp $ }

// $Log: vtDefine.inc,v $
// Revision 1.15  2013/04/25 14:56:19  lulin
// - ������ �� �������� �������.
//
// Revision 1.14  2011/03/29 14:44:09  lulin
// - ��������� ������� ��������� ����� �������������� ��������.
//
// Revision 1.13  2011/02/18 12:11:59  lulin
// - ��������� ����������� ��� ���������.
//
// Revision 1.12  2010/12/10 12:47:43  lulin
// - �� ��������� _nsTool �� ����� �� ����� VGScene.
//
// Revision 1.11  2010/12/08 16:03:36  lulin
// {RequestLink:228688602}.
// - ������ ������.
//
// Revision 1.10  2009/08/18 08:47:34  lulin
// {ReqestLink:158795592}. �2.
//
// Revision 1.9  2008/05/21 17:05:16  lulin
// - <K>: 90441490.
//
// Revision 1.8  2008/05/21 14:34:01  lulin
// - <K>: 90450132.
//
// Revision 1.7  2008/05/21 13:28:23  lulin
// - cleanup.
//
// Revision 1.6  2007/09/05 11:57:51  lulin
// - ������� ����������� ���������� ��������� ��������� � ���������� ���������� �����.
//
// Revision 1.5  2007/02/27 09:54:58  lulin
// - cleanup.
//
// Revision 1.4  2004/08/02 14:05:43  law
// - �������� VCM �� ������ ���������� � ������� ��������.
//
// Revision 1.3  2004/05/26 19:38:33  law
// - ����� �������� define.
//
// Revision 1.2  2004/04/22 08:51:26  law
// - �������� ��������� Il3Tree. ������������� ������. � ������ �������� ������ ����������� �� ������.
//
// Revision 1.1  2003/04/19 11:24:49  law
// - new file: vtDefine.inc.
//

{$Define vtDefine}

{$IfNDef evDefine}
 {$Include evDefine.inc}
{$EndIf  evDefine}

{.$Define vtUseVCM}

{$IfDef UseProjectDefine}
 {$I ProjectDefine.inc}
{$EndIf UseProjectDefine}

{$IfNDef Shell}
 {$IfDef Nemesis}
  {$If not Defined(Admin) AND not Defined(Monitorings) AND not Defined(nsTool)}
   {$Define Shell}
  {$IfEnd}
 {$EndIf Nemesis}
{$EndIf Shell}

{$Define vtLayeredFormIsForm}

{$IfDef DesignTimeLibrary}
 {$Define eeNotNeedOvc}
{$EndIf DesignTimeLibrary}

{$IfNDef eeNotNeedOvc}
 {$Define eeNeedOvc}
{$EndIf  eeNotNeedOvc}

{$EndIf vtDefine}
