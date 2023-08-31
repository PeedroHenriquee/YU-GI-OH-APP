import UIKit

class DetailViewController : UIViewController{
    
    @IBOutlet weak var cardName: UILabel!
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var cardDescription: UILabel!
    //@IBOutlet weak var cardAtkPoints: UILabel!
    //@IBOutlet weak var cardDefPoints: UILabel!
    @IBOutlet weak var cardPrice: UILabel!
    
    var card: CardData!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardImage.layer.cornerRadius = 15
        cardImage.layer.masksToBounds = true
        cardImage.contentMode = .scaleAspectFill
        cardImage.backgroundColor = .black
        
        configure(with: card)
    }
    
    func configure(with card: CardData) {
        cardName.text = card.name
        cardDescription.text = card.desc
        //cardAtkPoints.text = String(card.atk)
        //cardDefPoints.text = String(card.def)
        cardPrice.text = card.card_prices[0].cardmarket_price + " USD"
        cardImage.imageFromUrl(url: card.card_images[0].returnNormalImageUrl())
    }

}
