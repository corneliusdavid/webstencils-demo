object dmCust: TdmCust
  Height = 315
  Width = 427
  object FDConnChinook: TFDConnection
    Params.Strings = (
      'ConnectionDef=WebStencilsChinook')
    ConnectedStoredUsage = [auDesignTime]
    Connected = True
    LoginPrompt = False
    Left = 136
    Top = 104
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 144
    Top = 176
  end
  object qryUserVerify: TFDQuery
    Connection = FDConnChinook
    SQL.Strings = (
      'SELECT FirstName, LastName, EmployeeID'
      'FROM Employees'
      'WHERE Upper(FirstName) = Upper(:FName)'
      '  AND :Password = EmployeeId || LastName;')
    Left = 240
    Top = 56
    ParamData = <
      item
        Name = 'FNAME'
        DataType = ftString
        ParamType = ptInput
        Value = 'andrew'
      end
      item
        Name = 'PASSWORD'
        DataType = ftString
        ParamType = ptInput
        Value = '1Adams'
      end>
  end
  object qryCustCount: TFDQuery
    Connection = FDConnChinook
    SQL.Strings = (
      'select count(1) as CustCount from customers')
    Left = 256
    Top = 216
    object qryCustCountCustCount: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'CustCount'
      Origin = 'CustCount'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object qryCustomers: TFDQuery
    OnCalcFields = qryCustomersCalcFields
    Connection = FDConnChinook
    SQL.Strings = (
      'SELECT c.CustomerId, c.FirstName, c.LastName, c.Company, '
      '  COUNT(i.InvoiceId) AS InvCount, SUM(i.Total) AS TotalInvoices'
      'FROM customers c'
      'JOIN invoices i ON c.CustomerId = i.CustomerId '
      'GROUP BY c.CustomerId '
      'ORDER BY c.LastName'
      ' ')
    Left = 256
    Top = 136
    object qryCustomersCustomerId: TFDAutoIncField
      FieldName = 'CustomerId'
      Origin = 'CustomerId'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object qryCustomersFirstName: TWideStringField
      FieldName = 'FirstName'
      Origin = 'FirstName'
      Required = True
      Size = 40
    end
    object qryCustomersLastName: TWideStringField
      FieldName = 'LastName'
      Origin = 'LastName'
      Required = True
    end
    object qryCustomersCompany: TWideStringField
      FieldName = 'Company'
      Origin = 'Company'
      Size = 80
    end
    object qryCustomersInvCount: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'InvCount'
      Origin = 'InvCount'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryCustomersTotalInvoices: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'TotalInvoices'
      Origin = 'TotalInvoices'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryCustomersIsBusiness: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'IsBusiness'
      Calculated = True
    end
  end
  object qryCustDetails: TFDQuery
    Connection = FDConnChinook
    SQL.Strings = (
      'SELECT CustomerId, FirstName, LastName, Company,'
      '  Address, City, [State], Country, PostalCode, Phone, Email'
      'FROM Customers'
      'WHERE CustomerId = :CustID')
    Left = 328
    Top = 160
    ParamData = <
      item
        Name = 'CUSTID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 3
      end>
    object qryCustDetailsCustomerId: TFDAutoIncField
      FieldName = 'CustomerId'
      Origin = 'CustomerId'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object qryCustDetailsFirstName: TWideStringField
      FieldName = 'FirstName'
      Origin = 'FirstName'
      Required = True
      Size = 40
    end
    object qryCustDetailsLastName: TWideStringField
      FieldName = 'LastName'
      Origin = 'LastName'
      Required = True
    end
    object qryCustDetailsCompany: TWideStringField
      FieldName = 'Company'
      Origin = 'Company'
      Size = 80
    end
    object qryCustDetailsAddress: TWideStringField
      FieldName = 'Address'
      Origin = 'Address'
      Size = 70
    end
    object qryCustDetailsCity: TWideStringField
      FieldName = 'City'
      Origin = 'City'
      Size = 40
    end
    object qryCustDetailsState: TWideStringField
      FieldName = 'State'
      Origin = 'State'
      Size = 40
    end
    object qryCustDetailsCountry: TWideStringField
      FieldName = 'Country'
      Origin = 'Country'
      Size = 40
    end
    object qryCustDetailsPostalCode: TWideStringField
      FieldName = 'PostalCode'
      Origin = 'PostalCode'
      Size = 10
    end
    object qryCustDetailsPhone: TWideStringField
      FieldName = 'Phone'
      Origin = 'Phone'
      Size = 24
    end
    object qryCustDetailsEmail: TWideStringField
      FieldName = 'Email'
      Origin = 'Email'
      Required = True
      Size = 60
    end
  end
end
