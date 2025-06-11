# Autolayout

## Description
Autolayout is a powerful system used in iOS app development that allows developers to create adaptive and responsive user interfaces. By leveraging constraints, developers can ensure that their app's UI adjusts smoothly across different screen sizes, orientations, and devices. This topic will focus on how to implement Autolayout programmatically using Swift, without the use of Interface Builder.

## Learning Objectives
- Understand the principles of Autolayout.
- Learn how to apply constraints programmatically.
- Gain proficiency in creating adaptive layouts using Swift.

## Materials for Self-Learn
In the materials for self-learning, it is recommended to start with the first item on the list. It is normal if some concepts are initially difficult to grasp. The subsequent resources are designed to help clarify and reinforce these concepts. Additionally, the practical tasks and quizzes will aid in solidifying your understanding. You will also have a session with a mentor where you can ask any questions you might have. Finally, after completing the section, revisiting these articles will help you discover more details and nuances.
### Apple's Layout Guide
#### Getting Started
1. [Understanding autolayout](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/)
2. [Autolayout without constraints (StackView)](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/AutoLayoutWithoutConstraints.html#//apple_ref/doc/uid/TP40010853-CH8-SW1)
3. [Anatomy of a constraint](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/AnatomyofaConstraint.html#//apple_ref/doc/uid/TP40010853-CH9-SW1)
4. [Working with constraints in Interface Builder (Optional)](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/WorkingwithConstraintsinInterfaceBuidler.html#//apple_ref/doc/uid/TP40010853-CH10-SW1)

#### Auto Layout Cookbook
1. [StackViews (Optional)](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/LayoutUsingStackViews.html#//apple_ref/doc/uid/TP40010853-CH11-SW1)
2. [Simple constraints](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/WorkingwithSimpleConstraints.html#//apple_ref/doc/uid/TP40010853-CH12-SW1)
3. [Views with Intrinsic Content Size](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/ViewswithIntrinsicContentSize.html#//apple_ref/doc/uid/TP40010853-CH13-SW1)

#### Advanced Auto Layout
1. [Programmatically creating constraints](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/ProgrammaticallyCreatingConstraints.html#//apple_ref/doc/uid/TP40010853-CH16-SW1)
2. [Size class specific layout (Optional)](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/Size-ClassSpecificLayout.html#//apple_ref/doc/uid/TP40010853-CH26-SW1)
3. [Working with scroll views (Optional)](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/WorkingwithScrollViews.html#//apple_ref/doc/uid/TP40010853-CH24-SW1)
4. [Working with self-sizing table view cells](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/WorkingwithSelf-SizingTableViewCells.html#//apple_ref/doc/uid/TP40010853-CH25-SW1)
5. [Changing constraints](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/ModifyingConstraints.html#//apple_ref/doc/uid/TP40010853-CH29-SW1)

### Additional guides (Optional)
1. [Layout guide](https://www.youtube.com/watch?v=4qPcMGiSADA)
2. [Autolayout cheat-sheet](https://www.hackingwithswift.com/articles/140/the-auto-layout-cheat-sheet)
3. [Auto Layout in Swift: Writing constraints programmatically](https://www.avanderlee.com/swift/auto-layout-programmatically/)
4. [Auto Layout Content Hugging Priority](https://www.youtube.com/watch?v=CEYPA4WuVXg)

## Questions for Self-Control
1. Question 1?
2. Question 2?
3. Question 3?

## Practical Tasks
Use AutolayoutPracticalTasks xcode project.

## Questions for final Quiz

1. What is the purpose of Autolayout in iOS development? (Single Choice)
    a) Simplify the code
    b) Manage memory effectively
    c) Create adaptable user interfaces
    d) Improve app performance

**Correct Answer:** *c) Create adaptable user interfaces*

2. When applying constraints programmatically, what function do you call to activate the constraints? (Single Choice)
    a) `UIViewLayout.activateConstraints()`
    b) `NSLayoutConstraint.activate(_:)`
    c) `applyConstraints()`
    d) `activateAllConstraints()`

**Correct Answer:** *b) `NSLayoutConstraint.activate(_:)`*

3. Describe how you can ensure that a button stays horizontally centered in a view programmatically using Swift. (Open-ended)

**Answer:** *To ensure a button stays horizontally centered in a view programmatically, you can set its translatesAutoresizingMaskIntoConstraints property to false and then add a constraint that centers it along the X-axis of its superview. For example:*
```swift
let button = UIButton()
button.translatesAutoresizingMaskIntoConstraints = false
view.addSubview(button)
NSLayoutConstraint.activate([
    button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
])
```

4. What is the purpose of setting `translatesAutoresizingMaskIntoConstraints` to `false` when working with Autolayout programmatically? (Single Choice)

    a) It allows the view to use autoresizing masks to generate constraints.
    b) It allows the view to igno`re autoresizing masks and rely on custom constraints.
    c) It disables Autolayout completely for the view.
    d) It automatically centers the view in its superview.

**Correct Answer:** *b) It allows the view to ignore autoresizing masks and rely on custom constraints.*

5. What is the primary use of UILayoutGuide in Auto Layout? (Single Choice)

    a) To create a placeholder image 
    b) To define layout constraints for invisible elements that help in arranging views 
    c) To automatically size UI elements based on content
    d) To define the color scheme of the layout

**Correct Answer:** *b) To define layout constraints for invisible elements that help in arranging views.*

6. Which of the following is NOT a type of constraint attribute that can be used in Autolayout? (Single Choice)
    a) Leading 
    b) Trailing 
    c) Opacity 
    d) Baseline

**Correct Answer:** *c) Opacity*

7. What is the benefit of using stack views in Autolayout? (Single Choice)
    a) They allow for complex animations
    b) They simplify the creation of complex user interfaces by managing a set of views as a single entity
    c) They increase the rendering speed of views 
    d) They change the color of contained views automatically

**Correct Answer:** *b) They simplify the creation of complex user interfaces by managing a set of views as a single entity.*

8. What is the intrinsic content size of a UIView? (Single Choice)
    a) The size determined by the view's superview 
    b) The size needed to display the view's content 
    c) The minimum size specified in the view's constraints 
    d) The size set in Interface Builder

**Correct Answer:* *b) The size needed to display the view's content*

9. Which UIKit views have an intrinsic content size by default? (Multiple Choice)
    a) UILabel
    b) UIButton 
    c) UISlider 
    d) UIImageView

**Correct Answers:** *a) UILabel, b) UIButton, d) UIImageView*

10. How can you modify the intrinsic content size of a custom UIView? (Single Choice)

    a) By changing its background color 
    b) By overriding the intrinsicContentSize property 
    c) By setting the view's alpha property 
    d) By adjusting its layer properties

**Correct Answer:** *b) By overriding the intrinsicContentSize property*

11. What does the content hugging priority determine for a view? (Single Choice)

    a) How far the view's content can extend outside its boundaries 
    b) How resistant the view is to growing larger than its intrinsic content size 
    c) How resistant the view is to shrinking smaller than its intrinsic content size 
    d) How the view manages its background color during Auto Layout

**Correct Answer:** *b) How resistant the view is to growing larger than its intrinsic content size*

12. When two views compete for space and both have defined content hugging priorities, which view will resist growing larger? (Single Choice)

    a) The view with the higher content hugging priority 
    b) The view with the lower content hugging priority 
    c) Both views will grow to the same size 
    d) Neither view will grow

**Correct Answer:** *a) The view with the higher content hugging priority*

13. How do you set a view's content hugging priority in code? (Single Choice)

    a) view.huggingPriority = UILayoutPriority.high 
    b) view.setContentHuggingPriority(.required, for: .horizontal) 
    c) view.contentHuggingPriority = 251 
    d) view.setContentHuggingPriority(1000, for: .vertical)

**Correct Answer:** *b) view.setContentHuggingPriority(.required, for: .horizontal)*

14. How do you get a view's content hugging priority in code? (Single choice)
    a) view.contentHuggingPriority
    b) view.verticalHuggingPriority
    c) view.contentHuggingPriority(for: .horizontal)
    d) view.contentHuggingPriority.horizontal

**Correct Answer:** *c) view.contentHuggingPriority(for: .horizontal)*

15. What default hugging priority values are used for horizontal and vertical axes? (Multiple Choice)
    a) 250 for vertical 
    b) 751 for vertical 
    c) 250 for horizontal 
    d) 250 for leading and trailing

**Correct Answers:** *a) 250 for vertical, c) 250 for horizontal*

16. What does the compression resistance priority determine for a view in Auto Layout? (Single Choice)
    a) How much the view can grow larger than its intrinsic content size 
    b) How resistant the view is to being compressed and truncated when space is limited 
    c) The default size of the view 
    d) How the view's background color is managed

**Correct Answer:** *b) How resistant the view is to being compressed and truncated when space is limited*

17. If a layout has limited space and you do not modify the compression resistance values, what might happen? (Single Choice)
    a) The layout will automatically adjust all view sizes proportionally 
    b) The system will break a constraint, which may cause either the text field or the label to be truncated 
    c) The view will be hidden 
    d) An error message will be displayed

**Correct Answer:** *b) The system will break a constraint, which may cause either the text field or the label to be truncated*

18. How do you modify the compression resistance priorities for a view programmatically? (Single Choice)
    a) view.compressionResistancePriority = UILayoutPriority.defaultHigh 
    b) view.setCompressionResistancePriority(.required, for: .horizontal) 
    c) view.setContentCompressionResistancePriority(.high, for: .vertical) 
    d) view.setContentCompressionResistancePriority(250, for: .leading)

**Correct Answer:** *c) view.setContentCompressionResistancePriority(.high, for: .vertical)*

19. What method is commonly used to activate an array of constraints programmatically? (Single Choice)
    a) UIView.addConstraints(_:) 
    b) NSLayoutConstraint.activate(_:) 
    c) NSLayoutConstraint.add(_:) 
    d) UIView.activateConstraints(_:)

**Correct Answer:** *b) NSLayoutConstraint.activate(_:)*

20. What do you need to ensure before adding constraints between views when done programmatically? (Single Choice)
    a) Both views must have the same background color 
    b) The views must be added to the same superview 
    c) Both views must use autoresizing masks instead of constraints d) The views must be siblings in the view hierarchy

**Correct Answer:** *d) The views must be siblings in the view hierarchy*

21. Which of the following methods is used to set a constraint for a view's width programmatically? (Single Choice)
    a) view.widthAnchor.constraint(equalToConstant: CGFloat) 
    b) view.setWidthConstraint(CGFloat) 
    c) view.setConstraints(forWidth: CGFloat) 
    d) view.width.constraint(equalToLayoutGuide: UILayoutGuide)

**Correct Answer:** *a) view.widthAnchor.constraint(equalToConstant: CGFloat)*

22. What is the first step in the process of creating constraints programmatically? (Single Choice)
    a) Define the layout guide for the view 
    b) Add the views to the view hierarchy 
    c) Set the priority for each constraint 
    d) Set translatesAutoresizingMaskIntoConstraints to true

**Correct Answer:** *b) Add the views to the view hierarchy*

23. What is the first step you need to take before modifying an existing constraint programmatically? (Single Choice)
    a) Set the constraint's priority to defaultLow 
    b) Deactivate the constraint 
    c) Remove the constraint from its superview 
    d) Reference the constraint by an IBOutlet or programmatically

**Correct Answer:** *d) Reference the constraint by an IBOutlet or programmatically*

24. How do you typically update the constant value of an existing NSLayoutConstraint? (Single Choice)
    a) By removing the constraint and adding a new one with a different constant 
    b) By changing the constant property of the constraint and calling layoutIfNeeded 
    c) By setting the translatesAutoresizingMaskIntoConstraints property to true 
    d) By deactivating the constraint and setting its isActive property to false

**Correct Answer:** *b) By changing the constant property of the constraint and calling layoutIfNeeded*

25. Why might you need to adjust constraints at runtime? (Multiple Choice)
    a) To accommodate dynamic content size changes 
    b) To change the layout based on user interactions 
    c) To improve memory management 
    d) To adapt the layout for different device orientations

**Correct Answers:** *a) To accommodate dynamic content size changes, b) To change the layout based on user interactions, d) To adapt the layout for different device orientations*

26. When adjusting a constraint at runtime, why is it important to call layoutIfNeeded inside an animation block? (Single Choice)
    a) To avoid runtime errors 
    b) To apply the new constraint values immediately and animate changes smoothly 
    c) To improve the app’s performance 
    d) To ensure proper memory management

**Correct Answer:** *b) To apply the new constraint values immediately and animate changes smoothly*