unit ReallocMemTest;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "SandBoxTest"
// ������: "ReallocMemTest.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: TestCase::Class Shared Delphi Sand Box::SandBoxTest::Emba::TReallocMemTest
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\SandBox\sbtDefine.inc}

interface

{$If defined(nsTest)}
uses
  TestFrameWork
  ;
{$IfEnd} //nsTest

{$If defined(nsTest)}
type
 TReallocMemTest = class(TTestCase)
 published
 // published methods
   procedure DoIt;
 end;//TReallocMemTest
{$IfEnd} //nsTest

implementation

{$If defined(nsTest)}

// start class TReallocMemTest

procedure TReallocMemTest.DoIt;
//#UC START# *51643E2202AA_51643E02018F_var*
(*const
 cMagicSize0 = 10;
 cMagicSize = 3120;
 cNewMagicSize = 6144;
var
 l_P : PAnsiChar;
 l_I : Integer;*)
var
 l_Index : Integer;
 l_P : PAnsiChar;
 l_I : Integer;
 l_Size : Integer;
 l_OldSize : Integer;
//#UC END# *51643E2202AA_51643E02018F_var*
begin
//#UC START# *51643E2202AA_51643E02018F_impl*
 for l_Index := 0 to 5000 do
 begin
  l_Size := 10;
  GetMem(l_P, l_Size);
  try
   while (l_Size <= 6144 * 2) do
   begin
    FillChar(l_P^, l_Size, Random($ff));
    l_OldSize := l_Size;
    l_I := PInteger(l_P + l_OldSize - SizeOf(Integer))^;
    Inc(l_Size, Random(20));
    ReallocMem(l_P, l_Size);
    Check(PInteger(l_P + l_OldSize - SizeOf(Integer))^ = l_I);
   end;//l_Size <= 6144
  finally
   FreeMem(l_P);
  end;//try..finally
 end;//for l_Index
(* GetMem(l_P, cMagicSize0);
 try
  FillChar(l_P^, cMagicSize0, 10);
  l_I := PInteger(l_P + cMagicSize0 - SizeOf(Integer))^;
  ReallocMem(l_P, cNewMagicSize);
  Check(PInteger(l_P + cMagicSize0 - SizeOf(Integer))^ = l_I);

  FillChar(l_P^, cMagicSize, 10);
  l_I := PInteger(l_P + cMagicSize - SizeOf(Integer))^;
  ReallocMem(l_P, cNewMagicSize);
  Check(PInteger(l_P + cMagicSize - SizeOf(Integer))^ = l_I);
 finally
  FreeMem(l_P);
 end;//try..finally*)
//#UC END# *51643E2202AA_51643E02018F_impl*
end;//TReallocMemTest.DoIt

{$IfEnd} //nsTest

initialization
 TestFramework.RegisterTest(TReallocMemTest.Suite);

end.