object webCustListWebBroker: TwebCustListWebBroker
  OnCreate = WebModuleCreate
  Actions = <
    item
      Default = True
      MethodType = mtGet
      Name = 'DefaultHandler'
      PathInfo = '/'
      Producer = ppIndex
    end
    item
      MethodType = mtPost
      Name = 'waLoginVerify'
      PathInfo = '/login'
      OnAction = webCustListWebBrokerwaLoginVerifyAction
    end
    item
      MethodType = mtGet
      Name = 'waListCustomers'
      PathInfo = '/custlist'
      OnAction = webCustListWebBrokerwaListCustomersAction
    end
    item
      MethodType = mtGet
      Name = 'waEditCustomer'
      PathInfo = '/custedit'
      OnAction = webCustListWebBrokerwaEditCustomerAction
    end>
  Height = 340
  Width = 498
  object ppIndex: TPageProducer
    HTMLFile = 'index-wbroker.html'
    OnHTMLTag = ppAllHTMLTags
    Left = 120
    Top = 64
  end
  object ppCustList: TPageProducer
    HTMLFile = 'custlist-wbroker.html'
    OnHTMLTag = ppAllHTMLTags
    Left = 107
    Top = 152
  end
  object ppLoginFailed: TPageProducer
    HTMLFile = 'loginfailed-wbroker.html'
    OnHTMLTag = ppAllHTMLTags
    Left = 219
    Top = 32
  end
  object ppPageFooter: TPageProducer
    HTMLDoc.Strings = (
      ''
      '  </div>'
      ''
      '<div><p>&nbsp;</p></div>'
      
        '<div class="text-secondary"><em>Customer Manager for WebBroker</' +
        'em></div>'
      ''
      '</body>'
      '</html>')
    OnHTMLTag = ppAllHTMLTags
    Left = 352
    Top = 88
  end
  object ppPageHeader: TPageProducer
    HTMLDoc.Strings = (
      '<!DOCTYPE html>'
      '<html lang="en">'
      '<head>'
      '<title><#AppName></title>'
      '  <meta charset="utf-8">'
      
        '  <meta name="viewport" content="width=device-width, initial-sca' +
        'le=1">'
      
        '  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/b' +
        'ootstrap/3.4.1/css/bootstrap.min.css">'
      
        '  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.' +
        '1/jquery.min.js"></script>'
      
        '  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/j' +
        's/bootstrap.min.js"></script>'
      '<style>'
      '        body {'
      '            font-family: Arial, sans-serif;'
      '            line-height: 1.6;'
      '            margin: 0;'
      '            padding: 20px;'
      '            background-color: #f4f4f4;'
      '        }'
      '        .container {'
      '            max-width: 800px;'
      '            margin: auto;'
      '            background: white;'
      '            padding: 20px;'
      '            border-radius: 5px;'
      '            box-shadow: 0 0 10px rgba(0,0,0,0.1);'
      '        }'
      '        h1 {'
      '            text-align: center;'
      '            color: #333;'
      '        }'
      '        form {'
      '            display: grid;'
      '            gap: 10px;'
      '        }'
      '        .form-group {'
      '            display: flex;'
      '            align-items: center;'
      '        }'
      '        label {'
      '            font-weight: bold;'
      '            width: 150px;'
      '            text-align: right;'
      '            margin-right: 10px;'
      '        }'
      '        input, select {'
      '            flex: 1;'
      '            padding: 8px;'
      '            border: 1px solid #ddd;'
      '            border-radius: 4px;'
      '            box-sizing: border-box;'
      '        }'
      '        .input-group {'
      '            display: flex;'
      '            gap: 10px;'
      '        }'
      '        .input-group input {'
      '            flex: 1;'
      '        }'
      '        button {'
      '            background-color: #4CAF50;'
      '            color: white;'
      '            padding: 10px 15px;'
      '            border: none;'
      '            border-radius: 4px;'
      '            cursor: pointer;'
      '            font-size: 16px;'
      '            margin-left: 160px;'
      '        }'
      '        button:hover {'
      '            background-color: #45a049;'
      '        }'
      '        .company_row {'
      '            background-color: #e2e2e2;'
      '        }'
      '    </style>'
      '</head>'
      '<body>'
      ''
      '<div class="container px-5">'
      ''
      '  <div class="row">'
      '    <div class="col-md-12">'
      '      <h2 class="text-center text-primary"><#AppName></h2>'
      
        '      <h4 class="text-center text-primary">Version <#AppVersion>' +
        '</h4>'
      '    </div>'
      '  </div>'
      ''
      
        '  <div class="col-lg-12 bg-light justify-content-center shadow p' +
        '-3 mb-5 bg-body rounded">')
    OnHTMLTag = ppAllHTMLTags
    Left = 352
    Top = 40
  end
  object pptblCustomers: TDataSetTableProducer
    Caption = 'All Customers'
    Columns = <
      item
        Align = haRight
        Custom = 'width="40" style="padding-right: 5px;"'
        FieldName = 'CustomerId'
        Title.Custom = 'width="40" style="padding-right: 5px;"'
        Title.Align = haRight
        Title.BgColor = 'Silver'
        Title.Caption = 'ID'
      end
      item
        FieldName = 'FirstName'
        Title.Align = haLeft
        Title.BgColor = 'Silver'
        Title.Caption = 'First'
      end
      item
        FieldName = 'LastName'
        Title.Align = haLeft
        Title.BgColor = 'Silver'
        Title.Caption = 'Last'
      end
      item
        FieldName = 'Company'
        Title.Align = haLeft
        Title.BgColor = 'Silver'
        Title.Caption = 'Company'
      end>
    MaxRows = 0
    DataSet = dmCust.qryCustomers
    TableAttributes.Align = haCenter
    TableAttributes.BgColor = 'White'
    TableAttributes.Border = 1
    TableAttributes.CellSpacing = 10
    TableAttributes.CellPadding = 8
    OnCreateContent = pptblCustomersCreateContent
    OnFormatCell = pptblCustomersFormatCell
    Left = 296
    Top = 192
  end
  object ppAccessDenied: TPageProducer
    HTMLFile = 'accessdenied-wbroker.html'
    OnHTMLTag = ppAllHTMLTags
    Left = 226
    Top = 102
  end
  object ppCustEdit: TPageProducer
    HTMLFile = 'custedit-wbroker.html'
    OnHTMLTag = ppCustEditHTMLTag
    Left = 122
    Top = 237
  end
end
