//
//  WRPGItem.h
//  RandomItems
//
//  Created by Viresh Ramdatmisier on 12/29/14.
//  Copyright (c) 2014 War Pig Enterprises. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WRPGItem : NSObject  {
    /*
    NSString *_itemName;
    NSString *_serialNumber;
    int _valueInDollars;
    NSDate *_dateCreated;
    */
    //strong reference cycle (two objects owning each other)
    //WRPGItem *_containedItem;
    //make weak reference to break strong reference cycle
    //__weak WRPGItem *_container;
}

//safer to use copy than risk pointing to a mutable object that can change
@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
//getter only with readonly
@property (nonatomic, readonly, strong) NSDate *dateCreated;

//deal with strong reference cycle
@property (nonatomic, strong) WRPGItem *containedItem;
@property (nonatomic, weak) WRPGItem *container;


+ (instancetype) randomItem;

//designated iniitializer for WRPGItem (instancetype used to b id)
- (instancetype)initWithItemName:(NSString *)name valueInDollars:(int)value serialNumber:(NSString *)sNumber;
- (instancetype)initWithItemName:(NSString *)name serialNumber:(NSString *)sNumber;
- (instancetype)initWithItemName:(NSString *)name;

/*
- (void)setItemName:(NSString *)str;
- (NSString *) itemName;
- (void)setSerialNumber:(NSString *)str;
- (NSString *) serialNumber;
- (void)setValueInDollars:(int)v;
- (int)valueInDollars;
- (NSDate *) dateCreated;

- (void)setContainedItem:(WRPGItem *)item;
- (WRPGItem *) containedItem;

- (void)setContainer:(WRPGItem *)container;
- (WRPGItem *) container;
*/
@end
