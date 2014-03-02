//
//  DetailViewController.m
//  MK_CollecionSample
//
//  Created by MurataKazuki on 2014/03/03.
//  Copyright (c) 2014年 MK. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

//画面上の部品と関連付けるプロパティ
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *placeLabel;

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //ViewControllerの起動時に、既にdetailDataにはNSDictionaryが渡されているので、それを取り出して表示
    self.titleLabel.text = self.detailData[@"title"];
    self.placeLabel.text = self.detailData[@"place"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
