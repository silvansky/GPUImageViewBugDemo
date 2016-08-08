//
//  StoryboardViewController.m
//  GPUImageViewBugDemo
//
//  Created by Valentine on 08.08.16.
//  Copyright © 2016 Silvansky. All rights reserved.
//

#import "StoryboardViewController.h"

#import "GPUImage.h"

@interface StoryboardViewController ()

@property (nonatomic, strong) GPUImageView *gpuView;
@property (nonatomic, strong) GPUImagePicture *stillImageSource;
@property (nonatomic, strong) GPUImageFilter *sepiaFilter;

@end

@implementation StoryboardViewController

- (void)viewDidLoad
{
	[super viewDidLoad];

	UIImage *inputImage = [UIImage imageNamed:@"swan.jpg"];

	self.gpuView = (GPUImageView *)self.view;
	self.gpuView.fillMode = kGPUImageFillModePreserveAspectRatio;

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
