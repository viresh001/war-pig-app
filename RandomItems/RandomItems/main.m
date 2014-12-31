//
//  main.m
//  RandomItems
//
//  Created by Viresh Ramdatmisier on 12/29/14.
//  Copyright (c) 2014 War Pig Enterprises. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WRPGItem.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //create mutable array object & store its address in items variable
        NSMutableArray *items = [[NSMutableArray alloc] init];
        
        WRPGItem *item = [[WRPGItem alloc] init];
        [item setItemName:@"Red Sofa"];
        [item setSerialNumber:@"1B2C"];
        item.serialNumber = @"1B2C";
        item.valueInDollars = 100;
        NSLog(@"%@ %@ %@ %d", [item itemName], [item dateCreated], [item serialNumber], [item valueInDollars]);

        for(int i=0; i < 10; i++)  {
            WRPGItem *item = [WRPGItem randomItem];
            [items addObject:item];
        }
        
        WRPGItem *backpack = [[WRPGItem alloc]initWithItemName:@"BackPack"];
        [items addObject:backpack];
        
        WRPGItem *calculator = [[WRPGItem alloc]initWithItemName:@"Calculator"];
        [items addObject:calculator];
        
        backpack.containedItem = calculator;
        
        backpack = nil;
        calculator = nil;
        
        for(WRPGItem *item in items) {
            NSLog(@"%@", item);
        }
        
        //destroy the mutable array & calls dealloc
        NSLog((@"Setting items to nil..."));
        items = nil;
        
        
    }
    return 0;
}
