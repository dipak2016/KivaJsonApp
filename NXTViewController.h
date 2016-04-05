//
//  NXTViewController.h
//  KivaJsonApp
//
//  Created by Tops on 12/16/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"
@interface NXTViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    NSArray *arr;
    NSArray *arr_filter;
}
@property (weak, nonatomic) IBOutlet UITableView *tbl_vw;
@property (weak, nonatomic) IBOutlet UITextField *txt_search;

@end
