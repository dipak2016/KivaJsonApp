//
//  DetailViewController.h
//  KivaJsonApp
//
//  Created by Tops on 12/16/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *arr_main;
    NSMutableDictionary *dict_mute;
}
@property (weak, nonatomic) IBOutlet UITableView *tbl_vw;
@property(retain,nonatomic)NSString *st_vw_3;
@end
