//
//  ContentView.swift
//  ColorPicker
//
//  Created by RUPAM LAHA on 28/12/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var red: Double = 0
    @State private var green: Double = 0
    @State private var blue: Double = 0
    
    @State private var alertState: Bool = false
    
    
    var body: some View {
        
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20){
            
            //Color Palate
            
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * 0.5, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color(red: red/255, green: green/255, blue: blue/255, opacity: 1.0))
            //                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
            
            //            Spacer()
            
            //Sliders
            
            VStack{
                
                //Red Slider
                
                SliderView(value: $red, color: .red, sliderName: "Red")
                
                
                //Green Slider
                
                SliderView(value: $green, color: .green, sliderName: "Green")
                
                
                //Blue Slider
                
                SliderView(value: $blue, color: .blue, sliderName: "Blue")
                
            }
            
            //Hex Value
            HStack{
                let hexString = String(format:"%02X", Int(self.red)) + String(format:"%02X", Int(self.green)) + String(format:"%02X", Int(self.blue))
                
                Text("Hex Code: #\(hexString)")
                
                Button(action: {
                    UIPasteboard.general.string = String("#\(hexString)")
                    self.alertState = true
                }) {
                    Image(systemName: "doc.on.doc")
                }
                .alert(isPresented: $alertState) {
                    Alert(title: Text("Hex Code copied to clip board"))
                }
            
            }
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
