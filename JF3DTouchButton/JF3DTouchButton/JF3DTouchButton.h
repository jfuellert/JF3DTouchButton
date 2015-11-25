//
//  JF3DTouchButton.h
//  JF3DTouchButton
//
//  Created by Jeremy Fuellert on 2015-11-20.
//  Copyright © 2015 Jeremy Fuellert. All rights reserved.
//

@import UIKit;

FOUNDATION_EXPORT const CGSize CGSizeNull NS_AVAILABLE_IOS(9_0);

NS_CLASS_AVAILABLE_IOS(9_0) @interface JF3DTouchButton : UIButton

/** Determines if the background color will change based on a given force. Default is YES. */
@property (nonatomic, assign) BOOL responsiveBackgroundColor;

/** Determines if the size will change based on a given force. Default is YES. */
@property (nonatomic, assign) BOOL responsiveSize;

/** Determines if the image will change based on a given force. Default is YES. */
@property (nonatomic, assign) BOOL responsiveImage;

/** Determines if the background image will change based on a given force. Default is YES. */
@property (nonatomic, assign) BOOL responsiveBackgroundImage;

#pragma mark - Background color
/** Sets the background color to use for the specified button state. */
- (void)setBackgroundColor:(nullable UIColor *)color forState:(UIControlState)state UI_APPEARANCE_SELECTOR;

/** Returns the background color for the specified button state. */
- (nullable UIColor *)backgroundColorForState:(UIControlState)state;

#pragma mark - Size
/** Sets the size to use for the specified button state. Use CGSizeNull to remove a size for a state. */
- (void)setSize:(CGSize)size forState:(UIControlState)state UI_APPEARANCE_SELECTOR;

/** Returns the size for the specified button state. */
- (CGSize)sizeForState:(UIControlState)state;

#pragma mark - Image

#warning TODO : Appearance
/** Sets the image to use for the specified button state. */
- (void)setImage:(nullable UIImage *)image forState:(UIControlState)state UI_APPEARANCE_SELECTOR;

/** Returns the image for the specified button state. */
- (nullable UIImage *)imageForState:(UIControlState)state;

#pragma mark - Background image

#warning TODO : Appearance

/** Sets the background image to use for the specified button state. */
- (void)setBackgroundImage:(nullable UIImage *)image forState:(UIControlState)state UI_APPEARANCE_SELECTOR;

/** Returns the background image for the specified button state. */
- (nullable UIImage *)backgroundImageForState:(UIControlState)state;

@end