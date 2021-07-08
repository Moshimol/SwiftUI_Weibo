//
//  PostListView.swift
//  SwiftUIX
//
//  Created by lushitong on 2021/7/6.
//

import SwiftUI

struct PostListView: View {
    let category:PostListCategory
    
    var postList: PostList {
        switch category {
            case .recommend:
                return loadPostListData(fileName: "PostListData_recommend_1.json")
            case .hot:
                return loadPostListData(fileName: "PostListData_hot_1.json") 
        }
    }
    
    var body: some View {
        List {
            ForEach(self.postList.list) { post in
                ZStack {
                    PostCell(post: post)
                    NavigationLink(destination: PostDetailView(post: post)){
                         EmptyView()
                    }.hidden()
                }
                
                .listRowInsets(EdgeInsets())
            }
        }
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PostListView(category: .recommend)
                .navigationBarTitle("Title")
                .navigationBarHidden(true)
        }
    }
}
