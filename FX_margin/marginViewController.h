//
//  marginViewController.h
//  FX_margin
//
//  Created by Fujisawa Hiroaki on 2013/07/09.
//  Copyright (c) 2013年 Fujisawa Hiroaki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>
#import "UILabelTitle.h"
#import "UILabelMoney.h"
#import "UILabelUnit.h"
#import "rateViewController.h"
#import "leverageViewController.h"
#import "lotViewController.h"

@interface marginViewController : UIViewController <ADBannerViewDelegate, rateViewControllerDelegate, leverageViewControllerDelegate, lotViewControllerDelegate>
{
	// *** AD ***
	ADBannerView*	m_adView;
	BOOL			bannerIsVisible;
	
	// Dialog
	rateViewController*		m_rateViewController;
	leverageViewController*	m_leverageViewController;
	lotViewController*		m_lotViewController;
	
	// *** Top label ***
	UILabel*		m_lblTop;
	
	// *** Rate label ***
	UILabelTitle*	m_lblRateTitle;
	UILabelMoney*	m_lblRateText;
	UILabelUnit*	m_lblRateUnit;

	// *** Leverage label ***
	UILabelTitle*	m_lblLeverageTitle;
	UILabelMoney*	m_lblLeverageText;
	UILabelUnit*	m_lblLeverageUnit;
	
	// *** Lot label ***
	UILabelTitle*	m_lblLotsTitle;
	UILabelMoney*	m_lblLotsText;
	UILabelUnit*	m_lblLotsUnit;

	// *** Margin label ***
	UILabelTitle*	m_lblMarginTitle;
	UILabelMoney*	m_lblMarginText;
	UILabelUnit*	m_lblMarginUnit;

	// *** Margin 10pips label ***
	UILabelTitle*	m_lblMargin10Title;
	UILabelMoney*	m_lblMargin10Text;
	UILabelUnit*	m_lblMargin10Unit;

	// *** Margin 25pips label ***
	UILabelTitle*	m_lblMargin25Title;
	UILabelMoney*	m_lblMargin25Text;
	UILabelUnit*	m_lblMargin25Unit;
	
	// *** Margin 50pips label ***
	UILabelTitle*	m_lblMargin50Title;
	UILabelMoney*	m_lblMargin50Text;
	UILabelUnit*	m_lblMargin50Unit;

	// *** Margin 100pips label ***
	UILabelTitle*	m_lblMargin100Title;
	UILabelMoney*	m_lblMargin100Text;
	UILabelUnit*	m_lblMargin100Unit;
}

// Action method for UI event.
- (void) actPushRateTextBtn:(id)inSender;
- (void) actPushLeverageTextBtn:(id)inSender;
- (void) actPushLotsTextBtn:(id)inSender;

@end
