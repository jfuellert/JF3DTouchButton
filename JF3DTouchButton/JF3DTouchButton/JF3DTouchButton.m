//
//  JF3DTouchButton.m
//  JF3DTouchButton
//
//  Created by Jeremy Fuellert on 2015-11-20.
//  Copyright © 2015 Jeremy Fuellert. All rights reserved.
//

#import "__JF3DTouchButton+BackgroundColor.h"
#import "__JF3DTouchButton+Size.h"

@interface JF3DTouchButton ()

@property (nonatomic, strong) NSMutableDictionary *stateDictionary;

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
    }
    
    return self;
}

- (NSMutableDictionary *)stateDictionary {
 
    if(!_stateDictionary) {
        _stateDictionary = [[NSMutableDictionary alloc] init];
    }
    
    return _stateDictionary;
}

#pragma mark - Touches
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    [self updateBackgroundColorWithForce:0.0f];
    [self updateSizeWithForce:0.0f];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
    
    [self updateForcePropertiesWithTouches:touches];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
 
    [self updateBackgroundColorWithForce:0.0f];
    [self updateSizeWithForce:0.0f];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    
    [self updateBackgroundColorWithForce:0.0f];
    [self updateSizeWithForce:0.0f];
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

#pragma mark - Updates
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
}

- (void)updateBackgroundColorWithForce:(const CGFloat)force {
    
    if(![self canUpdateBackgroundColor]) {
        return;
    }
    
    const UIControlState normalState    = [self normalState];
    const UIControlState highlightState = [self highlightState];
    UIColor const *normalColor          = [[self class] backgroundColorForState:normalState stateDictionary:self.stateDictionary];
    UIColor const *highlightColor       = [[self class] backgroundColorForState:highlightState stateDictionary:self.stateDictionary];

    self.backgroundColor = [[self class] backgroundColorWithForce:force normalColor:normalColor highlightColor:highlightColor];
}

- (void)updateSizeWithForce:(const CGFloat)force {

    if(![self canUpdateSize]) {
        return;
    }
    
    const UIControlState normalState    = [self normalState];
    const UIControlState highlightState = [self highlightState];
    const CGRect normalFrame            = [[self class] frameForState:normalState stateDictionary:self.stateDictionary];
    const CGRect highlightFrame         = [[self class] frameForState:highlightState stateDictionary:self.stateDictionary];
    
    self.bounds = [[self class] frameWithForce:force highlightSize:highlightFrame.size normalFrame:normalFrame contentMode:self.contentMode];;
}

- (BOOL)canUpdateBackgroundColor {
    
    return self.responsiveBackgroundColor && [[self class] canUpdateBackgroundColorWithStateDictionary:self.stateDictionary];
}

- (BOOL)canUpdateSize {
    
    return self.responsiveSize && [[self class] canUpdateSizeWithStateDictionary:self.stateDictionary];
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