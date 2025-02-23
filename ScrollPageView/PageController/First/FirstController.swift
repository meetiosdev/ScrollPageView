//
//  FirstController.swift
//  ScrollPageView
//
//  Created by Swarajmeet Singh on 23/02/25.
//

import UIKit

// MARK: - FirstController
/// ViewController responsible for displaying data
class FirstController: UIViewController {
    
    private let viewModel: FirstViewModel
    
    // MARK: - Initializer
    /// Initializes FirstController with a ViewModel
    /// - Parameter viewModel: The ViewModel instance to be used
    init(viewModel: FirstViewModel) {
        self.viewModel = viewModel
        super.init(nibName: FirstController.identifier, bundle: Bundle.main)
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
