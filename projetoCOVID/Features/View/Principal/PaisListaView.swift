//
//  PaisListaView.swift
//  projetoCOVID
//
//  Created by Roberto Edgar Geiss on 15/01/23.
//

import SwiftUI

struct PaisListaView: View
{
    @StateObject var viewModel = ListaPaisesViewModel()
    
    @State var searchText = ""
    @State var isSearching = false
    
    var body: some View 
    {
        NavigationView 
        {
            VStack() 
            {
                OKSearchBar(searchText: $searchText, isSearching: $isSearching)
                    .padding(.vertical, 5)
                Divider()
                    .frame(height: 4)
                    .background(Color(.systemGray2))
                    .padding(.bottom, 5)
                Section(header:
                            HStack 
                            {
                                OKTitleLabel(title: "Country",
                                        fontSize: 22,
                                        fontWeight: .bold)
                                    .frame(width: 130, alignment: .leading)
                                    .onTapGesture {
                                        viewModel.sortedBy = "name"
                                        viewModel.getCountryListData()
                                    }
                                Spacer()
                                OKTitleLabel(title: "Cases",
                                        fontSize: 22,
                                        fontWeight: .bold)
                                    .frame(width: 90, alignment: .trailing)
                                    .onTapGesture {
                                        viewModel.sortedBy = "cases"
                                        viewModel.getCountryListData()
                                    }
                                OKTitleLabel(title: "Deaths",
                                        fontSize: 22,
                                        fontWeight: .bold)
                                    .frame(width: 90, alignment: .trailing)
                                    .onTapGesture {
                                        viewModel.sortedBy = "deaths"
                                        viewModel.getCountryListData()
                                    }
                            }
                ) 
                {
                    List 
                    {
                        ForEach(searchText.isEmpty ? viewModel.countriesData : viewModel.countriesData.filter 
                        {
                            $0.country.lowercased().contains(searchText.lowercased())
                        }, id: \.country) { country in
                            OKListRow(textOne: country.country,
                                      textTwo: "\(country.cases.numberFormat())",
                                      textThree: "\(country.deaths.numberFormat())",
                                      fontSize: 18,
                                      fontWeight: .medium,
                                      frameWidth: 140)
                                .foregroundColor(Color(.secondaryLabel))
                                .onTapGesture { viewModel.selectedCountry = country }
                        }
                        //.listRowInsets(EdgeInsets())
                    }
                }
                //.padding(.horizontal)
                .onAppear(perform: {
                    UITableView.appearance().showsVerticalScrollIndicator = false
                    viewModel.getCountryListData()
                })
            }
            .navigationBarTitle("Country List", displayMode: .inline)
            .sheet(isPresented: $viewModel.isShowingDetailView) {
                CountryDetailView(countryData: viewModel.selectedCountry ?? MockData.sampleCountryData, isShowingDetail: $viewModel.isShowingDetailView)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .blur(radius: viewModel.isShowingDetailView ? 5 : 0)
    }
}

