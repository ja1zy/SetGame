//
//  Oval.swift
//  SetGame
//
//  Created by Jasdeep saran on 2022-05-11.
//

import SwiftUI



struct Oval: Shape{
    
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let heightSection = rect.height/4
        let widthSection = rect.width/4
        
        
        
        
    
        //first make an arc, starting from the top left to the top right
        
        path.addArc(center: CGPoint(x: widthSection*2, y: heightSection), radius: heightSection, startAngle: Angle.degrees(180), endAngle: Angle.degrees(0), clockwise: false)
        
        
        //then we make a line that connects the two right sided semi-circles.
        
        path.addLine(to: CGPoint(x: widthSection*2+heightSection, y: heightSection*3))
        
        //then we make another arc that connection the bottom right straight line to the bottom left corner.
        path.addArc(center: CGPoint(x: widthSection*2, y: heightSection*3), radius: heightSection, startAngle: Angle.degrees(0), endAngle: Angle.degrees(180), clockwise: false)
        
        
        //this line connect the bottom left bottom to the top right corner, which.
        //is where we started
        path.addLine(to: CGPoint(x: widthSection*2 - heightSection, y: heightSection))
        
        return path
        // add the end of the lower arc to the start of the whole damn thing
    }
    
    
    
}



