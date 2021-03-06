unit ddConfigStorages;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "dd$AppConfig"
// ������: "w:/common/components/rtl/Garant/dd/ddConfigStorages.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<UtilityPack::Class>> Shared Delphi::dd$AppConfig::ddConfigStorages::ddConfigStorages
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

interface

uses
  l3Interfaces
  ;

type
 IddConfigStorage = interface(IUnknown)
  {* ��������� ��� ������-������ ������ ������������ }
   ['{86F1D5B0-F190-4497-AA2E-1E9F453F7066}']
   function Get_Section: AnsiString; stdcall;
   procedure Set_Section(const aValue: AnsiString); stdcall;
   function ReadBool(const Alias: AnsiString;
    Default: Boolean): Boolean; stdcall;
   function ReadDateTime(const Alias: AnsiString;
    Default: TDateTime): TDateTime; stdcall;
   function ReadInteger(const Alias: AnsiString;
    Default: Integer): Integer; stdcall;
   function ReadString(const Alias: AnsiString;
    const Default: AnsiString): Il3CString; stdcall;
   procedure WriteBool(const Alias: AnsiString;
    B: Boolean); stdcall;
   procedure WriteDateTime(const Alias: AnsiString;
    DT: TDateTime); stdcall;
   procedure WriteInteger(const Alias: AnsiString;
    I: Integer); stdcall;
   procedure WriteString(const Alias: AnsiString;
    const S: AnsiString); stdcall;
   property Section: AnsiString
     read Get_Section
     write Set_Section;
 end;//IddConfigStorage

implementation

end.