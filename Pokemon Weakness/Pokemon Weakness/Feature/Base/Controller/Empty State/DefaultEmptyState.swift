//
//  DefaultEmptyState.swift
//  Pokemon Weakness
//
//  Created by Oscar Duran on 26/7/16.
//  Copyright © 2016 Skydev. All rights reserved.
//

import UIKit
import DZNEmptyDataSet

class DefaultEmptyState: NSObject, EmptyState {
    
    var shouldDisplay = false
    var title: NSAttributedString?
    var subtitle: NSAttributedString?
    var image: UIImage?
    var customView: UIView?
    
    fileprivate var titleForState: TitleForState?
    fileprivate var action: Action?
    
    var scrollView: UIScrollView? {
        
        didSet {
            scrollView?.emptyDataSetDelegate = self
            scrollView?.emptyDataSetSource = self
        }
    }
    
    func reloadEmptyState() {
        scrollView?.reloadEmptyDataSet()
    }
    
    deinit {
        scrollView?.emptyDataSetDelegate = nil
        scrollView?.emptyDataSetSource = nil
    }
}

// MARK: - DZNEmptyDataSetDelegate

extension DefaultEmptyState: DZNEmptyDataSetDelegate {
    
    func emptyDataSetShouldDisplay(_ scrollView: UIScrollView!) -> Bool {
        return shouldDisplay
    }
    
    func emptyDataSetShouldAllowScroll(_ scrollView: UIScrollView!) -> Bool {
        return false
    }
    
    func emptyDataSetDidTapButton(_ scrollView: UIScrollView!) {
        if let buttonAction = action {
            buttonAction()
        }
    }
}

// MARK: - DZNEmptyDataSetSource

extension DefaultEmptyState: DZNEmptyDataSetSource {
    
    func emptyDataSetShouldFade(in scrollView: UIScrollView!) -> Bool {
        return true
    }
    
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        return title
    }
    
    func description(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        return subtitle
    }
    
    func image(forEmptyDataSet scrollView: UIScrollView!) -> UIImage! {
        return image
    }
    
    func customView(forEmptyDataSet scrollView: UIScrollView!) -> UIView! {
        return customView
    }
    
    func buttonTitle(forEmptyDataSet scrollView: UIScrollView!, for state: UIControlState) -> NSAttributedString! {
        guard let titleForState = titleForState else {
            return nil
        }
        
        return titleForState(state)
    }
    
    func addButton(_ titleForState: @escaping TitleForState, action: @escaping Action) {
        self.titleForState = titleForState
        self.action = action
    }
}
