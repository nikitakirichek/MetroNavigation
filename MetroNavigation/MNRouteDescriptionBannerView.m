//
//  MNRouteDescriptionBannerView.m
//  MetroNavigation
//
//  Created by Nikita Kirichek on 4/29/17.
//  Copyright © 2017 Nikita Kirichek. All rights reserved.
//

#import "MNRouteDescriptionBannerView.h"
#import "UIColor+MNColors.h"

@implementation MNRouteDescriptionBannerView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.layer.shadowOffset = CGSizeMake(0, -2);
    self.layer.shadowRadius = 3;
    self.layer.shadowOpacity = 0.5;
}

- (void)setStartStationName:(NSString *)name {
    [self.startStaion setTitle:name forState:UIControlStateNormal];
}

- (void)setEndStationName:(NSString *)name {
    [self.endStaion setTitle:name forState:UIControlStateNormal];
}


- (IBAction)cancelClicked:(id)sender {
    [self.delegate cancelDidClickWithRouteDescriptionBanner:self];
}

- (IBAction)swipeClicked:(id)sender {
    [self.delegate swipeStationDidClickWithRouteDescriptionBanner:self];
}



@end
