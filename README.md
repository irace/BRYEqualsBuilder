# BRYEqualsBuilder

Utility for determining object equality, based on Apache Commons [EqualsBuilder](http://commons.apache.org/proper/commons-lang/apidocs/org/apache/commons/lang3/builder/EqualsBuilder.html).

```objectivec
- (BOOL)isEqual:(id)object {
    return [[[[[BRYEqualsBuilder builderComparingObject:self withObject:object]
               appendObject:self.name otherObject:other.name]
              appendBool:self.isHidden otherBool:other.isHidden]
             appendFloat:self.width otherFloat:other.width]
            appendInteger:self.index otherInteger:other.index].isEqual;
}
```

## License

Available for use under the MIT license: [http://bryan.mit-license.org](http://bryan.mit-license.org)
