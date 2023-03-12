//
//  InfoViews.swift
//  Landmarks
//
//  Created by 나유진 on 2022/11/10.
//

import SwiftUI

struct InfoViews: View {
    
    
    var landmark: Landmark
    
    
    
    var body: some View {
        
    }
}

struct InfoViews_Previews: PreviewProvider {
    static var previews: some View {
        InfoViews(landmark: ModelData().landmarks[0])
    }
}
