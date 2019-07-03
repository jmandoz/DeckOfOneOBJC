//
//  DVMCardController.h
//  DeckOfOneOBJC
//
//  Created by Jason Mandozzi on 7/2/19.
//  Copyright © 2019 Jason Mandozzi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class DVMCard;

NS_ASSUME_NONNULL_BEGIN

@interface DVMCardController : NSObject

+ (DVMCardController *)sharedInstance;

+(void)drawANewCard:(void(^) (NSArray<DVMCard *> *cards))completion;

+(void)fetchImageFromCard:(DVMCard *)card completion:(void (^) (UIImage* ))completion;

@end

NS_ASSUME_NONNULL_END
