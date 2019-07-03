//
//  DVMCardController.m
//  DeckOfOneOBJC
//
//  Created by Jason Mandozzi on 7/2/19.
//  Copyright © 2019 Jason Mandozzi. All rights reserved.
//

#import "DVMCardController.h"
#import "DVMCard.h"

@implementation DVMCardController

static NSString * const baseURLString = @"https://deckofcardsapi.com/api/deck/new/draw/?count=1";

+ (DVMCardController *)sharedController
{
    static DVMCardController *sharedController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedController = [DVMCardController new];
    });
    return sharedController;
}

+ (void)drawANewCard:(void (^)(NSArray *))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:baseURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //Check for errors
        if (error) {
            NSLog(@"There was an error %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        if (response) {
            NSLog(@"%@", response);
        }
        if (data) {
            NSDictionary *Dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error: &error];
            if (!Dictionary) {
                NSLog(@"Error passing the JSON %@", error);
                completion(nil);
                return;
            }
            NSArray *cardsArray = Dictionary[@"cards"];
            
            NSMutableArray *cardsPlaceholder = [[NSMutableArray alloc]init];
            
            for (NSDictionary *dictionary in cardsArray)
            {
            
                DVMCard *card = [[DVMCard alloc] initWithDictionary:dictionary];
                [cardsPlaceholder addObject:card];
            }
            completion(cardsPlaceholder);
        }
            
    }] resume];
}

+ (void)fetchImageFromCard:(DVMCard *)card completion:(void (^)(UIImage *))completion
{
    NSURL *imageURL = [NSURL URLWithString: card.image];
    [[[NSURLSession sharedSession] dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"There was an error %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        if (response) {
            NSLog(@"%@", response);
        }
        if (data) {
            UIImage *image = [UIImage imageWithData:data];
            completion(image);
        }
    }] resume];
}


@end
