//
//  BoardView.swift
//  ShahMat
//
//  Created by Y. Parsak on 8/10/18.
//  Copyright © 2018 Y. Parsak. All rights reserved.
//

import UIKit

class BoardView: UIView {

    var path: UIBezierPath!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func drawSquare(_ x: CGFloat, _ y: CGFloat, _ height: CGFloat,_ is_dark : Bool, _ rank: String, _ file: String) {
        path = UIBezierPath()
        path.move(to: CGPoint(x: x, y: y))
        path.addLine(to: CGPoint(x: x, y: y + height))
        path.addLine(to: CGPoint(x: x + height, y: y + height))
        path.addLine(to: CGPoint(x: x + height, y: y))
        path.close()
        
        let rank_text = UITextField(frame: CGRect(x: x, y: y, width: height, height: height))
        rank_text.placeholder = rank
        rank_text.font = UIFont.systemFont(ofSize: 20)
        rank_text.borderStyle = UITextBorderStyle.none
        rank_text.backgroundColor = UIColor.clear
        rank_text.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        rank_text.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        self.addSubview(rank_text)
        
        let file_text = UITextField(frame: CGRect(x: x + (height/3), y: y, width: height/2, height: height))
        file_text.placeholder = file
        file_text.font = UIFont.systemFont(ofSize: 20)
        file_text.borderStyle = UITextBorderStyle.none
        file_text.backgroundColor = UIColor.clear
        file_text.contentVerticalAlignment = UIControlContentVerticalAlignment.bottom
        file_text.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
        self.addSubview(file_text)

        if is_dark {
            path.fill()
        }
        path.stroke()
    }
    
    override func draw(_ rect: CGRect) {
        let width = self.frame.size.width
        let height = self.frame.size.height
        var square_height = height / 8
        if (width < height ) {
            square_height = width / 8
        }
        UIColor.blue.setFill()
        UIColor.darkGray.setStroke()
        var is_dark = false;
        var file = ""
        var rank = ""
        for y in 0...7 {
            for x in 0...7 {
                if y == 7 {
                    if x == 0 {file = "A";}
                    if x == 1 {file = "B";}
                    if x == 2 {file = "C";}
                    if x == 3 {file = "D";}
                    if x == 4 {file = "E";}
                    if x == 5 {file = "F";}
                    if x == 6 {file = "G";}
                    if x == 7 {file = "H";}
                } else { file = ""}
                
                if x == 0 {
                    rank = String(8 - y)
                } else { rank = ""}
                drawSquare(square_height * CGFloat(x),square_height * CGFloat(y) , square_height, is_dark, rank, file)
                if is_dark {is_dark = false}
                else {is_dark = true}
            }
            if is_dark {is_dark = false}
            else {is_dark = true}
        }
    }
}
