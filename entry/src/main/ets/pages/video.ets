// 视频插件
// xxx.ets
@Preview
@Component
export struct VideoPlayer {
  private controller: VideoController = new VideoController()
  private previewUris: Resource = $rawfile('previewTest.jpg')
  private innerResource: Resource = $rawfile('videotest.mp4')

  build() {
    Column() {
      Video({
        src: this.innerResource,
        previewUri: this.previewUris,
        controller: this.controller
      })
    }
  }
}
