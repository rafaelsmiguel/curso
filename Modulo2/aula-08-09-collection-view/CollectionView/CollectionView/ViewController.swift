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
    var motos: [Moto] = []
    
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
        
        
        let moto1 = Moto(modelo: "Kawasaki", ano: "2020", image: "brasilia.jpeg", cilindradas: "200")
        let moto2 = Moto(modelo: "CBR", ano: "2014", image: "fusca.jpg", cilindradas:"200")
        let moto3 = Moto(modelo: "Scooter", ano: "2016", image: "marea.jpg", cilindradas:"200")
        let moto4 = Moto(modelo: "Harley Davidson", ano: "2018", image: "passat.jpg", cilindradas:"200")
        
        motos.append(moto1)
        motos.append(moto2)
        motos.append(moto3)
        motos.append(moto4)
        
        self.myCollectionView.register(UINib(nibName: "CarrosCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CarroCell")
        
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        var reusableview: SectionHeader?
        
        if kind == UICollectionView.elementKindSectionHeader {
            reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as? SectionHeader

            if indexPath.section == 0 {
                reusableview?.backgroundColor = .blue
                reusableview?.sectionHeaderlabel.text = "Carros"

            }else {
                reusableview?.backgroundColor = .green
                reusableview?.sectionHeaderlabel.text = "Motos"

            }
        
        }

        return reusableview!
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return self.carros.count
        case 1:
            return self.motos.count
        default:break
        }
        
        return 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: CarrosCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: "CarrosCollectionViewCell", for: indexPath) as? CarrosCollectionViewCell

        switch indexPath.section {
        case 0:
            cell?.setupCellCarro(carro: self.carros[indexPath.item])
        case 1:
            cell?.setupCellMoto(moto: self.motos[indexPath.item])
        default: break
        }

        
        return cell ?? UICollectionViewCell()
        
        
    }
    
    
    
}

