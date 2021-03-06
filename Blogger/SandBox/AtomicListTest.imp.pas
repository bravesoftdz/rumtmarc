{$IfNDef AtomicListTest_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "SandBoxTest"
// ������: "AtomicListTest.imp.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: TestCaseMixIn::Class Shared Delphi Sand Box::SandBoxTest::FinalContainersTests::AtomicListTest
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define AtomicListTest_imp}
{$If defined(nsTest)}
 {$Include ..\SandBox\ListTest.imp.pas}
 _AtomicListTest_ = class(_ListTest_)
 private
 // private methods
   function RandomItem: _ItemType_;
 published
 // published methods
   procedure DoIt;
   procedure TestTwoLists;
   procedure TestInsert;
   procedure TestInsertAt0;
   procedure DeleteTest;
     {* ���� �������� �������� }
   procedure AddTest;
     {* ���� ���������� �������� }
   procedure RemoveTest;
     {* ���� �������� �������� �� �������� }
 end;//_AtomicListTest_
{$IfEnd} //nsTest

{$Else AtomicListTest_imp}

{$If defined(nsTest)}

{$Include ..\SandBox\ListTest.imp.pas}

// start class _AtomicListTest_

function _AtomicListTest_.RandomItem: _ItemType_;
//#UC START# *51E6ADE0016E_51E03FC80111_var*
var
 l_V : Cardinal;
//#UC END# *51E6ADE0016E_51E03FC80111_var*
begin
//#UC START# *51E6ADE0016E_51E03FC80111_impl*
 l_V := Random(1000);
 if (l_V > High(_ItemType_)) then
  Result := High(_ItemType_)
 else
  Result := l_V;
//#UC END# *51E6ADE0016E_51E03FC80111_impl*
end;//_AtomicListTest_.RandomItem

procedure _AtomicListTest_.DoIt;
//#UC START# *51DEB319037C_51E03FC80111_var*
const
 cCount = 1000;
var
 l_List : _ListType_;
 l_Count : IndexType;
 l_Index : IndexType;
//#UC END# *51DEB319037C_51E03FC80111_var*
begin
//#UC START# *51DEB319037C_51E03FC80111_impl*
 l_List := CreateList;
 try
  l_List.Count := cCount;
  Check(l_List.Count = cCount);
  Check(l_List.Capacity >= cCount);

  for l_Index := 0 to l_List.Count - 1 do
   Check(l_List[l_Index] = 0);

  l_Count := Random(cCount);
  l_List.Count := l_Count;
  Check(l_List.Count = l_Count, Format('�������� %d ���������. Count = %d', [l_Count, l_List.Count]));
  Check(l_List.Capacity >= l_Count, Format('�������� %d ���������. Capacity = %d', [l_Count, l_List.Capacity]));

  for l_Index := 0 to l_List.Count - 1 do
   Check(l_List[l_Index] = 0);
   
 finally
  FreeAndNil(l_List);
 end;//try..finally
//#UC END# *51DEB319037C_51E03FC80111_impl*
end;//_AtomicListTest_.DoIt

procedure _AtomicListTest_.TestTwoLists;
//#UC START# *51DED6FC03C1_51E03FC80111_var*
const
 cCount = 1000;
var
 l_A : _ListType_;
 l_B : _ListType_;
 l_Index : IndexType;
 l_Value : _ItemType_;
//#UC END# *51DED6FC03C1_51E03FC80111_var*
begin
//#UC START# *51DED6FC03C1_51E03FC80111_impl*
 l_A := CreateList;
 try
  l_B := CreateList;
  try
   l_A.Count := cCount;
   for l_Index := 0 to l_A.Count - 1 do
   begin
    l_Value := RandomItem;
    l_A[l_Index] := l_Value;
    Check(l_A[l_Index] = l_Value);
   end;//for l_Index

   l_B.Count := l_A.Count;
   for l_Index := 0 to l_A.Count - 1 do
   begin
    l_B[l_Index] := l_A[l_Index];
   end;//for l_Index

   for l_Index := 0 to l_A.Count - 1 do
   begin
    Check(l_B[l_Index] = l_A[l_Index]);
   end;//for l_Index
  finally
   FreeAndNil(l_B);
  end;//try..finally
 finally
  FreeAndNil(l_A);
 end;//try..finally
//#UC END# *51DED6FC03C1_51E03FC80111_impl*
end;//_AtomicListTest_.TestTwoLists

procedure _AtomicListTest_.TestInsert;
//#UC START# *51E6AC74038B_51E03FC80111_var*
const
 cCount = 1000;
var
 l_List : _ListType_;
 l_Value : _ItemType_;
 l_Index : IndexType;
//#UC END# *51E6AC74038B_51E03FC80111_var*
begin
//#UC START# *51E6AC74038B_51E03FC80111_impl*
 l_List := CreateList;
 try
  for l_Index := 0 to cCount do
  begin
   l_Value := RandomItem;
   l_List.Insert(l_Index, l_Value);
   Check(l_List.Count = l_Index + 1);
   Check(l_List[l_Index] = l_Value);
  end;//for l_Index
 finally
  FreeAndNil(l_List);
 end;//try..finally
//#UC END# *51E6AC74038B_51E03FC80111_impl*
end;//_AtomicListTest_.TestInsert

procedure _AtomicListTest_.TestInsertAt0;
//#UC START# *51E6B4260008_51E03FC80111_var*
const
 cCount = 1000;
var
 l_List : _ListType_;
 l_Value : _ItemType_;
 l_Index : IndexType;
//#UC END# *51E6B4260008_51E03FC80111_var*
begin
//#UC START# *51E6B4260008_51E03FC80111_impl*
 l_List := CreateList;
 try
  for l_Index := 0 to cCount do
  begin
   l_Value := RandomItem;
   l_List.Insert(0, l_Value);
   Check(l_List.Count = l_Index + 1);
   Check(l_List[0] = l_Value);
  end;//for l_Index
 finally
  FreeAndNil(l_List);
 end;//try..finally
//#UC END# *51E6B4260008_51E03FC80111_impl*
end;//_AtomicListTest_.TestInsertAt0

procedure _AtomicListTest_.DeleteTest;
//#UC START# *51E7F6EF0285_51E03FC80111_var*
const
 cCount = 1000;
var
 l_List : _ListType_;
 l_Value : _ItemType_;
 l_Index : IndexType;
 l_Prev : _ItemType_;
//#UC END# *51E7F6EF0285_51E03FC80111_var*
begin
//#UC START# *51E7F6EF0285_51E03FC80111_impl*
 l_List := CreateList;
 try
  for l_Index := 0 to cCount do
  begin
   l_Value := RandomItem;
   l_List.Insert(l_Index, l_Value);
   Check(l_List.Count = l_Index + 1);
   Check(l_List[l_Index] = l_Value);
  end;//for l_Index

  while not l_List.Empty do
  begin
   l_Index := Random(l_List.Count - 1);
   if (l_Index < l_List.Count - 1) then
   begin
    l_Prev := l_List[l_Index + 1];
    l_List.Delete(l_Index);
    if l_List.Empty then
     break;
    Check(l_List[l_Index] = l_Prev);
   end//l_Index < l_List.Count - 1
   else
   begin
    if (l_Index = 0) then
     l_List.Delete(l_Index)
    else
    begin
     l_Prev := l_List[l_Index - 1];
     l_List.Delete(l_Index);
     if l_List.Empty then
      break;
     Check(l_List[l_Index - 1] = l_Prev);
    end;//l_Index = 0
   end;//l_Index < l_List.Count - 1
  end;//while l_List.Count
 finally
  FreeAndNil(l_List);
 end;//try..finally
//#UC END# *51E7F6EF0285_51E03FC80111_impl*
end;//_AtomicListTest_.DeleteTest

procedure _AtomicListTest_.AddTest;
//#UC START# *51E80DC50154_51E03FC80111_var*
const
 cCount = 1000;
var
 l_List : _ListType_;
 l_Value : _ItemType_;
 l_Index : IndexType;
//#UC END# *51E80DC50154_51E03FC80111_var*
begin
//#UC START# *51E80DC50154_51E03FC80111_impl*
 l_List := CreateList;
 try
  for l_Index := 0 to cCount do
  begin
   l_Value := RandomItem;
   l_List.Add(l_Value);
   Check(l_List.Last = l_Value);
  end;//for l_Index
 finally
  FreeAndNil(l_List);
 end;//try..finally
//#UC END# *51E80DC50154_51E03FC80111_impl*
end;//_AtomicListTest_.AddTest

procedure _AtomicListTest_.RemoveTest;
//#UC START# *51E8127802AF_51E03FC80111_var*
const
 cCount = 1000;
var
 l_List : _ListType_;
 l_Value : _ItemType_;
 l_Index : IndexType;
//#UC END# *51E8127802AF_51E03FC80111_var*
begin
//#UC START# *51E8127802AF_51E03FC80111_impl*
 l_List := CreateList;
 try
  for l_Index := 0 to cCount do
  begin
   l_Value := RandomItem;
   l_List.Add(l_Value);
   Check(l_List.Last = l_Value);
  end;//for l_Index

  while not l_List.Empty do
  begin
   l_Value := RandomItem;
   l_List.Remove(l_Value);
  end;//while not
  
 finally
  FreeAndNil(l_List);
 end;//try..finally
//#UC END# *51E8127802AF_51E03FC80111_impl*
end;//_AtomicListTest_.RemoveTest

{$IfEnd} //nsTest

{$EndIf AtomicListTest_imp}
