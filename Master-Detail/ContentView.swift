//
//  ContentView.swift
//  Master-Detail
//
//  Created by Tse Kit Yam on 27/3/2020.
//  Copyright © 2020 Tse Kit Yam. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let tabOneMax = 100
    let tabTwoMax = 100

    var body: some View {
        NavigationView {
            TabView {
                MasterView(max: tabOneMax)
                    .tabItem {
                        Image(systemName: "list.dash")
                        Text("\(tabOneMax)")
                    }
                MasterView(max: tabTwoMax)
                    .tabItem {
                        Image(systemName: "list.dash")
                        Text("\(tabTwoMax)")
                    }
            }.navigationBarTitle(Text("Master"))

            DetailView()
        }.navigationViewStyle(DoubleColumnNavigationViewStyle())
    }
}

struct MasterView: View {
    var max: Int

    var body: some View {
        List {
            ForEach(0..<max, id: \.self) { number in
                Text("\(number)")
            }
        }
    }
}

struct DetailView: View {
    var body: some View {
        Text("Detail view content goes here")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
