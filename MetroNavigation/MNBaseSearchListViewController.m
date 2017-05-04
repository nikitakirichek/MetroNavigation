//
//  MNBaseSearchListViewController.m
//  MetroNavigation
//
//  Created by Nikita Kirichek on 5/2/17.
//  Copyright © 2017 Nikita Kirichek. All rights reserved.
//

#import "MNBaseSearchListViewController.h"


#import "CityTableViewCell.h"
#import "MNDataAPI.h"

@interface MNBaseSearchListViewController () <UISearchBarDelegate, UISearchResultsUpdating>


@property (nonatomic, strong) UISearchController *searchController;

@property (nonatomic, strong) NSArray <NSString *> *namesForTableView;
@property (nonatomic, strong) NSArray <NSString *> *filteredNamesForTableView;

@end


@implementation MNBaseSearchListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configSearchController];
}

- (void)viewWillAppear:(BOOL)animated {
    self.namesForTableView = self.contentForTableView.allKeys;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// MARK: - UISearchResultsUpdating

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self isPresentingFilteredList] ? self.filteredNamesForTableView.count : self.namesForTableView.count;
}

// MARK: - UISearchResultsUpdating

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    [self filterContentsForSeachText:searchController.searchBar.text];
}

// MARK: - Filtering

- (void)filterContentsForSeachText:(NSString *)seachedText {
    NSPredicate *namePredicate = [NSPredicate predicateWithFormat:@"self contains[cd] %@", seachedText];
    self.filteredNamesForTableView =  [self.namesForTableView filteredArrayUsingPredicate:namePredicate];
    [self.tableView reloadData];
}

- (BOOL)isPresentingFilteredList {
    return self.searchController.isActive && ![self.searchController.searchBar.text isEqualToString:@""];
}

- (NSString *)nameForIndexPath:(NSIndexPath *)indexPath {
    return [self isPresentingFilteredList] ? self.filteredNamesForTableView[indexPath.row] : self.namesForTableView[indexPath.row];
}

- (id)contentForIndexPath:(NSIndexPath *)indexPath {
    NSString *nameForIndexPath =  [self isPresentingFilteredList] ? self.filteredNamesForTableView[indexPath.row] : self.namesForTableView[indexPath.row];
    return self.contentForTableView[nameForIndexPath];
}

- (void)configSearchController {
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.searchResultsUpdater = self;
    self.searchController.dimsBackgroundDuringPresentation = NO;
    self.tableView.tableHeaderView = self.searchController.searchBar;
}


@end
