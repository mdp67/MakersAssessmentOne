//
//  ResultViewController.m
//  MakersAssessmentOne
//
//  Created by Mark Porcella on 5/15/15.
//  Copyright (c) 2015 Mark Porcella. All rights reserved.
//

#import "ResultViewController.h"

@interface ResultViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *networkActivityIndicator;

@end

@implementation ResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.resultFromRootViewController;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self loadWebRequestWithText:@"http://mobilemakers.co"];
    self.networkActivityIndicator.hidden = true;
}

- (void) loadWebRequestWithText:(NSString *)text {
    NSURL *url = [[NSURL alloc] initWithString:text];
    NSURLRequest *urlRequest = [[NSURLRequest alloc ] initWithURL:url];
    [self.webView loadRequest:urlRequest];
}


-(void)webViewDidStartLoad:(UIWebView *)webView {
    [self.networkActivityIndicator startAnimating];
    self.networkActivityIndicator.hidden = false;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.networkActivityIndicator stopAnimating];
    self.networkActivityIndicator.hidden = true;
}

@end
