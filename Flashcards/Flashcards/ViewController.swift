//
//  ViewController.swift
//  Flashcards
//
//  Created by Branley Mmasi on 2/26/22.
//

import UIKit

struct Flashcard {
    var question: String
    var answer: String
    var extra_answer1: String
    var extra_answer2: String
}

class ViewController: UIViewController {

    
    @IBOutlet weak var theflashcard: UIView!
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var btnOptionOne: UIButton!
    @IBOutlet weak var btnOptionTwo: UIButton!
    @IBOutlet weak var btnOptionThree: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    @IBAction func didTapOnDelete(_ sender: Any) {
        let alert = UIAlertController(title: "Delete Flashcard", message: "Are you sure you want to delete this flashcard?", preferredStyle: .actionSheet)
        let deleteAction  = UIAlertAction(title: "Delete", style: .destructive){action in self.deleteCurrentFlashcard()}
            
        alert.addAction(deleteAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(cancelAction)
            
        present(alert, animated: true)
    }
    
    func deleteCurrentFlashcard(){
           //delete the current card
           flashcards.remove(at: currentIndex)
           
           //if last card delete & update the current index
           if currentIndex > flashcards.count-1 {
               currentIndex = flashcards.count-1
           }
           updateLabels()
           updateNextPrevButtons()
           saveAllFlashcardsToDisk()
    }
    
    @IBAction func didTapOnNext(_ sender: Any) {
       //Increase current index
        currentIndex = currentIndex + 1
        
        //Update buttons
        updateNextPrevButtons()
        
        // Animate card out
        animateCardOut()
    }
    
    @IBAction func didTapOnPrev(_ sender: Any) {
        //Decrease current index
        currentIndex = currentIndex - 1
        
        //Update buttons
        updateNextPrevButtons()
        
        // Animate card out
        animateCardBackOut()
        
    }
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    
    //Array to hold our flashcards
    var flashcards = [Flashcard]()
    
    //Current flashcard index
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        theflashcard.layer.cornerRadius = 20.0
        
        frontLabel.layer.cornerRadius = 20.0
        backLabel.layer.cornerRadius = 20.0
        
        frontLabel.clipsToBounds = true
        backLabel.clipsToBounds = true
 
        btnOptionOne.layer.cornerRadius = 15.0
        btnOptionTwo.layer.cornerRadius = 15.0
        btnOptionThree.layer.cornerRadius = 15.0
        
        btnOptionOne.layer.borderWidth = 2.0
        btnOptionTwo.layer.borderWidth = 2.0
        btnOptionThree.layer.borderWidth = 2.0
        //Read saved flashcards
        readSavedFlashcards()
        
        //Adding our initial flashcard if needed
        if flashcards.count == 0 {
            userHasNoCards()
        } else {
            updateLabels()
            updateNextPrevButtons()
        }
    }

    @IBAction func didTapOnFlashcard(_ sender: Any) {
        //frontLabel.isHidden = true
        //flipFlashcard()
        
        if frontLabel.isHidden == true {
            flipFlashcardBack()
        } else {
            flipFlashcard()
        }
    }
    
    func flipFlashcard() {
        
        UIView.transition(with: theflashcard, duration: 0.3, options: .transitionFlipFromRight, animations: {
            self.frontLabel.isHidden = true
        })
    }
    
    func flipFlashcardBack () {
        UIView.transition(with: theflashcard, duration: 0.3, options: .transitionFlipFromRight, animations: {
            self.frontLabel.isHidden = false
        })
    }
    
    func userHasNoCards() {
        frontLabel.text = "Press + to add a Flashcard!"
        backLabel.isHidden = true
        btnOptionOne.isHidden = true
        btnOptionTwo.isHidden = true
        btnOptionThree.isHidden = true
        prevButton.isHidden = true
        nextButton.isHidden = true
    }
    
    func setUp() {
        backLabel.isHidden = false
        btnOptionOne.isHidden = false
        btnOptionTwo.isHidden = false
        btnOptionThree.isHidden = false
        prevButton.isHidden = false
        nextButton.isHidden = false
    }
    
    func animateCardOut() {
        UIView.animate(withDuration: 0.3, animations: {
            self.theflashcard.transform = CGAffineTransform.identity.translatedBy(x: -300.0, y: 0.0)
        }, completion: { finished in
            
            //Update labels
            self.updateLabels()
            
            //Run other animation
            self.animateCardIn()
        })
    }
    
    func animateCardIn() {
        
        //Start on the right side (don't animate this)
        theflashcard.transform = CGAffineTransform.identity.translatedBy(x: 300.0, y: 0.0)
        
        // Animate card going to its original position
        UIView.animate(withDuration: 0.3) {
            self.theflashcard.transform = CGAffineTransform.identity
        }
    }
    
    func animateCardBackIn() {
        
        //Start on the left side (don't animate this)
        theflashcard.transform = CGAffineTransform.identity.translatedBy(x: -300.0, y: 0.0)
        
        // Animate card going to its original position
        UIView.animate(withDuration: 0.3) {
            self.theflashcard.transform = CGAffineTransform.identity
        }
    }
    
    func animateCardBackOut() {
        UIView.animate(withDuration: 0.3, animations: {
            self.theflashcard.transform = CGAffineTransform.identity.translatedBy(x: 300.0, y: 0.0)
        }, completion: { finished in
            
            //Update labels
            self.updateLabels()
            
            //Run other animation
            self.animateCardBackIn()
        })
    }

    @IBAction func didTapOnbtnOne(_ sender: Any) {
        if frontLabel.isHidden == true {
            flipFlashcardBack()
        } else{
            flipFlashcardBack()
        }
    }
    @IBAction func didTapOnbtnTwo(_ sender: Any) {
        if frontLabel.isHidden == true {
            flipFlashcardBack()
        } else{
            flipFlashcard()
        }
            
    }
    @IBAction func didTapOnbtwThree(_ sender: Any) {
        if frontLabel.isHidden == true {
            flipFlashcardBack()
        } else{
            flipFlashcardBack()
        }
    }
    
    
    func updateFlashcard(question: String, answer: String, extra_answer1: String, extra_answer2: String, isExisting: Bool) {
        let flashcard = Flashcard(question: question, answer: answer, extra_answer1: extra_answer1, extra_answer2: extra_answer2)
        if isExisting {
            flashcards[currentIndex] = flashcard
        } else {
            frontLabel.text = flashcard.question
            backLabel.text = flashcard.answer
            
            //Adding flashcard in the flashcards array
            flashcards.append(flashcard)
            
            //Logging to the console
            print("😎 Added new flashcard")
            print("😎 We now have \(flashcards.count) flashcards")
            
            //Update current index
            currentIndex = flashcards.count - 1
            print("😎 Our current index is \(currentIndex)")
            
            //Update buttons
            updateNextPrevButtons()
            
            
            //Save all flashcards
            saveAllFlashcardsToDisk()
        }
        
    }
    
    func updateNextPrevButtons() {
        //Disable next button if at the end
        if currentIndex == flashcards.count - 1 {
            nextButton.isEnabled = false
        }
        else {
            nextButton.isEnabled = true
        }
        
        //Disable prev button if at the beginning
        if currentIndex == 0 {
            prevButton.isEnabled = false
        }
        else {
            prevButton.isEnabled = true
        }
    }
    
    func updateLabels() {
        
        //Get current flashcard
        
        if currentIndex == -1 {
            userHasNoCards()
        } else {
            let currentflashcard = flashcards[currentIndex]
            setUp()
        
            //Update labels
            frontLabel.text = currentflashcard.question
            backLabel.text = currentflashcard.answer
            
            btnOptionOne.setTitle(currentflashcard.extra_answer1, for: .normal)
            btnOptionTwo.setTitle(currentflashcard.answer, for: .normal)
            btnOptionThree.setTitle(currentflashcard.extra_answer2, for: .normal)
        }
    }
    
    func saveAllFlashcardsToDisk() {
         
        //From flashcard array to dictionary array
        let dictionayArray = flashcards.map { (card) -> [String: String] in
            return ["question": card.question, "answer": card.answer, "extra_answer1": card.extra_answer1, "extra_answer2": card.extra_answer2]
        }
        
        //Save array on disk using UserDefaults
        UserDefaults.standard.set(dictionayArray, forKey: "flashcards")
        
        //Log it
        print("🎉 Flashcards saved to UserDefaults")
    }
    
    
    func readSavedFlashcards(){
        
        //Read dictionary array from disk (if any)
        if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String: String]]{
            
            //In here now we know for sure we have dictinoary array
            let savedCards = dictionaryArray.map { dictionary -> Flashcard in
                return Flashcard(question: dictionary["question"]! , answer: dictionary["answer"]!, extra_answer1: dictionary["extra_answer1"] ?? "Default value", extra_answer2: dictionary["extra_answer2"] ?? "Default value")
            }
        
            //Put all these cards in out flashcards array
            flashcards.append(contentsOf: savedCards)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // The destination of the segue is the Navigation  Controller
        let navigationController = segue.destination as! UINavigationController
        
        // Navigation Controller only contains a Creation View  Contoller
        let creationController = navigationController.topViewController as! CreationViewController
        if segue.identifier == "EditSegue" {
            creationController.question_1 = frontLabel.text
            creationController.answer_1 = backLabel.text
        }
        //Set the flashcardsController property to self
        creationController.flashcardsController = self
        
        
    }
 }
