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

    @IBAction func didTapCallAPIButton(_ sender: Any) {
        processBusinessLogic()
    }

    func processBusinessLogic() {
        print("start BusinessLogic !!")

        API.someAPI { result in
            switch result {
            case .success: print("success!!")
            case .failure(let error):
                ErrorHandler.showAlert(error, completionDidTapRetryButton: { [weak self] in self?.processBusinessLogic() } )
            }
        }
    }
}

