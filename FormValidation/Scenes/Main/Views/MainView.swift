//
//  MainView.swift
//  FormValidation
//
//  Created by Анатолий Фетелеу on 16.04.2023.
//

import UIKit
import SnapKit


class MainView: UIView {
    let stateLabel: UILabel = {
        let view = UILabel()
        return view
    }()
    
    let loginInputLabel: UILabel = {
        let view = UILabel()
        view.text = NSLocalizedString("loginInputLabelText", comment: "login label text")
        return view
    }()
    
    let loginInput: UITextField = {
        let view = UITextField()
        view.textContentType = .username
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 2
        view.placeholder = NSLocalizedString("loginInputPlaceholder", comment: "login input placeholder")
        
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width + 15, height: view.frame.height))
        view.leftView = leftView
        view.leftViewMode = .always
        
        let rightView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width + 15, height: view.frame.height))
        view.rightView = rightView
        view.rightViewMode = .always
        return view
    }()
    
    let loginHintLabel: UILabel = {
        let view = UILabel()
        view.textColor = .systemYellow
        return view
    }()
    
    let emailInputLabel: UILabel = {
        let view = UILabel()
        view.text = NSLocalizedString("emailInputLabelText", comment: "email label text")
        return view
    }()
    
    let emailInput: UITextField = {
        let view = UITextField()
        view.textContentType = .emailAddress
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 2
        view.placeholder = NSLocalizedString("emailInputPlaceholder", comment: "email input placeholder")
        
        let leftView = UIVisualEffectView(
            frame: CGRect(x: 0, y: 0, width: view.frame.width + 15, height: view.frame.height)
        )
        view.leftView = leftView
        view.leftViewMode = .always
        return view
    }()
    
    let emailHintLabel: UILabel = {
        let view = UILabel()
        view.textColor = .systemYellow
        return view
    }()
    
    let VStack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 35
        view.alignment = .fill
        return view
    }()
    
    let loginVStack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 10
        view.alignment = .fill
        return view
    }()
    
    let passwordVStack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 10
        view.alignment = .fill
        return view
    }()
    
    var submitButton: UIButton = {
        let view = UIButton()
        view.setTitle(NSLocalizedString("submitButtonTitle", comment: "submit button title"), for: .normal)
        view.setTitleColor(.systemGray4, for: .disabled)
        view.setTitleColor(.black, for: .normal)
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.black.cgColor
        view.isEnabled = false
        return view
    }() {
        didSet {
            if submitButton.isEnabled {
                submitButton.backgroundColor = .systemGreen
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        setupViews()
        setViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = .white
    }
    
    private func setupViews() {
        addSubview(stateLabel)
        addSubview(VStack)
        addSubview(loginVStack)
        addSubview(passwordVStack)
        
        VStack.addArrangedSubview(loginVStack)
        VStack.addArrangedSubview(passwordVStack)
        VStack.addArrangedSubview(submitButton)
        
        loginVStack.addArrangedSubview(loginInputLabel)
        loginVStack.addArrangedSubview(loginInput)
        loginVStack.addArrangedSubview(loginHintLabel)
        
        passwordVStack.addArrangedSubview(emailInputLabel)
        passwordVStack.addArrangedSubview(emailInput)
        passwordVStack.addArrangedSubview(emailHintLabel)
    }
    
    private func setViewConstraints() {
        setStateLabelConstraints()
        setVStackConstraints()
        setLoginInputConstraints()
        setPasswordInputConstraints()
        setSubmitButtonConstraints()
    }
    
    private func setVStackConstraints() {
        VStack.snp.makeConstraints {
            $0.left.equalToSuperview().offset(35)
            $0.right.equalToSuperview().offset(-35)
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    
    private func setLoginInputConstraints() {
        loginInput.snp.makeConstraints {
            $0.height.equalTo(50)
        }
    }
    
    private func setPasswordInputConstraints() {
        emailInput.snp.makeConstraints {
            $0.top.equalTo(emailInput.snp.bottom).offset(-50)
            $0.height.equalTo(50)
        }
    }
    
    private func setSubmitButtonConstraints() {
        submitButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.height.equalTo(50)
        }
    }
    
    private func setStateLabelConstraints() {
        stateLabel.snp.makeConstraints {
            $0.top.equalTo(VStack.snp.top).inset(-100)
            $0.centerX.equalToSuperview()
        }
    }
}
