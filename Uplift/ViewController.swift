//
//  ViewController.swift
//  Uplift
//
//  Created by Raunaq Sawhney on 6/2/17.
//  Copyright © 2017 UpliftSeva. All rights reserved.
//

import ResearchKit

class ViewController: UIViewController {
    
    // Privates
    @IBOutlet weak var title_text: UILabel!
    @IBOutlet weak var subtitle_text: UILabel!
    @IBOutlet weak var info_text: UILabel!
    @IBOutlet weak var start_button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title_text.alpha = 0
        self.subtitle_text.alpha = 0
        self.info_text.alpha = 0
        self.start_button.alpha = 0
        
        self.title_text.text = NSLocalizedString("title_text", comment: "")
        self.subtitle_text.text = NSLocalizedString("subtitle_text", comment: "")
        self.info_text.text = NSLocalizedString("info_text", comment: "")
        
        self.title_text.fadeIn()
        self.subtitle_text.fadeIn()
        self.info_text.fadeIn()
        self.start_button.fadeIn()
        
    }
    
    @IBAction func surveyTapped(sender : AnyObject) {
        let taskViewController = ORKTaskViewController(task: SurveyTask, taskRun: nil)
        taskViewController.delegate = self
        present(taskViewController, animated: true, completion: nil)
    }
}

extension ViewController : ORKTaskViewControllerDelegate {
    
    func topMostController() -> UIViewController {
        var topController: UIViewController = UIApplication.shared.keyWindow!.rootViewController!
        while (topController.presentedViewController != nil) {
            topController = topController.presentedViewController!
        }
        return topController
    }
    
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        
        let taskResult = taskViewController.result
        let results = taskResult.results as! [ORKStepResult]

        var resultsList = [Int]()
        
        for thisStepResult in results {
            let stepResults = thisStepResult.results as! [ORKQuestionResult]
            for item in stepResults {
                if let answer = item as? ORKChoiceQuestionResult {
                    resultsList.append(answer.choiceAnswers![0] as! Int)
                }
            }
        }
        
        let topViewController = topMostController()
        let viewController = self.storyboard!.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
        viewController.resultsPassed = resultsList
        topViewController.present(viewController, animated: true)
        
        //taskViewController.dismiss(animated: true, completion: nil)
    }
}

extension UIView {

    func fadeIn(duration: TimeInterval = 1.0, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.alpha = 1.0
        }, completion: completion)
    }
}
