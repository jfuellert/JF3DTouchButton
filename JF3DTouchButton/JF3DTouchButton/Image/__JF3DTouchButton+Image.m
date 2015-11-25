//
//  __JF3DTouchButton+Image.m
//  JF3DTouchButton
//
//  Created by Jeremy Fuellert on 2015-11-24.
//  Copyright © 2015 Jeremy Fuellert. All rights reserved.
//

#import "__JF3DTouchButton+Image.h"

@implementation JF3DTouchButton (Image)

- (BOOL)canUpdateImage {

    return self.responsiveImage && [self imageForState:UIControlStateNormal] && [self imageForState:UIControlStateHighlighted];
}

@end