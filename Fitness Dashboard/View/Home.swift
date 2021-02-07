//
//  Home.swift
//  Fitness Dashboard
//
//  Created by Mahesh Prasad on 07/02/21.
//

import SwiftUI

struct Home: View {
    
    @State var selected = 0
    var colors = [Color("Color1"), Color("Color")]
    var columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
    
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack{
                
                HStack{
                    
                    Text("Hello Emma")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Spacer(minLength: 0)
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image("menu")
                            .renderingMode(.template)
                            .foregroundColor(.white)
                    })
                    
                }
                .padding()
                
                //Bar Chart...
                
                VStack(alignment: .leading, spacing: 25, content: {
                    Text("Daily Workout in Hrs")
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    HStack(spacing: 15, content: {
                        ForEach(workout_Data){ work in
                            //Bars...
                            
                            VStack{
                                
                                VStack{
                                    
                                    Spacer(minLength: 0)
                                    
                                    if selected == work.id {
                                        Text(getHrs)
                                    }
                                }
                            }
                            
                            
                        }
                    })
                })
            }
        })
        
    }
    
    //calculating Type...
    func getType(val: String) -> String {
        switch val {
        case "Water": return "L"
        case "Sleep": return "Hrs"
        case "Running": return "Km"
        case "Cycling": return "Km"
        case "Steps": return "stp"
        default: return "Kcal"
        }
    }
    
    
    func getDec(val: CGFloat)-> String {
        let format = NumberFormatter()
        format.numberStyle = .decimal
        return format.string(from: NSNumber.init(value: Float(val)))!
    }
    
    //calculating percent...
    func getPercent(current: CGFloat, Goal: CGFloat) -> String{
        let per = (current/Goal) * 100
        return String(format: "%.1f", per)
    }
    
    //calculating Hrs For Height....
    func getHeight(value: CGFloat)-> CGFloat {
        //the value in minutes...
        //24 hrs in min == 1440
        
        let hrs = CGFloat(value / 1440) * 200
        
        return hrs
    }
    
    //getting hrs...
    
    func getHrs(value: CGFloat)-> String {
        //the value in minute...
        //24 hrs in min = 1440
        
        let hrs = value / 60
        return String(format: "%.1f", hrs)
    }
}

struct RoundedShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 5, height: 5))
        return Path(path.cgPath)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
