# JBSoundRouter
Simple class for routing sounds to speaker / phone speaker. Made because to solve webRTC routing problems.

### Installation with CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like JBMessage in your projects.

#### Podfile

```ruby
platform :ios, '7.0'
pod 'JBSoundRouter'

## Swap to regular (the one near Lightening connector) speaker
### Swift
```swift
JBSoundRouter.routeSound(JBSoundRoute.Speaker)
```
### Objective-C
```objective-c
	[JBSoundRouter routeSound:JBSoundRouteSpeaker];
```
## Swap to phone (ear) speake
### Swift
```swift
JBSoundRouter.routeSound(JBSoundRoute.PhoneSpeaker)
```
### Objective-C
```objective-c
	[JBSoundRouter routeSound:JBSoundRoutePhoneSpeaker];
```

