//
//  PostCell.swift
//  SwiftUIX
//
//  Created by lushitong on 2020/9/28.
//

import SwiftUI

struct PostCell: View {
    let post : Post
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5.0) {
            HStack(spacing: 5.0){
                Image(uiImage: UIImage(named: post.avatar)!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50, alignment: .center)
                    .clipShape(Circle())
                    .overlay(
                        PostVipBage(isVip: post.vip)
                            .offset(x: 16.0, y: 16.0)
                    )
                    
                VStack (alignment: .leading, spacing: 5.0){
                    Text(post.name)
                        .font(Font.system(size:16.0))
                        .foregroundColor(Color(red: 242/255, green: 99/255, blue: 4/255))
                        .lineLimit(1)
                    
                    Text(post.date)
                        .font(Font.system(size:11.0))
                        .foregroundColor(.gray)
                    
                }
                .padding(.leading, 10)
        
                if !post.isFollowed {
                    Spacer()
                    
                    Button(action: {
                        print("follow buttton")
                    }, label: {
                        Text("关注")
                            .font(Font.system(size:11.0))
                            .foregroundColor(.orange)
                            .frame(width: 50, height: 26, alignment: .center)
                            .overlay(
                                RoundedRectangle(cornerRadius: 13.0)
                                    .stroke(Color.orange,lineWidth: 1.0)
                            )
                    })
                    .buttonStyle(BorderlessButtonStyle())
                }
            }
            
            Text(post.text)
                .font(Font.system(size:17))
            
            if !post.images.isEmpty {
                PostImageCell(images: post.images, width: UIScreen.main.bounds.width - 30.0)
            }
            Divider()
            
            HStack(spacing:0) {
                Spacer()
                PostCellToolbarButton(image: "message", text: post.commentText, color: .black) {
                    print("click button")
                }
                
                Spacer()
                
                PostCellToolbarButton(image: "heart", text: post.likeText, color:.black) {
                    
                }
                
                Spacer()
            }
            Rectangle()
                .padding(.horizontal,-15)
                .frame(height:10)
                .foregroundColor(Color(red: 238/255, green: 238/255, blue: 238/255))
        }
       
        .padding(.horizontal, 15)
        .padding(.top, 15)
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(post: postList.list[4])
    }
}
