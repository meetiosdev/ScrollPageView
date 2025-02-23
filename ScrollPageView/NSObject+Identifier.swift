//
//  name.swift
//  ScrollPageView
//
//  Created by Swarajmeet Singh on 23/02/25.
//


import Foundation

// MARK: - NSObject Extension
extension NSObject {
    /// A computed property to get the class name as a string.
    static var identifier: String {
        return String(describing: self)
    }
}
