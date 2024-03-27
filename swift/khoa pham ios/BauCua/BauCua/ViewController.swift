//
//  ViewController.swift
//  BauCua
//
//  Created by Macbook on 02/09/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btnPlay: UIButton!
    var screenWidth:CGFloat?
    var screenHeight:CGFloat?
    var leftDoor_view:UIImageView?
    var rightDoor_view:UIImageView?
    var node0_view:UIImageView?
    var node1_view:UIImageView?
    var node2_view:UIImageView?
    var arrayNode:[String]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayNode = ["ca", "cua", "ga", "holo", "nai", "tom"]
        
        screenWidth = self.view.frame.size.width
        screenHeight = self.view.frame.size.height
        
        // node 1
        node1_view = UIImageView(frame: CGRect(x: screenWidth!/2 - screenWidth!/8 , y: screenHeight!/100*15, width: screenWidth!/4, height: screenWidth!/4))
        node1_view!.image = UIImage(named: "empty")
        view.addSubview(node1_view!)
        
        // node 0
        node0_view = UIImageView(frame: CGRect(x: (node1_view?.frame.origin.x)! - (node1_view?.frame.size.width)! - screenWidth!/100*5, y: screenHeight!/100*15, width: screenWidth!/4, height: screenWidth!/4))
        node0_view!.image = UIImage(named: "empty")
        view.addSubview(node0_view!)
        
        // node 2
        node2_view = UIImageView(frame: CGRect(x: (node1_view?.frame.origin.x)! + (node1_view?.frame.size
            .width)! + screenWidth!/100*5 , y: screenHeight!/100*15, width: screenWidth!/4, height: screenWidth!/4))
        node2_view!.image = UIImage(named: "empty")
        view.addSubview(node2_view!)
        
        // left Door
        leftDoor_view = UIImageView(frame: CGRect(x: 0-screenWidth!/2, y: 0, width: screenWidth!/2, height: screenHeight!))
        leftDoor_view!.image = UIImage(named: "left_bg")
        view.addSubview(leftDoor_view!)
        
        // right Door
        rightDoor_view = UIImageView(frame: CGRect(x: screenWidth!, y: 0, width: screenWidth!/2, height: screenHeight!))
        rightDoor_view!.image = UIImage(named: "right_bg")
        view.addSubview(rightDoor_view!)
        
        // btnPlay
        btnPlay.frame.size = CGSize(width: screenWidth!/7, height: screenWidth!/7/2)
        btnPlay.setBackgroundImage(UIImage(named: "btnNewGame"), for: .normal)
        btnPlay.frame.origin.x = screenWidth!/2 - btnPlay.frame.size.width/2
        btnPlay.frame.origin.y = screenHeight! - btnPlay.frame.size.height/100*150
        btnPlay.setTitle("", for: .normal)
        
        
    }

    @IBAction func newGame(_ sender: Any) {
        UIView.animate(withDuration: 3) {
            self.leftDoor_view?.frame.origin.x = 0
            self.rightDoor_view?.frame.origin.x = self.screenWidth!/2
        } completion: { Bool in
            Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(self.openDoor), userInfo: nil, repeats: false)
        }

    }
    
    @objc func openDoor() {
        // xu ly random 3 con vat
        randomNode(node: node0_view!)
        randomNode(node: node1_view!)
        randomNode(node: node2_view!)
        
        // open door
        UIView.animate(withDuration: 3) {
            self.leftDoor_view?.frame.origin.x = 0-self.screenWidth!/2
            self.rightDoor_view?.frame.origin.x = self.screenWidth!
        }
    }
    
    func randomNode(node:UIImageView) {
        var rand:Int = Int.random(in: 0...arrayNode!.count-1)
        node.image = UIImage(named: arrayNode![rand])
    }

}

