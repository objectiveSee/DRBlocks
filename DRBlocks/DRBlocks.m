//
//  DRBlocks.m
//  DRBlocks
//
//  Created by Danny Ricciotti on 9/17/14.
//  Copyright (c) 2014 Danny Ricciotti. All rights reserved.
//

#import "DRBlocks.h"

#pragma mark - Interface

@interface DRBlocks ()

@property (nonatomic) NSMapTable *blocksHash;

- (NSArray *)blocksForKey:(NSString *)key;

@end

#pragma mark - Implementation

@implementation DRBlocks

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.blocksHash = [NSMapTable new];
    }
    return self;
}

+ (instancetype)sharedBlocks {
    
    static DRBlocks *blockSingleton = nil;
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        blockSingleton = [[DRBlocks alloc] init];
    });
    return blockSingleton;
}

- (void)addBlock:(id)block forKey:(NSString *)key {
    
    if ( block ) {
        
        NSMutableArray *arr = [self.blocksHash objectForKey:key];
        if ( !arr ) {
            arr = [NSMutableArray arrayWithCapacity:1];
        }
        [arr addObject:[block copy]];
        [self.blocksHash setObject:arr forKey:key];
    }
}

- (NSArray *)blocksForKey:(NSString *)key
{
    return [self.blocksHash objectForKey:key];
}

- (void)clearBlocksForKey:(NSString *)key {
    [self.blocksHash removeObjectForKey:key];
}

- (void)consumeBlocksForKey:(NSString *)key handler:(void (^)(id block))handler {
    
    if ( handler ) {
        
        NSArray *blocks = [self blocksForKey:key];
        [blocks enumerateObjectsUsingBlock:^(id userBlock, NSUInteger idx, BOOL *stop) {
            
            handler(userBlock);
            
        }];
        
    }
    
    [self clearBlocksForKey:key];
}

@end
