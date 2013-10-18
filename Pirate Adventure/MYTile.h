//
//  MYTile.h
//  Pirate Adventure
//
//  Created by Melissa Yung on 10/14/13.
//
//

#import <Foundation/Foundation.h>
#import "MYWeapon.h"
#import "MYArmor.h"

@interface MYTile : NSObject

@property(nonatomic, strong) NSString *story;
@property(nonatomic, strong) UIImage *bg;
@property(nonatomic, strong) NSString *actionButtonLabel;
@property(nonatomic, strong) NSNumber *healthEffect;
@property(nonatomic, strong) MYWeapon *weapon;
@property(nonatomic, strong) MYArmor *armor;

-(id) initWithStory:(NSString*)story andBg:(UIImage*)bg andActionButtonLabel:(NSString*)actionButtonLabel andHealthEffect:(NSNumber*)healthEffect andWeapon:(MYWeapon*)weapon andArmor:(MYArmor*) armor;

@end
