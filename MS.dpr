program MS;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  HeaderFooterTemplate in 'HeaderFooterTemplate.pas' {HeaderFooterForm},
  msLine,
  msRectangle,
  msCircle,
  msUseCaseLikeEllipse,
  msRoundedRectange
  ;

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(THeaderFooterForm, HeaderFooterForm);
  Application.Run;
end.
