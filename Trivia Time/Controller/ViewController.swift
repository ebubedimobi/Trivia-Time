//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var firstChoiceButton: UIButton!
    @IBOutlet weak var secondChoiceButton: UIButton!
    @IBOutlet weak var thirdChoiceButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
       let userAnswer = sender.currentTitle! //trrue or false
        
      let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)
        
        // change colour of button if right and wrong
            if userGotItRight {
                sender.backgroundColor = UIColor.green
                        }
                            
                        else {
                sender.backgroundColor = UIColor.red
                        }
             
        quizBrain.nextQuestion() //changes the question number counter
        updateUI()
     
    }
    
    
    func updateUI(){
        let seconds = 0.2
        
        //to cause delay to let the colour  change
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            
            //change back colour to clear for new question
            self.firstChoiceButton.backgroundColor = UIColor.clear
            self.secondChoiceButton.backgroundColor = UIColor.clear
            self.thirdChoiceButton.backgroundColor = UIColor.clear
            self.progressBar.progress = self.quizBrain.getProgress()
            
            //update new question
            self.questionLabel.text = self.quizBrain.getQuestionText()
            
            //update new options
            let questionArray = self.quizBrain.getOptions()
            self.firstChoiceButton.setTitle(questionArray[0], for: .normal)
            self.secondChoiceButton.setTitle(questionArray[1], for: .normal)
            self.thirdChoiceButton.setTitle(questionArray[2], for: .normal)
            
            
            
            //update score
            self.scoreLabel.text = ("Score: \(self.quizBrain.getScore())")
            
            
            
        }
       
        
        
    }
    
}

