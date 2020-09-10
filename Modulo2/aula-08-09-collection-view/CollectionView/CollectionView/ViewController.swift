//
//  ViewController.swift
//  CollectionView
//
//  Created by Rafael Miguel on 08/09/20.
//  Copyright © 2020 Rafael Miguel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myCollectionView: UICollectionView!
    var carros: [Carro] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let carro1 = Carro(modelo: "Brasilia", ano: "1968", imagem: "brasilia.jpeg")
        let carro2 = Carro(modelo: "Fusca", ano: "1958", imagem: "fusca.jpg")
        let carro3 = Carro(modelo: "Marea", ano: "1998", imagem: "marea.jpg")
        let carro4 = Carro(modelo: "Passat", ano: "1977", imagem: "passat.jpg")
        
        carros.append(carro1)
        carros.append(carro2)
        carros.append(carro3)
        carros.append(carro4)
        
        self.myCollectionView.register(UINib(nibName: "CarrosCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CarroCell")
        
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if carros.count > 0 {
            return carros.count
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: CarrosCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: "CarroCell", for: indexPath) as? CarrosCollectionViewCell
        
        cell?.setupCell(carro: carros[indexPath.item])
        
        return cell ?? UICollectionViewCell()
        
        
    }
    
    
    
}

