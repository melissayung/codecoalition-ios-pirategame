//
//  MYWeapon.h
//  Pirate Adventure
//
//  Created by Melissa Yung on 10/14/13.
//
//

#import <Foundation/Foundation.h>

@interface MYWeapon : NSObject

@property(nonatomic, strong) NSString *name;
@property(nonatomic) int damage;

- (id) initWithName:(NSString *)name andDamage:(int) damage;

@end
