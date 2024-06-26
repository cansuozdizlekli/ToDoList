//
//  Extensions.swift
//  ToDoList
//
//  Created by Cansu Özdizlekli on 4/27/24.
//

import Foundation

extension Encodable {
    
    func asDictionary() -> [String : Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String : Any]
            return json ?? [:]
        }catch {
            return [:]
        }
    }
    
}
