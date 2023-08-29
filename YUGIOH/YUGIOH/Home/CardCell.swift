import UIKit

class CardCell: UITableViewCell{
    private let horizontalStack : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 16
        return  stack
    }()
    
    
    private let cartaImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 18
        imageView.backgroundColor = .black
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let verticalStack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        return  stack
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font  = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        return  label
    }()
    
    private let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.font  = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.numberOfLines = 0
        return  label
    }()
    
    private let timemusica: UILabel = {
        let label = UILabel()
        label.font  = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.numberOfLines = 0
        return  label
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
    
    public func setup(carta: Carta){
        titleLabel.text = carta.title
        releaseDateLabel.text = " \(carta.releaseDate)"
        timemusica.text = "\(carta.timeMusica)"
        
    
   }
    
    private func addViewsinHierarchy(){
        contentView.addSubview(horizontalStack)
        horizontalStack.addArrangedSubview(cartaImageView)
        horizontalStack.addArrangedSubview(verticalStack)
        verticalStack.addArrangedSubview(titleLabel)
        verticalStack.addArrangedSubview(releaseDateLabel)
        verticalStack.addArrangedSubview(timemusica)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            horizontalStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            horizontalStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            horizontalStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            horizontalStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        
        ])
        
        NSLayoutConstraint.activate([
            cartaImageView.widthAnchor.constraint(equalToConstant: 50),
            cartaImageView.heightAnchor.constraint(equalToConstant: 50),
            
        ])
    }
    
    
}
