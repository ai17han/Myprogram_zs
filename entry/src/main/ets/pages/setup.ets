import { router } from '@kit.ArkUI';

@Entry
@Component

struct Page2{
  build() {

    Column() {

      Text("设置")
        .fontSize(20)
        .fontColor(Color.Black)
        .width('36%')
        .height(40)
        .alignSelf(ItemAlign.Center)
        .textAlign(TextAlign.Center)

      Column(){
        Text("个人信息")
          .fontSize(20)
          .width('100%')
          .height(50)
          .textAlign(TextAlign.Start)
          .border({ width: 1,color:Color.Grey })

        Text("账号安全")
          .fontSize(20)
          .width('100%')
          .height(50)
          .textAlign(TextAlign.Start)
          .border({ width: 1,color:Color.Grey })
      }
      .width('100%')
      .backgroundColor(Color.White)
      .margin({top:10,bottom:10})

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
        .border({ width: 1,color:Color.Grey })

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
        .border({ width: 1,color:Color.Grey })

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
        .border({ width: 1,color:Color.Grey })

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
        .border({ width: 1,color:Color.Grey })
      }
      .width('100%')
      .backgroundColor(Color.White)
      .margin({bottom:10})

      Text("隐私设置")
        .fontSize(18)
        .fontColor(Color.Black)
        .height(40)
        .width('100%')
        .textAlign(TextAlign.Start)
        .alignSelf(ItemAlign.Start)
        .backgroundColor(Color.Transparent)

      Column(){

        Text("权限管理")
          .fontSize(20)
          .width('100%')
          .height(50)
          .textAlign(TextAlign.Start)
          .border({ width: 1,color:Color.Grey })

        Text("切换账号")
          .fontSize(20)
          .width('100%')
          .height(50)
          .textAlign(TextAlign.Start)
          .border({ width: 1,color:Color.Grey })
      }
      .width('100%')
      .backgroundColor(Color.White)
      .margin({bottom:161})

      Row() {
        Text("首页")
          .height(30)
          .width('25%')
          .fontSize(20)
          .fontColor(Color.Black)
          .textAlign(TextAlign.Center)
          .border({ width: 1,color:Color.Grey })
          .onClick((e:ClickEvent)=>{
            router.pushUrl({ url: 'pages/page1'})
          });

        Text("智能设备")
          .width('50%')
          .height(30)
          .fontSize(20)
          .fontColor(Color.Black)
          .textAlign(TextAlign.Center)
          .border({ width: 1,color:Color.Grey })

        Text('设置')
          .width('25%')
          .height(30)
          .fontSize(20)
          .backgroundColor(Color.Grey)
          .fontColor(Color.White)
          .textAlign(TextAlign.Center)
          .border({ width: 1,color:Color.Grey })
      }
      .width('100%')
      .height(30)
      .backgroundColor(Color.White)
    }
    .width('100%')
    .height('100%')
    .backgroundImage($rawfile("app.media.background3.png"))
    .backgroundImageSize(ImageSize.FILL);
  }
}