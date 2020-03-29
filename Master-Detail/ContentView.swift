//
//  ContentView.swift
//  Master-Detail
//
//  Created by Tse Kit Yam on 27/3/2020.
//  Copyright © 2020 Tse Kit Yam. All rights reserved.
//

import SwiftUI

private let dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .medium
    dateFormatter.timeStyle = .medium
    return dateFormatter
}()

struct ContentView: View {
    @Environment(\.managedObjectContext)
    var viewContext

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var showAlert = false
 
    var body: some View {
        NavigationView {
            Text("Master")
                .navigationBarTitle("Master")
                .navigationBarItems(
                    trailing: Button(
                        action: {
                            self.showAlert.toggle()
                        }
                    ) { 
                        Image(systemName: "exclamationmark.triangle")
                            .imageScale(.large)
                            .padding()
                    }
            )
        }.alert(isPresented: $showAlert) {
            Alert(title: Text("Alert"))
        }.navigationViewStyle(DoubleColumnNavigationViewStyle())

    }
}

struct MasterView: View {
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Event.timestamp, ascending: true)], 
        animation: .default)
    var events: FetchedResults<Event>

    @Environment(\.managedObjectContext)
    var viewContext

    var body: some View {
        List {
            ForEach(events, id: \.self) { event in
                NavigationLink(
                    destination: DetailView(event: event)
                ) {
                    Text("\(event.timestamp!, formatter: dateFormatter)")
                }
            }.onDelete { indices in
                self.events.delete(at: indices, from: self.viewContext)
            }
        }
    }
}

struct DetailView: View {
    @ObservedObject var event: Event

    var body: some View {
        Text("\(event.timestamp!, formatter: dateFormatter)")
            .navigationBarTitle(Text("Detail"))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        return ContentView().environment(\.managedObjectContext, context)
    }
}
