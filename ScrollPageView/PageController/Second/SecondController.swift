//
//  SecondController.swift
//  ScrollPageView
//
//  Created by Swarajmeet Singh on 23/02/25.
//

import UIKit

// MARK: - SecondController
/// ViewController responsible for displaying data
class SecondController: UIViewController {
    
    private let viewModel: SecondViewModel
    
    // MARK: - Initializer
    /// Initializes SecondController with a ViewModel
    /// - Parameter viewModel: The ViewModel instance to be used
    init(viewModel: SecondViewModel) {
        self.viewModel = viewModel
        super.init(nibName: SecondController.identifier, bundle: Bundle.main)
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
