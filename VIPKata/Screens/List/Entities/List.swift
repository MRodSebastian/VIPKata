//
//  List.swift
//  VIPKata
//
//  Created by Manuel Rodriguez on 11/4/22.
//

import Foundation

public struct List<T: Hashable> {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [T]
    
    public func updating(newList: List) -> List {
        return updating(offset: newList.offset)
            .updating(limit: newList.limit)
            .updating(count: newList.count)
            .updating(total: newList.total)
            .updating(newResults: newList.results)
    }
    
    public func updating(offset: Int) -> List {
        return List(offset: offset, limit: limit, total: total, count: count, results: results)
    }
    
    public func updating(limit: Int) -> List {
        return List(offset: offset, limit: limit, total: total, count: count, results: results)
    }
    
    public func updating(count: Int) -> List {
        return List(offset: offset, limit: limit, total: total, count: count, results: results)
    }
    
    public func updating(total: Int) -> List {
        return List(offset: offset, limit: limit, total: total, count: count, results: results)
    }
    
    public func updating(newResults: [T]) -> List {
        var currentResults = self.results
        currentResults.append(contentsOf: newResults)
        
        return List(offset: offset, limit: limit, total: total, count: count, results: currentResults)
    }
}
