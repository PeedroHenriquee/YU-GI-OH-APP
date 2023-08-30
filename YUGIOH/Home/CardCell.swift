import UIKit

class CardCell: UITableViewCell{
    
    private let horizontalStack : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 16
        stack.backgroundColor = .secondarySystemBackground
        stack.layer.cornerRadius = 20
        return  stack
    }()
    
    
    private let cardImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 15
        imageView.backgroundColor = .black
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let verticalStack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 2
        return stack
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .label
        label.numberOfLines = 0
        return  label
    }()
    
    private let setRarityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        return label
    }()
    
    private let typeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier:
        String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
 
        addViewsinHierarchy()
        
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder){
        nil
    }
    
    private func setupView(){
        selectionStyle = .none
    }
    
    public func setup(card: CardData){
        titleLabel.text = card.name
        setRarityLabel.text = card.card_sets.first?.set_rarity
        typeLabel.text = " \(card.type)"
        cardImageView.imageFromUrl(url: card.card_images[0].returnNormalImageUrl())
   }
    
    private func addViewsinHierarchy(){
        contentView.addSubview(horizontalStack)
        horizontalStack.addArrangedSubview(cardImageView)
        horizontalStack.addArrangedSubview(verticalStack)
        verticalStack.addArrangedSubview(titleLabel)
        verticalStack.addArrangedSubview(setRarityLabel)
        verticalStack.addArrangedSubview(typeLabel)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            horizontalStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            horizontalStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            horizontalStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            horizontalStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        
        ])
        
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 100),
            cardImageView.heightAnchor.constraint(equalToConstant: 160),
            
        ])
    }
    
    
}
