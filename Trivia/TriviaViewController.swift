//
//  TriviaViewController.swift
//  Trivia
//
//  Created by Celine Vu on 3/10/24.
//

import UIKit

class TriviaViewController: UIViewController {
    @IBOutlet weak var answer4: UIButton!
      @IBOutlet weak var answer3: UIButton!
      @IBOutlet weak var answer2: UIButton!
      @IBOutlet weak var answer1: UIButton!
      @IBOutlet weak var answerStack: UIStackView!
      @IBOutlet weak var cardField: UILabel!
      @IBOutlet weak var cardType: UILabel!
      @IBOutlet weak var cardNumber: UILabel!
    
    private var mockData = [TriviaData]();
    private var selectedIndex = 0;
    private var score = 0;
    override func viewDidLoad() {
        super.viewDidLoad()
        mockData = createMockData();

        // Do any additional setup after loading the view.

        configure(with: mockData[selectedIndex]);
        answer1.addTarget(self, action: #selector(answerButtonTapped), for: .touchUpInside)
        answer2.addTarget(self, action: #selector(answerButtonTapped), for: .touchUpInside)
        answer3.addTarget(self, action: #selector(answerButtonTapped), for: .touchUpInside)
        answer4.addTarget(self, action: #selector(answerButtonTapped), for: .touchUpInside)
    }
    @objc func answerButtonTapped(_ sender: UIButton) {
        switch sender {
        case answer1:
            if(answer1.titleLabel?.text == mockData[selectedIndex].answer) {
                score += 1;
            }
        case answer2:
            if(answer2.titleLabel?.text == mockData[selectedIndex].answer) {
                score += 1;
            }
        case answer3:
            if(answer3.titleLabel?.text == mockData[selectedIndex].answer) {
                score += 1;
            }
        case answer4:
            if(answer4.titleLabel?.text == mockData[selectedIndex].answer) {
                score += 1;
            }
        default:
            break
        }
        selectedIndex += 1;
        if(selectedIndex == 3) {
            let alert = UIAlertController(title: "Game over!", message: "Final score: \(score)/3", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            
            selectedIndex = 0;
            score = 0;
        }
        configure(with: mockData[selectedIndex]);
    }
    private func createMockData() -> [TriviaData] {
        let trivia1 = TriviaData(question: "Where is Paris located?", answer: "France", answerBank: ["France", "Germany", "Egypt", "Mexico"])
        let trivia2 = TriviaData(question: "Who wrote the song XS?", answer: "Rina Sawayama", answerBank: ["Rina Sawayama", "Charli XCX", "Dorian Electra", "100gecs"])
        let trivia3 = TriviaData(question: "When is this assignment due?", answer: "March 11", answerBank: ["March 11", "March 10", "March 12", "March 13"])
        return [trivia1, trivia2, trivia3]
    }
    
    private func configure(with trivia: TriviaData) {
        cardNumber.text = "Question 1/3"
        cardType.text = "Geography"
        cardField.text = trivia.question
        let randomized = trivia.answerBank.shuffled()
        
        // Set button titles safely by checking if there are enough answers
        if randomized.count >= 4 {
            answer1.setTitle(randomized[0], for: .normal)
            answer2.setTitle(randomized[1], for: .normal)
            answer3.setTitle(randomized[2], for: .normal)
            answer4.setTitle(randomized[3], for: .normal)
        } else {
            // Handle the error, perhaps disable the buttons, or show an error message
            print("Not enough answers in the answerBank")
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
