unit Script.Axiomatics;

interface

uses
 Script.Dictionary
 ;

type
 TscriptAxiomatics = class(TscriptDictionary)
  private
   class var f_Instance : TscriptAxiomatics;
  public
   class function Instance: TscriptAxiomatics;
 end;//TscriptAxiomatics

implementation

uses
 System.SysUtils
 ;

class function TscriptAxiomatics.Instance: TscriptAxiomatics;
begin
 if (f_Instance = nil) then
  f_Instance := TscriptAxiomatics.Create;
 Result := f_Instance;
end;

initialization

finalization
 FreeAndNil(TscriptAxiomatics.f_Instance);

end.
