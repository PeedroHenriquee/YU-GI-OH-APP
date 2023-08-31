import Foundation

class ApiRequests {
    
    public func fetchYuGiOhCards() async throws -> [CardData] {
        
        let url = URL(string: "https://db.ygoprodeck.com/api/v7/cardinfo.php?language=pt&archetype=Blue-Eyes")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        let (data, _) = try await session.data(for: request)
        
        let decoder = JSONDecoder()
        return try decoder.decode(CardsResponse.self, from: data).data
    }
}
