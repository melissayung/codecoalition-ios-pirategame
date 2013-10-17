//
//  MYViewController.h
//  Pirate Adventure
//
//  Created by Melissa Yung on 10/11/13.
//
//

#import <UIKit/UIKit.h>
#import "MYCharacter.h"
#import "MYTile.h"

@interface MYViewController : UIViewController

- (IBAction)moveLeftBtnPressed:(UIButton *)sender;
- (IBAction)moveUpBtnPressed:(UIButton *)sender;
- (IBAction)moveDownBtnPressed:(UIButton *)sender;
- (IBAction)moveRightBtnPressed:(UIButton *)sender;
- (IBAction)startOverBtnPressed:(UIButton *)sender;
- (IBAction)actionBtnPressed:(UIButton *)sender;


- (void) updateViewAfterCharacterMovedToX:(int)x Y:(int)y;

@property (strong, nonatomic) IBOutlet UILabel *healthLabel;
@property (strong, nonatomic) IBOutlet UILabel *damageLabel;
@property (strong, nonatomic) IBOutlet UILabel *storyLabel;
@property (strong, nonatomic) IBOutlet UILabel *weaponLabel;
@property (strong, nonatomic) IBOutlet UILabel *armorLabel;

@property (strong, nonatomic) IBOutlet UIView *actionBarBg;
@property (strong, nonatomic) IBOutlet UIImageView *storyBgImage;

@property (strong, nonatomic) IBOutlet UIButton *actionBtn;
@property (strong, nonatomic) IBOutlet UIButton *moveLeftBtn;
@property (strong, nonatomic) IBOutlet UIButton *moveUpBtn;
@property (strong, nonatomic) IBOutlet UIButton *moveDownBtn;
@property (strong, nonatomic) IBOutlet UIButton *moveRightBtn;

@property (nonatomic) CGPoint currentPosition;
@property (strong, nonatomic) MYCharacter *character;
@property (strong, nonatomic) MYTile *currentTile;
@property (strong, nonatomic) NSArray *tiles;
@end
