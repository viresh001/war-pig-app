//
//  WRPGItem.m
//  RandomItems
//
//  Created by Viresh Ramdatmisier on 12/29/14.
//  Copyright (c) 2014 War Pig Enterprises. All rights reserved.
//

#import "WRPGItem.h"

@implementation WRPGItem

+ (instancetype)randomItem  {
    NSArray *randomAdjectiveList = @[@"Fluffy", @"Rusty", @"Shiny"];
    NSArray *randomNounList = @[@"Bear", @"Spork", @"Mac"];
    
    NSInteger adjectiveIndex = arc4random() % [randomAdjectiveList count];
    NSInteger nounIndex = arc4random() % [randomNounList count];
    
    NSString *randomName = [NSString stringWithFormat:@"%@ %@",
                            randomAdjectiveList[adjectiveIndex], randomNounList[nounIndex]];
    
    int randomValue = arc4random() % 100;
    
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                    '0' + arc4random() %10,
                                    'A' + arc4random() %26,
                                    '0' + arc4random() %10,
                                    'A' + arc4random() %26,
                                    '0' + arc4random() %10];
    
    WRPGItem *newItem  = [[self alloc]
                          initWithItemName:randomName
                          valueInDollars:randomValue
                          serialNumber:randomSerialNumber];
    return newItem;
}

//chaining initializers init->initWithItemName
- (instancetype) init  {
    return [self initWithItemName:@"Item"];
}

- (instancetype)initWithItemName:(NSString *)name {
    return [self initWithItemName:name valueInDollars:0 serialNumber:@""];
}

-(instancetype)initWithItemName:(NSString *)name serialNumber:(NSString *)sNumber  {
    return [self initWithItemName:name valueInDollars:0 serialNumber:sNumber];
}

- (instancetype)initWithItemName:(NSString *)name valueInDollars:(int)value serialNumber:(NSString *)sNumber  {
    //init the base class
    self = [super init];
    if(self)  {
        _itemName = name;
        _serialNumber = sNumber;
        _valueInDollars = value;
        _dateCreated = [[NSDate alloc] init];
    }
    return self;
}

- (NSString *)description  {
    NSString *descriptionString = [[NSString alloc]
                                   initWithFormat:@"%@ (%@): Worth $%d, recorded on %@",
                                   self.itemName,
                                   self.serialNumber,
                                   self.valueInDollars,
                                   self.dateCreated];
    return descriptionString;
}

- (void)dealloc  {
    NSLog(@"Destroyed: %@", self);
}

/*
- (void)setItemName:(NSString *)str  {
    _itemName = str;
}

- (NSString *)itemName  {
    return _itemName;
}

-(void)setSerialNumber:(NSString *)str  {
    _serialNumber = str;
}

- (NSString *) serialNumber  {
    return _serialNumber;
}

- (void)setValueInDollars:(int)v  {
    _valueInDollars = v;
}

- (int)valueInDollars  {
    return _valueInDollars;
}

- (NSDate *)dateCreated  {
    return _dateCreated;
}
*/
- (void)setContainedItem:(WRPGItem *)containedItem  {
    _containedItem = containedItem;
    self.containedItem.container = self;
}
/*
- (WRPGItem *)containedItem  {
    return _containedItem;
}

- (void)setContainer:(WRPGItem *)container  {
    _container = container;
}

- (WRPGItem *)container  {
    return _container;
}
*/



@end
