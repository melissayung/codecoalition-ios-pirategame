//
//  MYTileFactory.h
//  Pirate Adventure
//
//  Created by Melissa Yung on 10/14/13.
//
//

#import <Foundation/Foundation.h>
#include "MYTile.h"
#include "MYCharacter.h"
#include "MYBoss.h"

@interface MYFactory : NSObject

// The idea behing putting those in arrays and having a starting tile is so that we can
// randomise the tiles but this is a bonus implementation
@property(nonatomic) NSArray *randomTiles;
@property(nonatomic) MYTile* startingTile;

-(NSArray*) createTiles;
-(NSMutableArray*) createColumnArray:(int)col numRows:(int)rows;
-(MYCharacter*) createCharacter;
-(MYBoss*) createBoss;
@end
