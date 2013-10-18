//
//  MYArmor.h
//  Pirate Adventure
//
//  Created by Melissa Yung on 10/14/13.
//
//

#import <Foundation/Foundation.h>

@interface MYArmor : NSObject

@property (nonatomic, strong) NSString* name;
@property (nonatomic) int health;

- (id) initWithName:(NSString *)name andHealth:(int)health;

@end
