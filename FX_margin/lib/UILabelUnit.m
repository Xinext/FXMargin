//
//  UILabelUnit.m
//  FX_margin
//
//  Created by Fujisawa Hiroaki on 2013/07/26.
//  Copyright (c) 2013年 Fujisawa Hiroaki. All rights reserved.
//

#import "UILabelUnit.h"

@implementation UILabelUnit

- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		// Initialization code
		self.backgroundColor = [UIColor clearColor];
		self.textColor = [UIColor whiteColor];
		self.textAlignment = NSTextAlignmentLeft;
		self.font = [UIFont fontWithName:@"Helvetica-Bold" size:frame.size.height * 0.5];
		self.adjustsFontSizeToFitWidth = YES;
		self.minimumScaleFactor = 0.1f;
	}
	return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
	// Drawing code
}
*/

@end
