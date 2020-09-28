//
//  PostCell.swift
//  SwiftUIX
//
//  Created by lushitong on 2020/9/28.
//

import SwiftUI

struct PostCell: View {
    var body: some View {
        HStack(){
            VStack (alignment: .leading, spacing: 5.0){
                Text("用户昵称")
                    .font(Font.system(size:16.0))
                    .foregroundColor(Color(red: 242/255, green: 99/255, blue: 4/255))
                    .lineLimit(1)
                
                Text("2020-10-01")
                    .font(Font.system(size:11.0))
                    .foregroundColor(.gray)
                
            }
            
            Spacer()
            
            Button(action: {
                print("follow buttton")
            }, label: {
                Text("123")
                    .font(Font.system(size:11.0))
                    .foregroundColor(.orange)
                    .frame(width: 50, height: 26, alignment: .center)
                    .overlay(
                        RoundedRectangle(cornerRadius: 13.0)
                            .stroke(Color.orange,lineWidth: 1.0)
                    )
            })
            
        }
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell()
    }
}
