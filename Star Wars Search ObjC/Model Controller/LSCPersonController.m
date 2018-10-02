//
//  LSCPersonController.m
//  Star Wars Search ObjC
//
//  Created by Spencer Curtis on 9/30/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "LSCPersonController.h"
#import "LSCPerson.h"

@implementation LSCPersonController

- (void)searchForPeopleWithSearchTerm:(NSString *)searchTerm completion:(void (^)(NSArray *people, NSError *))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString]; // convenience init, bundled with the NSURL type
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    
    NSURLQueryItem *searchItem = [NSURLQueryItem queryItemWithName:@"search" value:searchTerm];
    [components setQueryItems:@[searchItem]];
    NSURL *url = [components URL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *r, NSError *error) {
        if (error) {
            NSLog(@"Error fetching data: %@", error);
            completion(nil, error);
            return;
        }
        
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL]; // NULL here doesn't check for errors // JSONSerialization can decode data into types labelled incorrectly if specified incorrectly
        if (![dictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSON was not a dictionary");
            completion(nil, [[NSError alloc] init]);
            return;
        }
        
        NSArray *personDictionaries = dictionary[@"results"]; // this assigns to an array (personDictionaries) the array contained within the dictionary (dictionary^) with the key "results"
        NSMutableArray *people = [[NSMutableArray alloc] init];
        for (NSDictionary *dictionary in personDictionaries) {
            LSCPerson *person = [[LSCPerson alloc] initWithDictionary:dictionary];
            [people addObject:person];
        }
        
        completion(people, nil);
        
    }] resume];
}

static NSString * const baseURLString = @"https://swapi.co/api/people";

@end
