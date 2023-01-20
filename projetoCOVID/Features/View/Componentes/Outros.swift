//
//  Outros.swift
//  projetoCOVID
//
//  Created by Roberto Edgar Geiss on 18/01/23.
//

import SwiftUI
import MapKit

struct OKStatCard: View {
    let title: String
    let subTitle: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 6) {
            OKTitleLabel(title: title, fontSize: 28, fontWeight: .bold)
            OKTitleLabel(title: subTitle, fontSize: 13, fontWeight: .medium)
                .lineLimit(2)
                .multilineTextAlignment(.center)
        }
        .frame(width: 160, height: 80)
        .background(Color(.systemGray3))
        .cornerRadius(8)
        .shadow(color: Color(.darkGray), radius: 3, x: 2, y: 2)
    }
}

struct InsetMapView: View {
    var countryData: PaisModel
    
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 42.8333, longitude: 12.8333), span: MKCoordinateSpan(latitudeDelta: 10.0, longitudeDelta: 10.0))
    
    var body: some View {
        Map(coordinateRegion: $region)
            .overlay(
                ZStack() {
                    HStack {
                        Image(countryData.country.lowercased().replaceSpace(with: "-"))
                            .resizable()
                            .scaledToFit()
                            .frame(width: 55, height: 55)
                            .clipShape(Circle())
                            .shadow(color: Color(.black), radius: 2, x: 2, y: 2)
                    }
                    .padding(.vertical, 3)
                    .padding(.horizontal, 3)
                    .background(
                        Color.black
                            .opacity(0.6)
                            .cornerRadius(8)
                    )
                }
                .padding(12), alignment: .topTrailing
            )
            .frame(height: 256)
            .cornerRadius(12)
    }
}


struct DailyStatsList: View {
    @Binding var dailyData: [DiarioModel]
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "list.bullet.indent")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Daily Stats")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
            }
            .padding(.top, 15)
            .padding(.vertical, 2)
            Section(header:
                        OKListRow(textOne: "Date", textTwo: "Cases", textThree: "Deaths", fontSize: 22, fontWeight: .bold, frameWidth: 130)
            ) {
                List {
                    ForEach(dailyData, id: \.uuid) { item in
                        OKListRow(textOne: "\(item.dDate.convertToMonthYearFormat())", textTwo: "\(item.dCases.numberFormat())", textThree: "\(item.dDeaths.numberFormat())", fontSize: 18, fontWeight: .medium, frameWidth: 130)
                            .foregroundColor(Color(.secondaryLabel))
                    }
                    .listRowInsets(EdgeInsets())
                }
                .frame(height: 600, alignment: .top)
            }
            .padding(.horizontal)
            
        }
    }
}

struct OKListRow: View {
    var textOne: String
    var textTwo: String
    var textThree: String
    
    var fontSize: CGFloat
    var fontWeight: Font.Weight
    var frameWidth: CGFloat
    
    var body: some View {
        HStack {
            OKTitleLabel(title: textOne, fontSize: fontSize, fontWeight: fontWeight)
                .frame(width: frameWidth, alignment: .leading)
            Spacer()
            OKTitleLabel(title: textTwo, fontSize: fontSize, fontWeight: fontWeight)
                .frame(width: (frameWidth-40), alignment: .trailing)
            OKTitleLabel(title: textThree, fontSize: fontSize, fontWeight: fontWeight)
                .frame(width: (frameWidth-40), alignment: .trailing)
        }
        .frame(height: (fontSize+1), alignment: .center)
    }
}

struct OKSearchBar: View {
    @Binding var searchText: String
    @Binding var isSearching: Bool
    
    var body: some View {
        HStack {
            HStack {
                TextField("Search countries...", text: $searchText)
                    .padding(.leading, 40)
            }
            .padding(.vertical, 7)
            .background(Color(.systemGray5))
            .cornerRadius(6)
            .padding(.horizontal)
            .onTapGesture(perform: {
                isSearching = true
            })
            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                    Spacer()
                    if isSearching {
                        Button(action: { searchText = "" }, label: {
                            Image(systemName: "xmark.circle.fill")
                        })
                    }
                }
                .padding(.horizontal, 32)
                .foregroundColor(.gray)
            )
            
            if isSearching {
                Button(action: {
                    isSearching = false
                    searchText  = ""
                    
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }, label: {
                    Text("Cancel")
                        .padding(.trailing)
                        .padding(.leading, -10)
                        .accentColor(Color(.systemGray))
                })
                .transition(.move(edge: .trailing))
                .animation(.easeIn)
            }
        }
    }
}

struct AboutCountryVC: View {
    @State var country: String
    @State var countryModel: PaisModel
    @State var diario: [DiarioModel]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    CountryInfoForm(countryData: countryModel)
                    
                    Divider()
                        .frame(height: 4)
                        .background(Color(.systemGray2))
                    
                    //InsetMapView()
                    
                    Divider()
                        .frame(height: 4)
                        .background(Color(.systemGray2))
                    
                    DailyStatsList(dailyData: $diario)
                }
            }
            .padding(0)
            .navigationBarTitle("About " + country, displayMode: .inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct DailyStatsVC: View
{
    @State var country: String
    //@State var countryModel: PaisModel
    //@State var diario: [DiarioModel]
    var body: some View {
        Text(" ")
    }
}

