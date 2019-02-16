//
//  DomManager.m
//  testApp
//
//  Created by Tony on 2018/9/8.
//  Copyright © 2018年 Tony. All rights reserved.
//

#import "DomManager.h"

@implementation DomManager
-(void)domManagerResultWithFileName:(NSString *)fileName
{
    self.studentArray = [NSMutableArray array];
    
    NSString *xmlFilePath = [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
    NSData *xmlData = [NSData dataWithContentsOfFile:xmlFilePath];
    
    NSError *error = nil;
    
    GDataXMLDocument *xmlDocument = [[GDataXMLDocument alloc] initWithData:xmlData options:0 error:&error];
    
    if (error) {
        NSLog(@"error : %@", error);
        return;
    }
    // 取根节点
    GDataXMLElement *rootElement = [xmlDocument rootElement];
    // 获取根节点下的所有子节点
    NSArray *elementArray =  rootElement.children;
    for (GDataXMLElement *studentElement in elementArray) {
        
        Student *stu = [[Student alloc] init];
        [_studentArray addObject:stu];
        
        for (GDataXMLElement *attributeElement in studentElement.children) {
            [stu setValue:attributeElement.stringValue forKey:attributeElement.name];
        }
        
    }
    NSLog(@"array : %@", _studentArray);
}
@end
