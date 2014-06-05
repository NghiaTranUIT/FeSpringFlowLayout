//
//  FeSpringFlowLayout.m
//  FeSpringFlowLayout
//
//  Created by Nghia Tran on 6/5/14.
//  Copyright (c) 2014 Fe. All rights reserved.
//

#import "FeSpringFlowLayout.h"

@interface FeSpringFlowLayout ()
{
    CGFloat _length;
    CGFloat _damping;
    CGFloat _frequency;
}
@property (strong, nonatomic) UIDynamicAnimator *dynamicAnimator;

@end
@implementation FeSpringFlowLayout
-(id) init
{
    self = [super init];
    if (self)
    {
        self.itemSize = CGSizeMake(320, 50);
        [self setMinimumLineSpacing:8];
        
        // Default
        _length = 0;
        _damping = 0.3f;
        _frequency = 0.8f;
    }
    return self;
}
-(id) initWithLength:(CGFloat)length damping:(CGFloat)damping frequency:(CGFloat)frequency
{
    self = [super init];
    if (self)
    {
        self.itemSize = CGSizeMake(320, 50);
        [self setMinimumLineSpacing:8];
        
        // Save
        _length = length;
        _damping = damping;
        _frequency = frequency;
    }
    return self;
}
-(void) prepareLayout
{
    [super prepareLayout];
    
    if (!_dynamicAnimator)
    {
        // init
        _dynamicAnimator = [[UIDynamicAnimator alloc] initWithCollectionViewLayout:self];
        
        // Get content size after super's prepareLayout
        CGSize contentSize = [self collectionViewContentSize];
        
        // Get arr item
        NSArray *items = [super layoutAttributesForElementsInRect:CGRectMake(0, 0, contentSize.width, contentSize.height)];
        
        // Add spring behavior to each item in collectin view
        for (UICollectionViewLayoutAttributes *item in items)
        {
            // Set anchor point is center of cell
            // as wwdc 2013 guide
            UIAttachmentBehavior *springBehavior = [[UIAttachmentBehavior alloc] initWithItem:item attachedToAnchor:[item center]];
            
            springBehavior.length = _length;
            springBehavior.damping = _damping;
            springBehavior.frequency = _frequency;
            
            [_dynamicAnimator addBehavior:springBehavior];
        }
    }

}
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    CGFloat denlta = newBounds.origin.y - self.collectionView.bounds.origin.y;
    
    CGPoint locationTouch = [self.collectionView.panGestureRecognizer locationInView:self.collectionView];
    
    for (UIAttachmentBehavior *spring in _dynamicAnimator.behaviors)
    {
        CGPoint anchorPoint = spring.anchorPoint;
        
        // cal distance between location touch to anchor point (center of cell)
        CGFloat distance = fabsf(locationTouch.y - anchorPoint.y);
        CGFloat resistance = distance / 500;
        
        UICollectionViewLayoutAttributes *item = [spring.items firstObject];
        CGPoint center = item.center;
        center.y += MIN(denlta, denlta * resistance);
        item.center = center;
        
        // Update
        [_dynamicAnimator updateItemUsingCurrentState:item];
    }
    
    return NO;
}
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return [_dynamicAnimator itemsInRect:rect];
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [_dynamicAnimator layoutAttributesForCellAtIndexPath:indexPath];
}
@end
