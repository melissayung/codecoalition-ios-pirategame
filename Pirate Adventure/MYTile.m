//
//  MYTile.m
//  Pirate Adventure
//
//  Created by Melissa Yung on 10/14/13.
//
//

#import "MYTile.h"

@implementation MYTile


-(id) initWithStory:(NSString*)story andBg:(UIImage*)bg andActionButtonLabel:(NSString*)actionButtonLabel andHealthEffect:(NSNumber*)healthEffect andWeapon:(MYWeapon*)weapon andArmor:(MYArmor*) armor {
    self.story = story;
    self.bg = bg;
    self.actionButtonLabel = actionButtonLabel;
    self.healthEffect = healthEffect;
    self.weapon = weapon;
    self.armor = armor;
    return self;
}
@end
