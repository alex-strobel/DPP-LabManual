# R Package `here`

The `here` package is of great help in collaborative research and sharing of data and code. 
Say, I am working on a Mac and have my data stored locally in a folder "/Users/alex/R/ProjectX".
If I then put some file "QuestionnaireData.csv" in a subfolder named "/Data", normally my analysis script located in another subfolder "/Code" would include something like

`df <- read.csv("/Users/alex/R/ProjectX/Data/QuestionnaireData.csv")`

to read the data. When you would clone the repository on a machine that runs on Windows, the folder structure would be located at a different place and with a different syntax, say "D:\\\Projects\Cloned\ProjectX". You would therefore need to edit the above syntax to 

`df <- read.csv("D:\\Projects\Cloned\ProjectX\Data\QuestionnaireData.csv")` 

or otherwise get an error message that the data cannot be found. 
While just editing the path in a single R script is certainly not a big thing, all can become very complicated if you have a more complex folder structure, a larger number of scripts, or need to load multiple files.  
With the `here` package, you simply place a flagging file into the root folder, name it, say "flag_root.txt", and in your analysis script, you write

`here::i_am("flag_root.txt")` 

Based on the location of the flagging file, the `here` package automatically locates the root folder and sets it as working directory. To circumvent the problem that Windows uses backslashes for file paths while Mac uses forward slashes, `here` simply wants to know the directory where the data is located as a first argument and then the file name as a second argument:

`df <- read.csv(here("Data", "data.csv"))`  

And given that you have a more complex subfolder structure, you would simply write, e.g.,   

`df <- read.csv(here("Data", "PrimaryData", "data.csv"))` 

It may be wise to put the project name into the flagging file to make sure that `here` captures the correct project directory in case you are concurrently working on more than one project with the `here` package, i.e.:

`here::i_am("flag_root_for_ProjectX.txt")` 

See the `here` vignette for more details:

- [`here` Vignette](https://cran.r-project.org/web/packages/here/vignettes/here.html)