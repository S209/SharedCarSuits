//
//  SCChoiseBrandViewController.m
//  SharedCarSuits
//
//  Created by tuhaisheng on 2018/2/25.
//  Copyright © 2018年 tuhaisheng. All rights reserved.
//

#import "SCChoiseBrandViewController.h"
#import "SCChoiseBrandModel.h"
#import "SCChoiseBrandCarGroupModel.h"
#import "SCManager+RequestInterface.h"
@interface SCChoiseBrandViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,weak) UITableView *tableView;
//@property (nonatomic, copy) NSArray *carGroups;
@property (nonatomic, copy) NSArray * dataArray;
@property (nonatomic, assign) NSInteger numberOfSection;
@property (nonatomic, strong) NSMutableArray * numberOfRowsInSectionArray;
@end

@implementation SCChoiseBrandViewController
- (NSMutableArray *)numberOfRowsInSectionArray
{
    if (!_numberOfRowsInSectionArray) {
        _numberOfRowsInSectionArray = [NSMutableArray array];
    }
    return _numberOfRowsInSectionArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavigationWithTitle:@"选择品牌"];
    [self setupView];
    self.navigationItem.leftBarButtonItem = nil;
    [self sy_rightBarDeleteItemWithDelete];
    [self loadData];
}

- (void)loadData
{
    [[SCManager shareInstance]allCarBrandSuccess:^(NSURLSessionDataTask *serializer, id responseObject) {
        NSArray * infoArray = responseObject;
        if (infoArray.count && [infoArray isKindOfClass:[NSArray class]]) {
            self.dataArray = [[NSArray yy_modelArrayWithClass:[SCChoiseBrandModel class]json:infoArray] copy] ;
            [self handleData];
        }
        [self.tableView reloadData];
    } notice:^(NSURLSessionDataTask *serializer, id responseObject) {
        
    } failure:^(NSURLSessionDataTask *serializer, NSError *error) {
        
    }];
}


- (void)handleData
{
    NSString *  shortCutString;
    NSMutableArray * brandCarGroupArray ;
    for (NSUInteger i = 0; i <self.dataArray.count; i++) {
        SCChoiseBrandModel * brandModel = [self.dataArray safeObjectAtIndex:i];
        if ([shortCutString isEqualToString:brandModel.shortCut]) {
            [brandCarGroupArray addObject:brandModel];
        }else{
            if (i!=0) {
                SCChoiseBrandCarGroupModel * carGroupModel = [[SCChoiseBrandCarGroupModel alloc] init];
                carGroupModel.cars = [brandCarGroupArray copy];
                carGroupModel.title = brandModel.shortCut;
                [self.numberOfRowsInSectionArray addObject:carGroupModel];
            }
            shortCutString = brandModel.shortCut;
            brandCarGroupArray = [NSMutableArray array];
            [brandCarGroupArray addObject:brandModel];
        }
    }
}

- (void)setupView
{
    UITableView * tableView = [[UITableView alloc] init];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    self.tableView = tableView;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.top.equalTo(self.view.mas_top).with.offset(0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-0);
    }];
}

//设置分区
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return self.numberOfRowsInSectionArray.count;
}

//设置每个分区显示多少行数据
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    SCChoiseBrandCarGroupModel * model = self.numberOfRowsInSectionArray[section];
    return model.cars.count;
}
//每行显示的数据
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID=@"A";
    //从缓存中读取cell
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    //如果缓存中没有cell，创建一个新的cell
    if(cell==nil){
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    //找到当前分区的索引
    SCChoiseBrandCarGroupModel * groupModel = self.numberOfRowsInSectionArray[indexPath.section];
    //找到当前分区的行
    SCChoiseBrandModel * carModel = groupModel.cars[indexPath.row];
    //设置cell显示的文字
    cell.textLabel.text= carModel.carCategoryName;
    //设置cell显示的图片
    [[SDWebImageManager sharedManager] loadImageWithURL:[NSURL URLWithString:carModel.logoImg] options:SDWebImageRetryFailed progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        
    } completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, SDImageCacheType cacheType, BOOL finished, NSURL * _Nullable imageURL) {
        if (finished) {
          [cell.imageView setImage:image];
        }
    }];
    return cell;
}

//设置头样式
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    //找到当前分区在数组中的索引
    SCChoiseBrandCarGroupModel * model = self.numberOfRowsInSectionArray[section];
    
    //返回当前分区的数据中的title
    return model.title;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //找到当前分区的索引
    SCChoiseBrandCarGroupModel * groupModel = self.numberOfRowsInSectionArray[indexPath.section];
    //找到当前分区的行
    SCChoiseBrandModel * carModel = groupModel.cars[indexPath.row];
 
    
    [[NSNotificationCenter defaultCenter] postNotificationName:SCSelectCarSuccess object:carModel.carCategoryName];
    [self.navigationController popViewControllerAnimated:YES];
}

//设置索引
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return [self.numberOfRowsInSectionArray valueForKeyPath:@"title"];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
