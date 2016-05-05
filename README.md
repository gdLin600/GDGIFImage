 # GDGIFImage
##使您的UIImageView支持GIF 
###这又是一个分类,这个分类可以使您的UIImageView 支持GIF
###这个分类是受SDWebImage中的UIImage+GIF启发对UIImageView做的一个分类来支持GIF
###同时支持对你的GIF进行暂停 开始等操作


##可以使用一些方法来设置您的UIImageView
```obj
/**
 *  根据gif名称设置
 */
- (void)gd_setGIFImageWithGIFName:;

/**
 *  根据gif名称设置
 */
- (void)gd_setGIFImageWithGIFName: placeholderImage:;

/**
 *  根据gifdata设置
 */
- (void)gd_setGIFImageWithGIFData:;
/**
 *  根据gifdata设置
 */

- (void)gd_setGIFImageWithGIFData: placeholderImage:;

/**
 *  根据gif 文件path设置
 */
- (void)gd_setGIFImageWithGIFPath:;

/**
 *  根据gif 文件path设置
 */
- (void)gd_setGIFImageWithGIFPath: placeholderImage:;

/**
 *  根据gif URl设置
 *
 *  @param gifURL gifURL
 */
- (void)gd_setGIFImageWithGIFURL:;

/**
 *  根据gif URl设置
 */
- (void)gd_setGIFImageWithGIFURL: placeholderImage:;

/**
 *  根据gif URlSte设置
 */
- (void)gd_setGIFImageWithGIFURLStr:;


/**
 *  根据gif URlSte设置
 */
- (void)gd_setGIFImageWithGIFURLStr: placeholderImage:;

```
##可以使用下面的方法对你的GIF的动画进行暂停等操作

```obj

#pragma mark - 暂停
-(void)gd_GIFPasue;
#pragma mark - 从暂停地方开始
-(void)gd_GIFResume;
#pragma mark - 停止
-(void)gd_GIFStop;
#pragma mark - 开始
-(void)gd_GIFStart;
```

