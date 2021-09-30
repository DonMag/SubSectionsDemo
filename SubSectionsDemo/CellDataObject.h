//
//  CellDataObject.h
//  SubSectionsDemo
//
//  Created by Don Mag on 9/30/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CellDataObject : NSObject
@property (strong, nonatomic) NSString *title;
@property (assign, readwrite) NSInteger type;
@property (assign, readwrite) BOOL expanded;
@end

NS_ASSUME_NONNULL_END
