//
//  lotViewController.m
//  FX_margin
//
//  Created by Fujisawa Hiroaki on 2013/07/29.
//  Copyright (c) 2013年 Fujisawa Hiroaki. All rights reserved.
//

#import "lotViewController.h"

@interface lotViewController ()

@end

@implementation lotViewController
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
	rectLabelTitle.size.width = WIDTH_PITCH * 16;
	rectLabelTitle.size.height = HIGH_PITCH * 5;
	m_lblTitle = [[UILabelUnit alloc] initWithFrame:rectLabelTitle];
	m_lblTitle.text = @"建玉(１万通貨)";
	[self.view addSubview:m_lblTitle];
	
	// Set Label Text
	CGRect	rectLabelText;
	rectLabelText.origin.x = WIDTH_PITCH * 18;
	rectLabelText.origin.y = HIGH_PITCH * 1;
	rectLabelText.size.width = WIDTH_PITCH * 16;
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
	m_lblUnit.text = @"枚";
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
	// Create 0.1 lots button
	CGRect	rect01LotBtn;
	rect01LotBtn.origin.x = WIDTH_PITCH * 1;
	rect01LotBtn.origin.y = HIGH_PITCH * 8;
	rect01LotBtn.size.width = WIDTH_PITCH * 8;
	rect01LotBtn.size.height = HIGH_PITCH * 4;
	m_btn01Lot = [[UIButtonAnswer alloc] initWithFrame:rect01LotBtn];
	[m_btn01Lot setTitle:@"0.1枚" forState:UIControlStateNormal];
	[m_btn01Lot addTarget:self action:@selector(actPush01LotBtn:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:m_btn01Lot];
	
	// Create 1 lots button
	CGRect	rect1LotBtn;
	rect1LotBtn.origin.x = WIDTH_PITCH * 11;
	rect1LotBtn.origin.y = HIGH_PITCH * 8;
	rect1LotBtn.size.width = WIDTH_PITCH * 8;
	rect1LotBtn.size.height = HIGH_PITCH * 4;
	m_btn1Lot = [[UIButtonAnswer alloc] initWithFrame:rect1LotBtn];
	[m_btn1Lot setTitle:@"1枚" forState:UIControlStateNormal];
	[m_btn1Lot addTarget:self action:@selector(actPush1LotBtn:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:m_btn1Lot];
	
	// Create 10 lots button
	CGRect	rect10LotBtn;
	rect10LotBtn.origin.x = WIDTH_PITCH * 21;
	rect10LotBtn.origin.y = HIGH_PITCH * 8;
	rect10LotBtn.size.width = WIDTH_PITCH * 8;
	rect10LotBtn.size.height = HIGH_PITCH * 4;
	m_btn10Lot = [[UIButtonAnswer alloc] initWithFrame:rect10LotBtn];
	[m_btn10Lot setTitle:@"10枚" forState:UIControlStateNormal];
	[m_btn10Lot addTarget:self action:@selector(actPush10LotBtn:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:m_btn10Lot];
	
	// Create 100 lots button
	CGRect	rect100LotBtn;
	rect100LotBtn.origin.x = WIDTH_PITCH * 31;
	rect100LotBtn.origin.y = HIGH_PITCH * 8;
	rect100LotBtn.size.width = WIDTH_PITCH * 8;
	rect100LotBtn.size.height = HIGH_PITCH * 4;
	m_btn100Lot = [[UIButtonAnswer alloc] initWithFrame:rect100LotBtn];
	[m_btn100Lot setTitle:@"100枚" forState:UIControlStateNormal];
	[m_btn100Lot addTarget:self action:@selector(actPush100LotBtn:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:m_btn100Lot];
	
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
//	@brief	Click event function ( 0.0 lots button )
//	@note
//		Nothing
// *****************************************************************
- (void) actPush01LotBtn:(id)inSender
{
	[self setNumber:0.1f];
	[self updateDisplay];
}

// *****************************************************************
//	@brief	Click event function ( 1 lots button )
//	@note
//		Nothing
// *****************************************************************
- (void) actPush1LotBtn:(id)inSender
{
	[self setNumber:1];
	[self updateDisplay];
}

// *****************************************************************
//	@brief	Click event function ( 10 lots button )
//	@note
//		Nothing
// *****************************************************************
- (void) actPush10LotBtn:(id)inSender
{
	[self setNumber:10];
	[self updateDisplay];
}

// *****************************************************************
//	@brief	Click event function ( 100 lots button )
//	@note
//		Nothing
// *****************************************************************
- (void) actPush100LotBtn:(id)inSender
{
	[self setNumber:100];
	[self updateDisplay];
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
//	@brief	Click event function ( 1 fold button )
//	@note
//		Nothing
// *****************************************************************
- (void) actPushOKBtn:(id)inSender
{
	[delegate lotViewController_ModalClose:m_lblText.text];
	[self dismissViewControllerAnimated:YES completion: nil];
}

// *****************************************************************
//	@brief	Initialize text number
//	@note
//		Nothing
// *****************************************************************
- (void) clearNumber
{
	m_integerValue = 0;
	m_floatlValue = nil;
	m_decimalFlag = FALSE;
}

// *****************************************************************
//	@brief	set number for float
//	@note
//		Nothing
// *****************************************************************
- (BOOL) setNumberForString:(NSString*)strValue
{
	BOOL	result = FALSE;

	NSArray*	arr = [strValue componentsSeparatedByString:@"."];
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
	
	NSString*	workString = [NSString stringWithFormat:@"%0.1f", value];
	NSArray*	arr = [workString componentsSeparatedByString:@"."];
	if ( (arr != NULL) && ([arr count] > 0) ) {
		m_integerValue = [arr[0] integerValue];
		if ( ([arr count] > 1) && ([arr[1] intValue] > 0) ) {
			m_decimalFlag = TRUE;
			m_floatlValue = arr[1];
		}
		else {
			m_decimalFlag = FALSE;
			m_floatlValue = nil;
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
			if (intWork > 9999) {
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
			if ([workString length] > 2) {
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
//	@brief	alert
//	@note
//		Nothing
// *****************************************************************
- (void) dispNumberAlert
{
	UIAlertView *alert = [[UIAlertView alloc]
						  initWithTitle:@"インフォメーション"
						  message:@"0.01〜9999.99の値を入力してください。"
						  delegate:self
						  cancelButtonTitle:nil
						  otherButtonTitles:@"OK", nil];
	[alert show];
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
