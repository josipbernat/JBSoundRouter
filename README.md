# JBSoundRouter
Simple class for routing sounds to speaker / phone speaker. Made because to solve webRTC routing problems.

### Installation with CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like JBMessage in your projects.

#### Podfile

```ruby
platform :ios, '8.0'
pod 'JBSoundRouter'
```

###** Note **
After a bit of strugling I've realized that integration with CocoaPods isn't so stabile. Please avoid it until 0.36 goes out of beta.

### Objective-C
If your want to use JBSoundRouter inside Objective-C class please import JBSoundRouterDefines in your Project-Bridging-Header.h

```objective-c
#import "JBSoundRouterDefines.h"
```

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

