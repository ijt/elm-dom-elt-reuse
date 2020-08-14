# Getting Elm to reuse DOM elements
This is an exploration to find out how to make Elm reuse DOM elements.

To see the issue

1. Run `make`
2. Open static/index.html
3. Notice the counters steadily increasing.
4. Press the Toggle Layout button
5. Notice that the counters get reset to zero and no longer get incremented.

The breakage of the counters happens because Elm generates them fresh when the layout is changed, and the JavaScript code in `index.html` is pointing to elements that are no longer present in the DOM.

Of course we could tell the JavaScript code to just get the new nodes with `document.getElementById` but that wouldn't do it because the new nodes have been reset to "0". We want the counters to keep going up without interruption.

I have tried to fix this with `Html.lazy` and `Keyed.node` but saw no effect.

