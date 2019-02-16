//
//  DomManager.h
//  testApp
//
//  Created by Tony on 2018/9/8.
//  Copyright © 2018年 Tony. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "GDataXMLNode.h"
@interface DomManager : NSObject
@property (nonatomic, retain) NSMutableArray *studentArray;

-(void)domManagerResultWithFileName:(NSString *)fileName;
@end
