//
//  LSCPerson.m
//  Star Wars Search ObjC
//
//  Created by Spencer Curtis on 9/30/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "LSCPerson.h"

@implementation LSCPerson

- (instancetype)initWithName:(NSString *)name birthYear:(NSString *)birthYear height:(NSString *)height eyeColor:(NSString *)eyeColor
{
    self = [super init];
    if (self) {
        _name = [name copy];
        _birthYear = [birthYear copy];
        _height = [height copy];
        _eyeColor = [eyeColor copy];
    }
    return self;
}

// creates an init from dictionary that decodes our JSON into this type from a dictionary with the keys for the objects. Note that the keys here are the names from the JSON. 
- (instancetype)initWithDictionary:(NSDictionary *) dictionary
{
    NSString *name = dictionary[@"name"];
    NSString *birthYear = dictionary[@"birth_year"];
    NSString *height = dictionary[@"height"];
    NSString *eyeColor = dictionary[@"eye_color"];
    
    return [self initWithName:name birthYear:birthYear height:height eyeColor:eyeColor];
}

@end
