//
//  ViewController.swift
//  Picker
//
//  Created by Richard Zheng on 2/19/20.
//  Copyright © 2020 Richard Zheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

  @IBOutlet weak var choice1: UITextField!
  @IBOutlet weak var choice2: UITextField!
  @IBOutlet weak var choice3: UITextField!
  @IBOutlet weak var choice4: UITextField!
  @IBOutlet weak var choice5: UITextField!
  @IBOutlet weak var choice6: UITextField!
  @IBOutlet weak var choice7: UITextField!
  @IBOutlet weak var choice8: UITextField!
  @IBOutlet weak var choice9: UITextField!
  @IBOutlet weak var choice10: UITextField!
  @IBOutlet weak var pickButton: UIButton!
  @IBOutlet weak var chosen: UILabel!
  @IBOutlet weak var clear: UIButton!
  @IBOutlet weak var yesno: UIButton!
  
  @IBOutlet weak var add: UIStepper!

  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var content: UIView!
  

  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
    view.addGestureRecognizer(tap)
    
    
    let tFArray: [UITextField] = [choice1, choice2, choice3, choice4, choice5, choice6, choice7, choice8, choice9, choice10]
    
    for textField in tFArray {
      textField.delegate = self
      textField.modifyClearButton() //this makes the clear (x) cooler looking
    }
    
    //pickButton.frame = CGRect(x: 150, y: 640, width: 90, height: 90)
    
    pickButton.layer.cornerRadius = 0.5 * pickButton.bounds.size.width
    
    yesno.frame.origin.y = choice3.frame.origin.y
    add.frame.origin.y = choice3.frame.origin.y
    
    clear.frame.origin.y = 245 //slightly above option 1

    NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
       
    NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    
  }
  
  func viewDidAppear() {
    pickButton.frame.origin = CGPoint(x: pickButton.frame.origin.x, y: 640)
    //for some reason this needs to be here even tho everything else is fine wherever they were
    //
  }
  
  
  @objc func keyboardWillShow(notification: NSNotification) {
    guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
    else {
      // if keyboard size is not available for whatever reason, do nothing
      return
    }

    let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height , right: 0.0)
    scrollView.contentInset = contentInsets
    scrollView.scrollIndicatorInsets = contentInsets
  }

  @objc func keyboardWillHide(notification: NSNotification) {
    let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
    
    // reset back the content inset to zero after keyboard is gone
    scrollView.contentInset = contentInsets
    scrollView.scrollIndicatorInsets = contentInsets
  }
  
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
     textField.resignFirstResponder()
     return true
  }
  
  func hideChoice() {
    //if the textfields are not visible then they should not provide options.
    let choicesArray: [UITextField] = [choice1, choice2, choice3, choice4, choice5, choice6, choice7, choice8, choice9, choice10]
    
    for choices in choicesArray {
      if choices.isHidden {
        choices.text = ""
      }
    }
  }
  
  
  @IBAction func stepping(_ sender: UIStepper) {
    //there are some magic numbers, need to think of a way to increment/decrement upon increment/decrement of textfields
    switch sender.value {
    case 3:
      choice3.isHidden = false
      choice4.isHidden = true
      yesno.frame.origin.y = choice4.frame.origin.y
      add.frame.origin.y = choice4.frame.origin.y
    case 4:
      choice4.isHidden = false
      choice5.isHidden = true
      yesno.frame.origin.y = choice5.frame.origin.y
      add.frame.origin.y = choice5.frame.origin.y
    case 5:
      choice5.isHidden = false
      choice6.isHidden = true
      yesno.frame.origin.y = choice6.frame.origin.y
      add.frame.origin.y = choice6.frame.origin.y
      pickButton.frame.origin.y = 640
    case 6:
      choice6.isHidden = false
      choice7.isHidden = true
      yesno.frame.origin.y = choice7.frame.origin.y
      add.frame.origin.y = choice7.frame.origin.y
      pickButton.frame.origin.y = 700
    case 7:
      choice7.isHidden = false
      choice8.isHidden = true
      yesno.frame.origin.y = choice8.frame.origin.y
      add.frame.origin.y = choice8.frame.origin.y
      pickButton.frame.origin.y = 760
    case 8:
      choice8.isHidden = false
      choice9.isHidden = true
      yesno.frame.origin.y = choice9.frame.origin.y
      add.frame.origin.y = choice9.frame.origin.y
      pickButton.frame.origin.y = 820
    case 9:
      choice9.isHidden = false
      choice10.isHidden = true
      yesno.frame.origin.y = choice10.frame.origin.y
      add.frame.origin.y = choice10.frame.origin.y
      pickButton.frame.origin.y = 880
    case 10:
      //60 is the difference
      choice10.isHidden = false
      yesno.frame.origin.y += 60
      add.frame.origin.y += 60
      pickButton.frame.origin.y += 60
    default:
      reset()
    }
    hideChoice()
  }
  
  
  func reset() {
    add.value = 2
    choice3.isHidden = true
    choice4.isHidden = true
    choice5.isHidden = true
    choice6.isHidden = true
    choice7.isHidden = true
    choice8.isHidden = true
    choice9.isHidden = true
    choice10.isHidden = true
    hideChoice()
    yesno.frame.origin.y = choice3.frame.origin.y
    add.frame.origin.y = choice3.frame.origin.y
    pickButton.frame.origin.y = 640
  }
  
  
  @IBAction func picking(_ sender: Any) {
    var choices: [String] = []
    
    let choicesArray: [UITextField] = [choice1, choice2, choice3, choice4, choice5, choice6, choice7, choice8, choice9, choice10]
    //unsure if this is good practice to declare this multiple times
    
    for i in choicesArray {
      if (i.text != "") {
        choices.append(i.text!)
      }
    }
 
    let rand = choices.randomElement()
    
    if choices.count == 0 {
      UIView.transition(with: chosen,
           duration: 0.5,
            options: .transitionFlipFromTop,
         animations: { [weak self] in
             self?.chosen.text = "No Choices Made 🙁"
      }, completion: nil)
    } else {
      UIView.transition(with: chosen,
           duration: 0.5,
            options: .transitionFlipFromTop,
         animations: { [weak self] in
             self?.chosen.text = rand
      }, completion: nil)
    }
    
    scrollView.setContentOffset(CGPoint(x: scrollView.frame.origin.x, y: 0), animated: true) //yeets screen to top
  }
  

  @IBAction func clearAll(_ sender: Any) {
    choice1.text = ""
    choice2.text = ""
    reset()
    chosen.text = "PICK!"
  }

  @IBAction func yesnoClick(_ sender: Any) {
    let yesOrNo = ["Yes", "No"]
    
    let yayNay = yesOrNo.randomElement()
    choice1.text = "Yes"
    choice2.text = "No"
    reset()
    
    
    UIView.transition(with: chosen,
         duration: 0.5,
          options: .transitionFlipFromTop,
       animations: { [weak self] in
           self?.chosen.text = yayNay
    }, completion: nil)
    
    scrollView.setContentOffset(CGPoint(x: scrollView.frame.origin.x, y: 0), animated: true)
  }
  
}

extension UITextField {
  func modifyClearButton() {
      let clearButton = UIButton(type: .custom)
      clearButton.setImage(UIImage(named: "clear.png"), for: .normal)
      clearButton.frame = CGRect(x: 0, y: 0, width: 16, height: 16
    )
      clearButton.contentMode = .scaleAspectFit
      clearButton.addTarget(self, action: #selector(UITextField.clear(sender:) ), for: .touchUpInside)
      self.rightView = clearButton
      self.rightViewMode = .whileEditing
  }
  

  @objc func clear(sender : AnyObject) {
      self.text = ""
  }
}
