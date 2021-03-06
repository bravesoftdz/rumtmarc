unit myIntegerListTests;

interface

uses
 TestFramework
 ;

type
 TmyIntegerListTests = class(TTestCase)
  published
   procedure ListAdd;
   procedure ListInsert;
   procedure ListDelete;
   procedure ListCount;
   procedure ListItem;
   procedure QCTicket1;
 end;//TmyIntegerListTests

implementation

uses
 System.SysUtils,
 myIntegerList
 ;

procedure TmyIntegerListTests.ListAdd;
var
 l_List : TmyIntegerList;
begin
 l_List := TmyIntegerList.Create;
 try
  l_List.Add(Random(1000));
 finally
  FreeAndNil(l_List);
 end;//try..finally
end;

procedure TmyIntegerListTests.ListInsert;
var
 l_List : TmyIntegerList;
begin
 l_List := TmyIntegerList.Create;
 try
  l_List.Insert(0, Random(1000));
 finally
  FreeAndNil(l_List);
 end;//try..finally
end;

procedure TmyIntegerListTests.ListDelete;
var
 l_List : TmyIntegerList;
begin
 l_List := TmyIntegerList.Create;
 try
  l_List.Delete(0);
 finally
  FreeAndNil(l_List);
 end;//try..finally
end;

procedure TmyIntegerListTests.ListCount;
var
 l_List : TmyIntegerList;
begin
 l_List := TmyIntegerList.Create;
 try
  Check(l_List.Count = 0, '������ ������ ������ ��������� 0 ���������');
 finally
  FreeAndNil(l_List);
 end;//try..finally
end;

procedure TmyIntegerListTests.ListItem;
var
 l_List : TmyIntegerList;
begin
 l_List := TmyIntegerList.Create;
 try
  l_List.Item[0];
 finally
  FreeAndNil(l_List);
 end;//try..finally
end;

procedure TmyIntegerListTests.QCTicket1;
var
 l_List : TmyIntegerList;
begin
 l_List := TmyIntegerList.Create;
 try
  l_List.Add(Random(54365));
  l_List.Delete(0);
 finally
  FreeAndNil(l_List);
 end;//try..finally
end;

initialization
  TestFramework.RegisterTest(TmyIntegerListTests.Suite);

end.
