//
//  Squiggle .swift
//  SetGame
//
//  Created by Jasdeep saran on 2022-05-11.
//

import SwiftUI



struct Squiggle: Shape{
    
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // divifrf yher eidth of the squiggle into 8 sections.!
        let widthSection = rect.width/8
        //divided the height section of the squiggl into 4 section!
        let heightSection = rect.height/4
        
        //start at midPoint!
        //path.move(to: CGPoint(x: widthSection*6, y: heightSection*2))
        
        
        path.addArc(center: CGPoint(x: widthSection*6, y: heightSection*2), radius: widthSection, startAngle: Angle.degrees(180.0), endAngle: Angle.degrees(0.0), clockwise: false)
        
        path.addArc(center: CGPoint(x: widthSection*6.5, y: heightSection*2), radius: widthSection/2, startAngle: Angle.degrees(0), endAngle: Angle.degrees(180.0), clockwise: false)
        path.addLine(to: CGPoint(x: widthSection*4, y: heightSection*2.5))
        path.addArc(center: CGPoint(x: widthSection*3, y: heightSection*2.5), radius: widthSection, startAngle: Angle.degrees(0), endAngle: Angle.degrees(180.0), clockwise: false)
        
        path.addArc(center: CGPoint(x: widthSection*2.5, y: heightSection*2.5), radius: widthSection/2, startAngle: Angle.degrees(180.0), endAngle: Angle.degrees(0), clockwise: false)
        path.addLine(to: CGPoint(x: widthSection*5, y: heightSection*2))
        
        
        
        
        
        
        
        
        
        
        return path
    }
    
    
    
    
    
    
}


