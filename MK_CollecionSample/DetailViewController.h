//
//  DetailViewController.h
//  MK_CollecionSample
//
//  Created by MurataKazuki on 2014/03/03.
//  Copyright (c) 2014年 MK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

//一つ前のCollectionViewControllerから渡されるNSDictionaryを格納するプロパティ
@property (nonatomic,strong) NSDictionary *detailData;

@end
