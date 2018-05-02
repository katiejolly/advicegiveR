
advicegiveR
===========

The goal of advicegiveR is to provide an easy way to make calls to the [advice slip API](http://api.adviceslip.com/). It also provides a fun way to share the advice you get!

Installation
------------

You can install advicegiveR from github with:

``` r
# install.packages("devtools")
devtools::install_github("katiejolly/advicegiveR")
library(advicegiveR)
```

Examples
--------

Get a random piece of advice:

``` r
get_advice()
#> The id you are using is 91
#> API endpoint = http://api.adviceslip.com/advice/91
#> [1] "Drink a glass of water before meals."
```

The advice slip API has 216 different outputs (from what I can tell). You can also request a particular piece of advice using the `id` argument. If you get a random piece of advice, the function will tell you what `id` it ended up using so you can find it again.

``` r
advice <- get_advice(id = 25)
#> The id you are using is 25
#> API endpoint = http://api.adviceslip.com/advice/25

advice
#> [1] "Never buy cheap cling film."
```

Then if you want to print the advice on an image, I have some images ready for you! You can choose from `clouds`, `mountain`, `ocean`, `paper`, `sunset`, or `rainbow`. (You can also use your own image loaded with the `magick` package.)

``` r
mountain <- load_image(image_name = "mountain")
```

After you've chosen your image, you can put the advice and image together.

``` r
print_advice(image = mountain, advice = advice, textcolor = "yellow", size = 40)
```

<img src="README-image-1.png" width="500" />

Then you can save the image you created! A good way comes from the `magick` package:

``` r
magick::image_write(...)
```

Contributing
------------

If you have an idea for this package, feel free to submit an issue or pull request!
