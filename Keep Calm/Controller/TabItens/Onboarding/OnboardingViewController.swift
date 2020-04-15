//
//  OnboardingViewController.swift
//  Keep Calm
//
//  Created by Alcides Junior on 14/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import UIKit
import SnapKit

class OnboardingViewController: UIPageViewController {
    
    var controllers: [UIViewController] = []
    var pageControl = UIPageControl()
    let screen4 = Screen4ViewController()
    
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: options)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self
        delegate = self
        controllers = [Screen1ViewController(), Screen2ViewController(), Screen3ViewController(), screen4]
        
        if let firstViewController = controllers.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion:  nil)
            
        }
        
        self.pageControl.frame = CGRect()
        self.pageControl.currentPageIndicatorTintColor = UIColor.black
        self.pageControl.pageIndicatorTintColor = UIColor.lightGray
        self.pageControl.numberOfPages = self.controllers.count
        self.pageControl.currentPage = 0
        self.view.addSubview(self.pageControl)
        
        pageControl.snp.makeConstraints { (make) in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.width.equalTo(view.safeAreaLayoutGuide.snp.width)
            make.height.equalTo(20)
            make.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
        }
    }

}

extension OnboardingViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        
        if let viewControllerIndex = self.controllers.firstIndex(of: viewController) {
            if viewControllerIndex > 0 {
                // go to previous page in array
                return self.controllers[viewControllerIndex - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let viewControllerIndex = self.controllers.firstIndex(of: viewController) {
               if viewControllerIndex < self.controllers.count - 1 {
                   // go to next page in array
                   return self.controllers[viewControllerIndex + 1]
               }
           }
           return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if let viewControllers = pageViewController.viewControllers {
            if let viewControllerIndex = self.controllers.firstIndex(of: viewControllers[0]) {
                self.pageControl.currentPage = viewControllerIndex
            }
        }
    }
    
    
}
