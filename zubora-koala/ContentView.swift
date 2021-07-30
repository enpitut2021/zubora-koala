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
            Image(self.imageName)
                .resizable()
                .scaledToFit()
            
            Button(action: {
                self.buttonText = "ユーカリをあげました"
                self.imageName = "Smiling_Koala-1"
                UserDefaults.standard.set(true, forKey: "isWaterGiven")
                print(UserDefaults.standard.bool(forKey: "isGiven"))
                
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
