//
//  ViewController.m
//  SubSectionsDemo
//
//  Created by Don Mag on 9/30/21.
//

#import "ViewController.h"
#import "MultiSectionTableViewController.h"

@interface ViewController ()
{
	UIStackView *btnStack;
	NSArray *subs;
	BOOL firstView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	firstView = YES;
	
	btnStack = [UIStackView new];
	btnStack.axis = UILayoutConstraintAxisVertical;
	btnStack.spacing = 40;
	btnStack.translatesAutoresizingMaskIntoConstraints = NO;
	
	UILabel *prompt = [UILabel new];
	prompt.text = @"Section 1 sub-counts:";
	prompt.textAlignment = NSTextAlignmentCenter;
	[btnStack addArrangedSubview:prompt];
	
	subs = @[
		@[@2, @2],
		@[@2, @4, @3],
		@[@4, @7, @2, @5],
	];
	
	for (NSArray *a in subs) {
		UIButton *b = [UIButton new];
		[b setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
		[b setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
		[b setBackgroundColor:[UIColor redColor]];
		[b setTitle:[a componentsJoinedByString:@", "] forState:UIControlStateNormal];
		[b.layer setCornerRadius:8.0];
		[b addTarget:self action:@selector(btnTapped:) forControlEvents:UIControlEventTouchUpInside];
		[btnStack addArrangedSubview:b];
	}
	
	[self.view addSubview:btnStack];
	
	UILayoutGuide *g = [self.view safeAreaLayoutGuide];
	
	[NSLayoutConstraint activateConstraints:@[
		
		[btnStack.leadingAnchor constraintEqualToAnchor:g.leadingAnchor constant:40.0],
		[btnStack.trailingAnchor constraintEqualToAnchor:g.trailingAnchor constant:-40.0],
		[btnStack.centerYAnchor constraintEqualToAnchor:g.centerYAnchor],
		
	]];
	
}

- (void) btnTapped:(UIButton *)sender {
	NSInteger idx = [btnStack.arrangedSubviews indexOfObject:sender] - 1;
	MultiSectionTableViewController *vc = [MultiSectionTableViewController new];
	vc.subCounts = subs[idx];
	[self.navigationController pushViewController:vc animated:YES];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	if (firstView) {
		firstView = NO;
		
		UIAlertController * alert = [UIAlertController
									 alertControllerWithTitle:@"Please Note"
									 message:@"This is Example Code Only and should not be considered \"Production Ready\""
									 preferredStyle:UIAlertControllerStyleAlert];
		
		UIAlertAction* okButton = [UIAlertAction
								   actionWithTitle:@"OK"
								   style:UIAlertActionStyleDefault
								   handler:^(UIAlertAction * action) {
		}];
		
		[alert addAction:okButton];
		
		[self presentViewController:alert animated:YES completion:nil];

	}
}
@end
