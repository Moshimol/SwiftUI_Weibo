//
//  PostListView.swift
//  SwiftUIX
//
//  Created by lushitong on 2021/7/6.
//

import SwiftUI

struct PostListView: View {
    let category:PostListCategory
    
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        List {
            ForEach(userData.postList(for: category).list) { post in
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
