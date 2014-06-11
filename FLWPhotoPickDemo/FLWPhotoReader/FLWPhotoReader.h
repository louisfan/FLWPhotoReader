//
//  FLWPhotoReader.h
//  HDPad
//
//  Created by LW on 14-6-11.
//  Copyright (c) 2014年 Liuwei.fan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef void (^FLWPhotoReaderSuccessBlock)(NSArray *array);
typedef void (^FLWPhotoReaderFailedBlock)(NSError *error);

@interface FLWPhotoReader : NSObject
- (void)fetchPhotoLibraryUsingBlock:(FLWPhotoReaderSuccessBlock)successBlock failedBlock:(FLWPhotoReaderFailedBlock)failedBlock;
@end

@interface FLWPhotoLibrary : NSObject
@property(nonatomic, retain)NSString                *libraryName;
@property(nonatomic, retain)UIImage                 *posterImage;
@property(nonatomic, retain,readonly)NSArray        *photos;
@end