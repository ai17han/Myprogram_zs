
import { router  } from '@kit.ArkUI'
// 登录
@Entry
@Component
struct Index{

  pathStack: NavPathStack = new NavPathStack();

  @Builder
  PageMap(name: string) {
    if (name === "home") {
      home()
    }else if (name === "Index") {
      Index()
    } else if (name === "pageValue"){
      pageValue()
    } else if (name === "monitor"){
      monitor()
    } else if (name === "service_state_page"){
      service_state_page()
    }else if (name === "setup"){
      setup()
    }
  }

  build() {

    Navigation(this.pathStack){

      Text('输入账号昵称和密码登录')
        .fontColor(Color.Gray)
        .fontSize(30)
        .lineHeight(41)
        .fontWeight(700)
        .markAnchor({ x: -2, y: -100 })

      TextInput({placeholder: '请输入昵称'})
        .width('90%')
        .height(50)
        .backgroundColor('#E0E0E0')
        .margin({top:220})

      TextInput({placeholder: '请输入密码'})
        .width('90%')
        .height(50)
        .backgroundColor('#E0E0E0')
        .margin({top:20})

      Button('登录',{type: ButtonType.Capsule, stateEffect:false}).onClick(()=>{
        this.pathStack.pushPath({name: "home"})
      })
        .width(100)
        .height(50)
        .margin({top:50})


    }
    .mode(NavigationMode.Stack)
    .navDestination(this.PageMap)

  }
}

@Preview
//home
@Component
export struct home{
  pathStack: NavPathStack = new NavPathStack();
  build() {
      NavDestination() {

        List({ space: 30 }) {
          ListItem() {
            Button("实时数据",{type:ButtonType.Normal}).onClick(() => {
              this.pathStack.pushPath({ name: "pageValue"})
            })
              .borderRadius(8)
              .width('100%')
              .height(70)
              .fontSize(25)

          }
          ListItem() {
            Button("实时监控",{type:ButtonType.Normal}).onClick(() => {
              this.pathStack.pushPath({ name: "monitor"})
            })
              .borderRadius(8)
              .width('100%')
              .height(70)
              .fontSize(25)
          }
          ListItem() {
            Button("智能家居",{type:ButtonType.Normal}).onClick(() => {
              this.pathStack.pushPath({ name: "service_state_page"})
            })
              .borderRadius(8)
              .width('100%')
              .height(70)
              .fontSize(25)
          }

        }
        .listDirection(Axis.Vertical)
        .backgroundColor(Color.White).padding(20)
        .markAnchor({y: -150})
        Row() {
          // 主页
          Button({ type: ButtonType.Normal })
          //   .onClick(() => {
          //   this.pathStack.pushPath({ name: "home" })
          // })
            .width(180)
            .backgroundColor(Color.White)
            .backgroundImage($rawfile('house_fill.png'))
            .backgroundImageSize({width:'20%',height:'70%'})
            .backgroundImagePosition(Alignment.Center)
          // 设置
          Button( { type: ButtonType.Normal }).onClick(() => {
            this.pathStack.pushPath({ name: "setup" })
          })
            .width(180)
            .backgroundColor(Color.White)
            .backgroundImage($rawfile('gearshape.png'))
            .backgroundImageSize({width:'20%',height:'70%'})
            .backgroundImagePosition(Alignment.Center)

        }.position({x:35,y:780})
      }.title("返回")
      .onBackPressed(() => {
        const popDestinationInfo = this.pathStack.pop() // 弹出路由栈栈顶元素
        console.log('pop' + '返回值' + JSON.stringify(popDestinationInfo))
        return true
      })
      .onReady((context: NavDestinationContext) => {
        this.pathStack = context.pathStack
      })


  }
}


//实时数据
@Component
export struct pageValue {

  pathStack: NavPathStack = new NavPathStack();
  public color1: LinearGradient =
    new LinearGradient([{ color: "#86ff40", offset: 0 }, { color: "#f01a1a", offset: 1 }])
  @State colorArray: Array<LinearGradient | ResourceColor> = [this.color1]
  build() {
    NavDestination() {
      Column() {
        Text("实时数据").fontSize(25)
          .fontWeight('800', { enableVariableFontWeight: true })

        //数值 DatePanel
        Stack() {
          // 温度
          DataPanel({ values: [30], max: 45, type: DataPanelType.Circle }).width(168).height(168)
            .markAnchor({x:80})
            .valueColors(this.colorArray)

          Text('30'+'°C').fontSize(30).fontColor(Color.Black).markAnchor({x:80})

          //湿度
          DataPanel({ values: [50], max: 100, type: DataPanelType.Circle }).width(168).height(168)
            .markAnchor({x:-80})
            .valueColors(this.colorArray)
          Text('50'+'%').fontSize(30).fontColor(Color.Black).markAnchor({x:-80})

          //烟雾值
          DataPanel({ values: [0], max: 50, type: DataPanelType.Circle }).width(168).height(168)
            .markAnchor({x:80,y:-150})
            .valueColors(this.colorArray)
          Text('0'+'mg/m³').fontSize(20).fontColor(Color.Black).markAnchor({x:80,y:-150})

          //亮度
          DataPanel({ values: [400], max: 600, type: DataPanelType.Circle }).width(168).height(168)
            .markAnchor({x:-80,y:-150})
            .valueColors(this.colorArray)
          Text('500'+'lx').fontSize(20).fontColor(Color.Black).markAnchor({x:-80,y:-150})

        }

        //条形统计图



      }.width('100%').height('100%')

    }.title("返回")
    .onBackPressed(() => {
      const popDestinationInfo = this.pathStack.pop() // 弹出路由栈栈顶元素
      console.log('pop' + '返回值' + JSON.stringify(popDestinationInfo))
      return true
    })
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack
    })
  }
}

// 实时监控
@Component
export struct monitor {
  pathStack: NavPathStack = new NavPathStack();
  private controller: VideoController = new VideoController()
  private previewUris: Resource = $rawfile('previewTest.jpg')
  private innerResource: Resource = $rawfile('videotest.mp4')
  build() {
    NavDestination() {
      Column() {
        Text("实时监控").fontSize(30)

        Column() {
          // video视频插件
          Video({
            src: this.innerResource,
            previewUri: this.previewUris,
            controller: this.controller
          }).objectFit(ImageFit.Contain)
        }.width('100%').height(300)


        // Row() {
        //   // 主页
        //   Button({ type: ButtonType.Normal }).onClick(() => {
        //     this.pathStack.pushPath({ name: "home" })
        //   }).width(180)
        //     .backgroundColor(Color.White)
        //     .backgroundImage($rawfile('house.png'))
        //     .backgroundImageSize({width:'20%',height:'70%'})
        //     .backgroundImagePosition(Alignment.Center)
        //   // 设置
        //   Button( { type: ButtonType.Normal }).onClick(() => {
        //     this.pathStack.pushPath({ name: "setup" })
        //   }).width(180)
        //     .backgroundColor(Color.White)
        //     .backgroundImage($rawfile('gearshape.png'))
        //     .backgroundImageSize({width:'20%',height:'70%'})
        //     .backgroundImagePosition(Alignment.Center)
        // }.width('100%')
        // .position({x:35,y:780})
      }.width('100%').height('100%')
    }.title("返回")
    .onBackPressed(() => {
      const popDestinationInfo = this.pathStack.pop() // 弹出路由栈栈顶元素
      console.log('pop' + '返回值' + JSON.stringify(popDestinationInfo))
      return true
    })
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack
    })
  }
}


// 设备状态管理
class Service {
  private type: string = '';
  public name: string = '';
  is_running: boolean;
  buttonColor: string = '#90EE90';
  runState: string = '未运行';
  switchState: string = '启动';
  rank: number = 0;

  constructor(rank: number, state: boolean, type: string, name ?: string) {
    this.type = type;
    this.rank = rank;
    if (name == undefined) {
      this.name = type;
    } else {
      this.name = name;
    }
    this.is_running = state;
    if (state == false) {
      this.buttonColor = '#90EE90';
      this.runState = '未运行';
      this.switchState = '启动';
    } else if (state == true) {
      this.buttonColor = '#FFC0CB';
      this.runState = '运行中~';
      this.switchState = '关闭';
    }
  }

  switch() {
    if (this.is_running === false) {
      if (1) {
        this.is_running = true;
      }
      this.runState = '运行中~'
      this.buttonColor = "#FFC0CB";
      this.switchState = '关闭';
    } else {
      if (1) {
        this.is_running = false;
      }
      this.runState = '未运行'
      this.buttonColor = "#90EE90";
      this.switchState = '启动';
    }

  }
}

let serv1: Service = new Service(0, false, '风扇', '风扇1')
let serv2: Service = new Service(1, false, '灯', '灯1')
let serv3: Service = new Service(2, false, '报警器', '报警器1')
let serv4: Service = new Service(3, false, '烟雾探测器', '烟雾探测器1')
let serv5: Service = new Service(4, false, '温湿度探测器', '温湿度探测器1')
let serv6: Service = new Service(5, false, '监控摄像头', '监控摄像头1')
let serv7: Service = new Service(6, false, '光线传感器', '光线传感器1')
let serv8: Service = new Service(7, true, '声控设备', '声控设备1')
let serv9: Service = new Service(8, false, '光线传感器', '光线传感器1')

// 设备状态管理
@Component
export struct service_state_page {
  pathStack: NavPathStack = new NavPathStack();
  scroller: Scroller = new Scroller()
  @State private arr: Service[] = [serv1, serv2, serv3, serv4, serv5, serv6, serv7, serv8, serv9]

  build() {
    NavDestination() {
      Column() {

        Column() {
          Divider().strokeWidth(9).color('#F1F3F5')

          Column() {
            Text('当前相关设备')
              .fontSize(22)
              .fontWeight(700)
              .textAlign(TextAlign.Center)
              .padding(5)
              .margin({ top: 0, left: 0 })
          }.margin({ bottom: 0 })

          Divider().strokeWidth(9).color('#F1F3F5')

        }

        Stack({ alignContent: Alignment.TopStart }) {
          Scroll(this.scroller) {
            Column() {
              ForEach(this.arr, (serv: Service) => {
                Row() {
                  Text(serv.name)
                    .fontSize(16)
                    .fontWeight(FontWeight.Bold)
                    .textAlign(TextAlign.Center)
                    .margin(10)
                    .width(80)
                  Button('. . .')
                    .fontColor(Color.Gray)
                    .fontWeight(FontWeight.Bolder)
                    .backgroundColor(Color.Transparent)
                    .borderRadius(15)
                    .borderColor(0xD3D3D3)
                    .borderWidth(2)


                  Text(serv.runState)
                    .fontColor('#808080')
                    .margin({ top:  0 , left: 30 })

                  Button(serv.switchState)
                    .fontSize(18)
                    .fontColor(Color.Blue)
                    .fontWeight(FontWeight.Bolder)
                    .backgroundColor(serv.buttonColor)
                    .position({x:270,y:20})
                    .onClick((e: ClickEvent) => {
                      serv.switch();
                      router.pushUrl({
                        url: 'pages/service_state_page'
                      })
                    })


                }
                .width('90%')
                .height(80)
                .backgroundColor(0xFFFFFF)
                .opacity(0.9)
                .borderRadius(15)


                .margin({ top: 10 })
              })
            }.width('100%')
          }
          .scrollable(ScrollDirection.Vertical) // 滚动方向纵向
          .scrollBar(BarState.On) // 滚动条常驻显示
          .scrollBarColor(Color.Gray) // 滚动条颜色
          .scrollBarWidth(10) // 滚动条宽度
          .friction(0.6)
          .edgeEffect(EdgeEffect.None)
          // .onWillScroll((xOffset: number, yOffset: number, scrollState: ScrollState) => {
          //   console.info(xOffset + ' ' + yOffset)
          // })
          .onScrollEdge((side: Edge) => {
            console.info('To the edge')
          })
          .onScrollStop(() => {
            console.info('Scroll Stop')
          })
          .backgroundImage($rawfile('app.media.p1.png'))
          .backgroundImageSize({ height: '100%', width: '100%' })
        }
        .height('84%')
        .width('100%')

        Column() {
          Text('点击添加可接通的管理设备+')
            // .fontSize(20)
            .fontWeight(700)
            .textAlign(TextAlign.Center)
            .fontColor(Color.Black)
            .padding(12)
        }.backgroundColor(Color.White)
        .height('8%')
        .width('100%')


      }.height('100%')
      .width('100%')

    }.title("返回")
    .onBackPressed(() => {
      const popDestinationInfo = this.pathStack.pop() // 弹出路由栈栈顶元素
      console.log('pop' + '返回值' + JSON.stringify(popDestinationInfo))
      return true
    })
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack
    })
  }
}


//设置
@Component

export struct setup {
  pathStack: NavPathStack = new NavPathStack();
  build() {

    NavDestination() {
      Column() {

        Text("设置")
          .fontSize(20)
          .fontColor(Color.Black)
          .width(100)
          .height(40)
          .alignSelf(ItemAlign.Center)
          .textAlign(TextAlign.Center)

        Column() {
          Text("个人信息")
            .fontSize(20)
            .width('100%')
            .height(50)
            .textAlign(TextAlign.Start)
            .border({ width: 1, color: Color.Grey })

          Text("账号安全")
            .fontSize(20)
            .width('100%')
            .height(50)
            .textAlign(TextAlign.Start)
            .border({ width: 1, color: Color.Grey })
        }
        .width('100%')
        .backgroundColor(Color.White)
        .margin({ top: 10, bottom: 10 })

        Text("预警设置")
          .fontSize(18)
          .fontColor(Color.Black)
          .height(40)
          .width('100%')
          .alignSelf(ItemAlign.Start)
          .textAlign(TextAlign.Start)
          .backgroundColor(Color.Transparent)

        Column() {

          Row() {
            Text("提醒")
              .fontSize(20)
              .width('60%')
              .height(50)
              .textAlign(TextAlign.Start)

            Text("声音")
              .fontSize(20)
              .width('20%')
              .height(50)
              .textAlign(TextAlign.Center)

            Text("消息")
              .fontSize(20)
              .height(50)
              .width('20%')
              .textAlign(TextAlign.Center)
          }
          .width('100%')
          .height(50)
          .border({ width: 1, color: Color.Grey })

          Row() {
            Text("温度过高提醒")
              .fontSize(20)
              .width('60%')
              .height(50)
              .textAlign(TextAlign.Start)

            Toggle({ type: ToggleType.Switch, isOn: false })
              .width('12%')
              .margin(15)

            Toggle({ type: ToggleType.Switch, isOn: false })
              .width('12%')
              .margin(15)
          }
          .width('100%')
          .height(50)
          .border({ width: 1, color: Color.Grey })

          Row() {
            Text("湿度过高提醒")
              .fontSize(20)
              .width('60%')
              .height(50)
              .textAlign(TextAlign.Start)

            Toggle({ type: ToggleType.Switch, isOn: false })
              .width('12%')
              .margin(15)

            Toggle({ type: ToggleType.Switch, isOn: false })
              .width('12%')
              .margin(15)
          }
          .width('100%')
          .height(50)
          .border({ width: 1, color: Color.Grey })

          Row() {
            Text("烟雾值过高提醒")
              .fontSize(20)
              .width('60%')
              .height(50)
              .textAlign(TextAlign.Start)

            Toggle({ type: ToggleType.Switch, isOn: false })
              .width('12%')
              .margin(15)

            Toggle({ type: ToggleType.Switch, isOn: false })
              .width('12%')
              .margin(15)
          }
          .width('100%')
          .height(50)
          .border({ width: 1, color: Color.Grey })
        }
        .width('100%')
        .backgroundColor(Color.White)
        .margin({ bottom: 10 })

        Text("隐私设置")
          .fontSize(18)
          .fontColor(Color.Black)
          .height(40)
          .width('100%')
          .textAlign(TextAlign.Start)
          .alignSelf(ItemAlign.Start)
          .backgroundColor(Color.Transparent)

        Column() {

          Text("权限管理")
            .fontSize(20)
            .width('100%')
            .height(50)
            .textAlign(TextAlign.Start)
            .border({ width: 1, color: Color.Grey })

          Text("切换账号")
            .fontSize(20)
            .width('100%')
            .height(50)
            .textAlign(TextAlign.Start)
            .border({ width: 1, color: Color.Grey })
        }.width('100%')
        .backgroundColor(Color.White)
        .margin({ bottom: 161 })

      }
      .width('100%')
      .height('100%')
      .backgroundImage($rawfile("app.media.background3.png"))
      .backgroundImageSize(ImageSize.FILL);

      Row() {
        // 主页
        Button({ type: ButtonType.Normal }).onClick(() => {
          this.pathStack.pushPath({ name: "home" })
        }).width(180)
          .backgroundColor(Color.White)
          .backgroundImage($rawfile('house.png'))
          .backgroundImageSize({width:'20%',height:'70%'})
          .backgroundImagePosition(Alignment.Center)
        // 设置
        Button( { type: ButtonType.Normal })
        //   .onClick(() => {
        //   this.pathStack.pushPath({ name: "setup" })
        // })
          .width(180)
          .backgroundColor(Color.White)
          .backgroundImage($rawfile('gearshape.png'))
          .backgroundImageSize({width:'20%',height:'70%'})
          .backgroundImagePosition(Alignment.Center)
      }.width('100%')
      .position({x:35,y:780})

    }.title("返回")
    .onBackPressed(() => {
      const popDestinationInfo = this.pathStack.pop() // 弹出路由栈栈顶元素
      console.log('pop' + '返回值' + JSON.stringify(popDestinationInfo))
      return true
    })
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack
    })

  }
}