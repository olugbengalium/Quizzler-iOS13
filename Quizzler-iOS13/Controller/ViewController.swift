//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var progressViewer: UIProgressView!
    
    var quizBrain = QuizBrain()
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    updateQuestion()
        }

    
    
    
    @IBAction func answerButton(_ sender: UIButton) {
//        progressViewer.progress = Float(answerNumber) / Float(questions.count)
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)

        quizBrain.nextQuestion()
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateQuestion), userInfo: nil, repeats: false)
        

    }
    @objc func updateQuestion(){
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        questionLabel.text = quizBrain.getQuestionText()
        falseButton.backgroundColor = UIColor.clear
        trueButton.backgroundColor = UIColor.clear
        
        progressViewer.progress = quizBrain.progress()
    }
        
}
