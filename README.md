FeSpringFlowLayout
==================

Make collection cell fell naturally.

======================
## In Brief
FeSpringFlowLayout is subclass of UICollectionViewFlowLayout.

Add physical to each cell like Message app.

Feel to free to change behaviour of cell when scrolling.


======================
## Requirement
FeSpringFlowLayout use UIKit Dynamics to implement.

So You must ensure your project has iOS version more than iOS 7.0.

And compatible with ARC or non-ARC.

======================
## Note
You should set itemSize's width as collectionView's width.

======================
## How to using
FeSpringFlowLayout support two initialization.

After init, you can set property similar UICollectionViewFlowLayout

```objc
// Init with default value
-(id) init;

// Init with custom value you like
-(id) initWithLength:(CGFloat) length damping:(CGFloat) damping frequency:(CGFloat) frequency;
```

======================
## Behavior
You can change behavior by changing 3 properties when init

```objc
@property (assign) CGFloat length // Default is 0.0f
@property (assign) CGFloat damping; // Default is 0.3f
@property (assign) CGFloat frequency; // Default is 0.8f
```

