//
//  MovieTableViewCell.h
//  MovieTest
//
//  Created by REGE on 17/11/2017.
//  Copyright © 2017 REG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel      *titleLbl;
@property (weak, nonatomic) IBOutlet UILabel      *yearLbl;
@property (weak, nonatomic) IBOutlet UIImageView  *movieBackdrop;

@end
