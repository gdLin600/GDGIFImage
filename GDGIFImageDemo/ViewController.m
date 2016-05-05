//
//  ViewController.m
//  GDGIFImageDemo
//
//  Created by 林广德 on 16/5/5.
//  Copyright © 2016年 林广德. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+GDGIF.h"

@interface ViewController ()
{
    BOOL _flag;
}
@property (nonatomic, weak) UIImageView *imageV;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _flag = 0;
    // Do any additional setup after loading the view, typically from a nib.
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    //    [imageV gd_setGIFImageWithGIFURL:[NSURL URLWithString:@"http://images.17173.com/2015/news/2015/07/06/2015cpb0706gif22.gif"]placeholderImage:[UIImage imageNamed:@"friendsTrend_login_click"]];
    [imageV gd_setGIFImageWithGIFURLStr:@"http://images.17173.com/2015/news/2015/07/06/2015cpb0706gif22.gif" placeholderImage:[UIImage imageNamed:@"friendsTrend_login_click"]];
    //    [imageV gd_setGIFImageWithGIFName:@"test" placeholderImage:[UIImage imageNamed:@"friendsTrend_login_click"]];
    [self.view addSubview:imageV];
    
    self.imageV = imageV;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    _flag = !_flag;
    if (_flag) {
        [self.imageV gd_GIFStop];
    }else{
        [self.imageV gd_GIFStart];
    }
}


@end
