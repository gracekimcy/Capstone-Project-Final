//
//  ChallengeViewController.swift
//  Capstone App
//
//  Created by Summer on 8/1/19.
//  Copyright © 2019 Anna Shang. All rights reserved.
//

import UIKit

class ChallengeViewController: UIViewController {

    
    var challenges: [String] = ["Pick up 10 pieces of trash", "Walk somewhere instead of drive", "Bike somewhere instead of drive", "Use public transportation instead of drive", "Bring a reusable bag to the grocery store", "Bring/Use a reusable water bottle instead of a plastic one", "Carpool with a friend", "Recycle any paper scraps", "Time your shower (10 minutes)", "Unplug your charger when you're not using it", "Turn your faucet completely off", "Check your faucets for leaks", "Try to reduce your red meat intake, ex: if you eat red meat 3 times a week only eat it once a week", "If your not in a room, keep those lights off", "Buy shampoos, conditioners, facewashes, soaps, etc in bulk then fill them with reusable glass bottles", "Instead of going to the mall to buy clothes, go to the thrift store", "Buy snacks and food products in bulk instead of individually packed snacks and use reusable snack bags with your food", "Switch the light bulbs in your house to energy efficient bulbs", "Play the trash collector mini game", "If you buy or make your own coffee, teas, or drinks, use reusable cups and mugs", "Stop using single use plastics"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func getRandomChallenge(){
        var randomChallenge = challenges.randomElement()
        recommendLabel.text = randomChallenge
    }
    
    
    @IBOutlet weak var recommendLabel: UILabel!
    
    @IBAction func getRecommendLabel(_ sender: Any) {
        getRandomChallenge()
    }
    
    @IBOutlet weak var userInputTextField: UITextField!
    
    @IBAction func handleAddingUserInput(_ sender: Any) {
        var newChallenge = userInputTextField.text
        challenges.append(newChallenge!)
        userInputTextField.resignFirstResponder()
        userInputTextField.text = ""
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        getRandomChallenge()
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
