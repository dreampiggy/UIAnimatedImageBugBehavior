//
//  ViewController.m
//  UIAnimatedImageBugBehavior
//
//  Created by lizhuoli on 2019/7/22.
//  Copyright © 2019 lizhuoli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIImageView *imageView1;
@property (nonatomic, strong) UIImageView *imageView2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // UIAnimatedImage from name
    UIImage *image = [UIImage animatedImageNamed:@"image" duration:0.5];
    
    [self testNoneZeroFrameWithAnimatedImage:image];
    [self testZeroFrameWithAnimatedImage:image];
}

- (void)testNoneZeroFrameWithAnimatedImage:(UIImage *)image {
    self.imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    self.imageView1.layer.borderWidth = 1;
    [self.view addSubview:self.imageView1];
    self.imageView1.image = image;
}

- (void)testZeroFrameWithAnimatedImage:(UIImage *)image {
    self.imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.imageView2.layer.borderWidth = 1;
    [self.view addSubview:self.imageView2];
    self.imageView2.image = image;
    self.imageView2.frame = CGRectMake(200, 0, 200, 200);
    
//    self.imageView2.image = nil; // This tricky code solve the issue
//    self.imageView2.image = image;
}


@end
