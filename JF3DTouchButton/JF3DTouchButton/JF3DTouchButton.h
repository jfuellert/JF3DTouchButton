//
//  JF3DTouchButton.h
//  JF3DTouchButton
//
//  Created by Jeremy Fuellert on 2015-11-20.
//  Copyright © 2015 Jeremy Fuellert. All rights reserved.
//

@import UIKit;

NS_CLASS_AVAILABLE_IOS(9_0) @interface JF3DTouchButton : UIButton

/** Determines if the background color will change based on a given force. Default is YES. */
@property (nonatomic, assign) BOOL responsiveBackgroundColor;

/** Determines if the size will change based on a given force. Default is YES. */
@property (nonatomic, assign) BOOL responsiveSize;

#pragma mark - Background color
/** Sets the background color to use for the specified button state. */
- (void)setBackgroundColor:(nullable UIColor *)color forState:(UIControlState)state UI_APPEARANCE_SELECTOR;

/** Returns the background color for the specified button state. */
- (nullable UIColor *)backgroundColorForState:(UIControlState)state;

#pragma mark - Size
/** Sets the size to use for the specified button state. */

#warning TODO : APPEARANCE
- (void)setSize:(CGSize)size forState:(UIControlState)state UI_APPEARANCE_SELECTOR;

/** Returns the size for the specified button state. */
- (CGSize)sizeForState:(UIControlState)state;

@end