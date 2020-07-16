//
//  QuizBrain.swift
//  Trivia Time
//
//  Created by Ebubechukwu Dimobi on 06.07.2020.
//  Copyright © 2020 blazeapps. All rights reserved.
//

import Foundation

struct QuizBrain {
    let quiz = [
        Question(q: "Which is the largest organ in the human body?", o: ["Heart", "Skin", "Large Intestine"], a: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", o: ["25", "50", "100"], a: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", o: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], a: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", o: ["Chapeau", "Écharpe", "Bonnet"], a: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", o: ["Notebook", "Handkerchief", "Watch"], a: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", o: ["Au Revoir", "Adiós", "Salir"], a: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", o: ["Green", "Orange", "Blue"], a: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", o: ["Rum", "Whisky", "Gin"], a: "Rum"),
        Question(q: "What type of animal was Harambe?", o: ["Panda", "Gorilla", "Crocodile"], a: "Gorilla"),
        Question(q: "Where is Tasmania located?", o: ["Indonesia", "Australia", "Scotland"], a: "Australia")
        
        
    ]
    
    var questionNumber = 0
    var scoreCount = 0
    
    mutating func checkAnswer(userAnswer: String) -> Bool {
        
        // change colour of button if right and wrong
        if userAnswer == quiz[questionNumber].answer {
            scoreCount += 1
            return true
        }
            
        else {
            return false
        }
        
    }
    
    func getQuestionText()->String{
        return quiz[questionNumber].text
        
    }
    
    func getProgress()->Float{
        
        if questionNumber + 1 < quiz.count{
            
            return (Float(questionNumber)) / (Float(self.quiz.count))
            
            
        }
            
        else {
            return 1
            
            
        }
        
    }
    
    mutating func nextQuestion(){
        if questionNumber + 1 < quiz.count{
            
            questionNumber += 1
            
            
        }
            
        else {
            questionNumber = 0
            scoreCount = 0
            
            
        }
        
    }
    
    func getScore() ->String {
        
        return ("\(scoreCount)/\(quiz.count)")
    }
    
    func getOptions() -> [String]{
        
        return [quiz[questionNumber].options[0], quiz[questionNumber].options[1], quiz[questionNumber].options[2]]
    }
    
}

