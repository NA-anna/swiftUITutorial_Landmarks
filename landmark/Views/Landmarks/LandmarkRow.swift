//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by 나유진 on 2022/11/10.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack{
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            VStack(alignment: .leading){
                Text(landmark.name).font(.title)
                Text(landmark.park).foregroundColor(.secondary)
            }
            .padding(.horizontal)
            Spacer()
            if landmark.isFavorite {
                Image(systemName: "heart.fill")
                    .foregroundColor(.pink)
            }else {
                Image(systemName: "heart")
                    .foregroundColor(.pink)
            }
            
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    
    static var previews: some View {
        Group {
            LandmarkRow(landmark: landmarks[1])
            LandmarkRow(landmark: landmarks[2])
                
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
