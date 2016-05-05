 # GDGIFImage
##使您的UIImageView支持GIF 
###这又是一个分类,这个分类可以使您的UIImageView 支持GIF
###这个分类是受SDWebImage中的UIImage+GIF启发对UIImageView做的一个分类来支持GIF


```obj
/**
 *  根据gif名称设置
 *
 *  @param name gif名称
 */
- (void)gd_setGIFImageWithGIFName:(NSString *)name;

/**
 *  根据gif名称设置
 *
 *  @param name        gif名称
 *  @param placeholder 占位图
 */
- (void)gd_setGIFImageWithGIFName:(NSString *)name placeholderImage:(UIImage *)placeholder;

/**
 *  根据gifdata设置
 *
 *  @param gifData gifData
 */
- (void)gd_setGIFImageWithGIFData:(NSData *)gifData;
/**
 *  根据gifdata设置
 *
 *  @param gifData     gifData
 *  @param placeholder 占位图
 */

- (void)gd_setGIFImageWithGIFData:(NSData *)gifData placeholderImage:(UIImage *)placeholder;

/**
 *  根据gif 文件path设置
 *
 *  @param gifPath gif 文件path
 */
- (void)gd_setGIFImageWithGIFPath:(NSString *)gifPath;

/**
 *  根据gif 文件path设置
 *
 *  @param gifPath     gif 文件path
 *  @param placeholder 占位图
 */
- (void)gd_setGIFImageWithGIFPath:(NSString *)gifPath placeholderImage:(UIImage *)placeholder;

/**
 *  根据gif URl设置
 *
 *  @param gifURL gifURL
 */
- (void)gd_setGIFImageWithGIFURL:(NSURL *)gifURL;

/**
 *  根据gif URl设置
 *
 *  @param gifURL      gifURL
 *  @param placeholder 占位图
 */
- (void)gd_setGIFImageWithGIFURL:(NSURL *)gifURL placeholderImage:(UIImage *)placeholder;

/**
 *  根据gif URlSte设置
 *
 *  @param gifURLStr gifURLStr
 */
- (void)gd_setGIFImageWithGIFURLStr:(NSString *)gifURLStr;


/**
 *  根据gif URlSte设置
 *
 *  @param gifURLStr   gifURLStr
 *  @param placeholder 占位图
 */
- (void)gd_setGIFImageWithGIFURLStr:(NSString *)gifURLStr placeholderImage:(UIImage *)placeholder;
```