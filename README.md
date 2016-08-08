# GPUImageViewBugDemo

This demo project demonstrates a bug in `GPUImageView` of [GPUImage Framework](https://github.com/BradLarson/GPUImage).

## Build instructions

Run `git submodule update` before building the project.

## Bug description

* I add `GPUImageView` to my view hierarchy in three different ways: just calling `addSubview`, adding constraints and setting it as main view for my view controller in storyboard.
* Expectation: all the ways I use to add it, it should work fine.
* Result: on iOS Simulator everything's fine. On iOS device only first approach works, others cause just white screen.

### Simulator screenshots

![Simple addSubview](https://raw.githubusercontent.com/silvansky/GPUImageViewBugDemo/master/simulator_simple_shot.png)
![Adding constraints](https://raw.githubusercontent.com/silvansky/GPUImageViewBugDemo/master/simulator_constraints_shot.png)
![Storybard view](https://raw.githubusercontent.com/silvansky/GPUImageViewBugDemo/master/simulator_storyboard_shot.png)

### Device screenshots

![Simple addSubview](https://raw.githubusercontent.com/silvansky/GPUImageViewBugDemo/master/device_simple_shot.png)
![Adding constraints](https://raw.githubusercontent.com/silvansky/GPUImageViewBugDemo/master/device_constraints_shot.png)
![Storybard view](https://raw.githubusercontent.com/silvansky/GPUImageViewBugDemo/master/device_storyboard_shot.png)

