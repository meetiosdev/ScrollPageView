//
//  ThirdController.swift
//  ScrollPageView
//
//  Created by Swarajmeet Singh on 23/02/25.
//

import UIKit

// MARK: - ThirdController
/// ViewController responsible for displaying data
class ThirdController: UIViewController {
    
    private let viewModel: ThirdViewModel
    
    // MARK: - Initializer
    /// Initializes ThirdController with a ViewModel
    /// - Parameter viewModel: The ViewModel instance to be used
    init(viewModel: ThirdViewModel) {
        self.viewModel = viewModel
        super.init(nibName: ThirdController.identifier, bundle: Bundle.main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Additional setup after loading the view
    }
}
