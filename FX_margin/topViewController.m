//
//  topViewController.m
//  ShiwakeTrainingClass3
//
//  Created by Hiroaki Fujisawa on 2012/11/30.
//  Copyright (c) 2012年 Hiroaki Fujisawa. All rights reserved.
//

#import "topViewController.h"

#import "marginViewController.h"
#import "termsOfServiceViewController.h"
#import "rateViewController.h"
#import "leverageViewController.h"
#import "lotViewController.h"

@interface topViewController ()

@property (strong, nonatomic) termsOfServiceViewController	*m_termsOfServiceViewController;
@property (strong, nonatomic) marginViewController			*m_marginViewController;
@property (strong, nonatomic) rateViewController			*m_rateViewController;
@property (strong, nonatomic) leverageViewController		*m_leverageViewController;
@property (strong, nonatomic) lotViewController				*m_lotViewController;

@end

@implementation topViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
		// Custom initialization

		self.m_termsOfServiceViewController = nil;
		self.m_marginViewController = nil;
		
		[self initViewController];
		[self initNotificationCenter];
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
//	@brief	Initialize each view controller and set first view.
//	@note
//		Nothing
// *****************************************************************
- (void) initViewController
{
	self.view.backgroundColor = [UIColor blackColor];

	// Create each view controller
	self.m_termsOfServiceViewController = [[termsOfServiceViewController alloc] init];
	[self addChildViewController:self.m_termsOfServiceViewController];
	[self.m_termsOfServiceViewController didMoveToParentViewController:self];
	
	CGRect  frame = self.view.frame;
	frame.origin = CGPointMake(0.0, 0.0);
	self.m_termsOfServiceViewController.view.frame = frame;

	[self.view addSubview:self.self.m_termsOfServiceViewController.view];

	m_nowDispVC = self.m_termsOfServiceViewController;
}

// *****************************************************************
//	@brief	Initialize notification center for display transition
//	@note
//		Nothing
// *****************************************************************
- (void) initNotificationCenter
{
	NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
	
	[nc addObserver:self selector:@selector(dispChenge2margin)		name:@"DT_Margin"	object:nil];
	[nc addObserver:self selector:@selector(dispChenge2rate)		name:@"DT_Rate"		object:nil];
	[nc addObserver:self selector:@selector(dispChenge2leverage)	name:@"DT_Leverage"	object:nil];
	[nc addObserver:self selector:@selector(dispChenge2lot)			name:@"DT_Lot"		object:nil];
}

// *****************************************************************
//	@brief	Change to margin view
//	@note
//		Nothing
// *****************************************************************
- (void) dispChenge2margin
{
	if ( self.m_marginViewController == nil)
	{
		self.m_marginViewController = [[marginViewController alloc] init];
		[self addChildViewController:self.m_marginViewController];
		[self.m_marginViewController didMoveToParentViewController:self];
		
		CGRect  frame = self.view.frame;
		frame.origin = CGPointMake(0.0, 0.0);
		self.m_marginViewController.view.frame = frame;
	}

	[self transitionFromViewController:m_nowDispVC
					  toViewController:self.m_marginViewController
							  duration:0.8
							   options:UIViewAnimationOptionTransitionFlipFromLeft
							animations:NULL
							completion:NULL];
	
	m_nowDispVC = self.m_marginViewController;
}

// *****************************************************************
//	@brief	Change to rate view
//	@note
//		Nothing
// *****************************************************************
- (void) dispChenge2rate
{
	if ( self.m_rateViewController == nil)
	{
		self.m_rateViewController = [[rateViewController alloc] init];
		[self addChildViewController:self.m_rateViewController];
		[self.m_rateViewController didMoveToParentViewController:self];
		
		CGRect  frame = self.view.frame;
		frame.origin = CGPointMake(0.0, 0.0);
		self.m_rateViewController.view.frame = frame;
	}
	
	[self transitionFromViewController:m_nowDispVC
					  toViewController:self.m_rateViewController
							  duration:0.8
							   options:UIViewAnimationOptionTransitionFlipFromLeft
							animations:NULL
							completion:NULL];
	
	m_nowDispVC = self.m_rateViewController;
}

// *****************************************************************
//	@brief	Change to leverage view
//	@note
//		Nothing
// *****************************************************************
- (void) dispChenge2leverage
{
	if ( self.m_leverageViewController == nil)
	{
		self.m_leverageViewController = [[leverageViewController alloc] init];
		[self addChildViewController:self.m_leverageViewController];
		[self.m_leverageViewController didMoveToParentViewController:self];
		
		CGRect  frame = self.view.frame;
		frame.origin = CGPointMake(0.0, 0.0);
		self.m_leverageViewController.view.frame = frame;
	}
	
	[self transitionFromViewController:m_nowDispVC
					  toViewController:self.m_leverageViewController
							  duration:0.8
							   options:UIViewAnimationOptionTransitionFlipFromLeft
							animations:NULL
							completion:NULL];
	
	m_nowDispVC = self.m_leverageViewController;
}

// *****************************************************************
//	@brief	Change to leverage view
//	@note
//		Nothing
// *****************************************************************
- (void) dispChenge2lot
{
	if ( self.m_lotViewController == nil)
	{
		self.m_lotViewController = [[lotViewController alloc] init];
		[self addChildViewController:self.m_lotViewController];
		[self.m_lotViewController didMoveToParentViewController:self];
		
		CGRect  frame = self.view.frame;
		frame.origin = CGPointMake(0.0, 0.0);
		self.m_lotViewController.view.frame = frame;
	}
	
	[self transitionFromViewController:m_nowDispVC
					  toViewController:self.m_lotViewController
							  duration:0.8
							   options:UIViewAnimationOptionTransitionFlipFromLeft
							animations:NULL
							completion:NULL];
	
	m_nowDispVC = self.m_lotViewController;
}
@end
