//
//  Movie.h
//  MovieTest
//
//  Created by REGE on 17/11/2017.
//  Copyright © 2017 REG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property(strong, nonatomic, nonnull) NSString *rating;
@property(strong, nonatomic, nonnull) NSString *movieId;
@property(strong, nonatomic, nonnull) NSString *titleLong;
@property(strong, nonatomic, nonnull) NSString *state;
@property(strong, nonatomic, nonnull) NSString *url;
@property(strong, nonatomic, nonnull) NSString *runtime;
@property(strong, nonatomic, nonnull) NSString *title;
@property(strong, nonatomic, nonnull) NSString *overview;
@property(strong, nonatomic, nonnull) NSString *mpaRating;
@property(strong, nonatomic, nonnull) NSString *language;
@property(strong, nonatomic, nonnull) NSString *imdbCode;
@property(strong, nonatomic, nonnull) NSString *year;
@property(strong, nonatomic, nonnull) NSArray<NSString *>  *genres;
@property(strong, nonatomic, nonnull) NSString *slug;

- (nonnull id)initWithDictionary:(nonnull NSDictionary *)info;

@end
