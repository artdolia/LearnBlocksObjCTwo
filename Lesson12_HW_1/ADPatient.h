//
//  ADPatient.h
//  Lesson12_HW_1
//
//  Created by A D on 12/19/13.
//  Copyright (c) 2013 AD. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ADPatient : NSObject

typedef void(^BlockPatient)(ADPatient *);

@property (strong, nonatomic) NSString *patientName;
@property (assign, nonatomic) CGFloat patientTemperature;
@property (copy, nonatomic) BlockPatient patientBlockProperty;

-(void) isGettingWorse:(BlockPatient) patient;

@end
