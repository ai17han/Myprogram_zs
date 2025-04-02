// 实时数据页面可视化图表
@Builder
function buildDataPanel(config: DataPanelConfiguration) {

  Column() {
    Column() {
      ForEach(config.values, (item: number, index: number) => {
        ChildItem({ item: item, index: index})
      }, (item: string) => item)
    }.padding(10)

    Column() {
      Line().width("100%").backgroundColor("#ff373737").margin({ bottom: 5 })
    }.padding({ left: 20, right: 20 })

    // Row() {
    //   Text('Length=' + config.values.length + '    ').margin({ left: 10 }).align(Alignment.Start)
    //   Text('Max=' + config.maxValue).margin({ left: 10 }).align(Alignment.Start)
    // }
  }
}

class DataPanelBuilder implements ContentModifier<DataPanelConfiguration> {
  constructor() {
  }

  applyContent(): WrappedBuilder<[DataPanelConfiguration]> {
    return wrapBuilder(buildDataPanel)
  }
}

@Entry
@Component
struct Index {
  public value1:number = 30;
  public value2:number = 45;
  public value3:number = 50;
  public value4:number = 100;
  public value5:number = 20;
  public value6:number = 50;

  build() {
    Column() {
      Text("Data panel").margin({ top: 12 });
      Row() {
        DataPanel({ values: [this.value1, this.value2, this.value3, this.value4, this.value5, this.value6], type: DataPanelType.Circle })
          .width(400)
          .height(260)
          .constraintSize({ maxWidth: "100%" })
          .padding({ top: 10 })
          .contentModifier(new DataPanelBuilder())
      }.margin(15).backgroundColor("#fff5f5f5")
    }
  }
}


@Component
struct ChildItem {
  @Prop item: number;
  @Prop index: number;
  public color1: string = "#65ff00dd";
  public color2: string = "#6500ff99";
  public color3: string = "#65ffe600";
  public color4: string = "#6595ff00";
  public color5: string = "#65000dff";
  public color6: string = "#650099ff";
  public colorArray: Array<string> = [this.color1, this.color2, this.color3, this.color4, this.color5, this.color6];
  public max1:number = 45;
  public max3:number = 100;
  public max5:number = 50;
  public max2:number = 45;
  public max4:number = 100;
  public max6:number = 50;


  build() {

    RelativeContainer() {
      Row() {
        if(this.index === 0) {
        Rect()
          .height(25)
          .width(this.item *100/this.max1)
            // 使用三元运算符选择max值
          // .width(this.item *200 / ((this.index === 0 || this.index === 1)? this.max1 :
          //   (this.index === 2 || this.index === 3)? this.max2 :
          //     (this.index === 4 || this.index === 5)? this.max3 : 100))
          .foregroundColor(this.colorArray[this.index])
          .radius(5)
          .align(Alignment.Start);
        Text(" " + this.item)
          .fontSize(17);
        }else if(this.index === 1) {
          Rect()
            .height(25)
            .width(this.item *100/this.max1)
            .foregroundColor(this.colorArray[this.index])
            .radius(5)
            .align(Alignment.Start);
          Text(" " + this.item)
            .fontSize(17);
        } else if(this.index === 2) {
          Rect()
            .height(25)
            .width(this.item *100/this.max2)
            .foregroundColor(this.colorArray[this.index])
            .radius(5)
            .align(Alignment.Start);
          Text(" " + this.item)
            .fontSize(17);
        } else if(this.index === 3) {
          Rect()
            .height(25)
            .width(this.item * 100 / this.max2)
            .foregroundColor(this.colorArray[this.index])
            .radius(5)
            .align(Alignment.Start);
          Text(" " + this.item)
            .fontSize(17);
        }else if(this.index === 4){
          Rect()
            .height(25)
            .width(this.item *100/this.max3)
            .foregroundColor(this.colorArray[this.index])
            .radius(5)
            .align(Alignment.Start);
          Text(" " + this.item)
            .fontSize(17);
        }else{
          Rect()
            .height(25)
            .width(this.item *100/this.max3)
            .foregroundColor(this.colorArray[this.index])
            .radius(5)
            .align(Alignment.Start);
          Text(" " + this.item)
            .fontSize(17);
        }
      }
    }.height(28);
  }
}
