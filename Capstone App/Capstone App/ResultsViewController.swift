//
//  ResultsViewController.swift
//  Capstone App
//
//  Created by Summer on 8/1/19.
//  Copyright © 2019 Anna Shang. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        //resultsMessageLabel.text = "Hey, Friend"
        var percentRight = (Double(noCorrect) / Double(total)) * 100
        scoreLabel.text = "You got \(noCorrect) out of \(total) (\((Int)(percentRight))%)"
        var message = ""
        resultsImage.image = UIImage(named: "")
        if(percentRight < 20) {
            message = "Reattempt after using the app to expand your knowledge!"
            resultsImage.image = UIImage(named: "reattempt.jpeg")
        } else if(percentRight < 40) {
            message = "Not bad! Keep completing the challenges to improve your score!"
            resultsImage.image = UIImage(named: "notBad.jpeg")
        } else if(percentRight < 60) {
            message = "Keep trying! You can do it!"
            resultsImage.image = UIImage(named: "keepTrying.jpeg")
        } else if(percentRight < 80) {
            message = "Good job! You are close to acing this quiz!"
            resultsImage.image = UIImage(named: "congratulations.jpeg")
        }
        else {
            message = "Congratulations! You are amazing!"
        }
        resultsMessageLabel.text = message
    }
    
    @IBOutlet weak var resultsMessageLabel: UITextView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var resultsImage: UIImageView!
    
    var noCorrect: Int = 0
    var total: Int = 0


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
