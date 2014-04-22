//
//  SingletonTests.m
//
//  This is the parent class for unit testing singleton-by-choice objects.
//
//  Created by Ron Lisle on 4/22/14
//

#import <XCTest/XCTest.h>
#import "SingletonByChoice.h"

@interface SingletonTests : XCTestCase
@end


@implementation SingletonTests

#pragma mark - helper methods

- (SingletonByChoice *)createUniqueInstance {

    return [[SingletonByChoice alloc] init];
    
}

- (SingletonByChoice *)getSharedInstance {
    
    return [SingletonByChoice sharedInstance];
    
}

#pragma mark - tests

- (void)testSingletonSharedInstanceCreated {
    
    XCTAssertNotNil([self getSharedInstance]);

}

- (void)testSingletonUniqueInstanceCreated {
    
    XCTAssertNotNil([self createUniqueInstance]);
    
}

- (void)testSingletonReturnsSameSharedInstanceTwice {
    
    SingletonByChoice *s1 = [self getSharedInstance];
    XCTAssertEqual(s1, [self getSharedInstance]);
    
}

- (void)testSingletonSharedInstanceSeparateFromUniqueInstance {
    
    SingletonByChoice *s1 = [self getSharedInstance];
    XCTAssertNotEqual(s1, [self createUniqueInstance]);
}

- (void)testSingletonReturnsSeparateUniqueInstances {
    
    SingletonByChoice *s1 = [self createUniqueInstance];
    XCTAssertNotEqual(s1, [self createUniqueInstance]);
}

@end