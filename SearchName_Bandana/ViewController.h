//
//  ViewController.h
//  SearchName_Bandana
//
//  Created by Bandana Choudhury on 18/06/17.
//  Copyright © 2017 Omniroid. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchControllerDelegate,UISearchResultsUpdating>
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property NSMutableArray *nameArr;
@property NSArray *filterArr;

@property UISearchController  *sc;


@end

