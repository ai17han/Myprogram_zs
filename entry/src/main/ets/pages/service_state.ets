
import { router  } from '@kit.ArkUI'

class Service {
  private type : string = '';
  public name : string = '';
  is_running : boolean ;
  buttonColor :string = '#90EE90';
  runState : string = '未运行';
  switchState : string = '启动';
  rank : number = 0;

  constructor(rank : number, state : boolean, type: string,  name ?: string) {
    this.type = type;
    this.rank = rank;
    if(name == undefined) this.name = type;
    else this.name = name;
    this.is_running = state;
    if(state == false){
      this.buttonColor = '#90EE90';
      this.runState = '未运行';
      this.switchState= '启动';
    }
    else if(state == true){
      this.buttonColor = '#FFC0CB';
      this.runState = '运行中~';
      this.switchState= '关闭';
    }
  }

  switch(){
    if(this.is_running === false) {
      if(1) this.is_running = true;
      this.runState = '运行中~'
      this.buttonColor = "#FFC0CB";
      this.switchState = '关闭';
    }
    else{
      if(1) this.is_running = false;
      this.runState = '未运行'
      this.buttonColor = "#90EE90";
      this.switchState = '启动';
    }

  }


}

let serv1 : Service = new Service(0,false,'风扇','风扇1')
let serv2 : Service = new Service(1,false,'灯','灯1')
let serv3 : Service = new Service(2,false,'报警器','报警器1')
let serv4 : Service = new Service(3,false,'烟雾探测器','烟雾探测器1')
let serv5 : Service = new Service(4,false,'温湿度探测器','温湿度探测器1')
let serv6 : Service = new Service(5,false,'监控摄像头','监控摄像头1')
let serv7 : Service = new Service(6,false,'光线传感器','光线传感器1')
let serv8 : Service = new Service(7,true,'声控设备','声控设备1')
let serv9 : Service = new Service(8,false,'光线传感器','光线传感器1')

@Entry
@Component

struct service_state_page {

  scroller: Scroller = new Scroller()


  @State private arr: Service[] = [serv1,serv2,serv3,serv4,serv5,serv6,serv7,serv8,serv9]
  build() {
    Column(){
      Row(){
        /*
         ComposeTitleBar({
           title: "设备管理",
           subtitle: "Service Management",
         }).onClick((e:ClickEvent) => {
             router.pushUrl({
               url: 'pages/Page'
             })
           })*/

        Divider().height(2).color(0xCCCCCC)

        Text('设备状态')
          .fontSize(24)
          .fontWeight(700)
          .textAlign(TextAlign.Center)
          .padding(8)
          .position({top : 0 , left : 40})
        /*.textShadow({
          radius: 10,
          color: Color.White,
          offsetX: 0,
          offsetY: 0
        })*/
        Button(){
          Image($rawfile('app.media.Backwards.png'))
            .width(50)
            .height(40)
        }.type(ButtonType.Circle)
        .position({top : 0,left : 0 })
        .opacity(0.5)
        .onClick((e:ClickEvent) => {
          router.pushUrl({
            url: 'pages/Page'
          })
        })
      }
      .backgroundColor('#E0E0E0')
      .height(40)


      Column(){
        Divider().strokeWidth(9).color('#F1F3F5')

        Column(){
          Text('当前相关设备')
            .fontSize(22)
            .fontWeight(700)
            .textAlign(TextAlign.Center)
            .padding(15)
            .position({top : 0 , left : 0})
        }.margin({bottom:35})

        Divider().strokeWidth(9).color('#F1F3F5')

      }


      Stack({ alignContent: Alignment.TopStart }) {
        Scroll(this.scroller) {
          Column() {
            ForEach(this.arr, (serv: Service) => {
              Row(){
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
                  .position({left : 184, top :30})

                Button(serv.switchState)
                  .fontSize(18)
                  .fontColor(Color.Blue)
                  .fontWeight(FontWeight.Bolder)
                  .backgroundColor(serv.buttonColor)
                  .position({right : 5, top :20})
                  .onClick((e:ClickEvent)=>{
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
            } )
          }.width('100%')
        }
        .scrollable(ScrollDirection.Vertical) // 滚动方向纵向
        .scrollBar(BarState.On) // 滚动条常驻显示
        .scrollBarColor(Color.Gray) // 滚动条颜色
        .scrollBarWidth(10) // 滚动条宽度
        .friction(0.6)
        .edgeEffect(EdgeEffect.None)
        .onWillScroll((xOffset: number, yOffset: number, scrollState: ScrollState) => {
          console.info(xOffset + ' ' + yOffset)
        })
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

      Column(){
        Text('点击添加可接通的管理设备+')
          .fontSize(20)
          .fontWeight(700)
          .textAlign(TextAlign.Center)
          .fontColor(Color.White)
          .padding(12)
      }.backgroundColor('#778899')
      .height('8%')
      .width('100%')

    }.height('100%')
    .width('100%')


  }
}