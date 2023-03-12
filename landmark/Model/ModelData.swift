//
//  ModelData.swift
//  landmark
//
//  Created by 나유진 on 2023/02/24.
//

import Foundation
import Combine // https://developer.apple.com/tutorials/swiftui/handling-user-input -> Section 4. Use an Observable Object for Storage

// ObservableObject : SwiftUI는 ObservableObject(관찰 가능한 객체)를 구독하고, 데이터가 변경될 때 새로 고침이 필요한 뷰를 업데이트합니다.
// @Published 속성 추가: ObservableObject(관찰 가능한 객체)는 구독자가 변경 사항을 선택할 수 있도록 데이터에 대한 변경 사항을 게시해야 합니다.
final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    //var hikes: [Hike] = load("hikeData.json")

    var features: [Landmark] {
            landmarks.filter { $0.isFeatured }
        }
    
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}


