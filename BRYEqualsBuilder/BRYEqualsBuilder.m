//
//  BRYEqualsBuilder.m
//  BRYEqualsBuilder
//
//  Created by Bryan Irace on 2/9/14.
//  Copyright (c) 2014 Bryan Irace. All rights reserved.
//

#import "BRYEqualsBuilder.h"

@interface BRYEqualsBuilder()

@property (nonatomic, getter = isSameObject) BOOL sameObject;
@property (nonatomic, getter = isSameKindOfClass) BOOL sameKindOfClass;
@property (nonatomic, getter = isEqual) BOOL equal;

@end

@implementation BRYEqualsBuilder

#pragma mark - Initialization

+ (instancetype)builderComparingObject:(id)object withObject:(id)otherObject {
    return [[[self class] alloc] initWithObject:object otherObject:otherObject];
}

+ (instancetype)builder {
    return [[[self class] alloc] init];
}

- (id)initWithObject:(id)object otherObject:(id)otherObject {
    if (self = [super init]) {
        if (object && otherObject) {
            _sameObject = object == otherObject;
            _sameKindOfClass = [otherObject isKindOfClass:[object class]];
            
            _equal = _sameObject || !_sameKindOfClass;
        }
        else {
            _equal = YES;
        }
    }
    
    return self;
}

- (id)init {
    return [self initWithObject:nil otherObject:nil];
}

#pragma mark - Value comparison

- (BRYEqualsBuilder *)appendObject:(id)object otherObject:(id)otherObject {
    return [self incoroprateValueEquality:((!object && !otherObject) || [object isEqual:otherObject])];
}

- (BRYEqualsBuilder *)appendInteger:(NSInteger)integer otherInteger:(NSInteger)otherInteger {
    return [self incoroprateValueEquality:integer == otherInteger];
}

- (BRYEqualsBuilder *)appendUnsignedInteger:(NSUInteger)unsignedInteger otherUnsignedInteger:(NSInteger)otherUnsignedInteger {
    return [self incoroprateValueEquality:unsignedInteger == otherUnsignedInteger];
}

- (BRYEqualsBuilder *)appendBool:(BOOL)boolean otherBool:(BOOL)otherBoolean {
    return [self incoroprateValueEquality:boolean == otherBoolean];
}

- (BRYEqualsBuilder *)appendFloat:(CGFloat)floatValue otherFloat:(CGFloat)otherFloatValue {
    return [self incoroprateValueEquality:floatValue == otherFloatValue];
}

#pragma mark - Private

- (BRYEqualsBuilder *)incoroprateValueEquality:(BOOL)valueEquality {
    self.equal = self.equal && valueEquality;
    
    return self;
}

@end
