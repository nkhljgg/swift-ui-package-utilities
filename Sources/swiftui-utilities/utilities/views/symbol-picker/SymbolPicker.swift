//
//  SymbolPicker.swift
//  Task List
//
//  Created by Nikhil on 26/03/23.
//

import SwiftUI

@available(iOS 15.0, *)
public struct SymbolPicker: View {
    
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Tasks.timestamp, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Tasks>
    
//    @Binding var event: Event
    
    @Environment(\.dismiss) private var dismiss
    @State var selectedColor: Color = ColorOptions.default
    @State var symbolNames = EventSymbols.symbolNames
    @State var searchInput = ""
    @State var symbol: String = EventSymbols.randomName()
    var columns = Array(repeating: GridItem(.flexible()), count: 6)
    
    public init(selectedColor: Color = ColorOptions.default, symbolNames: [String] = EventSymbols.symbolNames, searchInput: String = "", symbol: String = EventSymbols.randomName(), columns: [GridItem] = Array(repeating: GridItem(.flexible()), count: 6)) {
        
        self.selectedColor = selectedColor
        self.symbolNames = symbolNames
        self.searchInput = searchInput
        self.symbol = symbol
        self.columns = columns
    }
    
    public var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    dismiss()
                } label: {
                    Text("Done")
                }
                .padding()
            }
            HStack {
                Image(systemName: symbol)
                    .font(.title)
                    .imageScale(.large)
                    .foregroundColor(selectedColor)

            }
            .padding()

            HStack {
                ForEach(ColorOptions.all, id: \.self) { color in
                    Button {
                        selectedColor = color
//                        event.color = color
                    } label: {
                        Circle()
                            .foregroundColor(color)
                    }
                }
            }
            .padding(.horizontal)
            .frame(height: 40)

            Divider()

            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(symbolNames, id: \.self) { symbolItem in
                        Button {
//                            event.symbol = symbolItem
                        } label: {
                            Image(systemName: symbolItem)
                                .sfSymbolStyling()
                                .foregroundColor(selectedColor)
                                .padding(5)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .drawingGroup()
            }
        }
        .onAppear {
//            selectedColor = event.color
        }
    }
}
