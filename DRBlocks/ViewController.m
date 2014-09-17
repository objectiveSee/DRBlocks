//
//  ViewController.m
//  DRBlocks
//
//  Created by Danny Ricciotti on 9/17/14.
//  Copyright (c) 2014 Danny Ricciotti. All rights reserved.
//

#import "ViewController.h"
#import "DRBlocks.h"

typedef void (^TestBlockType)(NSString * a, NSString * b);

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    // Add three blocks for the "test" key, in two different ways:
    
    [self callThisInTwoSeconds:^(NSString * a, NSString *b) {
        NSLog(@"Block 1: %@ %@", a, b);
    }];
    [self callThisInTwoSeconds:^(NSString *a, NSString *b) {
        NSLog(@"Block 2: %@ %@", a, b);
    }];
    
    
    [[DRBlocks sharedBlocks] addBlock:^(NSString *a, NSString *b) {
        
        NSLog(@"Block 3: %@ %@", a, b);
        
    } forKey:@"test"];
    
    
    // Wait 2 seconds.
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        // Test that we can consume all of the blocks.
        // When you consume the blocks for a key, DRBlocks will pass you each block for that key and then let you call it.
        
        [[DRBlocks sharedBlocks] consumeBlocksForKey:@"test" handler:^(TestBlockType block) {
            
            // call your block! Gaurenteed not to be nil.
            
            block(@"hello",@"world");
            
        }];
        
    });
}

- (void)callThisInTwoSeconds:(TestBlockType)block
{
    [[DRBlocks sharedBlocks] addBlock:block forKey:@"test"];
}

@end
