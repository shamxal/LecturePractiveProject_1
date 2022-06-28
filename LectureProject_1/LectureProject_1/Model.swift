//
//  Model.swift
//  LectureProject_1
//
//  Created by Shamkhal Guliyev on 28.06.22.
//

import Foundation

/*
 country: USA
        [city]: ["New York", "Boston"]
        [cityImage]: ["New York", "Boston"]
 
 [country] {
    name: "USA"
    [cities]
        {
            name: "Boston"
            image: "bos"
            text: "laisjdlasdoasipod"
        }
         {
             name: "New York"
             image: "ny"
             text: "laisjdlasdoasipod"
         }
 }
 
 */

struct CountryModel {
    let name: String
    let flag: String
    let cities: [CityModel]
}

struct CityModel {
    let name: String
    let image: String
    let text: String
}
