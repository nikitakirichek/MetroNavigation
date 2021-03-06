//
//  MNMetroImageScrollView.h
//  MetroNavigation
//
//  Created by Nikita Kirichek on 4/29/17.
//  Copyright © 2017 Nikita Kirichek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MNMetroImageScrollView : UIScrollView

- (CGFloat)scaleAfterZoomingToRect:(CGRect)rect;
- (void)scrollToPoint:(CGPoint)zoomPoint withScale:(CGFloat)scale;

@end
