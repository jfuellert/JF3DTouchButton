//
//  __JF3DTouchButton+Size.m
//  JF3DTouchButton
//
//  Created by Jeremy Fuellert on 2015-11-20.
//  Copyright © 2015 Jeremy Fuellert. All rights reserved.
//

#import "__JF3DTouchButton+Size.h"

#pragma mark - Constants
NSString *const kJF3DTouchButton_KeyStateDictionaryNormalSize    = @"JF3DTouchButtonKeyStateDictionaryNormalSize";
NSString *const kJF3DTouchButton_KeyStateDictionaryHighlightSize = @"JF3DTouchButtonKeyStateDictionaryHighlightSize";

@implementation JF3DTouchButton (Size)

- (BOOL)canUpdateSizeWithStateDictionary:(nonnull NSDictionary *)stateDictionary {
    
    return self.responsiveSize && [stateDictionary.allKeys containsObject:kJF3DTouchButton_KeyStateDictionaryNormalSize] && [stateDictionary.allKeys containsObject:kJF3DTouchButton_KeyStateDictionaryHighlightSize];
}

+ (nonnull NSMutableDictionary *)updateFrame:(CGRect)frame forState:(UIControlState)state stateDictionary:(nonnull NSMutableDictionary *)stateDictionary {

    NSString *dictionaryKey = [[self class] sizeKeyForState:state];
    if(!dictionaryKey) {
        return stateDictionary;
    }
    
    if(CGRectIsNull(frame)) {
        [stateDictionary removeObjectForKey:dictionaryKey];
    } else {
        stateDictionary[dictionaryKey] = [NSValue valueWithCGRect:frame];
    }
    
    return stateDictionary;
}

+ (const CGRect)frameForState:(UIControlState)state stateDictionary:(nonnull NSDictionary *)stateDictionary {
    
    NSString *dictionaryKey = [[self class] sizeKeyForState:state];
    if(!dictionaryKey || ![stateDictionary.allKeys containsObject:dictionaryKey]) {
        return CGRectNull;
    }
    
    return [stateDictionary[dictionaryKey] CGRectValue];
}

+ (nullable NSString *)sizeKeyForState:(UIControlState)state {
    
    switch(state) {
        case UIControlStateNormal:
            return kJF3DTouchButton_KeyStateDictionaryNormalSize;
        case UIControlStateHighlighted:
        case UIControlStateSelected:
            return kJF3DTouchButton_KeyStateDictionaryHighlightSize;
        case UIControlStateDisabled:
        case UIControlStateReserved:
        case UIControlStateApplication:
#ifndef SDK_HIDE_TIDE
        case UIControlStateFocused:
#endif
        default:
            NSLog(@"Size UIControlState state type not supported : %lu.\n Please use UIControlStateNormal or UIControlStateHighlighted.", (unsigned long)state);
            return nil;
    }
}

+ (const CGRect)frameWithForce:(const CGFloat)force highlightSize:(const CGSize)highlightSize normalFrame:(const CGRect)normalFrame contentMode:(UIViewContentMode)contentMode {
    
    CGFloat frameWidth  = [[self class] sizeDimensionWithForce:force normalDimension:CGRectGetWidth(normalFrame) highlightDimension:highlightSize.width];
    CGFloat frameHeight = [[self class] sizeDimensionWithForce:force normalDimension:CGRectGetHeight(normalFrame) highlightDimension:highlightSize.height];
    CGFloat frameX      = [[self class] minPositionFromCenteredSizeWithPosition:CGRectGetMinX(normalFrame) normalSizeDimension:CGRectGetWidth(normalFrame) newSizeDimension:frameWidth];
    CGFloat frameY      = [[self class] minPositionFromCenteredSizeWithPosition:CGRectGetMinY(normalFrame) normalSizeDimension:CGRectGetHeight(normalFrame) newSizeDimension:frameHeight];
    
#pragma mark - TODO : Content mode

//    CGFloat frameX;
//    CGFloat frameY;
//    CGFloat frameWidth;
//    CGFloat frameHeight;
//    
//    switch(contentMode) {
//    case UIViewContentModeTop:
//        frameWidth  = [[self class] sizeDimensionWithForce:force normalDimension:CGRectGetWidth(normalFrame) highlightDimension:highlightSize.width];
//        frameHeight = [[self class] sizeDimensionWithForce:force normalDimension:CGRectGetHeight(normalFrame) highlightDimension:highlightSize.height];
//        frameX      = [[self class] minPositionFromCenteredSizeWithPosition:CGRectGetMinX(normalFrame) normalSizeDimension:CGRectGetWidth(normalFrame) newSizeDimension:frameWidth];
//        frameY = CGRectGetMinY(normalFrame);
//        break;
//    case UIViewContentModeTopLeft:
//        frameWidth;
//        frameHeight;
//        frameX = CGRectGetMinX(normalFrame);
//        frameY = CGRectGetMinY(normalFrame);
//        break;
//    case UIViewContentModeTopRight:
//        frameWidth;
//        frameHeight;
//        frameX;
//        frameY = CGRectGetMinY(normalFrame);
//        break;
//    case UIViewContentModeBottom:
//        frameWidth;
//        frameHeight;
//        frameX;
//        frameY;
//        break;
//    case UIViewContentModeBottomLeft:
//        frameWidth;
//        frameHeight;
//        frameX = CGRectGetMinX(normalFrame);
//        frameY;
//        break;
//    case UIViewContentModeBottomRight:
//        frameWidth;
//        frameHeight;
//        frameX;
//        frameY;
//        break;
//    case UIViewContentModeLeft:
//        frameWidth;
//        frameHeight;
//        frameX = CGRectGetMinX(normalFrame);
//        frameY;
//        break;
//    case UIViewContentModeRight:
//        frameWidth;
//        frameHeight;
//        frameX;
//        frameY;
//        break;
//    case UIViewContentModeCenter:
//    case UIViewContentModeRedraw:
//    case UIViewContentModeScaleAspectFill:
//    case UIViewContentModeScaleAspectFit:
//    case UIViewContentModeScaleToFill:
//    default:
//        frameWidth  = [[self class] sizeDimensionWithForce:force normalDimension:CGRectGetWidth(normalFrame) highlightDimension:highlightSize.width];
//        frameHeight = [[self class] sizeDimensionWithForce:force normalDimension:CGRectGetHeight(normalFrame) highlightDimension:highlightSize.height];
//        frameX      = [[self class] minPositionFromCenteredSizeWithPosition:CGRectGetMinX(normalFrame) normalSizeDimension:CGRectGetWidth(normalFrame) newSizeDimension:frameWidth];
//        frameY      = [[self class] minPositionFromCenteredSizeWithPosition:CGRectGetMinY(normalFrame) normalSizeDimension:CGRectGetHeight(normalFrame) newSizeDimension:frameHeight];
//        break;
//}
    
    return CGRectMake(frameX, frameY, frameWidth, frameHeight);
}

#pragma mark - Size calculations
+ (const CGFloat)sizeDimensionWithForce:(const CGFloat)force normalDimension:(const CGFloat)normalDimension highlightDimension:(const CGFloat)highlightDimension {

    return normalDimension + force * (highlightDimension - normalDimension);
}

#pragma mark - Position calculations
+ (const CGFloat)minPositionFromCenteredSizeWithPosition:(const CGFloat)position normalSizeDimension:(const CGFloat)normalSizeDimension newSizeDimension:(const CGFloat)newSizeDimension {
    
    return position + (normalSizeDimension - (newSizeDimension * 0.5f));
}

@end