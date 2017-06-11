//
//  ResultsViewController.swift
//  Uplift
//
//  Created by Raunaq Sawhney on 6/10/17.
//  Copyright © 2017 UpliftSeva. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var results_header: UILabel!
    @IBOutlet weak var result_text: UILabel!
    @IBOutlet weak var your_score: UILabel!
    @IBOutlet weak var possible_score_label: UILabel!

    @IBOutlet weak var your_score_label: UILabel!
    var resultsPassed = [Int]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        showResults(results: resultsPassed)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showResults(results: [Int]) -> Void {
        
        var score = 0
        
        for result in results {
            score += result
        }
        
        // Update the UI with the result
        switch score {
        case 0:
            self.result_text.text = NSLocalizedString("result_no_depression", comment: "")
        case 1...4:
            self.result_text.text = NSLocalizedString("result_minimal_depression", comment: "")
        case 5...9:
            self.result_text.text = NSLocalizedString("result_mild_depression", comment: "")
        case 10...14:
            self.result_text.text = NSLocalizedString("result_moderate_depression", comment: "")
        case 15...19:
            self.result_text.text = NSLocalizedString("result_moderately_severe_depression", comment: "")
        case 20...27:
            self.result_text.text = NSLocalizedString("result_severe_depression", comment: "")
        default:
            self.result_text.text = NSLocalizedString("result_no_depression", comment: "")
        }
        
        self.your_score.text = String(score)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
