program CustListWebStencil;
{$APPTYPE GUI}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  ufrmCustListWebStencil in 'ufrmCustListWebStencil.pas' {Form2},
  uwebCustListWebStencil in 'uwebCustListWebStencil.pas' {webCustListWebStencil: TWebModule},
  udmCust in 'udmCust.pas' {dmCust: TDataModule};

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TdmCust, dmCust);
  Application.Run;
end.
