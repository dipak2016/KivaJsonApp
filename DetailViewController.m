//
//  DetailViewController.m
//  KivaJsonApp
//
//  Created by Tops on 12/16/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize st_vw_3,tbl_vw;
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    arr_main=[[NSMutableArray alloc]init];
    dict_mute=[[NSMutableDictionary alloc]init];
    tbl_vw.dataSource=self;
    tbl_vw.delegate=self;
    
    NSString *st_format=[NSString stringWithFormat:@"http://api.kivaws.org/v1/lenders/search.json?country_code=%@",st_vw_3];
    NSURL *url=[NSURL URLWithString:st_format];
    NSData *data=[NSData dataWithContentsOfURL:url];
    NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    /*
    for (id ids in dict)
    {
        NSLog(@"KEY:%@ VALUE:%@",ids,[dict objectForKey:ids]);
    }
    */
    
    NSArray *arr=[dict objectForKey:@"lenders"];
    for (int i=0; i<arr.count; i++)
    {
        //NSLog(@"INDEX:%d VALUE:%@",i,[arr objectAtIndex:i]);
        
        [dict_mute setValue:[[arr objectAtIndex:i]objectForKey:@"name"] forKey:@"name"];
        
        NSPredicate *prd=[NSPredicate predicateWithFormat:@"SELF==%@",@"country_code"];
        
        if ([[[[arr objectAtIndex:i]allKeys]filteredArrayUsingPredicate:prd]count]==1)
        {
            [dict_mute setValue:[[arr objectAtIndex:i]objectForKey:@"country_code"] forKey:@"country_code"];
        }
        else
        {
            [dict_mute setValue:[[arr objectAtIndex:i]objectForKey:@""] forKey:@"country_code"];
        }
        [arr_main addObject:[dict_mute copy]];
    }
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arr_main.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=nil;
    cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    cell.textLabel.text=[[arr_main objectAtIndex:indexPath.row]objectForKey:@"name"];
    cell.detailTextLabel.text=[[arr_main objectAtIndex:indexPath.row]objectForKey:@"country_code"];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
