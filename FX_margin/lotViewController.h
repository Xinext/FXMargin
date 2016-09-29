//
//  lotViewController.h
//  FX_margin
//
//  Created by Fujisawa Hiroaki on 2013/07/29.
//  Copyright (c) 2013年 Fujisawa Hiroaki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UILabelUnit.h"
#import "UILabelMoney.h"
#import "UIButtonAnswer.h"

@protocol lotViewControllerDelegate
- (void)lotViewController_ModalClose:(NSString*)strValue;
@end

@interface lotViewController : UIViewController
{
	UILabelUnit*		m_lblTitle;
	UILabelMoney*		m_lblText;
	UILabelUnit*		m_lblUnit;
	
	UIButtonAnswer*		m_btn01Lot;
	UIButtonAnswer*		m_btn1Lot;
	UIButtonAnswer*		m_btn10Lot;
	UIButtonAnswer*		m_btn100Lot;
	
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
	UIButtonAnswer*		m_btnDot;
	
	UIButtonAnswer*		m_btnOK;
	
	NSInteger			m_integerValue;
	NSString*			m_floatlValue;
	BOOL				m_decimalFlag;
	
	id delegate;
}

- (id)initWithValue:(NSString *)value;

// Action method for UI event.
- (void) actPush01LotBtn:(id)inSender;
- (void) actPush1LotBtn:(id)inSender;
- (void) actPush10LotBtn:(id)inSender;
- (void) actPush100LotBtn:(id)inSender;

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
- (void) actPushDotBtn:(id)inSender;

- (void) actPushOKBtn:(id)inSender;

@property (nonatomic, retain) id delegate;

@end
