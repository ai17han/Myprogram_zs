import { router } from '@kit.ArkUI';

@Entry
@Component
struct Page1 {

  build() {

    Column() {

      Text("退出登录")
        .backgroundColor(Color.White)
        .fontSize(18)
        .fontColor(Color.Black)
        .border({ width: 1,color:Color.Grey })
        .width('30%')
        .height(40)
        .alignSelf(ItemAlign.Start)
        .textAlign(TextAlign.Center)
        .onClick((e: ClickEvent) => {
          router.pushUrl({ url: 'pages/Index' })
        });

      Column({space:80}){
        Button("实时数据")
          .type(ButtonType.Normal)
          .borderRadius(10)
          .backgroundColor(Color.White)
          .fontSize(30)
          .fontColor(Color.Black)
          .width('60%')
          .height(80)

        Button("实时监控")
          .type(ButtonType.Normal)
          .borderRadius(10)
          .backgroundColor(Color.White)
          .fontSize(30)
          .fontColor(Color.Black)
          .width('60%')
          .height(80)

        Button("智能家居")
          .type(ButtonType.Normal)
          .borderRadius(10)
          .backgroundColor(Color.White)
          .fontSize(30)
          .fontColor(Color.Black)
          .width('60%')
          .height(80)
      }
      .width('100%')
      .margin({top:80,bottom:191})

      Row() {
        Text("首页")
          .height(30)
          .width('25%')
          .backgroundColor(Color.Grey)
          .fontSize(20)
          .fontColor(Color.White)
          .textAlign(TextAlign.Center)
          .border({width:1})

        Text("智能设备")
          .width('50%')
          .height(30)
          .fontSize(20)
          .fontColor(Color.Black)
          .textAlign(TextAlign.Center)
          .border({width:1})

        Text('设置')
          .width('25%')
          .height(30)
          .fontSize(20)
          .textAlign(TextAlign.Center)
          .border({width:1})
          .onClick((e:ClickEvent)=>{
            router.pushUrl({ url: 'pages/page2'})
          });
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