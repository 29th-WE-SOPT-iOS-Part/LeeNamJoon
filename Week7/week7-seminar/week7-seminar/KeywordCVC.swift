//
//  KeywordCVC.swift
//  week7-seminar
//
//  Created by 이남준 on 2021/11/27.
//

import UIKit

protocol KeywordCellDelegate {
    func keywordCellSelected(cell: KeywordCVC)
    func keywordCellUnseleted(cell: KeywordCVC, unselectedName: String)
}

class KeywordCVC: UICollectionViewCell {

    static let identifier = "KeywordCVC"
    @IBOutlet weak var keywordButton: UIButton!
    var keyword: String = ""
    var selectedKeyword: Bool = false
    var keywordDelegate: KeywordCellDelegate?
    var presentingClosure: (() -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func touchUpToSelect(_ sender: Any) {
        if selectedKeyword {
            keywordDelegate?.keywordCellUnseleted(cell: self,
                                                  unselectedName: keyword)
            keywordButton.backgroundColor = .clear
        } else {
            keywordDelegate?.keywordCellSelected(cell: self)
            keywordButton.backgroundColor = .yellow
            presentingClosure?()
        }
        selectedKeyword.toggle()
    }
    
    func setKeyword(text: String) {
        keyword = text
        keywordButton.setTitle(keyword, for: .normal)
    }
}

