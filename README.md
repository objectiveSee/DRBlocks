# DRBlocks <img src="http://i.imgur.com/qloLGM8.png" alt="DRBlocks" title="DRBlocks">

Convenient way to work with multiple blocks in Objective-C.  Makes the management of multiple completion blocks a lot easier.

## Using DRBlocks in your App

Add a blocks to DRBlocks.

```objective-c

[[DRBlocks sharedBlocks] addBlock:^(NSString *a, NSString *b) {

  NSLog(@"Block 1: %@ %@", a, b);

} forKey:@"test"];

[[DRBlocks sharedBlocks] addBlock:^(NSString *a, NSString *b) {

  NSLog(@"Block 2: %@ %@", a, b);

} forKey:@"test"];
    
```

Consuming the blocks is easy. You call `consumeBlocksForKey:handler:` and you will be given each block. Then, just call the block with the parameters you need to pass to it.

```objective-c
[[DRBlocks sharedBlocks] consumeBlocksForKey:@"test" handler:^(NSString *a, NSString *b block) {

  // call your block! Gaurenteed not to be nil.
  block(@"hello",@"world");

}];
```

## Reason for Existence 

Sometimes you design an Obj-C class that needs to store multiple blocks which will be called at a later time. For example, you design a location manager that calls blocks when the user's location has been determined:

```objc
- (void)getUserLocationWithCompletion:(void (^)(CLLocation *location, NSError * error))blockName;
```

To properly implement the above method, you need to support the case where `getUserLocationWithCompletion:` is called many times before the location is determined. Internally, you will probably create an `NSMutableArray` and add each block to the array. 

When the user's location is finally know, you will enumerate the array of pending completion blocks and call each one, and then finally remove the blocks from the array.

I have used this design pattern enough times that I decided it was time to create an [CocoaPod](http://cocoapods.org) that handles all of this for me. 

## Installation with CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like AFNetworking in your projects. See the ["Getting Started" guide for more information](https://github.com/AFNetworking/AFNetworking/wiki/Getting-Started-with-AFNetworking).

```ruby
pod "DRBlocks", "~> 0.0.1"
```

If you don't use CocoaPods, then add DRBlocks.h and DRBlocks.m to your project.

## Feedback

Contact me via Twitter [@topwobble](https://twitter.com/topwobble) 
