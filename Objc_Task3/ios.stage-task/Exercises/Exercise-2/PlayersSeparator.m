#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    if (ratingArray.count < 3 ||  ratingArray == nil) {
        return 0;
    }
    NSInteger counter = 0;
    for (int i = 0; i < ratingArray.count - 2; i++) {
        for (int j = i + 1; j< ratingArray.count -1; j++) {
            for (int k = j + 1; k < ratingArray.count; k++) {
                if ((ratingArray[i].doubleValue < ratingArray[j].doubleValue) == (ratingArray[j].doubleValue < ratingArray[k].doubleValue)) {
                    counter++;
                }
            }
        }
    }
    return counter;
}

@end
