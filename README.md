
<!-- README.md is generated from README.Rmd. Please edit that file -->
RPatRec
=======

Please refer to the vignette for details and examples on how to use this package!
---------------------------------------------------------------------------------

There are two vignettes in this package that guide you through the process of using this software.

Check out whether the latest build has passed the checks on Tarvis/AppVeyor:
----------------------------------------------------------------------------

[![Travis-CI Build Status](https://travis-ci.org/maiers94/rpatrec.svg?branch=master)](https://travis-ci.org/maiers94/rpatrec)

[![Build status](https://ci.appveyor.com/api/projects/status/5v33xg3htyd43g4c?svg=true)](https://ci.appveyor.com/project/maiers94/rpatrec)

Currently, testing covers this proportion of lines of code

[![codecov](https://codecov.io/gh/maiers94/rpatrec/branch/master/graph/badge.svg)](https://codecov.io/gh/maiers94/rpatrec)

How to build your own recognition function
------------------------------------------

Your function can have any name you wish. There are, however, a few criteria you should adhere to:

-   The first 3 arguments of your function may have any name and together provide all known information about the extrema in the time series. They need be as follows:
    -   Extrema: A vector of 0s and 1s indicating whether the identified extrema are maxima(1) or minima(0)
    -   Extvals: A vector containing the value of these extrema in the smoothed time series
    -   Extpos: A vector containing the times at which the extrema occur in the smoothed time series
-   Your function must return a list as a result. This list needs to contain the following elements if you wish to use the inbuilt diagnostics tools (recognition rate, etc. although these will need be adapted). Should you wish to use the slicer function (i.e. expect more than one pattern per sample) you need to make sure to include point 4) in your output list.

1.  *EXT=extrema as passed to your function*
2.  *EXV=values of these extrema, as passed to your function*
3.  *EXP=position in time of these extremes*
4.  RESULT=Logical. TRUE if any pattern is found in the sample, FALSE otherwise. Depending on whether your algorithm looks for more than one type of pattern, this needs to be programmed. If TRUE, slicer counts the result as a find.

-   The remaining arguments and list entries in the result need not confirm to any standard.

Below is an example of a skeleton recognition function for your own patterns. *ITALIC* are optional but recommended elements.

    custompatrec <- function(extrema, extvals, extpos, arguments){
        #room for your code
        result <- list(EXT=extrema, EXV=extvals, EXP=extpos, recog, RESULT=logical)
        #recog is your own output. I recommend a separate list
        #element per type of pattern your function recognises
    return(result)
    }
