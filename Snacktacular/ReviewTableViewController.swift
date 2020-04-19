//
//  ReviewTableViewController.swift
//  Snacktacular
//
//  Created by Hannah Jiang on 4/15/20.
//  Copyright © 2020 John Gallaugher. All rights reserved.
//

import UIKit

class ReviewTableViewController: UITableViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var postedByLabel: UILabel!
    @IBOutlet weak var reviewTitle: UITextField!
    @IBOutlet weak var reviewView: UITextView!
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    @IBOutlet weak var reviewDateLabel: UILabel!
    @IBOutlet weak var buttonsBackgroundView: UIView!
    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    @IBOutlet var starButtonCollection: [UIButton]!
    
    var spot: Spot!
    var review: Review!
    var rating = 0 {
        didSet {
            for starButton in starButtonCollection {
                let image = UIImage(named:(starButton.tag < rating ? "star-filled": "star-empty"))
                starButton.setImage(image, for: .normal)
            }
            print(">>> new rating \(rating)")
            review.rating = rating
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        //mapView.delegate = self
        
        
        guard let spot = spot else {
            print("***ERROR: Did not have a valid spot in ReviewDetailViewController")
            return
        }
        nameLabel.text = spot.name
        addressLabel.text = spot.address 
        if review == nil {
            review = Review()
        }
        
        
    }
    
    @IBAction func starButtonPressed(_ sender: UIButton) {
        rating = sender.tag + 1 //add one since we're zero indexed
    }
    
    func leaveViewController(){
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func reviewTitleChanged(_ sender: UITextField) {
    }
    
    @IBAction func returnTitleDonePressed(_ sender: UITextField) {
    }
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        leaveViewController()
    }
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        review.title = reviewTitle.text!
        review.text = reviewView.text!
        review.saveData(spot: spot) { (success) in
            if success {
                self.leaveViewController()
            } else {
                 print("***ERROR: Couldn't leave this view controller because data wasn't saved")
            }
        }
        
    }
    
    @IBAction func deleteButtonPressed(_ sender: UIButton) {
    }
}
