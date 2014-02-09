//
//  BRYEqualsBuilder.h
//  BRYEqualsBuilder
//
//  Created by Bryan Irace on 2/9/14.
//  Copyright (c) 2014 Bryan Irace. All rights reserved.
//

@import Foundation;
@import CoreGraphics;

/// http://commons.apache.org/proper/commons-lang/apidocs/org/apache/commons/lang3/builder/EqualsBuilder.html
@interface BRYEqualsBuilder : NSObject

@property (nonatomic, readonly, getter = isEqual) BOOL equal;

+ (instancetype)builder;

- (BRYEqualsBuilder *)appendObject:(id)object otherObject:(id)otherObject;

- (BRYEqualsBuilder *)appendInteger:(NSInteger)integer otherInteger:(NSInteger)otherInteger;

- (BRYEqualsBuilder *)appendUnsignedInteger:(NSUInteger)unsignedInteger otherUnsignedInteger:(NSInteger)otherUnsignedInteger;

- (BRYEqualsBuilder *)appendBool:(BOOL)boolean otherBool:(BOOL)otherBoolean;

- (BRYEqualsBuilder *)appendFloat:(CGFloat)floatValue otherFloat:(CGFloat)otherFloatValue;

@end
