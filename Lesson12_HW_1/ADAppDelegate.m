//
//  ADAppDelegate.m
//  Lesson12_HW_1
//
//  Created by A D on 12/19/13.
//  Copyright (c) 2013 AD. All rights reserved.
//

#import "ADAppDelegate.h"
#import "ADPatient.h"

@interface ADAppDelegate ()

@property (strong, nonatomic) NSArray * patientsArray;

@end

@implementation ADAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    ADPatient *patient1 = [[ADPatient alloc] init];
    patient1.patientName = @"Pat1";
    patient1.patientTemperature = [self randPatientTemperature];
    
    ADPatient *patient2 = [[ADPatient alloc] init];
    patient2.patientName = @"Pat2";
    patient2.patientTemperature = [self randPatientTemperature];

    ADPatient *patient3 = [[ADPatient alloc] init];
    patient3.patientName = @"Pat3";
    patient3.patientTemperature = [self randPatientTemperature];

    ADPatient *patient4 = [[ADPatient alloc] init];
    patient4.patientName = @"Pat4";
    patient4.patientTemperature = [self randPatientTemperature];
    
    //the array of the patients
    NSArray *patients = [NSArray arrayWithObjects:patient1, patient2, patient3, patient4, nil];
    
    //set the appDelegate property to the array
    self.patientsArray = patients;
    
    //define the block
    BlockPatient patBlock = ^(ADPatient *patient){
        
        NSLog(@"Patient %@ has temperature %1.1f", patient.patientName, patient.patientTemperature);
        
        if(patient.patientTemperature < 37.f){
            NSLog(@"Patient %@ can go home", patient.patientName);
        }else
            NSLog(@"Patient %@ needs to visit a doctor", patient.patientName);
    };
    
    for(ADPatient *patient in patients){
        patient.patientBlockProperty = patBlock;
        
        //the line below will call the mothod without delay
        //[patient isGettingWorse:patient.patientBlockProperty];
        
        //the line below will call the method with random delay
        [patient performSelector:@selector(isGettingWorse:) withObject:patient.patientBlockProperty afterDelay:[self randomDelay]];
    }

    return YES;
}

//random delay 5-15
-(CGFloat) randomDelay{
    return arc4random()%11 + 5;
}

//random patient temperature 36 - 40
-(CGFloat) randPatientTemperature{
    return arc4random()%5 + 36;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
