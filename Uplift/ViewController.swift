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
    
}

extension ViewController : ORKTaskViewControllerDelegate {
    
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        //Handle results with taskViewController.result
        taskViewController.dismiss(animated: true, completion: nil)
    }
    
}
