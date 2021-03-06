//
//  helpPhoneSecondViewController.m
//  helpPhone
//
//  Created by CHANG HUNG-WEI on 12/11/22.
//  Copyright (c) 2012年 CHANG HUNG-WEI. All rights reserved.
//

#import "helpPhoneSecondViewController.h"
#import "SimpleTableCell.h"
@interface helpPhoneSecondViewController ()

@end

@implementation helpPhoneSecondViewController
{
    NSMutableArray *tableData;//設定一組名稱存放名稱數據使用
    NSMutableArray *thumbnails;//設定一組名稱存放圖片數據使用
    NSArray *phone;//設定一組名稱存放電話號碼數據使用
    NSArray *textPhone;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //自定義初始化
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //新方法讀資料庫
    //判斷資料庫的全路徑，全名跟副檔名，存入path做使用
    NSString *path = [[NSBundle mainBundle] pathForResource:@"recipes1" ofType:@"plist"];
    //加載path文件的內容和數據讀入dict陣列
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    //抓取讀出陣列裡的資料，放入已設定好的暫存位子供之後使用
    tableData = [dict objectForKey:@"RecipeName"];
    thumbnails = [dict objectForKey:@"Thumbnail"];
    phone = [dict objectForKey:@"Phone"];
    textPhone = [dict objectForKey:@"TextPhone"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    //任何資源，可以重新處理。
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [tableData count];//count 方法簡單遞迴 tableData 數據中元素組數
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    //取出自定按鈕的位子
    SimpleTableCell *cell = (SimpleTableCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SimpleTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    //讀取抓的到按鈕位子，秀出對應資料庫的檔案內容
    cell.nameLabel.text = [tableData objectAtIndex:indexPath.row];
    cell.thumbnailImageView.image = [UIImage imageNamed:[thumbnails objectAtIndex:indexPath.row]];
    cell.telLabe.text = [textPhone objectAtIndex:indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //設定TableCell視窗多寬
    return 57;
}
//設定點選後底下出現選單
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //判斷點選該按鈕對應的數字
    NSUInteger row = [indexPath row];
    NSLog(@"index:%d",row);
    //判斷後去資料庫找尋 秀出該資料
    NSString *string=[NSString stringWithFormat:@"是否撥打 %@",tableData[row]];
    //當點選的時候會出現顯示小視窗的內容
    UIActionSheet *messageAlert = [[UIActionSheet alloc] initWithTitle:string delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"非常确定" otherButtonTitles:@"取消", nil];
    //秀出小視窗
    [messageAlert showInView:tableView];
    
}
//點選選單後觸發的事件
-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    //判斷點選哪個鈕之後才能去找尋該匯出哪筆資料
    NSIndexPath *indexPath = [self.teltableView indexPathForSelectedRow];
    //印出點選的按鈕對應數字
    NSLog(@"index:%d",indexPath.row);
    if (buttonIndex == 1)
    {
        //判斷點選取消鍵
        NSLog(@"点击了取消按钮");
    }
    else if (buttonIndex == 0)
    {
        //判斷點選哪個TableView後，去資料庫找尋電話資料撥打出去
        NSString * phone1=[NSString stringWithFormat:@"tel:/%@",phone[indexPath.row]];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phone1]];
        //判斷點選確認鍵
        NSLog(@"点击了確定按钮");
        NSLog(@"%@",phone1);
    }
    //點擊後消失藍色選鍵
    [self.teltableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
