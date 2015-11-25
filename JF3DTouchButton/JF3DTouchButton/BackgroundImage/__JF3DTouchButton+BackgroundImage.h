//
//  __JF3DTouchButton+BackgroundImage.h
//  JF3DTouchButton
//
//  Created by Jeremy Fuellert on 2015-11-24.
//  Copyright © 2015 Jeremy Fuellert. All rights reserved.
//

#import "JF3DTouchButton.h"

@interface JF3DTouchButton (BackgroundImage)

- (BOOL)canUpdateBackgroundImage;
+ (nonnull NSMutableDictionary *)updateBackgroundImage:(nullable UIImage *)image forState:(UIControlState)state stateDictionary:(nonnull NSDictionary *)stateDictionary;
+ (nullable UIImage *)backgroundImageForState:(UIControlState)state stateDictionary:(nonnull NSMutableDictionary *)stateDictionary;

@end