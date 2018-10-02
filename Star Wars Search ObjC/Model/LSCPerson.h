//
//  LSCPerson.h
//  Star Wars Search ObjC
//
//  Created by Spencer Curtis on 9/30/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSCPerson : NSObject

- (instancetype)initWithName:(NSString *)name birthYear:(NSString *)birthYear height:(NSString *)height eyeColor:(NSString *)eyeColor;
- (instancetype)initWithDictionary:(NSDictionary *) dictionary;

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *birthYear;
@property (nonatomic, copy, readonly) NSString *height;
@property (nonatomic, copy, readonly) NSString *eyeColor;

@end

NS_ASSUME_NONNULL_END
