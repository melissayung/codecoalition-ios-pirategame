//
//  MYCharacter.m
//  Pirate Adventure
//
//  Created by Melissa Yung on 10/14/13.
//
//

#import "MYCharacter.h"

@implementation MYCharacter

static MYCharacter* instance = nil;    // static instance variable

+(MYCharacter*) getInstance {
    if (instance == nil) {
        instance = [[super alloc] init];
    }
    return instance;
}

@end
