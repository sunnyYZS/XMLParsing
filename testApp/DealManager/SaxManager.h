//
//  SaxManager.h
//  testApp
//
//  Created by Tony on 2018/9/8.
//  Copyright © 2018年 Tony. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

@interface SaxManager : NSObject<NSXMLParserDelegate>
@property (nonatomic, retain) NSMutableArray *studentArray;
// 用来记录当前xml解析的节点名称
@property (nonatomic, copy) NSString *currentElementName;

-(void)saxManagerResultWithFileName:(NSString *)fileName;
@end
