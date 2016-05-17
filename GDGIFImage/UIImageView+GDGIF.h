//
//  UIImageView+GDGIF.h
//  GDGIFImageDemo
//
//  Created by 林广德 on 16/5/5.
//  Copyright © 2016年 林广德. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSObject (GDGIF)

+ (void)gd_GIFWithGIFNamed:(NSString *)gifName completion:(void (^) (UIImage *image))completion;


+ (void)gd_GIFWithGIFData:(NSData *)gifData completion:(void (^) (UIImage *image))completion;


+ (void)gd_GIFWithGIFPath:(NSString *)gifPath completion:(void (^) (UIImage *image))completion;


+ (void)gd_GIFWithGIFURL:(NSURL *)gifURL completion:(void (^) (UIImage *image))completion;


+ (void)gd_GIFWithGIFURLStr:(NSString *)gifURLStr completion:(void (^) (UIImage *image))completion;


@end


@interface UIImageView (GDGIF)
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

#pragma mark - 暂停
-(void)gd_GIFPasue;
#pragma mark - 从暂停地方开始
-(void)gd_GIFResume;
#pragma mark - 停止
-(void)gd_GIFStop;
#pragma mark - 开始
-(void)gd_GIFStart;




@end
