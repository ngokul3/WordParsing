//
//  ViewController.swift
//  WordParsing
//
//  Created by Gokula K Narasimhan on 5/17/19.
//  Copyright © 2019 Gokul K Narasimhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let setWords: Set<String> = ["we", "work", "working", "second", "secondary","apple", "pie", "shoe", "wok", "applepieshoe",
                                "w", " ", ","," "]
    
    let dictWords: [String: String] = ["we" : "together", "work" : "job", "working" : "different tone of work", "second": "after first", "secondary": "after primary","apple": "Not orange", "pie" : "sweet", "shoe" : "on leg", "wok" : "no meaning", "applepieshoe" : "fruit",
                                       "w" : "w", " " : "", "," : ""]
    
    @IBOutlet weak var iboWordInputField: UITextField!
    @IBOutlet weak var iboResultView: UITextView!
    override func viewDidLoad() {
        self.iboWordInputField.becomeFirstResponder()
        super.viewDidLoad()
        
    }
}

extension ViewController{
    
    func printWordsUsingRegExAndSet(){
        if let inputString = self.iboWordInputField.text{
            for item in setWords{
                let regex = try? NSRegularExpression(pattern: item, options: .caseInsensitive)
                
                let rangeOpt = regex?.firstMatch(in: inputString, options: [], range: NSRange(location: 0, length: inputString.utf16.count))
                if let _ = rangeOpt{
                    self.iboResultView.text = self.iboResultView.text + item + "\n"
                }
            }
        }
    }
    
    func printWordsUsingRegExAndDict(){
        if let inputString = self.iboWordInputField.text{
           for (item,_) in dictWords{
                let regex = try? NSRegularExpression(pattern: item, options: .caseInsensitive)
                
                let rangeOpt = regex?.firstMatch(in: inputString, options: [], range: NSRange(location: 0, length: inputString.utf16.count))
                if let _ = rangeOpt{
                    self.iboResultView.text = self.iboResultView.text + item + "\n"
                }
            }
        }
    }
    
    func printWordsUsingNonRegExAndDict(){
        if let inputString = self.iboWordInputField.text{
            for (item,_) in dictWords{
                if (inputString.contains(item)){
                    self.iboResultView.text = self.iboResultView.text + item + "\n"
                }
            }
        }
    }
}


extension ViewController{
    @IBAction func iboParseButtonClick(_ sender: UIButton) {
        self.iboResultView.text.removeAll()
        self.printWordsUsingNonRegExAndDict()
    }
}


