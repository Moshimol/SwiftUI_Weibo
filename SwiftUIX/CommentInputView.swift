//
//  CommentInputView.swift
//  SwiftUIX
//
//  Created by lushitong on 2021/7/13.
//

import SwiftUI

struct CommentInputView: View {
    let post:Post
    @State private var text:String = ""
    @State private var showEmptyTextHud:Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var userData: UserData
    
    @ObservedObject private var keyBoadResponder = KeyBoardResponder()
    
    var body: some View {
        
        VStack(spacing:0) {
            
            CommentTextView(text: $text,beginEdittingOnApper: true)
            
            HStack(spacing:0) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("取消").padding()
                })
                
                Spacer()
                
                Button(action: {
                    if self.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                        self.showEmptyTextHud = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            self.showEmptyTextHud = false
                        }
                        return
                    }
                    print(self.text)
                    self.presentationMode.wrappedValue.dismiss()
                    var post = self.post
                    post.commentCount += 1
                    self.userData.update(post)
                }, label: {
                    Text("发送").padding()
                })
            }
            .font(.system(size: 18))
            .foregroundColor(.black)
        }
        .overlay(
            Text("评论不能为空")
                .scaleEffect(showEmptyTextHud ? 1 : 0.5)
                .animation(.spring(dampingFraction: 0.5))
                .opacity(showEmptyTextHud ? 1 : 0)
                .animation(.easeInOut)
        )
        .padding(.bottom, keyBoadResponder.keyBoardHeight)
        .edgesIgnoringSafeArea(keyBoadResponder.keyBoardShow ? .bottom: [])
        
    }
}

struct CommentInputView_Previews: PreviewProvider {
    static var previews: some View {
        CommentInputView(post: UserData().recommendPostList.list[0])
    }
}
