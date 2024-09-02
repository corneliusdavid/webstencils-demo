object webCustListWebStencil: TwebCustListWebStencil
  OnCreate = WebModuleCreate
  Actions = <
    item
      Default = True
      MethodType = mtGet
      Name = 'DefaultHandler'
      PathInfo = '/'
      OnAction = webCustListWebStencilDefaultHandlerAction
    end
    item
      MethodType = mtPost
      Name = 'waLoginVerify'
      PathInfo = '/login'
      OnAction = webCustListWebStencilwaLoginVerifyAction
    end
    item
      MethodType = mtGet
      Name = 'waListCustomers'
      PathInfo = '/custlist'
      OnAction = webCustListWebStencilwaListCustomersAction
    end>
  Height = 331
  Width = 415
  object wspIndex: TWebStencilsProcessor
    Engine = wsEngineCustList
    InputFileName = 'index-wStencils.html'
    Left = 104
    Top = 104
  end
  object wsEngineCustList: TWebStencilsEngine
    PathTemplates = <>
    Left = 64
    Top = 32
  end
  object wspLoginFailed: TWebStencilsProcessor
    Engine = wsEngineCustList
    InputFileName = 'loginfailed-wStencils.html'
    Left = 104
    Top = 168
  end
  object wspCustList: TWebStencilsProcessor
    Engine = wsEngineCustList
    Left = 208
    Top = 128
  end
  object wspAccessDenied: TWebStencilsProcessor
    Engine = wsEngineCustList
    InputFileName = 'accessdenied-wStencils.html'
    Left = 112
    Top = 232
  end
end
