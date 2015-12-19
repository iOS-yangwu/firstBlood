//
//  DKSettingCell.m
//  demon
//
//  Created by 吴洋 on 15/11/24.
//  Copyright © 2015年 beautiful. All rights reserved.
//

#import "DKSettingCell.h"

@implementation DKSettingCell

- (void)setTextFiledText:(NSString *)str{
    
    self.detailTextLabel.text=str;
    
    NSUserDefaults *def=[NSUserDefaults standardUserDefaults];
    
    [def setObject:str forKey:self.dict[@"lblKey"]];
    
    [def synchronize];
    


}

- (void)setDict:(NSDictionary *)dict{
    _dict=dict;
    
    
    //image
    if (dict[@"icon"]&&[dict[@"icon"] length]>0) {
        
        self.imageView.image=[UIImage imageNamed:dict[@"icon"]];
    }
    
    //detailText 设置detail信息，如果字典有保存的数据，重新赋值
    if(dict[@"detail"]){
        
        if (dict[@"isRed"]) {
            
            self.detailTextLabel.textColor=[UIColor redColor];
        }
        self.detailTextLabel.text=dict[@"detail"];
        
        if (dict[@"lblKey"]&&[dict[@"lblKey"] length]>0) {
            
            NSUserDefaults *def=[NSUserDefaults standardUserDefaults];
            
            NSString * getString = [def valueForKey:dict[@"lblKey"]];
            
            self.detailTextLabel.text=getString;
            
        }
        
        
    }

    //textLbl
    self.textLabel.text=dict[@"title"];

    //创建对象
    Class accessory = NSClassFromString(dict[@"accessory"]);
    
    id obj=[[accessory alloc]init];
    
    if ([obj isKindOfClass:[UIImageView class]]) {
        
        UIImageView *imageView=(UIImageView *)obj;
        
        imageView.image=[UIImage imageNamed:dict[@"accessoryImageName"]];
        
        [imageView sizeToFit];
    }
    
    self.accessoryView=obj;
    
    if ([obj isKindOfClass:[UISwitch class]]) {
    
        
    UISwitch *switcher=(UISwitch *)obj;
        
    [switcher addTarget:self action:@selector(switchChange:) forControlEvents:UIControlEventValueChanged];
        
    NSUserDefaults *defa=[NSUserDefaults standardUserDefaults];
        
    switcher.on=[defa boolForKey:self.dict[@"keyName"]];
  
        
    }
    
    




}

- (void)switchChange:(UISwitch *)switcher{
    
   

    BOOL statue=switcher.isOn;
    
    NSUserDefaults *defa=[NSUserDefaults standardUserDefaults];
    
    NSString *key=self.dict[@"keyName"];
    
    [defa setBool:statue forKey:key];
    
    [defa synchronize];
    
}

+ (UITableViewCellStyle)createCellStyleWithString:(NSString *)style{
    if ([style isEqualToString:@"UITableViewCellStyleValue1"]) {
        
        return UITableViewCellStyleValue1;
        
    }else if ([style isEqualToString:@"UITableViewCellStyleValue2"]){
        
        return UITableViewCellStyleValue2;
        
    }else if([style isEqualToString:@"UITableViewCellStyleSubtitle"]){
        
        return UITableViewCellStyleSubtitle;
        
    }else{
        
        return UITableViewCellStyleDefault;
        
    }
    
    
}


+ (instancetype)creatCellWithTableView:(UITableView *)tableView andDict:(NSDictionary *)dict{
    
    static NSString *ID=@"ID";
    
    DKSettingCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell==nil) {
        
        NSString *style=dict[@"cellStyle"];

        cell=[[DKSettingCell alloc]initWithStyle:[self createCellStyleWithString:style] reuseIdentifier:ID];

    }
    return cell;
}



@end
