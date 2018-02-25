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
@interface SCChoiseBrandViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,weak) UITableView *tableView;
@property (nonatomic,copy) NSArray *carGroups;
@end

@implementation SCChoiseBrandViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupView];
    [self sy_rightBarDeleteItemWithDelete];
}

- (void)setupView
{
    UITableView * tableView = [[UITableView alloc] init];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.top.equalTo(self.view.mas_top).with.offset(SYNavigationBarHeight);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-0);
    }];
}

//设置分区
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.carGroups.count;
}

//设置每个分区显示多少行数据
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    SCChoiseBrandCarGroupModel * model = self.carGroups[section];
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
    SCChoiseBrandCarGroupModel * groupModel = self.carGroups[indexPath.section];
    //找到当前分区的行
    SCChoiseBrandModel * carModel = groupModel.cars[indexPath.row];
    //设置cell显示的文字
    cell.textLabel.text= carModel.name;
    //设置cell显示的图片
    cell.imageView.image= [UIImage imageNamed:carModel.icon];
    return cell;
}

//设置头样式
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    //找到当前分区在数组中的索引
    SCChoiseBrandCarGroupModel * model = self.carGroups[section];
    
    //返回当前分区的数据中的title
    return model.title;
}

//设置索引
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return [self.carGroups valueForKeyPath:@"title"];
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
