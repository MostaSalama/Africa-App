//
//  VideoListView.swift
//  Africa
//
//  Created by Ninja on 17/02/2024.
//

import SwiftUI

struct VideoListView: View {
    //MARK: -PROPERTIES
    @State var videos : [VideoModel] = Bundle.main.decode("videos.json")
    
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { item in
                    NavigationLink (destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
                        VideoListItemView(video: item)
                            .padding(.vertical, 8)
                    }
                    
                }
            }//LIST
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        //SHUFFLE
                        videos.shuffle()
                    }, label: {
                        Image(systemName: "arrow.2.squarepath")
                    })
                }
                
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Videos",displayMode:.inline)
        }// NAVIGATION
    }
}

#Preview {
    
     VideoListView()
}
