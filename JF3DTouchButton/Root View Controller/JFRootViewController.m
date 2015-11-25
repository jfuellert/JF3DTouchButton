//
//  JFRootViewController.m
//  JFParallaxView
//
//  Created by Jeremy Fuellert on 2015-08-07.
//  Copyright (c) 2015 Jeremy Fuellert. All rights reserved.
//

#import "JFRootViewController.h"
#import "JF3DTouchButton.h"

@interface JFRootViewController ()

@property (nonatomic, strong) JF3DTouchButton *touchButtonBackgroundColor;
@property (nonatomic, strong) JF3DTouchButton *touchButtonSize;
@property (nonatomic, strong) JF3DTouchButton *touchButtonImage;
@property (nonatomic, strong) JF3DTouchButton *touchButtonBackgroundImage;
@property (nonatomic, strong) JF3DTouchButton *touchButtonAll;

@end

@implementation JFRootViewController

#pragma mark - Init
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationBarHidden  = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.touchButtonBackgroundColor];
    [self.view addSubview:self.touchButtonSize];
    [self.view addSubview:self.touchButtonImage];
    [self.view addSubview:self.touchButtonBackgroundImage];
    [self.view addSubview:self.touchButtonAll];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.touchButtonBackgroundColor.center = CGPointMake(self.view.center.x, 80.0f);
    self.touchButtonSize.center            = CGPointMake(self.view.center.x, self.touchButtonBackgroundColor.center.y + 100.0f);
    self.touchButtonImage.center           = CGPointMake(self.view.center.x, self.touchButtonSize.center.y + 100.0f);
    self.touchButtonBackgroundImage.center = CGPointMake(self.view.center.x, self.touchButtonImage.center.y + 100.0f);
    self.touchButtonAll.center             = CGPointMake(self.view.center.x, self.touchButtonBackgroundImage.center.y + 100.0f);
}

- (JF3DTouchButton *)touchButtonBackgroundColor {
    
    if(!_touchButtonBackgroundColor) {
        _touchButtonBackgroundColor = [self button];
        [_touchButtonBackgroundColor setBackgroundColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [_touchButtonBackgroundColor setBackgroundColor:[UIColor redColor] forState:UIControlStateHighlighted];
    }
    
    return _touchButtonBackgroundColor;
}

- (JF3DTouchButton *)touchButtonSize {
    
    if(!_touchButtonSize) {
        _touchButtonSize                 = [self button];
        _touchButtonSize.backgroundColor = [UIColor lightGrayColor];
        [_touchButtonSize setSize:CGSizeMake(110.0f, 80.0f) forState:UIControlStateNormal];
        [_touchButtonSize setSize:CGSizeMake(260.0f, 60.0f) forState:UIControlStateHighlighted];
    }
    
    return _touchButtonSize;
}

- (JF3DTouchButton *)touchButtonImage {
    
    if(!_touchButtonImage) {
        _touchButtonImage                 = [self button];
        _touchButtonImage.backgroundColor = [UIColor lightGrayColor];
        [_touchButtonImage setImage:[UIImage imageNamed:@"placeholderNormal"] forState:UIControlStateNormal];
        [_touchButtonImage setImage:[UIImage imageNamed:@"placeholderHighlight"] forState:UIControlStateHighlighted];
    }
    
    return _touchButtonImage;
}

- (JF3DTouchButton *)touchButtonBackgroundImage {
    
    if(!_touchButtonBackgroundImage) {
        _touchButtonBackgroundImage                 = [self button];
        _touchButtonBackgroundImage.backgroundColor = [UIColor lightGrayColor];
        [_touchButtonBackgroundImage setBackgroundImage:[UIImage imageNamed:@"placeholderNormal"] forState:UIControlStateNormal];
        [_touchButtonBackgroundImage setBackgroundImage:[UIImage imageNamed:@"placeholderHighlight"] forState:UIControlStateHighlighted];
    }
    
    return _touchButtonBackgroundImage;
}

- (JF3DTouchButton *)touchButtonAll {
    
    if(!_touchButtonAll) {
        _touchButtonAll                  = [[JF3DTouchButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 50.0f, 50.0f)];
        _touchButtonAll.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        [_touchButtonAll setBackgroundColor:[UIColor colorWithWhite:0.5f alpha:1.0f] forState:UIControlStateNormal];
        [_touchButtonAll setBackgroundColor:[UIColor colorWithWhite:0.0f alpha:0.6f] forState:UIControlStateHighlighted];
        [_touchButtonAll setSize:CGSizeMake(100.0f, 100.0f) forState:UIControlStateNormal];
        [_touchButtonAll setSize:CGSizeMake(80.0f, 80.0f) forState:UIControlStateHighlighted];
        [_touchButtonAll setImage:[UIImage imageNamed:@"placeholderNormal"] forState:UIControlStateNormal];
        [_touchButtonAll setImage:[UIImage imageNamed:@"placeholderHighlight"] forState:UIControlStateHighlighted];
    }
    
    return _touchButtonAll;
}

- (JF3DTouchButton *)button {
    
    JF3DTouchButton *button = [[JF3DTouchButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 150.0f, 80.0f)];
    button.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
//    [button setTitle:NSLocalizedString(@"Deselected", nil)forState:UIControlStateNormal];
//    [button setTitle:NSLocalizedString(@"Selected", nil)forState:UIControlStateSelected];
//    [button addTarget:self action:@selector(onButtonSelection:) forControlEvents:UIControlEventTouchUpInside];

    return button;
}

#pragma mark - Actions
- (void)onButtonSelection:(UIButton *)button {
    
    button.selected = !button.selected;
}

@end