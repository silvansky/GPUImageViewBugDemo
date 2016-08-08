//
//  ConstraintsBasedViewController.m
//  GPUImageViewBugDemo
//
//  Created by Valentine on 08.08.16.
//  Copyright © 2016 Silvansky. All rights reserved.
//

#import "ConstraintsBasedViewController.h"

#import "GPUImage.h"

@interface ConstraintsBasedViewController ()

@property (nonatomic, strong) GPUImageView *gpuView;
@property (nonatomic, strong) GPUImagePicture *stillImageSource;
@property (nonatomic, strong) GPUImageFilter *sepiaFilter;

@end

@implementation ConstraintsBasedViewController

- (void)viewDidLoad
{
	[super viewDidLoad];

	UIImage *inputImage = [UIImage imageNamed:@"swan.jpg"];

	self.gpuView = [[GPUImageView alloc] initWithFrame:self.view.bounds];
	self.gpuView.fillMode = kGPUImageFillModePreserveAspectRatio;

	self.gpuView.translatesAutoresizingMaskIntoConstraints = NO;

	[self.view addSubview:self.gpuView];

	NSDictionary *views = @{ @"gpuImageView" : self.gpuView };

	NSMutableArray<NSLayoutConstraint *> *constraints = [[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[gpuImageView]|" options:0 metrics:nil views:views] mutableCopy];
	[constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[gpuImageView]|" options:0 metrics:nil views:views]];
	[self.view addConstraints:constraints];

	self.stillImageSource = [[GPUImagePicture alloc] initWithImage:inputImage];

	self.sepiaFilter = [GPUImageSepiaFilter new];

	[self.stillImageSource addTarget:self.sepiaFilter];

	[self.sepiaFilter addTarget:self.gpuView];

	[self.sepiaFilter useNextFrameForImageCapture];

	[self.stillImageSource processImage];
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
}

@end
