//
//  ViewController.m
//  JMHArcProjectForConverting
//
//  Created by god on 12/8/14.
//  Copyright (c) 2014 juanmao. All rights reserved.
//

#import "JMHViewController.h"


struct JMHStruct
{
    id x;
    float y;
};

@interface JMHViewController()
{
    id<JMHViewControllerDelegate> assignDelegate;
}

@property (nonatomic, retain) UILabel *label;
@property (nonatomic, assign) dispatch_queue_t myQueue;

- (void)autoreleaseExample;
- (void)retainReleaseExample;
- (void)bridgeExample;
- (void)coreFoundationExample;
- (NSArray *)returnArrayExample;

@end

@implementation JMHViewController


- (instancetype)init
{
    [super init];
    self.label = [UIButton buttonWithType:UIButtonTypeCustom];
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self retainReleaseExample];
    [self autoreleaseExample];
    [self bridgeExample];
    [self coreFoundationExample];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)retainReleaseExample
{
    UIButton *button = [[UIButton alloc] init];
    [[button retain] autorelease];
    __unused NSUInteger buttonRetainCount = button.retainCount;
    [button release];
}


- (void)autoreleaseExample
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    __unused UILabel *label = [[[UILabel alloc] init] autorelease];
    
    
    for (int i =0; i < 10000; ++i) {
        NSAutoreleasePool *innerPool = [[NSAutoreleasePool alloc] init];
        __unused UIButton *button = [[[UIButton alloc] init] autorelease];
        [innerPool release];
    }
    
    [pool release];
}

- (void)bridgeExample
{
    NSString *exampleString = [NSString stringWithUTF8String:"juanmao"];
    CFStringRef cfString = (CFStringRef)exampleString;
    __unused NSString *string = (NSString *)cfString;
}

- (void)coreFoundationExample
{
    const void *num[3] = {"1", "2", "3"};
    CFArrayRef cfArray = CFArrayCreate(kCFAllocatorDefault, num, 1, NULL);
    CFRelease(cfArray);
}

- (NSArray *)returnArrayExample
{
    NSArray *array = [[NSArray alloc] initWithObjects:@"juanmao", nil];
    return [array autorelease];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    self.label = nil;
    self.button = nil;
    
    [super dealloc];
}

@end
