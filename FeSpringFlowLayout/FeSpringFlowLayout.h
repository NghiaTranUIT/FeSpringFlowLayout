//
//  FeSpringFlowLayout.h
//  FeSpringFlowLayout
//
//  Created by Nghia Tran on 6/5/14.
//  Copyright (c) 2014 Fe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeSpringFlowLayout : UICollectionViewFlowLayout
-(id) init;
-(id) initWithLength:(CGFloat) length damping:(CGFloat) damping frequency:(CGFloat) frequency;
@end
