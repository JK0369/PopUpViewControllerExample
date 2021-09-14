//
//  ViewController.swift
//  PopUpEx
//
//  Created by 김종권 on 2021/09/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapButton(_ sender: Any) {
        showPopUp(title: "타이틀", message: "메세지")
    }

}

