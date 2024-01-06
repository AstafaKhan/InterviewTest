//
//  ProductListVC.swift
//  iOS Exam
//
//  Created by Mohammad Astafa Khan on 05/01/2024.
//

import UIKit

class ProductListVC: UIViewController {

    @IBOutlet weak var ProductListTableView: UITableView!
    @IBOutlet weak var CutsomHeaderView: UIView!
    @IBOutlet weak var PageControl: UIPageControl!
    @IBOutlet weak var CategoryCV: UICollectionView!
    
    private var viewModel = ProductViewModel()

    var walletCurrentPage:Int = 0
    var currentCardIndex = 0{
        didSet{
            self.PageControl?.currentPage = self.currentCardIndex
            DispatchQueue.global(qos: .background).async{
                self.GetCategoryList()
            }
        }
    }
    var CategoryList:[String] = []{
        didSet{
            DispatchQueue.main.async {
                self.PageControl?.numberOfPages = self.CategoryList.count
                self.CategoryCV?.reloadData()
            }
        }
    }
    var ProductList:[Product] = []{
        didSet{
                self.FilterList = self.ProductList
        }
    }
    var FilterList:[Product] = []{
        didSet{
            DispatchQueue.main.async {
                self.ProductListTableView?.reloadData()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuration()
        
    }
}

extension ProductListVC{
    func configuration() {
        self.CategoryList = self.setupData()
        self.RegisterAllCellClass()
        self.GetCategoryList()
        self.observeEvent()
    }
    
    func setupData() -> [String]{
        return ["electronics","jewelery","men's clothing","women's clothing"]
    }
    
    func GetCategoryList() {
        if self.CategoryList.count != 0{
            self.viewModel.fetchProducts(categoryName: self.CategoryList[self.currentCardIndex])
        }
    }
    
    func RegisterAllCellClass() {
        let shrdinstence = DIConfigurator.sharedInst()
        shrdinstence.registerCollectionCellNib(Nib: .CategoryCVC, collectionView: self.CategoryCV)
        self.CategoryCV.collectionViewLayout = CustomCollectionFlowLayout()
        shrdinstence.registerHeaderView(Nib: .SearchBarTVH, tableview: self.ProductListTableView)
        shrdinstence.registerTableCellwithNib(Nib: .ProductTVC, tableview: self.ProductListTableView)
        self.ProductListTableView.tableHeaderView = self.CutsomHeaderView
        if #available(iOS 15.0, *) {
            self.ProductListTableView.sectionHeaderTopPadding = 16
        }
    }
    
    // Data binding event observe karega - communication
    func observeEvent() {
        viewModel.eventHandler = { [weak self] event in
            guard let self else { return }
            switch event {
            case .loading:
                /// Indicator show
                print("Product loading....")
            case .stopLoading:
                // Indicator hide kardo
                print("Stop loading...")
            case .dataLoaded:
                self.ProductList = viewModel.products
                print("Data loaded...")
            case .error(let error):
                print(error?.localizedDescription ?? "")
            
            }
        }
    }
}

