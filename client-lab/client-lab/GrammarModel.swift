//
//  GrammarModel.swift
//  client-lab
//
//  Created by 이서영 on 2022/12/01.
//

import Foundation

struct Grammar: Codable {
    var software: Software
    var warnings: Warnings
    var language: Language
    var matches: [Match]
}

struct Software: Codable {
    var name: String
    var version: String
    var apiVersion: Int
    var premium: Bool
    var premiumHint: String
    var status: String
}

struct Warnings: Codable {
    var incompleteResults: Bool
}

struct Language: Codable {
    var name: String
    var code: String
    var detectedLanguage: DetectedLanguage
}

struct DetectedLanguage: Codable {
    var name: String
    var code: String
}

struct Match: Codable {
    var message: String
    var shortMessage: String
    var replacements: [Replacement]
    var offset: Int
    var length: Int
    var context: Context
    var type: MatchType
    var rule: Rule
}

struct Replacement: Codable {
    var value: String
}

struct Context: Codable {
    var text: String
    var offset: Int
    var length: Int
}

struct MatchType: Codable {
    var typeName: String
}

struct Rule: Codable {
    var id: String
    var subId: String?
    var description: String
    var issueType: String
    var category: RuleCategory
}

struct RuleCategory: Codable {
    var id: String
    var name: String
}
