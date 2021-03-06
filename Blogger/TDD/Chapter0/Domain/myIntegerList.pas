unit myIntegerList;

interface

type
 TmyIntegerList = class
  public
   type
    IndexType = Integer;
    ItemType = Integer;
  private
   type
    ItemsArray = array of ItemType;
  private
   f_Items : ItemsArray;
  protected
   function pm_GetCount: IndexType;
   function pm_GetItem(anIndex: IndexType): ItemType;
  public
   procedure Add(anItem: ItemType);
   procedure Insert(anIndex: IndexType; anItem: ItemType);
   procedure Delete(anIndex: IndexType);
   property Count: IndexType
    read pm_GetCount;
   property Item[anIndex: IndexType]: ItemType
    read pm_GetItem;
 end;//TmyIntegerList

implementation

// TmyIntegerList

function TmyIntegerList.pm_GetCount: IndexType;
begin
 Result := Length(f_Items);
end;

function TmyIntegerList.pm_GetItem(anIndex: IndexType): ItemType;
begin
 if (Self.Count = 0) then
 // - �� �� ���� � ���, ��� ������ - � �� - �� ���������
  Result := Random(5676)
 else
  Result := f_Items[anIndex];
end;

procedure TmyIntegerList.Add(anItem: ItemType);
begin
 SetLength(f_Items, Length(f_Items) + 1);
 f_Items[High(f_Items)] := anItem;
end;

procedure TmyIntegerList.Insert(anIndex: IndexType; anItem: ItemType);
begin
 if (anIndex = Self.Count) then
  Add(anItem)
 else
  Assert(false, '�� �����������');
  // - �� �� ���� � ��� ��� ������, �� ���� - ��������
end;

procedure TmyIntegerList.Delete(anIndex: IndexType);
begin
 if (anIndex < 0) OR (anIndex >= Self.Count) then
 // - �� ������ ��� �������
  Exit
 else
 if (anIndex = Self.Count - 1) then
  SetLength(f_Items, Self.Count - 1)
 else
  Assert(false, '�� �� ���� � ��� ��� ������');
end;

end.
