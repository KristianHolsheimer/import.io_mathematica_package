# *ImportIO* Mathematica package

This is a Mathematica package that allows you to call import.io custom webscraping APIs directly within Mathematica.


## How to install:

Download (or clone) the `ImportIO.m` file and move it to Mathematica's "user base directory". If you're not sure which folder that is on your system, check out the output of the Mathematica command `$UserBaseDirectory`. For instance, on a linux machine this gives something like:

     In[]= $UserBaseDirectory
    
    Out[]= /home/user/.Mathematica

The package is loaded into Mathematica in the usual way:

     In[]= Needs[ "ImportIO`" ];



##### *Alternatively:* How to load package without installing:

Download (or clone) the `ImportIO.m` file and move it to the folder where your main notebook is located. The package can then be loaded by evaluating the following command within Mathematica:

     In[]= Needs[ "ImportIO`" , NotebookDirectory[] <> "ImportIO.m" ];




## How to use:

At this stage, this package only contains the function `IOCrawler[assoc]`, which calls a custom crawler. As input it takes an `Association` object that must contain the following `Keys`:

- `"ID"` - the ID of the import.io API
- `"User"` - your import.io user ID
- `"APIKey"` - your personal import.io API key
- `"URL"` - the URL you wish to crawl

All of the associated `Values` should be given as strings. For example, I created a custom API in import.io that scrapes pages like `"http://hisz.rsoe.hu/alertmap/site/index.php?pageid=seism_index&rid=431172"` for earthquake data. The call to the `IOCrawler[]` function looks like:

    call =
      <|
        "ID"     -> "mysecretapiid",
        "User"   -> "mysecretuserid",
        "APIKey" -> "mysecretapikey",
        "URL"    -> "http://hisz.rsoe.hu/alertmap/site/index.php?pageid=seism_index&rid=431172"
      |>;
      
    IOCrawler[ call ]

This returns an `Association` object that can be used directly as a row in a `Dataset`.


## To do:

- Write functions for calling import.io extractors and connectors.
- Write extensive doc files.
