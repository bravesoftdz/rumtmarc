unit evSubImplementation;
{* ���������� ����������� IevSub, IevDocumentPart � IevDocument. }

{ ���������� "�������"    }
{ �����: ����� �.�. �     }
{ ������: evSubImplementation - }
{ �����: 25.10.1999 12:24 }
{ $Id: evSubImplementation.pas,v 1.25 2013/08/12 09:48:08 kostitsin Exp $ }

// $Log: evSubImplementation.pas,v $
// Revision 1.25  2013/08/12 09:48:08  kostitsin
// [$476351441]
//
// Revision 1.24  2013/07/22 12:53:54  kostitsin
// [$472290302]
//
// Revision 1.23  2013/07/18 12:25:14  kostitsin
// [$471772806]
//
// Revision 1.22  2013/07/17 14:06:21  kostitsin
// [$454531102]
//
// Revision 1.21  2012/04/25 15:41:42  lulin
// {RequestLink:357338233}
//
// Revision 1.20  2012/03/22 13:18:43  dinishev
// {Requestlink:349116289}
//
// Revision 1.19  2012/03/22 09:15:01  dinishev
// {Requestlink:349116289}
//
// Revision 1.18  2012/03/14 14:00:46  dinishev
// {Requestlink:345637305}
//
// Revision 1.17  2012/02/01 10:34:47  fireton
// - ���������� rCompareContentsLevel (332564294)
//
// Revision 1.16  2012/02/01 07:54:18  dinishev
// {Requestlink:332564312}
//
// Revision 1.15  2011/06/21 06:22:53  dinishev
// [$263291073]
//
// Revision 1.14  2011/05/11 15:40:45  lulin
// {RequestLink:263293374}.
//
// Revision 1.13  2011/04/18 12:06:23  dinishev
// [$263291073]
//
// Revision 1.12  2011/03/01 16:14:31  lulin
// {RequestLink:255954137}.
//
// Revision 1.11  2011/01/14 17:21:14  lulin
// {RequestLink:248195582}.
// - �������������� �������� ��������.
//
// Revision 1.10  2010/12/21 10:59:20  lulin
// [$248190990].
//
// Revision 1.9  2010/09/16 12:17:53  lulin
// {RequestLink:234360974}.
//
// Revision 1.8  2010/09/16 10:28:30  dinishev
// Bug fix: �������� ����� ����������������� ��� - �� ���������������.
//
// Revision 1.7  2010/09/16 09:23:20  dinishev
// Cleanup
//
// Revision 1.6  2010/09/16 09:08:00  dinishev
// Cleanup
//
// Revision 1.5  2010/07/13 07:09:29  dinishev
// [$224791621]
//
// Revision 1.4  2010/06/17 12:05:02  lulin
// {RequestLink:217693932}.
//
// Revision 1.3  2010/06/09 16:22:15  lulin
// {RequestLink:217683801}.
// - [$217685902].
//
// Revision 1.2  2009/11/17 14:48:27  lulin
// {ReqestLink:171967563}. ������ ��������� ���������� ���.
//
// Revision 1.1  2009/09/14 11:28:04  lulin
// - ������� ���� � ��� ������������� �������.
//
// Revision 1.253  2009/08/20 15:27:08  voba
// [$159364714]
//
// Revision 1.252  2009/07/24 08:38:09  lulin
// {RequestLink:157910236}.
//
// Revision 1.251  2009/07/23 18:00:04  lulin
// - ���������� ������������ �����.
//
// Revision 1.250  2009/07/23 16:45:56  lulin
// - ������ ���.
//
// Revision 1.249  2009/07/23 13:42:11  lulin
// - ��������� ��������� �������� ���� ���� ����.
//
// Revision 1.248  2009/07/20 16:44:04  lulin
// - ������� �� ��������� ��������� ���������� �������� ���� ����������� ����, ������ ����� "������" ��� ������ ��� ���� ���� ��� ������.
//
// Revision 1.247  2009/07/14 14:56:28  lulin
// {RequestLink:141264340}. �25.
//
// Revision 1.246  2009/07/13 12:31:37  lulin
// {RequestLink:141264340}. �23ac.
//
// Revision 1.245  2009/07/11 17:11:05  lulin
// {RequestLink:141264340}. �19.
//
// Revision 1.244  2009/07/11 15:55:09  lulin
// {RequestLink:141264340}. �22.
//
// Revision 1.243  2009/07/11 12:46:22  lulin
// {RequestLink:141264340}. �14.
//
// Revision 1.242  2009/07/11 09:24:42  lulin
// - ����������� �� ������� ������� ��������� ������.
//
// Revision 1.241  2009/07/10 16:15:41  lulin
// - ����������� �� ������� ������� ��������� ������.
//
// Revision 1.240  2009/07/10 15:04:44  lulin
// - ����������� �� ������� ������� ��������� ������.
//
// Revision 1.239  2009/07/10 13:55:57  lulin
// - ����������� �� ������� ������������ ������.
//
// Revision 1.238  2009/07/10 13:03:27  lulin
// - ������ ����.
//
// Revision 1.237  2009/07/09 19:11:16  lulin
// {RequestLink:141264340}. �10.
//
// Revision 1.236  2009/07/09 14:54:27  lulin
// {RequestLink:140837386}. �3.
//
// Revision 1.235  2009/07/08 15:51:58  lulin
// {RequestLink:141264340}. �7.
//
// Revision 1.234  2009/07/07 08:58:23  lulin
// - �������� ��������.
//
// Revision 1.233  2009/06/29 12:12:43  lulin
// {RequestLink:154075236}. �4.
//
// Revision 1.232  2009/06/25 12:57:30  lulin
// - �������� �������� ��������.
//
// Revision 1.231  2009/06/02 14:35:54  lulin
// [$148572885].
//
// Revision 1.230  2009/06/02 11:23:06  lulin
// - ����������� �� ������������� ������.
//
// Revision 1.229  2009/06/02 10:47:12  lulin
// - ������������ ������� �������� ���������.
//
// Revision 1.228  2009/06/01 16:07:31  lulin
// [$148574348].
//
// Revision 1.227  2009/04/16 14:42:02  lulin
// [$143396720]. �7.
//
// Revision 1.226  2009/04/15 07:48:35  lulin
// [$143396720]. ������ �������� ��������� � ��������� �������.
//
// Revision 1.225  2009/04/14 08:24:26  lulin
// [$142613919]. ���������� ���������������� � ������� �������.
//
// Revision 1.224  2009/04/09 14:12:37  lulin
// [$140837386]. �15.
//
// Revision 1.223  2009/04/09 11:59:05  lulin
// [$142613459].
//
// Revision 1.222  2009/04/07 16:09:41  lulin
// [$140837386]. �13.
//
// Revision 1.221  2009/04/03 17:34:55  lulin
// [$140837386]. ��������� ������� ������� ��� ������ � �������� ����������� �� ������.
//
// Revision 1.220  2009/04/01 11:45:32  lulin
// [$141262980]. ���������� ���������� ���� � �����. ������� ��������� � ��������� ������.
//
// Revision 1.219  2009/03/31 12:04:36  lulin
// [$140286997].
//
// Revision 1.218  2009/03/05 15:26:55  lulin
// - <K>: 137470629. ������ �������� ������ �� ������� �����.
//
// Revision 1.217  2009/03/05 13:09:36  lulin
// - <K>: 137470629. ���������� ������ �� ����.
//
// Revision 1.216  2009/03/04 13:32:47  lulin
// - <K>: 137470629. ���������� �������������� ����� � ������ � ������� �� �� ����� �������.
//
// Revision 1.215  2009/02/26 10:21:19  lulin
// - <K>: 137465982. �1
//
// Revision 1.214  2009/02/25 17:43:43  lulin
// - <K>: 90441983. ��������� �� ������.
//
// Revision 1.213  2009/02/24 16:34:15  lulin
// - <K>: 124453087. bug fix: ������������ ��������� ��������.
//
// Revision 1.212  2008/12/12 19:19:14  lulin
// - <K>: 129762414.
//
// Revision 1.211  2008/10/14 19:20:11  lulin
// - <K>: 121149970.
//
// Revision 1.210  2008/10/09 13:37:34  lulin
// - <K>: 121145547.
//
// Revision 1.209  2008/06/17 20:44:42  lulin
// - ������ ����� EVD �� ������.
//
// Revision 1.208  2008/05/08 16:10:55  lulin
// - ��������� � ������ <K>: 90442475.
//
// Revision 1.207  2008/04/15 08:23:46  lulin
// - ������� ��� � �������� ���������.
//
// Revision 1.206  2008/04/14 13:46:35  lulin
// - <K>: 89096854.
//
// Revision 1.205  2008/04/14 07:03:22  lulin
// - ������� ��� � ������ <K>: 89096854.
//
// Revision 1.204  2008/04/10 14:34:05  lulin
// - <K>: 89098970.
//
// Revision 1.203  2008/04/10 12:45:57  lulin
// - <K>: 89099092.
//
// Revision 1.202  2008/04/09 17:57:08  lulin
// - ������� ��� � ������ <K>: 89096854.
//
// Revision 1.201  2008/04/07 06:18:37  lulin
// - cleanup.
//
// Revision 1.200  2008/04/02 14:22:01  lulin
// - cleanup.
//
// Revision 1.199  2008/04/01 15:33:47  lulin
// - � ������� ����������� ��������� ��������� �������� �� ������.
//
// Revision 1.198  2008/03/03 13:20:27  lulin
// - nevTools �������� �� ������. ������ �� �������������.
//
// Revision 1.197  2008/02/18 19:32:02  lulin
// - ����������� �����.
//
// Revision 1.196  2008/02/14 17:08:54  lulin
// - cleanup.
//
// Revision 1.195  2008/02/13 16:03:02  lulin
// - ������ ������� ������ ������ ������.
//
// Revision 1.194  2007/12/25 23:55:50  lulin
// - ������ l3Tree_TLB ��������� ��������� �� ������.
//
// Revision 1.193  2007/12/25 12:55:52  lulin
// - ������ �������� ������.
//
// Revision 1.192  2007/12/13 13:47:23  dinishev
// Bug fix: ������� ������ �� HEAD'�
//
// Revision 1.191  2007/12/05 18:25:39  lulin
// - ������ �������� ���.
//
// Revision 1.190  2007/12/04 12:47:05  lulin
// - ������������� ����� � HEAD.
//
// Revision 1.181.4.72  2007/09/28 18:07:00  lulin
// - ��������� ������������� �����, ��� ������ ������������ �����.
//
// Revision 1.181.4.71  2007/09/14 13:26:06  lulin
// - ��������� � ������ B_Tag_Clean.
//
// Revision 1.181.4.70.2.4  2007/09/13 12:35:57  lulin
// - ������������� ��������.
//
// Revision 1.181.4.70.2.3  2007/09/12 17:02:04  lulin
// - ����� �������� �������� ��-���������.
//
// Revision 1.181.4.70.2.2  2007/09/12 16:14:07  lulin
// - ����� �������� �������� ��-���������.
//
// Revision 1.181.4.70.2.1  2007/09/12 15:23:02  lulin
// - ����������� �� ������, ������������ ���������������� ��������� ��������.
//
// Revision 1.181.4.70  2007/09/11 18:49:58  lulin
// - ������ �������� ��������.
//
// Revision 1.181.4.69  2007/09/06 09:37:37  lulin
// - ������������� ��������.
//
// Revision 1.181.4.68  2007/07/12 09:59:18  oman
// - fix: ������ �� ���������� �� ��������� ������� ������,
//  ���� ��� ������ � ���������� (cq 25723)
//
// Revision 1.181.4.67  2007/06/22 19:18:57  lulin
// - cleanup.
//
// Revision 1.181.4.66  2007/06/22 18:59:54  lulin
// - cleanup.
//
// Revision 1.181.4.65  2007/03/28 11:53:54  lulin
// - ������ ���������� ������ �� ��������� �� ������ �����.
//
// Revision 1.181.4.64  2007/02/28 10:55:32  lulin
// - ������� ������ ��� ������ ���������� (CQ OIT5-24278).
//
// Revision 1.181.4.63  2007/02/09 14:51:12  lulin
// - ��������� �� ������ � ����������.
//
// Revision 1.181.4.62  2007/01/05 14:37:19  lulin
// - cleanup.
//
// Revision 1.181.4.61  2006/12/21 12:20:11  lulin
// - ����� ��������� �������� "��������".
//
// Revision 1.181.4.60  2006/12/12 09:54:18  oman
// - fix: ������� HiddenStyles c _DocumentContainer �� ��������.
//   ��������� ��������/���������/d'n'd (cq12564)
//
// Revision 1.181.4.59  2006/11/15 11:51:18  lulin
// - bug fix: �� ���������������� ���������� ��� ��������� �������� ��������� (CQ OIT5-23355).
//
// Revision 1.181.4.58  2006/11/10 17:15:55  lulin
// - ��������� � ������.
//
// Revision 1.181.4.57  2006/11/03 11:00:07  lulin
// - ��������� � ������ 6.4.
//
// Revision 1.181.4.56.2.2  2006/10/26 11:24:13  lulin
// - ����������� �� ������ �������������� �����.
//
// Revision 1.181.4.56.2.1  2006/10/12 17:45:21  lulin
// - �������� ���, ��� ������� � ����������� ���������.
//
// Revision 1.181.4.56  2006/10/10 12:06:14  lulin
// - cleanup.
//
// Revision 1.181.4.55  2006/09/16 11:10:53  lulin
// - bug fix: ������ ��� ������� �������� �����, ������� ��������� �� ���������� ��������� � ������� ����� (CQ OT5-22431).
//
// Revision 1.181.4.54  2006/07/20 16:02:04  lulin
// - ��� ������ ������ �� ������������ - ����� �� ���������� ����������� �������.
//
// Revision 1.181.4.53  2006/07/10 10:39:22  lulin
// - �����, ������������ ������������ ��������� ������� �������� - ������� �������� ��� �������� ���������� ���������.
//
// Revision 1.181.4.52  2006/06/28 16:00:32  lulin
// - ��� ��������� ����, ��� ���� ���������� ���������� �������������� � �������� �������������� �����.
//
// Revision 1.181.4.51  2006/04/12 06:16:02  oman
// �� ��������������� - �� ������� k2Strings
//
// Revision 1.181.4.50  2006/01/18 12:20:12  lulin
// - new behavior: �� ��������������� �� ������ ����, � ��������������� �� �������� �� ��� ��� ����� ���.
//
// Revision 1.181.4.49  2005/12/26 13:26:48  lulin
// - bug fix: �� ������ ������������ ��������� ������������ (CQ OIT5-18865).
//
// Revision 1.181.4.48  2005/12/15 14:03:31  lulin
// - bug fix: ������ ���� ��������� ��� �� ����.
//
// Revision 1.181.4.47  2005/12/08 17:40:30  lulin
// - bug fix: � 3-� ��� ������� ����������� ������ ����� ���������.
// - bug fix: ����� ��� Back �� ������� - �.�. ���������� ���������� ��������� ���������.
//
// Revision 1.181.4.46  2005/12/03 21:22:28  lulin
// - ��������� ��������� �������� �� ��� - ��������� � ����������.
//
// Revision 1.181.4.45  2005/11/25 10:47:27  lulin
// - bug fix: ����������� ��������� �������� ����� �� �������.
//
// Revision 1.181.4.44  2005/11/15 11:32:35  lulin
// - ���������� ��������� ������.
//
// Revision 1.181.4.43  2005/11/09 15:28:25  lulin
// - ������� ���������� ���������� � ���������� ������.
//
// Revision 1.181.4.42  2005/11/07 06:25:22  lulin
// - �������� � ����� � � ������� ����� ����������������.
//
// Revision 1.181.4.41  2005/11/05 09:03:14  lulin
// - �������� � ����� � � ������� ����� ����������������.
//
// Revision 1.181.4.40  2005/11/04 15:41:36  lulin
// - �������� � ����� � � ������� ����� ����������������.
//
// Revision 1.181.4.39  2005/10/07 10:21:13  lulin
// - bug fix: ����� �������� assert ��� �������� �����.
//
// Revision 1.181.4.38  2005/10/07 09:22:13  lulin
// - bug fix: ��� ��������� ��������� ���������� ��������� �������� ����� ��������� � Sub'��.
//
// Revision 1.181.4.37  2005/10/03 07:01:26  lulin
// - bug fix: ��������� ������ � ������� ����������� ����.
//
// Revision 1.181.4.36  2005/09/23 16:03:55  lulin
// - ������� ������ � ������ ������������.
//
// Revision 1.181.4.35  2005/09/14 09:59:19  lulin
// - ����������� ������� ������� �� Sub � ��������� � ���� ������ - ����������, ����� FindNodePath ����� ���������� ���������� ������.
//
// Revision 1.181.4.34  2005/09/14 06:27:14  lulin
// - ��������� ��� ���������� ����������� �������� �� Sub.
//
// Revision 1.181.4.33  2005/09/05 13:59:52  lulin
// - bug fix: ��� ���������� �������� �� ��������� ������ �� �����.
//
// Revision 1.181.4.32  2005/09/01 16:34:06  lulin
// - ���������� ��������� ���������� �� Il3SimpleNode.
//
// Revision 1.181.4.31  2005/07/21 06:46:12  lulin
// - ����������� ��������� ������� � ��� ������ � ������� ��������� ��������� �� ��� ������ ����������.
//
// Revision 1.181.4.30  2005/07/20 18:21:14  lulin
// - ����� ���������� ���������.
//
// Revision 1.181.4.29  2005/07/20 16:59:28  lulin
// - ��������� ���������� �� ������������� ����� ��� TagReader � _TagWriter.
//
// Revision 1.181.4.28  2005/07/20 15:13:19  lulin
// - ������ ��������� ��������� ������������ ��� ������/������ ����.
//
// Revision 1.181.4.27  2005/07/19 17:23:47  lulin
// - ����� ��������� ������ � ������ Sub'�� ��������� - ������ �� ���������� ��������������� �� ���������.
//
// Revision 1.181.4.26  2005/07/19 15:58:06  lulin
// - ������ ����������� ����������� ������� � �������� ��������, ���-������ �������� �� �������.
//
// Revision 1.181.4.25  2005/07/19 15:32:24  lulin
// - ������ ����� ��������� � ������������ ����������� ����� ������� Parent'�� ���������� � ��������.
//
// Revision 1.181.4.24  2005/07/18 11:22:37  lulin
// - ������, ������������� ��������� �� ��������� ���� ����� ���������� ��������.
//
// Revision 1.181.4.23  2005/07/11 06:07:06  lulin
// - ����������� �������� �����������.
//
// Revision 1.181.4.22  2005/07/07 13:09:28  lulin
// - ����������� �������� �����������.
//
// Revision 1.181.4.21  2005/06/21 15:35:09  lulin
// - new method: _InevShape.Invalidate.
//
// Revision 1.181.4.20  2005/06/15 17:23:52  lulin
// - remove proc: _evMoveCursor.
//
// Revision 1.181.4.19  2005/06/15 13:06:00  lulin
// - ������ ������������� ������ ��������� � ����� ����.
//
// Revision 1.181.4.18  2005/06/14 16:40:06  lulin
// - bug fix: �� ��������������� ����������.
//
// Revision 1.181.4.17  2005/06/14 16:25:10  lulin
// - new method: IevTagROPoint._PointToParent.
// - remove proc: evArrangeCursorLevel.
//
// Revision 1.181.4.16  2005/06/14 14:51:51  lulin
// - new interface: _InevSelection.
// - remove interface: IevSelection.
//
// Revision 1.181.4.15  2005/06/10 16:16:29  lulin
// - ������������� ����������� ���������������� �� �����/��������/��������.
//
// Revision 1.181.4.14  2005/06/08 10:18:30  lulin
// - ������ ������� ���������� ���������.
//
// Revision 1.181.4.13  2005/06/08 08:45:28  lulin
// - bug fix: �� ���������������.
//
// Revision 1.181.4.12  2005/06/07 13:43:47  lulin
// - ������ �������� ������.
//
// Revision 1.181.4.11  2005/06/07 11:37:32  lulin
// - bug fix: �� ���������������.
//
// Revision 1.181.4.10  2005/06/06 15:36:09  lulin
// - ���������� �������� �� ������� � ������� ���������� ��������.
//
// Revision 1.181.4.9  2005/06/02 15:48:32  lulin
// - cleanup.
//
// Revision 1.181.4.8  2005/06/02 12:33:08  lulin
// - ������ ������� ������ �������� ����� ��������� �� ��� ��������� �� �������.
//
// Revision 1.181.4.7  2005/06/01 16:22:25  lulin
// - remove unit: evIntf.
//
// Revision 1.181.4.6  2005/06/01 11:10:36  lulin
// - bug fix: �� ����������������.
//
// Revision 1.181.4.5  2005/05/31 17:09:20  lulin
// - �������� ������� �������� � �������� ��������.
//
// Revision 1.181.4.4  2005/05/31 15:57:20  lulin
// - �������� ������� �������� � �������� ��������.
//
// Revision 1.181.4.3  2005/05/31 14:48:01  lulin
// - cleanup: ��� ������ � ��������� ���������� ����������, � �� �������.
//
// Revision 1.181.4.2  2005/05/31 12:06:30  lulin
// - cleanup: ��� ������ � ��������� ���������� ����������, � �� �������.
//
// Revision 1.181.4.1  2005/05/18 12:42:47  lulin
// - ����� ����� �����.
//
// Revision 1.171.2.6  2005/05/18 12:32:10  lulin
// - ��������� ��� ��������� ����� � HEAD.
//
// Revision 1.171.2.5  2005/04/28 09:18:30  lulin
// - ��������� � ������ B_Tag_Box.
//
// Revision 1.171.2.4  2005/04/18 16:43:25  lulin
// - ���������� _Box, � �� Ik2Tag (���� �������� � ������������������ �� ����).
//
// Revision 1.171.2.3  2005/04/15 08:21:35  lulin
// - ������ ������ ������ �� ���, � �� ���������� ���.
//
// Revision 1.171.2.2  2005/04/11 09:04:42  lulin
// - cleanup.
//
// Revision 1.171.2.1  2005/04/09 12:18:44  lulin
// - ��� ��������� _evFormatOnDraw �������� �������� ������� �� Sub.
//
// Revision 1.180.2.1  2005/04/23 16:07:25  lulin
// - ������ ��������� ��������� Ik2TagBox.
//
// Revision 1.180  2005/04/21 05:27:02  lulin
// - � �������� ��������� ��������� � ���������� - ����� ������� ������/������� ����.
//
// Revision 1.179  2005/04/21 05:11:38  lulin
// - ���������� _Box (���� ��-�� ���������� �������������� ���� � ������� - �� �������� ����� ������ ����).
//
// Revision 1.178  2005/04/20 17:40:50  lulin
// - ��������� �� �������������� ���������� Ik2TagBoxQT.
//
// Revision 1.177  2005/04/20 15:54:19  lulin
// - �������� ������ ��� ���������� Ik2TagWrap.
//
// Revision 1.176  2005/04/20 15:16:43  lulin
// - new method: Ik2TagBox.rLong.
//
// Revision 1.175  2005/04/20 14:51:42  lulin
// - ���������� ��� ����� ������������ �����.
//
// Revision 1.174  2005/04/20 13:38:42  lulin
// - new method: Ik2TagBox.InheritsFrom.
//
// Revision 1.173  2005/04/18 17:18:22  lulin
// - ���������� _Box, � �� Ik2Tag (���� �������� � ������������������ �� ����).
//
// Revision 1.172  2005/04/15 08:59:52  lulin
// - ������ ������ ������ �� ���, � �� ���������� ���.
//
// Revision 1.171.2.3  2005/04/15 08:21:35  lulin
// - ������ ������ ������ �� ���, � �� ���������� ���.
//
// Revision 1.171.2.2  2005/04/11 09:04:42  lulin
// - cleanup.
//
// Revision 1.171.2.1  2005/04/09 12:18:44  lulin
// - ��� ��������� _evFormatOnDraw �������� �������� ������� �� Sub.
//
// Revision 1.181  2005/04/28 15:03:38  lulin
// - ��������� ����� B_Tag_Box � HEAD.
//
// Revision 1.180.2.1  2005/04/23 16:07:25  lulin
// - ������ ��������� ��������� Ik2TagBox.
//
// Revision 1.180  2005/04/21 05:27:02  lulin
// - � �������� ��������� ��������� � ���������� - ����� ������� ������/������� ����.
//
// Revision 1.179  2005/04/21 05:11:38  lulin
// - ���������� _Box (���� ��-�� ���������� �������������� ���� � ������� - �� �������� ����� ������ ����).
//
// Revision 1.178  2005/04/20 17:40:50  lulin
// - ��������� �� �������������� ���������� Ik2TagBoxQT.
//
// Revision 1.177  2005/04/20 15:54:19  lulin
// - �������� ������ ��� ���������� Ik2TagWrap.
//
// Revision 1.176  2005/04/20 15:16:43  lulin
// - new method: Ik2TagBox.rLong.
//
// Revision 1.175  2005/04/20 14:51:42  lulin
// - ���������� ��� ����� ������������ �����.
//
// Revision 1.174  2005/04/20 13:38:42  lulin
// - new method: Ik2TagBox.InheritsFrom.
//
// Revision 1.173  2005/04/18 17:18:22  lulin
// - ���������� _Box, � �� Ik2Tag (���� �������� � ������������������ �� ����).
//
// Revision 1.172  2005/04/15 08:59:52  lulin
// - ������ ������ ������ �� ���, � �� ���������� ���.
//
// Revision 1.171.2.3  2005/04/15 08:21:35  lulin
// - ������ ������ ������ �� ���, � �� ���������� ���.
//
// Revision 1.171.2.2  2005/04/11 09:04:42  lulin
// - cleanup.
//
// Revision 1.171.2.1  2005/04/09 12:18:44  lulin
// - ��� ��������� _evFormatOnDraw �������� �������� ������� �� Sub.
//
// Revision 1.171  2005/03/31 10:30:46  lulin
// - remove unit: evBase_TLB.
//
// Revision 1.170  2005/03/28 13:39:16  mmorozov
// bugfix: �������������� �� ������������������ ����������;
//
// Revision 1.169  2005/03/28 11:32:08  lulin
// - ���������� ��������� � "����������" ������.
//
// Revision 1.168  2005/03/28 06:37:08  lulin
// - remove object: Tk2AtomW.
//
// Revision 1.167  2005/03/25 18:29:30  lulin
// - ����������� �� ������ Tk2AtomW.sClass.
//
// Revision 1.166  2005/03/25 17:09:01  lulin
// - ����������� �� ������ Tk2AtomW.sLong.
//
// Revision 1.165  2005/03/24 12:08:12  lulin
// - remove method: Ik2TagBox._Tag.
// - new method: Ik2TagBox._Target.
//
// Revision 1.164  2005/03/24 09:23:06  lulin
// - ������� �������� ��������� ������ � ������ �������������� ����� Ik2Tag � Tk2AtomR.
//
// Revision 1.163  2005/03/23 12:42:23  lulin
// - ������ ������ ������ ��������� �� ��������.
//
// Revision 1.162  2005/03/23 11:16:29  lulin
// - ������� �������� ����������.
//
// Revision 1.161  2005/03/21 06:44:53  lulin
// - ������ �������� ������.
//
// Revision 1.160  2005/03/19 16:39:51  lulin
// - �������� �������� ������.
//
// Revision 1.159  2005/03/17 17:57:02  lulin
// - ��������� � Ik2Tag.
//
// Revision 1.158  2005/03/17 15:58:32  lulin
// - ����� ������ ��������/������� ��������� ����� ����������, � �� ������ Boolean'��.
//
// Revision 1.157  2005/03/17 11:33:57  lulin
// - bug fix: �� ���������������.
//
// Revision 1.156  2005/03/16 17:04:21  lulin
// - ��������� � Ik2Tag.
//
// Revision 1.155  2005/03/16 14:17:57  lulin
// - bug fix: �� ��������������� ����������.
//
// Revision 1.154  2005/03/16 12:16:52  lulin
// - ��������� � Ik2Tag.
//
// Revision 1.153  2005/03/16 09:50:10  lulin
// - ��������� � Ik2Tag.
//
// Revision 1.152  2005/03/11 17:28:08  lulin
// - �� Tk2AtomR ��������� � Ik2Tag.
//
// Revision 1.151  2005/03/11 15:48:57  lulin
// - �� Tk2AtomR ��������� � Ik2Tag.
//
// Revision 1.150  2005/03/10 11:35:09  lulin
// - �� Tk2AtomR ��������� � Ik2Tag.
//
// Revision 1.149  2005/03/09 18:40:19  lulin
// - remove method: Tk2AtomR.DeleteChild.
// - new method: Ik2Tag.DeleteChild.
//
// Revision 1.148  2005/03/09 14:09:19  lulin
// - �� Tk2AtomR ��������� � Ik2TagWrap.
//
// Revision 1.147  2005/03/05 13:50:09  lulin
// - bug fix: �� ���������������.
//
// Revision 1.146  2005/03/01 11:48:08  lulin
// - ������ ������������ ����� ����.
//
// Revision 1.145  2005/03/01 11:46:11  lulin
// - ���������� ��������������.
//
// Revision 1.144  2005/03/01 11:37:38  lulin
// - new prop: IevDocument.ParentDocument.
//
// Revision 1.143  2005/03/01 09:15:42  lulin
// - new method version: _TevDocumentImplementation.Make.
//
// Revision 1.142  2005/02/16 15:31:34  lulin
// - ��������� � ������ ������� ��������� 10035750 (CQ OIT5-12250). �������� ������, ����� ����������������� ��������� �� ��������.
//
// Revision 1.141  2005/02/03 12:51:11  lulin
// - bug fix: �� �������������� ����������.
//
// Revision 1.140  2005/01/27 10:43:41  lulin
// - bug fix: ������ ��� ���������� ������, ��� �������� ���������.
//
// Revision 1.139  2005/01/27 08:01:19  lulin
// - bug fix: �� ������ �������� �� ������� �������� � ����� "������".
//
// Revision 1.138  2005/01/26 16:05:19  lulin
// - new behavior: ��� ����� ������ �����, ���������� �� � ���������� � ������ �����.
//
// Revision 1.137  2005/01/26 15:17:19  lulin
// - new behavior: �������� � ���������� ������ �� ������ ���� ������������������ ���������, �.�. ����� ��� ����� ��������������� _preview.
//
// Revision 1.136  2005/01/20 12:16:11  lulin
// - new prop: _IeeSub.InContents.
//
// Revision 1.135  2004/11/11 18:24:10  lulin
// - � ������ ����������� ������� ���������� �������� ������ � �������������.
//
// Revision 1.134  2004/11/11 17:35:22  lulin
// - new behavior: ��� ����� � ������������ ������� ���������� ���������� � ��������� ���������� �� �����.
//
// Revision 1.133  2004/11/10 12:13:25  lulin
// - cleanup: ������� ��������� � ���������� ����������� �� ���������� ������������.
//
// Revision 1.132  2004/11/10 11:06:08  lulin
// - new interface: IevTagShape.
// - remove interface: IevVisualShapedTag.
//
// Revision 1.131  2004/11/04 15:22:04  lulin
// - bug fix: �� ��������������� ���������� Print Engine.
//
// Revision 1.130  2004/10/21 19:59:13  demon
// - bug fix: ��� AV - ��� ������� ���������������� � ������, ��� �� ��� ������ ������.
//
// Revision 1.129  2004/10/14 12:40:41  lulin
// - cleanup.
//
// Revision 1.128  2004/10/14 12:20:08  lulin
// - bug fix: �� ������������������ �������� �������� ��� ����������, ������� �� ���� ��������� � ����������, �� ���������� � ����.
//
// Revision 1.127  2004/09/09 12:33:20  lulin
// - ������ ������ �������� ����� Create.
//
// Revision 1.126  2004/09/09 12:14:56  lulin
// - ������� ���������������� ���������� ���������� (�� ���� �� �����).
//
// Revision 1.125  2004/07/29 14:49:47  law
// - new interface: _IevDocumentPoint.
//
// Revision 1.124  2004/06/29 14:26:41  law
// - ����������� �� ������ Tk2AtomR._Set.
//
// Revision 1.123  2004/06/22 15:18:26  law
// - ��������� ���������� ��� �������� ��������� ��� ������, ������ � ����� ������ � �.�.
//
// Revision 1.122  2004/06/02 16:42:26  law
// - ������ ����� Tl3VList.
//
// Revision 1.121  2004/05/31 15:32:02  law
// - new prop: IevDocumentPart.ObjType.
//
// Revision 1.120  2004/05/14 15:16:53  law
// - remove unit: evTypesE.
//
// Revision 1.119  2004/05/06 09:39:10  law
// - new proc version: evArrangeCursorLevel.
//
// Revision 1.118  2004/04/19 10:52:23  law
// - new property: IevDictEntry.ShortName.
//
// Revision 1.117  2004/04/19 10:21:06  law
// - new type: TevLanguages.
//
// Revision 1.116  2004/04/19 10:05:23  law
// - new methods: TevDocumentPartImplementation.Make, _TevDocumentImplementation.Make.
//
// Revision 1.115  2004/04/19 09:53:13  law
// - new unit: evDictEntry.
// - new class: TevDictEntry.
//
// Revision 1.114  2004/04/19 09:35:09  law
// - new interface: IevDictEntry.
//
// Revision 1.113  2004/04/12 14:28:39  law
// - new behavior: � ���������� IevSub ��� ������ �������� Name ���������, ��� � ��������� ������ �. �. ��������� �������� ����.
//
// Revision 1.112  2004/04/12 14:17:17  law
// - new behavior: � ���������� IevSub ���������, ��� � ��������� ������ �. �. ��������� �������� ����.
//
// Revision 1.111  2004/04/12 08:19:53  law
// - change: "���������" ��� � ������� !Contents ������ ������.
//
// Revision 1.110  2004/03/29 12:03:41  law
// - bug fix: ���� ����� ����� �� ������� ���������, �� ��������� �� ���������� �������� (CQ OIT5-6781).
//
// Revision 1.109  2004/03/10 10:14:24  law
// - new prop: IevDocumentPart.ContentsRec.
//
// Revision 1.108  2004/03/10 09:35:18  law
// - new behavior: ���������� Sub'� ���� �6 ���� � ����� ���� ������� ����������.
//
// Revision 1.107  2004/03/03 18:03:53  law
// - rename unit: l3Tree2 -> l3Tree.
//
// Revision 1.106  2003/10/28 10:46:25  law
// - new prop: IevSub.Para.
//
// Revision 1.105  2003/10/24 11:10:25  law
// - new behavior: ���� ������ �� ���� ev_sbtSub ���������� �������� 0-� ����.
//
// Revision 1.104  2003/10/21 15:02:22  law
// - new prop: IevSub._LeafPara.
//
// Revision 1.103  2003/10/17 12:06:50  law
// - bug fix: ��� �������� ������� ����� ��� ����� ������� �� ���������.
//
// Revision 1.102  2003/10/02 16:33:24  law
// - rename unit: evBseCur -> evBaseCursor.
//
// Revision 1.101  2003/09/23 08:37:56  law
// - new prop: IevHyperlink.Hint.
// - rename proc: ev_plAssignNil -> l3AssignNil.
//
// Revision 1.100  2003/09/23 08:01:32  law
// - new: TevSubImplementation ������ ������������ ��������� Ik2TagWrap.
//
// Revision 1.99  2003/09/10 12:18:31  law
// - new type: idMark.
// - new const: ev_sbtMark.
//
// Revision 1.98  2003/07/11 18:55:52  law
// - bug fix: �������� �������� Back/Forward ��� ���������, ��� ����� ��������.
//
// Revision 1.97  2003/06/25 13:02:14  law
// - new prop: IevSub.Next - ��������� ����� � ���������.
//
// Revision 1.96  2003/03/14 13:40:04  law
// - cleanup.
//
// Revision 1.95  2003/03/12 13:17:57  law
// - change: ������� ������ ��������� �������� ����������.
//
// Revision 1.94  2003/02/18 13:04:53  law
// - new behavior: ��� �������� �� ����� ������� ������ �� ������� ������� ����, �� ������ ������ �� ������ 6 (������ �2871).
//
// Revision 1.93  2003/02/06 10:23:48  law
// - cleanup: ���������� ��� �������� �� ���������.
//
// Revision 1.92  2003/01/24 11:28:40  law
// - new behavior: ��������� ����������� �� ��������� ������, ��������� � �������������.
//
// Revision 1.91  2003/01/23 16:49:32  law
// - bug fix: ��� ��������� �� �������������� ���� ���������� ����������.
//
// Revision 1.90  2003/01/22 14:39:51  law
// - new property: IevDocumentPart.Changers.
//
// Revision 1.89  2003/01/22 13:33:02  law
// - new property: IevDocumentPart.Link.
//
// Revision 1.88  2003/01/21 13:50:08  law
// - new behavior: ���������� 4-� ��� (����), ���� ���� ���������� � ������.
//
// Revision 1.87  2003/01/20 13:03:04  law
// - cleanup: ����������� �� ������� ������������� ev_msgMove.
//
// Revision 1.86  2002/11/29 16:33:37  law
// - new behavior: ������� ������������� ����� � �������.
//
// Revision 1.85  2002/11/29 13:32:23  law
// - new prop: _IeeBlock._ChildrenIterator, _IeeBlock.Name.
//
// Revision 1.84  2002/11/12 14:18:04  law
// - new prop: IevDocumentPart.ParentDocumentPart.
//
// Revision 1.83  2002/11/12 12:37:54  law
// - new prop: IevDocumentPart.ParaCount.
//
// Revision 1.82  2002/09/17 13:51:04  law
// - bug fix.
//
// Revision 1.81  2002/09/02 10:30:35  law
// - new interface: IevDictAttrContainer.
//
// Revision 1.80  2002/07/31 09:28:30  law
// - new behavior: �� ��������� ������� ��� ����� ����� ��� _evAutoInsertSubNodes.
//
// Revision 1.79  2002/07/30 13:41:20  law
// - bug fix: ����� �������� ����� ��������� ������� �� �����.
//
// Revision 1.78  2002/07/30 12:04:32  law
// - new behavior: �������� ������ ������ � ������.
//
// Revision 1.77  2002/07/26 10:37:22  law
// - bug fix: ������ ��� ������ ����� ����� ����������� � ������������ �������.
//
// Revision 1.76  2002/07/25 11:21:41  law
// - change: ��������� � ������ SubAttrNode.
//
// Revision 1.75.2.1  2002/07/24 14:13:09  law
// - bug fix.
//
// Revision 1.75  2002/07/23 11:42:06  law
// - new unit: _evSubAttrNode.
//
// Revision 1.74  2002/07/23 11:12:22  law
// - change: ������ _TevNode ���������� _TevSubNode.
//
// Revision 1.73  2002/07/22 15:03:26  voba
// - bug fix: ����������� ���������� �������� �����.
//
// Revision 1.72  2002/07/22 13:17:07  law
// - new methods: IevSubList.Iterate*.
//
// Revision 1.71  2002/07/22 11:43:26  law
// - bug fix: ����� Exit.
// - new behavior: ������ ���������, ��� ��� ���� ������.
//
// Revision 1.70  2002/07/22 11:24:04  law
// - cleanup.
//
// Revision 1.69  2002/07/22 09:37:21  law
// no message
//
// Revision 1.68  2002/07/19 11:56:41  law
// - cleanup.
//
// Revision 1.67  2002/07/19 11:34:28  law
// - cleanup.
//
// Revision 1.66  2002/07/19 08:33:16  law
// - new prop: IevSub.Tree.
//
// Revision 1.65  2002/07/19 06:40:42  law
// - bug fix: �� ��������� ��������.
//
// Revision 1.64  2002/07/19 05:11:17  law
// - bug fix: �� ��������� �����.
//
// Revision 1.63  2002/07/18 12:00:42  law
// - rename message const: ev* -> ev_Mes*.
//
// Revision 1.62  2002/07/18 11:12:28  law
// - new behavior: ���� ���� ���������� � �������� ��������� ����� ����� ��� ����, �� ��������� ����������.
//
// Revision 1.61  2002/07/16 15:44:50  law
// - some refactoring.
//
// Revision 1.60  2002/07/09 13:57:39  law
// - new unit: evMsgCode.
//
// Revision 1.59  2002/05/30 11:52:06  law
// - new behavior: TevSubImplementation � TevDocumentPartImplementation ������ ����������.
//
// Revision 1.58  2002/03/05 11:51:37  law
// - bug fix: �������� Sub �� Sub-������ ����� ��������� ID Sub'�.
//
// Revision 1.57  2002/03/05 10:12:58  law
// - bug fix: �� ����������� ���������� � Sub'�� �� Sub-������ ����� ��������� ID Sub'�.
//
// Revision 1.56  2002/02/15 14:35:28  law
// - comments: xHelpGen.
//
// Revision 1.55  2002/02/07 15:22:30  law
// - rename class: IevBlock -> TevBlock, ��� ���� ����� �� ������ ��� � �����������.
//
// Revision 1.54  2002/02/07 15:05:24  law
// - rename class: IevCursor -> _TevCursor, ��� ���� ����� �� ������ ��� � �����������.
//
// Revision 1.53  2002/02/07 14:42:47  law
// - rename class: IevLocation -> _TevLocation, ��� ���� ����� �� ������ ��� � �����������.
//
// Revision 1.52  2002/01/23 10:11:09  voba
// -bug fix
//
// Revision 1.51  2001/12/27 15:03:29  law
// - new constructors: ��������� ��� ������������ Tl3String.Make.
//
// Revision 1.50  2001/08/29 07:01:08  law
// - split unit: l3Intf -> l3BaseStream, l3BaseDraw, l3InterfacedComponent.
//
// Revision 1.49  2001/07/10 08:35:42  law
// - new behavior: TevDocumentPartImplementation ������ ������ ��������� IevDocument (���� �������� ����������).
//
// Revision 1.48  2001/06/18 14:32:49  law
// - cleanup.
//
// Revision 1.47  2001/06/06 08:29:35  law
// - change interface: IevSub.
//
// Revision 1.46  2001/06/05 15:13:21  law
// - new method: IevDocumentPart.Merge.
//
// Revision 1.45  2001/05/07 08:54:01  law
// - new behavior: _Tl3Tree ->Il3RootNode.
//
// Revision 1.44  2001/04/12 11:16:17  law
// - bug fix: ������ �� �������� ���� ���������.
//
// Revision 1.43  2001/04/04 13:43:11  law
// - new behavior: ������� ������/������ ��������� �� ���������� � �������.
//
// Revision 1.42  2001/03/15 14:52:22  law
// - cleaning & coments.
//
// Revision 1.41  2001/03/13 10:58:11  law
// - ������ evBseCur �������� �� evBlock � evBseCur.
//
// Revision 1.40  2001/02/28 13:40:27  law
// - some tuning.
//
// Revision 1.39  2001/02/28 13:14:30  law
// - bug fix: ��������� ��� ������� Sub'� �� ������.
//
// Revision 1.38  2001/02/27 15:36:34  law
// - �������� �����������.
//
// Revision 1.37  2001/02/26 12:59:06  voba
// - bug fix: AV ��� �������� ��������������� �����.
//
// Revision 1.36  2001/02/22 16:16:56  law
// - ������� ���������� ������ Sub'�� � �� ������.
//
// Revision 1.35  2001/02/21 12:22:12  law
// - �������� ��������� IevEditor.
//
// Revision 1.34  2001/01/31 10:37:31  law
// - �������������� ������������� QueryInterface.
//
// Revision 1.33  2000/12/19 12:53:09  law
// - ������� �������� ������ �� k2Context.
//
// Revision 1.32  2000/12/15 15:10:38  law
// - ��������� ��������� Log.
//

{$Include evDefine.inc }

interface

uses
  Classes,

  l3Interfaces,
  l3Types,
  l3IID,
  l3TreeInterfaces,
  l3Base,
  l3Tree_TLB,
  l3CacheableBase,

  k2BaseTypes,
  k2Interfaces,
  k2InternalInterfaces,
  k2TagTool,
  k2Base,

  evdTypes,

  evMsgCode,
  evInternalInterfaces,

  nevBase,
  nevTools
  ;

type
  TevSubImplementation = class(Tk2ProcTagTool, IevSub, IevDocumentPoint)
   {* ���������� ���������� IevSub. }
    private
    // property fields
      f_Document : Ik2Tag;
      f_ID       : Long;
      f_LayerID  : Long;
      f_Cursor   : Ik2Tag;
      f_Name     : Tl3CustomString;
      f_Flags    : Long;
      f_Index    : Long;
      {$IfDef evUseTreePara}
      f_TreePara : InevPara;
      {$EndIf evUseTreePara}
      f_Obj      : InevObject;
    private
    // interface methods
      function  pm_GetName: Tl3WString;
        reintroduce;
      procedure pm_SetName(const Value: Tl3WString);
        reintroduce;
        {-}
      function  pm_GetID: Long;
      procedure pm_SetID(Value: Long);
        {-}
      function  pm_GetFlags: Long;
      procedure pm_SetFlags(Value: Long);
        {-}
      function  pm_GetCursor: Ik2Tag;
      procedure pm_SetCursor(const Value: Ik2Tag);
        {-}
      function  pm_GetSubList: InevSubList;
        {-}
      function  pm_GetNext: IevSub;
        {-}
      function  pm_GetLeafPara: Ik2Tag;
        {-}
      function IsVisibleOnSubPanel: Boolean;
    protected
    // internal methods
      function  pm_GetLayerID: Long;
        {-}
      function  pm_GetPara: Ik2Tag;
        {-}
      function  pm_GetDocument: IevDocument;
        {-}
      function  pm_GetSubPlace: TevSubPlace;
        virtual;
        {-}
      function  Get_Obj: PInevObject;
        {-}
      procedure Cleanup;
        override;
        {-}
      function  StartOp(OpCode : Integer = 0;
                        DoLock : WordBool = true): InevOp;
        {-}
      function  SubInstance: Ik2Tag;
        {-}
      function GetIsVisibleOnSubPanel: Boolean; virtual;
    protected
    // internal properties
      property Document : Ik2Tag
        read f_Document;
        {-}
      property ID: Long
        read pm_GetID;
        {-}
      property LayerID: Long
        read pm_GetLayerID;
        {-}
    public
    // public methods
      constructor Create(const aDocument  : Ik2Tag;
                         const aProcessor : Ik2Processor;
                         anID             : Long;
                         aLayerID         : Long;
                         anIndex          : Long = 0);
        reintroduce;
        {-}
      class function Make(const aDocument  : Ik2Tag;
                          const aProcessor : Ik2Processor;
                          anID             : Long;
                          aLayerID         : Long;
                          anIndex          : Long = 0): IevSub;
        reintroduce;
        {-}
      procedure SetTo(const anEntryPoint: Ik2Tag);
        {-}
      function  Select(const Selection: InevSelection): Boolean;
        virtual;
        {-}
      function  Delete(const aView: InevView): Bool;
        {-}
      function  IsInIndex: Boolean;
        {-}
      function  Exists: Bool;
        virtual;
        {-}
      function COMQueryInterface(const IID: Tl3GUID; out Obj): Tl3HResult;
        override;
        {-}
    public
    // public properties
      property Flags: Long
        read pm_GetFlags
        write pm_SetFlags;
        {-}
  end;//TevSubImplementation
  RevSubImplementation = class of TevSubImplementation;

 _k2TagHolder_Parent_ = Tl3CacheableBase;
 {$Include k2TagHolder.imp.pas}
 _k2TagBox_Parent_ = _k2TagHolder_;
 {$Include k2TagBox.imp.pas}
 TevDocumentPartImplementation = class(_k2TagBox_,
                                        IevSub,
                                        IevDocumentPart,
                                        IevDocumentPoint)
   {* ���������� ����������� IevSub � IevDocumentPart. }
    private
    // property fields
      f_Sub : TevSubImplementation;
    protected
    // interface methods
      // IevDocumentPart
      function  pm_GetExternalHandle: Long;
      procedure pm_SetExternalHandle(Value: Long);
        {-}
      function  pm_GetObjType: Long;
      procedure pm_SetObjType(aValue: Long);
        {-}
      function  pm_GetContentsRec: TevContentsRec;
      procedure pm_SetContentsRec(const aValue: TevContentsRec);
        {-}
      function  pm_GetParaCount: Long;
        {-}
      function  pm_GetParentDocumentPart: IevDocumentPart;
        {-}
      function  pm_GetDocument: IevDocument;
        {-}
      function  pm_GetSubPlace: TevSubPlace;
        {-}
      function  pm_GetName: Tl3WString;
        reintroduce;
      procedure pm_SetName(const Value: Tl3WString);
        reintroduce;
        {-}
      function  pm_GetLayerID: Long;
        {-}
      function  pm_GetID: Long;
      procedure pm_SetID(Value: Long);
        {-}
      function  pm_GetFlags: Long;
      procedure pm_SetFlags(Value: Long);
        {-}
      function  pm_GetCursor: Ik2Tag;
      procedure pm_SetCursor(const Value: Ik2Tag);
        {-}
      function  pm_GetSubList: InevSubList;
        {-}
      function  pm_GetNext: IevSub;
        {-}
      function  pm_GetLeafPara: Ik2Tag;
        {-}
      function  pm_GetPara: Ik2Tag;
        {-}
      function IsVisibleOnSubPanel: Boolean;
    protected
    // internal methods
      function  Get_Obj: PInevObject;
        {-}
      function  Processor: InevProcessor;
        {-}
      function  StartOp(OpCode : Integer = 0;
                        DoLock : WordBool = true): InevOp;
        {-}
      procedure Cleanup;
        override;
        {-}
    public
    // public methods
      constructor Create(const aSub: TevSubImplementation);
        reintroduce;
        {-}
      class function Make(const aSub: TevSubImplementation): IevDocumentPart;
        reintroduce;
        overload;
        {-}
      class function Make(const aDocument  : Ik2Tag;
                          const aProcessor : Ik2Processor;
                          anID             : Long;
                          aLayerID         : Long;
                          aClass           : RevSubImplementation = nil): IevDocumentPart;
        overload;
        {-}
      procedure SetTo(const anEntryPoint: Ik2Tag);
        {-}
      function  Select(const Selection: InevSelection): Boolean;
        {-}
      function  Delete(const aView: InevView): Bool;
        {-}
      function  IsInIndex: Boolean;
        {-}
      function  Exists: Bool;
        {-}
      function  Merge: Bool;
        {* - ���������� ���� �� ���������. }
      function COMQueryInterface(const IID: Tl3GUID; out Obj): Tl3HResult;
        override;
        {-}
      function  SubInstance: Ik2Tag;
        {-}
    public
    // public properties
      property Sub: TevSubImplementation
        read f_Sub;
        {-}
  end;//TevDocumentPartImplementation

  TevDocumentImplementation = class(TevDocumentPartImplementation, IevDocument)
   {* ���������� ���������� IevDocument. }
    private
    // interface methods
      // IevDocument
      function  pm_GetComment: Tl3WString;
      procedure pm_SetComment(const Value: Tl3WString);
        {-}
      function  pm_GetName: Tl3WString;
        reintroduce;
      procedure pm_SetName(const Value: Tl3WString);
        reintroduce;
        {-}
      function  pm_GetShortName: Tl3WString;
      procedure pm_SetShortName(const Value: Tl3WString);
        {-}
      function  pm_GetParentDocument: IevDocument;
        {-}
    public
    // public methods
      class function Make(const aSub: TevSubImplementation): IevDocument;
        reintroduce;
        overload;
        {-}
      class function Make(const aDocument  : Ik2Tag;
                          const aProcessor : Ik2Processor): IevDocument;
        overload;
        {-}
  end;//TevDocumentImplementation

implementation

uses
  SysUtils,
  
  l3Const,
  l3Except,
  l3InternalInterfaces,
  l3String,
  l3Memory,
  l3Bits,
  l3InterfacesMisc,
  l3Tree,
  l3MinMax,

  k2Const,
  k2Tags,
  k2Except,
  k2TagTools,
  k2Strings,
  k2TagList,
  k2Facade,

  evdInterfaces,
  evdDOM,

  evMessage,

  evTypes,
  evExcept,
  evOp,

  evNode,
  {$IfDef evUseTreePara}
  //evSubAttrNode,
  {$EndIf evUseTreePara}
  evCursorTools,
  evParaTools,
  evDictEntry,

  nevFacade,

  Block_Const,
  DictEntry_Const,
  Document_Const,
  TreePara_Const,
  LeafPara_Const,
  ParaList_Const
  ;

type _Instance_R_ = TevDocumentPartImplementation;

{$Include k2TagHolder.imp.pas}
  
{$Include k2TagBox.imp.pas}

// start class TevSubImplementation

constructor TevSubImplementation.Create(const aDocument  : Ik2Tag;
                                        const aProcessor : Ik2Processor;
                                        anID             : Long;
                                        aLayerID         : Long;
                                        anIndex          : Long = 0);
  {reintroduce;}
  {-}
var
 l_Tag : Ik2Tag;  
begin
 f_ID := anID;
 f_LayerID := aLayerID;
 f_Document := aDocument;
 f_Index := anIndex;
 if (f_Document = nil) then
  l_Tag := k2NullTag
 else
 if (f_LayerID = ev_sbtSub) AND (f_ID = 0) then
  l_Tag := f_Document
 else
  l_Tag := f_Document.rAtomEx([k2_tiSubs,
                              k2_tiChildren, k2_tiHandle, f_LayerID,
                              k2_tiChildren, k2_tiHandle, f_ID,
                              k2_tiObject]);
 inherited Create(l_Tag, aProcessor);
end;

class function TevSubImplementation.Make(const aDocument  : Ik2Tag;
                                         const aProcessor : Ik2Processor;
                                         anID             : Long;
                                         aLayerID         : Long;
                                         anIndex          : Long = 0): IevSub;
  //reintroduce;
  {-}
var
 l_Sub : TevSubImplementation;
begin
 l_Sub := Create(aDocument, aProcessor, anID, aLayerID, anIndex);
 try
  Result := l_Sub;
 finally
  l3Free(l_Sub);
 end;//try..finally
end;

procedure TevSubImplementation.Cleanup;
  {override;}
  {-}
begin
 {$IfDef evUseTreePara}
 f_TreePara := nil;
 {$EndIf evUseTreePara}
 f_Flags := 0;
 l3Free(f_Name);
 f_Cursor := nil;
 f_Document := nil;
 f_Obj := nil;
 inherited;
end;

function TevSubImplementation.StartOp(OpCode : Integer = 0;
                                      DoLock : WordBool = true): InevOp;
  {-}
begin
 Result := Processor.StartOp(OpCode, DoLock);
end;

procedure TevSubImplementation.SetTo(const anEntryPoint: Ik2Tag);
  {-}
var
 l_Pack  : InevOp;
 l_Block : IevDocumentPart;
 l_Para  : Ik2Tag;
begin
 if (anEntryPoint <> nil) then
 begin
  if (f_LayerID = ev_sbtSub) AND
     l3IOk(QueryInterface(IevDocumentPart, l_Block)) then
   try  
    if l_Block.Exists then
     raise EevException.CreateFmt(ev_MesBlockAlreadyExists, [f_ID]);
   finally
    l_Block := nil;
   end;//try..finally
  l_Pack := StartOp(ev_msgAddSub);
  try
   Delete(nil);
   l_Para := anEntryPoint.Box;
   Redirect := l_Para;
   f_Document.cAtomEx([k2_tiSubs,
                       k2_tiChildren, k2_tiHandle, f_LayerID,
                       k2_tiChildren, k2_tiHandle, f_ID],
                       l_Pack).AttrW[k2_tiObject, l_Pack] := l_Para;
   // - ���������� ����� � ������ ���������� ������� ������ ���������� �����
   //   �����, ����� ��������� ���������� ���� ������.
   Assert(f_Document.rAtomEx([k2_tiSubs,
                       k2_tiChildren, k2_tiHandle, f_LayerID,
                       k2_tiChildren, k2_tiHandle, f_ID,
                       k2_tiObject]).AsObject = l_Para.AsObject);
   with l_Para.cAtomEx([k2_tiSubs,
                        k2_tiChildren, k2_tiHandle, f_LayerID,
                        k2_tiChildren, k2_tiHandle, f_ID], l_Pack) do
   begin
    if not f_Name.Empty then
    begin
     ObjW[k2_tiShortName, l_Pack] := f_Name;
     //AttrW[k2_tiShortName, l_Pack] := k2Tag(f_Name);
     l3Free(f_Name);
    end;//not f_Name.Empty
   end;//l_Para.cAtomEx([k2_tiSubs,
   l3ClearBit(f_Flags, 7);
   l3ClearBit(f_Flags, 4);
   Flags := f_Flags;
   f_Obj := nil;
   Assert(f_Document.rAtomEx([k2_tiSubs,
                       k2_tiChildren, k2_tiHandle, f_LayerID,
                       k2_tiChildren, k2_tiHandle, f_ID,
                       k2_tiObject]).AsObject = l_Para.AsObject);
  finally
   l_Pack := nil;
  end;//try..finally
 end;//anEntryPoint <> nil
end;

function TevSubImplementation.Select(const Selection: InevSelection): Boolean;
  {-}

 function GotoTop: Boolean;
 var
  l_Para       : InevPara;
  l_ParaCursor : InevPoint;
 begin
  Result := false;
  if not f_Document.QT(InevPara, l_Para) then
   Assert(false);
  if (l_Para.ChildrenCount <= 0) then
   // - �������� ��� �� ����������
   Exit;
  if (Selection <> nil) then
  begin
   l_ParaCursor := l_Para.MakePoint;
   try
    l_ParaCursor.Move(Selection.View, ev_ocTopLeft);
    if (Selection <> nil) then
     Result := Selection.SelectPoint(l_ParaCursor, true);
   finally
    l_ParaCursor := nil;
   end;//try..finally
  end;//Selection <> nil
 end;

var
 l_ParaCursor : InevBasePoint;
 l_Para       : InevPara;
 l_Inn      : InevBasePoint;
begin//Select
 Result := false;
 if (Selection = nil) then
  Exit;
 if f_Document.rAtomEx([k2_tiSubs,
                      k2_tiChildren, k2_tiHandle, f_LayerID,
                      k2_tiChildren, k2_tiHandle, f_ID,
                      k2_tiObject]).QT(InevPara, l_Para) then
 begin
  {$IfDef Nemesis}
  if (f_LayerID = ev_sbtMark) AND
     (Flags = ev_cUserCommentFlags) AND
     (l_Para.IntA[k2_tiHeight] = 0) then
  begin
   if (l_Para.PID > 0) then
    l_Para := l_Para.Prev;
    // - ��������� �� ���������� ��������
  end;//f_LayerID = ev_sbMark
  {$EndIf Nemesis}
  l_ParaCursor := l_Para.MakePoint;
  try
   l_ParaCursor.Move(Selection.View, ev_ocTopLeft);
   {-����������� ������� �����}
   l_Inn := l_ParaCursor.MostInner;
   if (l_Inn <> nil) AND
      l_Inn.InheritsFrom(k2_idBlock) AND (l_Inn.ChildrenCount = 0) then
   begin
    l_ParaCursor := l_Inn.PointToParent;
    if not l_ParaCursor.Move(Selection.View, ev_ocParaDown) then
     l_ParaCursor.Move(Selection.View, ev_ocParaUp);
   end;//l_Inn <> nil
   Result := Selection.SelectPoint(l_ParaCursor, true);
  finally
   l_ParaCursor := nil;
  end;//try..finally
 end//l_Para.IsValid
 else
  Result := GotoTop;
end;//Select

function TevSubImplementation.IsInIndex: Boolean;
  {-}
begin
 if (Document = nil) then
  Result := false
 else  
 if (LayerID = ev_sbtSub) AND (ID = 0) then
  Result := true
 else
  Result := Document.rAtomEx([k2_tiSubs,
                            k2_tiChildren, k2_tiHandle, LayerID,
                            k2_tiChildren, k2_tiHandle, ID]).IsValid;
end;

function TevSubImplementation.Exists: Bool;
  {-}
var
 l_Object : Ik2Tag;
 l_Parent : Ik2Tag;
begin
 if (Document = nil) then
  Result := false
 else 
 if (f_ID = 0) AND (f_LayerID = ev_sbtSub) then
  Result := true
 else
 begin
  l_Object := f_Document.rAtomEx([k2_tiSubs,
                                k2_tiChildren, k2_tiHandle, f_LayerID,
                                k2_tiChildren, k2_tiHandle, f_ID,
                                k2_tiObject]);
  with l_Object do
   Result := IsValid AND
             ((InheritsFrom(k2_idBlock) AND (f_ID = IntA[k2_tiHandle])) OR
              GetRedirect.rAtomEx([k2_tiSubs,
                     k2_tiChildren, k2_tiHandle, f_LayerID,
                     k2_tiChildren, k2_tiHandle, f_ID]).IsValid);
  if Result then
  begin
   while true do
   begin
    if l_Object.IsSame(f_Document) then
     Exit;
    l_Parent := l_Object.Owner;
    if l_Parent.IsValid then
     l_Object := l_Parent
    else
     break;
   end;//while true
   Result := false;
  end;//Result
 end;//f_ID = 0
end;

function TevSubImplementation.Delete(const aView: InevView): Bool;
  {-}

var
 l_Pack : InevOp;
 l_Sub  : PIk2Tag;

 procedure DeleteFromIndex;
 var
  l_AnchorIndex : IevAnchorIndex;
 begin//DeleteFromIndex
  if f_Document.QT(IevAnchorIndex, l_AnchorIndex, Processor) then
   try
    l_AnchorIndex.Delete(f_LayerID, f_ID);
   finally
    l_AnchorIndex := nil;
   end;//try..finally
 end;//DeleteFromIndex

 procedure DeleteSub;
 var
  l_SL          : Ik2Tag;
  l_Index       : Long;
 begin//DeleteSub
  l_SL := l_Sub.rAtomEx([k2_tiSubs, k2_tiChildren, k2_tiHandle, f_LayerID]);
  if l_SL.IsValid AND
     (l_SL.AsObject As Tk2TagList).FindData(f_ID, l_Index, k2_tiHandle) then
  begin
   with l_SL.Child[l_Index].Attr[k2_tiShortName] do
    if IsValid then
     l3Set(f_Name, AsObject As Tl3CustomString)
    else
     l3Free(f_Name);
   l_SL.DeleteChild(l_Index, l_Pack);
   DeleteFromIndex;
  end;//l_SL.IsValid
 end;//DeleteSub

var
 l_Point          : InevBasePoint;
 l_Block          : InevRange;
 l_Mem            : Tl3MemoryPool;
 l_RootNode       : Il3RootNode;
 l_Node           : Il3Node;
 l_SaveEntryPoint : Long;
 l_Para           : InevPara;
begin
 Result := false;
 Exists;
 // - ��� ����� CheckExists ������
 // - ����� �������� �� ��������� ��� �������� �� �����
 l_Sub := GetRedirect;
 try
  if //Exists AND
     true then
  begin
   f_Flags := Flags;
   if l_Sub.IsValid AND not l_Sub.IsSame(f_Document) then
   begin
    if l_Sub.InheritsFrom(k2_idBlock) then
    begin
     if not Exists then Exit;
     Result := true;
     if (l_Sub.IntA[k2_tiLayerID] <> f_LayerID) then
     begin
      DeleteFromIndex;
      Exit;
     end;//l_Sub.IntA[k2_tiLayerID] <> f_LayerID
     with l_Sub.Attr[k2_tiShortName] do
      if IsValid then
       l3Set(f_Name, AsObject As Tl3CustomString)
      else
       l3Free(f_Name);
     l_Mem := Tl3MemoryPool.Create;
     try
      l_Pack := StartOp(ev_msgDeletePara);
      try
       if Supports(f_Document.Box, Il3RootNode, l_RootNode) then
        try
         l_Node := FindNodeByTag(l_RootNode, l_Sub^);
         if (l_Node <> nil) then l_Node.Remove;
        finally
         l_RootNode := nil;
        end;{try..finally}
       if not l_Sub.QT(InevPara, l_Para) then
        Assert(false); 
       try
        l_Block := l_Para.Range;
        l_Block.Data.Store(cf_EverestBin, l_Mem As IStream, nil, evDefaultStoreFlags + [evd_sfChildrenOnly] + [evd_sfInternal]);
       finally
        l_Block := nil;
       end;{try..finally}
       l_Point := l_Para.MakePoint;
       try
        l_Point := l_Point.PointToParent;
        l_SaveEntryPoint := l_Point.Position;
        evDeletePara(l_Pack, l_Point, []);
        l_Point.Inner := nil;
        if (l_SaveEntryPoint > 0) AND (l_Point.Position = l_SaveEntryPoint) then
         l_Point.SetEntryPointPrim(Pred(l_SaveEntryPoint));
        l_Point.Text.Modify.InsertStream(aView,
                                         l_Mem As IStream,
                                         cf_EverestBin,
                                         l_Pack,
                                         evDefaultLoadFlags + [ev_lfInternal]);
        DeleteFromIndex;
        l_Point.SetEntryPoint(l_SaveEntryPoint);
        l_Point.Inner.Move(aView, ev_ocTopLeft);
        f_Cursor := l_Point.MostInner.Obj^;
        f_Obj := nil;
       finally
        l_Point := nil;
       end;//try..finally
      finally
       l_Pack := nil;
      end;//try..finally
     finally
      l3Free(l_Mem);
     end;//try..finally
    end//l_Sub.InheritsFrom(k2_idBlock)
    else
    begin
     Result := true;
     l_Pack := StartOp(ev_msgDeleteSub);
     try
      DeleteSub;
     finally
      l_Pack := nil;
     end;//try..finally
    end;//l_Sub.InheritsFrom(k2_idBlock)
   end;//not l_Sub.IsSame(f_Document)
  end;//Exists..
 finally
  l_Sub := nil;
 end;//try..finally
end;

function TevSubImplementation.COMQueryInterface(const IID: Tl3GUID; out Obj): Tl3HResult;
  {override;}
  {-}
begin
 if IID.EQ(IevDocument) then
 begin
  if Exists then
  begin
   if (f_LayerID = ev_sbtSub) AND (f_ID = 0) then
   begin
    Result.SetOk;
    IevDocument(Obj) := TevDocumentImplementation.Make(Self);
   end//f_LayerID = ev_sbtSub
   else
    Result.SetNoInterface;
  end//Exists
  else
   Result.SetNoInterface;
 end
 else
 if IID.EQ(IevDocumentPart) then
 begin
  with GetRedirect^ do
  begin
   if not IsValid OR InheritsFrom(k2_idBlock) then
   begin
    Result.SetOk;
    IevDocumentPart(Obj) := TevDocumentPartImplementation.Make(Self);
   end
   else
    Result.SetNOINTERFACE;
  end;//with GetRedirect^
 end
 else
 if IID.EQ(IevdDictEntry) then
 begin
  if Exists then
  begin
   if (f_LayerID = ev_sbtSub) AND (f_ID = 0) AND
      f_Document.InheritsFrom(k2_idDictEntry) then
   begin
    Result.SetOk;
    IevdDictEntry(Obj) := TevDictEntry.Make(f_Document, Processor);
   end//f_LayerID = ev_sbtSub..
   else
    Result.SetNoInterface;
  end//Exists
  else
   Result.SetNoInterface;
 end//
 else
  Result := inherited COMQueryInterface(IID, Obj);
end;

function TevSubImplementation.Get_Obj: PInevObject;
  {-}
begin
 if (f_Obj = nil) then
  if not GetRedirect^.QT(InevObject, f_Obj) then
   Assert(false);
 Result := @f_Obj;  
end;

function TevSubImplementation.pm_GetSubPlace: TevSubPlace;
  {-}
begin
 Result := TevSubPlace(GetRedirect^.IntA[k2_tiInContents]);
end;

function TevSubImplementation.pm_GetDocument: IevDocument;
  {-}
var
 l_P : InevPara;
begin
 if not pm_GetPara.QT(InevPara, l_P) then
  Assert(false);
 Result := l_P.DocumentContainer.Document;  
end;

function TevSubImplementation.pm_GetName: Tl3WString;
  {reintroduce;}
  {-}
var
 l_Sub : Ik2Tag;
begin
 l3AssignNil(Result);
 if not f_Name.Empty then
  Result := f_Name.AsPCharLen
 else
 if Exists then
 begin
  l_Sub := GetRedirect^;
  if l_Sub.IsValid then
  begin
   if not l_Sub.InheritsFrom(k2_idBlock) then
    l_Sub := l_Sub.rAtomEx([k2_tiSubs,
                          k2_tiChildren, k2_tiHandle, f_LayerID,
                          k2_tiChildren, k2_tiHandle, f_ID]);
   if l_Sub.IsValid then
   begin
    if l_Sub.InheritsFrom(k2_idDictEntry) then
    begin
     with l_Sub.Attr[k2_tiShortName] do
      if (ChildrenCount > 0) then
       with Child[0] do
        if IsValid then
         Result := AsPCharLen;
    end//l_Sub.InheritsFrom(k2_idDictEntry)
    else
     Result := l_Sub.PCharLenA[k2_tiShortName];
   end;//l_Sub.IsValid
  end;//l_Sub.IsValid
 end;//not f_Name.Empty
end;

procedure TevSubImplementation.pm_SetName(const Value: Tl3WString);
  {reintroduce;}
  {-}
var
 l_Pack : InevOp;
 l_Sub  : Ik2Tag;
begin
 if Exists then
 begin
  l_Pack := StartOp;
  try
   l_Sub := GetRedirect^;
   if l_Sub.IsValid then
   begin
    if not l_Sub.InheritsFrom(k2_idBlock) then
     l_Sub := l_Sub.rAtomEx([k2_tiSubs,
                           k2_tiChildren, k2_tiHandle, f_LayerID,
                           k2_tiChildren, k2_tiHandle, f_ID]);
    if l_Sub.IsValid then
    begin
     if l_Sub.InheritsFrom(k2_idDictEntry) then
      l_Sub.cAtomEx([k2_tiShortName,
                     k2_tiChildren, k2_tiByIndex, 0], l_Pack)
                               .PCharLenW[k2_tiValue, l_Pack] := Tl3PCharLen(Value)
     else
      l_Sub.PCharLenW[k2_tiShortName, l_Pack] := Tl3PCharLen(Value);
     if Assigned(l_Pack) then
      if (f_ID = ev_sbtSub)
         {$IfNDef Nemesis}
         OR (f_ID = ev_sbtBookmark)
         {$EndIf  Nemesis}
         then
       l_Pack.MarkModified(GetRedirect^);
    end;//l_Sub.IsValid
   end;
  finally
   l_Pack := nil;
  end;//try..finally
 end//Exists
 else
  l3Set(Tl3String(f_Name), Value);
end;

function TevSubImplementation.pm_GetLayerID: Long;
  {-}
begin
 Result := f_LayerID;
end;

function TevSubImplementation.pm_GetID: Long;
  {-}
begin
 Result := f_ID;
end;

procedure TevSubImplementation.pm_SetID(Value: Long);
  {-}
var
 Pack         : InevOp;
 l_SubList    : Ik2Tag;
 l_SubPointer : Ik2Tag;
 l_Sub        : Ik2Tag;
 l_Object     : InevObject;
 l_SortIndex  : Tl3SortIndex;
 l_SubCache   : IevSubCache;
begin
 if (f_ID <> Value) then
 begin
  l_Object := nil;
  Pack := StartOp;
  try
   l_SubList := f_Document.rAtomEx([k2_tiSubs, k2_tiChildren, k2_tiHandle, f_LayerID]);
    {-�������� ������ Sub'�� }
   if l_SubList.IsValid then
   begin
    l_SubPointer := l_SubList.rAtomEx([k2_tiChildren, k2_tiHandle, f_ID]);
     {-�������� ��������� �� ������������ ��� Sub �� ID}
    if l_SubPointer.IsValid then
    begin
     l_Sub := l_SubPointer.Attr[k2_tiObject];
     l_Sub.QT(InevObject, l_Object);
     if l_Sub.IsValid then
     begin
      if not l_Sub.InheritsFrom(k2_idBlock) then
       l_Sub := l_Sub.rAtomEx([k2_tiSubs, k2_tiChildren, k2_tiHandle, f_LayerID,
                                               k2_tiChildren, k2_tiHandle, f_ID]);
      if l_Sub.IsValid then
      begin
       l_Sub.IntW[k2_tiHandle, Pack] := Value; {-�������� ID � Sub'�}
       l_SubPointer.IntW[k2_tiHandle, Pack] := Value; {-�������� ID � ��������� �� Sub}
       with (l_SubList.Attr[k2_tiChildren].AsObject As Tk2TagList) do
       begin
        l_SortIndex := SortIndex;
        Sorted := false;
        SortIndex := l_SortIndex;
       end;{-����������������� ������ ����������}
       if Assigned(Pack) then
        Pack.MarkModified(GetRedirect^);
      end;//l_Sub.IsValid
     end;//l_Sub.IsValid
    end;//l_SubPointer.IsValid
   end;//l_SubList.IsValid
   if Supports(f_Document.Owner.Box, IevSubCache, l_SubCache) then
    try
     l_SubCache.NotifySubDeleted(Self);
     // - ���������� �� ��������� ������
    finally
     l_SubCache := nil;
    end;{try..finally}
   f_ID := Value;
   f_Document.IntA[k2_tiMaxSubID] := Max(f_ID, Document.IntA[k2_tiMaxSubID]);
   if (Redirect = nil) OR not Redirect.IsValid then
   // - ���� ��������� ��������
   begin
    l_SubPointer := l_SubList.rAtomEx([k2_tiChildren, k2_tiHandle, f_ID]);
     {-�������� ��������� �� ������������ ��� Sub �� ID}
    if l_SubPointer.IsValid then
     Redirect := l_SubPointer.Attr[k2_tiObject];
   end;//Redirect = nil
   if (l_Object <> nil) then
    l_Object.Invalidate([]);
  finally
   Pack := nil;
  end;//try..finally
 end;{f_ID <> Value}
end;

function TevSubImplementation.pm_GetFlags: Long;
  {-}
{$IFDEF evCalcSubFlags}  
const
 // ��������� ����� �� dt_Const
 ev_bitKeyWords    = 2;
 ev_sfbitTreeNodes = 3;
 ev_sfbitDocType   = 5;
{$ENDIF evCalcSubFlags} 
var
 l_Tag    : Ik2Tag;
{$IFDEF evCalcSubFlags}
 l_Childs : Ik2Tag;
{$ENDIF evCalcSubFlags}
begin
 l_Tag := f_Document.rAtomEx([k2_tiSubs,
                        k2_tiChildren, k2_tiHandle, f_LayerID,
                        k2_tiChildren, k2_tiHandle, f_ID]);
 if l_Tag.IsValid then
 begin
  Result := l_Tag.IntA[k2_tiFlags];
  l_Tag := l_Tag.Attr[k2_tiObject];
 end//l_Tag.IsValid
 else
 begin
  Result := f_Flags;
  l_Tag := k2NullTag;
 end;//l_Tag.IsValid
 if (f_ID = 0) AND (f_LayerID = ev_sbtSub) then
  l_Tag := f_Document;
 if l_Tag.IsValid then
 begin
  with l_Tag do
  begin
   if InheritsFrom(k2_idBlock) then
   begin
    if Attr[k2_tiExternalHandle].IsValid
       AND not InheritsFrom(k2_idDocument) then
     l3SetBit(Result, 7);
    if Attr[k2_tiContentsLevel6].IsValid or Attr[k2_tiCompareContentsLevel].IsValid then
     l3SetBit(Result, 6);
    {$IfDef Nemesis}
    if (f_LayerID = ev_sbtSub) {AND
       (TevSubPlace(IntA[k2_tiInContents]) in
        [ev_spInContentsAndOnSubPanel, ev_spOnlyOnSubPanel])} then
     l3SetBit(Result, 5);
    {$EndIf Nemesis}
   end//InheritsFrom(k2_idBlock)
{$IfDef Nemesis}
   else
   begin
    if (f_LayerID = ev_sbtSub) {AND
       (TevSubPlace(IntA[k2_tiInContents]) in
        [ev_spInContentsAndOnSubPanel, ev_spOnlyOnSubPanel])} then
     l3SetBit(Result, 5);
   end;//InheritsFrom(k2_idBlock)
{$EndIf Nemesis}
{$IFDEF evCalcSubFlags}
   else
    l_Tag := l_Tag.rAtomEx([k2_tiSubs,
                        k2_tiChildren, k2_tiHandle, f_LayerID,
                        k2_tiChildren, k2_tiHandle, f_ID]);
   l_Childs := l_Tag.Attr[k2_tiKeyWords];
   if l_Childs.IsValid and (l_Childs.ChildrenCount > 0) then
    l3SetBit(Result, ev_bitKeyWords);
   l_Childs := l_Tag.Attr[k2_tiClasses];
   if l_Childs.IsValid and (l_Childs.ChildrenCount > 0) then
    l3SetBit(Result, ev_sfbitTreeNodes);
   {$IfNDef Nemesis}
   l_Childs := l_Tag.Attr[k2_tiTypes];
   if l_Childs.IsValid and (l_Childs.ChildrenCount > 0) then
    l3SetBit(Result, ev_sfbitDocType);
   {$ENDIF Nemesis}
{$ENDIF evCalcSubFlags}
  end;//with l_Tag
  if (f_LayerID = ev_sbtSub) then
   l3SetBit(Result, 0);
 end;//l_Tag.IsValid
end;

procedure TevSubImplementation.pm_SetFlags(Value: Long);
  {-}
var
 l_Pack        : InevOp;
 l_SubFlagsSpy : IevSubFlagsSpy;
 l_Sub         : Ik2Tag;
 l_SubInst     : Ik2Tag;
begin
 if (f_LayerID = ev_sbtBookmark) AND (Value = 0) then
  l3SetBit(Value, 2);
 f_Flags := Value;
 l_Pack := StartOp;
 try
  if l_Pack.InIOProcess then
   l_Sub := f_Document.cAtomEx([k2_tiSubs,
                            k2_tiChildren, k2_tiHandle, f_LayerID,
                            k2_tiChildren, k2_tiHandle, f_ID], l_Pack)
  else
   l_Sub := f_Document.rAtomEx([k2_tiSubs,
                          k2_tiChildren, k2_tiHandle, f_LayerID,
                          k2_tiChildren, k2_tiHandle, f_ID]);
  with l_Sub do
   if IsValid then
   begin
    IntW[k2_tiFlags, l_Pack] := Value;
    {$IFDEF Nemesis}
    l_SubInst := SubInstance;
    if (l_SubInst <> nil) AND l_SubInst.IsValid AND
       not l_SubInst.IsSame(l_Sub) then
     l_SubInst.IntW[k2_tiFlags, l_Pack] := Value;
    {$ENDIF Nemesis}
    if Supports(f_Document.Owner.Box, IevSubFlagsSpy, l_SubFlagsSpy) then
     try
      l_SubFlagsSpy.NotifyFlagsChange(Self);
     finally
      l_SubFlagsSpy := nil;
     end;{try..finally}
   end;//IsValid
 finally
  l_Pack := nil;
 end;{try..finally}
end;

function TevSubImplementation.pm_GetCursor: Ik2Tag;
  {-}
begin
 Result := f_Cursor;
end;

procedure TevSubImplementation.pm_SetCursor(const Value: Ik2Tag);
  {-}
begin
 if not Exists then
 begin
  f_Cursor := Value;
  f_Obj := nil;
 end;//not Exists
end;

function TevSubImplementation.pm_GetSubList: InevSubList;
  {-}
var
 l_Para : InevPara;
begin
 if f_Document.QT(InevPara, l_Para) then
  Result := l_Para.MainSubList
 else
  Result := nil;
end;

function TevSubImplementation.SubInstance: Ik2Tag;
  {-}
var
 l_Sub : Ik2Tag;
begin
 l_Sub := GetRedirect^;
 if l_Sub.IsValid then
  if not l_Sub.InheritsFrom(k2_idBlock) then
   l_Sub := l_Sub.rAtomEx([k2_tiSubs,
                         k2_tiChildren, k2_tiHandle, f_LayerID,
                         k2_tiChildren, k2_tiHandle, f_ID]);
 Result := l_Sub;
end;

function TevSubImplementation.pm_GetNext: IevSub;
  {-}
begin
 Result := nil;
 if Exists then
 begin
  with GetRedirect^ do
   if IsValid AND not InheritsFrom(k2_idBlock) then
   begin
    try
     with rAtomEx([k2_tiSubs,
                 k2_tiChildren, k2_tiHandle,  f_LayerID,
                 k2_tiChildren, k2_tiByIndex, Succ(f_Index)]) do
      if IsValid then
      begin
       Result := TevSubImplementation.Make(f_Document,
                                           Processor,
                                           IntA[k2_tiHandle],
                                           f_LayerID,
                                           Succ(f_Index));
      end;//IsValid
    except
     on EListError do
      Result := nil;
    end;//try..except
   end;//if IsValid..
 end;//Exists
end;

function TevSubImplementation.pm_GetLeafPara: Ik2Tag;
  {-}
var
 l_Tag : Ik2Tag;
begin
 Result := nil;
 if Exists then
 begin
  l_Tag := GetRedirect^;
  while not l_Tag.InheritsFrom(k2_idLeafPara) do
  begin
   if l_Tag.InheritsFrom(k2_idParaList) then
   begin
    if (l_Tag.ChildrenCount > 0) then
     l_Tag := l_Tag.Child[0]
    else
     Exit;
   end
   else
    Exit;
  end;//while not l_Tag.InheritsFrom(k2_idLeafPara)
  Result := l_Tag;
 end;//Exists
end;

function TevSubImplementation.pm_GetPara: Ik2Tag;
  {-}
begin
 Result := GetRedirect^;
end;

function TevSubImplementation.IsVisibleOnSubPanel: Boolean;
begin
 Result := GetIsVisibleOnSubPanel;
end;

function TevSubImplementation.GetIsVisibleOnSubPanel: Boolean;
begin
 Result := True;
end;

// start class TevDocumentPartImplementation

constructor TevDocumentPartImplementation.Create(const aSub: TevSubImplementation);
  {reintroduce;}
  {-}
begin
 inherited Create(nil);
 l3Set(f_Sub, aSub);
 Redirect := f_Sub.pm_GetPara;
end;

class function TevDocumentPartImplementation.Make(const aSub: TevSubImplementation): IevDocumentPart;
  //reintroduce;
  {-}
var
 l_DocumentPart : TevDocumentPartImplementation;
begin
 l_DocumentPart := Create(aSub);
 try
  Result := l_DocumentPart;
 finally
  l3Free(l_DocumentPart);
 end;//try..finally
end;

class function TevDocumentPartImplementation.Make(const aDocument  : Ik2Tag;
                                                  const aProcessor : Ik2Processor;
                                                  anID             : Long;
                                                  aLayerID         : Long;
                                                  aClass           : RevSubImplementation = nil): IevDocumentPart;
  //overload;
  {-}
var
 l_Sub : TevSubImplementation;
begin
 if (aClass = nil) then
  l_Sub := TevSubImplementation.Create(aDocument, aProcessor, anID, aLayerID)
 else
  l_Sub := aClass.Create(aDocument, aProcessor, anID, aLayerID);
 try
  Result := Make(l_Sub); 
 finally
  l3Free(l_Sub);
 end;//try..finally
end;

procedure TevDocumentPartImplementation.Cleanup;
  {override;}
  {-}
begin
 l3Free(f_Sub);
 inherited;
end;

function TevDocumentPartImplementation.Processor: InevProcessor;
  {-}
begin
 Result := f_Sub.Processor;
end;

function TevDocumentPartImplementation.StartOp(OpCode : Integer = 0;
                                               DoLock : WordBool = true): InevOp;
  {-}
begin
 Result := f_Sub.StartOp(OpCode, DoLock)
end;

function TevDocumentPartImplementation.pm_GetExternalHandle: Long;
  {-}
begin
 Result := Redirect.rLong(k2_tiExternalHandle, -1);
end;

procedure TevDocumentPartImplementation.pm_SetExternalHandle(Value: Long);
  {-}
var
 l_Pack : InevOp;
begin
 l_Pack := StartOp;
 try
  with Redirect do
   if IsValid then 
    if (Value < 0) then
     AttrW[k2_tiExternalHandle, l_Pack] := nil
    else
     IntW[k2_tiExternalHandle, l_Pack] := Value;
 finally
  l_Pack := nil;
 end;//try..finally
end;

function TevDocumentPartImplementation.pm_GetObjType: Long;
  {-}
begin
 Result := Redirect.IntA[k2_tiType];
end;

procedure TevDocumentPartImplementation.pm_SetObjType(aValue: Long);
  {-}
var
 l_Pack : InevOp;
begin
 l_Pack := StartOp;
 try
  with Redirect do
   if IsValid then
    if (aValue = 0) then
     AttrW[k2_tiType, l_Pack] := nil
    else
     IntW[k2_tiType, l_Pack] := aValue;
 finally
  l_Pack := nil;
 end;//try..finally
end;

function TevDocumentPartImplementation.pm_GetContentsRec: TevContentsRec;
  {-}
begin
 Result.rLevel6 := Redirect.rLong(k2_tiContentsLevel6, Pred(High(Long)));
 Result.rCompareContentsLevel := Redirect.rLong(k2_tiCompareContentsLevel, 0);
end;

procedure TevDocumentPartImplementation.pm_SetContentsRec(const aValue: TevContentsRec);
  {-}
var
 l_Pack : InevOp;
begin
 l_Pack := StartOp;
 try
  with Redirect do
   if IsValid then
   begin
    if (aValue.rLevel6 >= Pred(High(Long))) then
     AttrW[k2_tiContentsLevel6, l_Pack] := nil
    else
     IntW[k2_tiContentsLevel6, l_Pack] := aValue.rLevel6;
    if (aValue.rCompareContentsLevel <= 0) then
     AttrW[k2_tiCompareContentsLevel, l_Pack] := nil
    else
     IntW[k2_tiCompareContentsLevel, l_Pack] := aValue.rCompareContentsLevel;
    if Assigned(l_Pack) then
     l_Pack.MarkModified(Redirect);
   end;//IsValid
 finally
  l_Pack := nil;
 end;//try..finally
end;

function TevDocumentPartImplementation.pm_GetParaCount: Long;
  {-}
begin
 Result := Redirect.ChildrenCount;
end;

function TevDocumentPartImplementation.pm_GetParentDocumentPart: IevDocumentPart;
  {-}
var
 l_Tag     : Ik2Tag;
 l_SubList : InevSubList;
 l_Sub     : IevSub;
begin
 Exists;
 // - ��� ����� CheckExists ������
 // ��� http://mdp.garant.ru/pages/viewpage.action?pageId=217683801&focusedCommentId=217686329#comment-217686329
 // �.�. �������� CheckExists � TnsDocumentContainerSub.Create
 // ��� http://mdp.garant.ru/pages/viewpage.action?pageId=217683801&focusedCommentId=217685902#comment-217685902
 Result := nil;
 l_Tag := Redirect;
 if not l_Tag.InheritsFrom(k2_idDocument) then
 begin
  l_SubList := pm_GetSubList;
  if (l_SubList <> nil) then begin
   l_Tag := l_Tag.Owner;
   while l_Tag.IsValid do begin
    if l_Tag.InheritsFrom(k2_idBlock) then
    begin
     l_Sub := l_SubList.Sub[l_Tag.IntA[k2_tiHandle]];
     if (l_Sub <> nil) then
      l_Sub.QueryInterface(IevDocumentPart, Result);    
     break;
    end//l_Tag.InheritsFrom(k2_idBlock)
    else
     l_Tag := l_Tag.Owner;
   end;//while l_Tag.IsValid
  end;//l_SubList <> nil
 end;//not l_Tag.InheritsFrom(k2_idDocument)
end;

function TevDocumentPartImplementation.pm_GetDocument: IevDocument;
  {-}
begin
 Result := f_Sub.pm_GetDocument;
end;

function TevDocumentPartImplementation.pm_GetSubPlace: TevSubPlace;
  {-}
begin
 Result := f_Sub.pm_GetSubPlace;
end;

function TevDocumentPartImplementation.Get_Obj: PInevObject;
  {-}
begin
 Result := f_Sub.Get_Obj;
end;

function TevDocumentPartImplementation.pm_GetName: Tl3WString;
  {reintroduce;}
  {-}
begin
 Result := f_Sub.pm_GetName;
end;

procedure TevDocumentPartImplementation.pm_SetName(const Value: Tl3WString);
  {reintroduce;}
  {-}
begin
 f_Sub.pm_SetName(Value);
end;

function  TevDocumentPartImplementation.pm_GetLayerID: Long;
  {-}
begin
 Result := f_Sub.pm_GetLayerID;
end;

function  TevDocumentPartImplementation.pm_GetID: Long;
  {-}
begin
 Result := f_Sub.pm_GetID;
end;

procedure TevDocumentPartImplementation.pm_SetID(Value: Long);
  {-}
begin
 f_Sub.pm_SetID(Value);
end;

function  TevDocumentPartImplementation.pm_GetFlags: Long;
  {-}
begin
 Result := f_Sub.pm_GetFlags;
end;

procedure TevDocumentPartImplementation.pm_SetFlags(Value: Long);
  {-}
begin
 f_Sub.pm_SetFlags(Value);
end;

function TevDocumentPartImplementation.pm_GetCursor: Ik2Tag;
  {-}
begin
 Result := f_Sub.pm_GetCursor;
end;

procedure TevDocumentPartImplementation.pm_SetCursor(const Value: Ik2Tag);
  {-}
begin
 f_Sub.pm_SetCursor(Value);
end;

function TevDocumentPartImplementation.pm_GetSubList: InevSubList;
  {-}
begin
 Result := f_Sub.pm_GetSubList;
end;

function TevDocumentPartImplementation.SubInstance: Ik2Tag;
  {-}
begin
 Result := f_Sub.SubInstance;
end;

function TevDocumentPartImplementation.pm_GetNext: IevSub;
  {-}
begin
 Result := nil;
end;

function TevDocumentPartImplementation.pm_GetLeafPara: Ik2Tag;
  {-}
begin
 Result := f_Sub.pm_GetLeafPara;
end;

function TevDocumentPartImplementation.pm_GetPara: Ik2Tag;
  {-}
begin
 Result := f_Sub.pm_GetPara;
end;

procedure TevDocumentPartImplementation.SetTo(const anEntryPoint: Ik2Tag);
  {-}
begin
 f_Sub.SetTo(anEntryPoint);
end;

function TevDocumentPartImplementation.Select(const Selection: InevSelection): Boolean;
  {-}
begin
 Result := f_Sub.Select(Selection);
end;

function TevDocumentPartImplementation.IsInIndex: Boolean;
  {-}
begin
 Result := f_Sub.IsInIndex;
end;

function TevDocumentPartImplementation.Exists: Bool;
  {-}
begin
 if (Redirect = nil) OR not Redirect.IsValid then
 begin
  Result := f_Sub.Exists;
  if Result then
  begin
   Redirect := f_Sub.pm_GetPara;
   Assert(Redirect.IsValid);
  end;//Result
 end//Redirect = nil
 else
  Result := f_Sub.Exists;
end;

function TevDocumentPartImplementation.Merge: Bool;
  {* - ���������� ���� �� ���������. }
var
 l_Para : InevParaList;
begin
 if Exists then
 begin
  if Redirect.QT(InevParaList, l_Para) then
   try
    Result := evMergeParaListWithNext(nil, l_Para, ev_mltBlocks, Processor)
   finally
    l_Para := nil;
   end//try..finally
  else
  begin
   Result := false;
   Assert(false);
  end;//GetRedirect.QT(InevParaList, l_Para)
 end//Exists
 else
  Result := false;
end;

function TevDocumentPartImplementation.COMQueryInterface(const IID: Tl3GUID; out Obj): Tl3HResult;
  //override;
  {-}
begin
 if IID.SomeOf([IevDocument, IevdDictEntry]) then
  Result := f_Sub.COMQueryInterface(IID, Obj)
 else
  Result := inherited COMQueryInterface(IID, Obj);
end;

function TevDocumentPartImplementation.Delete(const aView: InevView): Bool;
  {-}
begin
 Result := f_Sub.Delete(aView);
end;

// start class TevDocumentImplementation

class function TevDocumentImplementation.Make(const aSub: TevSubImplementation): IevDocument;
  //reintroduce;
  {-}
var
 l_Document : TevDocumentImplementation;
begin
 l_Document := Create(aSub);
 try
  Result := l_Document;
 finally
  l3Free(l_Document);
 end;//try..finally
end;

class function TevDocumentImplementation.Make(const aDocument  : Ik2Tag;
                                              const aProcessor : Ik2Processor): IevDocument;
  //overload;
  {-}
begin
 Result := inherited Make(aDocument, aProcessor, 0, ev_sbtSub) As IevDocument;  
end;

function TevDocumentImplementation.pm_GetComment: Tl3WString;
  {-}
begin
 with f_Sub.f_Document.Attr[k2_tiComment] do
  if IsValid then
   Result := AsPCharLen
  else
   l3AssignNil(Result);
end;

procedure TevDocumentImplementation.pm_SetComment(const Value: Tl3WString);
  {-}
var
 l_Pack : InevOp;
begin
 with f_Sub do begin
  l_Pack := StartOp;
  try
   f_Document.PCharLenW[k2_tiComment, l_Pack] := Tl3PCharLen(Value);
   if Assigned(l_Pack) then
    l_Pack.MarkModified(GetRedirect^);
  finally
   l_Pack := nil;
  end;//try..finally
 end;//with f_Sub
end;

function TevDocumentImplementation.pm_GetShortName: Tl3WString;
  {-}
begin
 Tl3WString(Result) := f_Sub.pm_GetName;
end;

procedure TevDocumentImplementation.pm_SetShortName(const Value: Tl3WString);
  {-}
begin
 f_Sub.pm_SetName(Value);
end;

function TevDocumentImplementation.pm_GetName: Tl3WString;
  //reintroduce;
  {-}
begin
 with f_Sub.f_Document.Attr[k2_tiName] do
  if IsValid then
   Result := AsPCharLen
  else
   l3AssignNil(Result);
end;

procedure TevDocumentImplementation.pm_SetName(const Value: Tl3WString);
  //reintroduce;
  {-}
var
 l_Pack : InevOp;
begin
 with f_Sub do begin
  l_Pack := StartOp;
  try
   f_Document.PCharLenW[k2_tiName, l_Pack] := Tl3PCharLen(Value);
   if Assigned(l_Pack) then
    l_Pack.MarkModified(GetRedirect^);
  finally
   l_Pack := nil;
  end;//try..finally
 end;//with f_Sub
end;

function TevDocumentImplementation.pm_GetParentDocument: IevDocument;
  {-}
var
 l_Para : Ik2Tag;
 l_Doc  : Ik2Tag;
begin
 Result := nil;
 if (f_Sub <> nil) AND (f_Sub.f_Document <> nil) then
 begin
  l_Para := f_Sub.f_Document.Owner;
  if evInPara(l_Para, k2_idDocument, l_Doc) then
   Result := Make(l_Doc, Processor);
 end;//f_Sub <> nil
end;
  
function TevDocumentPartImplementation.IsVisibleOnSubPanel: Boolean;
begin
 Result := True;
end;

end.

