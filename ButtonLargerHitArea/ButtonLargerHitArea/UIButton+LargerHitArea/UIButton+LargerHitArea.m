//
//  UIButton.m
//  ButtonLargerHitArea
//
//  Created by drops on 16/1/31.
//  Copyright © 2016年 TXW. All rights reserved.
//

#import "UIButton+LargerHitArea.h"
#import <objc/runtime.h>

@implementation UIButton(LargerHitArea)

static const char *mKeyHitEdgeInsets = "HitEdgeInsets";
@dynamic hitEdgeInsets;

- (void)setHitEdgeInsets:(UIEdgeInsets)hitEdgeInsets {
    NSValue *value = [NSValue value:&hitEdgeInsets withObjCType:@encode(UIEdgeInsets)];
    objc_setAssociatedObject(self, mKeyHitEdgeInsets, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIEdgeInsets)hitEdgeInsets {
    NSValue *value = objc_getAssociatedObject(self, mKeyHitEdgeInsets);
    if (value) {
        UIEdgeInsets edgeInsets;
        [value getValue:&edgeInsets];
        return edgeInsets;
    } else {
        return UIEdgeInsetsZero;
    }
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    if (UIEdgeInsetsEqualToEdgeInsets(self.hitEdgeInsets, UIEdgeInsetsZero) || !self.enabled || self.hidden) {
        return [super pointInside:point withEvent:event];
    }
    
    CGRect hitFrame = UIEdgeInsetsInsetRect(self.bounds, self.hitEdgeInsets);
    return CGRectContainsPoint(hitFrame, point);
}

@end
