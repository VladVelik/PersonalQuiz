//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by brubru on 18.08.2022.
//

import UIKit

final class ResultViewController: UIViewController {
    @IBOutlet weak var animalInfoLabel: UILabel!
    @IBOutlet weak var animalLabel: UILabel!
    
    var results: [Answer]!
    private var special: [AnimalType: Int] = [:]
    private var answer: AnimalType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        findMaximum()
        
        animalLabel.text = "Вы - \(answer!.rawValue)"
        animalInfoLabel.text = answer!.definition
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func findMaximum() {
        for animal in results {
            if special[animal.type] != nil {
                special[animal.type]! += 1
            } else {
                special[animal.type] = 1
            }
        }
        
        answer = (special.max { a, b in a.value < b.value })!.key
    }
}
