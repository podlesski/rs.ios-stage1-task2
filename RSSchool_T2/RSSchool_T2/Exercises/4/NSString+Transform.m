#import "NSString+Transform.h"

@implementation NSString (Transform)

-(NSString*)transform {
    
    NSArray *allCharacter = @[@"a", @"b", @"c", @"d", @"e", @"f", @"g", @"h", @"i", @"j", @"k", @"l", @"m", @"n", @"o", @"p", @"q", @"r", @"s", @"t", @"u", @"v", @"w", @"x", @"y", @"z"];
    
    NSArray *pangramCharacter = @[@"a", @"e", @"i", @"o", @"u", @"y", @"A", @"E", @"I", @"O", @"U", @"Y"];
    
    NSArray *notPangramCharacter = @[@"b", @"c", @"d", @"f", @"g", @"h", @"j", @"k", @"l", @"m", @"n", @"p", @"q", @"r", @"s", @"t", @"v", @"w", @"x", @"z", @"B", @"C", @"D", @"F", @"G", @"H", @"J", @"K", @"L", @"M", @"N", @"P", @"Q", @"R", @"S", @"T", @"V", @"W", @"X", @"Z"];
    
    NSString *pangramCharacterForOperation2 = @"aeiouy";
    NSString *notPangramCharacterForOperation2 = @"bcdfghjklmnpqrstvwxz";
    
    NSString *currentString = self;
    
    NSMutableString *addSpace = [[NSMutableString alloc] init];
    [addSpace appendString:currentString];
    [addSpace appendString:@" "];
    NSString *currentString2 = addSpace;
    
    NSString *checkForEmpty = [currentString2 stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    if ([checkForEmpty length] == 0) {
        return @"";
    }
    
    currentString2 = [currentString2 stringByReplacingOccurrencesOfString:@"\\" withString:@""];
    
    currentString2 = [currentString2 stringByReplacingOccurrencesOfString: @"[ \t]+"
    withString: @" "
       options: NSRegularExpressionSearch
         range: NSMakeRange(0, currentString2.length)];
    
    if ([currentString2 hasPrefix:@" "]) {
        currentString2 = [currentString2 substringFromIndex:1];
    }
    
    NSString *lowerCaseCurrentString = [currentString2 localizedLowercaseString];
    
    int valueForFindPangram = 0;
    
    for (int i = 0; i < allCharacter.count; i++) {
        if ([lowerCaseCurrentString containsString:allCharacter[i]]) {
            valueForFindPangram += 1;
        }
    }
    
    NSMutableString *final = [[NSMutableString alloc] initWithString:@""];
    
    if (valueForFindPangram == 26) {
        
        //MARK: -> Find Max Count OF Character If Panagram == YES
        
        NSMutableCharacterSet *space = [[NSMutableCharacterSet alloc] init];
        [space addCharactersInString:@" "];
        
        NSRange searchRange = NSMakeRange(0, [lowerCaseCurrentString length]);
        
        int maxCountOfPanagramCharacter = 0;
        NSInteger lastIndex = 0;
        
        while (YES) {
            NSRange range = [lowerCaseCurrentString rangeOfCharacterFromSet:space options: 0 range: searchRange];
            if (range.location != NSNotFound) {
                NSInteger index = range.location + 1;
                searchRange.location = index;
                searchRange.length = [lowerCaseCurrentString length] - index;
                NSString *word = [lowerCaseCurrentString substringWithRange:NSMakeRange(lastIndex, index - lastIndex)];
                lastIndex = index;
                
                int countOfPangramCharacter = 0;
                for (int i = 0; i < pangramCharacter.count; i++) {
                    if ([word containsString:pangramCharacter[i]]) {
                        NSInteger countOfTimes = [[word componentsSeparatedByString:pangramCharacter[i]] count] - 1;
                        countOfPangramCharacter += countOfTimes;
                    }
                }
                
                if (countOfPangramCharacter > maxCountOfPanagramCharacter) {
                    maxCountOfPanagramCharacter = countOfPangramCharacter;
                }
            } else {
                break;
            }
        }
        
        //MARK: -> Transform If Panagram == YES
        int currentSort = 0;
        
        while (YES) {
            
            NSRange searchRange2 = NSMakeRange(0, [lowerCaseCurrentString length]);
            NSInteger lastIndex2 = 0;
            
            while (YES) {
                NSRange range = [lowerCaseCurrentString rangeOfCharacterFromSet:space options: 0 range: searchRange2];
                if (range.location != NSNotFound) {
                    NSInteger index = range.location + 1;
                    searchRange2.location = index;
                    searchRange2.length = [lowerCaseCurrentString length] - index;
                    NSString *word = [currentString2 substringWithRange:NSMakeRange(lastIndex2, index - lastIndex2)];
                    lastIndex2 = index;
                    
                    int countOfPangramCharacter = 0;
                    for (int i = 0; i < pangramCharacter.count; i++) {
                        if ([word containsString:pangramCharacter[i]]) {
                            NSInteger countOfTimes = [[word componentsSeparatedByString:pangramCharacter[i]] count] - 1;
                            countOfPangramCharacter += countOfTimes;
                        }
                    }
                    
                    if (countOfPangramCharacter == currentSort) {
                        NSString *strValue = [@(countOfPangramCharacter) stringValue];
                        [final appendString: strValue];
                        [final appendString:word];
                    }
                } else {
                    break;
                }

            }
            
            currentSort += 1;
            if (currentSort > maxCountOfPanagramCharacter) {
                break;
            }
            
        }
        
    } else {
        
        //MARK: -> Find Max Count OF Character If Panagram == NO
        
        NSMutableCharacterSet *space = [[NSMutableCharacterSet alloc] init];
        [space addCharactersInString:@" "];
        
        NSRange searchRange = NSMakeRange(0, [lowerCaseCurrentString length]);
        
        int maxCountOfPanagramCharacter = 0;
        NSInteger lastIndex = 0;
        
        while (YES) {
            NSRange range = [lowerCaseCurrentString rangeOfCharacterFromSet:space options: 0 range: searchRange];
            if (range.location != NSNotFound) {
                NSInteger index = range.location + 1;
                searchRange.location = index;
                searchRange.length = [lowerCaseCurrentString length] - index;
                NSString *word = [lowerCaseCurrentString substringWithRange:NSMakeRange(lastIndex, index - lastIndex)];
                lastIndex = index;
                
                int countOfPangramCharacter = 0;
                for (int i = 0; i < notPangramCharacter.count; i++) {
                    if ([word containsString:notPangramCharacter[i]]) {
                        NSInteger countOfTimes = [[word componentsSeparatedByString:notPangramCharacter[i]] count] - 1;
                        countOfPangramCharacter += countOfTimes;
                    }
                }
                
                if (countOfPangramCharacter > maxCountOfPanagramCharacter) {
                    maxCountOfPanagramCharacter = countOfPangramCharacter;
                }
            } else {
                break;
            }
        }
        
        //MARK: -> Transform If Panagram == NO
        int currentSort = 0;
        
        while (YES) {
            
            NSRange searchRange2 = NSMakeRange(0, [lowerCaseCurrentString length]);
            NSInteger lastIndex2 = 0;
            
            while (YES) {
                NSRange range = [lowerCaseCurrentString rangeOfCharacterFromSet:space options: 0 range: searchRange2];
                if (range.location != NSNotFound) {
                    NSInteger index = range.location + 1;
                    searchRange2.location = index;
                    searchRange2.length = [lowerCaseCurrentString length] - index;
                    NSString *word = [currentString2 substringWithRange:NSMakeRange(lastIndex2, index - lastIndex2)];
                    lastIndex2 = index;
                    
                    int countOfPangramCharacter = 0;
                    for (int i = 0; i < notPangramCharacter.count; i++) {
                        if ([word containsString:notPangramCharacter[i]]) {
                            NSInteger countOfTimes = [[word componentsSeparatedByString:notPangramCharacter[i]] count] - 1;
                            countOfPangramCharacter += countOfTimes;
                        }
                    }
                    
                    if (countOfPangramCharacter == currentSort) {
                        NSString *strValue = [@(countOfPangramCharacter) stringValue];
                        [final appendString: strValue];
                        [final appendString:word];
                    }
                } else {
                    break;
                }

            }
            
            currentSort += 1;
            if (currentSort > maxCountOfPanagramCharacter) {
                break;
            }
            
        }
        
    }
    
    NSString *stringToShort = final;
    
    if ([stringToShort length] > 0) {
        stringToShort = [stringToShort substringToIndex:[stringToShort length] - 1];
    }
    
    
    if (valueForFindPangram == 26) {
        NSString *superFinal = [stringToShort copy];
        for (int i = 0; i < pangramCharacterForOperation2.length; i++) {
            NSString *character = [NSString stringWithFormat:@"%C", [pangramCharacterForOperation2 characterAtIndex:i]];
            superFinal = [superFinal stringByReplacingOccurrencesOfString:character withString:[character uppercaseString]];
        }
        return superFinal;
    } else {
        NSString *superFinal = [stringToShort copy];
        for (int i = 0; i < notPangramCharacterForOperation2.length; i++) {
            NSString *character = [NSString stringWithFormat:@"%C", [notPangramCharacterForOperation2 characterAtIndex:i]];
            superFinal = [superFinal stringByReplacingOccurrencesOfString:character withString:[character uppercaseString]];
        }
        return superFinal;
    }
}

@end
