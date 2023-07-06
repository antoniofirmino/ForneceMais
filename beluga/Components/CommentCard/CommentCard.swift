//
//  CommentCard.swift
//  beluga
//
//  Created by João Vitor Gonçalves Oliveira on 04/07/23.
//

import UIKit

class CommentCard: UIView {
    static let identifier = "CommentCard"
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    func initSubviews() {
        let nib = UINib(nibName: CommentCard.identifier, bundle: nil)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as?
                                    UIView else {fatalError("Unable to convert nib")}
        
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(view)
    }
    
}
