#import "FibonacciResolver.h"

@implementation FibonacciResolver
- (NSArray*)productFibonacciSequenceFor:(NSNumber*)number {
    
    int productFibonacci = [number intValue];
    
    int lowFibonacciiNumber = 0;
    int middleFibonacciNumber = 1;
    int hightibonacciNumber = 1;
    
    NSNumber *trueOrFalse = [[NSNumber alloc] init];
    
    while (lowFibonacciiNumber * middleFibonacciNumber < productFibonacci) {
        lowFibonacciiNumber = middleFibonacciNumber;
        middleFibonacciNumber = hightibonacciNumber;
        hightibonacciNumber = lowFibonacciiNumber + middleFibonacciNumber;
    }
    
    if (lowFibonacciiNumber * middleFibonacciNumber == productFibonacci) {
        trueOrFalse = [NSNumber numberWithInt:1];
    } else {
        trueOrFalse = [NSNumber numberWithInt:0];
    }
    
    
    NSArray *final = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:lowFibonacciiNumber], [NSNumber numberWithInt:middleFibonacciNumber], trueOrFalse, nil];
    
    return final;
}
@end
