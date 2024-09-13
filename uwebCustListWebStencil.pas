unit uwebCustListWebStencil;

interface

uses
  System.SysUtils, System.Classes, Web.HTTPApp, Web.HTTPProd, Web.Stencils;

type
  TwebCustListWebStencil = class(TWebModule)
    wspIndex: TWebStencilsProcessor;
    wsEngineCustList: TWebStencilsEngine;
    wspLoginFailed: TWebStencilsProcessor;
    wspCustList: TWebStencilsProcessor;
    wspAccessDenied: TWebStencilsProcessor;
    wspCustEdit: TWebStencilsProcessor;
    procedure WebModuleCreate(Sender: TObject);
    procedure webCustListWebStencilDefaultHandlerAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse;
      var Handled: Boolean);
    procedure webCustListWebStencilwaLoginVerifyAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse;
      var Handled: Boolean);
    procedure webCustListWebStencilwaListCustomersAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse;
      var Handled: Boolean);
    procedure webCustListWebStencilwaEditCustomerAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse;
      var Handled: Boolean);
    procedure wsEngineCustListError(Sender: TObject; const AMessage: string);
  private
    FVersion: string;
    FTitle: string;
  public
    // this will not work in the WebStencilsEngine
    const
      WebTitle = 'Customer List for WebStencils';
      WebVersion = '0.3';
    // these will be available by the WebStencilsEngine parser
    property Title: string read FTitle write FTitle;
    property Version: string read FVersion write FVersion;
  end;

var
  WebModuleClass: TComponentClass = TwebCustListWebStencil;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  Dialogs, System.bindings.EvalProtocol, System.Bindings.Methods,
  udmCust;

procedure TwebCustListWebStencil.webCustListWebStencilDefaultHandlerAction(Sender: TObject; Request: TWebRequest;
  Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content := wspIndex.Content;
  Handled := True;
end;

procedure TwebCustListWebStencil.webCustListWebStencilwaEditCustomerAction(Sender: TObject; Request: TWebRequest;
  Response: TWebResponse; var Handled: Boolean);
var
  CustNo: string;
  CustNum: Integer;
begin
  if Request.QueryFields.Count > 0 then
  begin
    CustNo := Request.QueryFields.Values['cust_no'];
    if TryStrToInt(CustNo, CustNum) then
    begin
      dmCust.OpenCustDetails(CustNum);
      if not wsEngineCustList.HasVar('CustDetails') then
        wsEngineCustList.AddVar('CustDetails', dmCust.qryCustDetails, False);
      try
        Response.Content := wspCustEdit.Content;
      except
        on E:EWebStencilsLoginRequired do
          Response.Content := wspAccessDenied.Content;
      end;
      dmCust.CloseCustDetails;
    end;
  end;
end;

procedure TwebCustListWebStencil.webCustListWebStencilwaListCustomersAction(Sender: TObject; Request: TWebRequest;
  Response: TWebResponse; var Handled: Boolean);
begin
  dmCust.qryCustomers.Open;
  try
    if not wsEngineCustList.HasVar('CustList') then
      wsEngineCustList.AddVar('CustList', dmCust.qryCustomers, False);
    try
      Response.Content := wspCustList.Content;
    except
      on E:EWebStencilsLoginRequired do
        Response.Content := wspAccessDenied.Content;
    end;
  finally
    dmCust.qryCustomers.Close;
  end;
end;

procedure TwebCustListWebStencil.webCustListWebStencilwaLoginVerifyAction(Sender: TObject; Request: TWebRequest;
  Response: TWebResponse; var Handled: Boolean);
var
  Username, Password: string;
begin
  Username := Request.ContentFields.Values['uname'];
  Password := Request.ContentFields.Values['psw'];
  if dmCust.LoginCheck(Username, Password) then
  begin
    wspCustList.UserLoggedIn := True;
    wspCustEdit.UserLoggedIn := True;
    Response.SendRedirect('/custlist');
  end else
    Response.Content := wspLoginFailed.Content;

  Handled := True;
end;

procedure TwebCustListWebStencil.WebModuleCreate(Sender: TObject);
begin
  FTitle := WebTitle;
  FVersion := WebVersion;
  wsEngineCustList.AddVar('App', Self, False);
end;

procedure TwebCustListWebStencil.wsEngineCustListError(Sender: TObject; const AMessage: string);
begin
  ShowMessage(AMessage);
end;

end.
