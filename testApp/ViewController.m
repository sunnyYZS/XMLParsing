//
//  ViewController.m
//  testApp
//
//  Created by Tony on 2018/9/6.
//  Copyright © 2018年 Tony. All rights reserved.
//

#import "ViewController.h"
#import "SaxManager.h"
#import "DomManager.h"
#import "XMLReaderManager.h"
@interface ViewController ()
@property(nonatomic,strong)UIButton *saxBtn;
@property(nonatomic,strong)UIButton *domBtn;
@property(nonatomic,strong)UIButton *XMLReaderBtn;

@property (nonatomic, copy) SaxManager *saxManager;
@property (nonatomic, copy) DomManager *domManager;
@property (nonatomic, copy) XMLReaderManager *XMLReaderManager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _saxBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    _saxBtn.frame = CGRectMake((self.view.frame.size.width - 150)/2, 100, 150, 50);
    [_saxBtn setTitle:@"SAX解析(原生)" forState:UIControlStateNormal];
    [_saxBtn addTarget:self action:@selector(saxAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_saxBtn];
    
    //问题一：libxml/tree.h file not found
    //解决方案：https://blog.csdn.net/panjican/article/details/51264931
    _domBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    _domBtn.frame = CGRectMake((self.view.frame.size.width - 150)/2, 160,150, 50);
    [_domBtn setTitle:@"DOM解析(谷歌)" forState:UIControlStateNormal];
    [_domBtn addTarget:self action:@selector(domAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_domBtn];
    
    _XMLReaderBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    _XMLReaderBtn.frame = CGRectMake((self.view.frame.size.width - 150)/2, 220,150, 50);
    [_XMLReaderBtn setTitle:@"XMLReader解析" forState:UIControlStateNormal];
    [_XMLReaderBtn addTarget:self action:@selector(XMLReaderManagerAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_XMLReaderBtn];
    
    _saxManager = [[SaxManager alloc]init];
    _domManager = [[DomManager alloc]init];
    _XMLReaderManager = [[XMLReaderManager alloc]init];
}


-(void)saxAction
{
    [_saxManager saxManagerResultWithFileName:@"Demo.xml"];
}

-(void)domAction
{
    [_domManager domManagerResultWithFileName:@"Demo.xml"];
}
-(void)XMLReaderManagerAction
{
    [_XMLReaderManager XMLReaderManagerResultWithFileName:@"Demo.xml"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
