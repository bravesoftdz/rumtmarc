        ��  ��                  �  P   ��
 E V S T A N D A R D T E X T S T Y L E T A B L E         0        %producer '������� 1.0.0.5'
%format version 0.140 revision date '15/12/1999' brackets { }
// $Id: evttStd.Unicode.evs,v 1.31 2011/09/23 06:14:55 lulin Exp $
// $Log: evttStd.Unicode.evs,v $
// Revision 1.31  2011/09/23 06:14:55  lulin
// - ������ ������� ������ � ����� �� ������ ������.
//
// Revision 1.30  2011/09/20 09:55:02  lulin
// - ������ ������ ������.
//
// Revision 1.29  2008/08/06 15:35:05  lulin
// - <K>: 106988216.
//
// Revision 1.28  2008/06/30 11:00:51  lulin
// - ����� �������� �� ������.
//
// Revision 1.27  2008/06/25 09:06:43  lulin
// - ��������� ���������� Enum'� � ������� �����.
// - ������ ����� �� ������.
// - ������� ������� ������������� �����������.
//
// Revision 1.26  2008/06/24 13:07:50  lulin
// - ���������� ����� �� ������.
//
// Revision 1.25  2008/05/26 15:27:11  lulin
// - <K>: 91850556.
//
// Revision 1.24  2005/03/16 16:30:09  lulin
// - new style: "���������� ��� ���������".
//
// Revision 1.23  2004/07/21 06:33:37  law
// - ��������� ����� ��� ������������.
//
// Revision 1.22  2004/05/13 09:34:49  law
// - �������� ����� ���������� "��������� ������".
//
// Revision 1.21  2003/12/08 13:02:53  law
// - new style: ev_saNotApplied  - "�� ������� � ����".
//
// Revision 1.20  2003/11/04 12:50:16  law
// - new behavior: "���������� ������������" ������������� �����.
//
// Revision 1.19  2003/09/08 12:09:05  law
// - new style: "����������".
//
// Revision 1.18  2003/04/15 09:41:47  law
// - new behavior: ��� ee.dll ������� ����������� ������� � ������������� � ��������� ������ ���������������� �����������.
//
// Revision 1.17  2003/04/14 14:42:49  law
// - new style: ev_saUserComment.
//
// Revision 1.16  2003/01/15 13:53:40  law
// - new style: ev_saVersionInfo - "���������� � ������".
//
// Revision 1.15  2002/05/30 15:21:54  law
// - cleanup: ������ ����� ev_saWideTable.
//
// Revision 1.14  2002/05/29 11:13:54  law
// - new style: ev_saWideTable.
//
// Revision 1.13  2001/11/22 12:58:25  law
// - change style: � ����� "���������� (�������)" ������� ������������ �� ������.
//
// Revision 1.12  2001/11/02 15:11:18  law
// - change.
//
// Revision 1.11  2001/10/29 13:43:58  law
// - new style: "����������� �����������".
//
// Revision 1.10  2001/02/27 15:36:34  law
// - �������� �����������.
//
// Revision 1.9  2001/02/23 13:44:26  law
// - � ���������� ��������� ��������� �������� AllowHyphen.
//
// Revision 1.8  2000/12/27 09:05:45  law
// - bug fix: ������� ���� k2_tiVisible ��� ������������ � �������������� ������ � NSRC.
//
// Revision 1.7  2000/12/15 15:11:37  law
// - ��������� ��������� Log.
//

: TextStyle = {
 Handle = -12
 Name = '������������'
 FirstIndent = 0
 FirstLineIndent = 0
 Justification = ev_itPreformatted
}
: TextStyle = {
 Handle = -13
 Name = '��������� �����'
 Font = {
  Bold = True
  ForeColor = clWhite
  BackColor = clRed
 }
 Style = -10
 VisibleToUser = false
}
: TextStyle = {
 Handle = -2
 Name = '���������� (OEM)'
 Font = {
  CodePage = 1
 }
 Style = -12
}
: TextStyle = {
 Handle = -11
 Name = '����������� ������'
 Style = -8
}
: TextStyle = {
 Handle = -7
 Name = '������� ����'
 Font = {
  ForeColor = clOlive
 }
 Style = -10
}
: TextStyle = {
 Handle = -15
 Name = '��������� ������'
 LeftIndent = 2321
}
: TextStyle = {
 Handle = -17
 FirstIndent = 0
 FirstLineIndent = 0
 Name = '���������� (�������)'
 Justification = ev_itWidth
}
: TextStyle = {
 FirstIndent = 720
 FirstLineIndent = 720
 Handle = -20
 Style = -17
 Name = '����� � �������'
 AllowHyphen = true
}
: TextStyle = {
 Handle = -18
 Name = '���������� (���. �������)'
 Style = -17
 Justification = ev_itLeft
}
: TextStyle = {
 Handle = -19
 Name = '���������� (����. �������)'
 Style = -17
 Justification = ev_itRight
}
: TextStyle = {
 Handle = -21
 Name = '����������� �����������'
 FirstIndent = 0
 FirstLineIndent = 0
 Justification = ev_itLeft
 Font = {
  BackColor = clYellow
 } 
}
: TextStyle = {
 Handle = -23
 Style = -9 
 Name = '����������� ������������'
 Font = {
  ForeColor = clBlack
 }
 Justification = ev_itLeft
 VisibleToUser = false
} 
: TextStyle = {
 Handle = -24
 Style = -12
 Name = '����������'
 Visible = false
}
: TextStyle = {
 Handle = -25
 Style = -7
 Name = '�� ������� � ����'
 Font = {
  ForeColor = clTeal
 }
}
: TextStyle = {
 Handle = -26
 Name = '��������� ������'
 FirstIndent = 0
 FirstLineIndent = 0
 LeftIndent = 0
 RightIndent = 118
}
: TextStyle = {
 Handle = -27
 Name = '���������� (�����)'
 Style = -18
 Font = {
  Size = 6
 }
 VisibleToUser = false
}
: TextStyle = {
 Handle = -28
 Name = '���������� (������)'
 Style = -19
 Font = {
  Size = 6
 }
 VisibleToUser = false
}
: TextStyle = {
 Handle = -30
 Name  = '���������� (���������)'
}
: TextStyle = {
 Handle = -37
 Style = -10
 Name = '��������� ����������'
 Apply2Para = True
 Justification = ev_itRight
} 