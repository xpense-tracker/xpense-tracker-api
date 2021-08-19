# How to contribute

## Request features

If you want a feature create an issue (be sure there is no similar issue),
add "enhancement" label and provide some description of the feature. Tell why
this feature would be useful to have. Also it would be great if you can provide
implementation details, otherwise add "help wanted" label and a contributor
will work it out.

## Report a bug

If you want to report a bug add "bug" label to a new issue, describe steps
to reproduce this bug. Also it would be great if you can write a failing test.
Any other information would be very useful.

### Poor documentation

Create an issue with "bug" and "documentation" labels.

### Asking questions

It's a flaw of our project that you can't understand something from the source
code and documentation. You can ask a question in an issue, but it should be
rather a bug.

## Writing code

If you want to implement some feature please note - we want to follow
object-oriented design in this project.
It is heavily inspired by Yegor's Bugayenko vision on OOP.
Everything that is not a controller or a view should be a model. It should be
located in `app/models` directory and have a test.

Read more about OOP on
[Yegor's blog](https://www.yegor256.com/2014/05/05/oop-alternative-to-utility-classes.html).

Also we recommend his book "Elegant Objects".
