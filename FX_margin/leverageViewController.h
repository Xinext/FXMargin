//
//  leverageViewController.h
//  FX_margin
//
//  Created by Fujisawa Hiroaki on 2013/07/29.
//  Copyright (c) 2013年 Fujisawa Hiroaki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UILabelUnit.h"
#import "UILabelMoney.h"
#import "UIButtonAnswer.h"

@protocol leverageViewControllerDelegate
	- (void)leverageViewController_ModalClose:(NSString*)strValue;
@end

@interface leverageViewController : UIViewController
{
	UILabelUnit*		m_lblTitle;
	UILabelMoney*		m_lblText;
	UILabelUnit*		m_lblUnit;
	
	UIButtonAnswer*		m_btn1P;
	UIButtonAnswer*		m_btn25P;
	UIButtonAnswer*		m_btn200P;
	UIButtonAnswer*		m_btn400P;
	
	UIButtonAnswer*		m_btn0;
	UIButtonAnswer*		m_btn1;
	UIButtonAnswer*		m_btn2;
	UIButtonAnswer*		m_btn3;
	UIButtonAnswer*		m_btn4;
	UIButtonAnswer*		m_btn5;
	UIButtonAnswer*		m_btn6;
	UIButtonAnswer*		m_btn7;
	UIButtonAnswer*		m_btn8;
	UIButtonAnswer*		m_btn9;
	UIButtonAnswer*		m_btnC;
	
	UIButtonAnswer*		m_btnOK;
	
	NSInteger			m_dispValue;

	id delegate;
}

- (id)initWithValue:(NSString *)value;

// Action method for UI event.
- (void) actPush1PBtn:(id)inSender;
- (void) actPush25PBtn:(id)inSender;
- (void) actPush200PBtn:(id)inSender;
- (void) actPush400PBtn:(id)inSender;

- (void) actPush0Btn:(id)inSender;
- (void) actPush1Btn:(id)inSender;
- (void) actPush2Btn:(id)inSender;
- (void) actPush3Btn:(id)inSender;
- (void) actPush4Btn:(id)inSender;
- (void) actPush5Btn:(id)inSender;
- (void) actPush6Btn:(id)inSender;
- (void) actPush7Btn:(id)inSender;
- (void) actPush8Btn:(id)inSender;
- (void) actPush9Btn:(id)inSender;
- (void) actPushCBtn:(id)inSender;

- (void) actPushOKBtn:(id)inSender;

@property (nonatomic, retain) id delegate;

@end
