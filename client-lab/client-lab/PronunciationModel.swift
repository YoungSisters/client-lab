//
//  PronunciationModel.swift
//  client-lab
//
//  Created by 이서영 on 2022/11/25.
//

import Foundation

struct Pronunciation: Codable {
    var requestId: String?
    var result: Int?
    var returnType: String?
    var returnObject: PronuncationScore?
    var reason: String?

    
    enum CodingKeys: String, CodingKey {
        case requestId = "request_id"
        case result
        case returnType = "return_type"
        case returnObject = "return_object"
    }
}

struct PronuncationScore: Codable {
    var recognized: String
    var score: Double
}
