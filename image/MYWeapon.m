//
//  MYWeapon.m
//  Pirate Adventure
//
//  Created by Melissa Yung on 10/14/13.
//
//

#import "MYWeapon.h"

@implementation MYWeapon

- (id) initWithName:(NSString *)name andDamage:(int) damage {

    if (self = [super init]) {
        self.name = name;
        self.damage = damage;
    }
    return self;
}

@end
