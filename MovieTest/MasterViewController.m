//
//  MasterViewController.m
//  MovieTest
//
//  Created by REGE on 17/11/2017.
//  Copyright © 2017 REG. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "Movie.h"
#import "MovieTableViewCell.h"

@interface MasterViewController ()
- (void)fetchMovies;

@property NSMutableArray *objects;
@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    [self fetchMovies];
}


- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Movie *movie = [[Movie alloc] initWithDictionary:[self.objects objectAtIndex:indexPath.row]];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        [controller setDetailItem:movie];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

#pragma mark - Implementation Methods
- (void)fetchMovies {
    NSString *path = @"https://aacayaco.github.io/movielist/list_movies_page1.json";
    NSURL *url = [NSURL URLWithString:path];
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    NSMutableDictionary *responseDic = [[NSMutableDictionary alloc] init];
    NSError *error = nil;
    
    if (data) {
        responseDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        if (!error) {
            self.objects = [[responseDic valueForKey:@"data"] valueForKey:@"movies"];
        } else {
            NSLog(@"%ld %@", error.code, error.localizedDescription);
        }
    } else {
        NSLog(@"%@", [responseDic valueForKey:@"status_message"] );
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    Movie *movie = [[Movie alloc] initWithDictionary:[self.objects objectAtIndex:indexPath.row]];
    cell.movieBackdrop.image = [UIImage imageWithCIImage:[CIImage imageWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://aacayaco.github.io/movielist/images/%@-backdrop.jpg",movie.slug]]]];
    cell.titleLbl.text = movie.title;
    cell.yearLbl.text = [NSString stringWithFormat:@"%@",movie.year];
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


@end
