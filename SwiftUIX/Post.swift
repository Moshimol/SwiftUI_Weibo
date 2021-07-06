//
//  Post.swift
//  SwiftUIX
//
//  Created by lushitong on 2020/9/29.
//

import SwiftUI

struct PostList: Codable{
    var list : [Post]
}

//model 数据模型 不继承与View
struct Post: Codable,Identifiable {
    let id: Int
    let avatar: String // image name
    let vip: Bool
    let name: String
    let date: String // yyyy-MM-dd HH:mm:ss
    
    var isFollowed: Bool
    
    let text: String
    let images: [String] // image names
    
    var commentCount: Int
    var likeCount: Int
    var isLiked: Bool
}

extension Post {
    var commentText:String {
        if commentCount <= 0 {
            return "评论"
        }
        if commentCount < 1000 {
            return "\(commentCount)"
        }
        
        return String(format: "%.1fK", Double(commentCount/1000))
    }
    
    var likeText:String {
        if likeCount <= 0 {
            return "点赞"
        }
        if likeCount < 1000 {
            return "\(likeCount)"
        }
        return String(format: "%.1fK", Double(likeCount/1000))
    }
}

let postList = loadPostListData(fileName: "PostListData_hot_1.json")

func loadPostListData (fileName :String) -> PostList {
    guard let url = Bundle.main.url(forResource: fileName, withExtension: nil) else  {
        fatalError("cant not file name data \(fileName)")
    }
    
    guard let data = try? Data(contentsOf: url) else {
        fatalError("无法加载URL数据\(url)")
    }
    
    guard let list = try? JSONDecoder().decode(PostList.self, from: data) else {
        fatalError("无法加载")
    }
    
    return list
}

func loadImage(name:String) -> Image {
    return Image(uiImage: UIImage(named: name)!)
}
