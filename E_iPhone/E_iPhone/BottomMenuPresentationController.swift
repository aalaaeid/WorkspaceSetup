//
//  PaidInvoiceBottomMenuPresentationController.swift
//  mapFlow
//
//  Created by alaa eid on 28/02/2021.
//  Copyright © 2021 Esraa Eid. All rights reserved.
//

import UIKit

class BottomMenuPresentationController: UIPresentationController {

    // MARK: - Properties
        var blurEffectView: UIVisualEffectView?
        var tapGestureRecognizer = UITapGestureRecognizer()

    private var topHeightRatio: Float
    private var bottomHeightRatio: Float

     init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?,
          topHeightRatio: Float, bottomHeightRatio: Float ,
          effect: UIVisualEffect? = UIBlurEffect(style: .systemThickMaterialDark),
          isEffectIInteractionEnabled: Bool = true ) {
           // let blurEffect = UIBlurEffect(style: .systemThickMaterialDark)
            blurEffectView = UIVisualEffectView(effect: effect)

            self.topHeightRatio = topHeightRatio
            self.bottomHeightRatio = bottomHeightRatio
            super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
             blurEffectView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissController))
            self.blurEffectView?.isUserInteractionEnabled = isEffectIInteractionEnabled
            self.blurEffectView?.addGestureRecognizer(tapGestureRecognizer)
        }

        override var frameOfPresentedViewInContainerView: CGRect {
            CGRect(origin: CGPoint(x: 0, y: self.containerView!.frame.height * CGFloat(topHeightRatio)),
                   size: CGSize(width: self.containerView!.frame.width, height: self.containerView!.frame.height * CGFloat(bottomHeightRatio)))
        }

        override func presentationTransitionWillBegin() {
            self.blurEffectView?.alpha = 0
            if let blurEffectView = blurEffectView {
            self.containerView?.addSubview(blurEffectView)
            }
            self.presentedViewController.transitionCoordinator?.animate(alongsideTransition: { (_) in
                self.blurEffectView?.alpha = 0.66
            }, completion: { (_) in })
        }

        override func dismissalTransitionWillBegin() {
            self.presentedViewController.transitionCoordinator?.animate(alongsideTransition: { (_) in
                    self.blurEffectView?.alpha = 0
                }, completion: { (_) in
                    self.blurEffectView?.removeFromSuperview()
                })
        }

        override func containerViewWillLayoutSubviews() {
            super.containerViewWillLayoutSubviews()

        }

        override func containerViewDidLayoutSubviews() {
            super.containerViewDidLayoutSubviews()
            presentedView?.frame = frameOfPresentedViewInContainerView
            blurEffectView?.frame = containerView!.bounds
            }

        @objc func dismissController() {
            self.presentedViewController.dismiss(animated: true, completion: nil)
        }
    }
