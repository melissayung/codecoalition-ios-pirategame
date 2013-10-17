//
//  MYArmor.m
//  Pirate Adventure
//
//  Created by Melissa Yung on 10/14/13.
//
//

#import "MYArmor.h"

@implementation MYArmor

- (id) initWithName:(NSString *)name andHealth:(int)health {
    
    if (self = [super init]) {
        self.name = name;
        self.health = health;
    }
    return self;
}

@end
