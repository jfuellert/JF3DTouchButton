# JF3DTouchButton
JF3DTouchButton is a touch sensitive button built for 3D touch compatible devices. It provides additional state properties and transitional features to improve a user's 3D touch experience.

![alt tag](https://raw.githubusercontent.com/jfuellert/JF3DTouchButton/master/Images/touchbutton.gif)

##Purpose
The main purpose of this software is to provide developers with a simple way to add non-intrusive 3D touch button enhancements for applications.

##Installation
Install via CocoaPods
Add the following line to your .podfile

```
pod 'JF3DTouchButton'
```
##Support
####IOS
Earliest tested and supported build and deployment target - iOS 9.0.  
Latest tested and supported build and deployment target - iOS 9.1.

##ARC Compatibility
JF3DTouchButton is built from ARC and is ARC-only compatible. 

##Usage
State usage follow a similar syntax to existing state structures for UIButton. 
####Setting a background color
Background color supports UIControlStateNormal, UIControlStateHighlighted, and UIControlStateSelected states. Use ```nil``` to remove a color for state.
``` objective-c
        [touchButton setBackgroundColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [touchButton setBackgroundColor:[UIColor redColor] forState:UIControlStateHighlighted];
``` 
####Setting a size
Size supports UIControlStateNormal, UIControlStateHighlighted, and UIControlStateSelected states. Use ```CGSizeNull``` to remove a size for state. A null value for a state will return the object's current size.
``` objective-c
        [touchButton setSize:CGSizeMake(110.0f, 80.0f) forState:UIControlStateNormal];
        [touchButton setSize:CGSizeMake(260.0f, 60.0f) forState:UIControlStateHighlighted];
``` 

####Setting an image
Image setting supports UIControlStateNormal, UIControlStateHighlighted, and UIControlStateSelected states. Use ```nil``` to remove an image for state.
``` objective-c
        [touchButton setImage:[UIImage imageNamed:@"placeholderNormal"] forState:UIControlStateNormal];
        [touchButton setImage:[UIImage imageNamed:@"placeholderHighlight"] forState:UIControlStateHighlighted];
``` 

####Setting a background image
Background image setting supports UIControlStateNormal, UIControlStateHighlighted, and UIControlStateSelected states. Use ```nil``` to remove a background image for state.
``` objective-c
        [touchButton setBackgroundImage:[UIImage imageNamed:@"placeholderNormal"] forState:UIControlStateNormal];
        [touchButton setBackgroundImage:[UIImage imageNamed:@"placeholderHighlight"] forState:UIControlStateHighlighted];
``` 




