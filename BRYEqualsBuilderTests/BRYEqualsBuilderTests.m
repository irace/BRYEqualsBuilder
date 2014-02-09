//
//  BRYEqualsBuilderTests.m
//  BRYEqualsBuilderTests
//
//  Created by Bryan Irace on 2/9/14.
//  Copyright (c) 2014 Bryan Irace. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BRYEqualsBuilder.h"

@interface BRYEqualsBuilderTests : XCTestCase
@end

@implementation BRYEqualsBuilderTests

- (void)testObjectsEqual {
    BOOL isEqual = [[BRYEqualsBuilder new]
                    appendObject:@"foo" otherObject:@"foo"].isEqual;
    
    XCTAssertTrue(isEqual, @"Objects should be equal");
}

- (void)testChainedValuesEqual {
    BOOL isEqual = [[[[[[BRYEqualsBuilder builder]
                        appendObject:@"foo" otherObject:@"foo"]
                       appendBool:YES otherBool:YES]
                      appendFloat:0.5 otherFloat:0.5]
                     appendInteger:-1 otherInteger:-1]
                    appendUnsignedInteger:4 otherUnsignedInteger:4].isEqual;
    
    XCTAssertTrue(isEqual, @"Values should be equal");
}

@end
