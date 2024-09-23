unit udmCust;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet;

type
  TdmCust = class(TDataModule)
    FDConnChinook: TFDConnection;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    qryUserVerify: TFDQuery;
    qryCustCount: TFDQuery;
    qryCustCountCustCount: TLargeintField;
    qryCustomers: TFDQuery;
    qryCustomersCustomerId: TFDAutoIncField;
    qryCustomersFirstName: TWideStringField;
    qryCustomersLastName: TWideStringField;
    qryCustomersInvCount: TLargeintField;
    qryCustomersTotalInvoices: TFloatField;
    qryCustomersCompany: TWideStringField;
    qryCustDetails: TFDQuery;
    qryCustDetailsCustomerId: TFDAutoIncField;
    qryCustDetailsFirstName: TWideStringField;
    qryCustDetailsLastName: TWideStringField;
    qryCustDetailsCompany: TWideStringField;
    qryCustDetailsAddress: TWideStringField;
    qryCustDetailsCity: TWideStringField;
    qryCustDetailsState: TWideStringField;
    qryCustDetailsCountry: TWideStringField;
    qryCustDetailsPostalCode: TWideStringField;
    qryCustDetailsPhone: TWideStringField;
    qryCustDetailsEmail: TWideStringField;
    qryCustomersIsBusiness: TBooleanField;
    procedure qryCustomersCalcFields(DataSet: TDataSet);
  public
    function LoginCheck(const Username, Password: string): Boolean;
    function CustCount: Integer;
    procedure OpenCustDetails(const CustID: Integer);
    procedure CloseCustDetails;
  end;

var
  dmCust: TdmCust;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmCust }

function TdmCust.CustCount: Integer;
begin
  qryCustCount.Open;
  Result := qryCustCountCustCount.AsInteger;
  qryCustCount.Close;
end;

function TdmCust.LoginCheck(const Username, Password: string): Boolean;
begin
  qryUserVerify.ParamByName('FName').AsString := UpperCase(Username);
  qryUserVerify.ParamByName('Password').AsString := Password;
  qryUserVerify.Open;
  Result := qryUserVerify.RecordCount > 0;
  qryUserVerify.Close;
end;

procedure TdmCust.OpenCustDetails(const CustID: Integer);
begin
  qryCustDetails.ParamByName('CustID').AsInteger := CustID;
  qryCustDetails.Open;
end;

procedure TdmCust.qryCustomersCalcFields(DataSet: TDataSet);
begin
  qryCustomersIsBusiness.AsBoolean := qryCustomersCompany.AsString.Length > 0;
end;

procedure TdmCust.CloseCustDetails;
begin
  qryCustDetails.Close;
end;

end.
