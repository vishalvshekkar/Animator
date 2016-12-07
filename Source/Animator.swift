import UIKit

public class Animator {
    
    public typealias AnimatorAnimationsClosure = () -> ()
    public typealias AnimatorCompletionClosure = () -> ()
    
    struct AnimationParameters {
        
        enum Animationtype {
            case withSpringDamping
            case withoutSpringDamping
        }
        
        let duration: TimeInterval
        let delay: TimeInterval
        let options: UIViewAnimationOptions
        let animationtype: Animationtype
        let damping: CGFloat?
        let initialVelocity: CGFloat?
        
        init(duration: TimeInterval, delay: TimeInterval, options: UIViewAnimationOptions, animationtype: Animationtype) {
            self.duration = duration
            self.delay = delay
            self.options = options
            self.animationtype = animationtype
            self.damping = nil
            self.initialVelocity = nil
        }
        
        init(duration: TimeInterval, delay: TimeInterval, options: UIViewAnimationOptions, animationtype: Animationtype, damping: CGFloat, initialVelocity: CGFloat) {
            self.duration = duration
            self.delay = delay
            self.options = options
            self.animationtype = animationtype
            self.damping = damping
            self.initialVelocity = initialVelocity
        }
    }
    
    private var animations = [(parameters: AnimationParameters, animationClosures: AnimatorAnimationsClosure)]()
    
    public static func addAnimations(withDuration: TimeInterval = 1, delay: TimeInterval? = nil, options: UIViewAnimationOptions = [], animations: @escaping AnimatorAnimationsClosure) -> Animator {
        let newAnimator = Animator()
        let parameters = AnimationParameters(duration: withDuration, delay: delay ?? 0, options: options, animationtype: .withoutSpringDamping)
        newAnimator.animations.append((parameters, animations))
        return newAnimator
    }
    
    public static func addAnimations(withDuration: TimeInterval = 1, delay: TimeInterval? = nil, usingSpringWithDamping: CGFloat, initialSpringVelocity: CGFloat, options: UIViewAnimationOptions = [], animations: @escaping AnimatorAnimationsClosure) -> Animator {
        let newAnimator = Animator()
        let parameters = AnimationParameters(duration: withDuration, delay: delay ?? 0, options: options, animationtype: .withSpringDamping, damping: usingSpringWithDamping, initialVelocity: initialSpringVelocity)
        newAnimator.animations.append((parameters, animations))
        return newAnimator
    }
    
    public func addAnimations(withDuration: TimeInterval = 1, delay: TimeInterval? = nil, options: UIViewAnimationOptions = [], animations: @escaping AnimatorAnimationsClosure) -> Animator {
        let parameters = AnimationParameters(duration: withDuration, delay: delay ?? 0, options: options,animationtype: .withoutSpringDamping)
        self.animations.append((parameters, animations))
        return self
    }
    
    public func addAnimations(withDuration: TimeInterval = 1, delay: TimeInterval? = nil, usingSpringWithDamping: CGFloat, initialSpringVelocity: CGFloat, options: UIViewAnimationOptions = [], animations: @escaping AnimatorAnimationsClosure) -> Animator {
        let parameters = AnimationParameters(duration: withDuration, delay: delay ?? 0, options: options, animationtype: .withSpringDamping, damping: usingSpringWithDamping, initialVelocity: initialSpringVelocity)
        self.animations.append((parameters, animations))
        return self
    }
    
    public func animate(completion: AnimatorCompletionClosure? = nil) {
        if let closureToAnimate = animations.first {
            let parameters = closureToAnimate.parameters
            if parameters.animationtype == .withoutSpringDamping {
                UIView.animate(withDuration: parameters.duration, delay: parameters.delay, options: parameters.options, animations: closureToAnimate.animationClosures, completion: { (completed) in
                    self.animations.removeFirst()
                    self.animate(completion: completion)
                })
            } else {
                UIView.animate(withDuration: parameters.duration, delay: parameters.delay, usingSpringWithDamping: parameters.damping ?? 0, initialSpringVelocity: parameters.initialVelocity ?? 0, options: parameters.options, animations: closureToAnimate.animationClosures, completion: { (completed) in
                    self.animations.removeFirst()
                    self.animate(completion: completion)
                })
            }
        } else {
            completion?()
        }
    }
    
}
