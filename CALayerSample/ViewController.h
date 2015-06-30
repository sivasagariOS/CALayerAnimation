//
//  ViewController.h
//  CALayerSample
//
//  Created by sivasagar palakurthy on 6/29/15.
//  Copyright (c) 2015 sivasagar palakurthy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FLAnimatedImage.h"
#import "FLAnimatedImageView.h"


@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *footBallView;
@property (strong, nonatomic) IBOutlet UIView *mainView;



@property (strong, nonatomic) IBOutlet FLAnimatedImageView *flanimatedImageView;


@property (strong, nonatomic) IBOutlet UIView *hammerView;


@property (strong, nonatomic) IBOutlet UIView *footballview1;


- (IBAction)playAction:(id)sender;



@end

