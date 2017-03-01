Use a **UIPanGestureRecognizer** to replace the implementation of `touchesMoved` in CoolViewCell.

1. Comment out the code inside `touchesMoved`, and verify that CoolViewCell instances are no longer draggable.

2. Write an empty method named `pan(recognizer:)` that takes a UIPanGestureRecognizer as its only argument.

3. Create an instance of UIPanGestureRecognizer with target `self` and action `pan(recognizer:)`, and add it to the CoolViewCell.

4. Write code in `pan(recognizer:)` that applies the recognizer's translation value to the CoolViewCell's frame, and zeros the translation value. Add code to toggle the cell's highlighted state based on the recognizer's current state.