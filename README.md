# BRYEqualsBuilder

Utility for determining object equality, based on Apache Commons [EqualsBuilder](http://commons.apache.org/proper/commons-lang/apidocs/org/apache/commons/lang3/builder/EqualsBuilder.html).

```objectivec
- (BOOL)isEqual:(id)object {
    if (self == object)                         return YES;
    if (![object isKindOfClass:[self class]])   return NO;


    return [[[[[[BRYEqualsBuilder builder]
                appendObject:self.name otherObject:other.name]
               appendBool:self.isHidden otherBool:other.isHidden]
              appendFloat:self.width otherFloat:other.width]
             appendInteger:-1 otherInteger:-1].isEqual;
}
```

## License

Available for use under the MIT license: [http://bryan.mit-license.org](http://bryan.mit-license.org)
