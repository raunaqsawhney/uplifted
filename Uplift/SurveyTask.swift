//
//  SurveyTask.swift
//  Uplift
//
//  Created by Raunaq Sawhney on 6/2/17.
//  Copyright © 2017 UpliftSeva. All rights reserved.
//

import Foundation
import ResearchKit

public var SurveyTask: ORKOrderedTask {
    
    var steps = [ORKStep]()
    
    // Instruction
    let instruction_step = ORKInstructionStep(identifier: "instruction_step")
    instruction_step.title = NSLocalizedString("instruction_step_title", comment: "")
    instruction_step.text = NSLocalizedString("instruction_step_text", comment: "")
    
    // Text Choices
    let textChoices = [
        ORKTextChoice(text: NSLocalizedString("option_not_at_all", comment: ""), value: 0 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: NSLocalizedString("option_several_days", comment: ""), value: 1 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: NSLocalizedString("option_more_than_half_the_days", comment: ""), value: 2 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: NSLocalizedString("option_nearly_every_day", comment: ""), value: 3 as NSCoding & NSCopying & NSObjectProtocol)
    ]
    
    // Answer Format
    let answer_format: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: textChoices)
    
    // Question 1
    let question_1 = ORKQuestionStep(identifier: "question_1",
                                     title: NSLocalizedString("question_1_header", comment: ""),
                                     answer: answer_format)
    question_1.isOptional = false
    
    // Question 2
    let question_2 = ORKQuestionStep(identifier: "question_2",
                                     title: NSLocalizedString("question_2_header", comment: ""),
                                     answer: answer_format)
    question_2.isOptional = false
    
    // Question 3
    let question_3 = ORKQuestionStep(identifier: "question_3",
                                     title: NSLocalizedString("question_3_header", comment: ""),
                                     answer: answer_format)
    question_3.isOptional = false
    
    // Question 4
    let question_4 = ORKQuestionStep(identifier: "question_4",
                                     title: NSLocalizedString("question_4_header", comment: ""),
                                     answer: answer_format)
    question_4.isOptional = false
    
    // Question 5
    let question_5 = ORKQuestionStep(identifier: "question_5",
                                     title: NSLocalizedString("question_5_header", comment: ""),
                                     answer: answer_format)
    question_5.isOptional = false
    
    // Question 6
    let question_6 = ORKQuestionStep(identifier: "question_6",
                                     title: NSLocalizedString("question_6_header", comment: ""),
                                     answer: answer_format)
    question_6.isOptional = false
    
    // Question 7
    let question_7 = ORKQuestionStep(identifier: "question_7",
                                     title: NSLocalizedString("question_7_header", comment: ""),
                                     answer: answer_format)
    question_7.isOptional = false
    
    // Question 8
    let question_8 = ORKQuestionStep(identifier: "question_8",
                                     title: NSLocalizedString("question_8_header", comment: ""),
                                     answer: answer_format)
    question_8.isOptional = false
    
    // Question 9
    let question_9 = ORKQuestionStep(identifier: "question_9",
                                     title: NSLocalizedString("question_9_header", comment: ""),
                                     answer: answer_format)
    question_9.isOptional = false
    
    let summary_step = ORKCompletionStep(identifier: "summary_step")
    summary_step.title = "Right. Off you go!"
    summary_step.text = "That was easy!"
    
    steps += [instruction_step, question_1, question_2, question_3, question_4, question_5, question_6, question_7, question_8, question_9, summary_step]
        
    return ORKOrderedTask(identifier: "SurveyTask", steps: steps)
}
