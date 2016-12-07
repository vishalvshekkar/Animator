# Animator
A block-based UIView animation helper which enables consecutive animations to be performed with ease.

![alt tag](https://raw.githubusercontent.com/vishalvshekkar/Animator/master/AnimatorDemoExample.gif)

#Using `Animator`
Animator can be used by invoking `addAnimations` on it. `addAnimations` method accepts various paramters most of which contain default values. Hence, the only required parameter is a closure which contains the animations that need to be performed.

```
Animator.addAnimations() {
    //Animation code
}.animate()
```
