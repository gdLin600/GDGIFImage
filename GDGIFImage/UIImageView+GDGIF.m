//
//  UIImageView+GDGIF.m
//  GDGIFImageDemo
//
//  Created by 林广德 on 16/5/5.
//  Copyright © 2016年 林广德. All rights reserved.
//

#import "UIImageView+GDGIF.h"
#import <ImageIO/ImageIO.h>

@implementation NSObject (GDGIF)
+ (void)gd_GIFWithGIFNamed:(NSString *)gifName completion:(void (^) (UIImage *image))completion{
    CGFloat scale = [UIScreen mainScreen].scale;
    if (scale>2.0f) {
        NSString *retinaPath = [[NSBundle mainBundle] pathForResource:[gifName stringByAppendingString:@"@3x"] ofType:@"gif"];
        
        NSData *data = [NSData dataWithContentsOfFile:retinaPath];
        
        if (data) {
            [self gd_GIFWithGIFData:data completion:completion];
        }else{
            NSString *retinaPath = [[NSBundle mainBundle] pathForResource:[gifName stringByAppendingString:@"@2x"] ofType:@"gif"];
            
            NSData *data = [NSData dataWithContentsOfFile:retinaPath];
            
            if (data) {
                [self gd_GIFWithGIFData:data completion:completion];
            }else{
                
                NSString *path = [[NSBundle mainBundle] pathForResource:gifName ofType:@"gif"];
                
                data = [NSData dataWithContentsOfFile:path];
                
                if (data) {
                    [self gd_GIFWithGIFData:data completion:completion];
                }else{
                    if (completion) {
                        completion([UIImage imageNamed:gifName]);
                    }
                    
                }
            }
        }
    }else if (scale > 1.0f) {
        
        NSString *retinaPath = [[NSBundle mainBundle] pathForResource:[gifName stringByAppendingString:@"@2x"] ofType:@"gif"];
        
        NSData *data = [NSData dataWithContentsOfFile:retinaPath];
        
        if (data) {
            [self gd_GIFWithGIFData:data completion:completion];
        }else{
            
            NSString *path = [[NSBundle mainBundle] pathForResource:gifName ofType:@"gif"];
            
            data = [NSData dataWithContentsOfFile:path];
            
            if (data) {
                [self gd_GIFWithGIFData:data completion:completion];
            }else{
                
                if (completion) {
                    completion([UIImage imageNamed:gifName]);
                }
            }
        }
    }
    else {
        NSString *path = [[NSBundle mainBundle] pathForResource:gifName ofType:@"gif"];
        
        NSData *data = [NSData dataWithContentsOfFile:path];
        
        if (data) {
            [self gd_GIFWithGIFData:data completion:completion];
        }
        if (completion) {
            completion([UIImage imageNamed:gifName]);
        }
    }
    
}


+ (void)gd_GIFWithGIFData:(NSData *)gifData completion:(void (^) (UIImage *image))completion{
    
    CGImageSourceRef imageSource = CGImageSourceCreateWithData((__bridge CFDataRef)gifData, NULL);
    size_t imageCount = CGImageSourceGetCount(imageSource);
    if (imageCount <= 1) {
        if (completion) {
            completion([UIImage imageWithData:gifData]);
        }
    }
    NSMutableArray *images = [NSMutableArray array];
    NSTimeInterval duration = 0.0f;
    for (size_t i = 0; i < imageCount; i++) {
        CGImageRef imageRef = CGImageSourceCreateImageAtIndex(imageSource, i, NULL);
        if (!imageRef) {
            continue;
        }
        duration += [self gd_frameDurationAtIndex:i source:imageSource];
        [images addObject:[UIImage imageWithCGImage:imageRef scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp]];
        CGImageRelease(imageRef);
    }
    if (!duration) {
        duration = (1.0f / 10.0f) * imageCount;
    }
    CFRelease(imageSource);
    if (completion) {
        completion([UIImage animatedImageWithImages:images duration:duration]);
    }
}


+ (void)gd_GIFWithGIFPath:(NSString *)gifPath completion:(void (^) (UIImage *image))completion{
    [self gd_GIFWithGIFData:[NSData dataWithContentsOfFile:gifPath] completion:completion];
}


+ (void)gd_GIFWithGIFURL:(NSURL *)gifURL completion:(void (^) (UIImage *image))completion{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^() {
        NSData *data = [NSData dataWithContentsOfURL:gifURL];
        [self gd_GIFWithGIFData:data completion:completion];
    });
}


+ (void)gd_GIFWithGIFURLStr:(NSString *)gifURLStr completion:(void (^) (UIImage *image))completion{
    [self gd_GIFWithGIFURL:[NSURL URLWithString:gifURLStr] completion:completion];
}

- (float)gd_frameDurationAtIndex:(NSUInteger)index source:(CGImageSourceRef)source {
    float frameDuration = 0.1f;
    CFDictionaryRef cfFrameProperties = CGImageSourceCopyPropertiesAtIndex(source, index, nil);
    NSDictionary *frameProperties = (__bridge NSDictionary *)cfFrameProperties;
    NSDictionary *gifProperties = frameProperties[(NSString *)kCGImagePropertyGIFDictionary];
    
    NSNumber *delayTimeUnclampedProp = gifProperties[(NSString *)kCGImagePropertyGIFUnclampedDelayTime];
    if (delayTimeUnclampedProp) {
        frameDuration = [delayTimeUnclampedProp floatValue];
    }
    else {
        
        NSNumber *delayTimeProp = gifProperties[(NSString *)kCGImagePropertyGIFDelayTime];
        if (delayTimeProp) {
            frameDuration = [delayTimeProp floatValue];
        }
    }
    if (frameDuration < 0.011f) {
        frameDuration = 0.100f;
    }
    
    CFRelease(cfFrameProperties);
    return frameDuration;
}

@end


@implementation UIImageView (GDGIF)
- (void)gd_setGIFImageWithGIFName:(NSString *)name{
    [self gd_setGIFImageWithGIFName:name placeholderImage:nil];
}

- (void)gd_setGIFImageWithGIFName:(NSString *)name placeholderImage:(UIImage *)placeholder{
    self.image = placeholder;
    [NSObject gd_GIFWithGIFNamed:name completion:^(UIImage *image) {
        self.image = image;
    }];
}

- (void)gd_setGIFImageWithGIFData:(NSData *)gifData{
    [self gd_setGIFImageWithGIFData:gifData placeholderImage:nil];
}

- (void)gd_setGIFImageWithGIFData:(NSData *)gifData placeholderImage:(UIImage *)placeholder{
    self.image = placeholder;
    [NSObject gd_GIFWithGIFData:gifData completion:^(UIImage *image) {
        self.image = image;
    }];
}

- (void)gd_setGIFImageWithGIFPath:(NSString *)gifPath{
    [self gd_setGIFImageWithGIFPath:gifPath placeholderImage:nil];
}

- (void)gd_setGIFImageWithGIFPath:(NSString *)gifPath placeholderImage:(UIImage *)placeholder{
    self.image = placeholder;
    [NSObject gd_GIFWithGIFPath:gifPath completion:^(UIImage *image) {
        self.image = image;
    }];
}

- (void)gd_setGIFImageWithGIFURL:(NSURL *)gifURL{
    [self gd_setGIFImageWithGIFURL:gifURL placeholderImage:nil];
}

- (void)gd_setGIFImageWithGIFURL:(NSURL *)gifURL placeholderImage:(UIImage *)placeholder{
    self.image = placeholder;
    [NSObject gd_GIFWithGIFURL:gifURL completion:^(UIImage *image) {
        self.image = image;
    }];
    
}

- (void)gd_setGIFImageWithGIFURLStr:(NSString *)gifURLStr{
    [self gd_setGIFImageWithGIFURLStr:gifURLStr placeholderImage:nil];
}

- (void)gd_setGIFImageWithGIFURLStr:(NSString *)gifURLStr placeholderImage:(UIImage *)placeholder{
    [self gd_setGIFImageWithGIFURL:[NSURL URLWithString:gifURLStr] placeholderImage:placeholder];
}


-(void)gd_GIFPasue{
    CFTimeInterval pausedTime = [self.layer convertTime:CACurrentMediaTime() fromLayer:nil];
    self.layer.speed = 0.0;
    self.layer.timeOffset = pausedTime;
}
-(void)gd_GIFResume{
    CFTimeInterval pausedTime = [self.layer timeOffset];
    self.layer.speed = 1.0;
    self.layer.timeOffset = 0.0;
    self.layer.beginTime = 0.0;
    CFTimeInterval timeSincePause = [self.layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    self.layer.beginTime = timeSincePause;
}
-(void)gd_GIFStop{
    self.layer.speed = 0.0;
    self.layer.timeOffset = 0;
}

-(void)gd_GIFStart{
    self.layer.speed = 1.0;
    self.layer.timeOffset = 0.0;
    self.layer.beginTime = 0.0;
}

@end
