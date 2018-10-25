import UIKit

class CollectionViewController: UICollectionViewController {

    var data : [ColorSection]!
    
    var colorSelectedDelegate : ((String) -> Void)?
    
}

// UICollectionViewDataSource
extension CollectionViewController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return data.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data[section].colors.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! CollectionViewCell
        
        let color = data[indexPath.section].colors[indexPath.row]
        cell.backgroundColor = color
        cell.label.text = color.toHexString()
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "collectionViewHeader", for: indexPath) as! CollectionHeaderView
        header.label.text = data[indexPath.section].name
        return header
    }
    
}

// UICollectionViewDelegate
extension CollectionViewController {
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        colorSelectedDelegate?(data[indexPath.section].colors[indexPath.row].toHexString())
    }
    
}
