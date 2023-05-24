//
//  UserModel.swift
//  SwiftUIConcurrency
//
//  Created by Matteo Buompastore on 24/05/23.
//

import Foundation

struct User : Identifiable, Decodable {
    
    var id : Int
    var name : String
    var username : String
    var email : String
    var phone : String
    var website : String
    var address : Address
    var company : Company
    
    struct Address : Decodable {
        var street : String
        var suite : String
        var city : String
        var zipcode : String
        var geo : Geo
        
        struct Geo : Decodable {
            var lat : String
            var lng : String
        }
    }
    
    struct Company : Decodable {
        var name : String
        var catchPhrase : String
        var bs : String
    }
    
}

actor Description {
    var content : String
    
    init(content: String) {
        self.content = content
    }
}

extension Description {
    func update(with newContent : String) -> String {
        self.content = newContent
        return self.content
    }
}
