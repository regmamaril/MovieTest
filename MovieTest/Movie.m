//
//  Movie.m
//  MovieTest
//
//  Created by REGE on 17/11/2017.
//  Copyright © 2017 REG. All rights reserved.
//

#import "Movie.h"

@implementation Movie

- (nonnull id)initWithDictionary:(nonnull NSDictionary *)info {
    self = [super init];
    if (self) {
        _movieId    = info[@"id"];
        _rating     = info[@"rating"];
        _titleLong  = info[@"title_long"];
        _state      = info[@"state"];
        _url        = info[@"url"];
        _runtime    = info[@"runtime"];
        _title      = info[@"title"];
        _overview   = info[@"overview"];
        _mpaRating  = info[@"mpa_rating"];
        _language   = info[@"language"];
        _imdbCode   = info[@"imdb_code"];
        _year       = info[@"year"];
        _genres     = info[@"genres"];
        _slug       = info[@"slug"];
    }
    return self;
}

@end
