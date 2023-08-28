//
//  ViewController.swift
//  CodePath-Prework
//
//  Created by Jonathan Dieu on 8/26/23.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private func createLayer() {
        let layer = CAEmitterLayer()
        layer.emitterPosition = CGPoint(x: view.center.x,
                                        y: -100)
        
        let colors: [UIColor] = [
            .systemRed,
            .systemBlue,
            .systemOrange,
            .systemGreen,
            .systemPink,
            .systemYellow,
            .systemPurple
        ]
        
        let cells: [CAEmitterCell] = colors.compactMap {
            let cell = CAEmitterCell()
            cell.scale = 0.01
            cell.emissionRange = .pi * 2
            cell.lifetime = 10
            cell.birthRate = 50
            cell.velocity = 150
            cell.color = $0.cgColor
    //        cell.spin
            cell.contents = UIImage(named: "confetti")!.cgImage
            return cell
        }
    

        
        
        layer.emitterCells = cells
        view.layer.addSublayer(layer)
    }

    @IBAction func changeBackgroundColor(_ sender: UIButton) {
        let randomColor = changeColor()
        view.backgroundColor = randomColor
        
        let randomTextColor = changeColor()
        jobLabel.textColor = randomTextColor
        
        createLayer()
    }
    
    @IBOutlet weak var jobLabel: UILabel!
    
    func changeColor() -> UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        
        return UIColor(red: red, green: green, blue: blue, alpha: 0.5)
    }
}

