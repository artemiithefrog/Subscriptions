//
//  DefaultCurrency.swift
//  Subscriptions
//
//  Created by artemiithefrog . on 26.11.2023.
//

import SwiftUI

struct DefaultCurrency: View {
    
    let items: [Currency] = [
        Currency(name: "🇺🇸 United States ($)", description: "US Dollar", currencyCode: "USD", currencySymbol: "$"),
        Currency(name: "🇦🇪 United Arab Emirates (AED)", description: "United Arab Emirates Dirham", currencyCode: "AED", currencySymbol: "AED"),
        Currency(name: "🇦🇺 Australia ($)", description: "Australian Dollar", currencyCode: "AUD", currencySymbol: "$"),
        Currency(name: "🇧🇬 Bulgaria (BGN)", description: "Bulgarian Lev", currencyCode: "BGN", currencySymbol: "лв"),
        Currency(name: "🇧🇭 Bahrain (.د.ب‎)", description: "Bahraini Dinar", currencyCode: "BHD", currencySymbol: ".د.ب"),
        Currency(name: "🇨🇦 Canada ($)", description: "Canadian Dollar", currencyCode: "CAD", currencySymbol: "$"),
        Currency(name: "🇨🇭 Switzerland (CHF)", description: "Swiss Franc", currencyCode: "CHF", currencySymbol: "CHF"),
        Currency(name: "🇨🇳 China (¥)", description: "Chinese Yuan", currencyCode: "CNY", currencySymbol: "¥"),
        Currency(name: "🇪🇺 Europian Union (€)", description: "Euro", currencyCode: "EUR", currencySymbol: "€"),
        Currency(name: "🇬🇧 United Kingdom (£)", description: "British Pound", currencyCode: "GBP", currencySymbol: "£"),
        Currency(name: "🇯🇵 Japan (¥)", description: "Japanese Yen", currencyCode: "JPY", currencySymbol: "¥"),
        Currency(name: "🇮🇳 India (₹)", description: "Indian Rupee", currencyCode: "INR", currencySymbol: "₹"),
        Currency(name: "🇷🇺 Russia (₽)", description: "Russian Ruble", currencyCode: "RUB", currencySymbol: "₽"),
        Currency(name: "🇧🇷 Brazil (R$)", description: "Brazilian Real", currencyCode: "BRL", currencySymbol: "R$"),
        Currency(name: "🇲🇽 Mexico ($)", description: "Mexican Peso", currencyCode: "MXN", currencySymbol: "$"),
        Currency(name: "🇸🇪 Sweden (SEK)", description: "Swedish Krona", currencyCode: "SEK", currencySymbol: "SEK"),
        Currency(name: "🇸🇬 Singapore ($)", description: "Singapore Dollar", currencyCode: "SGD", currencySymbol: "$"),
        Currency(name: "🇨🇭 Swizerland (CHF)", description: "Swiss Franc", currencyCode: "CHF", currencySymbol: "CHF"),
        Currency(name: "🇨🇿 Czech Republic (CZK)", description: "Czech Koruna", currencyCode: "CZK", currencySymbol: "CZK"),
        Currency(name: "🇳🇴 Norway (NOK)", description: "Norwegian Krone", currencyCode: "NOK", currencySymbol: "NOK"),
        Currency(name: "🇩🇰 Denmark (DKK)", description: "Danish Krone", currencyCode: "DKK", currencySymbol: "DKK"),
        Currency(name: "🇷🇴 Romania (RON)", description: "Romanian Leu", currencyCode: "RON", currencySymbol: "RON"),
        Currency(name: "🇭🇺 Hungary (HUF)", description: "Hungarian Forint", currencyCode: "HUF", currencySymbol: "HUF"),
        Currency(name: "🇵🇱 Poland (PLN)", description: "Polish Złoty", currencyCode: "PLN", currencySymbol: "PLN"),
        Currency(name: "🇨🇱 Chile ($)", description: "Chilean Peso", currencyCode: "CLP", currencySymbol: "$"),
        Currency(name: "🇨🇷 Costa Rica (₡)", description: "Costa Rican Colón", currencyCode: "CRC", currencySymbol: "₡"),
        Currency(name: "🇭🇷 Croatia (HRK)", description: "Croatian Kuna", currencyCode: "HRK", currencySymbol: "HRK"),
        Currency(name: "🇨🇺 Cuba (₱)", description: "Cuban Peso", currencyCode: "CUP", currencySymbol: "₱"),
        Currency(name: "🇬🇪 Georgia (₾)", description: "Georgian Lari", currencyCode: "GEL", currencySymbol: "₾"),
        Currency(name: "🇭🇺 Hungary (HUF)", description: "Hungarian Forint", currencyCode: "HUF", currencySymbol: "HUF"),
        Currency(name: "🇰🇿 Kazakhstan (₸)", description: "Kazakhstani Tenge", currencyCode: "KZT", currencySymbol: "₸"),
        Currency(name: "🇰🇪 Kenya (KSh)", description: "Kenyan Shilling", currencyCode: "KES", currencySymbol: "KSh"),
        Currency(name: "🇲🇾 Malaysia (RM)", description: "Malaysian Ringgit", currencyCode: "MYR", currencySymbol: "RM"),
        Currency(name: "🇲🇦 Morocco (MAD)", description: "Moroccan Dirham", currencyCode: "MAD", currencySymbol: "MAD"),
        Currency(name: "🇳🇬 Nigeria (₦)", description: "Nigerian Naira", currencyCode: "NGN", currencySymbol: "₦"),
        Currency(name: "🇵🇰 Pakistan (₨)", description: "Pakistani Rupee", currencyCode: "PKR", currencySymbol: "₨"),
        Currency(name: "🇵🇷 Puerto Rico ($)", description: "US Dollar", currencyCode: "USD", currencySymbol: "$"),
        Currency(name: "🇶🇦 Qatar (﷼)", description: "Qatari Riyal", currencyCode: "QAR", currencySymbol: "﷼"),
        Currency(name: "🇷🇸 Serbia (RSD)", description: "Serbian Dinar", currencyCode: "RSD", currencySymbol: "RSD"),
        Currency(name: "🇸🇦 Saudi Arabia (﷼)", description: "Saudi Riyal", currencyCode: "SAR", currencySymbol: "﷼"),
        Currency(name: "🇸🇳 Senegal (CFA)", description: "West African CFA Franc", currencyCode: "XOF", currencySymbol: "CFA"),
        Currency(name: "🇿🇦 South Africa (R)", description: "South African Rand", currencyCode: "ZAR", currencySymbol: "R"),
        Currency(name: "🇱🇰 Sri Lanka (Rs)", description: "Sri Lankan Rupee", currencyCode: "LKR", currencySymbol: "Rs"),
        Currency(name: "🇸🇷 Suriname ($)", description: "Surinamese Dollar", currencyCode: "SRD", currencySymbol: "$"),
        Currency(name: "🇸🇿 Eswatini (SZL)", description: "Swazi Lilangeni", currencyCode: "SZL", currencySymbol: "SZL"),
        Currency(name: "🇹🇼 Taiwan (NT$)", description: "New Taiwan Dollar", currencyCode: "TWD", currencySymbol: "NT$"),
        Currency(name: "🇹🇭 Thailand (฿)", description: "Thai Baht", currencyCode: "THB", currencySymbol: "฿"),
        Currency(name: "🇹🇬 Togo (CFA)", description: "West African CFA Franc", currencyCode: "XOF", currencySymbol: "CFA"),
        Currency(name: "🇹🇹 Trinidad and Tobago (TT$)", description: "Trinidad and Tobago Dollar", currencyCode: "TTD", currencySymbol: "TT$"),
        Currency(name: "🇹🇳 Tunisia (TND)", description: "Tunisian Dinar", currencyCode: "TND", currencySymbol: "TND"),
        Currency(name: "🇹🇷 Turkey (₺)", description: "Turkish Lira", currencyCode: "TRY", currencySymbol: "₺"),
        Currency(name: "🇹🇲 Turkmenistan (TMT)", description: "Turkmenistan Manat", currencyCode: "TMT", currencySymbol: "TMT"),
        Currency(name: "🇺🇦 Ukraine (₴)", description: "Ukrainian Hryvnia", currencyCode: "UAH", currencySymbol: "₴"),
        Currency(name: "🇺🇾 Uruguay ($)", description: "Uruguayan Peso", currencyCode: "UYU", currencySymbol: "$"),
        Currency(name: "🇻🇪 Venezuela (VES)", description: "Venezuelan Bolívar", currencyCode: "VES", currencySymbol: "VES"),
        Currency(name: "🇻🇳 Vietnam (₫)", description: "Vietnamese Đồng", currencyCode: "VND", currencySymbol: "₫"),
        Currency(name: "🇿🇲 Zambia (ZMW)", description: "Zambian Kwacha", currencyCode: "ZMW", currencySymbol: "ZMW"),
        Currency(name: "🇿🇼 Zimbabwe (Z$)", description: "Zimbabwean Dollar", currencyCode: "ZWL", currencySymbol: "Z$"),
        // Add more currencies as needed
    ]
    @State private var selectedItem = "🇺🇸 United States ($)"
    
    @EnvironmentObject var settingsVM: SettingsViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(items, id: \.self) { item in
                    HStack {
                        if item.name == selectedItem {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                    Text(item.description)
                                        .font(.system(size: 15))
                                        .fontWeight(.light)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                Text(item.currencyCode)
                                Image(systemName: "checkmark")
                            }
                        } else {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                    Text(item.description)
                                        .font(.system(size: 15))
                                        .fontWeight(.light)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                Text(item.currencyCode)
                            }
                        }
                    }
                    .onTapGesture {
                        selectedItem = item.name
                        settingsVM.selectedCurrencySymbol = item.currencySymbol
                        settingsVM.selectedCurrency = selectedItem
                        UserDefaults.standard.setValue(item.currencySymbol, forKey: "SELECTED_CURRENCYSYMBOL")
                        UserDefaults.standard.setValue(selectedItem, forKey: "SELECTED_CURRENCY")
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                    }
                    .tint(Color("ButtonTextGreen"))
                }
                ToolbarItem(placement: .principal) {
                    Text("Currency")
                        .bold()
                        .font(.system(size: 20))
                }
            }
            .onAppear {
                selectedItem = settingsVM.selectedCurrency
            }
        }
    }
}

#Preview {
    DefaultCurrency()
}
