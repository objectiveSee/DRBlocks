//
//  DRBlocks.h
//  DRBlocks
//
//  Created by Danny Ricciotti on 9/17/14.
//  Copyright (c) 2014 Danny Ricciotti. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DRBlocks : NSObject

+ (instancetype)sharedBlocks;

- (void)addBlock:(id)block forKey:(NSString *)key;

- (void)consumeBlocksForKey:(NSString *)key handler:(void (^)(id block))handler;

- (void)clearBlocksForKey:(NSString *)key;

@end
