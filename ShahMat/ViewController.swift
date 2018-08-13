//
//  ViewController.swift
//  ShahMat
//
//  Created by Y. Parsak on 8/10/18.
//  Copyright © 2018 Yucel Parsak. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DrawBoard()
    }
    
    func DrawBoard() {

        let height = self.view.bounds.height - self.view.safeAreaInsets.top - self.view.safeAreaInsets.bottom

        // Top %80 Board
        let board = BoardView(
            frame: CGRect(x: self.view.safeAreaInsets.left,
                          y: self.view.safeAreaInsets.top,
                          width: self.view.bounds.width - self.view.safeAreaInsets.left - self.view.safeAreaInsets.right,
                          height:  height * (80/100)))
        self.view.addSubview(board)
        // Bottom %20 Menu
        // TODO:
    }
}
