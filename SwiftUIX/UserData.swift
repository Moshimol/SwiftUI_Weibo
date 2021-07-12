//
//  UserData.swift
//  SwiftUIX
//
//  Created by lushitong on 2021/7/8.
//

import Combine

class UserData: ObservableObject {
    // 属性放生变化 用的的View就会发生变化
    @Published var recommendPostList: PostList = loadPostListData(fileName: "PostListData_recommend_1.json")
    @Published var hotPostList: PostList = loadPostListData(fileName: "PostListData_hot_1.json")
    
    private var recommendPostDic: [Int: Int] = [:] // id: index
    private var hotPostDic: [Int: Int] = [:] // id: index
    
    init() {
        for i in 0..<recommendPostList.list.count {
            let post = recommendPostList.list[i]
            recommendPostDic[post.id] = i
        }
        
        for i in 0..<hotPostList.list.count {
            let post = hotPostList.list[i]
            hotPostDic[post.id] = i
        }
    }
}

// 微博列表的取值
enum PostListCategory {
    case recommend, hot
}

extension UserData {
    func postList(for category: PostListCategory) -> PostList {
        switch category {
            case .recommend: return recommendPostList
            case .hot: return hotPostList
        }
    }
    
    func post(forId id: Int) -> Post? {
        if let index = recommendPostDic[id] {
            return recommendPostList.list[index]
        }
        if let index = hotPostDic[id] {
            return hotPostList.list[index]
        }
        return nil
    }

    func update(_ post: Post) {
        if let index = recommendPostDic[post.id] {
            recommendPostList.list[index] = post
        }
        if let index = hotPostDic[post.id] {
            hotPostList.list[index] = post
        }
    }
}

