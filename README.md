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
## Behavior
You can change 3 property when init

```objc
@property (assign) CGFloat length // Default is 0.0f
@property (assign) CGFloat damping; // Default is 0.3f
@property (assign) CGFloat frequency; // Default is 0.8f
```
