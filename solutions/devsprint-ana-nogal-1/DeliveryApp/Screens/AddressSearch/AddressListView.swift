//
//  AddressSearchView.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 04/02/22.
//

import UIKit

protocol AddressListViewProtocol {
    func updateAddress(with list: [Address])
}

class AddressListView: UIView, AddressListViewProtocol {
    
    var delegate: AddressSearchViewControllerProtocol?
    private var adresses: [Address]
    
    private lazy var tableView: UITableView = {
       let tableView  = UITableView()
        tableView.register(AddressCell.self, forCellReuseIdentifier: AddressCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    //MARK: - Init
    init(){
        adresses = []
        super.init(frame: .zero)
        
        configViews()
        buildViews()
        setupConstraints()
        tableView.delegate = self
        tableView.dataSource = self
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateAddress(with list: [Address]) {
        print("LISTA que recebi: \(list)")
        adresses = list
        tableView.reloadData()
    }
    
    //MARK: - SetupView
    func configViews(){

    }
    
    func buildViews() {
        [tableView].forEach(addSubview)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension AddressListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return adresses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let address = adresses[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: AddressCell.identifier, for: indexPath) as! AddressCell
        cell.address = address
        return cell
    }
}

extension AddressListView: UITableViewDelegate {
    
}
