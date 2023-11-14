# Overview R Shiny App
## Questionaire in REDCap
### Link Generation
The link generated at the end has to have the form 

- http:<area>//141.76.19.82:3838/mediawiki/questionaire_results/?quesid=questionairename&v1=value_scale1&v2=value_scale2
- e.g. http://141.76.19.82:3838/mediawiki/questionaire_results/?quesid=BFI&v1=3.2&v2=2.8&v3=2.2&v4=3.8&v5=3.0

Participants are automatically sent to this page after finishing the questionaire(s). Currently, this link generation happens in a piece of code that works in the background and is alos responsible for deleting the data of those participants that did not consent to their data being stored. Therefore, if any changes have to be made, please contact Jens Strehle (jens.strehle@tu-dresden.de; The Project-ID is 977). 

## Shiny App
### File Structure
There are 4 main components to the file structure.
- The .R files (server.R, ui.R, helpers.R) that contain the R-Code for the Shiny App
- The www folder containing all pictures
- The dict folder containing the text required for all questionaires in .tsv files.
- The folder(s) containing the questionaire-specific information 

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
