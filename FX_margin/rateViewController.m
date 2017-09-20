//
//  rateViewController.m
//  FX_margin
//
//  Created by Fujisawa Hiroaki on 2013/07/29.
//  Copyright (c) 2013年 Fujisawa Hiroaki. All rights reserved.
//

#import "rateViewController.h"
#import "XmlReader.h"

@interface rateViewController ()

@end

@implementation rateViewController
@synthesize delegate;

- (id)initWithValue:(NSString *)value
{
	self = [super init];
	if(self != nil){
		[self setNumberForString:value];
		[self updateDisplay];
	}
	return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
		// Custom initialization
		[self clearNumber];
		[self initFirstDisplay];
	}
	return self;
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
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
	
	/******************************************************************************************************************/
	// Set background
	self.view.backgroundColor = [UIColor blackColor];
	
	/******************************************************************************************************************/
	// Set Label Title
	CGRect	rectLabelTitle;
	rectLabelTitle.origin.x = WIDTH_PITCH * 1;
	rectLabelTitle.origin.y = HIGH_PITCH * 1;
	rectLabelTitle.size.width = WIDTH_PITCH * 11;
	rectLabelTitle.size.height = HIGH_PITCH * 5;
	m_lblTitle = [[UILabelUnit alloc] initWithFrame:rectLabelTitle];
	m_lblTitle.text = @"レート";
	[self.view addSubview:m_lblTitle];
	
	// Set Label Sub Title
	CGRect	rectLabelSubTitle;
	rectLabelSubTitle.origin.x = WIDTH_PITCH * 2;
	rectLabelSubTitle.origin.y = HIGH_PITCH * 4;
	rectLabelSubTitle.size.width = WIDTH_PITCH * 13;
	rectLabelSubTitle.size.height = HIGH_PITCH * 2;
	m_lblSubTitle = [[UILabelUnit alloc] initWithFrame:rectLabelSubTitle];
	m_lblSubTitle.text = @"USD・EUR・GBP・AUD / JPY";
	[self.view addSubview:m_lblSubTitle];

	// Set Label Text
	CGRect	rectLabelText;
	rectLabelText.origin.x = WIDTH_PITCH * 16;
	rectLabelText.origin.y = HIGH_PITCH * 1;
	rectLabelText.size.width = WIDTH_PITCH * 18;
	rectLabelText.size.height = HIGH_PITCH * 5;
	m_lblText = [[UILabelMoney alloc] initWithFrame:rectLabelText];
	m_lblText.text = @"0";
	[self.view addSubview:m_lblText];

	// Set Label Rate Unit
	CGRect	rectLabelUnit;
	rectLabelUnit.origin.x = WIDTH_PITCH * 35;
	rectLabelUnit.origin.y = HIGH_PITCH * 3;
	rectLabelUnit.size.width = WIDTH_PITCH * 4;
	rectLabelUnit.size.height = HIGH_PITCH * 4;
	m_lblUnit = [[UILabelUnit alloc] initWithFrame:rectLabelUnit];
	m_lblUnit.text = @"円";
	[self.view addSubview:m_lblUnit];

	/******************************************************************************************************************/
	// Set horizon line 1
	CGRect	rectLineHorizon1;
	rectLineHorizon1.origin.x = WIDTH_PITCH * 1;
	rectLineHorizon1.origin.y = HIGH_PITCH * 7;
	rectLineHorizon1.size.width = WIDTH_PITCH * 38;
	rectLineHorizon1.size.height = HIGH_PITCH * 0.2;
	UIView* lineHorizon1 = [[UIView alloc] initWithFrame:rectLineHorizon1];
	lineHorizon1.backgroundColor = [UIColor whiteColor];
	[self.view addSubview:lineHorizon1];
	
	/******************************************************************************************************************/
	// Create USD button
	CGRect	rectUSDBtn;
	rectUSDBtn.origin.x = WIDTH_PITCH * 1;
	rectUSDBtn.origin.y = HIGH_PITCH * 8;
	rectUSDBtn.size.width = WIDTH_PITCH * 8;
	rectUSDBtn.size.height = HIGH_PITCH * 4;
	m_btnUSD = [[UIButtonAnswer alloc] initWithFrame:rectUSDBtn];
	[m_btnUSD setTitle:@"USD" forState:UIControlStateNormal];
	[m_btnUSD addTarget:self action:@selector(actPushUSBBtn:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:m_btnUSD];
	
	// CreateEUR button
	CGRect	rectEURBtn;
	rectEURBtn.origin.x = WIDTH_PITCH * 11;
	rectEURBtn.origin.y = HIGH_PITCH * 8;
	rectEURBtn.size.width = WIDTH_PITCH * 8;
	rectEURBtn.size.height = HIGH_PITCH * 4;
	m_btnEUR = [[UIButtonAnswer alloc] initWithFrame:rectEURBtn];
	[m_btnEUR setTitle:@"EUR" forState:UIControlStateNormal];
	[m_btnEUR addTarget:self action:@selector(actPushEURBtn:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:m_btnEUR];
	
	// Create GBP button
	CGRect	rectGBPBtn;
	rectGBPBtn.origin.x = WIDTH_PITCH * 21;
	rectGBPBtn.origin.y = HIGH_PITCH * 8;
	rectGBPBtn.size.width = WIDTH_PITCH * 8;
	rectGBPBtn.size.height = HIGH_PITCH * 4;
	m_btnGBP = [[UIButtonAnswer alloc] initWithFrame:rectGBPBtn];
	[m_btnGBP setTitle:@"GBP" forState:UIControlStateNormal];
	[m_btnGBP addTarget:self action:@selector(actPushGBPBtn:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:m_btnGBP];
	
	// Create AUD button
	CGRect	rectAUDBtn;
	rectAUDBtn.origin.x = WIDTH_PITCH * 31;
	rectAUDBtn.origin.y = HIGH_PITCH * 8;
	rectAUDBtn.size.width = WIDTH_PITCH * 8;
	rectAUDBtn.size.height = HIGH_PITCH * 4;
	m_btnAUD = [[UIButtonAnswer alloc] initWithFrame:rectAUDBtn];
	[m_btnAUD setTitle:@"AUD" forState:UIControlStateNormal];
	[m_btnAUD addTarget:self action:@selector(actPushAUDBtn:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:m_btnAUD];

	/******************************************************************************************************************/
	// Set horizon line 2
	CGRect	rectLineHorizon2;
	rectLineHorizon2.origin.x = WIDTH_PITCH * 1;
	rectLineHorizon2.origin.y = HIGH_PITCH * 13;
	rectLineHorizon2.size.width = WIDTH_PITCH * 38;
	rectLineHorizon2.size.height = HIGH_PITCH * 0.2;
	UIView* lineHorizon2 = [[UIView alloc] initWithFrame:rectLineHorizon2];
	lineHorizon2.backgroundColor = [UIColor whiteColor];
	[self.view addSubview:lineHorizon2];

	/******************************************************************************************************************/
	
	CGRect	rect7Btn;
	rect7Btn.origin.x = WIDTH_PITCH * 4;
	rect7Btn.origin.y = HIGH_PITCH * 14;
	rect7Btn.size.width = WIDTH_PITCH * 8;
	rect7Btn.size.height = HIGH_PITCH * 4;
	m_btn7 = [[UIButtonAnswer alloc] initWithFrame:rect7Btn];
	[m_btn7 setTitle:@"7" forState:UIControlStateNormal];
	[m_btn7 addTarget:self action:@selector(actPush7Btn:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:m_btn7];

	CGRect	rect4Btn;
	rect4Btn.origin.x = WIDTH_PITCH * 4;
	rect4Btn.origin.y = HIGH_PITCH * 19;
	rect4Btn.size.width = WIDTH_PITCH * 8;
	rect4Btn.size.height = HIGH_PITCH * 4;
	m_btn4 = [[UIButtonAnswer alloc] initWithFrame:rect4Btn];
	[m_btn4 setTitle:@"4" forState:UIControlStateNormal];
	[m_btn4 addTarget:self action:@selector(actPush4Btn:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:m_btn4];

	CGRect	rect1Btn;
	rect1Btn.origin.x = WIDTH_PITCH * 4;
	rect1Btn.origin.y = HIGH_PITCH * 24;
	rect1Btn.size.width = WIDTH_PITCH * 8;
	rect1Btn.size.height = HIGH_PITCH * 4;
	m_btn1 = [[UIButtonAnswer alloc] initWithFrame:rect1Btn];
	[m_btn1 setTitle:@"1" forState:UIControlStateNormal];
	[m_btn1 addTarget:self action:@selector(actPush1Btn:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:m_btn1];

	CGRect	rect0Btn;
	rect0Btn.origin.x = WIDTH_PITCH * 4;
	rect0Btn.origin.y = HIGH_PITCH * 29;
	rect0Btn.size.width = WIDTH_PITCH * 8;
	rect0Btn.size.height = HIGH_PITCH * 4;
	m_btn0 = [[UIButtonAnswer alloc] initWithFrame:rect0Btn];
	[m_btn0 setTitle:@"0" forState:UIControlStateNormal];
	[m_btn0 addTarget:self action:@selector(actPush0Btn:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:m_btn0];

	CGRect	rect8Btn;
	rect8Btn.origin.x = WIDTH_PITCH * 16;
	rect8Btn.origin.y = HIGH_PITCH * 14;
	rect8Btn.size.width = WIDTH_PITCH * 8;
	rect8Btn.size.height = HIGH_PITCH * 4;
	m_btn8 = [[UIButtonAnswer alloc] initWithFrame:rect8Btn];
	[m_btn8 setTitle:@"8" forState:UIControlStateNormal];
	[m_btn8 addTarget:self action:@selector(actPush8Btn:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:m_btn8];
	
	CGRect	rect5Btn;
	rect5Btn.origin.x = WIDTH_PITCH * 16;
	rect5Btn.origin.y = HIGH_PITCH * 19;
	rect5Btn.size.width = WIDTH_PITCH * 8;
	rect5Btn.size.height = HIGH_PITCH * 4;
	m_btn5 = [[UIButtonAnswer alloc] initWithFrame:rect5Btn];
	[m_btn5 setTitle:@"5" forState:UIControlStateNormal];
	[m_btn5 addTarget:self action:@selector(actPush5Btn:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:m_btn5];
	
	CGRect	rect2Btn;
	rect2Btn.origin.x = WIDTH_PITCH * 16;
	rect2Btn.origin.y = HIGH_PITCH * 24;
	rect2Btn.size.width = WIDTH_PITCH * 8;
	rect2Btn.size.height = HIGH_PITCH * 4;
	m_btn2 = [[UIButtonAnswer alloc] initWithFrame:rect2Btn];
	[m_btn2 setTitle:@"2" forState:UIControlStateNormal];
	[m_btn2 addTarget:self action:@selector(actPush2Btn:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:m_btn2];

	CGRect	rectDotBtn;
	rectDotBtn.origin.x = WIDTH_PITCH * 16;
	rectDotBtn.origin.y = HIGH_PITCH * 29;
	rectDotBtn.size.width = WIDTH_PITCH * 8;
	rectDotBtn.size.height = HIGH_PITCH * 4;
	m_btnDot = [[UIButtonAnswer alloc] initWithFrame:rectDotBtn];
	[m_btnDot setTitle:@"." forState:UIControlStateNormal];
	[m_btnDot addTarget:self action:@selector(actPushDotBtn:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:m_btnDot];
	
	CGRect	rect9Btn;
	rect9Btn.origin.x = WIDTH_PITCH * 28;
	rect9Btn.origin.y = HIGH_PITCH * 14;
	rect9Btn.size.width = WIDTH_PITCH * 8;
	rect9Btn.size.height = HIGH_PITCH * 4;
	m_btn9 = [[UIButtonAnswer alloc] initWithFrame:rect9Btn];
	[m_btn9 setTitle:@"9" forState:UIControlStateNormal];
	[m_btn9 addTarget:self action:@selector(actPush9Btn:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:m_btn9];
	
	CGRect	rect6Btn;
	rect6Btn.origin.x = WIDTH_PITCH * 28;
	rect6Btn.origin.y = HIGH_PITCH * 19;
	rect6Btn.size.width = WIDTH_PITCH * 8;
	rect6Btn.size.height = HIGH_PITCH * 4;
	m_btn6 = [[UIButtonAnswer alloc] initWithFrame:rect6Btn];
	[m_btn6 setTitle:@"6" forState:UIControlStateNormal];
	[m_btn6 addTarget:self action:@selector(actPush6Btn:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:m_btn6];
	
	CGRect	rect3Btn;
	rect3Btn.origin.x = WIDTH_PITCH * 28;
	rect3Btn.origin.y = HIGH_PITCH * 24;
	rect3Btn.size.width = WIDTH_PITCH * 8;
	rect3Btn.size.height = HIGH_PITCH * 4;
	m_btn3 = [[UIButtonAnswer alloc] initWithFrame:rect3Btn];
	[m_btn3 setTitle:@"3" forState:UIControlStateNormal];
	[m_btn3 addTarget:self action:@selector(actPush3Btn:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:m_btn3];
	
	CGRect	rectCBtn;
	rectCBtn.origin.x = WIDTH_PITCH * 28;
	rectCBtn.origin.y = HIGH_PITCH * 29;
	rectCBtn.size.width = WIDTH_PITCH * 8;
	rectCBtn.size.height = HIGH_PITCH * 4;
	m_btnC = [[UIButtonAnswer alloc] initWithFrame:rectCBtn];
	[m_btnC setTitle:@"C" forState:UIControlStateNormal];
	[m_btnC setEmphasize:TRUE];
	[m_btnC addTarget:self action:@selector(actPushCBtn:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:m_btnC];

	/******************************************************************************************************************/
	// Set horizon line 3
	CGRect	rectLineHorizon3;
	rectLineHorizon3.origin.x = WIDTH_PITCH * 1;
	rectLineHorizon3.origin.y = HIGH_PITCH * 34;
	rectLineHorizon3.size.width = WIDTH_PITCH * 38;
	rectLineHorizon3.size.height = HIGH_PITCH * 0.2;
	UIView* lineHorizon3 = [[UIView alloc] initWithFrame:rectLineHorizon3];
	lineHorizon3.backgroundColor = [UIColor whiteColor];
	[self.view addSubview:lineHorizon3];

	/******************************************************************************************************************/
	CGRect	rectOKBtn;
	rectOKBtn.origin.x = WIDTH_PITCH * 2;
	rectOKBtn.origin.y = HIGH_PITCH * 35;
	rectOKBtn.size.width = WIDTH_PITCH * 36;
	rectOKBtn.size.height = HIGH_PITCH * 4;
	m_btnOK = [[UIButtonAnswer alloc] initWithFrame:rectOKBtn];
	[m_btnOK setTitle:@"OK" forState:UIControlStateNormal];
	[m_btnOK addTarget:self action:@selector(actPushOKBtn:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:m_btnOK];
	
}

// *****************************************************************
//	@brief	Click event function ( USD button )
//	@note
//		Nothing
// *****************************************************************
- (void) actPushUSBBtn:(id)inSender
{

	CGFloat value = [self getRate:@"USD"];
	
	if ( value != 0 ) {
		[self setNumber:value];
		[self updateDisplay];
	}
	else {
		UIAlertView *alert = [[UIAlertView alloc]
							  initWithTitle:@"エラー"
							  message:@"為替価格の取得に失敗しました"
							  delegate:self
							  cancelButtonTitle:nil
							  otherButtonTitles:@"OK", nil];
		[alert show];
	}
}

// *****************************************************************
//	@brief	Click event function ( EUR button )
//	@note
//		Nothing
// *****************************************************************
- (void) actPushEURBtn:(id)inSender
{
	CGFloat value = [self getRate:@"EUR"];
	
	if ( value != 0 ) {
		[self setNumber:value];
		[self updateDisplay];
	}
	else {
		UIAlertView *alert = [[UIAlertView alloc]
							  initWithTitle:@"エラー"
							  message:@"為替価格の取得に失敗しました"
							  delegate:self
							  cancelButtonTitle:nil
							  otherButtonTitles:@"OK", nil];
		[alert show];
	}
}

// *****************************************************************
//	@brief	Click event function ( GBP button )
//	@note
//		Nothing
// *****************************************************************
- (void) actPushGBPBtn:(id)inSender
{
	CGFloat value = [self getRate:@"GBP"];
	
	if ( value != 0 ) {
		[self setNumber:value];
		[self updateDisplay];
	}
	else {
		UIAlertView *alert = [[UIAlertView alloc]
							  initWithTitle:@"エラー"
							  message:@"為替価格の取得に失敗しました"
							  delegate:self
							  cancelButtonTitle:nil
							  otherButtonTitles:@"OK", nil];
		[alert show];
	}
}

// *****************************************************************
//	@brief	Click event function ( AUD button )
//	@note
//		Nothing
// *****************************************************************
- (void) actPushAUDBtn:(id)inSender
{
	CGFloat value = [self getRate:@"AUD"];
	
	if ( value != 0 ) {
		[self setNumber:value];
		[self updateDisplay];
	}
	else {
		UIAlertView *alert = [[UIAlertView alloc]
							  initWithTitle:@"エラー"
							  message:@"為替価格の取得に失敗しました"
							  delegate:self
							  cancelButtonTitle:nil
							  otherButtonTitles:@"OK", nil];
		[alert show];
	}
}

// *****************************************************************
//	@brief	Click event function ( 0 button )
//	@note
//		Nothing
// *****************************************************************
- (void) actPush0Btn:(id)inSender
{
	BOOL result = [self addNumber:@"0"];
	if ( result == FALSE ) {
		[self dispNumberAlert];
	}
	[self updateDisplay];
}

// *****************************************************************
//	@brief	Click event function ( 1 button )
//	@note
//		Nothing
// *****************************************************************
- (void) actPush1Btn:(id)inSender
{
	BOOL result = [self addNumber:@"1"];
	if ( result == FALSE ) {
		[self dispNumberAlert];
	}
	[self updateDisplay];
}

// *****************************************************************
//	@brief	Click event function ( 2 button )
//	@note
//		Nothing
// *****************************************************************
- (void) actPush2Btn:(id)inSender
{
	BOOL result = [self addNumber:@"2"];
	if ( result == FALSE ) {
		[self dispNumberAlert];
	}
	[self updateDisplay];
}

// *****************************************************************
//	@brief	Click event function ( 3 button )
//	@note
//		Nothing
// *****************************************************************
- (void) actPush3Btn:(id)inSender
{
	BOOL result = [self addNumber:@"3"];
	if ( result == FALSE ) {
		[self dispNumberAlert];
	}
	[self updateDisplay];
}

// *****************************************************************
//	@brief	Click event function ( 4 button )
//	@note
//		Nothing
// *****************************************************************
- (void) actPush4Btn:(id)inSender
{
	BOOL result = [self addNumber:@"4"];
	if ( result == FALSE ) {
		[self dispNumberAlert];
	}
	[self updateDisplay];
}

// *****************************************************************
//	@brief	Click event function ( 5 button )
//	@note
//		Nothing
// *****************************************************************
- (void) actPush5Btn:(id)inSender
{
	BOOL result = [self addNumber:@"5"];
	if ( result == FALSE ) {
		[self dispNumberAlert];
	}
	[self updateDisplay];
}

// *****************************************************************
//	@brief	Click event function ( 6 button )
//	@note
//		Nothing
// *****************************************************************
- (void) actPush6Btn:(id)inSender
{
	BOOL result = [self addNumber:@"6"];
	if ( result == FALSE ) {
		[self dispNumberAlert];
	}
	[self updateDisplay];
}

// *****************************************************************
//	@brief	Click event function ( 7 button )
//	@note
//		Nothing
// *****************************************************************
- (void) actPush7Btn:(id)inSender
{
	BOOL result = [self addNumber:@"7"];
	if ( result == FALSE ) {
		[self dispNumberAlert];
	}
	[self updateDisplay];
}

// *****************************************************************
//	@brief	Click event function ( 8 button )
//	@note
//		Nothing
// *****************************************************************
- (void) actPush8Btn:(id)inSender
{
	BOOL result = [self addNumber:@"8"];
	if ( result == FALSE ) {
		[self dispNumberAlert];
	}
	[self updateDisplay];
}

// *****************************************************************
//	@brief	Click event function ( 9 button )
//	@note
//		Nothing
// *****************************************************************
- (void) actPush9Btn:(id)inSender
{
	BOOL result = [self addNumber:@"9"];
	if ( result == FALSE ) {
		[self dispNumberAlert];
	}
	[self updateDisplay];
}

// *****************************************************************
//	@brief	Click event function ( Dot button )
//	@note
//		Nothing
// *****************************************************************
- (void) actPushDotBtn:(id)inSender
{
	BOOL result = [self addNumber:@"."];
	if ( result == FALSE ) {
		[self dispNumberAlert];
	}
	[self updateDisplay];
}

// *****************************************************************
//	@brief	Click event function ( C button )
//	@note
//		Nothing
// *****************************************************************
- (void) actPushCBtn:(id)inSender
{
	[self clearNumber];
	[self updateDisplay];
}

// *****************************************************************
//	@brief	Click event function ( OK button )
//	@note
//		Nothing
// *****************************************************************
- (void) actPushOKBtn:(id)inSender
{
	NSString* workText = [[NSString alloc] initWithFormat:@"%ld",(long)m_integerValue];
	if ( (m_floatlValue != nil) && ([m_floatlValue intValue] > 0) ) {
		workText = [workText stringByAppendingString:@"."];
		if ( [m_floatlValue length] > 0 ) {
			workText = [workText stringByAppendingString:m_floatlValue];
		}
	}
	
	[delegate rateViewController_ModalClose:m_lblText.text];
	[self dismissViewControllerAnimated:YES completion: nil];
}

// *****************************************************************
//	@brief	get rate by google finance
//	@note
//		Nothing
// *****************************************************************
- (CGFloat) getRate:(NSString*)strCurrency
{
	CGFloat	result = 0;

	NSString*	strURL = [NSString stringWithFormat:@"%@%@%@", @"https://finance.google.com/finance/converter?a=1&from=", strCurrency, @"&to=JPY"];
	NSURL *url = [NSURL URLWithString:strURL];
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
	[request setTimeoutInterval:2];
	
	// リクエストを送信する。
	NSError *error;
	NSURLResponse *response;
	NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
	
	if ( error == nil ) {
		NSString *str = [[NSString alloc] initWithData:data encoding:NSISO2022JPStringEncoding];
		
		NSRange rangeStart = [str rangeOfString:@"<span class=bld>"];
		NSRange rangeEnd = [str rangeOfString:@" JPY</span>" options:NSBackwardsSearch];
		NSString *strRes = [str substringWithRange:NSMakeRange((rangeStart.location+rangeStart.length), (rangeEnd.location-(rangeStart.location+rangeStart.length)))];

		result = [strRes floatValue];
	}

	return result;
}

// *****************************************************************
//	@brief	parse text for google API
//	@note
//		Nothing
// *****************************************************************
- (CGFloat) parseRateText:(NSString*)parseText
{
	CGFloat	result = 0;
	
	NSArray *arr = [parseText componentsSeparatedByString:@","];
	if ( [arr count] > 0 ) {
		
		NSInteger index;
		for ( index=0; index<[arr count]; index++) {
			NSRange searchResult = [arr[index] rangeOfString:@"rhs"];
			if(searchResult.location == NSNotFound){
				// go next index
			}else{
				break;
			}
		}
		
		if ( [arr count] > index ) {
			NSString* strwork = [arr[index] stringByReplacingOccurrencesOfString:@"rhs:" withString:@""];
			strwork = [strwork stringByReplacingOccurrencesOfString:@"Japanese yen" withString:@""];
			strwork = [strwork stringByReplacingOccurrencesOfString:@" " withString:@""];
			strwork = [strwork stringByReplacingOccurrencesOfString:@"\"" withString:@""];
			result = [strwork floatValue];
		}
		else {		// no find
			result = 0;
		}
		
	}
	else {
		result = 0;
	}
	
	return result;
}

// *****************************************************************
//	@brief	alert
//	@note
//		Nothing
// *****************************************************************
- (void) dispNumberAlert
{
	UIAlertView *alert = [[UIAlertView alloc]
						  initWithTitle:@"インフォメーション"
						  message:@"0.001〜999.999の値を入力してください。"
						  delegate:self
						  cancelButtonTitle:nil
						  otherButtonTitles:@"OK", nil];
	[alert show];
}

// *****************************************************************
//	@brief	Initialize text number
//	@note
//		Nothing
// *****************************************************************
- (void) clearNumber
{
	m_integerValue = 0;
	m_floatlValue = NULL;
	m_decimalFlag = FALSE;
}

// *****************************************************************
//	@brief	set number for float
//	@note
//		Nothing
// *****************************************************************
- (BOOL) setNumberForString:(NSString*)value
{
	BOOL result = FALSE;
	
	NSArray*	arr = [value componentsSeparatedByString:@"."];
	if ([arr count] > 1) {
		m_integerValue = [arr[0] intValue];
		m_floatlValue = arr[1];
		m_decimalFlag = TRUE;
	}
	else {
		m_integerValue = [arr[0] intValue];
		m_floatlValue = nil;
		m_decimalFlag = FALSE;
	}
	
	return result;
}

// *****************************************************************
//	@brief	set number for float
//	@note
//		Nothing
// *****************************************************************
- (BOOL) setNumber:(CGFloat)value
{
	BOOL result = FALSE;

	NSString*	workString = [NSString stringWithFormat:@"%0.3f", value];
	NSArray*	arr = [workString componentsSeparatedByString:@"."];
	if ( (arr != NULL) && ([arr count] > 0) ) {
		m_integerValue = [arr[0] integerValue];
		if ( ([arr count] > 1) && ([arr[1] intValue] > 0) ) {
			m_decimalFlag = TRUE;
			m_floatlValue = arr[1];
		}
		else {
			m_decimalFlag = FALSE;
			m_floatlValue = NULL;
		}
		result = TRUE;
	}
	else {
		result = FALSE;
	}

	return result;
}

// *****************************************************************
//	@brief	added number to rate text
//	@note
//		Nothing
// *****************************************************************
- (BOOL) addNumber:(NSString*)addChar
{
	BOOL	result = FALSE;

	if ( m_decimalFlag == FALSE ) {
		
		if ( [addChar isEqualToString:@"."] == YES ) {
			m_decimalFlag = TRUE;
			result = TRUE;
		}
		else {
			NSInteger	intWork = (m_integerValue * 10) + [addChar integerValue];
			if (intWork > 999) {
				result = FALSE;
			}
			else {
				m_integerValue = intWork;
				result = TRUE;
			}
		}
	}
	else {
		if ( [addChar isEqualToString:@"."] == YES ) {
			// ignore
			result = TRUE;
		}
		else {
			NSString* workString;
			if ( m_floatlValue == NULL ) {
				workString = addChar;
			}
			else {
				workString = [m_floatlValue stringByAppendingString:addChar];
			}
			if ([workString length] > 3) {
				result = FALSE;
			}
			else {
				m_floatlValue = workString;
				result = TRUE;
			}
		}
	}

	return result;
}

// *****************************************************************
//	@brief	update all parts on display
//	@note
//		Nothing
// *****************************************************************
- (void) updateDisplay
{
	NSString* workText = [[NSString alloc] initWithFormat:@"%ld",(long)m_integerValue];
	if ( m_decimalFlag == TRUE ) {
		workText = [workText stringByAppendingString:@"."];
		if ( [m_floatlValue length] > 0 ) {
			workText = [workText stringByAppendingString:m_floatlValue];
		}
	}
	[m_lblText setText:workText];
}

@end
