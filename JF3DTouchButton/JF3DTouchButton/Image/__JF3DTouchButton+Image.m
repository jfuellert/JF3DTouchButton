//
//  __JF3DTouchButton+Image.m
//  JF3DTouchButton
//
//  Created by Jeremy Fuellert on 2015-11-24.
//  Copyright © 2015 Jeremy Fuellert. All rights reserved.
//

#import "__JF3DTouchButton+Image.h"

#pragma mark - Constants
NSString *const kJF3DTouchButton_KeyStateDictionaryHighlightImage = @"JF3DTouchButtonKeyStateDictionaryHighlightImage";

@implementation JF3DTouchButton (Image)

- (BOOL)canUpdateImage {

    return self.responsiveImage && [self imageForState:UIControlStateNormal] && [self imageForState:UIControlStateHighlighted];
}

- (nonnull NSMutableDictionary *)updateImage:(nullable UIImage *)image forState:(UIControlState)state stateDictionary:(nonnull NSMutableDictionary *)stateDictionary {
    
    NSString *dictionaryKey = [[self class] imageKeyForState:state];
    if(!dictionaryKey) {
        [super setImage:image forState:state];
        return stateDictionary;
    }
    
    if(!image) {
        [stateDictionary removeObjectForKey:dictionaryKey];
    } else {
        stateDictionary[dictionaryKey] = image;
    }
    
    return stateDictionary;
}

- (nullable UIImage *)imageForState:(UIControlState)state stateDictionary:(nonnull NSDictionary *)stateDictionary {
    
    NSString *dictionaryKey = [[self class] imageKeyForState:state];
    if(!dictionaryKey || ![stateDictionary.allKeys containsObject:dictionaryKey]) {
        return [super imageForState:state];
    }
    
    return stateDictionary[dictionaryKey];
}

+ (nullable NSString *)imageKeyForState:(UIControlState)state {
    
    switch(state) {
        case UIControlStateHighlighted:
        case UIControlStateSelected:
            return kJF3DTouchButton_KeyStateDictionaryHighlightImage;
        case UIControlStateNormal:
        case UIControlStateDisabled:
        case UIControlStateReserved:
        case UIControlStateApplication:
#ifndef SDK_HIDE_TIDE
        case UIControlStateFocused:
#endif
        default:
            return nil;
    }
}

@end