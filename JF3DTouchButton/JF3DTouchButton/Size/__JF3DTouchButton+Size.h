//
//  __JF3DTouchButton+Size.h
//  JF3DTouchButton
//
//  Created by Jeremy Fuellert on 2015-11-20.
//  Copyright © 2015 Jeremy Fuellert. All rights reserved.
//

#import "JF3DTouchButton.h"

@interface JF3DTouchButton (Size)

- (BOOL)canUpdateSizeWithStateDictionary:(nonnull NSDictionary *)stateDictionary;
+ (nonnull NSMutableDictionary *)updateFrame:(CGRect)frame forState:(UIControlState)state stateDictionary:(nonnull NSMutableDictionary *)stateDictionary;
+ (const CGRect)frameForState:(UIControlState)state stateDictionary:(nonnull NSDictionary *)stateDictionary;
+ (const CGRect)frameWithForce:(const CGFloat)force highlightSize:(const CGSize)highlightSize normalFrame:(const CGRect)normalFrame contentMode:(UIViewContentMode)contentMode;

@end