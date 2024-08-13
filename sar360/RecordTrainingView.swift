//
//  RecordTrainingView.swift
//  sar360
//
//  Created by Annika Whitwam on 2024-06-26.
//

import SwiftUI

struct RecordTrainingView: View {
    var fruits = ["apple", "banana", "orange", "kiwi"]
    @State private  var selectedFruit: String = "banana"
    @State private var selectedDate = Date()
    @State private var team: String = ""
    @State private var name: String = ""
    @State private var type: String = ""
    @State private var date: String = ""
    @State private var location: String = ""
    @State private var participants: String = ""
    
    @State private var currentItems: [String] = ["Item 1", "Item 2", "Item 3"] // Initial items
    @State private var newItem: String = "" // New item text
    
    var body: some View {
            ScrollView{
                VStack {
                    Text("Record Training")
                    .font(.largeTitle)
                    .foregroundColor(Color("CustomGreen"))
                    .multilineTextAlignment(.leading)
                    .bold()
                    .padding(.top, 25)
                    .padding(.trailing, 90)
                    
                    VStack{
                        HStack{
                            Text("Team:")
                            .foregroundColor(Color.black)
                            .padding(.top, 10)
                            .padding(.leading, 25)
                            
                            Spacer()
                            
                            Menu(content: {
                                Picker("fruits", selection: $selectedFruit) {
                                    ForEach(fruits, id: \.self) { fruit in
                                        Text(fruit)
                                    }
                                }
                            }, label: {
                                (Text("\(selectedFruit) ") + Text(Image(systemName: "chevron.down")))
                            })
                            .padding(.all, 15)
                            .frame(width: 230)
                            .foregroundStyle(Color.black)
                            .background(RoundedRectangle(cornerRadius: 16).fill(Color("CustomBackground")))
                        }
                        .padding(.top, 20)
                        .padding(.trailing, 20)
                        
                        HStack{
                            Text("Name:")
                            .foregroundColor(Color.black)
                            .padding(.top, 10)
                            .padding(.leading, 25)
                            
                            Spacer()
                            
                            TextField("Name", text: $name)
                                .padding()
                                .foregroundColor(Color.black)
                                .background(RoundedRectangle(cornerRadius: 16).fill(Color("CustomBackground")))
                                .frame(width: 230)
                        }
                        .padding(.trailing, 20)
                        
                        HStack{
                            Text("Type:")
                            .foregroundColor(Color.black)
                            .multilineTextAlignment(.leading)
                            .padding(.top, 10)
                            .padding(.leading, 25)
                            
                            Spacer()
                            
                            Menu(content: {
                                Picker("fruits", selection: $selectedFruit) {
                                    ForEach(fruits, id: \.self) { fruit in
                                        Text(fruit)
                                    }
                                }
                            }, label: {
                                (Text("\(selectedFruit) ") + Text(Image(systemName: "chevron.down")))
                            })
                            .padding(.all, 15)
                            .frame(width: 230)
                            .foregroundStyle(Color.black)
                            .background(RoundedRectangle(cornerRadius: 16).fill(Color("CustomBackground")))
                            
                        }
                        .padding(.trailing, 20)
                        
                        HStack{
                            Text("Date:")
                                .foregroundColor(Color.black)
                                .multilineTextAlignment(.leading)
                                .padding(.top, 10)
                                .padding(.leading, 25)
                            
                            Spacer()
                        }
                        
                        
                        VStack {
                            DatePicker("Date", selection: $selectedDate, displayedComponents: .date)
                                .datePickerStyle(GraphicalDatePickerStyle()) // Use graphical style for calendar view
                                .padding()
                            
                            Text("Selected Date: \(selectedDate, formatter: dateFormatter)")
                                .padding()
                            
                            Spacer()
                        }
                        .background(Color("CustomBackground"))
                        .cornerRadius(30)
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 15, trailing: 20))
                        
                        HStack{
                            Text("Location:")
                            .foregroundColor(Color.black)
                            .multilineTextAlignment(.leading)
                            .padding(.top, 10)
                            .padding(.leading, 25)
                            
                            Spacer()
                            
                            Menu(content: {
                                Picker("fruits", selection: $selectedFruit) {
                                    ForEach(fruits, id: \.self) { fruit in
                                        Text(fruit)
                                    }
                                }
                            }, label: {
                                (Text("\(selectedFruit) ") + Text(Image(systemName: "chevron.down")))
                            })
                            .padding(.all, 15)
                            .frame(width: 230)
                            .foregroundStyle(Color.black)
                            .background(RoundedRectangle(cornerRadius: 16).fill(Color("CustomBackground")))
                        }
                        .padding(.trailing, 20)
                        
                        HStack{
                            Text("Participants:")
                                .foregroundColor(Color.black)
                                .multilineTextAlignment(.leading)
                                .padding(.leading, 25)
                            Spacer()
                            
                            Button(action: {
                                addItem()
                            }){
                                Text("Add")
                            }
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                            .background(Color("CustomGreen"))
                            .cornerRadius(15)
                            .shadow(radius: 5)
                            .padding(.top, 10)
                            .padding(.bottom, 10)
                            .padding(.trailing, 20)
                        }
                        
                        List(currentItems, id: \.self) { item in
                            Text(item)
                        }
                        .padding(.top, 25)
                        .padding(.bottom, 25)
                        .padding(.leading, 25)
                        .background(Color.white)
                        
                        
                    }
                    .background(Color("CustomBrown"))
                    .cornerRadius(30)
                    .padding(EdgeInsets(top: 15, leading: 20, bottom: 15, trailing: 20))
                    
                    NavigationLink(destination: WelcomeJoinTeamView()){
                        Text("Save")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 15, leading: 70, bottom: 15, trailing: 70))
                            .background(Color("CustomGreen"))
                            .cornerRadius(15)
                            .shadow(radius: 5)
                            .padding(.bottom, 10)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            }
            .background(Color("CustomBackground"))
        }
    
    var dateFormatter: DateFormatter {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter
    }
    
    private func addItem() {
        if !newItem.isEmpty {
            currentItems.append(newItem)
            newItem = "" // Clear the text field after adding
        }
    }
}



struct RecordTrainingView_Previews: PreviewProvider {
    static var previews: some View {
        RecordTrainingView()
    }
}
