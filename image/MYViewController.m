//
//  MYViewController.m
//  Pirate Adventure
//
//  Created by Melissa Yung on 10/11/13.
//
//

#import "MYViewController.h"
#import "MYTileFactory.h"

@interface MYViewController ()

@end


@implementation MYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.currentPosition = CGPointMake(0,0);
    self.character = [[MYCharacter alloc] init];
    self.character.health = 100;
    self.character.damage = 0;
    self.character.weapon = nil;
    self.character.armor = nil;
    
    self.currentTile = [[MYTile alloc] init];
    
    MYTileFactory *tileFactory = [[MYTileFactory alloc] init];
    self.tiles = tileFactory.createTiles;
    
    [self updateViewAfterCharacterMovedToX:self.currentPosition.x Y:self.currentPosition.y];
    
}

- (void) updateCharacterHealthStats {
    
    self.healthLabel.text = [NSString stringWithFormat:@"%i", self.character.health];
    self.damageLabel.text = [NSString stringWithFormat:@"%i", self.character.damage];
    if (self.character.weapon) {
        self.weaponLabel.text = [NSString stringWithFormat:@"%@", self.character.weapon.name];
    }
    else {
        self.weaponLabel.text = @"none";
    }
    if (self.character.armor) {
        self.armorLabel.text = [NSString stringWithFormat:@"%@", self.character.armor.name];
    }
    else {
        self.armorLabel.text = @"none";
    }
}

- (void) updateViewAfterCharacterMovedToX:(int)x Y:(int)y {

    self.currentPosition = CGPointMake(x, y);
    
    self.currentTile= [[self.tiles objectAtIndex:x] objectAtIndex:y];
    
    self.storyLabel.text = self.currentTile.story;
    self.storyBgImage.image = self.currentTile.bg;
    
    // only show the action button if there is an action
    if (self.currentTile.actionButtonLabel) {
        self.actionBtn.titleLabel.text = self.currentTile.actionButtonLabel;
        self.actionBtn.hidden = FALSE;
       // [self.actionBtn setTile:@"fjeo" forControlState:UIControlStateNormal];
        self.actionBarBg.hidden = FALSE;
    }
    else {
        self.actionBtn.hidden = TRUE;
        self.actionBarBg.hidden = TRUE;
    }

    [self showAndHideNavigationButtonsAppropriately];
    
    [self updateCharacterHealthStats];
}

- (void) showAndHideNavigationButtonsAppropriately {
    // unhide all of them first
    self.moveDownBtn.hidden = self.moveLeftBtn.hidden = self.moveRightBtn.hidden = self.moveUpBtn.hidden = FALSE;
    if (self.currentPosition.x == 0) {
        self.moveLeftBtn.hidden = TRUE;
    }
    if (self.currentPosition.y == 0) {
        self.moveDownBtn.hidden = TRUE;
    }
    if (self.currentPosition.x == 3) {
        self.moveRightBtn.hidden = TRUE;
    }
    if (self.currentPosition.y == 2) {
        self.moveUpBtn.hidden = TRUE;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)moveLeftBtnPressed:(UIButton *)sender {
    
    [self updateViewAfterCharacterMovedToX:self.currentPosition.x-1 Y:self.currentPosition.y];
}

- (IBAction)moveUpBtnPressed:(UIButton *)sender {
    
    [self updateViewAfterCharacterMovedToX:self.currentPosition.x Y:self.currentPosition.y+1];
}

- (IBAction)moveDownBtnPressed:(UIButton *)sender {
    
    [self updateViewAfterCharacterMovedToX:self.currentPosition.x Y:self.currentPosition.y-1];
}

- (IBAction)moveRightBtnPressed:(UIButton *)sender {
    
    [self updateViewAfterCharacterMovedToX:self.currentPosition.x+1 Y:self.currentPosition.y];
}

- (IBAction)actionBtnPressed:(UIButton *)sender {
    // this action will affect the character's health depending on what the tile has in store

    int currentTitleHealthEffect = [self.currentTile.healthEffect intValue];

    if (self.currentTile.weapon) {
        // replace the weapon
        self.character.weapon = self.currentTile.weapon;
    }
    
    if (self.currentTile.armor) {
        // replace the armor
        self.character.armor = self.currentTile.armor;
    }

    [NSString stringWithFormat:@"%i", (self.character.health + currentTitleHealthEffect)];
    self.character.health = self.character.health + [self.currentTile.healthEffect intValue];
    
    [self updateCharacterHealthStats];
}

- (IBAction)startOverBtnPressed:(UIButton *)sender {
}
@end
