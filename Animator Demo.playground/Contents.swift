//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

let containerView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 400, height: 400))
containerView.backgroundColor = UIColor.black
PlaygroundPage.current.liveView = containerView

let smallView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 20, height: 20))
smallView.backgroundColor = UIColor.cyan
containerView.addSubview(smallView)

let smallView3 = UIView(frame: CGRect(x: 380, y: 380, width: 20, height: 20))
smallView3.backgroundColor = UIColor.red
containerView.addSubview(smallView3)

Animator.addAnimations() {
    smallView.frame.origin = CGPoint(x: 380, y: 0)
    smallView3.frame.origin = CGPoint(x: 0, y: 380)
    }.addAnimations() {
        smallView.frame.origin = CGPoint(x: 380, y: 380)
        smallView3.frame.origin = CGPoint(x: 0, y: 0)
    }.addAnimations(usingSpringWithDamping: 0.7, initialSpringVelocity: 0) {
        smallView.frame.origin = CGPoint(x: 190, y: 190)
        smallView3.frame.origin = CGPoint(x: 190, y: 190)
    }.addAnimations(usingSpringWithDamping: 0.7, initialSpringVelocity: 0) {
        smallView.frame.origin = CGPoint(x: 380, y: 0)
        smallView3.frame.origin = CGPoint(x: 0, y: 380)
    }.addAnimations(usingSpringWithDamping: 0.7, initialSpringVelocity: 0) {
        smallView.frame.origin = CGPoint(x: 380, y: 380)
        smallView3.frame.origin = CGPoint(x: 0, y: 0)
}.addAnimations(withDuration: 1, delay: 1, options: [UIViewAnimationOptions.curveLinear], animations: {
    smallView.frame.origin = CGPoint(x: 260, y: 380)
    smallView3.frame.size = CGSize(width: 80, height: 80)
}).animate {
    print("Completed")
}

