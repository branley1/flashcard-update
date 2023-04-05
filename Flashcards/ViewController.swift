//
//  ViewController.swift
//  Flashcards
//
//  Created by Branley Mmasi on 2/26/22.
//

//  Edited by Branley Mmasi on 5/4/2023 overnight.

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var frontLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }

    @IBAction func didTapOnFlashcard(_ sender: Any) {
        //frontLabel.isHidden = true
        if frontLabel.isHidden == true {
            frontLabel.isHidden = false
        }
        else{
            frontLabel.isHidden = true
        }
               
    }
    
    func updateFlashcard(question: String, answer: String){
        frontLabel.text = question
        backLabel.text = answer
    
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // The destination of the segue is the Navigation  Controller
        let navigationController = segue.destination as! UINavigationController
        
        // Navigation Controller only contains a Creation View  Contoller
        let creationController = navigationController.topViewController as! CreationViewController
        creationController.question_1 = frontLabel.text
        creationController.answer_1 = backLabel.text
        //Set the flashcardsController property to self
        creationController.flashcardsController = self
    }
 }
