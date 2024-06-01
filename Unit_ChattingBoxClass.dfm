object Frame_ChattingBoxClass: TFrame_ChattingBoxClass
  Left = 0
  Top = 0
  Width = 640
  Height = 480
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  ParentCtl3D = False
  ParentFont = False
  TabOrder = 0
  object VST_ChattingBox: TVirtualStringTree
    Left = 0
    Top = 0
    Width = 640
    Height = 480
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 8
    Align = alClient
    BiDiMode = bdLeftToRight
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Colors.BorderColor = clWindowText
    Colors.HotColor = clBlack
    Ctl3D = False
    DefaultNodeHeight = 21
    DragMode = dmAutomatic
    DragType = dtVCL
    Header.AutoSizeIndex = -1
    Header.Height = 21
    Images = VirtualImageList1
    IncrementalSearch = isAll
    ParentBiDiMode = False
    ParentCtl3D = False
    PopupMenu = PopupMenu1
    ScrollBarOptions.ScrollBars = ssVertical
    SelectionCurveRadius = 20
    TabOrder = 0
    TreeOptions.AnimationOptions = [toAnimatedToggle]
    TreeOptions.AutoOptions = [toAutoScroll, toAutoScrollOnExpand, toAutoTristateTracking, toAutoHideButtons, toAutoDeleteMovedNodes, toAutoChangeScale]
    TreeOptions.MiscOptions = [toReportMode, toWheelPanning, toVariableNodeHeight]
    TreeOptions.PaintOptions = [toShowRoot, toThemeAware, toUseBlendedImages]
    TreeOptions.SelectionOptions = [toRightClickSelect]
    TreeOptions.StringOptions = [toSaveCaptions]
    WantTabs = True
    OnBeforeCellPaint = VST_ChattingBoxBeforeCellPaint
    OnDragOver = VST_ChattingBoxDragOver
    OnEditing = VST_ChattingBoxEditing
    OnFreeNode = VST_ChattingBoxFreeNode
    OnGetText = VST_ChattingBoxGetText
    OnInitNode = VST_ChattingBoxInitNode
    OnKeyDown = VST_ChattingBoxKeyDown
    OnMeasureItem = VST_ChattingBoxMeasureItem
    OnResize = VST_ChattingBoxResize
    Touch.InteractiveGestures = [igPan, igPressAndTap]
    Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanSingleFingerVertical, igoPanInertia, igoPanGutter, igoParentPassthrough]
    Columns = <
      item
        Position = 0
        Text = 'Name'
        Width = 300
      end>
  end
  object VirtualImageList1: TVirtualImageList
    AutoFill = True
    Images = <
      item
        CollectionIndex = 0
        CollectionName = 'user24_1'
        Name = 'user24_1'
      end
      item
        CollectionIndex = 1
        CollectionName = 'ollama4'
        Name = 'ollama4'
      end>
    ImageCollection = ImageCollection1
    Left = 232
    Top = 152
  end
  object ImageCollection1: TImageCollection
    Images = <
      item
        Name = 'user24_1'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000C67A5458745261772070726F66696C65207479706520657869660000
              78DA6D50DB0DC3200CFC678A8E801F10330E34A9D40D3A7E8FD88992AA27719C
              1F3A8CD3F679BFD26382499396C56AAB3503DAB47187B0ECE83B53D69D3D386A
              74CFA7B3C048096EF1D06AF41F793A0DFCEA50E56264CF288C7BA169F8DB8F51
              3C2473228658C3A88591B017280CBA7F2BD766CBF50B63CB77989F34690C6FA3
              16CD3FB12ED8DE5AF08E306F4292C122D5079079344987283B331A490C5AD1D6
              A16B4C8285FCDBD381F405518559E3A4DD9D2300000184694343504943432070
              726F66696C650000789C7D913D48C3401CC55F534B552A0E761071C8501DC42E
              2AE258AA58040BA5ADD0AA83C9A55FD0A421497171145C0B0E7E2C561D5C9C75
              75701504C10F10670727451729F17F49A1458C07C7FD7877EF71F70E109A55A6
              9A3D3140D52C239D888BB9FCAA187C450002FA3081B0C44C3D9959CCC2737CDD
              C3C7D7BB28CFF23EF7E718500A26037C22718CE98645BC413CBB69E99CF789C3
              AC2C29C4E7C493065D90F891EBB2CB6F9C4B0E0B3C336C64D3F3C46162B1D4C5
              7217B3B2A112CF10471455A37C21E7B2C2798BB35AADB3F63DF90B43056D25C3
              759AA348600949A42042461D155461214AAB468A8934EDC73DFC238E3F452E99
              5C1530722CA0061592E307FF83DFDD9AC5E92937291407022FB6FD3106047781
              56C3B6BF8F6DBB7502F89F812BADE3AF3581B94FD21B1D2D72040C6E0317D71D
              4DDE032E7780E1275D322447F2D3148A45E0FD8CBE290F0CDD02FD6B6E6FED7D
              9C3E0059EA6AF906383804C64B94BDEEF1EEDEEEDEFE3DD3EEEF07807E72ACB0
              6858CC00000D7669545874584D4C3A636F6D2E61646F62652E786D7000000000
              003C3F787061636B657420626567696E3D22EFBBBF222069643D2257354D304D
              7043656869487A7265537A4E54637A6B633964223F3E0A3C783A786D706D6574
              6120786D6C6E733A783D2261646F62653A6E733A6D6574612F2220783A786D70
              746B3D22584D5020436F726520342E342E302D4578697632223E0A203C726466
              3A52444620786D6C6E733A7264663D22687474703A2F2F7777772E77332E6F72
              672F313939392F30322F32322D7264662D73796E7461782D6E7323223E0A2020
              3C7264663A4465736372697074696F6E207264663A61626F75743D22220A2020
              2020786D6C6E733A786D704D4D3D22687474703A2F2F6E732E61646F62652E63
              6F6D2F7861702F312E302F6D6D2F220A20202020786D6C6E733A73744576743D
              22687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F735479
              70652F5265736F757263654576656E7423220A20202020786D6C6E733A64633D
              22687474703A2F2F7075726C2E6F72672F64632F656C656D656E74732F312E31
              2F220A20202020786D6C6E733A47494D503D22687474703A2F2F7777772E6769
              6D702E6F72672F786D702F220A20202020786D6C6E733A746966663D22687474
              703A2F2F6E732E61646F62652E636F6D2F746966662F312E302F220A20202020
              786D6C6E733A786D703D22687474703A2F2F6E732E61646F62652E636F6D2F78
              61702F312E302F220A202020786D704D4D3A446F63756D656E7449443D226769
              6D703A646F6369643A67696D703A33633235623331632D353362362D34643831
              2D386463332D626361393466353864623064220A202020786D704D4D3A496E73
              74616E636549443D22786D702E6969643A38636236623831642D333534612D34
              6261302D613266392D363438376362323939623232220A202020786D704D4D3A
              4F726967696E616C446F63756D656E7449443D22786D702E6469643A62376661
              643034362D663161612D343033372D386638372D326633646265643539623265
              220A20202064633A466F726D61743D22696D6167652F706E67220A2020204749
              4D503A4150493D22322E30220A20202047494D503A506C6174666F726D3D2257
              696E646F7773220A20202047494D503A54696D655374616D703D223137313436
              3432393938393134313038220A20202047494D503A56657273696F6E3D22322E
              31302E3336220A202020746966663A4F7269656E746174696F6E3D2231220A20
              2020786D703A43726561746F72546F6F6C3D2247494D5020322E3130220A2020
              20786D703A4D65746164617461446174653D22323032343A30353A3032543138
              3A34333A31362B30393A3030220A202020786D703A4D6F64696679446174653D
              22323032343A30353A30325431383A34333A31362B30393A3030223E0A202020
              3C786D704D4D3A486973746F72793E0A202020203C7264663A5365713E0A2020
              2020203C7264663A6C690A20202020202073744576743A616374696F6E3D2273
              61766564220A20202020202073744576743A6368616E6765643D222F220A2020
              2020202073744576743A696E7374616E636549443D22786D702E6969643A6163
              6435396330652D313839352D346337372D616537382D36633662313238623164
              3137220A20202020202073744576743A736F6674776172654167656E743D2247
              696D7020322E3130202857696E646F777329220A20202020202073744576743A
              7768656E3D22323032342D30352D30325431383A34333A3138222F3E0A202020
              203C2F7264663A5365713E0A2020203C2F786D704D4D3A486973746F72793E0A
              20203C2F7264663A4465736372697074696F6E3E0A203C2F7264663A5244463E
              0A3C2F783A786D706D6574613E0A202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020200A20202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              20202020202020202020202020202020202020202020200A2020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              202020202020202020202020202020202020202020202020202020200A202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              200A202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020200A20202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              20202020202020202020200A2020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              202020202020202020202020202020200A202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020200A20202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              20202020202020202020202020202020202020202020202020200A2020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              202020202020202020202020202020202020202020202020202020202020200A
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              202020200A202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020200A20202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              20202020202020202020202020200A2020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              202020202020202020202020202020202020200A202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020200A20202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              20202020202020202020202020202020202020202020202020202020200A2020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              20200A2020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              202020202020200A202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020200A20202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              20202020202020202020202020202020200A2020202020202020202020202020
              202020202020202020202020200A3C3F787061636B657420656E643D2277223F
              3E8463BC5C00000006624B47440000004300FBA1F0A372000000097048597300
              0006EC000006EC011E7538350000000774494D4507E80502092B12DE32C31A00
              00028A4944415448C7B5964F48545114C67F332A915E0443BDD05D441B217092
              52A2A45A8891B8B232771241B455376D6629B88B99951B83683B996EA492C245
              054668692E8420A2C505AF48495C93509936277D3CEE9B19030FBCCDF9BEF31D
              38F7FC79294A98753E030C00DD4006A813680B58015E0305A3D54A92462A41F8
              0C9003AE037BC03CB00C6C08A51168032E0155C02C3062B45AA59C59E787ADF3
              5BD6F94DEB7CD63ADF5C82DB2C9C4D89192E273E669D2F5AE75F58E71BA9D0AC
              F38D1253B4CE8F054B24D973C013E0AED1AA18C18E01FD4087B8168049A3D59F
              0827053C06EE48B9F2FB09A4E60BC01BA03726DE0E3C054E03DBE23E0E7C036E
              1BAD1663499E0357810EA3D56A5AB01CB0030CC6C44FCA03D6003D46AB5AA355
              2DD023BE59E10020B183A295DB6F45A95D3650DB71EBFC8E75BE2580B508361E
              C0B2A299494B9FEF011381F7EB05A68C565FE280F8A68413B709D11C48CB10CD
              1BADD603C453C05A89065A134E3CF9BACC4E775A267439416009682D91A05538
              215B06326919FF8D04D233A0CB3ADF17A8731FD0259C906D0075D56566E82170
              132858E773C0A4F8FB8111E0937012AD5A165743025E03CC00E78007F2456D46
              38DB81D806602B659D9F07768D56576225B8013C024EC883BD02BE471EFF9A2C
              BB1FC03DA3D5742CFE2D508D757ED43ABF6B9D6F8A8043D2C74B32C9493BA85D
              3845EBFC50C4DF249AA369A0202BF7BE80B7803C300D74465741A01D17814EE1
              E62516D1AA020AFF76D14BE022D00E7C90525C365AFDAE709BD602EFA4741780
              45E0BDD1AA27BEEC76817AA0CD68F599439875FEACF4FE2F699E83652797282B
              E25FE51C1ED65624B61EC806AF5BE4E0CCFDC7C1990B1D9C233F998739FA1F81
              9F91213A5FC9D14F1DF56FCB5F88388C7DF70CDC760000000049454E44AE4260
              82}
          end>
      end
      item
        Name = 'ollama4'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000C07A5458745261772070726F66696C65207479706520657869660000
              78DA6D505B0E032108FCE7143D02022A1EC76DB7496FD0E31785DDAC6D277178
              8C1911D8DFAF27DC06280948AE5A5A296890268DBA258A8E3E39A14CF6E2D0D2
              DA8753206BB145F6524BDC3FFAE934F0D02DCB1723BD87B0AD4293F0D72F23F2
              C063A2913FC2A88511930B290CBA7F0B4BD37AFDC2B6E30AF5038344D7B17FEA
              6ADB7B647B8789764E8CC6CCC507E07104B85B9227935D446E3377AE61660BF9
              B7A703F001EE49592000E344CB00000181694343504943432070726F66696C65
              0000789C7D913B48034114458F51512462610A91145B442B6D54C452A2180405
              4922F82BDCDD7C14B26BD84DB0B1146C03167E1AA31636D6DA5AD80A82E007C4
              DAC24AD146C2FA26092488716098C39DB98FF7EE80AF98312DB7651C2C3BE744
              23616D6171496B7BA5151FD04E5037DDEC6C6C2A4EC3F5754F933AEF0655ADC6
              EFFE5C9D89A46B4293263C6E669D9CF0AAF0E8662EAB785F3860AEE909E173E1
              01471A147E54BA51E137C5E932ABA60938F1E8847040584BD7B151C7E69A6309
              8F088712962DF57D0B154E28DE526C65F266B54F35A13F69CFC7942E3B488469
              669943C320CF3A19720CCA698BE21295FB70037F6FD93F272E435CEB98E29864
              030BBDEC47FDC1EF6CDDD4F050A5923F0CAD2F9EF7D1076DBB502A78DEF7B1E7
              954EA0F919AEEC9A7FA308639FA2176A5AE808BAB6E1E2BAA6197B70B9033D4F
              59DDD1CB52B36C5F2A05EF67F24D8BD07D0B1DCB95DCAAF79C3E405CB29AB981
              8343E84F4BED950673B7D7E7F6EF9B6A7E3F28FF7289EB7217AA00000D766954
              5874584D4C3A636F6D2E61646F62652E786D7000000000003C3F787061636B65
              7420626567696E3D22EFBBBF222069643D2257354D304D7043656869487A7265
              537A4E54637A6B633964223F3E0A3C783A786D706D65746120786D6C6E733A78
              3D2261646F62653A6E733A6D6574612F2220783A786D70746B3D22584D502043
              6F726520342E342E302D4578697632223E0A203C7264663A52444620786D6C6E
              733A7264663D22687474703A2F2F7777772E77332E6F72672F313939392F3032
              2F32322D7264662D73796E7461782D6E7323223E0A20203C7264663A44657363
              72697074696F6E207264663A61626F75743D22220A20202020786D6C6E733A78
              6D704D4D3D22687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E
              302F6D6D2F220A20202020786D6C6E733A73744576743D22687474703A2F2F6E
              732E61646F62652E636F6D2F7861702F312E302F73547970652F5265736F7572
              63654576656E7423220A20202020786D6C6E733A64633D22687474703A2F2F70
              75726C2E6F72672F64632F656C656D656E74732F312E312F220A20202020786D
              6C6E733A47494D503D22687474703A2F2F7777772E67696D702E6F72672F786D
              702F220A20202020786D6C6E733A746966663D22687474703A2F2F6E732E6164
              6F62652E636F6D2F746966662F312E302F220A20202020786D6C6E733A786D70
              3D22687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F220A
              202020786D704D4D3A446F63756D656E7449443D2267696D703A646F6369643A
              67696D703A38616562663564622D633363352D343837652D396631342D643661
              656137363537313335220A202020786D704D4D3A496E7374616E636549443D22
              786D702E6969643A63626135383638632D333135372D346565352D626233622D
              626132613263343932323365220A202020786D704D4D3A4F726967696E616C44
              6F63756D656E7449443D22786D702E6469643A65306136383630612D65636637
              2D346138642D616233612D346636363535356137323736220A20202064633A46
              6F726D61743D22696D6167652F706E67220A20202047494D503A4150493D2232
              2E30220A20202047494D503A506C6174666F726D3D2257696E646F7773220A20
              202047494D503A54696D655374616D703D223137313436303835343939303239
              3031220A20202047494D503A56657273696F6E3D22322E31302E3336220A2020
              20746966663A4F7269656E746174696F6E3D2231220A202020786D703A437265
              61746F72546F6F6C3D2247494D5020322E3130220A202020786D703A4D657461
              64617461446174653D22323032343A30353A30325430393A30393A30372B3039
              3A3030220A202020786D703A4D6F64696679446174653D22323032343A30353A
              30325430393A30393A30372B30393A3030223E0A2020203C786D704D4D3A4869
              73746F72793E0A202020203C7264663A5365713E0A20202020203C7264663A6C
              690A20202020202073744576743A616374696F6E3D227361766564220A202020
              20202073744576743A6368616E6765643D222F220A2020202020207374457674
              3A696E7374616E636549443D22786D702E6969643A62623466373763332D3138
              39302D343034332D623430642D376230616265353865343264220A2020202020
              2073744576743A736F6674776172654167656E743D2247696D7020322E313020
              2857696E646F777329220A20202020202073744576743A7768656E3D22323032
              342D30352D30325430393A30393A3039222F3E0A202020203C2F7264663A5365
              713E0A2020203C2F786D704D4D3A486973746F72793E0A20203C2F7264663A44
              65736372697074696F6E3E0A203C2F7264663A5244463E0A3C2F783A786D706D
              6574613E0A202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020200A20202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              20202020202020202020202020200A2020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              202020202020202020202020202020202020200A202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020200A20202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              20202020202020202020202020202020202020202020202020202020200A2020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              20200A2020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              202020202020200A202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020200A20202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              20202020202020202020202020202020200A2020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              202020202020202020202020202020202020202020200A202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020200A20202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              0A20202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              20202020200A2020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              202020202020202020200A202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020200A20202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              20202020202020202020202020202020202020200A2020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              202020202020202020202020202020202020202020202020200A202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020200A20
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020200A20202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              20202020202020200A2020202020202020202020202020202020202020202020
              202020200A3C3F787061636B657420656E643D2277223F3E8D35F95800000006
              624B47440000004300FBA1F0A372000000097048597300000B1300000B130100
              9A9C180000000774494D4507E80502000909FC3477590000035C4944415448C7
              B556BF6FE25810FE9ED944B14086445B20902F056948E1660B9C1427A453DAFC
              03B7146ED62552BAACAE4873A20C65B4CD156C1A1A44B7520AA2935068B6B089
              4414C991D69098821F321269BF2B0E2C03C91E29EEAB7833C337336FDECC58E0
              2720B90BE07700BF02F800E0FD4C3500F01DC0DF002E85103FF01690DC2559E1
              FAA8CC82598BFC23C92949369B4D763A9D57593B9D0E9BCDE6FC3825F9F1BFC8
              3FCDAD9BCD260DC3A0AEEB745D7785DC755DEABA4EC330C24E48F25398538423
              0750999F4BA5128E8E8EF0F4F404DFF75128141682A9542A88C7E348A552B8BA
              BAC2E9E969585D10427C5DBEF369380C5DD7E9791E2DCBA261182C97CB8CC7E3
              4C24122C97CB340C839665D1F33CEABABE9CE074A1262F15747B7B9B9EE7D171
              1C0260AD56A3E779F43C8FB55A8D00E8380E3DCFA310E2C5C287A35F41B15864
              2E972300D6EBF5157DBD5E2700E67239168BC5D7DEC12E487E5E9656AB551A86
              41C771389D4E5F7D45D3E9948EE3D0300C56ABD5974C3E83E4B7B0A4D7EB51D7
              75FABEBF7613F8BE4F5DD7F9F8F8B8ACFA26CD3A34C0EDED2D4CD384A2282BCF
              783299603299ACC8154581699A68B7DBCBAA0FEF42ED1F9044A35100C0F5F535
              6E6E6E609A26CECFCFA1AA2A00A0DBEDE2E4E404171717383838403E9F47341A
              7DC9F97B2CE76459565034D7756959164BA5127DDFA7EBBAF43C8FBEEFB3542A
              D1B2ACA0098BC5222DCB5AB93E6936B80264B359589605DBB6A1AA2A344D832C
              CB501405DD6E17BD5E0F8AA2409665689A06555561DB36DAED36B2D9EC720603
              693615030C87436C6E6E2E18CBB20CDBB6B1BFBF8FBDBD3DD8B60D5996178212
              4260381C2E3BF81E393B3BFB05C06F73C9DDDD1DB6B6B67078781858699A86FB
              FB7BB4DB6D3C3C3C4092241C1F1F2312890000229108C6E33112890452A954D8
              C15FEF005C02F8332CDDD9D9590863636303F97CFEA78372F93F335C4AB36511
              0CA6582C8646A381B7A2D16820168B85455F85103FA4D9E10F00CF0090C96430
              1E8FD16AB5D6266FB55A188FC7C8643273D1F38C131200CCB23067BFD1EFF791
              4EA7D776904EA7D1EFF7214430FDCDF91A9582C5F0EFFC3607830192C964D054
              EB4055552493490C0683397970E5D2C2F611E2CB68342A689AF6FCD61A689AF6
              3C1A8D0A42882FEBD8BF79E9037871E98BFFFBB3E51F8D506DC0E313565A0000
              000049454E44AE426082}
          end>
      end>
    Left = 176
    Top = 88
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 328
    Top = 288
    object pmn_SelectedColor: TMenuItem
      Caption = 'Selected Color'
      OnClick = pmn_SelectedColorClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object pmn_Delete: TMenuItem
      Caption = 'Delete'
      ShortCut = 46
      OnClick = pmn_DeleteClick
    end
  end
end
