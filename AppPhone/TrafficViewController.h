//
//  TrafficViewController.h
//  helpPhone
//
//  Created by CHANG HUNG-WEI on 12/11/23.
//  Copyright (c) 2012年 CHANG HUNG-WEI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TrafficViewController : UIViewController<UITableViewDelegate,
UITableViewDataSource,UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UITableView *teltableView;

@end
