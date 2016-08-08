//
//  SimpleAddSubviewViewController.m
//  GPUImageViewBugDemo
//
//  Created by Valentine on 08.08.16.
//  Copyright © 2016 Silvansky. All rights reserved.
//

#import "SimpleAddSubviewViewController.h"

#import "GPUImage.h"

@interface SimpleAddSubviewViewController ()

@property (nonatomic, strong) GPUImageView *gpuView;
@property (nonatomic, strong) GPUImagePicture *stillImageSource;
@property (nonatomic, strong) GPUImageFilter *sepiaFilter;

@end

@implementation SimpleAddSubviewViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	UIImage *inputImage = [UIImage imageNamed:@"swan.jpg"];

	self.gpuView = [[GPUImageView alloc] initWithFrame:self.view.bounds];
	self.gpuView.fillMode = kGPUImageFillModePreserveAspectRatio;

	[self.view addSubview:self.gpuView];

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
