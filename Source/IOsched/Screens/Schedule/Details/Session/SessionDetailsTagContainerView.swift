//
//  Copyright (c) 2017 Google Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import UIKit
import MaterialComponents

class SessionDetailsTagContainerView: TagContainerView {

  var viewModel: [ScheduleEventDetailsTagViewModel]? {
    didSet {
      updateFromViewModel()
    }
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupViews() {
    updateFromViewModel()
  }

  private func updateFromViewModel() {
    for view in subviews {
      view.removeFromSuperview()
    }

    if let viewModel = viewModel {
      for tag in viewModel {
        let tagButton = TagButton()
        tagButton.translatesAutoresizingMaskIntoConstraints = false
        tagButton.setElevation(ShadowElevation(rawValue: 0), for: .normal)
        tagButton.isUppercaseTitle = false
        tagButton.setTitle(tag.name, for: .normal)
        let color = UIColor(hex: tag.color)
        tagButton.setBackgroundColor(color, for: .normal)
        self.addSubview(tagButton)
      }

      setNeedsLayout()
      layoutIfNeeded()
      invalidateIntrinsicContentSize()
    }

  }

}
