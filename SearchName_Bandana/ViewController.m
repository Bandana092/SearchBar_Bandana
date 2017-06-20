//
//  ViewController.m
//  SearchName_Bandana
//
//  Created by Bandana Choudhury on 18/06/17.
//  Copyright © 2017 Omniroid. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableview.dataSource =self;
    self.tableview.delegate = self;
    self.nameArr = [[NSMutableArray alloc]initWithObjects:@"Munu",@"Kunu",@"chunu",@"runu",@"chinku", nil];
    self.filterArr = [[NSArray alloc]init];
    self.sc = [[UISearchController alloc]initWithSearchResultsController:nil];
    self.tableview.tableHeaderView = self.sc.searchBar;
    self.sc.searchResultsUpdater = self;

    
}
-(void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    NSLog(@"%@",searchController.searchBar.text);
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF beginswith [c] %@",searchController.searchBar.text];
    self.filterArr = [self.nameArr filteredArrayUsingPredicate:predicate];
    NSLog(@"%@",self.filterArr );
    [self.tableview reloadData];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.sc.active == YES) {
        return  self.filterArr.count;
    }else{
    return self.nameArr.count;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (self.sc.active == YES) {
        cell.textLabel.text = [self.filterArr objectAtIndex:indexPath.row];
    }else{
        cell.textLabel.text = [self.nameArr objectAtIndex:indexPath.row];
    }

        return cell;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
