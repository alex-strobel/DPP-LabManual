# Overview R Shiny App
## Table of Contents
- [Overview R Shiny App](#Overview-R-Shiny-App)
  - [Table of Contents](Table-of-Contents)
  - [Questionaire in REDCap](#Questionaire-in-REDCap)
    - [Link Generation](#Link-Generation)
  - [Shiny App](#Shiny-App)
    - [File Structure](#File-Structure)
    - [Hosting](#Hosting)

## Questionaire in REDCap
The questionaire(s) themselves are currently administered via REDCap. However, this may be changed in the future. As long as the link generated at the end has the same form as specified below, the means of adminsitration does not matter. Before filling out the questionaire(s) people can specify which questionaires they would like to complete and whether they agree to their data being used for research purposes in the future. If they do not consent, they can still complete the questionaires and be shown the results, but their data is deleted immediatly upon completion.

### Link Generation
The link generated at the end has to have the form 

- http:<area>//141.76.19.82:3838/mediawiki/questionaire_results/?quesid=questionairename&v1=value_scale1&v2=value_scale2
- e.g. http://141.76.19.82:3838/mediawiki/questionaire_results/?quesid=BFI&v1=3.2&v2=2.8&v3=2.2&v4=3.8&v5=3.0

Participants are automatically sent to this page after finishing the questionaire(s). Currently, this link generation happens in a piece of code that works in the background and is alos responsible for deleting the data of those participants that did not consent to their data being stored. Therefore, if any changes have to be made, please contact Jens Strehle (jens.strehle@tu-dresden.de; The Project-ID is currently 977). 

## Shiny App
### File Structure
There are 4 main components to the file structure.

#### .R files  
- _ui.R_ (The component that included the definition of the user interface)
- _server.R_ (The component that is responsible for the behaviour of the shiny app)
- _helpers.R_ (Self-written functions, accessed from server.R)

#### www folder
- This folder contains all the pictures necessary for the app (currently includes the flags used as icons for the language selectors and the legend icons)
- By default, R shiny apps look for pictures in a folder called _www_, therefore if any additional pictures are required in the future, add them here and do not change the name of the folder
- If there is an issue with pictures not showing up if the app is run on a server but are visible when run locally, check the capitalization of the filenames.
- Vector graphics are not supported

#### Dict folder
- Contains the text required for all questionaires in _.tsv_ files
- Any %some_text inside the text stored here are placeholders that are used to place some specific information here later

#### Folder(s) containing questionaire-specific information (currently BFI)
- The folder(s) containing the questionaire-specific information (e.g. BFI)
- Each folder consists of two subdirectories:
- **Dict** 
  - Works similarly to the _Dict_ folder in the main folder, but the text here is specific to the questionaire. There are two types of files: Those starting with _text_test_ and those starting with _sample_
  - The _text_test_ files contain information about the scales / measured constructs. 
  - The _sample_ files contain information about the normative samples available. Each .csv file in the Norms folder should have a corresponding entry here
- **Norms**
  - This folder contains the normative values for the overall sample and the different selectable subgroups in _.csv_ files. The folder and file names are used to construct the options that can be selected in the section specific norms.
  - Each _.csv _file contains the normative values for one (sub)group for all the scales that are part of the questionaire. It needs to contain at least three columns: Mean, SD and Reliability. For readability purposes there is currently also a column called scalename which contains the name of the corresponding scale, however the values are mapped to the corresponding scales strictly by their order (i.e. row number)
  - The normative values of the total sample are stored in a file called basic.csv directly in the *Norms* folder. This file is absolutly necessary.
  - All the files containing data concerning a subsample are stored inside a folder that specifies on what basis the subgroups were split (e.g. gender, age, education). The name of the file should be the name of the subgroup (e.g. inside the gender folder, there is a file called _men.csv_ and one called _women.csv_)
  - For intersecting subgroups (e.g. women with high school diploma), there should be an additional folder which contains the name of both groups (e.g. education_gender) which contains the files for the subgroups, again with the labels separated by an underscore (e.g. women_abitur).
  - **NOTE**: Because it is assumed, that underscores separate the names of subgroups, the names of an individual subgroup themselves cannot contain underscores!

<img src="Resources/selecters.png" width="100%">

### Hosting
The R-Shiny App is currently hosted on the mediawiki server of the methods faculty where the e-Learning Tool is also hosted. Therefore, if the code is changed here on GitHub this does not automatically result in changes to the app online.
The access to the server works via SSH (Secure Shell). To gain access please contact Frank Leonhardt (frank.leonhardt@tu-dresden.de), who provides the technical support for the page. He will give you a username and a password. To access the server, you additionally need an FTP-Client (File Transfer Protocol), for example FileZilla and be connected to the TU-Net via VPN. The IP-adress is 141.76.19.82 .


<img src="Resources/filezilla_serversetup.png" width="100%">

After login you will be in a folder that has the same name as your username (e.g. hannah_pongratz in the picture below). This is **not** the folder where the shiny-app files have to be. Instead navigate two levels up. There is a directory called srv. In this directory under shiny-server/mediawiki/questionaire-results are all the files.

Only packages installed on the server can be used. These can be found under usr/local/lib/R/site-library. To install new packages, administrator privileges are needed which the account does **not** posess. If new packages are required please contact Frank Leonhardt as well.

**NOTE**: The R-Version installed on the server is currently 3.6. This can lead to different behavior of the app compared to when it is run locally or hosted on shinyapps.io

<img src="Resources/filezilla_filestructure.png" width="100%">


