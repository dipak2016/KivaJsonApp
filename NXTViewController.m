//
//  NXTViewController.m
//  KivaJsonApp
//
//  Created by Tops on 12/16/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

#import "NXTViewController.h"

@interface NXTViewController ()

@end

@implementation NXTViewController
@synthesize tbl_vw,txt_search;
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    arr_filter=[[NSArray alloc]init];
    arr=[[NSArray alloc]init];
    
    NSURL *url=[NSURL URLWithString:@"https://gist.githubusercontent.com/Goles/3196253/raw/9ca4e7e62ea5ad935bb3580dc0a07d9df033b451/CountryCodes.json"];
    NSData *data=[NSData dataWithContentsOfURL:url];
    
    
    arr=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    /*
    for (int i=0; i<arr.count; i++)
    {
        NSLog(@"INDEX:%d VALUE:%@",i,[arr objectAtIndex:i]);
    }
    */ 
    tbl_vw.dataSource=self;
    tbl_vw.delegate=self;
    txt_search.delegate=self;
    tbl_vw.tag=101;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag==101)
    {
        return arr.count;
    }
    else
    {
        return arr_filter.count;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=nil;
    cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    if (tableView.tag==101)
    {
        cell.textLabel.text=[[arr objectAtIndex:indexPath.row]objectForKey:@"name"];
        cell.detailTextLabel.text=[[arr objectAtIndex:indexPath.row]objectForKey:@"code"];
    }
    else
    {
        cell.textLabel.text=[[arr_filter objectAtIndex:indexPath.row]objectForKey:@"name"];
        cell.detailTextLabel.text=[[arr_filter objectAtIndex:indexPath.row]objectForKey:@"code"];
    }
    
    return cell;
    
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (txt_search.text.length==0)
    {
        tbl_vw.tag=101;
    }
    else
    {
        tbl_vw.tag=202;
    NSPredicate *myPredicate = [NSPredicate predicateWithFormat:@"name CONTAINS[cd] %@",[txt_search.text stringByAppendingString:string]];
        arr_filter=[arr filteredArrayUsingPredicate:myPredicate];
        [tbl_vw reloadData];
    }
    
    
    return YES;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *detail=[self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    if (tableView.tag==101)
    {
        detail.st_vw_3=[[arr objectAtIndex:indexPath.row]objectForKey:@"code"];
    }
    else
    {
        detail.st_vw_3=[[arr_filter objectAtIndex:indexPath.row]objectForKey:@"code"];
    }
    [self.navigationController pushViewController:detail animated:YES];
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
