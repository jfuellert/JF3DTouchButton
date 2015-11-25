//
//  JF3DTouchButton.m
//  JF3DTouchButton
//
//  Created by Jeremy Fuellert on 2015-11-20.
//  Copyright © 2015 Jeremy Fuellert. All rights reserved.
//

#import "__JF3DTouchButton+BackgroundColor.h"
#import "__JF3DTouchButton+BackgroundImage.h"
#import "__JF3DTouchButton+Image.h"
#import "__JF3DTouchButton+Size.h"

@interface JF3DTouchButton ()

@property (nonatomic, strong) NSMutableDictionary *stateDictionary;
@property (nonatomic, strong) UIImageView *responsiveImageView;
@property (nonatomic, strong) UIImageView *responsiveBackgroundImageView;

@end

@implementation JF3DTouchButton

#pragma mark - Init
- (instancetype)init {
    
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if(self) {
        _responsiveBackgroundColor = YES;
        _responsiveSize            = YES;
        _responsiveImage           = YES;
        _responsiveBackgroundImage = YES;
    }
    
    return self;
}

- (NSMutableDictionary *)stateDictionary {
 
    if(!_stateDictionary) {
        _stateDictionary = [[NSMutableDictionary alloc] init];
    }
    
    return _stateDictionary;
}

- (UIImageView *)responsiveImageView {
    
    if(!_responsiveImageView) {
        _responsiveImageView = [[UIImageView alloc] init];
    }
    
    return _responsiveImageView;
}

- (UIImageView *)responsiveBackgroundImageView {
    
    if(!_responsiveBackgroundImageView) {
        _responsiveBackgroundImageView = [[UIImageView alloc] init];
    }
    
    return _responsiveBackgroundImageView;
}

#pragma mark - Touches
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    [self resetForceProperties];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
    
    [self updateForcePropertiesWithTouches:touches];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
 
    [self resetForceProperties];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    
    [self resetForceProperties];
}

#pragma mark - Background color
- (void)setBackgroundColor:(nullable UIColor *)color forState:(UIControlState)state {
    
    self.stateDictionary = [[self class] updateBackgroundColor:color forState:state stateDictionary:self.stateDictionary];
    [self updateBackgroundColorWithForce:0.0f];
}

- (nullable UIColor *)backgroundColorForState:(UIControlState)state {
    
    return [[self class] backgroundColorForState:state stateDictionary:self.stateDictionary];
}

#pragma mark - Size
- (void)setSize:(CGSize)size forState:(UIControlState)state {

    CGRect frame         = self.frame;
    frame.size.width     = size.width;
    frame.size.height    = size.height;
    self.stateDictionary = [[self class] updateFrame:frame forState:state stateDictionary:self.stateDictionary];
    [self updateSizeWithForce:0.0f];
}

- (CGSize)sizeForState:(UIControlState)state {

    CGRect frame = [[self class] frameForState:state stateDictionary:self.stateDictionary];
    if(CGRectIsNull(frame)) {
        return self.bounds.size;
    }
    
    return frame.size;
}

#pragma mark - Image
- (void)setImage:(UIImage *)image forState:(UIControlState)state {
    [super setImage:image forState:state];
    
    if([self canUpdateImage]) {
        [self insertSubview:self.responsiveImageView atIndex:0];
    }

    [self updateImageWithForce:0.0f];
}

#pragma mark - Background image
- (void)setBackgroundImage:(UIImage *)image forState:(UIControlState)state {
    [super setBackgroundImage:image forState:state];
    
    if([self canUpdateBackgroundImage]) {
        [self insertSubview:self.responsiveBackgroundImageView atIndex:0];
    }
    
    [self updateBackgroundColorWithForce:0.0f];
}

#pragma mark - Updates
- (void)resetForceProperties {
    
    [self updateBackgroundColorWithForce:0.0f];
    [self updateSizeWithForce:0.0f];
    [self updateImageWithForce:0.0f];
    [self updateBackgroundImageWithForce:0.0f];
}

- (void)updateForcePropertiesWithTouches:(NSSet<UITouch *> *)touches {

    CGFloat force;
    if([[self class] is3DTouchCapable]) {
        UITouch const *touch = [touches anyObject];
        force                = touch.force / touch.maximumPossibleForce;
    } else {
        force = 1.0f;
    }
    
    [self updateBackgroundColorWithForce:force];
    [self updateSizeWithForce:force];
    [self updateImageWithForce:force];
    [self updateBackgroundImageWithForce:force];
}

- (void)updateBackgroundColorWithForce:(const CGFloat)force {
    
    if(![self canUpdateBackgroundColorWithStateDictionary:self.stateDictionary]) {
        return;
    }
    
    const UIControlState normalState    = [self normalState];
    const UIControlState highlightState = [self highlightState];
    UIColor const *normalColor          = [[self class] backgroundColorForState:normalState stateDictionary:self.stateDictionary];
    UIColor const *highlightColor       = [[self class] backgroundColorForState:highlightState stateDictionary:self.stateDictionary];

    self.backgroundColor = [[self class] backgroundColorWithForce:force normalColor:normalColor highlightColor:highlightColor];
}

- (void)updateSizeWithForce:(const CGFloat)force {

    if(![self canUpdateSizeWithStateDictionary:self.stateDictionary]) {
        return;
    }
    
    const UIControlState normalState    = [self normalState];
    const UIControlState highlightState = [self highlightState];
    const CGRect normalFrame            = [[self class] frameForState:normalState stateDictionary:self.stateDictionary];
    const CGRect highlightFrame         = [[self class] frameForState:highlightState stateDictionary:self.stateDictionary];
    
    self.bounds = [[self class] frameWithForce:force highlightSize:highlightFrame.size normalFrame:normalFrame contentMode:self.contentMode];;
}

- (void)updateImageWithForce:(const CGFloat)force {
    
    if(![self canUpdateImage]) {
        return;
    }
    
    const UIControlState normalState    = [self normalState];
    const UIControlState highlightState = [self highlightState];
    UIImage const *normalImage          = [self imageForState:normalState];
    UIImage const *highlightImage       = [self imageForState:highlightState];
    
    self.responsiveImageView.alpha = 0.0f;

}

- (void)updateBackgroundImageWithForce:(const CGFloat)force {
    
    if(![self canUpdateBackgroundImage]) {
        return;
    }
    
    const UIControlState normalState    = [self normalState];
    const UIControlState highlightState = [self highlightState];
    UIImage const *normalImage          = [self backgroundImageForState:normalState];
    UIImage const *highlightImage       = [self backgroundImageForState:highlightState];
    
    self.responsiveBackgroundImageView.alpha = 0.0f;
}

#pragma mark - Utilities
- (const UIControlState)normalState {
    
    return self.selected ? UIControlStateHighlighted : UIControlStateNormal;
}

- (const UIControlState)highlightState {
    
    return self.selected ? UIControlStateNormal : UIControlStateHighlighted;
}

+ (BOOL)is3DTouchCapable {
    
    return [UITraitCollection traitCollectionWithForceTouchCapability:UIForceTouchCapabilityAvailable];
}

@end