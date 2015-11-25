//
//  __JF3DTouchButton+BackgroundImage.m
//  JF3DTouchButton
//
//  Created by Jeremy Fuellert on 2015-11-24.
//  Copyright © 2015 Jeremy Fuellert. All rights reserved.
//

#import "__JF3DTouchButton+BackgroundImage.h"

#pragma mark - Constants
NSString *const kJF3DTouchButton_KeyStateDictionaryNormalBackgroundImage    = @"JF3DTouchButtonKeyStateDictionaryNormalBackgroundImage";
NSString *const kJF3DTouchButton_KeyStateDictionaryHighlightBackgroundImage = @"JF3DTouchButtonKeyStateDictionaryHighlightBackgroundImage";

@implementation JF3DTouchButton (BackgroundImage)

- (BOOL)canUpdateBackgroundImage {

    return self.responsiveBackgroundImage && [self backgroundImageForState:UIControlStateNormal] && [self backgroundImageForState:UIControlStateHighlighted];

}

+ (nonnull NSMutableDictionary *)updateBackgroundImage:(nullable UIImage *)image forState:(UIControlState)state stateDictionary:(nonnull NSMutableDictionary *)stateDictionary {
    
    NSString *dictionaryKey = [[self class] backgroundImageKeyForState:state];
    if(!dictionaryKey) {
        return stateDictionary;
    }
    
    if(!image) {
        [stateDictionary removeObjectForKey:dictionaryKey];
    } else {
        stateDictionary[dictionaryKey] = image;
    }
    
    return stateDictionary;
}

+ (nullable UIImage *)backgroundImageForState:(UIControlState)state stateDictionary:(nonnull NSDictionary *)stateDictionary {
    
    NSString *dictionaryKey = [[self class] backgroundImageKeyForState:state];
    if(!dictionaryKey) {
        return nil;
    }
    
    return stateDictionary[dictionaryKey];
}

+ (nullable NSString *)backgroundImageKeyForState:(UIControlState)state {
    
    switch(state) {
        case UIControlStateNormal:
            return kJF3DTouchButton_KeyStateDictionaryNormalBackgroundImage;
        case UIControlStateHighlighted:
        case UIControlStateSelected:
            return kJF3DTouchButton_KeyStateDictionaryHighlightBackgroundImage;
        case UIControlStateDisabled:
        case UIControlStateReserved:
        case UIControlStateApplication:
#ifndef SDK_HIDE_TIDE
        case UIControlStateFocused:
#endif
        default:
            NSLog(@"Background image UIControlState state type not supported : %lu.\n Please use UIControlStateNormal or UIControlStateHighlighted.", (unsigned long)state);
            return nil;
    }
}

@end