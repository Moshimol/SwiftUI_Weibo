//
//  PostVipBage.swift
//  SwiftUIX
//
//  Created by lushitong on 2020/9/29.
//

import SwiftUI

struct PostVipBage: View {
    var body: some View {
        Text("V").bold().font(.system(size: 11.0))
            .frame(width: 15, height: 15, alignment: .center)
            .foregroundColor(.yellow)
            .background(Color.red)
            .clipShape(Circle())
            .overlay(RoundedRectangle(cornerRadius: 7.5)
                        .stroke(Color.white,lineWidth: 1.0))
            
    }
}

struct PostVipBage_Previews: PreviewProvider {
    static var previews: some View {
        PostVipBage()
    }
}
