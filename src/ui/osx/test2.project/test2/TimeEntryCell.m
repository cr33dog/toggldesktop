//
//  TableViewCell.m
//  kopsik_ui_osx
//
//  Created by Tambet Masik on 9/26/13.
//  Copyright (c) 2013 kopsik developers. All rights reserved.
//

#import "TimeEntryCell.h"
#import "UIEvents.h"
#import "ConvertHexColor.h"

@implementation TimeEntryCell

- (IBAction)continueTimeEntry:(id)sender {
  [[NSNotificationCenter defaultCenter] postNotificationName:kUICommandContinue
                                                      object:self.GUID];
}

- (void)render:(TimeEntryViewItem *)view_item {
  NSAssert([NSThread isMainThread], @"Rendering stuff should happen on main thread");

  self.GUID = view_item.GUID;
  self.durationTextField.stringValue = view_item.duration;
  
  // Time entry has a description
  if (view_item.Description && [view_item.Description length] > 0) {
    self.descriptionTextField.stringValue = view_item.Description;
    self.descriptionTextField.toolTip = view_item.Description;
  } else {
    self.descriptionTextField.stringValue = @"(no description)";
    self.descriptionTextField.toolTip = nil;
  }

  // Time entry has a project
  if (view_item.ProjectAndTaskLabel && [view_item.ProjectAndTaskLabel length] > 0) {
    self.projectTextField.stringValue = [view_item.ProjectAndTaskLabel uppercaseString];
    [self.projectTextField setHidden:NO];
    self.projectTextField.toolTip = view_item.ProjectAndTaskLabel;
    self.projectTextField.backgroundColor =
      [ConvertHexColor hexCodeToNSColor:view_item.ProjectColor];
    return;
  }

  // Time entry has no project
  self.projectTextField.stringValue = @"";
  [self.projectTextField setHidden:YES];
  self.projectTextField.toolTip = nil;
}

@end
