//
//  BRYEqualsBuilder.h
//  BRYEqualsBuilder
//
//  Created by Bryan Irace on 2/9/14.
//  Copyright (c) 2014 Bryan Irace. All rights reserved.
//

@import Foundation;
@import CoreGraphics;

/**
 Utility for determining object equality, based on Apache Commons [EqualsBuilder](http://commons.apache.org/proper/commons-lang/apidocs/org/apache/commons/lang3/builder/EqualsBuilder.html). Useful for implemeting `-[NSObject isEqual:]` methods.
 
 - (BOOL)isEqual:(id)object {
     return [[[[[BRYEqualsBuilder builderComparingObject:self withObject:object]
                appendObject:self.name otherObject:other.name]
               appendBool:self.isHidden otherBool:other.isHidden]
              appendFloat:self.width otherFloat:other.width]
             appendInteger:self.index otherInteger:other.index].isEqual;
 }
 */
@interface BRYEqualsBuilder : NSObject

@property (nonatomic, readonly, getter = isEqual) BOOL equal;

/**
 Factory method for acquiring a `BRYEqualsBuilder` instance. If `object` and `otherObject` are the same instance, `isEqual` will always return `YES` regardless of what other values are appended to the builder. If `object` and `otherObject` are not instance of the same class, `isEqual` will always return `NO` regardless of what other values are appended to the builder.
 
 @param object One of the objects being compared
 @param otherObject The other object being compared
 @return `BRYEqualsBuilder` instance for determining equality between the two provided objects
 */
+ (instancetype)builderComparingObject:(id)object withObject:(id)otherObject;

+ (instancetype)builder;

- (BRYEqualsBuilder *)appendObject:(id)object otherObject:(id)otherObject;

- (BRYEqualsBuilder *)appendInteger:(NSInteger)integer otherInteger:(NSInteger)otherInteger;

- (BRYEqualsBuilder *)appendUnsignedInteger:(NSUInteger)unsignedInteger otherUnsignedInteger:(NSInteger)otherUnsignedInteger;

- (BRYEqualsBuilder *)appendBool:(BOOL)boolean otherBool:(BOOL)otherBoolean;

- (BRYEqualsBuilder *)appendFloat:(CGFloat)floatValue otherFloat:(CGFloat)otherFloatValue;

@end
