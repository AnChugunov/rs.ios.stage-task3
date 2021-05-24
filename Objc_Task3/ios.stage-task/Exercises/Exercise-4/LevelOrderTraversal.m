#import "LevelOrderTraversal.h"

NSUInteger Index(NSArray *tree, NSMutableArray *res, NSUInteger start, NSUInteger distance) {
    NSUInteger index = start;
    for (int directionIndex = 0; directionIndex <= 1 && index + 1 <= tree.count; directionIndex++) {
        id nodeValue = tree[index++];
        if (![nodeValue isKindOfClass:NSNull.class]) {
            if (res.count <= distance) {
                NSMutableArray *newArray = [NSMutableArray new];
                [res addObject:newArray];
            }
            [res[distance] addObject:nodeValue];
            index = Index(tree, res, index, distance + 1);
        }
    }
    return index;
}
NSArray *LevelOrderTraversalForTree(NSArray *tree) {
    NSMutableArray *res = [NSMutableArray new];
    
    if (tree.count == 0 || nil == tree) {
        return res;
    }
    else if (tree.count == 1) {
        if (![tree[0] isKindOfClass:NSNull.class]) {
            [res addObject:@[tree[0]]];
        }
        return res;
    }
    Index(tree, res, 0, 0);
    return res;
}
