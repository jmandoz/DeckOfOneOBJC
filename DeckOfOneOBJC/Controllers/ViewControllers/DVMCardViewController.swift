//
//  DVMCardViewController.swift
//  DeckOfOneOBJC
//
//  Created by Jason Mandozzi on 7/2/19.
//  Copyright © 2019 Jason Mandozzi. All rights reserved.
//

import UIKit

class DVMCardViewController: UIViewController {
    
    var cardLandingPad: DVMCard?
    
    
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var cardSuitLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // Do any additional setup after loading the view.
    
    func updateViews() {
        DVMCardController.drawANewCard { (card) in
            DVMCardController.fetchImage(from: (card[0]), completion: { (image) in
                DispatchQueue.main.async {
                    self.cardImageView.image = image
                    let card = card[0] as? DVMCard
                    self.cardSuitLabel.text = card?.suit
                    
                }
                
            })
        }
    }
    
    @IBAction func cardButtonPushed(_ sender: Any) {
        updateViews()
    }
    
}
