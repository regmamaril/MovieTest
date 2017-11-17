//
//  DetailViewController.h
//  MovieTest
//
//  Created by REGE on 17/11/2017.
//  Copyright © 2017 REG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Movie *detailItem;
@property (weak, nonatomic) IBOutlet UIImageView *movieBackdrop;
@property (weak, nonatomic) IBOutlet UIImageView *moviePoster;
@property (weak, nonatomic) IBOutlet UILabel     *titleLbl;
@property (weak, nonatomic) IBOutlet UILabel     *yearLbl;
@property (weak, nonatomic) IBOutlet UILabel     *ratingsLbl;
@property (weak, nonatomic) IBOutlet UITextView  *overviewTextView;

@property (weak, nonatomic) IBOutlet UILabel     *overlayLbl;

@end

