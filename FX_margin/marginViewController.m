//
//  marginViewController.m
//  FX_margin
//
//  Created by Fujisawa Hiroaki on 2013/07/09.
//  Copyright (c) 2013年 Fujisawa Hiroaki. All rights reserved.
//

#import "marginViewController.h"


@interface marginViewController ()

@end

@implementation marginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
		// Custom initialization
		
	}
	return self;
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	// Do any additional setup after loading the view.
	
	[self initFirstDisplay];
	[self initiAD];
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

// *****************************************************************
//	@brief	Initialize iAD module.
//	@note
//		none
// *****************************************************************
- (void) initiAD
{
	m_adView = [[ADBannerView alloc] initWithAdType:ADAdTypeBanner];
	
	// 画面(ビュー)の下に表示する場合
	m_adView.frame = CGRectMake(0, self.view.frame.size.height - m_adView.frame.size.height, m_adView.frame.size.width, m_adView.frame.size.height);
	
	// adViewのフレーム矩形が変更された時にサブビューのサイズを自動的に変更
	m_adView.autoresizesSubviews = YES;
	
	// 横向き、縦向きに回転した際に、自動的に広告の横幅を調整し、画面上に固定
	// ※画面下に表示する場合は、コメントアウト。
	m_adView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin;
	
	// 横向き、縦向きに回転した際に、自動的に広告の横幅を調整し、画面下に固定
	// ※画面上に表示する場合は、コメントアウト。
	//adView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
	
	// 非表示にしておく
	m_adView.alpha = 0.0f;
	
	// ビューに追加
	[self.view addSubview:m_adView];
	
	// デリゲートをこの UIViewContoroller に渡す
	m_adView.delegate = self;
}

// *****************************************************************
//	@brief	The main display is initialized.
//	@note
//		This function is called only once by the viewDidLoad().
// *****************************************************************
- (void) initFirstDisplay
{
	CGRect	rectMainFrame = self.view.frame;
	
	const CGFloat	WIDTH_PITCH = rectMainFrame.size.width / 40;
	const CGFloat	HIGH_PITCH = rectMainFrame.size.height / 40;
	
	// Set background¥
	UIImage *backgroundImage = [UIImage imageNamed:@"back.png"];
	self.view.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];

	// Set Label top
	CGRect	rectLabelTop;
	rectLabelTop.origin.x = WIDTH_PITCH * 0;
	rectLabelTop.origin.y = HIGH_PITCH * 0;
	rectLabelTop.size.width = WIDTH_PITCH * 40;
	rectLabelTop.size.height = HIGH_PITCH * 2;
	m_lblTop = [[UILabel alloc] initWithFrame:rectLabelTop];
	m_lblTop.backgroundColor = [UIColor orangeColor];
	m_lblTop.textColor = [UIColor whiteColor];
	m_lblTop.textAlignment = NSTextAlignmentCenter;
	CGFloat fontSize = (rectLabelTop.size.width * 0.9) / 20;
	m_lblTop.font = [UIFont fontWithName:@"Helvetica-Bold" size:fontSize];
	m_lblTop.adjustsFontSizeToFitWidth = YES;
	m_lblTop.minimumScaleFactor = 0.0001f;
	m_lblTop.text = @"USD・EUR・GBP・AUD / JPY";
	[self.view addSubview:m_lblTop];

	/******************************************************************************************************************/
	// Set Label Rate Title
	CGRect	rectLabelRateTitle;
	rectLabelRateTitle.origin.x = WIDTH_PITCH * 1;
	rectLabelRateTitle.origin.y = HIGH_PITCH * 3;
	rectLabelRateTitle.size.width = WIDTH_PITCH * 15;
	rectLabelRateTitle.size.height = HIGH_PITCH * 3;
	m_lblRateTitle = [[UILabelTitle alloc] initWithFrame:rectLabelRateTitle];
	m_lblRateTitle.text = @"レート";
	[self.view addSubview:m_lblRateTitle];

	// Set Label Rate Text
	CGRect	rectLabelRateText;
	rectLabelRateText.origin.x = WIDTH_PITCH * 17;
	rectLabelRateText.origin.y = HIGH_PITCH * 3;
	rectLabelRateText.size.width = WIDTH_PITCH * 17;
	rectLabelRateText.size.height = HIGH_PITCH * 3;
	m_lblRateText = [[UILabelMoney alloc] initWithFrame:rectLabelRateText];
	m_lblRateText.text = @"0";
	[self.view addSubview:m_lblRateText];
	
	// Set Label Rate Text button
	UIButton* btnRateText = [[UIButton alloc] initWithFrame:rectLabelRateText];
	[btnRateText addTarget:self action:@selector(actPushRateTextBtn:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:btnRateText];

	// Set Label Rate Unit
	CGRect	rectLabelRateUnit;
	rectLabelRateUnit.origin.x = WIDTH_PITCH * 35;
	rectLabelRateUnit.origin.y = HIGH_PITCH * 3.5;
	rectLabelRateUnit.size.width = WIDTH_PITCH * 3;
	rectLabelRateUnit.size.height = HIGH_PITCH * 3;
	m_lblRateUnit = [[UILabelUnit alloc] initWithFrame:rectLabelRateUnit];
	m_lblRateUnit.text = @"円";
	[self.view addSubview:m_lblRateUnit];

	/******************************************************************************************************************/
	// Set Label Leverage Title
	CGRect	rectLabelLeverageTitle;
	rectLabelLeverageTitle.origin.x = WIDTH_PITCH * 1;
	rectLabelLeverageTitle.origin.y = HIGH_PITCH * 7;
	rectLabelLeverageTitle.size.width = WIDTH_PITCH * 15;
	rectLabelLeverageTitle.size.height = HIGH_PITCH * 3;
	m_lblLeverageTitle = [[UILabelTitle alloc] initWithFrame:rectLabelLeverageTitle];
	m_lblLeverageTitle.text = @"レバレッジ";
	[self.view addSubview:m_lblLeverageTitle];
	
	// Set Label Leverage Text
	CGRect	rectLabelLeverageText;
	rectLabelLeverageText.origin.x = WIDTH_PITCH * 17;
	rectLabelLeverageText.origin.y = HIGH_PITCH * 7;
	rectLabelLeverageText.size.width = WIDTH_PITCH * 17;
	rectLabelLeverageText.size.height = HIGH_PITCH * 3;
	m_lblLeverageText = [[UILabelMoney alloc] initWithFrame:rectLabelLeverageText];
	m_lblLeverageText.text = @"0";
	[self.view addSubview:m_lblLeverageText];

	// Set Label Leverage Text button
	UIButton* btnLeverageText = [[UIButton alloc] initWithFrame:rectLabelLeverageText];
	[btnLeverageText addTarget:self action:@selector(actPushLeverageTextBtn:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:btnLeverageText];
	
	// Set Label Leverage Unit
	CGRect	rectLabelLeverageUnit;
	rectLabelLeverageUnit.origin.x = WIDTH_PITCH * 35;
	rectLabelLeverageUnit.origin.y = HIGH_PITCH * 7.5;
	rectLabelLeverageUnit.size.width = WIDTH_PITCH * 3;
	rectLabelLeverageUnit.size.height = HIGH_PITCH * 3;
	m_lblLeverageUnit = [[UILabelUnit alloc] initWithFrame:rectLabelLeverageUnit];
	m_lblLeverageUnit.text = @"倍";
	[self.view addSubview:m_lblLeverageUnit];

	/******************************************************************************************************************/
	// Set Label Lots Title
	CGRect	rectLabelLotsTitle;
	rectLabelLotsTitle.origin.x = WIDTH_PITCH * 1;
	rectLabelLotsTitle.origin.y = HIGH_PITCH * 11;
	rectLabelLotsTitle.size.width = WIDTH_PITCH * 15;
	rectLabelLotsTitle.size.height = HIGH_PITCH * 3;
	m_lblLotsTitle = [[UILabelTitle alloc] initWithFrame:rectLabelLotsTitle];
	m_lblLotsTitle.text = @"建玉(１万通貨)";
	[self.view addSubview:m_lblLotsTitle];
	
	// Set Label Lots Text
	CGRect	rectLabelLotsText;
	rectLabelLotsText.origin.x = WIDTH_PITCH * 17;
	rectLabelLotsText.origin.y = HIGH_PITCH * 11;
	rectLabelLotsText.size.width = WIDTH_PITCH * 17;
	rectLabelLotsText.size.height = HIGH_PITCH * 3;
	m_lblLotsText = [[UILabelMoney alloc] initWithFrame:rectLabelLotsText];
	m_lblLotsText.text = @"0";
	[self.view addSubview:m_lblLotsText];

	// Set Label Lots Text button
	UIButton* btnLLotsText = [[UIButton alloc] initWithFrame:rectLabelLotsText];
	[btnLLotsText addTarget:self action:@selector(actPushLotsTextBtn:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:btnLLotsText];

	// Set Label Lots Unit
	CGRect	rectLabelLotsUnit;
	rectLabelLotsUnit.origin.x = WIDTH_PITCH * 35;
	rectLabelLotsUnit.origin.y = HIGH_PITCH * 11.5;
	rectLabelLotsUnit.size.width = WIDTH_PITCH * 3;
	rectLabelLotsUnit.size.height = HIGH_PITCH * 3;
	m_lblLotsUnit = [[UILabelUnit alloc] initWithFrame:rectLabelLotsUnit];
	m_lblLotsUnit.text = @"枚";
	[self.view addSubview:m_lblLotsUnit];
	
	/******************************************************************************************************************/
	// Set horizon line
	CGRect	rectLineHorizon;
	rectLineHorizon.origin.x = WIDTH_PITCH * 1;
	rectLineHorizon.origin.y = HIGH_PITCH * 15;
	rectLineHorizon.size.width = WIDTH_PITCH * 38;
	rectLineHorizon.size.height = HIGH_PITCH * 0.2;
	UIView* lineHorizon = [[UIView alloc] initWithFrame:rectLineHorizon];
	lineHorizon.backgroundColor = [UIColor whiteColor];
	[self.view addSubview:lineHorizon];

	/******************************************************************************************************************/
	// Set Label Margin Title
	CGRect	rectLabelMarginTitle;
	rectLabelMarginTitle.origin.x = WIDTH_PITCH * 1;
	rectLabelMarginTitle.origin.y = HIGH_PITCH * 16;
	rectLabelMarginTitle.size.width = WIDTH_PITCH * 15;
	rectLabelMarginTitle.size.height = HIGH_PITCH * 3;
	m_lblMarginTitle = [[UILabelTitle alloc] initWithFrame:rectLabelMarginTitle];
	m_lblMarginTitle.text = @"証拠金必要額";
	[self.view addSubview:m_lblMarginTitle];
	
	// Set Label Margin Text
	CGRect	rectLabelMarginText;
	rectLabelMarginText.origin.x = WIDTH_PITCH * 17;
	rectLabelMarginText.origin.y = HIGH_PITCH * 16;
	rectLabelMarginText.size.width = WIDTH_PITCH * 17;
	rectLabelMarginText.size.height = HIGH_PITCH * 3;
	m_lblMarginText = [[UILabelMoney alloc] initWithFrame:rectLabelMarginText];
	m_lblMarginText.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:0.5f alpha:1.0f];;
	m_lblMarginText.text = @"0";
	[self.view addSubview:m_lblMarginText];
	
	// Set Label Margin Unit
	CGRect	rectLabelMarginUnit;
	rectLabelMarginUnit.origin.x = WIDTH_PITCH * 35;
	rectLabelMarginUnit.origin.y = HIGH_PITCH * 16.5;
	rectLabelMarginUnit.size.width = WIDTH_PITCH * 3;
	rectLabelMarginUnit.size.height = HIGH_PITCH * 3;
	m_lblMarginUnit = [[UILabelUnit alloc] initWithFrame:rectLabelMarginUnit];
	m_lblMarginUnit.text = @"円";
	[self.view addSubview:m_lblMarginUnit];

	/******************************************************************************************************************/
	// Set Label Margin 10pips Title
	CGRect	rectLabelMargin10Title;
	rectLabelMargin10Title.origin.x = WIDTH_PITCH * 1;
	rectLabelMargin10Title.origin.y = HIGH_PITCH * 20;
	rectLabelMargin10Title.size.width = WIDTH_PITCH * 15;
	rectLabelMargin10Title.size.height = HIGH_PITCH * 3;
	m_lblMargin10Title = [[UILabelTitle alloc] initWithFrame:rectLabelMargin10Title];
	m_lblMargin10Title.text = @"-10pips";
	[self.view addSubview:m_lblMargin10Title];
	
	// Set Label Margin 10pips Text
	CGRect	rectLabelMargin10Text;
	rectLabelMargin10Text.origin.x = WIDTH_PITCH * 17;
	rectLabelMargin10Text.origin.y = HIGH_PITCH * 20;
	rectLabelMargin10Text.size.width = WIDTH_PITCH * 17;
	rectLabelMargin10Text.size.height = HIGH_PITCH * 3;
	m_lblMargin10Text = [[UILabelMoney alloc] initWithFrame:rectLabelMargin10Text];
	m_lblMargin10Text.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:0.5f alpha:1.0f];;
	m_lblMargin10Text.text = @"0";
	[self.view addSubview:m_lblMargin10Text];
	
	// Set Label Margin 10pips Unit
	CGRect	rectLabelMargin10Unit;
	rectLabelMargin10Unit.origin.x = WIDTH_PITCH * 35;
	rectLabelMargin10Unit.origin.y = HIGH_PITCH * 20.5;
	rectLabelMargin10Unit.size.width = WIDTH_PITCH * 3;
	rectLabelMargin10Unit.size.height = HIGH_PITCH * 3;
	m_lblMargin10Unit = [[UILabelUnit alloc] initWithFrame:rectLabelMargin10Unit];
	m_lblMargin10Unit.text = @"円";
	[self.view addSubview:m_lblMargin10Unit];

	/******************************************************************************************************************/
	// Set Label Margin 25pips Title
	CGRect	rectLabelMargin25Title;
	rectLabelMargin25Title.origin.x = WIDTH_PITCH * 1;
	rectLabelMargin25Title.origin.y = HIGH_PITCH * 24;
	rectLabelMargin25Title.size.width = WIDTH_PITCH * 15;
	rectLabelMargin25Title.size.height = HIGH_PITCH * 3;
	m_lblMargin25Title = [[UILabelTitle alloc] initWithFrame:rectLabelMargin25Title];
	m_lblMargin25Title.text = @"-25pips";
	[self.view addSubview:m_lblMargin25Title];
	
	// Set Label Margin 25pips Text
	CGRect	rectLabelMargin25Text;
	rectLabelMargin25Text.origin.x = WIDTH_PITCH * 17;
	rectLabelMargin25Text.origin.y = HIGH_PITCH * 24;
	rectLabelMargin25Text.size.width = WIDTH_PITCH * 17;
	rectLabelMargin25Text.size.height = HIGH_PITCH * 3;
	m_lblMargin25Text = [[UILabelMoney alloc] initWithFrame:rectLabelMargin25Text];
	m_lblMargin25Text.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:0.5f alpha:1.0f];;
	m_lblMargin25Text.text = @"0";
	[self.view addSubview:m_lblMargin25Text];
	
	// Set Label Margin 25pips Unit
	CGRect	rectLabelMargin25Unit;
	rectLabelMargin25Unit.origin.x = WIDTH_PITCH * 35;
	rectLabelMargin25Unit.origin.y = HIGH_PITCH * 24.5;
	rectLabelMargin25Unit.size.width = WIDTH_PITCH * 3;
	rectLabelMargin25Unit.size.height = HIGH_PITCH * 3;
	m_lblMargin25Unit = [[UILabelUnit alloc] initWithFrame:rectLabelMargin25Unit];
	m_lblMargin25Unit.text = @"円";
	[self.view addSubview:m_lblMargin25Unit];

	/******************************************************************************************************************/
	// Set Label Margin 50pips Title
	CGRect	rectLabelMargin50Title;
	rectLabelMargin50Title.origin.x = WIDTH_PITCH * 1;
	rectLabelMargin50Title.origin.y = HIGH_PITCH * 28;
	rectLabelMargin50Title.size.width = WIDTH_PITCH * 15;
	rectLabelMargin50Title.size.height = HIGH_PITCH * 3;
	m_lblMargin50Title = [[UILabelTitle alloc] initWithFrame:rectLabelMargin50Title];
	m_lblMargin50Title.text = @"-50pips";
	[self.view addSubview:m_lblMargin50Title];
	
	// Set Label Margin 50pips Text
	CGRect	rectLabelMargin50Text;
	rectLabelMargin50Text.origin.x = WIDTH_PITCH * 17;
	rectLabelMargin50Text.origin.y = HIGH_PITCH * 28;
	rectLabelMargin50Text.size.width = WIDTH_PITCH * 17;
	rectLabelMargin50Text.size.height = HIGH_PITCH * 3;
	m_lblMargin50Text = [[UILabelMoney alloc] initWithFrame:rectLabelMargin50Text];
	m_lblMargin50Text.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:0.5f alpha:1.0f];;
	m_lblMargin50Text.text = @"0";
	[self.view addSubview:m_lblMargin50Text];
	
	// Set Label Margin 50pips Unit
	CGRect	rectLabelMargin50Unit;
	rectLabelMargin50Unit.origin.x = WIDTH_PITCH * 35;
	rectLabelMargin50Unit.origin.y = HIGH_PITCH * 28.5;
	rectLabelMargin50Unit.size.width = WIDTH_PITCH * 3;
	rectLabelMargin50Unit.size.height = HIGH_PITCH * 3;
	m_lblMargin50Unit = [[UILabelUnit alloc] initWithFrame:rectLabelMargin50Unit];
	m_lblMargin50Unit.text = @"円";
	[self.view addSubview:m_lblMargin50Unit];

	/******************************************************************************************************************/
	// Set Label Margin 100pips Title
	CGRect	rectLabelMargin100Title;
	rectLabelMargin100Title.origin.x = WIDTH_PITCH * 1;
	rectLabelMargin100Title.origin.y = HIGH_PITCH * 32;
	rectLabelMargin100Title.size.width = WIDTH_PITCH * 15;
	rectLabelMargin100Title.size.height = HIGH_PITCH * 3;
	m_lblMargin100Title = [[UILabelTitle alloc] initWithFrame:rectLabelMargin100Title];
	m_lblMargin100Title.text = @"-100pips";
	[self.view addSubview:m_lblMargin100Title];
	
	// Set Label Margin 100pips Text
	CGRect	rectLabelMargin100Text;
	rectLabelMargin100Text.origin.x = WIDTH_PITCH * 17;
	rectLabelMargin100Text.origin.y = HIGH_PITCH * 32;
	rectLabelMargin100Text.size.width = WIDTH_PITCH * 17;
	rectLabelMargin100Text.size.height = HIGH_PITCH * 3;
	m_lblMargin100Text = [[UILabelMoney alloc] initWithFrame:rectLabelMargin100Text];
	m_lblMargin100Text.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:0.5f alpha:1.0f];;
	m_lblMargin100Text.text = @"0";
	[self.view addSubview:m_lblMargin100Text];
	
	// Set Label Margin 100pips Unit
	CGRect	rectLabelMargin100Unit;
	rectLabelMargin100Unit.origin.x = WIDTH_PITCH * 35;
	rectLabelMargin100Unit.origin.y = HIGH_PITCH * 32.5;
	rectLabelMargin100Unit.size.width = WIDTH_PITCH * 3;
	rectLabelMargin100Unit.size.height = HIGH_PITCH * 3;
	m_lblMargin100Unit = [[UILabelUnit alloc] initWithFrame:rectLabelMargin100Unit];
	m_lblMargin100Unit.text = @"円";
	[self.view addSubview:m_lblMargin100Unit];
}

// *****************************************************************
//	@brief	update display object
//	@note
//		Nothing
// *****************************************************************
- (void) updateDisplay
{
	NSDecimalNumber* decnumRate = [NSDecimalNumber decimalNumberWithString:m_lblRateText.text];
	NSDecimalNumber* decnumLeverage = [NSDecimalNumber decimalNumberWithString:m_lblLeverageText.text];
	NSDecimalNumber* decnumLots = [NSDecimalNumber decimalNumberWithString:m_lblLotsText.text];
	NSDecimalNumber* decnumMargin = [NSDecimalNumber decimalNumberWithString:@"0"];
	NSDecimalNumber* decnum10Pips = [NSDecimalNumber decimalNumberWithString:@"0"];
	NSDecimalNumber* decnum25Pips = [NSDecimalNumber decimalNumberWithString:@"0"];
	NSDecimalNumber* decnum50Pips = [NSDecimalNumber decimalNumberWithString:@"0"];
	NSDecimalNumber* decnum100Pips = [NSDecimalNumber decimalNumberWithString:@"0"];

	
	if ( [decnumLeverage integerValue] != 0 ) {
		
		decnumMargin = [NSDecimalNumber decimalNumberWithString:@"10000"];
		decnumMargin = [decnumMargin decimalNumberByMultiplyingBy:decnumRate];
		decnumMargin = [decnumMargin decimalNumberByMultiplyingBy:decnumLots];
		decnumMargin = [decnumMargin decimalNumberByDividingBy:decnumLeverage];
		
		NSDecimalNumber* decnumPips = [NSDecimalNumber decimalNumberWithString:@"10000"];
		decnumPips = [decnumPips decimalNumberByMultiplyingBy:decnumLots];
		decnumPips = [decnumPips decimalNumberByMultiplyingBy:[NSDecimalNumber decimalNumberWithString:@"0.01"]];
		
		decnum10Pips = [decnumPips decimalNumberByMultiplyingBy:[NSDecimalNumber decimalNumberWithString:@"10"]];
		decnum10Pips = [decnum10Pips decimalNumberByAdding:decnumMargin];

		decnum25Pips = [decnumPips decimalNumberByMultiplyingBy:[NSDecimalNumber decimalNumberWithString:@"25"]];
		decnum25Pips = [decnum25Pips decimalNumberByAdding:decnumMargin];
		
		decnum50Pips = [decnumPips decimalNumberByMultiplyingBy:[NSDecimalNumber decimalNumberWithString:@"50"]];
		decnum50Pips = [decnum50Pips decimalNumberByAdding:decnumMargin];
		
		decnum100Pips = [decnumPips decimalNumberByMultiplyingBy:[NSDecimalNumber decimalNumberWithString:@"100"]];
		decnum100Pips = [decnum100Pips decimalNumberByAdding:decnumMargin];
	}
	else {

	}

	// 数値を3桁ごとカンマ区切りにするように設定
	NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
	[formatter setNumberStyle:NSNumberFormatterDecimalStyle];
	[formatter setGroupingSeparator:@","];
	[formatter setGroupingSize:3];
	
	NSDecimalNumberHandler *roundingBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundUp scale:0 raiseOnExactness:FALSE raiseOnOverflow:TRUE raiseOnUnderflow:TRUE raiseOnDivideByZero:TRUE];
	
	decnumMargin = [decnumMargin decimalNumberByRoundingAccordingToBehavior:roundingBehavior];
	decnum10Pips = [decnum10Pips decimalNumberByRoundingAccordingToBehavior:roundingBehavior];
	decnum25Pips = [decnum25Pips decimalNumberByRoundingAccordingToBehavior:roundingBehavior];
	decnum50Pips = [decnum50Pips decimalNumberByRoundingAccordingToBehavior:roundingBehavior];
	decnum100Pips = [decnum100Pips decimalNumberByRoundingAccordingToBehavior:roundingBehavior];
	
	// 数値を3桁ごとカンマ区切り形式で文字列に変換する
	NSString *strMargin = [formatter stringFromNumber:decnumMargin];
	NSString *str10Pips = [formatter stringFromNumber:decnum10Pips];
	NSString *str25Pips = [formatter stringFromNumber:decnum25Pips];
	NSString *str50Pips = [formatter stringFromNumber:decnum50Pips];
	NSString *str100Pips = [formatter stringFromNumber:decnum100Pips];
	
	m_lblMarginText.text = strMargin;
	m_lblMargin10Text.text = str10Pips;
	m_lblMargin25Text.text = str25Pips;
	m_lblMargin50Text.text = str50Pips;
	m_lblMargin100Text.text = str100Pips;
}

// *****************************************************************
//	@brief	Click event function ( RateText button )
//	@note
//		Nothing
// *****************************************************************
- (void) actPushRateTextBtn:(id)inSender
{
	m_rateViewController = [[rateViewController alloc] initWithValue:m_lblRateText.text];
	m_rateViewController.modalPresentationStyle = UIModalPresentationFullScreen;
	m_rateViewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
	m_rateViewController.delegate = self;
	
	[self presentViewController:m_rateViewController animated:YES completion: nil];

}

// *****************************************************************
//	@brief	Click event function ( LeverageText button )
//	@note
//		Nothing
// *****************************************************************
- (void) actPushLeverageTextBtn:(id)inSender
{
	m_leverageViewController = [[leverageViewController alloc] initWithValue:m_lblLeverageText.text];
	m_leverageViewController.modalPresentationStyle = UIModalPresentationFullScreen;
	m_leverageViewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
	m_leverageViewController.delegate = self;
	
	[self presentViewController:m_leverageViewController animated:YES completion: nil];
}

// *****************************************************************
//	@brief	Click event function ( Lots button )
//	@note
//		Nothing
// *****************************************************************
- (void) actPushLotsTextBtn:(id)inSender
{
	m_lotViewController = [[lotViewController alloc] initWithValue:m_lblLotsText.text];
	m_lotViewController.modalPresentationStyle = UIModalPresentationFullScreen;
	m_lotViewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
	m_lotViewController.delegate = self;
	
	[self presentViewController:m_lotViewController animated:YES completion: nil];
}

// *****************************************************************
//	@brief	protocol rateViewControllerDelegate
//	@note
//		Nothing
// *****************************************************************
- (void)rateViewController_ModalClose:(NSString*)strValue
{
	[m_lblRateText setText:strValue];
	m_rateViewController = NULL;
	[self updateDisplay];
}

// *****************************************************************
//	@brief	protocol leverageViewController_ModalClose
//	@note
//		Nothing
// *****************************************************************
- (void)leverageViewController_ModalClose:(NSString*)strValue
{
	[m_lblLeverageText setText:strValue];
	m_leverageViewController = NULL;
	[self updateDisplay];
}

// *****************************************************************
//	@brief	protocol lotViewController_ModalClose
//	@note
//		Nothing
// *****************************************************************
- (void)lotViewController_ModalClose:(NSString*)strValue
{
	[m_lblLotsText setText:strValue];
	m_lotViewController = NULL;
	[self updateDisplay];
}

// iAdの受信に成功したとき
-(void)bannerViewDidLoadAd:(ADBannerView *)banner {
	// バナーが表示されていない場合
	if ( !bannerIsVisible ) {
		// 表示
		banner.alpha = 1.0f;
	}
	// フラグをYESに
	bannerIsVisible = YES;
}

// iAdの受信に失敗したとき
-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error {
	// バナーが表示されている場合
	if ( bannerIsVisible ) {
		// 非表示
		banner.alpha = 0.0f;
	}
	// フラグをNOに
	bannerIsVisible = NO;
}

@end
