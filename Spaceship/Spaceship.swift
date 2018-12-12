//
//  Spaceship.swift
//  Spaceship
//
//  Created by Mark Meretzky on 12/11/18.
//  Copyright © 2018 New York University School of Professional Studies. All rights reserved.
//
//  Inspired by class Spaceship in Lab - Classes.playground, page 1.
//
//  The position property is how far spaceshipView.center is to the right (positive) or left
//  (negative) of spaceView.center.  This distance is measured in multiples of the
//  spaceshipView's width.  For example, if position = 2 and the spaceshipView's width is 30,
//  then spaceshipView.center would be 60 pixels to the right of spaceView.center.

import Foundation;

class Spaceship {
    var name: String = "";
    var health: Int = 0;
    var position: Int = 0;
}
