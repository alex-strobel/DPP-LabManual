# Overview R Shiny App
## Questionaire in REDCap
### Link Generation
The link generated at the end has to have the form 

- http:<area>//141.76.19.82:3838/mediawiki/questionaire_results/?quesid=questionairename&v1=value_scale1&v2=value_scale2
- e.g. http://141.76.19.82:3838/mediawiki/questionaire_results/?quesid=BFI&v1=3.2&v2=2.8&v3=2.2&v4=3.8&v5=3.0

Participants are automatically sent to this page after finishing the questionaire(s). Currently, this link generation happens in a piece of code that works in the background and is alos responsible for deleting the data of those participants that did not consent to their data being stored. Therefore, if any changes have to be made, please contact Jens Strehle (jens.strehle@tu-dresden.de; The Project-ID is currently 977). 

## Shiny App
### File Structure
There are 4 main components to the file structure.

**.R files** 
- ui.R (The component that included the definition of the user interface)
- server.R (The component that is responsible for the behaviour of the shiny app)
- helpers.R (Self-written functions, accessed from server.R)

**www folder**
- This folder contains all the pictures necessary for the app (currently includes the flags used as icons for the language selectors and the legend icons
- By default, R shiny apps look for pictures in a folder called wwww, therefore if any additional pictures are required in the future, add them here and do not change the name of the folder
- If there is an issue with pictures not showing up if the app is run on a server but are visible when run locally, check the capitalization of the filenames.
- Vector graphics are not supported

**Dict folder**
- The dict folder containing the text required for all questionaires in .tsv files
- Any %some_text inside the text stored here are placeholders that are used to place some specific information here later

**Folder(s) containing questionaire-specific information (currently BFI)**
- The folder(s) containing the questionaire-specific information (e.g. BFI)
- Each folder consists of two subdirectories: Dict and Normvalues
  - The Dict folder, works similarly to the Dict folder in the main folder, but the text here is specific to the questionaire. It should contain one column "scalename" which contains the name of the scale in the respective language and another column "scaledescription" which contains a description of what it means to have a high or low value on the corresponding scale.
  - The scaledescription should contain a %quantifier which will be replaced depending on the classification of the value as below average, average or above average with the quantifiers from the text_de.tsv/text_en.tsv files. Therefore the scaledescription should be written in a way in which the sentence with the quantifier placed instead of the %quantifier makes sense (or the structure of how the descriptions are created has to be changed)  

### Hosting
The R-Shiny App is currently hosted on the mediawiki server of the methods faculty where the e-Learning Tool is also hosted
The access to the server works via SSH (Secure Shell). To access it,  you need an FTP-Client (File Transfer Protocol), for example FileZilla and be connected to the TU-Net via VPN
The login data is 
- IP: 141.76.19.82
- Username: hannah_pongratz
- Password: C22,p

After login you will be in a folder called hannah_pongratz. This is **not** the folder where the shiny-app files have to be. Instead navigate two levels up. There is a directory called srv. In this directory under shiny-server/mediawiki/questionaire-results are all the files.

Only packages installed on the server can be used. These can be found under usr/local/lib/R/site-library. To install new packages, administrator privileges are needed which the account does **not** posess. If new packages are required contact Frank Leonhardt (frank.leonhardt@tu-dresden.de), who provides the technical support for the page.

**NOTE**: The R-Version installed on the server is currently 3.6. This can lead to different behavior of the app compared to when it is run locally or hosted on shinyapps.io
