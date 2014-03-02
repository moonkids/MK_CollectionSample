//
//  CollectionViewController.m
//  MK_CollecionSample
//
//  Created by MurataKazuki on 2014/03/02.
//  Copyright (c) 2014年 MK. All rights reserved.
//

#import "CollectionViewController.h"
#import "DetailViewController.h"

@interface CollectionViewController ()

//***************************************
//コレクションビューで表示するデータを格納するプロパティ
//***************************************
@property(nonatomic,strong) NSArray *objects;

@end


@implementation CollectionViewController

#pragma mark - ViewController
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
    
    //***************************************
    //表示するデータを準備（NSArray + NSDictionary）
    //さらに、mutableCopyをして変更可能に（NSArray → NSMutableArrayに変換される）
    //***************************************
    self.objects = [@[
                     @{@"title":@"荻窪ラーメン",@"place":@"荻窪",@"image":@""},
                     @{@"title":@"新宿一番星",@"place":@"新宿",@"image":@""},
                     @{@"title":@"ラーメン吉祥亭",@"place":@"吉祥寺",@"image":@""}
                     ] mutableCopy];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CollectionViewController

//***************************************
//TableViewController同様に、セクション数を設定
//***************************************
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

//***************************************
//TableViewController同様に、セルの数を設定
//***************************************
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [_objects count];
}

//***************************************
//TableViewController同様に、表示内容を設定
//***************************************
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    //StoryBoard上のCollectionViewCellの部品を取り出して利用する
    static NSString *CellIdentifier = @"Cell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    //CollectionViewCell上に貼り付けたView部品にはtagを設定しておき、そのtagを使って部品を指定してテキストなどを変更する
    UILabel *name = (UILabel *)[cell viewWithTag:1];
    name.text = _objects[indexPath.row][@"title"];

    return cell;
}

#pragma mark - Seque

//***************************************
//セルをタッチした時のセグウェイで、次のViewControllerのプロパティに
//選択された箇所のNSDictionaryデータだけを渡す
//***************************************
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    //セグウェイから、移動先のViewControllerを取得
    DetailViewController *nextViewController = (DetailViewController *)segue.destinationViewController;
    
    //選択されたセルのindexPathを取得（CollectionViewの仕組みでは複数選択が可能なので、0番目が今回選ばれたセル）
    NSIndexPath *indexPath = [self.collectionView indexPathsForSelectedItems][0];
    
    //移動先のViewControllerのdetailDataプロパティに、NSArrayから該当するNSDictionaryを取り出して渡す
    nextViewController.detailData = _objects[indexPath.row];
}

@end
