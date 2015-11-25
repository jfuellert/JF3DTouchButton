//
//  JF3DTouchButtonTests.m
//  JF3DTouchButtonTests
//
//  Created by Jeremy Fuellert on 2015-11-20.
//  Copyright © 2015 Jeremy Fuellert. All rights reserved.
//

#import "JF3DTouchButton.h"
#import <XCTest/XCTest.h>

@interface JF3DTouchButtonTests : XCTestCase

@property (nonatomic, strong) JF3DTouchButton *touchButton;

@end

@implementation JF3DTouchButtonTests

- (void)setUp {
    [super setUp];
    
    self.touchButton = [[JF3DTouchButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 150.0f, 80.0f)];
    XCTAssertNotNil(self.touchButton);
}

#pragma mark - Background color states
- (void)testBackgroundColorState {
    
    //Set class colors
    XCTAssertNoThrow([[JF3DTouchButton appearance] setBackgroundColor:[UIColor lightGrayColor] forState:UIControlStateNormal]);
    XCTAssertNoThrow([[JF3DTouchButton appearance] setBackgroundColor:[UIColor redColor] forState:UIControlStateHighlighted]);
    
    //No default colors
    XCTAssert(![self.touchButton backgroundColorForState:UIControlStateNormal]);
    XCTAssert(![self.touchButton backgroundColorForState:UIControlStateHighlighted]);
    XCTAssert(![self.touchButton backgroundColorForState:UIControlStateSelected]);
    XCTAssert(![self.touchButton backgroundColorForState:UIControlStateDisabled]);
    XCTAssert(![self.touchButton backgroundColorForState:UIControlStateApplication]);
    XCTAssert(![self.touchButton backgroundColorForState:UIControlStateReserved]);
#ifndef SDK_HIDE_TIDE
    XCTAssert(![self.touchButton backgroundColorForState:UIControlStateFocused]);
#endif
    
    //Set colors
    UIColor *colorNormal    = [UIColor whiteColor];
    UIColor *colorHighlight = [UIColor redColor];
    [self.touchButton setBackgroundColor:colorNormal forState:UIControlStateNormal];
    [self.touchButton setBackgroundColor:colorHighlight forState:UIControlStateHighlighted];
    [self.touchButton setBackgroundColor:colorHighlight forState:UIControlStateSelected];
    [self.touchButton setBackgroundColor:colorNormal forState:UIControlStateDisabled];
    [self.touchButton setBackgroundColor:colorNormal forState:UIControlStateApplication];
    [self.touchButton setBackgroundColor:colorNormal forState:UIControlStateReserved];
#ifndef SDK_HIDE_TIDE
    [self.touchButton setBackgroundColor:colorNormal forState:UIControlStateFocused];
#endif

    XCTAssert([[self.touchButton backgroundColorForState:UIControlStateNormal] isEqual:colorNormal]);
    XCTAssert([[self.touchButton backgroundColorForState:UIControlStateHighlighted] isEqual:colorHighlight]);
    XCTAssert([[self.touchButton backgroundColorForState:UIControlStateSelected] isEqual:colorHighlight]);
    XCTAssert(![self.touchButton backgroundColorForState:UIControlStateDisabled]);
    XCTAssert(![self.touchButton backgroundColorForState:UIControlStateApplication]);
    XCTAssert(![self.touchButton backgroundColorForState:UIControlStateReserved]);
#ifndef SDK_HIDE_TIDE
    XCTAssert(![self.touchButton backgroundColorForState:UIControlStateFocused]);
#endif
    
    //Remove colors
    [self.touchButton setBackgroundColor:nil forState:UIControlStateNormal];
    [self.touchButton setBackgroundColor:nil forState:UIControlStateHighlighted];
    [self.touchButton setBackgroundColor:nil forState:UIControlStateSelected];
    [self.touchButton setBackgroundColor:nil forState:UIControlStateDisabled];
    [self.touchButton setBackgroundColor:nil forState:UIControlStateApplication];
    [self.touchButton setBackgroundColor:nil forState:UIControlStateReserved];
#ifndef SDK_HIDE_TIDE
    [self.touchButton setBackgroundColor:nil forState:UIControlStateFocused];
#endif
    
    XCTAssert(![self.touchButton backgroundColorForState:UIControlStateNormal]);
    XCTAssert(![self.touchButton backgroundColorForState:UIControlStateHighlighted]);
    XCTAssert(![self.touchButton backgroundColorForState:UIControlStateSelected]);
    XCTAssert(![self.touchButton backgroundColorForState:UIControlStateDisabled]);
    XCTAssert(![self.touchButton backgroundColorForState:UIControlStateApplication]);
    XCTAssert(![self.touchButton backgroundColorForState:UIControlStateReserved]);
#ifndef SDK_HIDE_TIDE
    XCTAssert(![self.touchButton backgroundColorForState:UIControlStateFocused]);
#endif
}

#pragma mark - Size states
- (void)testSizeState {

    //Set class sizes
    XCTAssertNoThrow([[JF3DTouchButton appearance] setSize:CGSizeMake(100.0f, 80.0f) forState:UIControlStateNormal]);
    XCTAssertNoThrow([[JF3DTouchButton appearance] setSize:CGSizeMake(200.0f, 20.0f) forState:UIControlStateHighlighted]);
    
    //No default sizes
    XCTAssertTrue(CGSizeEqualToSize([self.touchButton sizeForState:UIControlStateNormal], self.touchButton.frame.size));
    XCTAssertTrue(CGSizeEqualToSize([self.touchButton sizeForState:UIControlStateHighlighted], self.touchButton.frame.size));
    XCTAssertTrue(CGSizeEqualToSize([self.touchButton sizeForState:UIControlStateSelected], self.touchButton.frame.size));
    XCTAssertTrue(CGSizeEqualToSize([self.touchButton sizeForState:UIControlStateDisabled], self.touchButton.frame.size));
    XCTAssertTrue(CGSizeEqualToSize([self.touchButton sizeForState:UIControlStateApplication], self.touchButton.frame.size));
    XCTAssertTrue(CGSizeEqualToSize([self.touchButton sizeForState:UIControlStateReserved], self.touchButton.frame.size));
#ifndef SDK_HIDE_TIDE
    XCTAssertTrue(CGSizeEqualToSize([self.touchButton sizeForState:UIControlStateFocused], self.touchButton.frame.size));
#endif

    //Set sizes
    CGSize sizeNormal = CGSizeMake(100.0f, 80.0f);
    CGSize sizeHighlight = CGSizeMake(200.0f, 20.0f);
    
    [self.touchButton setSize:sizeNormal forState:UIControlStateNormal];
    [self.touchButton setSize:sizeHighlight forState:UIControlStateHighlighted];
    [self.touchButton setSize:sizeHighlight forState:UIControlStateSelected];
    [self.touchButton setSize:sizeNormal forState:UIControlStateDisabled];
    [self.touchButton setSize:sizeNormal forState:UIControlStateApplication];
    [self.touchButton setSize:sizeNormal forState:UIControlStateReserved];
#ifndef SDK_HIDE_TIDE
    [self.touchButton setSize:sizeNormal forState:UIControlStateFocused];
#endif
    
    XCTAssertTrue(CGSizeEqualToSize([self.touchButton sizeForState:UIControlStateNormal], sizeNormal));
    XCTAssertTrue(CGSizeEqualToSize([self.touchButton sizeForState:UIControlStateHighlighted], sizeHighlight));
    XCTAssertTrue(CGSizeEqualToSize([self.touchButton sizeForState:UIControlStateSelected], sizeHighlight));
    XCTAssertTrue(CGSizeEqualToSize([self.touchButton sizeForState:UIControlStateDisabled], self.touchButton.frame.size));
    XCTAssertTrue(CGSizeEqualToSize([self.touchButton sizeForState:UIControlStateApplication], self.touchButton.frame.size));
    XCTAssertTrue(CGSizeEqualToSize([self.touchButton sizeForState:UIControlStateReserved], self.touchButton.frame.size));
#ifndef SDK_HIDE_TIDE
    XCTAssertTrue(CGSizeEqualToSize([self.touchButton sizeForState:UIControlStateFocused], self.touchButton.frame.size));
#endif
    
    //Remove sizes
    [self.touchButton setSize:CGSizeNull forState:UIControlStateNormal];
    [self.touchButton setSize:CGSizeNull forState:UIControlStateHighlighted];
    [self.touchButton setSize:CGSizeNull forState:UIControlStateSelected];
    [self.touchButton setSize:CGSizeNull forState:UIControlStateDisabled];
    [self.touchButton setSize:CGSizeNull forState:UIControlStateApplication];
    [self.touchButton setSize:CGSizeNull forState:UIControlStateReserved];
#ifndef SDK_HIDE_TIDE
    [self.touchButton setSize:CGSizeNull forState:UIControlStateFocused];
#endif

    XCTAssertTrue(CGSizeEqualToSize([self.touchButton sizeForState:UIControlStateNormal], self.touchButton.frame.size));
    XCTAssertTrue(CGSizeEqualToSize([self.touchButton sizeForState:UIControlStateHighlighted], self.touchButton.frame.size));
    XCTAssertTrue(CGSizeEqualToSize([self.touchButton sizeForState:UIControlStateSelected], self.touchButton.frame.size));
    XCTAssertTrue(CGSizeEqualToSize([self.touchButton sizeForState:UIControlStateDisabled], self.touchButton.frame.size));
    XCTAssertTrue(CGSizeEqualToSize([self.touchButton sizeForState:UIControlStateApplication], self.touchButton.frame.size));
    XCTAssertTrue(CGSizeEqualToSize([self.touchButton sizeForState:UIControlStateReserved], self.touchButton.frame.size));
#ifndef SDK_HIDE_TIDE
    XCTAssertTrue(CGSizeEqualToSize([self.touchButton sizeForState:UIControlStateFocused], self.touchButton.frame.size));
#endif
}

#pragma mark - Image states
- (void)testImageState {
    
    //Set class images
    XCTAssertNoThrow([[JF3DTouchButton appearance] setImage:[UIImage imageNamed:@"placeholderNormal"] forState:UIControlStateNormal]);
    XCTAssertNoThrow([[JF3DTouchButton appearance] setImage:[UIImage imageNamed:@"placeholderHighlight"] forState:UIControlStateHighlighted]);
    
    //No default images
    XCTAssertNil([self.touchButton imageForState:UIControlStateNormal]);
    XCTAssertNil([self.touchButton imageForState:UIControlStateHighlighted]);
    XCTAssertNil([self.touchButton imageForState:UIControlStateSelected]);
    XCTAssertNil([self.touchButton imageForState:UIControlStateDisabled]);
    XCTAssertNil([self.touchButton imageForState:UIControlStateApplication]);
    XCTAssertNil([self.touchButton imageForState:UIControlStateReserved]);
#ifndef SDK_HIDE_TIDE
    XCTAssertNil([self.touchButton imageForState:UIControlStateFocused]);
#endif
    
    //Set images
    UIImage *imageNormal    = [UIImage imageNamed:@"placeholderNormal"];
    UIImage *imageHighlight = [UIImage imageNamed:@"placeholderHighlight"];
    [self.touchButton setImage:imageNormal forState:UIControlStateNormal];
    [self.touchButton setImage:imageHighlight forState:UIControlStateHighlighted];
    [self.touchButton setImage:imageHighlight forState:UIControlStateSelected];
    [self.touchButton setImage:imageNormal forState:UIControlStateDisabled];
    [self.touchButton setImage:imageNormal forState:UIControlStateApplication];
    [self.touchButton setImage:imageNormal forState:UIControlStateReserved];
#ifndef SDK_HIDE_TIDE
    [self.touchButton setImage:imageNormal forState:UIControlStateFocused];
#endif
    
    XCTAssert([[self.touchButton imageForState:UIControlStateNormal] isEqual:imageNormal]);
    XCTAssert([[self.touchButton imageForState:UIControlStateHighlighted] isEqual:imageHighlight]);
    XCTAssert([[self.touchButton imageForState:UIControlStateSelected] isEqual:imageHighlight]);
    XCTAssert([[self.touchButton imageForState:UIControlStateDisabled] isEqual:imageNormal]);
    XCTAssert([[self.touchButton imageForState:UIControlStateApplication] isEqual:imageNormal]);
    XCTAssert([[self.touchButton imageForState:UIControlStateReserved] isEqual:imageNormal]);
#ifndef SDK_HIDE_TIDE
    XCTAssert([[self.touchButton imageForState:UIControlStateFocused] isEqual:imageNormal]);
#endif
    
    //Remove images
    [self.touchButton setImage:nil forState:UIControlStateNormal];
    [self.touchButton setImage:nil forState:UIControlStateHighlighted];
    [self.touchButton setImage:nil forState:UIControlStateSelected];
    [self.touchButton setImage:nil forState:UIControlStateDisabled];
    [self.touchButton setImage:nil forState:UIControlStateApplication];
    [self.touchButton setImage:nil forState:UIControlStateReserved];
#ifndef SDK_HIDE_TIDE
    [self.touchButton setImage:nil forState:UIControlStateFocused];
#endif
    
    XCTAssert(![self.touchButton imageForState:UIControlStateNormal]);
    XCTAssert(![self.touchButton imageForState:UIControlStateHighlighted]);
    XCTAssert(![self.touchButton imageForState:UIControlStateSelected]);
    XCTAssert(![self.touchButton imageForState:UIControlStateDisabled]);
    XCTAssert(![self.touchButton imageForState:UIControlStateApplication]);
    XCTAssert(![self.touchButton imageForState:UIControlStateReserved]);
#ifndef SDK_HIDE_TIDE
    XCTAssert(![self.touchButton imageForState:UIControlStateFocused]);
#endif
}

#pragma mark - Background image state
- (void)testBackgroundImageState {
    
    //Set class background images
    XCTAssertNoThrow([[JF3DTouchButton appearance] setBackgroundImage:[UIImage imageNamed:@"placeholderNormal"] forState:UIControlStateNormal]);
    XCTAssertNoThrow([[JF3DTouchButton appearance] setBackgroundImage:[UIImage imageNamed:@"placeholderHighlight"] forState:UIControlStateHighlighted]);
    
    //No default images
    XCTAssertNil([self.touchButton backgroundImageForState:UIControlStateNormal]);
    XCTAssertNil([self.touchButton backgroundImageForState:UIControlStateHighlighted]);
    XCTAssertNil([self.touchButton backgroundImageForState:UIControlStateSelected]);
    XCTAssertNil([self.touchButton backgroundImageForState:UIControlStateDisabled]);
    XCTAssertNil([self.touchButton backgroundImageForState:UIControlStateApplication]);
    XCTAssertNil([self.touchButton backgroundImageForState:UIControlStateReserved]);
#ifndef SDK_HIDE_TIDE
    XCTAssertNil([self.touchButton backgroundImageForState:UIControlStateFocused]);
#endif
    
    //Set images
    UIImage *imageNormal    = [UIImage imageNamed:@"placeholderNormal"];
    UIImage *imageHighlight = [UIImage imageNamed:@"placeholderHighlight"];
    [self.touchButton setBackgroundImage:imageNormal forState:UIControlStateNormal];
    [self.touchButton setBackgroundImage:imageHighlight forState:UIControlStateHighlighted];
    [self.touchButton setBackgroundImage:imageHighlight forState:UIControlStateSelected];
    [self.touchButton setBackgroundImage:imageNormal forState:UIControlStateDisabled];
    [self.touchButton setBackgroundImage:imageNormal forState:UIControlStateApplication];
    [self.touchButton setBackgroundImage:imageNormal forState:UIControlStateReserved];
#ifndef SDK_HIDE_TIDE
    [self.touchButton setBackgroundImage:imageNormal forState:UIControlStateFocused];
#endif
    
    XCTAssert([[self.touchButton backgroundImageForState:UIControlStateNormal] isEqual:imageNormal]);
    XCTAssert([[self.touchButton backgroundImageForState:UIControlStateHighlighted] isEqual:imageHighlight]);
    XCTAssert([[self.touchButton backgroundImageForState:UIControlStateSelected] isEqual:imageHighlight]);
    XCTAssert(![self.touchButton backgroundImageForState:UIControlStateDisabled]);
    XCTAssert(![self.touchButton backgroundImageForState:UIControlStateApplication]);
    XCTAssert(![self.touchButton backgroundImageForState:UIControlStateReserved]);
#ifndef SDK_HIDE_TIDE
    XCTAssert(![self.touchButton backgroundImageForState:UIControlStateFocused]);
#endif
    
    //Remove images
    [self.touchButton setBackgroundImage:nil forState:UIControlStateNormal];
    [self.touchButton setBackgroundImage:nil forState:UIControlStateHighlighted];
    [self.touchButton setBackgroundImage:nil forState:UIControlStateSelected];
    [self.touchButton setBackgroundImage:nil forState:UIControlStateDisabled];
    [self.touchButton setBackgroundImage:nil forState:UIControlStateApplication];
    [self.touchButton setBackgroundImage:nil forState:UIControlStateReserved];
#ifndef SDK_HIDE_TIDE
    [self.touchButton setBackgroundImage:nil forState:UIControlStateFocused];
#endif
    
    XCTAssert(![self.touchButton backgroundImageForState:UIControlStateNormal]);
    XCTAssert(![self.touchButton backgroundImageForState:UIControlStateHighlighted]);
    XCTAssert(![self.touchButton backgroundImageForState:UIControlStateSelected]);
    XCTAssert(![self.touchButton backgroundImageForState:UIControlStateDisabled]);
    XCTAssert(![self.touchButton backgroundImageForState:UIControlStateApplication]);
    XCTAssert(![self.touchButton backgroundImageForState:UIControlStateReserved]);
#ifndef SDK_HIDE_TIDE
    XCTAssert(![self.touchButton backgroundImageForState:UIControlStateFocused]);
#endif
}

@end