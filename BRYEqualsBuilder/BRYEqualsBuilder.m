//
//  BRYEqualsBuilder.m
//  BRYEqualsBuilder
//
//  Created by Bryan Irace on 2/9/14.
//  Copyright (c) 2014 Bryan Irace. All rights reserved.
//

#import "BRYEqualsBuilder.h"

@interface BRYImmutableEqualsBuilder : BRYEqualsBuilder

- (instancetype)initWithEquality:(BOOL)equal;

@end

@interface BRYEqualsBuilder()

@property (nonatomic, getter = isEqual) BOOL equal;

@end

@implementation BRYEqualsBuilder

#pragma mark - Initialization

+ (instancetype)builderComparingObject:(id)object withObject:(id)otherObject {
    if (object == otherObject) {
        return [[BRYImmutableEqualsBuilder alloc] initWithEquality:YES];
    }
    else if (![otherObject isKindOfClass:[object class]]) {
        return [[BRYImmutableEqualsBuilder alloc] initWithEquality:NO];
    }
    
    return [[BRYEqualsBuilder alloc] init];
}

+ (instancetype)builder {
    return [[BRYEqualsBuilder alloc] init];
}

- (id)init {
    if (self = [super init]) {
        _equal = YES;
    }
    
    return self;
}

#pragma mark - Value comparison

- (BRYEqualsBuilder *)appendObject:(id)object otherObject:(id)otherObject {
    return [self incorporateValueEquality:((!object && !otherObject) || [object isEqual:otherObject])];
}

- (BRYEqualsBuilder *)appendInteger:(NSInteger)integer otherInteger:(NSInteger)otherInteger {
    return [self incorporateValueEquality:integer == otherInteger];
}

- (BRYEqualsBuilder *)appendUnsignedInteger:(NSUInteger)unsignedInteger otherUnsignedInteger:(NSInteger)otherUnsignedInteger {
    return [self incorporateValueEquality:unsignedInteger == otherUnsignedInteger];
}

- (BRYEqualsBuilder *)appendBool:(BOOL)boolean otherBool:(BOOL)otherBoolean {
    return [self incorporateValueEquality:boolean == otherBoolean];
}

- (BRYEqualsBuilder *)appendFloat:(CGFloat)floatValue otherFloat:(CGFloat)otherFloatValue {
    return [self incorporateValueEquality:floatValue == otherFloatValue];
}

#pragma mark - Private

- (BRYEqualsBuilder *)incorporateValueEquality:(BOOL)valueEquality {
    self.equal = self.equal && valueEquality;
    
    return self;
}

@end

@implementation BRYImmutableEqualsBuilder

- (instancetype)initWithEquality:(BOOL)equal {
    if (self = [super init]) {
        self.equal = equal;
    }
    
    return self;
}

- (id)init {
    return [self initWithEquality:NO];
}

- (BRYEqualsBuilder *)appendObject:(id)object otherObject:(id)otherObject {
    return self;
}

- (BRYEqualsBuilder *)appendInteger:(NSInteger)integer otherInteger:(NSInteger)otherInteger {
    return self;
}

- (BRYEqualsBuilder *)appendUnsignedInteger:(NSUInteger)unsignedInteger otherUnsignedInteger:(NSInteger)otherUnsignedInteger {
    return self;
}

- (BRYEqualsBuilder *)appendBool:(BOOL)boolean otherBool:(BOOL)otherBoolean {
    return self;
}

- (BRYEqualsBuilder *)appendFloat:(CGFloat)floatValue otherFloat:(CGFloat)otherFloatValue {
    return self;
}

@end
