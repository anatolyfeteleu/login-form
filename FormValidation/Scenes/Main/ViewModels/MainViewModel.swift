//
//  MainViewModel.swift
//  FormValidation
//
//  Created by Анатолий Фетелеу on 16.04.2023.
//

import Foundation
import RxSwift
import RxRelay


class MainViewModel {
    private let disposeBag = DisposeBag()
    
    var loginRelay:        BehaviorRelay<String?> = .init(value: nil)
    var emailRelay:        BehaviorRelay<String?> = .init(value: nil)
    var loginIsValidRelay: BehaviorRelay<Bool>    = .init(value: false)
    var emailIsValidRelay: BehaviorRelay<Bool>    = .init(value: false)
    
    var isLoginValid:      Observable<Bool>
    var isEmailValid:      Observable<Bool>
    var isFormValid:       Observable<Bool>
    
    init() {
        isLoginValid = loginRelay
            .asObservable()
            .map { value in
                guard let login = value else { return false }
                return !login.isEmpty && login.count >= 10
            }
        isEmailValid = emailRelay
            .asObservable()
            .map { value in
                guard let email = value else { return false }
                let emailIsValid = EmailValidator(rawString: email).validate()
                return !email.isEmpty && emailIsValid
            }
        isFormValid = Observable.combineLatest(isLoginValid, isEmailValid) {
            return $0 && $1
        }
        isLoginValid.bind(to: loginIsValidRelay).disposed(by: disposeBag)
        isEmailValid.bind(to: emailIsValidRelay).disposed(by: disposeBag)
    }
}
