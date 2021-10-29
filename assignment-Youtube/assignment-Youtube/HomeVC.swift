//
//  HomeVC.swift
//  assignment-Youtube
//
//  Created by 이남준 on 2021/10/22.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var homeVideoTableView: UITableView!
    @IBOutlet weak var homeShortsCollectionView: UICollectionView!
    
    var homeVideoList: [HomeVideo] = []
    var homeShortsVideoList: [HomeShortsVideo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initHomeVideoList()
        initHomeShortsVideoList()
        registerXib()
        homeVideoTableView.dataSource = self
        homeVideoTableView.delegate = self
        homeShortsCollectionView.dataSource = self
        homeShortsCollectionView.delegate = self
    }
    
    func initHomeShortsVideoList() {
        homeShortsVideoList.append(contentsOf: [
            HomeShortsVideo(videoOwnerImageName: "ggamju1", videoOwnerName: "iOSPart"),
            HomeShortsVideo(videoOwnerImageName: "ggamju2", videoOwnerName: "AndroidPart"),
            HomeShortsVideo(videoOwnerImageName: "ggamju3", videoOwnerName: "ServerPart"),
            HomeShortsVideo(videoOwnerImageName: "ggamju4", videoOwnerName: "WebPart"),
            HomeShortsVideo(videoOwnerImageName: "ggamju5", videoOwnerName: "DesignPart"),
            HomeShortsVideo(videoOwnerImageName: "ggamju6", videoOwnerName: "PlanPart")
        ])
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
    
    func registerXib() {
        let xibName = UINib(nibName: HomeTableViewCell.identifier, bundle: nil)
        homeVideoTableView.register(xibName, forCellReuseIdentifier: HomeTableViewCell.identifier)
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

extension HomeVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeShortsVideoList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath)
                as? HomeCollectionViewCell else {return UICollectionViewCell()}
        
        cell.setData(iconImage: homeShortsVideoList[indexPath.row].makeVideoOwnerImage(), nameLabel: homeShortsVideoList[indexPath.row].videoOwnerName)
        return cell
    }
}

extension HomeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 72, height: 104)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
