import UIKit

class MoviewViewController: UIViewController {
    
    private let cartas : [Carta] = [
        .init(title: "Mago Negro", releaseDate: "MAGE", imageURL: "", timeMusica: ""),
        .init(title: "Exodia", releaseDate: "BOSS", imageURL: "", timeMusica: ""),
        .init(title: "Cyber Dragon", releaseDate: "DRAGON", imageURL: "", timeMusica: ""),
        .init(title: "Divine Serpent", releaseDate: "SERPENT", imageURL: "", timeMusica: ""),
        .init(title: "Kuriboh", releaseDate: "PUF", imageURL: "", timeMusica: ""),
        .init(title: "Jovem Touro", releaseDate: "WARRIOR", imageURL: "", timeMusica: ""),
        .init(title: "Demonio Selvagem", releaseDate: "WARRIOR", imageURL: "", timeMusica: "")
    ]
    
    // 1
    //Edicao do label title
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 26, weight: .black)
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "BOOK OF GOOD"
        
        return label
    }()
    
    
    //edicao das tabelas
    private let tableView : UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
        return table
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView(){
        view.backgroundColor = .white
        addViewsInHierarchy()
        setupConstraints()
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    //incluir tabelas e titulo na tela
    private func addViewsInHierarchy(){
        view.addSubview(titleLabel)
        view.addSubview(tableView)
    }
    
    //ajusta a view e tamanho na tela usando o NSLayout
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            //parte topo da tela
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            //Parte de baixo da tela
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            //parte esquerda da tela
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            //parte direita da tela
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
        ])
    }
    
    }
extension MoviewViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection  section: Int) -> Int {
        cartas.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CardCell()
        let carta = cartas[indexPath.row]
        cell.setup(carta: carta)
        return cell
    }
}
    

extension MoviewViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let storyboard = UIStoryboard(name: "Detail", bundle: Bundle(for:  DetailsViewController.self))
        let detailViewController = storyboard.instantiateViewController(withIdentifier: "Detail")
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
