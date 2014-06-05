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

======================
## MIT License
Copyright (c) 2014 Yaman JAIOUCH

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

======================
## Release notes
Version 1.0

Initial release
