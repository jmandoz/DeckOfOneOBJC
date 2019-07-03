//
//  DVMCard.h
//  DeckOfOneOBJC
//
//  Created by Jason Mandozzi on 7/2/19.
//  Copyright © 2019 Jason Mandozzi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DVMCard : NSObject

@property (nonatomic, copy, readonly) NSString *suit;

@property (nonatomic, copy, readonly) NSString *image;

-(instancetype)initWithName:(NSString *)name
                      image:(NSString *)image;
@end

@interface DVMCard (JSONConvertable)

-(instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)topLevelDictionary;

@end


NS_ASSUME_NONNULL_END
