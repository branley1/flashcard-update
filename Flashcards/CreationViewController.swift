//
//  CreationViewController.swift
//  Flashcards
//
//  Created by Branley Mmasi on 3/18/22.
//

//  Edited by Branley Mmasi on 5/4/2023 overnight.

import UIKit

class CreationViewController: UIViewController {

    var flashcardsController: ViewController!
    
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var answerTextField: UITextField!
    
    @IBOutlet weak var ExtraAnswer1: UITextField!
    @IBOutlet weak var ExtraAnswer2: UITextField!
    
    
    
    var question_1: String?
    var answer_1: String?
    var answer_2: String?
    var answer_3: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        questionTextField.text = question_1
        answerTextField.text = answer_1
        ExtraAnswer1.text = answer_2
        ExtraAnswer2.text = answer_3
    }
    
    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func didTapOnDone(_ sender: Any) {
        
        
        //Get the text in the question text field
        let questionText = questionTextField.text
        
        //Get the answer in the answer text field
        let answerText = answerTextField.text
        
        let extra_answer1 = ExtraAnswer1.text
        
        let extra_answer2 = ExtraAnswer2.text
        
        //Check if empty
        if questionText == nil || answerText == nil || questionText!.isEmpty || answerText!.isEmpty {
            let alert = UIAlertController(title: "Missing text", message: "You need to enter both a question and answer", preferredStyle: .alert )
            present(alert, animated: true)
            
            //Tap Ok to dismiss alert
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
            
        } else {
            //Call the function to update the flashcard
            var isExisting = false
            if answer_1 != nil {
                isExisting = true
            }
            flashcardsController.updateFlashcard(question: questionText!, answer: answerText!, extra_answer1: extra_answer1!, extra_answer2: extra_answer2!, isExisting: isExisting)
            //Dismiss
            dismiss(animated: true)
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

