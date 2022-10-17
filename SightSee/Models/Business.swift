//
//  Business.swift
//  SightSee
//
//  Created by Chris Boshoff on 2022/10/17.
//

import Foundation

struct Business: Decodable {
    var id              : String?
    var alias           : String?
    var name            : String?
    var image_url       : String?
    var is_closed       : Bool?
    var url             : String?
    var review_count    : Int?
    var categories      : [Categories]?
    var rating          : Double?
    var coordinates     : Coordinates?
    var transactions    : [String]?
    var price           : String?
    var location        : Location?
    var phone           : String?
    var display_phone   : String?
    var distance        : Double?
}

struct Categories: Decodable {
    var alias   : String?
    var title   : String?
}

struct Coordinates: Decodable {
    var latitude    : Double?
    var longitude   : Double?
}

struct Location: Decodable {
    var address1        : String?
    var address2        : String?
    var address3        : String?
    var city            : String?
    var zip_code        : String?
    var country         : String?
    var state           : String?
    var display_address : [String]?
}
