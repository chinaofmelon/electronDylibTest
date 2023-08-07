//
//  test.m
//  test
//
//  Created by melon on 2023/8/7.
//

#import "test.h"

@implementation test


NSTimer *timer = nil;
int totalCound = 0;

void(*CALLBACKFUN)(int index, char* runloopName);

int testFun(void(*callback)(int index, char* runloopName)) {
    if (timer) {
        [timer invalidate];
        timer = nil;
        totalCound = 0;
    }
    
    CALLBACKFUN = callback;

    timer = [NSTimer timerWithTimeInterval:1.0f repeats:YES block:^(NSTimer * _Nonnull t) {
        NSString *model = [NSRunLoop.mainRunLoop currentMode];
            
        NSLog(@"aaaaaaaaaaaaaaaaa   %@ %d", model, CALLBACKFUN);

        totalCound++;

        if (CALLBACKFUN) {
            CALLBACKFUN(totalCound, model.UTF8String);
        }
    }];
        
    [NSRunLoop.currentRunLoop addTimer:timer forMode:NSDefaultRunLoopMode];
    [timer fire];
    return 0;
}


@end
