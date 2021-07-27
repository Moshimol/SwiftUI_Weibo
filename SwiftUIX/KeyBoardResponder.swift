//
//  KeyBoardResponder.swift
//  SwiftUIX
//
//  Created by lushitong on 2021/7/27.
//
import SwiftUI

class KeyBoardResponder: ObservableObject {
    
    @Published var keyBoardHeight:CGFloat = 0
    var keyBoardShow:Bool {keyBoardHeight > 0}
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoadWillShow(_:)), name: UIWindow.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoadWillHidden(_:)), name: UIWindow.keyboardWillHideNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)    
    }
    
    @objc private func keyBoadWillShow(_ notification: Notification) {
        guard let frame = notification.userInfo?[UIWindow.keyboardFrameEndUserInfoKey] as? CGRect else {
            return
        }
        keyBoardHeight = frame.height;
    }
    
    @objc private func keyBoadWillHidden(_ notification: Notification) {
        guard let frame = notification.userInfo?[UIWindow.keyboardFrameEndUserInfoKey] as? CGRect else {
            return
        }
        keyBoardHeight = frame.height;
    }
    
}
