//
//  MainViewController.swift
//  FormValidation
//
//  Created by Анатолий Фетелеу on 16.04.2023.
//

import UIKit
import RxCocoa
import RxSwift


class MainViewController: UIViewController {
    private let mainView = MainView()
    private let viewModel = MainViewModel()
    private let disposeBag = DisposeBag()
    
    // MARK: Lifecycle
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        setupBindings()
        configureButtonActions()
    }
    
    // MARK: - Lifecycle
    
    private func setup() {
        title = "Form validation sample"
    }
    
    private func setupBindings() {
        mainView.loginInput.rx.text.bind(to: viewModel.loginRelay).disposed(by: disposeBag)
        mainView.emailInput.rx.text.bind(to: viewModel.emailRelay).disposed(by: disposeBag)
        viewModel.isFormValid.bind(to: mainView.submitButton.rx.isEnabled).disposed(by: disposeBag)
        
        mainView.loginInput.rx
            .controlEvent([.editingDidEnd])
            .asObservable()
            .map { [weak self] in
                guard let self else { return "" }
                return (
                    self.viewModel.loginIsValidRelay.value
                    ? ""
                    : NSLocalizedString("incorrectLogin", comment: "incorrect login hint")
                )
            }
            .bind(to: mainView.loginHintLabel.rx.text)
            .disposed(by: disposeBag)

        mainView.emailInput.rx
            .controlEvent([.editingDidEnd])
            .asObservable()
            .map { [weak self] in
                guard let self else { return "" }
                return (
                    self.viewModel.emailIsValidRelay.value
                    ? ""
                    : NSLocalizedString("incorrectEmail", comment: "incorrect email hint")
                )
            }
            .bind(to: mainView.emailHintLabel.rx.text)
            .disposed(by: disposeBag)
    }
}

extension MainViewController {
    private func configureButtonActions() {
        mainView.submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
    }
    
    @objc func submitButtonTapped() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.mainView.stateLabel.text = NSLocalizedString("succeeded", comment: "succeeded action")
            debugPrint("the button was pressed")
        }
    }
}

