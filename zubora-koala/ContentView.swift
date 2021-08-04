//
//  ContentView.swift
//  zubora-koala
//
//  Created by MacBook Pro on 2021/07/29.
//

import SwiftUI

struct ContentView: View {
    @State var buttonText = "ユーカリをあげる"
    @State var imageName = "Sleeping_Koala"
    
    var body: some View {
        VStack {
            Text("Hi!, I'm Koala")
            
            LottieView(name: "koala-smiling", loopMode: .loop)
                .frame(width: 250, height: 250)
            
            Button(action: {
                self.buttonText = "ユーカリをあげました"
                self.imageName = "Smiling_Koala-1"
                UserDefaults.standard.set(true, forKey: "isWaterGiven")
                print(UserDefaults.standard.bool(forKey: "isWaterGiven"))
                
            }){
                Text(self.buttonText)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}