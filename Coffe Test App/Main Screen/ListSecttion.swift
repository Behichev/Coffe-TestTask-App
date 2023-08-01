//
//  ListSecttion.swift
//  Coffe Test App
//
//  Created by Ivan Behichev on 01.08.2023.
//

import Foundation

enum ListSection {
    case qrCard([QRCardModel])
    case news([NewsModel])
    
    var items: [Any] {
        switch self {
        case .qrCard(let qrCardModels):
            return qrCardModels
        case .news(let newsModels):
            return newsModels
        }
    }
    
    var title: String {
        switch self {
        case .qrCard(_):
            return ""
        case .news(_):
            return "News and promotions"
        }
    }
}
