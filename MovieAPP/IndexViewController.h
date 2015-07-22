//
//  IndexViewController.h
//  MovieAPP
//
//  Created by Everson Trindade on 16/04/14.
//  Copyright (c) 2014 Everson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface IndexViewController : UIViewController<ADBannerViewDelegate>{
    ADBannerView *bannerView;
}

@end
