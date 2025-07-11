//
//  Constants.swift
//  WinkChat
//
//  Created by Taneem Ahmed on 15/6/25.
//  Copyright © 2025 Taneem Ahmed. All rights reserved.
//

struct Constants{
    static let registerSegue = "RegisterToLogin"
    static let loginSegue = "LoginToChat"
    static let appName = "😉WinkChat"
    static let wink = "😉"
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    
    struct BrandColors {
        static let yellow = "BrandYellow"
        static let lightPink = "BrandLightPink"
        static let orange = "BrandOrange"
        static let magenta = "BrandMagenta"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
