//
//  HomeVC.swift
//  assignment-Youtube
//
//  Created by 이남준 on 2021/10/22.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var homeVideoTableView: UITableView!
    
    var homeVideoList: [HomeVideo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initHomeVideoList()
        homeVideoTableView.dataSource = self
        homeVideoTableView.delegate = self
    }
    
    func initHomeVideoList() {
        homeVideoList.append(contentsOf: [
            HomeVideo(videoThumbnailName: "wesoptiOSPart", videoOwnerImageName: "wesoptProfile", videoName: "1차 iOS 세미나 : iOS 컴포넌트 이해, Xcode 기본 사용법, View 화면전환", videoDescription: "WE SOPT ・조회수 100만회 ・ 3주 전"),
            HomeVideo(videoThumbnailName: "wesoptiOSPart", videoOwnerImageName: "wesoptProfile", videoName: "2차 iOS 세미나 : AutoLayout, StackView, TabBarController", videoDescription: "WE SOPT ・조회수 100만회 ・ 3주 전"),
            HomeVideo(videoThumbnailName: "wesoptiOSPart", videoOwnerImageName: "wesoptProfile", videoName: "3차 iOS 세미나 : ScrollView, Delegate Pattern, TableView, CollectionView", videoDescription: "WE SOPT ・조회수 100만회 ・ 3주 전"),
            HomeVideo(videoThumbnailName: "wesoptiOSPart", videoOwnerImageName: "wesoptProfile", videoName: "4차 iOS 세미나 : Cocoapods & Networking, REST API", videoDescription: "WE SOPT ・조회수 100만회 ・ 3주 전"),
            HomeVideo(videoThumbnailName: "wesoptiOSPart", videoOwnerImageName: "wesoptProfile", videoName: "7차 iOS 세미나 : Animation과 제스쳐, 데이터 전달 심화", videoDescription: "WE SOPT ・조회수 100만회 ・ 3주 전")
        ])
    }

}

extension HomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 306
    }
}

extension HomeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeVideoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier) as?
                HomeTableViewCell else {return UITableViewCell()}
        
        cell.setData(appData: homeVideoList[indexPath.row])
        return cell
    }
    
    
}
