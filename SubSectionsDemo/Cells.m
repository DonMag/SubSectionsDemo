//
//  Cells.m
//  SubSectionsDemo
//
//  Created by Don Mag on 9/30/21.
//

#import "Cells.h"

@implementation FooCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		[self commonInit];
	}
	return self;
}
- (void) commonInit {
	self.contentView.backgroundColor = [UIColor colorWithWhite:0.25 alpha:1.0];
	
	_fooLabel = [UILabel new];
	_barLabel = [UILabel new];
	
	_fooLabel.font = [UIFont systemFontOfSize:18.0 weight:UIFontWeightBold];
	_barLabel.font = [UIFont systemFontOfSize:14.0 weight:UIFontWeightBold];
	
	_fooLabel.textColor = [UIColor colorWithRed:0.25 green:0.5 blue:1.0 alpha:1.0];
	_barLabel.textColor = [UIColor colorWithWhite:0.75 alpha:1.0];
	
	_fooLabel.translatesAutoresizingMaskIntoConstraints = NO;
	_barLabel.translatesAutoresizingMaskIntoConstraints = NO;
	
	[self.contentView addSubview:_fooLabel];
	[self.contentView addSubview:_barLabel];
	
	UILayoutGuide *g = [self.contentView layoutMarginsGuide];
	
	[NSLayoutConstraint activateConstraints:@[
		
		[_fooLabel.topAnchor constraintEqualToAnchor:g.topAnchor constant:0.0],
		[_fooLabel.leadingAnchor constraintEqualToAnchor:g.leadingAnchor constant:0.0],
		[_fooLabel.trailingAnchor constraintEqualToAnchor:g.trailingAnchor constant:0.0],
		
		[_barLabel.topAnchor constraintEqualToAnchor:_fooLabel.bottomAnchor constant:6.0],
		[_barLabel.leadingAnchor constraintEqualToAnchor:g.leadingAnchor constant:0.0],
		[_barLabel.trailingAnchor constraintEqualToAnchor:g.trailingAnchor constant:0.0],
		
		[_barLabel.bottomAnchor constraintEqualToAnchor:g.bottomAnchor constant:0.0],
		
	]];
	
}

@end

@implementation SubCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		[self commonInit];
	}
	return self;
}
- (void) commonInit {
	self.contentView.backgroundColor = [UIColor colorWithWhite:0 alpha:1.0];
	
	_subLabel = [UILabel new];
	
	_subLabel.font = [UIFont systemFontOfSize:18.0 weight:UIFontWeightRegular];
	
	_subLabel.textColor = [UIColor whiteColor];
	
	_subLabel.translatesAutoresizingMaskIntoConstraints = NO;
	
	[self.contentView addSubview:_subLabel];
	
	UILayoutGuide *g = [self.contentView layoutMarginsGuide];
	
	[NSLayoutConstraint activateConstraints:@[
		
		[_subLabel.topAnchor constraintEqualToAnchor:g.topAnchor constant:0.0],
		[_subLabel.leadingAnchor constraintEqualToAnchor:g.leadingAnchor constant:0.0],
		[_subLabel.trailingAnchor constraintEqualToAnchor:g.trailingAnchor constant:0.0],
		[_subLabel.bottomAnchor constraintEqualToAnchor:g.bottomAnchor constant:0.0],
		
	]];
	
}

@end

@implementation SubHeaderCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		[self commonInit];
	}
	return self;
}
- (void) commonInit {
	self.contentView.backgroundColor = [UIColor colorWithWhite:0.2 alpha:1.0];
	
	_subHeaderLabel = [UILabel new];
	_arrowImageView = [UIImageView new];
	
	_subHeaderLabel.font = [UIFont systemFontOfSize:20.0 weight:UIFontWeightBold];
	
	_subHeaderLabel.textColor = [UIColor whiteColor];
	
	_arrowImageView.tintColor = [UIColor whiteColor];
	
	_subHeaderLabel.translatesAutoresizingMaskIntoConstraints = NO;
	_arrowImageView.translatesAutoresizingMaskIntoConstraints = NO;
	
	[self.contentView addSubview:_subHeaderLabel];
	[self.contentView addSubview:_arrowImageView];
	
	UILayoutGuide *g = [self.contentView layoutMarginsGuide];
	
	[NSLayoutConstraint activateConstraints:@[
		
		[_subHeaderLabel.topAnchor constraintEqualToAnchor:g.topAnchor constant:0.0],
		[_subHeaderLabel.leadingAnchor constraintEqualToAnchor:g.leadingAnchor constant:0.0],
		[_subHeaderLabel.bottomAnchor constraintEqualToAnchor:g.bottomAnchor constant:0.0],
		
		[_arrowImageView.trailingAnchor constraintEqualToAnchor:g.trailingAnchor constant:0.0],
		[_arrowImageView.widthAnchor constraintEqualToConstant:22.0],
		[_arrowImageView.heightAnchor constraintEqualToAnchor:_arrowImageView.widthAnchor],
		[_arrowImageView.centerYAnchor constraintEqualToAnchor:g.centerYAnchor],
		
		[_subHeaderLabel.trailingAnchor constraintEqualToAnchor:_arrowImageView.leadingAnchor constant:-8.0],
		
	]];
	
}

@end

@implementation SpinnerCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		[self commonInit];
	}
	return self;
}
- (void) commonInit {
	self.contentView.backgroundColor = [UIColor colorWithWhite:0.2 alpha:1.0];
	
	_spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge];
	
	_spinner.color = [UIColor whiteColor];
	
	_spinner.translatesAutoresizingMaskIntoConstraints = NO;
	
	[self.contentView addSubview:_spinner];
	
	UILayoutGuide *g = [self.contentView layoutMarginsGuide];
	
	[NSLayoutConstraint activateConstraints:@[
		
		[_spinner.topAnchor constraintEqualToAnchor:g.topAnchor constant:8.0],
		[_spinner.bottomAnchor constraintEqualToAnchor:g.bottomAnchor constant:-8.0],
		[_spinner.centerXAnchor constraintEqualToAnchor:g.centerXAnchor],
		
	]];
	
	[_spinner startAnimating];
}

@end
