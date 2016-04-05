//
//  ViewController.m
//  KivaJsonApp
//
//  Created by Tops on 12/16/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize lbl_nm,web_vw;
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    arrmute=[[NSMutableArray alloc]init];
    
    NSURL *url=[NSURL URLWithString:@"http://api.kivaws.org/v1/loans/newest.json"];
    NSData *data=[NSData dataWithContentsOfURL:url];
    NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    /*
    for (id ids in dict)
    {
        NSLog(@"KEY:%@ VALUE:%@",ids,[dict objectForKey:ids]);
    }
    */
    NSArray *arr=[dict objectForKey:@"loans"];
    for (int i=0;i<arr.count;i++)
    {
        //NSLog(@"INDEX:%d VALUE:%@",i,[arr objectAtIndex:i]);
        NSString *activity=[[arr objectAtIndex:i]objectForKey:@"activity"];
        NSString *name=[[arr objectAtIndex:i]objectForKey:@"name"];
        NSString *country=[[[arr objectAtIndex:i]objectForKey:@"location"]objectForKey:@"country"];
        float loan=[[[arr objectAtIndex:i]objectForKey:@"loan_amount"]floatValue];
        float funded_amount=[[[arr objectAtIndex:i]objectForKey:@"funded_amount"]floatValue];
        float total=loan-funded_amount;
        NSString *main_str=[NSString stringWithFormat:@"%@ FROM %@ ACTIVITY %@ NEEDS %.1f$ TO PURSE THEIR DREAM",name,country,activity,total];
        [arrmute addObject:main_str];
    }
    /*
    for (int i=0;i<arrmute.count; i++)
    {
        NSLog(@"INDEX:%d VALUE:%@",i,[arrmute objectAtIndex:i]);
    }
    */
    timer=[NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(time_change:) userInfo:nil repeats:YES];
    [web_vw loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.kiva.org/"]]];
}
- (void)time_change:(id)sender
{
    if (arrmute.count-1>index)
    {
        lbl_nm.text=[arrmute objectAtIndex:index];
    }
    else
    {
        //[timer invalidate];
        //timer=nil;
        index=0;
    }
    index++;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
