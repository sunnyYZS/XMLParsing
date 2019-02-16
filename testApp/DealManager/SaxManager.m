//
//  SaxManager.m
//  testApp
//
//  Created by Tony on 2018/9/8.
//  Copyright © 2018年 Tony. All rights reserved.
//

#import "SaxManager.h"

@implementation SaxManager
-(void)saxManagerResultWithFileName:(NSString *)fileName
{
    NSString *xmlFilePath = [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
    NSData *xmlData = [NSData dataWithContentsOfFile:xmlFilePath];
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:xmlData];
    xmlParser.delegate = self;
    //  开始解析
    [xmlParser parse];
}

// 开始
- (void)parserDidStartDocument:(NSXMLParser *)parser {
    NSLog(@"开始");
    self.studentArray = [NSMutableArray array];
}

// 获取节点头
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    
    NSLog(@"start element : %@", elementName);
    self.currentElementName = elementName;
    if ([elementName isEqualToString:@"student"]) {
        Student *stu = [[Student alloc] init];
        [_studentArray addObject:stu];
    }
}

// 获取节点的值 (这个方法在获取到节点头和节点尾后，会分别调用一次)
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    NSLog(@"value : %@", string);
    if (_currentElementName != nil) {
        Student *stu = [_studentArray lastObject];
        [stu setValue:string forKey:_currentElementName];
    }
}

// 获取节点尾
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    _currentElementName = nil;
    NSLog(@"end element :%@", elementName);
}
// 结束
- (void)parserDidEndDocument:(NSXMLParser *)parser {
    
    NSLog(@"结束");
    NSLog(@"%@",_studentArray);
}
@end
