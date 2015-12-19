//
//  DKBFTSVc.m
//  demon
//
//  Created by 吴洋 on 15/11/24.
//  Copyright © 2015年 beautiful. All rights reserved.
//

#import "DKBFTSVc.h"
#import "UIView+DKViewFrame.h"
#import "DKSettingCell.h"



@interface DKBFTSVc ()
@property(nonatomic,strong)UIToolbar *barItem;
@property(nonatomic,strong)UIDatePicker *datePicker;
@property(nonatomic,strong)UITextField *textField;
@property(nonatomic,strong)DKSettingCell *selectedCell;


@end

@implementation DKBFTSVc

//设置barItem
- (UIToolbar *)barItem{
    if (_barItem==nil) {
        
        _barItem=[[UIToolbar alloc]init];
        _barItem.h=44;
        UIBarButtonItem *doneBar=[[UIBarButtonItem alloc]initWithTitle:@"done" style:UIBarButtonItemStyleDone target:self action:@selector(didClickDoneBtn:)];
         UIBarButtonItem *cancel=[[UIBarButtonItem alloc]initWithTitle:@"cancle" style:UIBarButtonItemStylePlain target:self action:@selector(didClickCancleBtn)];
        UIBarButtonItem *f=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        _barItem.items=@[cancel,f,doneBar];
        
    }
    return _barItem;

}

//设置datePicker
- (UIDatePicker *)datePicker{
    if (_datePicker==nil) {
        _datePicker=[[UIDatePicker alloc]init];
        _datePicker.datePickerMode=UIDatePickerModeTime;
        _datePicker.locale=[NSLocale localeWithLocaleIdentifier:@"ch-Hans"];

    }

    return _datePicker;
}


//设置textField
- (UITextField *)textField{
    if (_textField==nil) {
        _textField=[[UITextField alloc]init];
        _textField.inputView=self.datePicker;
        _textField.inputAccessoryView=self.barItem;
        
    }
    return _textField;

}



- (void)didClickDoneBtn:(UIBarButtonItem *)sender{
    


    NSDate *date=self.datePicker.date;

    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    formatter.dateFormat=@"HH:mm";
    NSString *str=[formatter stringFromDate:date];

//    NSIndexPath *indexPath=[self.tableView indexPathForSelectedRow];
//    UITableViewCell *cell=[self.tableView cellForRowAtIndexPath:indexPath];
//    
//    cell.detailTextLabel.text=str;
    [self.selectedCell setTextFiledText:str];

    

    
    
    
    [self didClickCancleBtn];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell=[self.tableView cellForRowAtIndexPath:indexPath];
    //取消选中状态
    [tableView deselectRowAtIndexPath:indexPath  animated:YES];
    self.selectedCell=(DKSettingCell *)cell;
    if (indexPath.section==0) {
        return;
    }
    [cell.contentView addSubview:self.textField];
    [self.textField becomeFirstResponder];


}



- (void)didClickCancleBtn{
    [self.view endEditing:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}




@end
