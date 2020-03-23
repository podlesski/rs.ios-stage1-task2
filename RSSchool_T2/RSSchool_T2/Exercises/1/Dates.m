#import "Dates.h"

@implementation Dates

- (NSString *)textForDay:(NSString *)day month:(NSString *)month year:(NSString *)year {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"d MMMM, EEEE";
    formatter.locale = [NSLocale localeWithLocaleIdentifier:@"ru_RU"];
    
    NSDateComponents *comps = [[NSDateComponents alloc]init];
    comps.year = [year intValue];
    comps.month = [month intValue];
    int dayParametr = [day intValue];

    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *date = [calendar dateFromComponents:comps];
    
    NSRange currentRangeDay = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    NSInteger numberOfDays = currentRangeDay.length;
    
    if (numberOfDays < dayParametr || comps.month > 12) {
        return @"Такого дня не существует";
    }
    
    comps.day = [day intValue];
    NSDate *finalDate = [calendar dateFromComponents:comps];
    
    
    NSString *dateString = [formatter stringFromDate:finalDate];
    
    
    return dateString;
}

@end
