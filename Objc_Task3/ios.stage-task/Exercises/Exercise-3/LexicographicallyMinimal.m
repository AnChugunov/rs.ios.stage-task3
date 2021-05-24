#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    NSMutableString *str1 = [NSMutableString stringWithString: string1];
    NSMutableString *str2 = [NSMutableString stringWithString: string2];
    NSMutableString *res = [NSMutableString new];
    while ((str1.length != 0) && (str2.length != 0)) {
        if ([str2 characterAtIndex:0] >= [str1 characterAtIndex:0]) {
            [res appendFormat:@"%c",[str1 characterAtIndex:0]];
            [str1 deleteCharactersInRange:NSMakeRange(0, 1) ];
        } else {
            [res appendFormat:@"%c",[str2 characterAtIndex:0]];
            [str2 deleteCharactersInRange:NSMakeRange(0, 1)];
        }
    }
    str1.length == 0 ? [res appendString:str2] : [res appendString:str1];
    return res;
}

@end
