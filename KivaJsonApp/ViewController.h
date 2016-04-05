//
//  ViewController.h
//  KivaJsonApp
//
//  Created by Tops on 12/16/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    NSMutableArray *arrmute;
    NSTimer *timer;
    int index;
}
@property (weak, nonatomic) IBOutlet UIWebView *web_vw;
@property (weak, nonatomic) IBOutlet UILabel *lbl_nm;
@end

