//
//  ViewController.m
//  iOS_Tips_5
//
//  Created by yuanshi on 2020/7/21.
//  Copyright © 2020 yuanshi. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
@interface ViewController ()
@property (nonatomic,strong) UITextField *textField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // iOS UITextField leftView rightView
    UIImageView *leftView = [[UIImageView alloc] init];
    leftView.backgroundColor = [UIColor orangeColor];
    self.textField.leftView = leftView;
    self.textField.leftViewMode = UITextFieldViewModeAlways;
    
    // iOS runtime遍历所有成员变量

    unsigned int count = 0;
    // 拷贝出所有的成员变量列表
    Ivar *ivars = class_copyIvarList([UITextField  class], &count);
    for (int i = 0; i < count; i++) {
        
           // 取出成员变量
           Ivar ivar = ivars[i];
           // 打印成员变量名字
           NSLog(@"%s", ivar_getName(ivar));
     }
     // 释放
    free(ivars);
    
   // UITextField改变placeholder的字体或颜色
    self.textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Placeholder Text"
           attributes:@{
                         NSForegroundColorAttributeName: [UIColor redColor],
                         NSFontAttributeName : [UIFont systemFontOfSize:16]
                       }
    ];
}


@end
