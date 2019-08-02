//
//  QuizViewController.swift
//  Capstone App
//
//  Created by Summer on 8/1/19.
//  Copyright © 2019 Anna Shang. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    struct Question {
        let question: String
        let answers: [String]
        let correctAnswer: Int
    }
    
    var questions: [Question] = [
        Question(
            question: "How much have global average temperatures increased in the last century?",
            answers: ["2.1 degrees Fahrenheit", "0.6 degrees Fahrenheit", "4.3 degrees Fahrenheit", "1.4 degrees Fahrenheit"],
            correctAnswer: 3),
        Question(
            question: "How much have sea levels risen in the past 100 years?",
            answers: ["7 inches", "2 inches", "5 inches", "16 inches"],
            correctAnswer: 0),
        Question(
            question: "How many pounds of garbage does an average American produce daily?",
            answers: ["6.1", "4.4", "2.1", "1.3"],
            correctAnswer: 1),
        Question(
            question: "How much water does an average American use daily?",
            answers: ["100 gallons", "30 gallons", "12 gallons", "8 gallons"],
            correctAnswer: 0),
        Question(
            question: "How much are scientists predicting the seas will rise by the end of this century?",
            answers: ["6 inches to 2 feet", "1 to 3 feet", "4 to 8 inches", "2 to 6 feet"],
            correctAnswer: 3),
        Question(
            question: "What percent of the global population live in places with unhealthy air quality?",
            answers: ["98%", "92%", "76%", "24%"],
            correctAnswer: 1),
        Question(
            question: "What is the most common type of trash thrown away by Americans?",
            answers: ["Paper products and cardboard", "Metals", "Glass", "Plastics"],
            correctAnswer: 0),
        Question(
            question: "What is the most common type of debris that litters our oceans?",
            answers: ["Bags", "Plastic beverage bottles", "Cigarettes", "Food packaging"],
            correctAnswer: 2),
        Question(
            question: "Which day is Earth Day?",
            answers: ["April 22", "December 21", "August 12", "October 31"],
            correctAnswer: 0),
        Question(
            question: "On average, over what percent of items put into landfills annually can be recycled?",
            answers: ["50%", "65%", "80%", "90%"],
            correctAnswer: 2),
        Question(
            question: "About how many years would it take for one glass bottle to decompose?",
            answers: ["2,000 years", "4,000 years", "200 years", "400 years"],
            correctAnswer: 1),
        Question(
            question: "Over 75% of waste is recyclable, but we only recycle about what percent of it?",
            answers: ["60%", "55%", "40%", "30%"],
            correctAnswer: 3),
        Question(
            question: "Americans throw away how many plastic bottles every hour?",
            answers: ["1,000", "20,000", "100,000", "25,000,000"],
            correctAnswer: 3),
        Question(
            question: "How many years does plastic take to decompose?",
            answers: ["1,000", "500", "100", "10"],
            correctAnswer: 0),
        Question(
            question: "How much of the world's water is available for human use?",
            answers: ["75%", "35%", "15%", "< 1%"],
            correctAnswer: 3),
        Question(
            question: "Approximately how much of global electricity output is produced from renewable sources?",
            answers: ["1%", "5%", "8%", "20%"],
            correctAnswer: 2),
        Question(
            question: "During the 150 years of industrial age, the atmospheric concentration of carbon dioxide has increased by what percent?",
            answers: ["31%", "45%", "58%", "67%"],
            correctAnswer: 0),
        Question(
            question: "Rainforests once covered 14% of the earth's land surface; now they cover what percent?",
            answers: ["6%", "8%", "10%", "12%"],
            correctAnswer: 0),
        Question(
            question: "For every ton of paper recycled, we save how many trees?",
            answers: ["17 trees", "32 trees", "46 trees", "59 trees"],
            correctAnswer: 0),
        Question(
            question: "Which country currently emits the most greenhouse gases?",
            answers: ["Russia", "China", "United States of America", "Germany"],
            correctAnswer: 1),
        Question(
            question: "How much of our air pollution comes from motor vehicles, like cars and trucks?",
            answers: ["20%", "30%", "40%", "50%"],
            correctAnswer: 3),
        Question(
            question: "What is the leading source of energy in the United States?",
            answers: ["Oil", "Coal", "Nuclear power", "Natural gas"],
            correctAnswer: 0),
        Question(
            question: "To create just 1 kilogram of consumer goods, how many kilograms of waste do manufacturers create?",
            answers: ["1 kilogram", "3 kilograms", "5 kilograms", "7 kilograms"],
            correctAnswer: 2),
        Question(
            question: "Global warming may do which of the following?",
            answers: ["Influence the length of seasons.", "Cause coastal flooding.", "Lead to more frequent and severe storms", "All of the above"],
            correctAnswer: 3),
        Question(
            question: "How long does it take for carbon dioxide in the atmosphere to disperse?",
            answers: ["500 years", "100 years", "50 years", "10 years"],
            correctAnswer: 1),
    ]
    
    var currentQuestion: Question?
    var currentQuestionPosition: Int = 0
    var noCorrect: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        currentQuestion = questions[0]
        setQuestion()
    }
    
    @IBOutlet weak var questionLabel: UITextView!
    @IBOutlet weak var answer0: UIButton!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    
    @IBAction func handleSubmitAnswer0(_ sender: UIButton) {
        checkAnswer(choiceNo: 0)
    }
    @IBAction func handleSubmitAnswer1(_ sender: UIButton) {
        checkAnswer(choiceNo: 1)
    }
    @IBAction func handleSubmitAnswer2(_ sender: UIButton) {
        checkAnswer(choiceNo: 2)
    }
    @IBAction func handleSubmitAnswer3(_ sender: UIButton) {
        checkAnswer(choiceNo: 3)
    }
    @IBOutlet weak var progressLabel: UILabel!
    
    func setQuestion() {
        questionLabel.text = currentQuestion!.question
        answer0.setTitle(currentQuestion!.answers[0], for: .normal)
        answer1.setTitle(currentQuestion!.answers[1], for: .normal)
        answer2.setTitle(currentQuestion!.answers[2], for: .normal)
        answer3.setTitle(currentQuestion!.answers[3], for: .normal)
        progressLabel.text = "Question \(currentQuestionPosition + 1) of \(questions.count)"
    }
    
    func loadNextQuestion() {
        if((currentQuestionPosition + 1) == questions.count) {
            performSegue(withIdentifier: "sgShowResults", sender: nil)
        } else {
            currentQuestionPosition += 1
            currentQuestion = questions[currentQuestionPosition]
            setQuestion()
        }
    }
    
    func checkAnswer(choiceNo: Int) {
        if(choiceNo == currentQuestion!.correctAnswer) {
            noCorrect += 1
        }
        loadNextQuestion()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "sgShowResults") {
            let vc = segue.destination as! ResultsViewController
            vc.noCorrect = noCorrect
            vc.total = questions.count
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
