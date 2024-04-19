//
//  MockedData.swift
//  RickAndMorty
//
//  Created by Manuel Rodriguez Sebastian on 18/4/24.
//

import Foundation

public final class MockedData {
    public static func charactersListJSON() -> Data {
        return readDataFromFile(fileName: "characters_list")!
    }
    
    private static func readDataFromFile(fileName: String) -> Data? {
        guard let path = Bundle.main.path(forResource: fileName, ofType: "json") else { return nil }
        
        do {
            let fileUrl = URL(fileURLWithPath: path)

            return try Data(contentsOf: fileUrl, options: .mappedIfSafe)
        } catch {
            return nil
        }
    }
}
