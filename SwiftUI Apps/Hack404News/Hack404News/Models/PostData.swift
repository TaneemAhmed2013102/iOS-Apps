//
//  PostData.swift
//  Hack404News
//
//  Created by Taneem Ahmed on 20/6/25.
//

import Foundation

struct Results: Decodable{
    let hits: [Post]
}

struct Post: Decodable, Identifiable{
    var id: String{
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
