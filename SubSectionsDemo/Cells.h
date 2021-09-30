//
//  Cells.h
//  SubSectionsDemo
//
//  Created by Don Mag on 9/30/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FooCell : UITableViewCell
@property (strong, nonatomic) UILabel *fooLabel;
@property (strong, nonatomic) UILabel *barLabel;
@end

@interface SubCell : UITableViewCell
@property (strong, nonatomic) UILabel *subLabel;
@end

@interface SubHeaderCell : UITableViewCell
@property (strong, nonatomic) UILabel *subHeaderLabel;
@property (strong, nonatomic) UIImageView *arrowImageView;
@end

@interface SpinnerCell : UITableViewCell
@property (strong, nonatomic) UIActivityIndicatorView *spinner;
@end

NS_ASSUME_NONNULL_END
