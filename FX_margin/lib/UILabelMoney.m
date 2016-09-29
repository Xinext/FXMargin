//
//  UILabelMoney.m
//  FX_margin
//
//  Created by Fujisawa Hiroaki on 2013/07/25.
//  Copyright (c) 2013年 Fujisawa Hiroaki. All rights reserved.
//

#import "UILabelMoney.h"
#import <QuartzCore/QuartzCore.h>

@implementation UILabelMoney

- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		// Initialization code
		self.backgroundColor = [UIColor whiteColor];
		self.textColor = [UIColor blackColor];
		self.textAlignment = NSTextAlignmentRight;
		self.font = [UIFont fontWithName:@"Helvetica" size:frame.size.height * 0.8];
		self.adjustsFontSizeToFitWidth = YES;
		self.minimumScaleFactor = 0.1f;
		
		[self.layer setBorderColor:[UIColor lightGrayColor].CGColor];
		[self.layer setBorderWidth:2.0f];
		
		[self.layer setCornerRadius:5];
		[self setClipsToBounds:YES];
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

- (void)drawTextInRect:(CGRect)rect
{
	UIEdgeInsets insets = {0, 10, 0, 10};
	return [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
}

@end
