import Foundation

struct CardPrice: Decodable {
    let cardmarket_price: String
    let tcgplayer_price: String
    let ebay_price: String
    let amazon_price: String
    let coolstuffinc_price: String
}
