//
//  ADPatient.m
//  Lesson12_HW_1
//
//  Created by A D on 12/19/13.
//  Copyright (c) 2013 AD. All rights reserved.
//


#import "ADPatient.h"

@implementation ADPatient

@synthesize patientName =_patientName;
@synthesize patientTemperature = _patientTemperature;


//the method that takes the block as the parameter
-(void) isGettingWorse:(BlockPatient) patientBlock{
    
    //__weak ADPatient *weakSelf = self;
    
    //initiate the block passing the patient itself
    patientBlock(self);
}


- (void)dealloc
{
    NSLog(@"%@ - I am dead", self.patientName);
}


@end
