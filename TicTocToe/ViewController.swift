//
//  ViewController.swift
//  TicTocToe
//
//  Created by Linda Guo on 2024/1/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    var player = 1;
    var isPlaced = false;
    var placed = [0,0,0,0,0,0,0,0,0]
    let winResult = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[0,3,6],[1,4,7],[2,5,8]]
    var count = 0;
    var canPlace = true
    
    @IBOutlet weak var resultLable: UILabel!
    
    @IBAction func place(_ sender:AnyObject){
        if(placed[sender.tag - 1] == 0 && count < 9 && canPlace == true){
            placed[sender.tag - 1] = player
            if (player == 1){
                sender.setImage(UIImage(named: "close"), for: UIControl.State())
                player = 2
            }
            else{
                sender.setImage(UIImage(named: "circle"), for: UIControl.State())
                player = 1
            }
            count += 1
            if(count > 4){
                isWin()
            }
        }
    }
    func isWin(){
        for win in winResult{
            if(placed[win[0]] == 1 && placed[win[1]] == 1 && placed[win[2]] == 1){
                resultLable.text = "Player One Win!"
                canPlace = false
            }
            else if(placed[win[0]] == 2 && placed[win[1]] == 2 && placed[win[2]] == 2){
                resultLable.text = "Player Two Win!"
                canPlace = false
            }
            else if(count == 9){
                resultLable.text = "Draw"
                canPlace = false
            }
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        player = 1;
        count = 0
        resultLable.text = ""
        placed = [0,0,0,0,0,0,0,0,0]
        for i in 1 ... 9{
            let button = view.viewWithTag(i) as! UIButton
            button.configuration?.image = nil
//            button.setImage(nil, for: .normal)

        }
        canPlace = true
        
    }
    
    
}

