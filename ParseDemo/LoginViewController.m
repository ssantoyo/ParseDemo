//
//  LoginViewController.m
//  ParseDemo
//
//  Created by Sergio Santoyo on 7/6/20.
//  Copyright © 2020 ssantoyo. All rights reserved.
//

#import "LoginViewController.h"
#import <Parse/Parse.h>

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;



@end

@implementation LoginViewController

- (void)viewDidLoad {
    
}


- (IBAction)signupButton:(id)sender {
    
    if ([self.usernameField.text isEqual:@""] || [self.passwordField.text isEqual:@""]) {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Username and Password Fields Required"
           message:@"Please enter your username and password"
    preferredStyle:(UIAlertControllerStyleAlert)];
    
    // create an OK action
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    // handle response here.
    }];
    
    // add the OK action to the alert controller
    [alert addAction:okAction];
    
    [self presentViewController:alert animated:YES completion:^{
    }];}
    
    else{
    // initialize a user object
    PFUser *newUser = [PFUser user];

    // set user properties
    newUser.username = self.usernameField.text;
    newUser.password = self.passwordField.text;
  
      // call sign up function on the object
      [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
          if (error != nil) {
              NSLog(@"Error: %@", error.localizedDescription);
             
          } else {
              NSLog(@"User registered successfully");
              
              // manually segue to logged in view
          }
      }];
}
}

- (IBAction)loginButton:(id)sender {
    
    if ([self.usernameField.text isEqual:@""] || [self.passwordField.text isEqual:@""]) {
       
       UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Username and Password Fields Required"
              message:@"Please enter your username and password"
       preferredStyle:(UIAlertControllerStyleAlert)];
       
       // create an OK action
       UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
       // handle response here.
       }];
       
       // add the OK action to the alert controller
       [alert addAction:okAction];
       
       [self presentViewController:alert animated:YES completion:^{
       }];}
    
    else{
        
    NSString *username = self.usernameField.text;
    NSString *password = self.passwordField.text;
    
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * user, NSError *  error) {
        if (error != nil) {
            NSLog(@"User log in failed: %@", error.localizedDescription);
        } else {
            NSLog(@"User logged in successfully");
            
            // display view controller that needs to shown after successful login
        }
    }];
        
    }
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
