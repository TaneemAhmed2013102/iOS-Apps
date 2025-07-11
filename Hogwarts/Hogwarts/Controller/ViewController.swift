//
//  ViewController.swift
//  Hogwarts
//
//  Created by Taneem on 04/10/2024.


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var sto = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            //Bring's sender's opacity back up to fully opaque.
            sender.alpha = 1.0
        }
        
        let selectedChoice = sender.currentTitle!
        sto.getStoryNext(selectedChoice)
        updateUI()
    }
    
    
    
    func updateUI(){
        storyLabel.text = sto.stories[sto.storyNo].title
        choice1Button.setTitle(sto.stories[sto.storyNo].choice1, for: .normal)
        choice2Button.setTitle(sto.stories[sto.storyNo].choice2, for: .normal)
    }
    
}

