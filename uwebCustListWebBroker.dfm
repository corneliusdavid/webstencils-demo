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
  Height = 406
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
      '  <#IncludeCSS>'
      '</style>'
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
    Left = 344
    Top = 32
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
  object ppStyles: TPageProducer
    HTMLFile = 'style.css'
    Left = 304
    Top = 280
  end
end
