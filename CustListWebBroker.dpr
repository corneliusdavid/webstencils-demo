program CustListWebBroker;
{$APPTYPE GUI}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  ufrmCustListWebStarter in 'ufrmCustListWebStarter.pas' {frmCustListWebBroker},
  uwebCustListWebBroker in 'uwebCustListWebBroker.pas' {webCustListWebBroker: TWebModule},
  udmCust in 'udmCust.pas' {dmCust: TDataModule};

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TfrmCustListWebBroker, frmCustListWebBroker);
  Application.CreateForm(TdmCust, dmCust);
  Application.Run;
end.
