//
//  VideoListItem.swift
//  Africa
//
//  Created by Ninja on 20/02/2024.
//

import SwiftUI

struct VideoListItemView: View {
    //MARK: -PROPERTIES
    let video : VideoModel
    
    //MARK: -BODY
    
    var body: some View {
        HStack(spacing:10) {
            ZStack {
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                .cornerRadius(9)
                
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .shadow(radius: 4)
            }//ZSTACK
            VStack (alignment: .leading ,spacing: 10) {
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundStyle(.accent)
                
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }//ZSTACK
        }//HSTACK
    }
}

//MARK: -PREVIEW
#Preview {
    @State var videos : [VideoModel] = Bundle.main.decode("videos.json")
    return VideoListItemView(video: videos[0])
}
