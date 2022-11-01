//
//  Diamond.swift
//  SetGame
//
//  Created by Jasdeep saran on 2022-05-10.
//

import SwiftUI



struct Diamond: Shape {
    
    /*
     path a bunch of lines that connect to become a  diamond!!!
     */
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        //start position
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        
        //   go to position mid y , min x, the middle left side
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        
        //go to bottom
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        
        //go to middle left side from the bottom
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        
        //go to starting point!
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        return path
    }
}

/*
 shapes min Y cordinate starts at
 
 */



/*
struct triangle: Shape{
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
            //lines of path
        //start at top middle
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        
        //move to bottom left
        path.addLine(to: CGPoint (x: rect.minX, y: rect.maxY))
        
        //move to bottom right
        path.addLine(to: CGPoint (x: rect.maxX, y: rect.maxY))
        
        //end at top mid
        
        path.addLine(to: CGPoint (x: rect.midX, y: rect.minY))
 
        
        
        
        return path
    }

}

*/

/*
struct Pie: Shape {
    //path will draw us the shape !!!
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool = false
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let start = CGPoint(
            x: center.x + radius * CGFloat(cos(startAngle.radians)),
            y: center.y + radius * CGFloat(sin(startAngle.radians))
        )
        var p = Path()
        p.move(to: center  )
        
        p.addLine(to: start)
        p.addArc(center: center,
                 radius: radius,
                 startAngle: startAngle
                 , endAngle: endAngle,
                 clockwise: !clockwise
        )
        p.addLine(to: center)
        return p
    }
}

*/
