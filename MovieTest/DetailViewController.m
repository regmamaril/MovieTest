//
//  DetailViewController.m
//  MovieTest
//
//  Created by REGE on 17/11/2017.
//  Copyright © 2017 REG. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.movieBackdrop.image = [UIImage imageWithCIImage:[CIImage imageWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://aacayaco.github.io/movielist/images/%@-backdrop.jpg",self.detailItem.slug]]]];
        self.moviePoster.image = [UIImage imageWithCIImage:[CIImage imageWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://aacayaco.github.io/movielist/images/%@-cover.jpg",self.detailItem.slug]]]];
        self.titleLbl.text = self.detailItem.title;
        self.yearLbl.text = [NSString stringWithFormat:@"%@",self.detailItem.year];
        self.ratingsLbl.text = [NSString stringWithFormat:@"%.0f/10",round([self.detailItem.rating doubleValue])];
        self.overviewTextView.text = self.detailItem.overview;
        self.overlayLbl.hidden = NO;
    } else {
        self.overlayLbl.hidden = YES;
        self.overviewTextView.textAlignment = NSTextAlignmentCenter;
        self.overviewTextView.text = @"Select a movie";
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Managing the detail item

- (void)setDetailItem:(Movie *)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}


@end
