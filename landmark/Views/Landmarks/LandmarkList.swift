//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 나유진 on 2022/11/10.
//

import SwiftUI

struct LandmarkList: View {
    //modelData 속성은 environmentObject(_:) 수정자가 부모에 적용된 한 자동으로 값을 가져옵니다.
    @EnvironmentObject var modelData: ModelData
    
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks){ landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
                
            }
            //struct에 identifier protocol을 적용하면 id 필요 없다
            // List에서 정적 및 동적 뷰를 결합하거나 두 개 이상의 동적 뷰 그룹을 결합하려면 데이터 컬렉션을 List에 전달하는 대신 ForEach 유형을 사용하십시오.
            .navigationTitle("Landmarks")
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.plain)
        }
        

        
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
            
    }
}
