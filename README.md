# CarouselImageView
A pictures-carousel-view by swift.
#How to ues
```
 /**
 类方法生成对象
 - parameter frame:     相对尺寸
 - parameter superView: 需要添加到的父视图
 - returns: YzCarouselImage对象
 */
let carouselImageView = YzCarouselImage.carouselView(frame, superView: self.view)
/**
	图片数据源
*/
carouselImageView.imagesArray = images
/**
	定时器间隔
*/
carouselImageView.duration = 1
```
#### You can get more information from demo.Clone or download the zip to view it.


