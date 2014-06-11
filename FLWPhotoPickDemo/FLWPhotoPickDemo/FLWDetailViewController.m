//
//  FLWDetailViewController.m
//  FLWPhotoPickDemo
//
//  Created by LW on 14-6-11.
//  Copyright (c) 2014年 Liuwei.fan. All rights reserved.
//

#import "FLWDetailViewController.h"
#import "FLWPhotoReader.h"

@interface FLWDetailViewCell : UICollectionViewCell
{
    UIImageView *_imageView;
}
- (void)setImage:(UIImage *)image;
@end

@interface FLWDetailViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
{
    UICollectionView *_collectionView;
    FLWPhotoLibrary *_photoLibrary;
}
@end

@implementation FLWDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        _photoLibrary = (FLWPhotoLibrary *)_detailItem;
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (self.detailItem) {
        _collectionView = [self newCollectionView];
        [self.view addSubview:_collectionView];
    }
}
- (UICollectionView *)newCollectionView{
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    [layout setItemSize:CGSizeMake(self.view.bounds.size.width/3, self.view.bounds.size.width/3)];
    [layout setMinimumInteritemSpacing:0];
    [layout setMinimumLineSpacing:0];
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height - 50) collectionViewLayout:layout];
    [collectionView registerClass:[FLWDetailViewCell class] forCellWithReuseIdentifier:NSStringFromClass([FLWDetailViewCell class])];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    return collectionView;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -UICollectionViewDelegateAndDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _photoLibrary.photos.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    FLWDetailViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([FLWDetailViewCell class]) forIndexPath:indexPath];
    [cell setImage:_photoLibrary.photos[indexPath.row]];
    return cell;
}

@end

@implementation FLWDetailViewCell

- (void)setImage:(UIImage *)image{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, self.frame.size.width-10, self.frame.size.height-10)];
        [self addSubview:_imageView];
        [_imageView setContentMode:UIViewContentModeScaleAspectFit];
    }
    [_imageView setImage:image];
}

@end
