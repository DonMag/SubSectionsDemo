//
//  MultiSectionTableViewController.m
//  SubSectionsDemo
//
//  Created by Don Mag on 9/30/21.
//

#import "MultiSectionTableViewController.h"
#import "Cells.h"
#import "CellDataObject.h"

@interface MultiSectionTableViewController ()
{
	UIImage *expandedArrow;
	UIImage *collapsedArrow;
	NSMutableArray <CellDataObject*>*myData;
	NSMutableArray <CellDataObject*>*curData;
	NSArray *fooCounts;
}
@end

@implementation MultiSectionTableViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	// counts of rows for sections 2, 3, 4
	fooCounts = @[@3, @5, @4];
	
	// up and down arrows
	expandedArrow = [UIImage systemImageNamed:@"arrowtriangle.up.fill"];
	collapsedArrow = [UIImage systemImageNamed:@"arrowtriangle.down.fill"];
	
	curData = [NSMutableArray new];
	myData = [NSMutableArray new];
	
	[self.tableView registerClass:SpinnerCell.class forCellReuseIdentifier:@"spinnerCell"];
	[self.tableView registerClass:FooCell.class forCellReuseIdentifier:@"fooCell"];
	[self.tableView registerClass:SubCell.class forCellReuseIdentifier:@"subCell"];
	[self.tableView registerClass:SubHeaderCell.class forCellReuseIdentifier:@"subHeaderCell"];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	
	// Delay approx 1 seconds to simulate fetching data
	__weak typeof(self) weakSelf = self;
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
		typeof(weakSelf) strongSelf = weakSelf;  // strong by default
		if (strongSelf) {
			[strongSelf fetchData];
		}
	});
}

- (void) fetchData {
	
	// fill myData array with sample objects
	//	based on subCounts array passed from the
	//	"menu" view controller
	
	CellDataObject *ob;
	
	for (int i = 0; i < _subCounts.count; i++) {
		ob = [CellDataObject new];
		ob.title = [NSString stringWithFormat:@"Sub Section %d", i + 1];
		ob.type = 0;
		ob.expanded = NO;
		[myData addObject:ob];
		for (int j = 0; j < [_subCounts[i] intValue]; j++) {
			ob = [CellDataObject new];
			ob.title = [NSString stringWithFormat:@"Sub Cell %d - %d", i + 1, j + 1];
			ob.type = 1;
			[myData addObject:ob];
		}
	}
	
	[self updateCurData];
	
}

- (void) updateCurData {
	BOOL isExpanded = NO;
	// clear curData array
	[curData removeAllObjects];
	// loop through myData, adding objects where needed
	//	always add the "sub header" object
	//	only add "sub objects" if header is expanded
	for (CellDataObject *ob in myData) {
		if (ob.type == 0) {
			[curData addObject:ob];
			isExpanded = ob.expanded;
		} else {
			if (isExpanded) {
				[curData addObject:ob];
			}
		}
	}
	[self.tableView reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	// if it's in the first section
	if (indexPath.section == 0) {
		// if it's a "sub header" row
		if (curData[indexPath.row].type == 0) {
			// toggle expanded state
			curData[indexPath.row].expanded = !curData[indexPath.row].expanded;
		}
		[self updateCurData];
	}
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	NSString *s;
	if (section == 0) {
		s = @"Section 1 with Sub Sections";
	} else {
		s = [NSString stringWithFormat:@"Section %ld", section + 1];
	}
	return [s uppercaseString];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	// if it's the first section
	if (section == 0) {
		// if we don't have any "sub section" data yet
		if (curData.count == 0) {
			return 1;
		}
		return curData.count;
	}
	return [fooCounts[section - 1] intValue];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	// if it's the first section
	if (indexPath.section == 0) {
		// if we don't have any "sub section" data yet
		if (curData.count == 0) {
			// show spinner cell
			SpinnerCell *c = (SpinnerCell *)[tableView dequeueReusableCellWithIdentifier:@"spinnerCell" forIndexPath:indexPath];
			[c.spinner startAnimating];
			return  c;
		}
		// get data object
		CellDataObject *ob = curData[indexPath.row];
		// if it's a "sub header" object
		if (ob.type == 0) {
			SubHeaderCell *c = (SubHeaderCell *)[tableView dequeueReusableCellWithIdentifier:@"subHeaderCell" forIndexPath:indexPath];
			c.subHeaderLabel.text = ob.title;
			c.arrowImageView.image = ob.expanded ? expandedArrow : collapsedArrow;
			return  c;
		}
		// it's a "sub section" object
		SubCell *c = (SubCell *)[tableView dequeueReusableCellWithIdentifier:@"subCell" forIndexPath:indexPath];
		c.subLabel.text = ob.title;
		return  c;
	}
	// remaining sections
	FooCell *c = (FooCell *)[tableView dequeueReusableCellWithIdentifier:@"fooCell" forIndexPath:indexPath];
	c.fooLabel.text = [NSString stringWithFormat:@"Foo %ld - %ld", indexPath.section + 1, indexPath.row + 1];
	c.barLabel.text = [NSString stringWithFormat:@"Bar %ld - %ld", indexPath.section + 1, indexPath.row + 1];
	return  c;
}

@end
