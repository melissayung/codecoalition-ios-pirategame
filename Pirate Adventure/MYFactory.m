//
//  MYTileFactory.m
//  Pirate Adventure
//
//  Created by Melissa Yung on 10/14/13.
//
//

#import "MYFactory.h"
#import "MYTile.h"

@implementation MYFactory

-(NSArray*) createTiles {
    
    self.randomTiles = [[NSArray alloc] initWithObjects:
                        
                        [[MYTile alloc]  initWithStory:@"Pirates in sight. Let's hope they go away. Oh no, they're coming straight for your ship!"
                                                 andBg:[UIImage imageNamed:@"PirateAttack.jpg"]
                                  andActionButtonLabel:@"Steer out of danger"
                                       andHealthEffect:[NSNumber numberWithInt: 0]
                                             andWeapon:[[MYWeapon alloc] initWithName:nil andDamage:0]
                                              andArmor:[[MYArmor alloc] initWithName:nil andHealth:0]],
                        [[MYTile alloc]  initWithStory:@"The boat starts to violently shake from left to right. What is happening? You hear screams from the dock. It's a ginormous totally realistic octopus attack!"
                                                 andBg:[UIImage imageNamed:@"PirateOctopusAttack.jpg"]
                                  andActionButtonLabel:@"Fight the octopus!"
                                       andHealthEffect:[NSNumber numberWithInt: -20]
                                             andWeapon:[[MYWeapon alloc] initWithName:nil andDamage:0]
                                              andArmor:[[MYArmor alloc] initWithName:nil andHealth:0]],
                        [[MYTile alloc]  initWithStory:@"Finally a port in sight. You can safely rest. What a relief!"
                                                 andBg:[UIImage imageNamed:@"PirateFriendlyDock.jpg"]
                                  andActionButtonLabel:@"Revitalise"
                                       andHealthEffect:[NSNumber numberWithInt: 0]
                                             andWeapon:[[MYWeapon alloc] initWithName:@"Sharpest sword" andDamage:100]
                                              andArmor:[[MYArmor alloc] initWithName:@"Steel armor" andHealth:100]],
                        [[MYTile alloc]  initWithStory:@"Ennemies in view. Prepare for battle! We have no other choice."
                                                 andBg:[UIImage imageNamed:@"PirateShipBattle.jpg"]
                                  andActionButtonLabel:@"Defend my ship!"
                                       andHealthEffect:[NSNumber numberWithInt: -100]
                                             andWeapon:[[MYWeapon alloc] initWithName:nil andDamage:0]
                                              andArmor:[[MYArmor alloc] initWithName:nil andHealth:0]],
                        [[MYTile alloc]  initWithStory:@"Hooray! You stumble upon a lost treasure chest. Must be your lucky day"
                                                 andBg:[UIImage imageNamed:@"PirateTreasure.jpg"]
                                  andActionButtonLabel:@"Take the treasure"
                                       andHealthEffect:[NSNumber numberWithInt: 0]
                                             andWeapon:[[MYWeapon alloc] initWithName:@"Dagger" andDamage:200]
                                              andArmor:[[MYArmor alloc] initWithName:@"Mail coif" andHealth:50]],
                        [[MYTile alloc]  initWithStory:@"You find some abandoned weapons. You verify if they are still in good condition... They are! Pack them and move quickly if you trust your guts."
                                                 andBg:[UIImage imageNamed:@"PirateWeapons.jpg"]
                                  andActionButtonLabel: @"Take the weapons"
                                       andHealthEffect:[NSNumber numberWithInt: 0]
                                             andWeapon:[[MYWeapon alloc] initWithName:@"Gun" andDamage:50]
                                              andArmor:[[MYArmor alloc] initWithName:@"Helmet" andHealth:15]],
                        [[MYTile alloc]  initWithStory:@"Ooh, it is Zula the parrot."
                                                 andBg:[UIImage imageNamed:@"PirateParrot.jpg"]
                                  andActionButtonLabel:@"Take its eye patch"
                                       andHealthEffect:[NSNumber numberWithInt: 0]
                                             andWeapon:[[MYWeapon alloc] initWithName:nil andDamage:0]
                                              andArmor:[[MYArmor alloc] initWithName:@"Eye patch" andHealth:5]],
                        [[MYTile alloc]  initWithStory:@"You have been captured by the pirates and forced to walk the plank. Will you make it out alive?"
                                                 andBg:[UIImage imageNamed:@"PiratePlank.jpg"]
                                  andActionButtonLabel:@"Walk the plank"
                                       andHealthEffect:[NSNumber numberWithInt: -50]
                                             andWeapon:[[MYWeapon alloc] initWithName:nil andDamage:0]
                                              andArmor:[[MYArmor alloc] initWithName:nil andHealth:0]],
                        [[MYTile alloc]  initWithStory:@"You sneak around and find some buried treasure on board!Should you leave it or take it for yourself?"
                                                 andBg:[UIImage imageNamed:@"PirateTreasurer2.jpg"]
                                  andActionButtonLabel: @"Take the treasure"
                                       andHealthEffect:[NSNumber numberWithInt: 0]
                                             andWeapon:[[MYWeapon alloc] initWithName:@"Canon" andDamage:200]
                                              andArmor:[[MYArmor alloc] initWithName:@"Plackart" andHealth:150]],
                        [[MYTile alloc]  initWithStory:@"ALERT! ALERT! YOU HAVE ENCOUNTERED THE BOSS AND NEED TO FIGHT TIL ONLY ONE EMERGES ALIVE"
                                                 andBg:[UIImage imageNamed:@"PirateBoss.jpg"]
                                  andActionButtonLabel:@"Fight!"
                                       andHealthEffect:[NSNumber numberWithInt: 0]
                                             andWeapon:[[MYWeapon alloc] initWithName:nil andDamage:0]
                                              andArmor:[[MYArmor alloc] initWithName:nil andHealth:0]],
                        [[MYTile alloc]  initWithStory:@"You walk into the blacksmith's room who is at work."
                                                 andBg:[UIImage imageNamed:@"PirateBlacksmith.jpg"]
                                  andActionButtonLabel:@"Have a chat"
                                       andHealthEffect:[NSNumber numberWithInt: 10]
                                             andWeapon:[[MYWeapon alloc] initWithName:nil andDamage:0]
                                              andArmor:[[MYArmor alloc] initWithName:nil andHealth:0]],
                                        nil];
    
    self.startingTile = [[MYTile alloc] initWithStory:@"Time to start your pirate adventure. Your name is Objective-P"
                                        andBg:[UIImage imageNamed:@"PirateStart.jpg"]
                                        andActionButtonLabel:nil
                                        andHealthEffect:[NSNumber numberWithInt: 0]
                                        andWeapon:[[MYWeapon alloc] initWithName:@"Fists" andDamage:10]
                                        andArmor:[[MYArmor alloc] initWithName:@"Fists" andHealth:20]];
 
    
    // only create 2 rows so that we can insert the starting tile
    NSMutableArray* col1 = [self createColumnArray:0 numRows:2];
    NSMutableArray* col2 = [self createColumnArray:1 numRows:3];
    NSMutableArray* col3 = [self createColumnArray:2 numRows:3];
    NSMutableArray* col4 = [self createColumnArray:3 numRows:3];

    NSArray *tiles = [[NSArray alloc] initWithObjects:col1, col2, col3, col4, nil];
    return tiles;
}


// could create method to pick stories at random such that a new game can be played and then insert the starting story but let's keep it simple for now! :)

-(NSMutableArray*) createColumnArray:(int)col numRows:(int)numRows {
    
    // where should we start
    int start;
    
    NSMutableArray* colArray = [[NSMutableArray alloc] init];
    if (col == 0) {
        // let's insert starting story
        [colArray addObject:self.startingTile];
        start = 0;
    }
    else {
        start = col*numRows -1; // because of the first starting tile
    }
    
    for (int index=start; index<(numRows+start); index++) {
        MYTile* newTile = [self.randomTiles objectAtIndex:index];
        [colArray addObject:newTile];
    }
    
    return colArray;
}

-(MYCharacter *) createCharacter {
    MYCharacter *character = [[MYCharacter alloc] init];
    character.health = 100;
    return character;
}

-(MYBoss *) createBoss {
    MYBoss *boss = [[MYBoss alloc] init];
    boss.health = 15;
    return boss;
}

@end
