//
//  termsOfServiceViewController.h
//  FX_margin
//
//  Created by Fujisawa Hiroaki on 2013/07/09.
//  Copyright (c) 2013年 Fujisawa Hiroaki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIButtonAnswer.h"

@interface termsOfServiceViewController : UIViewController
{
	UIView*				m_labelBack;
	UILabel*			m_labelTitle;
	UILabel*			m_labelText;
	UIButtonAnswer*		m_btnOK;
}

// Action method for UI event.
- (void) actPushOKBtn:(id)inSender;

@end
