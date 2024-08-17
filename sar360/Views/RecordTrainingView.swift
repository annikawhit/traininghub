//
//  RecordTrainingView.swift
//  sar360
//
//  Created by Annika Whitwam on 2024-06-26.
//

import SwiftUI

struct RecordTrainingView: View {
    @StateObject var viewModel = RecordTrainingViewModel()
    
    var body: some View {
        
        VStack{
            Text("Record Training Session")
                .font(.system(size: 30))
                .bold()
                
            
            Form{
                //TEAM
                HStack{
                    Text("Team:")
                        .foregroundColor(Color.black)
                        .padding(.top, 10)
                        .padding(.leading, 25)
                    
                    Spacer()
                    
                    Menu(content: {
                        Picker("teams", selection: $viewModel.team) {
                            ForEach(viewModel.teams, id: \.self) { team in
                                Text(team)
                            }
                        }
                    }, label: {
                        (Text("\(viewModel.team) ") + Text(Image(systemName: "chevron.down")))
                    })
                    .padding(.all, 15)
                    .frame(width: 230)
                    .foregroundStyle(Color.black)
                    .background(RoundedRectangle(cornerRadius: 16).fill(Color("CustomBackground")))
                }
                .padding(.top, 20)
                .padding(.trailing, 20)
                
                
                //NAME
                HStack{
                    Text("Name:")
                        .foregroundColor(Color.black)
                        .padding(.top, 10)
                        .padding(.leading, 25)
                    
                    Spacer()
                    
                    TextField("Name", text: $viewModel.name)
                        .padding()
                        .foregroundColor(Color.black)
                        .background(RoundedRectangle(cornerRadius: 16).fill(Color("CustomBackground")))
                        .frame(width: 230)
                }
                .padding(.trailing, 20)
                
                
                //TYPE
                HStack{
                    Text("Type:")
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.leading)
                        .padding(.top, 10)
                        .padding(.leading, 25)
                    
                    Spacer()
                    
                    Menu(content: {
                        Picker("types", selection: $viewModel.type) {
                            ForEach(viewModel.types, id: \.self) { type in
                                Text(type)
                            }
                        }
                    }, label: {
                        (Text("\(viewModel.type) ") + Text(Image(systemName: "chevron.down")))
                    })
                    .padding(.all, 15)
                    .frame(width: 230)
                    .foregroundStyle(Color.black)
                    .background(RoundedRectangle(cornerRadius: 16).fill(Color("CustomBackground")))
                    
                }
                .padding(.trailing, 20)
                
                
                //DATE
                HStack{
                    Text("Date:")
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.leading)
                        .padding(.top, 10)
                        .padding(.leading, 25)
                    
                    Spacer()
                }
                
                
                VStack {
                    DatePicker("Date", selection: $viewModel.date, displayedComponents: .date)
                        .datePickerStyle(GraphicalDatePickerStyle()) // Use graphical style for calendar view
                        .padding()
                    
                    Spacer()
                }
                .background(Color("CustomBackground"))
                .cornerRadius(30)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 15, trailing: 20))
                
                
                //LOCATION
                HStack{
                    Text("Location:")
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.leading)
                        .padding(.top, 10)
                        .padding(.leading, 25)
                    
                    Spacer()
                    
                    Menu(content: {
                        Picker("locations", selection: $viewModel.location) {
                            ForEach(viewModel.locations, id: \.self) { location in
                                Text(location)
                            }
                        }
                    }, label: {
                        (Text("\(viewModel.location) ") + Text(Image(systemName: "chevron.down")))
                    })
                    .padding(.all, 15)
                    .frame(width: 230)
                    .foregroundStyle(Color.black)
                    .background(RoundedRectangle(cornerRadius: 16).fill(Color("CustomBackground")))
                }
                .padding(.trailing, 20)
                
                
                //PARTIIPANTS
                HStack{
                    Text("Participants:")
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 25)
                    Spacer()
                    
                    Button(action: {
                        //action
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
                
                List(viewModel.participants, id: \.self) { participant in
                    Text(participant)
                }
                
                Button("Save"){
                    viewModel.save()
                }
                .background(Color("CustomGreen"))
            }
        }
        .background(Color("CustomBrown"))
    }
        
            /*ScrollView{
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
                        
                        List(items, id: \.self) { item in
                                Text(item)
                        }
                        
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
        }*/
}



struct RecordTrainingView_Previews: PreviewProvider {
    static var previews: some View {
        RecordTrainingView()
    }
}
