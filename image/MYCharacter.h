//
//  MYCharacter.h
//  Pirate Adventure
//
//  Created by Melissa Yung on 10/14/13.
//
//

#import <Foundation/Foundation.h>
#include "MYArmor.h"
#include "MYWeapon.h"

@interface MYCharacter : NSObject

@property (nonatomic) int health;
@property (nonatomic)int damage;
@property (nonatomic, strong) MYArmor* armor;
@property (nonatomic, strong) MYWeapon* weapon;


+(MYCharacter*) getInstance;
//+(void) startGame;

@end
