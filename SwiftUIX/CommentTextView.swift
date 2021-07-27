//
//  CommentTextView.swift
//  SwiftUIX
//
//  Created by lushitong on 2021/7/13.
//

import SwiftUI

struct CommentTextView: UIViewRepresentable {
    @Binding var text:String
    
    let beginEdittingOnApper: Bool
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.backgroundColor = .systemGray6
        view.font = .systemFont(ofSize: 18)
        view.textContainerInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        view.delegate = context.coordinator
        return view
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        if beginEdittingOnApper,
           uiView.window != nil,
           !context.coordinator.didBecomeFirstRes,
           !uiView.isFirstResponder {
            uiView.becomeFirstResponder()
            context.coordinator.didBecomeFirstRes = true
        }
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        let parent : CommentTextView
        var didBecomeFirstRes:Bool = false
        
        init(_ view: CommentTextView) {
            parent = view
        }
        
        func textViewDidChange(_ textView: UITextView) {
            parent.text = textView.text
        }
        
    }
}

struct CommentTextView_Previews: PreviewProvider {
    static var previews: some View {
        CommentTextView(text: .constant(""), beginEdittingOnApper: true)
    }
}
