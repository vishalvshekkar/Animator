![alt tag](https://raw.githubusercontent.com/vishalvshekkar/Animator/master/Resources/AnimatorCover.png)

# Animator
Animator is a block-based `UIView` animation helper which enables consecutive animations to be performed with ease.

#Using `Animator`

Most simply, call `addAnimations:` with a closure that contains the animation code on `Animator`. Invoke `animate` to begin animating. This animates whatever statements are in the block with a 1s duration (default).

```
Animator.addAnimations() {
    //Animation code
}.animate()
```

1. Every block of animations that need to be performed during one animation cycle needs to be passed as a parameter to `addAnimations:`
2. `addAnimations:` can be chained.
3. The blocks passed with `addAnimations:` are executed in the ordered these methods are invoked.
4. Every animation block is performed only after the previous block completes.
5. Call `animate` after all animations have been added to begin animating from the first block.
6. `addAnimations:` method contains various parameters that can be passed along to tweak the animation behavior.
7. Most of these parameters have been given default values to get you started with ease.

Many animation blocks can be chained together with very simple and easy-on-the-eye syntax as seen below.

```
Animator.addAnimations() {
    //Animation code
}.addAnimations() {
    //Animation code
}.addAnimations() {
    //Animation code
}.addAnimations() {
    //Animation code
}.addAnimations() {
    //Animation code
}.animate()
```
Each block is executed after the completion of the last block.

#Features of `Animator`

1. Supports setting duration, delay and animationOptions.

    ```
    Animator.addAnimations(withDuration: 1, delay: 1, options: [UIViewAnimationOptions.curveLinear]) {
        //Animation code
    }
    ```

2. Supports animations with spring damping and initial velocity constants.

    ```
    Animator.addAnimations(usingSpringWithDamping: 0.7, initialSpringVelocity: 0) {
        //Animation code
    }
    ```

3. You could pass duration, delay and animationOptions along with with spring damping and initial velocity constants to the function. You could instead choose to leave out duration or animatiOptions  or delay selectively when invoking the function.

4. The `animate` method can accept a completion block to let you know when the entire batch of animations that have been chained together completes.

    ```
    Animator.addAnimations() {
        //Animation code
    }.addAnimations() {
        //Animation code
    }.addAnimations() {
        //Animation code
    }.animate { 
        //Completion of all animations chained above
    }
    ```
![alt tag](https://raw.githubusercontent.com/vishalvshekkar/Animator/master/Resources/AnimatorDemoExample.gif)

#Other Facts

1. Developed on Swift 3.0.1
2. The playground contains a demo which you can go through.
3. You need to open the assistant editor in the Playground to view the output animation. (View -> Assistant Editor -> Show Assistant Editor) or the keyboard shortcut option+command+return (if you haven't changed that).
4. To use `Animator` in your project, just drag the file 'Animator.swift' into your project which is available in the 'Source' directory in this repository. (Copy it to your project directory)
