//
//  ViewController.m
//  MemoryManagement
//
//  Created by Paul Solt on 1/29/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "ViewController.h"
#import "Car.h"
#import "Person.h"
#import "LSILog.h"

@interface ViewController ()

@property (nonatomic, copy) NSString *favoriteFood;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"Hi");
    
    //    NSString *name = [[NSString alloc] initWithString:@"Chad"]; // Reference Count = 1
    //    [name retain]; // Reference Count = 2
    //    [name retain]; // Reference Count = 3
    //    [name release]; // Reference Count = 2
    //    [name release]; // Reference Count = 1
    //
    //    NSString *alias = [name retain]; // Reference Count = 2
    //    NSString *aliasCopy = [alias copy]; // Reference Count = 1
    //
    //    [aliasCopy release]; // Reference Count = 0
    //    aliasCopy = nil;
    //    [alias release]; // Reference Count = 1
    //    alias = nil;
    //    [name release]; // Reference Count = 0
    //    name = nil;
    
    self.favoriteFood = @"Pizza"; // Reference Count = 1
    
    // CAR + PERSON
    Car *escape = [Car carWithMake:@"Escape"];
    Person *chad = [[Person alloc] initWithCar:escape];
    NSLog(@"Person: %@", chad);
    NSLog(@"Car: %@", escape);
    [chad release];
    chad = nil;
    
    //    // Is the object autoreleased? Why?
    //    NSString *name = [NSString stringWithFormat:@"%@ %@", @"John", @"Miller"];
    //    NSLog(@"%@", name);
    //    // yes
    //    NSDate *today = [NSDate date];
    //    NSLog(@"%@", today);
    //    // yes
    //    NSDate *now = [[NSDate new] autorelease];
    //    NSLog(@"%@", now);
    //    // no
    //    NSDate *tomorrow2 = [NSDate dateWithTimeIntervalSinceNow:60*60*24];
    //    // yes
    //    NSDate *nextTomorrow = [[tomorrow2 copy] autorelease]; // retain: 1
    //    NSLog(@"%@", nextTomorrow);
    //    NSArray *words = [@"This sentence is the bomb" componentsSeparatedByString:@" "];
    //    NSLog(@"%@", words);
    //    NSString *idea = [[[NSString alloc] initWithString:@"Hello Ideas"] autorelease];
    //    NSLog(@"%@", idea);
    //    Car *redCar = [Car carWithMake:@"Camaro"];
    //    NSLog(@"%@", redCar);
    //    NSString *idea2 = [[[NSString alloc] initWithString:@"Hello Ideas"] autorelease];
    //    NSLog(@"%@", idea2);
    //    NSString *idea3 = [[NSString alloc] initWithString:@"Hello Ideas"];
    //    [idea3 autorelease];
    
    // Arrays (collections)
    NSArray *inputArray = @[@"Paul", @"Isaac", @"John", @"Jesse"];
    // Manual Reference Counting = MRC = ownership
    NSMutableArray *names = [[NSMutableArray alloc] init]; // names: 1
    for (int i = 0; i < inputArray.count; i++) {
        NSString *name = [[NSString alloc] initWithFormat:@"%@", inputArray[i]]; // name: 1
        [names addObject:name]; // name: 2   // All Collections will call retain on objects they manage
        [name release]; // name: 1
    }
    [names removeAllObjects]; // reduce retain count and remove all values
}

- (void)dealloc {
    [_favoriteFood release];
    _favoriteFood = nil;
    [super dealloc];
}

@end
