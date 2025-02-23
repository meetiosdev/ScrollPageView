//
//  PagesHomeController.swift
//  ScrollPageView
//
//  Created by Swarajmeet Singh on 21/02/25.
//

import UIKit

/// A view controller that manages a paged UI using `UIPageViewController`.
class PagesHomeController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var pageContainer: UIView!
    @IBOutlet private weak var pageSwitchSegment: UISegmentedControl!
    
    // MARK: - Private Properties
    
    private var pageViewController: UIPageViewController?
    private lazy var pages: [UIViewController] = createPageControllers()
    private var currentPageIndex = 0
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePageViewController()
    }
    
    // MARK: - Setup Methods
    
    /// Initializes and configures the `UIPageViewController` for managing page navigation.
    private func configurePageViewController() {
        let pageVC = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController = pageVC
        
        pageVC.dataSource = self
        pageVC.delegate = self
        
        if let firstPage = pages.first {
            pageVC.setViewControllers([firstPage], direction: .forward, animated: false, completion: nil)
        }
        
        addChild(pageVC)
        pageContainer.addSubview(pageVC.view)
        pageVC.didMove(toParent: self)
        setupPageViewConstraints(pageVC)
    }
    
    /// Creates and returns an array of view controllers for the `UIPageViewController`.
    private func createPageControllers() -> [UIViewController] {
        return [FirstController(viewModel: FirstViewModel()),
                SecondController(viewModel: SecondViewModel()),
                ThirdController(viewModel: ThirdViewModel())]
    }
    
    /// Sets up Auto Layout constraints for the `UIPageViewController`.
    private func setupPageViewConstraints(_ pageVC: UIPageViewController) {
        pageVC.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageVC.view.topAnchor.constraint(equalTo: pageContainer.topAnchor),
            pageVC.view.bottomAnchor.constraint(equalTo: pageContainer.bottomAnchor),
            pageVC.view.leadingAnchor.constraint(equalTo: pageContainer.leadingAnchor),
            pageVC.view.trailingAnchor.constraint(equalTo: pageContainer.trailingAnchor)
        ])
    }
    
    // MARK: - Actions
    
    /// Handles segment switch action to navigate between pages.
    @IBAction private func switchPageAction(_ segment: UISegmentedControl) {
        switchToPage(at: segment.selectedSegmentIndex)
    }
    
    /// Navigates the `UIPageViewController` to the specified page index.
    /// - Parameter index: The index of the target page.
    private func switchToPage(at index: Int) {
        guard index != currentPageIndex, index >= 0, index < pages.count else { return }
        let direction: UIPageViewController.NavigationDirection = index > currentPageIndex ? .forward : .reverse
        
        pageViewController?.setViewControllers([pages[index]], direction: direction, animated: true, completion: nil)
        currentPageIndex = index
    }
}

// MARK: - UIPageViewController DataSource & Delegate

extension PagesHomeController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController), currentIndex > 0 else { return nil }
        return pages[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController), currentIndex < pages.count - 1 else { return nil }
        return pages[currentIndex + 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard completed,
              let currentVC = pageViewController.viewControllers?.first,
              let currentIndex = pages.firstIndex(of: currentVC) else { return }
        
        currentPageIndex = currentIndex
        pageSwitchSegment.selectedSegmentIndex = currentIndex
    }
}
