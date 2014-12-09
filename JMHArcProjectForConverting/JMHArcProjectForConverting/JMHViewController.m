//
//  ViewController.m
//  JMHArcProjectForConverting
//
//  Created by god on 12/8/14.
//  Copyright (c) 2014 juanmao. All rights reserved.
//

#import "JMHViewController.h"
#import "JMHDemoObj.h"


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

- (void)dispatchExample;

- (void)AllBridgeExample;

- (void)caseExample:(int)num;
@end

@implementation JMHViewController


- (instancetype)init
{
    [super init];
    self.label = [UIButton buttonWithType:UIButtonTypeCustom];
    
    return self;
}

- (instancetype)initwithDelegate:(id)delegate
{
    if (self = [super init]) {
        assignDelegate = delegate;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self retainReleaseExample];
    [self autoreleaseExample];
    [self bridgeExample];
    [self coreFoundationExample];
    
    [self AllBridgeExample];
    [self dispatchExample];
    [self caseExample:3];
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

- (void)dispatchExample
{
    self.myQueue = dispatch_queue_create("com.juanmao.hu", NULL);
    dispatch_retain(self.myQueue);
    dispatch_release(self.myQueue);
}

- (void)AllBridgeExample
{
    JMHDemoObj *obj = [[JMHDemoObj alloc] init];
    [obj doSomething];
    [obj weakUnsafe_unRetainedCompare];
}

- (void)caseExample:(int)num
{
    switch (num) {
        case 0:
            NSLog(@"0");
            NSObject *obj = [[NSObject alloc] init];
            [obj class];
            break;
        case 1:
            obj = [[NSObject alloc] init];
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    self.label = nil;
    self.button = nil;
    dispatch_release(self.myQueue);
    self.myQueue = nil;
    
    [super dealloc];
}



@end
