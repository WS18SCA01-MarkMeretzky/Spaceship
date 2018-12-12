//
//  ViewController.swift
//  Spaceship
//
//  Created by Mark Meretzky on 12/11/18.
//  Copyright © 2018 New York University School of Professional Studies. All rights reserved.
//
//  Inspired by class Spaceship in Lab - Classes.playground, page 1.
//  Output of print statements is
//  viewDidLoad,            spaceView.frame = (30.0, 0.0, 283.0, 647.0)
//  viewWillLayoutSubviews, spaceView.frame = (30.0, 0.0, 283.0, 647.0)
//  viewWillLayoutSubviews, spaceView.frame = (30.0, 0.0, 314.0, 818.0)
//


import UIKit;

class ViewController: UIViewController {
    var spaceship: Spaceship = Spaceship(); //Lab - Classes.playground, page 1.
    
    @IBOutlet weak var spaceView: UIView!;  //Big midnight blue view represents outer space.
    @IBOutlet weak var spaceshipView: UIView!; //small black square
    @IBOutlet weak var leftButton: UIButton!;
    @IBOutlet weak var rightButton: UIButton!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //print("viewDidLoad,            spaceView.frame = \(spaceView.frame)");
        //Give each button a border.
        leftButton.layer.borderWidth = 1;
        leftButton.layer.borderColor = spaceView.backgroundColor!.cgColor;
        
        rightButton.layer.borderWidth = 1;
        rightButton.layer.borderColor = spaceView.backgroundColor!.cgColor;
    }

    @IBAction func leftButtonPressed(_ sender: UIButton) {
        if canMoveLeft() {
            spaceship.position -= 1;    //Move left.
            updateUI();
        }
    }
    
    @IBAction func rightButtonPressed(_ sender: UIButton) {
        if canMoveRight() {
            spaceship.position += 1;    //Move right.
            updateUI();
        }
    }
    
    //Return true if the spaceship can be moved to the right without extending beyond
    //the edge of the spaceView.
    
    func canMoveRight() -> Bool {
        //how far to the right of spaceView.center would spaceshipView.center be
        //if we moved to the right?
        let actualDistance: CGFloat = spaceshipView.frame.width * (CGFloat(spaceship.position) + 1);
        
        //how far to the right of spaceView.center could spaceshipView.center be
        //without having the spaceshipView extend beyond the edge of the spaceView?
        let permissibleDistance: CGFloat = (spaceView.frame.width - spaceshipView.frame.width) / 2;
        
        return actualDistance <= permissibleDistance;
    }
    
    //Return true if the spaceship can be moved to the left without extending beyond
    //the edge of the spaceView.
    
    func canMoveLeft() -> Bool {
        //how far to the left of spaceView.center would spaceshipView.center be
        //if we moved to the left?
        let actualDistance: CGFloat = -spaceshipView.frame.width * (CGFloat(spaceship.position) - 1);
        
        //how far to the left of spaceView.center could spaceshipView.center be
        //without having the spaceshipView extend beyond the edge of the spaceView?
        let permissibleDistance: CGFloat = (spaceView.frame.width - spaceshipView.frame.width) / 2;
        
        return actualDistance <= permissibleDistance;
    }
    
    //Called when the width and height of view.frame changes.
    //I would like to call updateUI() in viewDidLoad().  But spaceView.frame does not yet have its
    //correct width and height when viewDidLoad() is called.  spaceView.frame has its correct
    //dimensions by the time viewWillLayoutSubviews() is called.
    
    override func viewWillLayoutSubviews() {
        //print("viewWillLayoutSubviews, spaceView.frame = \(spaceView.frame)");
        //Position the spaceshipView along the lower edge of the spaceView.
        spaceshipView.center.y = spaceView.frame.height - spaceshipView.frame.height / 2;
        updateUI();
    }
    
    //Called when the horizontal position of the spaceship has changed.
    //Put the spaceshipView in its correct position.
    
    func updateUI() {
        spaceshipView.center.x = spaceView.frame.width / 2 + spaceshipView.frame.width * CGFloat(spaceship.position);
        rightButton.isEnabled = canMoveRight();
        leftButton.isEnabled = canMoveLeft();
    }
    
}
