//
//  BusinessSearch.swift
//  SightSee
//
//  Created by Chris Boshoff on 2022/10/17.
//

import Foundation

struct BusinessSearch: Decodable {
    var businesses  = [Business]()
    var total       = 0
    var region      = Region()
}

struct Region: Decodable {
    var center = Coordinates()
}
