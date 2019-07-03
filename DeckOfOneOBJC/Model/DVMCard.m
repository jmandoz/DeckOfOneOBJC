//
//  DVMCard.m
//  DeckOfOneOBJC
//
//  Created by Jason Mandozzi on 7/2/19.
//  Copyright © 2019 Jason Mandozzi. All rights reserved.
//

#import "DVMCard.h"

@implementation DVMCard

-(instancetype)initWithName:(NSString *)name image:(NSString *)image
{
self = [super init];
if (self != nil) {
    _suit = name;
    _image = image;
    }
    return self;
}


@end

@implementation DVMCard (JSONConvertable)

-(instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)Dictionary
{
    NSString *suit = Dictionary[@"suit"];
    NSString *image = Dictionary[@"image"];
    

    
    return [self initWithName:suit image:image];
}

@end
