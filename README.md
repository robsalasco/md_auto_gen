Testing
=======

Using Bootstrap
---------------

Using R Markdown, the default behavior is to include the Bootstrap
framework. This can make things very easy for you to signify your code
and your output. Bootstrap defines some [CSS classes for
backgrounds](http://getbootstrap.com/css/#helper-classes-backgrounds):
`"bg-primary"`, `"bg-success"`, `"bg-info"`, `"bg-warning"`, and
`"bg-danger"`.

``` r
mtcars[, "mpg"]
```

``` bg-warning
##  [1] 21.0 21.0 22.8 21.4 18.7 18.1 14.3 24.4 22.8 19.2 17.8 16.4 17.3 15.2
## [15] 10.4 10.4 14.7 32.4 30.4 33.9 21.5 15.5 15.2 13.3 19.2 27.3 26.0 30.4
## [29] 15.8 19.7 15.0 21.4
```
