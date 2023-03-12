//
//  landmarkApp.swift
//  landmark
//
//  Created by 나유진 on 2023/02/24.
//

import SwiftUI

@main
struct landmarkApp: App {
    // @StateObject 속성을 사용하여 앱의 수명 동안 주어진 속성에 대한 모델 객체를 한 번만 초기화하십시오. 이는 여기에 표시된 것처럼 앱 인스턴스에서 속성을 사용할 때와 뷰에서 사용할 때에도 마찬가지입니다.
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
