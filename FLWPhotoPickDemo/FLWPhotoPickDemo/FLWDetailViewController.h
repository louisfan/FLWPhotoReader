//
//  FLWDetailViewController.h
//  FLWPhotoPickDemo
//
//  Created by LW on 14-6-11.
//  Copyright (c) 2014年 Liuwei.fan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FLWDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
