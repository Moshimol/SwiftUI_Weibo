//
//  HomeView.swift
//  SwiftUIX
//
//  Created by lushitong on 2021/7/8.
//

import SwiftUI

struct HomeView: View {
    
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().selectionStyle = .none
        
    }
    
    @State private var leftPercent: CGFloat = 0
    
    var body: some View {
            NavigationView {
                GeometryReader { geometry in
                    HScrollViewController(pageWidth: geometry.size.width,
                                          contentSize: CGSize(width: geometry.size.width * 2, height: geometry.size.height),
                                          leftPercent: self.$leftPercent)
                    {
                        HStack(spacing: 0) {
                            PostListView(category: .recommend)
                                .frame(width: UIScreen.main.bounds.width)
                            
                            PostListView(category: .hot)
                                .frame(width: UIScreen.main.bounds.width)
                        }
                    }
                }
                .edgesIgnoringSafeArea(.bottom)
                .navigationBarItems(leading: HomeNavigationBar(leftPercent: $leftPercent))
                .navigationBarTitle("首页", displayMode: .inline)
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
