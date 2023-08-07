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

int testFun(void(*callback)(int index)) {
    if (timer) {
        [timer invalidate];
        timer = nil;
        totalCound = 0;
    }

    timer = [NSTimer timerWithTimeInterval:1.0f repeats:YES block:^(NSTimer * _Nonnull t) {
        NSString *model = [NSRunLoop.mainRunLoop currentMode];
            
        NSLog(@"aaaaaaaaaaaaaaaaa   %@", model);

        totalCound++;

        if (callback) {
            callback(totalCound);
        }
    }];
        
    [NSRunLoop.currentRunLoop addTimer:timer forMode:NSDefaultRunLoopMode];
    [timer fire];
    return 0;
}


@end
