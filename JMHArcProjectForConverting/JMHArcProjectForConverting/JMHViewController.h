//
//  JMHViewController.h
//  JMHArcProjectForConverting
//
//  Created by god on 12/8/14.
//  Copyright (c) 2014 juanmao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JMHViewControllerDelegate <NSObject>

- (void)dosomething;

@end

@interface JMHViewController : UIViewController

@property (nonatomic, retain) UIButton *button;
@property (nonatomic, copy) NSString *newName;
@property (nonatomic, assign) id<JMHViewControllerDelegate> delegate;


- (instancetype)initwithDelegate:(id)delegate;

@end

