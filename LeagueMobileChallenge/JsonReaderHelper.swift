//
//  JsonReaderHelper.swift
//  LeagueMobileChallenge
//
//  Created by Sagaya Abdul on 8/18/21.
//

import Foundation
import Common
class JsonReaderHelper {
	static func loadJsonFor(fileName: String) -> [String: Any]? {
		if let data  = loadJsonData(for: fileName) {
			guard let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
			else { return [:] }
			return json
		}
		return nil
	}
	
	static func load<Model: Decodable>(model: Model.Type, from fileName: String) throws -> Model {
		guard let data = loadJsonData(for: fileName),
		let model = try? JSONDecoder().decode(Model.self, from: data)
		else {
            throw ErrorModel(message: "An error occured decoding json")
		}
		return model
	}
	
	static func loadJsonData(for fileName: String) -> Data? {
		guard let  path = Bundle.main.path(forResource: fileName, ofType: "json") else {
			return nil
		}
		
		return FileManager.default.contents(atPath: path)
	}
}
