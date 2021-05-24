#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    if (monthNumber < 0 || monthNumber > 12) {
        return nil;
    }
    else {
        NSDateFormatter *dateFormatter = [NSDateFormatter new];
        NSString *month = [[dateFormatter monthSymbols] objectAtIndex:monthNumber - 1];
        return month;
    }
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    NSDate *enterDay = [dateFormatter dateFromString:date];
    if (date == nil) {
            return 0;
        }
    long currentDay = [calendar component:NSCalendarUnitDay fromDate:enterDay];
    return currentDay;
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSDateFormatter *dateFormatter =  [NSDateFormatter new];
    dateFormatter.locale =[[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
    dateFormatter.dateFormat = @"E";
    return [dateFormatter stringFromDate:date];
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *currentDateComponents = [calendar components: NSCalendarUnitWeekOfYear fromDate:[NSDate date] ];
    NSUInteger  currentWeek = [currentDateComponents weekOfYear];
    NSDateComponents *inputDateComponents = [calendar components: NSCalendarUnitWeekOfYear fromDate: date ];
    NSUInteger inputWeek = [inputDateComponents weekOfYear];
    if (currentWeek == inputWeek) {
        return YES;
    } else {
        return NO;
    }
    
}

@end
