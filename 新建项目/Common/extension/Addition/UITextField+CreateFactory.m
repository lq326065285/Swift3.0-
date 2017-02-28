//
//  UITextField+CreateFactory.m
//  KADOnlinePharmacies
//
//  Created by ~~浅笑 on 17/1/12.
//  Copyright © 2017年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import "UITextField+CreateFactory.h"

@implementation UITextField (CreateFactory)

+(instancetype)lq_textFieldWithFrame:(CGRect)frame placeholder:(NSString *)placeholder borderStyle:(UITextBorderStyle)borderStyle delegate:(id)delegate font:(CGFloat)font keyboardType:(UIKeyboardType)type{
    UITextField * textField = [[self alloc] initWithFrame:frame];
    textField.delegate = delegate;
    textField.placeholder = placeholder;
    textField.borderStyle = borderStyle;
    textField.font = [UIFont systemFontOfSize:font];
    textField.keyboardType = type;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.layer.cornerRadius = 3;
    textField.layer.masksToBounds = YES;
    textField.layer.borderColor = [UIColor colorWithRed:120 / 255.0 green:120 / 255.0 blue:120 / 255.0 alpha:1].CGColor;
    textField.layer.borderWidth = .5;
    return textField;
}

@end
