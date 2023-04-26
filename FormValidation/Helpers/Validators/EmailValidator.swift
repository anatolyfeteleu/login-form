//
//  EmailValidator.swift
//  FormValidation
//
//  Created by Анатолий Фетелеу on 25.04.2023.
//

import Foundation


class EmailValidator {
    let rawString: String
    
    let userRegex = "[(a-z|0-9|\\-\\+\\=\\.)]+"
    let domainRegex = "[(a-z|0-9|\\-)]+\\.[a-z]+"
    
    init(rawString: String) {
        self.rawString = rawString
    }
    
    func validate() -> Bool {
        let parts = rawString.split(separator: "@").map { String($0) }
        if parts.count != 2 { return false }
        
        let (userPart, domainPart) = (parts[0], parts[1])
        if userPart.isEmpty || domainPart.isEmpty { return false }
        
        do {
            guard let userMatch = try Regex(userRegex).firstMatch(in: userPart) else { return false }
            guard let domainMatch = try Regex(domainRegex).firstMatch(in: domainPart) else { return false }
            return userMatch.count >= 1 && domainMatch.count >= 1
        } catch {
            return false
        }
    }
}
