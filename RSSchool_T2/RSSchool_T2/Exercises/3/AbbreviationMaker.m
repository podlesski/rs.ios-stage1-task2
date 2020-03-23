#import "AbbreviationMaker.h"

@implementation AbbreviationMaker
// Complete the abbreviation function below.
- (NSString *) abbreviationFromA:(NSString *)a toB:(NSString *)b {
    
    NSString *lowerCaseStringA = [a lowercaseString];
    NSString *lowerCaseStringB = [b lowercaseString];
    
    NSMutableArray *arrayA = [NSMutableArray array];
    for (int i = 0; i < [lowerCaseStringA length]; i++) {
        NSString *character = [lowerCaseStringA substringWithRange:NSMakeRange(i, 1)];
        [arrayA addObject:character];
    }
    
    NSMutableArray *arrayB = [NSMutableArray array];
    for (int i = 0; i < [lowerCaseStringB length]; i++) {
        NSString *character = [lowerCaseStringB substringWithRange:NSMakeRange(i, 1)];
        [arrayB addObject:character];
    }
    
    NSMutableString *abbreviationString = [[NSMutableString alloc] init];
    for (int i = 0; i < arrayA.count; i++) {
        if ([arrayB containsObject: arrayA[i]]) {
            [abbreviationString appendString:arrayA[i]];
        }
    }
    
    NSString *final = abbreviationString;
    
    if ([lowerCaseStringB isEqual:final]) {
        return @"YES";
    } else {
        return @"NO";
    }
}
@end
