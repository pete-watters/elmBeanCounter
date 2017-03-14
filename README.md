# elmBeanCounter 

This is an attempt to solve a multi-bean counter using Elm. Unfortunately I ran out of time trying to get Elm KeyPress working so I had to fallback to manipulating the DOM with jQuery. 

I didn't manage to get the total count updating properly either. 

If you want to compile my files you should have elm installed. Then run:
```
elm-make bean-counter.elm --output=main.js
```

I have it compiling to a JS file so I can then load this into a HTML page and manipulate things there. 
