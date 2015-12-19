
//
//  DKSettingVc.m
//  demon
//
//  Created by 吴洋 on 15/11/23.
//  Copyright © 2015年 beautiful. All rights reserved.
//

#import "DKSettingVc.h"
#import "DKSettingCell.h"

@interface DKSettingVc ()
@property(nonatomic,strong)NSArray *groups;

@end

@implementation DKSettingVc

- (instancetype)init{
    
    return [super initWithStyle:UITableViewStyleGrouped];
    
}

- (instancetype)initWithStyle:(UITableViewStyle)style{
    
    return [super initWithStyle:UITableViewStyleGrouped];
    
}


- (void)setPlistName:(NSString *)plistName{
    _plistName=plistName;
    self.groups=[NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:plistName ofType:nil]];
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"NavBack"] style:UIBarButtonItemStylePlain target:self action:@selector(goBackVc)];
    self.tableView.showsVerticalScrollIndicator=NO;
    
    
    
}
//点击返回按钮
- (void)goBackVc{
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}


//数据源
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.groups.count;
    
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSDictionary *groups=self.groups[section];
    return     [groups[@"items"] count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //获取数据
    NSDictionary *groups=self.groups[indexPath.section];
    NSDictionary *items=groups[@"items"][indexPath.row];
    
    
    //设置cell
    
    DKSettingCell *cell=[DKSettingCell creatCellWithTableView:tableView andDict:items];
    
    cell.dict=items;
    
    return cell;
    
}

//返回头部、尾部文字
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    NSDictionary *groups=self.groups[section];
    return groups[@"footer"];
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSDictionary *groups=self.groups[section];
    return groups[@"header"];
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath  animated:YES];
    //获取选中行数据
    
    NSDictionary *groups=self.groups[indexPath.section];
    
    NSDictionary *items=groups[@"items"][indexPath.row];
    
    //判断方法
    if(items[@"checkFunc"] && [items[@"checkFunc"] length]>0){
        
        NSString *func=items[@"checkFunc"];
        
        SEL funcs = NSSelectorFromString(func);
        
        [self performSelector:funcs];
    }
    
    
    
    Class targetVc = NSClassFromString(items[@"targetVc"]);
    
    id desVc=[[targetVc alloc]init];
    
    if (items[@"targetVc"]&&([items[@"targetVc"] length])>0) {
        [self.navigationController pushViewController:desVc animated:YES];
        
        
        if ([desVc isKindOfClass:[DKSettingVc class]]) {
            DKSettingVc *settingDes=(DKSettingVc *)desVc;
            settingDes.plistName=items[@"plistName"];
        }
    }
}

//检查版本弹框
- (void)pushAlertView{
    
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"当前最新版本" message:@"1.1" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action=[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil];
    
    [alert addAction:action];
    
    [self presentViewController:alert animated:YES completion:nil];
    
    
    
    
}



@end
