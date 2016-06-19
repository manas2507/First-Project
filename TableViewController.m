//
//  TableViewController.m
//  Pro
//
//  Created by Apple on 07/06/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "TableViewController.h"
#import "SimpleTableCell.h"
#import "Model.h"

@interface TableViewController (){
    Model *model;
}

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *Url = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.omdbapi.com/?t=the+last+witch++hunter&y=&plot=short&r=json"]];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        @try {
            NSData *data = [NSData dataWithContentsOfURL:Url];
            NSError *error;
            if (data!=nil) {
                id jsonData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                model = [[Model alloc] initWithDict:jsonData];
                NSLog(@"Title: %@", model.Title);
                NSLog(@"Plot: %@", model.plot);
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.tableView reloadData];
                });

            }
        }
        @catch (NSException *exception) {
            
        }
        @finally {
            
        }
    });
    
    

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

-(void)cellButtonWasTapped{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"My Alert"
                                                                   message:@"This is an alert."
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //UITableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    SimpleTableCell *cell = (SimpleTableCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SimpleTableCell" owner:self options:nil];
    cell = [nib objectAtIndex:0];

    if (cell == nil)
    {
        cell = [[SimpleTableCell alloc] init];
    }
    
    if(model!=nil)
    {
        cell.nameLabel.text = [NSString stringWithFormat:@"%@",model.Title];
        cell.textArea.text = [NSString stringWithFormat:@"%@",model.plot];
        cell.thumbnailImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%li",indexPath.row+1]];
    }
    else
    {
        cell.nameLabel.text = [NSString stringWithFormat:@"Title %li",indexPath.row+1];
        cell.textArea.text = [NSString stringWithFormat:@"Plot %li",indexPath.row+1];
        cell.thumbnailImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%li",indexPath.row+1]];
    }
    cell.thumbnailImageView.image = [UIImage imageNamed:@"IMG_5327.JPG"];
    
    [cell.button addTarget:self action:@selector(cellButtonWasTapped)
          forControlEvents:UIControlEventTouchUpInside];;


    return cell;
}

-(int)heightForRowAtIndexPath:(SimpleTableCell *)SimpleTableCell{
    return 260;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}




/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"
 forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
