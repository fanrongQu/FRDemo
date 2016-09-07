//
//  AddressBookViewController.m
//  FRDemo
//
//  Created by 1860 on 16/9/7.
//  Copyright © 2016年 QuFanrong. All rights reserved.
//

#import "AddressBookViewController.h"


#import <AddressBookUI/ABPeoplePickerNavigationController.h>
#import <AddressBook/ABPerson.h>
#import <AddressBookUI/ABPersonViewController.h>

@interface AddressBookViewController ()<ABPeoplePickerNavigationControllerDelegate>

@end

@implementation AddressBookViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"选取通讯录联系人");
    [self getABPeoplePicker];
}



- (void)getABPeoplePicker {
    //这个变量用于记录授权是否成功，即用户是否允许我们访问通讯录
    int __block tip=0;
    //声明一个通讯簿的引用
    ABAddressBookRef addBook =nil;
    //创建通讯簿的引用
    addBook=ABAddressBookCreateWithOptions(NULL, NULL);
    //创建一个出事信号量为0的信号
    dispatch_semaphore_t sema=dispatch_semaphore_create(0);
    //申请访问权限
    ABAddressBookRequestAccessWithCompletion(addBook, ^(bool greanted, CFErrorRef error)        {
        //greanted为YES是表示用户允许，否则为不允许
        if (!greanted) {
            tip=1;
        }
        //发送一次信号
        dispatch_semaphore_signal(sema);
    });
    //等待信号触发
    dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
    
    if (tip) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"通讯录权限受限" message:@"请在iPhone的\"设置->隐私->通讯录\"选项中,允许\"苏格联盟\"访问您的通讯录." preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"好" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        }]];
        [alert addAction:[UIAlertAction actionWithTitle:@"去设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if ([self canOpenSystemSettingView]) {
                [self systemSettingView];
            }
        }]];
        [self presentViewController:alert animated:YES completion:nil];
        
        return;
    }
    
    ABPeoplePickerNavigationController *nav = [[ABPeoplePickerNavigationController alloc] init];
    nav.peoplePickerDelegate = self;
    
    nav.predicateForSelectionOfPerson = [NSPredicate predicateWithValue:false];
    
    [self presentViewController:nav animated:YES completion:nil];
}


/**
 *  是否可以打开设置页面
 *
 *  @return
 */
- (BOOL)canOpenSystemSettingView {
    NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        return YES;
    } else {
        return NO;
    }
}

/**
 *  跳到系统设置页面
 */
- (void)systemSettingView {
    NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url];
    }
}

- (void)changeAreaView {
    NSLog(@"选择地区");
}

#pragma mark - ABPeoplePickerNavigationController delegate
//取消选择
- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker
{
    [peoplePicker dismissViewControllerAnimated:YES completion:nil];
}

- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker didSelectPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier {
    
    ABMultiValueRef phone = ABRecordCopyValue(person, kABPersonPhoneProperty);
    long index = ABMultiValueGetIndexForIdentifier(phone,identifier);
    NSString *phoneNO = (__bridge NSString *)ABMultiValueCopyValueAtIndex(phone, index);
    
    if ([phoneNO hasPrefix:@"+"]) {
        phoneNO = [phoneNO substringFromIndex:3];
    }
    
    phoneNO = [phoneNO stringByReplacingOccurrencesOfString:@"-" withString:@""];
    NSLog(@"%@", phoneNO);
    
    NSString *name = [[NSString alloc]init];
    //读取firstname
    NSString *personName = (__bridge NSString*)ABRecordCopyValue(person, kABPersonFirstNameProperty);
    if(personName != nil)
        name = [name stringByAppendingFormat:@"%@",personName];
    //读取lastname
    NSString *lastname = (__bridge NSString*)ABRecordCopyValue(person, kABPersonLastNameProperty);
    if(lastname != nil)
        name = [name stringByAppendingFormat:@"%@",lastname];
    //读取middlename
    NSString *middlename = (__bridge NSString*)ABRecordCopyValue(person, kABPersonMiddleNameProperty);
    if(middlename != nil)
        name = [name stringByAppendingFormat:@"%@",middlename];
    NSLog(@"name:%@",name);
    
   
}

- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController*)peoplePicker didSelectPerson:(ABRecordRef)person
{
    ABPersonViewController *personViewController = [[ABPersonViewController alloc] init];
    personViewController.displayedPerson = person;
    [peoplePicker pushViewController:personViewController animated:YES];
}



@end
