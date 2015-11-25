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

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
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
    [self.touchButton setBackgroundColor:colorNormal forState:UIControlStateSelected];
    [self.touchButton setBackgroundColor:colorNormal forState:UIControlStateDisabled];
    [self.touchButton setBackgroundColor:colorNormal forState:UIControlStateApplication];
    [self.touchButton setBackgroundColor:colorNormal forState:UIControlStateReserved];
#ifndef SDK_HIDE_TIDE
    [self.touchButton setBackgroundColor:colorNormal forState:UIControlStateFocused];
#endif

    XCTAssert([[self.touchButton backgroundColorForState:UIControlStateNormal]isEqual:colorNormal]);
    XCTAssert([[self.touchButton backgroundColorForState:UIControlStateHighlighted] isEqual:colorHighlight]);
    XCTAssert(![self.touchButton backgroundColorForState:UIControlStateSelected]);
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

@end