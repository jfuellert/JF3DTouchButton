//
//  __JF3DTouchButton+BackgroundColor.h
//  JF3DTouchButton
//
//  Created by Jeremy Fuellert on 2015-11-20.
//  Copyright © 2015 Jeremy Fuellert. All rights reserved.
//

#import "JF3DTouchButton.h"

@interface JF3DTouchButton (BackgroundColor)

+ (BOOL)canUpdateBackgroundColorWithStateDictionary:(nonnull NSDictionary *)stateDictionary;
+ (nonnull NSMutableDictionary *)updateBackgroundColor:(nullable UIColor *)backgroundColor forState:(UIControlState)state stateDictionary:(nonnull NSMutableDictionary *)stateDictionary;
+ (nullable UIColor *)backgroundColorForState:(UIControlState)state stateDictionary:(nonnull NSDictionary *)stateDictionary;
+ (nullable UIColor *)backgroundColorWithForce:(const CGFloat)force normalColor:(nonnull UIColor const*)normalColor highlightColor:(nonnull UIColor const*)highlightColor;

@end