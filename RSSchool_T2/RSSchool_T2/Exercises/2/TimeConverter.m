#import "TimeConverter.h"

@implementation TimeConverter
// Complete the following function
- (NSString*)convertFromHours:(NSString*)hours minutes:(NSString*)minutes {
    
    NSString *half = @"half";
    NSString *past = @"past";
    NSString *quarter = @"quarter";
    NSString *minute = @"minutes";
    NSString *oclock = @"o' clock";
    NSString *to = @"to";
    
    NSDictionary *numbersOfMinutes = @{ @"0" : @"nil", @"1" : @"one", @"2" : @"two", @"3" : @"three", @"4" : @"four", @"5" : @"five", @"6" : @"six", @"7" : @"seven", @"8" : @"eight", @"9" : @"nine", @"11" : @"eleven", @"12" : @"twelve", @"13" : @"thirteen", @"14" : @"fourteen", @"15" : @"fiveteen", @"16" : @"sixteen", @"17" : @"seventeen", @"18" : @"eighteen", @"19" : @"nineteen", @"10" : @"ten", @"20" : @"twenty", @"30" : @"thirty", @"40" : @"fourty", @"50" : @"fivety"};
    
    if ([minutes intValue] > 60) {
        return @"";
    }
    
    NSMutableString *time = [[NSMutableString alloc] init];
    NSString *hourFinal = [numbersOfMinutes objectForKey:hours];
    int nextHour = [hours intValue] + 1;
    NSString *nextHourNumber = [NSString stringWithFormat:@"%i", nextHour];
    NSString *nextHourFinal = [numbersOfMinutes objectForKey:nextHourNumber];
    
    
    //MARK: -> Simple OR Hard Minutes
    int mitutesForCompare = [minutes intValue];
    int converNumber = 60 - mitutesForCompare;
    
    NSMutableString *simpleMinutes = [[NSMutableString alloc] init];
    
    if ( mitutesForCompare < 20 || mitutesForCompare % 10 == 0) {
        NSString *number = [NSString stringWithFormat:@"%i", mitutesForCompare];
        NSString *minutesFinal = [numbersOfMinutes objectForKey:number];
        [simpleMinutes appendString:minutesFinal];
        [simpleMinutes appendString:@" "];
        [simpleMinutes appendString:minute];
    } else if (mitutesForCompare < 30) {
        int secondPartOfNumber = mitutesForCompare % 10;
        int firstPartOfNumber = mitutesForCompare - secondPartOfNumber;
        NSString *secondPart = [NSString stringWithFormat:@"%i", secondPartOfNumber];
        NSString *firstPart = [NSString stringWithFormat:@"%i", firstPartOfNumber];
        NSString *secondPartFinal = [numbersOfMinutes objectForKey:secondPart];
        NSString *firstPartFinal = [numbersOfMinutes objectForKey:firstPart];
        
        [simpleMinutes appendString:firstPartFinal];
        [simpleMinutes appendString:@" "];
        [simpleMinutes appendString:secondPartFinal];
        [simpleMinutes appendString:@" "];
        [simpleMinutes appendString:minute];
    } else if (converNumber > 20 && converNumber % 10 != 0){
        int secondPartOfNumber = converNumber % 10;
        int firstPartOfNumber = converNumber - secondPartOfNumber;
        NSString *secondPart = [NSString stringWithFormat:@"%i", secondPartOfNumber];
        NSString *firstPart = [NSString stringWithFormat:@"%i", firstPartOfNumber];
        NSString *secondPartFinal = [numbersOfMinutes objectForKey:secondPart];
        NSString *firstPartFinal = [numbersOfMinutes objectForKey:firstPart];
        
        [simpleMinutes appendString:firstPartFinal];
        [simpleMinutes appendString:@" "];
        [simpleMinutes appendString:secondPartFinal];
        [simpleMinutes appendString:@" "];
        [simpleMinutes appendString:minute];
    } else {
        NSString *number = [NSString stringWithFormat:@"%i", converNumber];
        NSString *minutesFinal = [numbersOfMinutes objectForKey:number];
        [simpleMinutes appendString:minutesFinal];
        [simpleMinutes appendString:@" "];
        [simpleMinutes appendString:minute];
    }

    
    if (mitutesForCompare == 0) {
        [time appendString:hourFinal];
        [time appendString:@" "];
        [time appendString:oclock];
    } else if (mitutesForCompare == 30) {
        [time appendString:half];
        [time appendString:@" "];
        [time appendString:past];
        [time appendString:@" "];
        [time appendString:hourFinal];
    } else if (mitutesForCompare == 15) {
        [time appendString: quarter];
        [time appendString:@" "];
        [time appendString: past];
        [time appendString:@" "];
        [time appendString:hourFinal];
    } else if (mitutesForCompare == 45) {
        [time appendString: quarter];
        [time appendString:@" "];
        [time appendString: to];
        [time appendString:@" "];
        [time appendString:nextHourFinal];
    } else if ( mitutesForCompare < 30) {
        [time appendString:simpleMinutes];
        [time appendString:@" "];
        [time appendString:past];
        [time appendString:@" "];
        [time appendString:hourFinal];
    } else {
        [time appendString:simpleMinutes];
        [time appendString:@" "];
        [time appendString:to];
        [time appendString:@" "];
        [time appendString:nextHourFinal];
    }
    
    NSString *finalTime = time;
    
    return finalTime;
}
@end
