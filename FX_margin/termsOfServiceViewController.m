//
//  termsOfServiceViewController.m
//  FX_margin
//
//  Created by Fujisawa Hiroaki on 2013/07/09.
//  Copyright (c) 2013年 Fujisawa Hiroaki. All rights reserved.
//

#import "termsOfServiceViewController.h"
#import "QuartzCore/QuartzCore.h"

#define HEADER_HIGHT	(20.0f)

@interface termsOfServiceViewController ()

@end

@implementation termsOfServiceViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
		// Custom initialization
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
	
	// Set background¥
	UIImage *backgroundImage = [UIImage imageNamed:@"back.png"];
	self.view.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
	
	// Set Label back
	CGRect	rectLabelBack = rectMainFrame;
	rectLabelBack.origin.x += WIDTH_PITCH * 2;
	rectLabelBack.origin.y += HIGH_PITCH * 2;
	rectLabelBack.size.width = WIDTH_PITCH * 36;
	rectLabelBack.size.height = HIGH_PITCH * 30;
	m_labelBack = [[UIView alloc] initWithFrame:rectLabelBack];
	[[m_labelBack layer] setBorderColor:[[UIColor whiteColor] CGColor]];
	[[m_labelBack layer] setBorderWidth:2.0];
	m_labelBack.layer.cornerRadius = 10;
	m_labelBack.clipsToBounds = true;
	m_labelBack.backgroundColor = [UIColor darkGrayColor];
	[self.view addSubview:m_labelBack];
	
	// Set label title
	CGRect	rectLabelTitle = rectMainFrame;
	rectLabelTitle.origin.x += WIDTH_PITCH * 2;
	rectLabelTitle.origin.y += HIGH_PITCH * 3;
	rectLabelTitle.size.width = WIDTH_PITCH * 36;
	rectLabelTitle.size.height = HIGH_PITCH * 3;
	m_labelTitle = [[UILabel alloc] initWithFrame:rectLabelTitle];
	m_labelTitle.backgroundColor = [UIColor clearColor];
	m_labelTitle.textColor = [UIColor redColor];
	m_labelTitle.textAlignment = NSTextAlignmentCenter;
	m_labelTitle.font = [UIFont fontWithName:@"Helvetica-Bold" size:rectLabelTitle.size.height];
	m_labelTitle.text = @"利用規約";
	[self.view addSubview:m_labelTitle];
	
	// Set label text
	CGRect	rectLabelText = rectMainFrame;
	rectLabelText.origin.x += WIDTH_PITCH * 3;
	rectLabelText.origin.y += HIGH_PITCH * 7;
	rectLabelText.size.width = WIDTH_PITCH * 34;
	rectLabelText.size.height = HIGH_PITCH * 24;
	m_labelText = [[UILabel alloc] initWithFrame:rectLabelText];
	[m_labelText setLineBreakMode:NSLineBreakByWordWrapping];
	[m_labelText setNumberOfLines:0];
	m_labelText.backgroundColor = [UIColor clearColor];
	m_labelText.textColor = [UIColor whiteColor];
	m_labelText.font = [UIFont fontWithName:@"Helvetica-Bold" size:rectLabelText.size.width / 18];
	m_labelText.adjustsFontSizeToFitWidth = YES;
	m_labelText.text = @"必要証拠金は、各取引業者によって異なる場合があります。つきましては、取引ルールに関するお問い合わせなどは、直接該当する業者へ行っていただきますようにお願いいたします。\n\n当アプリケーションの使用は、利用者の責任において行うものとします。内容につきましては万全を期しておりますが、正確性・妥当性・有用性について保証するものではありません。使用にあたり、不利益・損害・実績が得られない等のことがありましても一切の責任を負い兼ねますのでご了承下さい。";
	[self.view addSubview:m_labelText];
	
	// Create OK button
	CGRect	rectOKBtn = rectMainFrame;
	rectOKBtn.origin.x += WIDTH_PITCH * 2;
	rectOKBtn.origin.y += HIGH_PITCH * 33;
	rectOKBtn.size.width = WIDTH_PITCH * 36;
	rectOKBtn.size.height = HIGH_PITCH * 4;
	m_btnOK = [[UIButtonAnswer alloc] initWithFrame:rectOKBtn];
	[m_btnOK setTitle:@"利用規約に同意する" forState:UIControlStateNormal];
	[m_btnOK addTarget:self action:@selector(actPushOKBtn:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:m_btnOK];

}

// *****************************************************************
//	@brief	Click event function ( OK button )
//	@note
//		Nothing
// *****************************************************************
- (void) actPushOKBtn:(id)inSender
{
	NSNotification *n = [NSNotification notificationWithName:@"DT_Margin" object:self];
	[[NSNotificationCenter defaultCenter] postNotification:n];
}

@end
