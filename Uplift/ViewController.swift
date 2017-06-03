//
//  ViewController.swift
//  Uplift
//
//  Created by Raunaq Sawhney on 6/2/17.
//  Copyright © 2017 UpliftSeva. All rights reserved.
//

import ResearchKit

class ViewController: UIViewController {
    
    @IBAction func surveyTapped(sender : AnyObject) {
        let taskViewController = ORKTaskViewController(task: SurveyTask, taskRun: nil)
        taskViewController.delegate = self
        present(taskViewController, animated: true, completion: nil)
    }
    
    func fadeViewInThenOut(view : UIView, delay: NSTimeInterval) {
        
        let animationDuration = 0.25
        
        // Fade in the view
        UIView.animateWithDuration(animationDuration, animations: { () -> Void in
            view.alpha = 1
        }) { (Bool) -> Void in
            
            // After the animation completes, fade out the view after a delay
            
            UIView.animateWithDuration(animationDuration, delay: delay, options: .CurveEaseInOut, animations: { () -> Void in
                view.alpha = 0
            },
                                       completion: nil)
        }
    }
}

extension ViewController : ORKTaskViewControllerDelegate {
    
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        //Handle results with taskViewController.result
        taskViewController.dismiss(animated: true, completion: nil)
    }
    
}
