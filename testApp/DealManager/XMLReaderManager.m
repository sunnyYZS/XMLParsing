//
//  XMLReaderManager.m
//  testApp
//
//  Created by Tony on 2018/9/8.
//  Copyright © 2018年 Tony. All rights reserved.
//

#import "XMLReaderManager.h"

@implementation XMLReaderManager
-(void)XMLReaderManagerResultWithFileName:(NSString *)fileName
{
    NSString *xmlFilePath = [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
    NSData *xmlData = [NSData dataWithContentsOfFile:xmlFilePath];
    NSError *error = nil;
    if (error) {
        
        NSLog(@"error : %@", error);
    }
    
    NSDictionary *result = [XMLReader dictionaryForXMLData:xmlData error:&error];
    NSLog(@"result : %@", result);
}
@end
