unit eeExceptions;

{ ���������� "�������"    }
{ �����: ����� �.�. �     }
{ ������: eeExceptions -  }
{ �����: 20.10.2003 19:43 }
{ $Id: eeExceptions.pas,v 1.3 2004/07/21 10:32:57 law Exp $ }

// $Log: eeExceptions.pas,v $
// Revision 1.3  2004/07/21 10:32:57  law
// - new behavior: ��� ������� ������� ����������� ��� ����������� ������������ ������ ���������� EeeUserCommentsHidden.
// - new behavior: ��������� Drag'n'Drop � �������� ��� ����������� ������������.
//
// Revision 1.2  2003/10/30 11:51:44  law
// - bug fix: �� ������ ����������� ����������� ������� ���������.
//
// Revision 1.1  2003/10/20 16:02:03  law
// - change: ������ ��������� "���������" ����������.
// - new behavior: ����� �� ���������� ���������� (�������� � ���������).
//

{$I evDefine.inc }

interface

uses
  evExcept
  ;

type
  EeeCannotDeletePara = class(EevReadOnly);  
  EeeCannotInsertPara = class(EevReadOnly);
  EeeUserCommentsHidden = class(EevReadOnly);

implementation

end.

