//
//  TestViewController.swift
//  FormValidation
//
//  Created by Анатолий Фетелеу on 24.04.2023.
//

import UIKit

class TestViewController: UIViewController {
    
    override func loadView() {
        self.view = TestView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Test view controller"
        view.backgroundColor = .white
    }

}
