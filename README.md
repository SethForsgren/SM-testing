# SM-testing

This app has 2 buttons on the main screen:

When tapping **"Show Message Once"** => message always appears

When tapping **"Show Message Once, and again in 3 seconds"** => if you dismiss the first message within 3 seconds by tapping on it or dragging it away, then the second message does not present on screen. If you don't interact with the first message, then the second one will appear. 

Ideally both messages will show whenever tapping **"Show Message Once, and again in 3 seconds"**

An interesting finding is that if the user taps anywhere on the app screen after dismissing the first message, then the subsequent message will show. The subsequent message is missed if the user interacts with the first message, and then does nothing on the app until the subsequent message is supposed to show up.
