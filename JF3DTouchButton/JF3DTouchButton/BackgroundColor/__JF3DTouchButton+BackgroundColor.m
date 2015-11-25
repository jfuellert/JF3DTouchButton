//
//  __JF3DTouchButton+BackgroundColor.m
//  JF3DTouchButton
//
//  Created by Jeremy Fuellert on 2015-11-20.
//  Copyright © 2015 Jeremy Fuellert. All rights reserved.
//

#import "__JF3DTouchButton+BackgroundColor.h"

#pragma mark - Constants
NSString *const kJF3DTouchButton_KeyStateDictionaryNormalColor    = @"JF3DTouchButtonKeyStateDictionaryNormalColor";
NSString *const kJF3DTouchButton_KeyStateDictionaryHighlightColor = @"JF3DTouchButtonKeyStateDictionaryHighlightColor";

@implementation JF3DTouchButton (BackgroundColor)

- (BOOL)canUpdateBackgroundColorWithStateDictionary:(nonnull NSDictionary *)stateDictionary {
    
    return self.responsiveBackgroundColor && [stateDictionary.allKeys containsObject:kJF3DTouchButton_KeyStateDictionaryNormalColor] && [stateDictionary.allKeys containsObject:kJF3DTouchButton_KeyStateDictionaryHighlightColor];
}

+ (nonnull NSMutableDictionary *)updateBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state stateDictionary:(NSMutableDictionary *)stateDictionary {
    
    NSString *dictionaryKey = [[self class] backgroundColorKeyForState:state];
    if(!dictionaryKey) {
        return stateDictionary;
    }
    
    if(!backgroundColor) {
        [stateDictionary removeObjectForKey:dictionaryKey];
    }
    
    stateDictionary[dictionaryKey] = backgroundColor;
    
    return stateDictionary;
}

+ (nullable UIColor *)backgroundColorForState:(UIControlState)state stateDictionary:(nonnull NSDictionary *)stateDictionary {

    NSString *dictionaryKey = [[self class] backgroundColorKeyForState:state];
    if(!dictionaryKey) {
        return nil;
    }
    
    return stateDictionary[dictionaryKey];
}

+ (nullable NSString *)backgroundColorKeyForState:(UIControlState)state {
    
    switch(state) {
        case UIControlStateNormal:
            return kJF3DTouchButton_KeyStateDictionaryNormalColor;
            break;
        case UIControlStateHighlighted:
            return kJF3DTouchButton_KeyStateDictionaryHighlightColor;
            break;
        case UIControlStateSelected:
        case UIControlStateDisabled:
        case UIControlStateReserved:
        case UIControlStateApplication:
#ifndef SDK_HIDE_TIDE
        case UIControlStateFocused:
#endif
        default:
            NSLog(@"Background color UIControlState state type not supported : %lu.\n Please use UIControlStateNormal or UIControlStateHighlighted.", (unsigned long)state);
            return nil;
    }
}

+ (nullable UIColor *)backgroundColorWithForce:(const CGFloat)force normalColor:(nonnull UIColor const*)normalColor highlightColor:(nonnull UIColor const*)highlightColor {
    
    CGFloat redNormal;
    CGFloat greenNormal;
    CGFloat blueNormal;
    CGFloat alphaNormal;
    [normalColor getRed:&redNormal green:&greenNormal blue:&blueNormal alpha:&alphaNormal];
    
    CGFloat redHighlight;
    CGFloat greenHighlight;
    CGFloat blueHighlight;
    CGFloat alphaHighlight;
    [highlightColor getRed:&redHighlight green:&greenHighlight blue:&blueHighlight alpha:&alphaHighlight];
    
    CGFloat red   = [[self class] primaryColorWithForce:force normalColor:redNormal highlightColor:redHighlight];
    CGFloat green = [[self class] primaryColorWithForce:force normalColor:greenNormal highlightColor:greenHighlight];
    CGFloat blue  = [[self class] primaryColorWithForce:force normalColor:blueNormal highlightColor:blueHighlight];
    CGFloat alpha = [[self class] primaryColorWithForce:force normalColor:alphaNormal highlightColor:alphaHighlight];
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (const CGFloat)primaryColorWithForce:(const CGFloat)force normalColor:(CGFloat)normalColor highlightColor:(CGFloat)highlightColor {
    
    return normalColor + force * (highlightColor - normalColor);
}

@end