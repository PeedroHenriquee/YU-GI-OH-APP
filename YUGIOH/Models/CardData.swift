import Foundation

struct CardData: Decodable {
    let id: Int
    let name: String
    let type: String
    let frameType: String
    let desc: String
    //let atk: Int
    //let def: Int
    let race: String
    let name_en: String
    let archetype: String
    let card_sets: [CardSet]
    let card_images: [CardImage]
    let card_prices: [CardPrice]
}
