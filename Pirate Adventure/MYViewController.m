//
//  MYViewController.m
//  Pirate Adventure
//
//  Created by Melissa Yung on 10/11/13.
//
//

#import "MYViewController.h"
#import "MYFactory.h"

@interface MYViewController ()

@end


@implementation MYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.currentTile = [[MYTile alloc] init]; // do i need this
    
    self.factory = [[MYFactory alloc] init];
    self.tiles = [self.factory createTiles];
    self.character = [self.factory createCharacter];
    self.boss = [self.factory createBoss];
    
    [self startGame];
    
}

#pragma mark METHODS
- (void) updateCharacterHealthStats {
    
    [self checkIfStillAlive];
    self.healthLabel.text = [NSString stringWithFormat:@"%i", self.character.health];
    self.damageLabel.text = [NSString stringWithFormat:@"%i", self.character.damage];
    if (self.character.weapon) {
        self.weaponLabel.text = [NSString stringWithFormat:@"%@", self.character.weapon.name];
    }
    else {
        self.weaponLabel.text = @"no weapon";
    }
    if (self.character.armor) {
        self.armorLabel.text = [NSString stringWithFormat:@"%@", self.character.armor.name];
    }
    else {
        self.armorLabel.text = @"no armor";
    }
    
}

- (void) checkIfStillAlive {
    if (self.character.health <= 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Death"
                                                            message:@"Game over. You are a disgraced pirate! But you can try again."
                                                           delegate:nil
                                                  cancelButtonTitle:@"ok"
                                                  otherButtonTitles: nil];
        [alertView show];
        [self startGame];
    }
    else if (self.boss.health <=0) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Congratulations"
                                                            message:@"You are a certified pirate who braved the oceans and conquered the boss like a boss! Wonder if you can do it again."
                                                           delegate:nil
                                                  cancelButtonTitle:@"ok"
                                                  otherButtonTitles: nil];
        [alertView show];
        [self startGame];
    }
}

- (void) startGame {

    self.currentPosition = CGPointMake(0,0);
    self.boss = [self.factory createBoss];
    self.character = [self.factory createCharacter];
    [self updateViewAfterCharacterMovedToX:self.currentPosition.x Y:self.currentPosition.y];
}

- (void) checkIfBossTile {
    // if this is the boss tile, don't know how to store const yet so need this duplicate entry
    if ([self.currentTile.story isEqualToString:@"ALERT! ALERT! YOU HAVE ENCOUNTERED THE BOSS AND NEED TO FIGHT TIL ONLY ONE EMERGES ALIVE"]) {
        // disable all other buttons
        self.moveDownBtn.hidden = self.moveUpBtn.hidden = self.moveLeftBtn.hidden = self.moveRightBtn.hidden = TRUE;
        
        // work out who wins
        if (self.boss.health > self.character.damage) {
            self.character.health = 0;
        } else {
            self.boss.health = 0;
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark IBACTION

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
    // this action will affect the character's health and damage depending on what the tile has in store
    
    if (self.currentTile.weapon) {
        // if there was an weapon before, remove it from the health stats
        if (self.character.weapon) {
            self.character.damage =- self.character.weapon.damage;
        }
        // replace the weapon
        self.character.weapon = self.currentTile.weapon;
        self.character.damage =+ self.character.weapon.damage;
    }
    
    if (self.currentTile.armor) {
        // if there was an armor before, remove it from the health stats
        if (self.character.armor) {
            self.character.health =- self.character.armor.health;
        }
        // replace the armor
        self.character.armor = self.currentTile.armor;
        self.character.health =+ self.character.armor.health;
    }
    
    [self updateCharacterHealthStats];
}

- (IBAction)startOverBtnPressed:(UIButton *)sender {
    [self startGame];
}

#pragma mark VIEWUPDATE

- (void) updateViewAfterCharacterMovedToX:(int)x Y:(int)y {
    
    self.currentPosition = CGPointMake(x, y);
    
    self.currentTile= [[self.tiles objectAtIndex:x] objectAtIndex:y];
    
    // update health based on health effect of tile
    self.character.health = self.character.health + [self.currentTile.healthEffect intValue];
    
    self.storyLabel.text = self.currentTile.story;
    self.storyBgImage.image = self.currentTile.bg;
    
    // only show the action button if there is an action
    if (self.currentTile.actionButtonLabel) {
        [self.actionBtnLabel setTitle: self.currentTile.actionButtonLabel forState:UIControlStateNormal];
        self.actionBtnLabel.hidden = FALSE;
        self.actionBarBg.hidden = FALSE;
    }
    else {
        self.actionBtnLabel.hidden = TRUE;
        self.actionBarBg.hidden = TRUE;
    }
    
    [self showAndHideNavigationButtonsAppropriately];
    
    [self updateCharacterHealthStats];
    
    [self checkIfBossTile];
    
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
@end
