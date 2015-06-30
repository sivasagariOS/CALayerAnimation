//
//  ViewController.m
//  CALayerSample
//
//  Created by sivasagar palakurthy on 6/29/15.
//  Copyright (c) 2015 sivasagar palakurthy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize footBallView;
@synthesize footballview1;
@synthesize hammerView;
@synthesize flanimatedImageView;
@synthesize mainView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playAction:(id)sender
{
    
    CAKeyframeAnimation* widthAnim = [CAKeyframeAnimation animationWithKeyPath:@"borderWidth"];
    NSArray* widthValues = [NSArray arrayWithObjects:@1.0, @10.0, @5.0, @30.0, @0.5, @15.0, @2.0, @50.0, @0.0, nil];
    widthAnim.values = widthValues;
    widthAnim.calculationMode = kCAAnimationPaced;
    
    
    FLAnimatedImage * llightningImage = [[FLAnimatedImage alloc] initWithAnimatedGIFData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"1" ofType:@"gif"]]];
    
    flanimatedImageView.animatedImage=llightningImage;
    
    [hammerView addSubview:flanimatedImageView];
    
    
    
    CALayer *overlayLayer=[CALayer layer];
   //
   // [overlayLayer addSublayer:flanimatedImageView.layer];
    
    
    UIView *addview=[[UIView alloc]initWithFrame:CGRectMake(10, 50, 100, 100)];
    [addview setBackgroundColor:[UIColor orangeColor]];
    
    [addview.layer addSublayer:flanimatedImageView.layer];
    
    [mainView addSubview:addview];
    
    
    
    
    
    CAKeyframeAnimation* hamemrAnim = [CAKeyframeAnimation animationWithKeyPath:@"borderWidth"];
    NSArray* hamemrValues = [NSArray arrayWithObjects:@1.0, @10.0, @5.0, @30.0, @0.5, @15.0, @2.0, @50.0, @0.0, nil];
    hamemrAnim.values = hamemrValues;
    hamemrAnim.calculationMode = kCAAnimationCubic;
    hamemrAnim.duration=100;
    
    
    
    
    
    // Animation 2
    CAKeyframeAnimation* colorAnim = [CAKeyframeAnimation animationWithKeyPath:@"borderColor"];
    NSArray* colorValues = [NSArray arrayWithObjects:(id)[UIColor greenColor].CGColor,
                            (id)[UIColor redColor].CGColor, (id)[UIColor blueColor].CGColor,  nil];
    colorAnim.values = colorValues;
    colorAnim.calculationMode = kCAAnimationPaced;
    
    // Animation group
    CAAnimationGroup* group = [CAAnimationGroup animation];
    group.duration = 5.0;
    
    
    CGMutablePathRef thePath = CGPathCreateMutable();
    CGPathMoveToPoint(thePath,NULL,74.0,74.0);
    
    
    CGPathAddCurveToPoint(thePath, NULL, 74.0, 500.0, 300.0, 400.0, 300.0, 74.0);
    
    
    CABasicAnimation  *bAnim = [CABasicAnimation animationWithKeyPath:@"position"];
    bAnim.fromValue = [NSValue valueWithCGPoint:footBallView.layer.position];
    bAnim.toValue = [NSValue valueWithCGPoint:CGPointZero];
    bAnim.duration = 3.0;
    
 
    
//    
//    CGPathAddCurveToPoint(thePath,NULL,74.0,500.0,
//                          320.0,500.0,
//                          320.0,74.0);
    
    /*
    CGPathAddCurveToPoint(thePath,NULL,320.0,500.0,
                          566.0,500.0,
                          566.0,74.0);
    
    */
    
    CAKeyframeAnimation * theAnimation;
    
    // Create the animation object, specifying the position property as the key path.
    theAnimation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    theAnimation.path=thePath;
    theAnimation.duration=5.0;
    
 //   group.animations = [NSArray arrayWithObjects:colorAnim,widthAnim,nil];

    
     group.animations = [NSArray arrayWithObjects:colorAnim, widthAnim,theAnimation,nil];
     [footBallView.layer addAnimation:group forKey:@"BorderChanges"];
    
    [hammerView.layer addAnimation:hamemrAnim forKey:@"hammerChanges"];
    
    
    CGPathRelease(thePath);

    
    
    
    
    
    
}
@end
