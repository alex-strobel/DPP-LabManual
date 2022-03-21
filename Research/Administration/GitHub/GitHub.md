# GitHub introduction

[Christoph Scheffel](christoph_scheffel@tu-dresden.de)<br>
[Alexander Strobel](alexander.strobel@tu-dresden.de)<br>
[Josephine Zerna](josephine.zerna@tu-dresden.de)<br>
Faculty of Psychology, TU Dresden

2021-11-17

---

## Table of Contents

- [Background](#background)
- [How it works](#how-it-works]
- 

## Background

Collaborating with others on research projects requires to have some common working environment. 
You can set up a group drive, but if something changes on that drive, it may not be easy to keep track of these changes. 
Also, if some change eventually results in a dead end, you may want to go back to a previous point in the "timeline" of your analysis, but it may be not that easy to restore it because you do not know whether all changes since then have to be abandoned or only certain ones. 

Here, version control is really helpful. 
If there was a system that tracked all changes to the files on your project and would easily allow for reviewing what has changed when by whom, this would be of great benefit. 
GitHub allows for such a version control. 
In fact, it has been *made* for it (among other purposes). 

## How it works

When you create a GitHub project (also called a repository), you create a main branch of your project that is stored both on the GitHub server and locally (just as in nextcloud that is stored on some server, but mirrored locally). 
In GitHub terms, this main branch is called *main*, one could also call it the main "timeline". 
You upload files (or *push*) to that main "timeline". 
This change or alteration is called a *commit*. 
Each *commit* is stored in a file's history and at least needs to be labeled, but can (ideally) also be commented on. 
Others may also alter the "timeline" (in GitHub terms: *commit* to the *main*) and you can download (or *pull*) these changes to your local mirror of your research project, have an overview of the history of all *commits*, their summary and perhaps also comments on the *commits*.

You can compare this process to a collaborative work on a Google Document: 
All team members can edit the document in real time, and every change and comment is visible to all others. 
You may ask what then is the difference to working with GitHub? 
Well, a Google Doc is only one file, but you usually work in a project with multiple files involved. 
GitHub helps you to keep track on changes made to the project *as a whole*.

Also, GitHub offers a unique feature that you cannot have using Google: 
If someone in your team wants to *commit* changes to the *main* "timeline" (e.g., introduce a new analysis routine or change major parts of a research report), one can create a *branch* of the *main*. 
When doing so, there still extists the *main* "timeline", but also an altered "timeline", the *branch*. 
The team member can then *commit* whatever to this alternative "timeline" without changing the *main* "timeline". 
Once done, the team member creates a so-called *pull request*: 
All other team members are informed that a change to the *main* "timeline" is suggested, they can review all the changes, comment on them, accept or reject them. 
When eventually a common consensus has been reached on whether and how to change the *main* "timeline", the new *branch* is merged with the *main*. However, when later on, this change of the "timeline" may end up in a dead end street, one simply restores to earlier versions of the "timeline" ...

Importantly, all team members work with the same project or repository all the time, they will do so mostly locally on their mirror (or in GitHub terms: *clone*) of the project, but every change is then uploaded to the repository and will be available to all collaborators. 
In case you eventually choose to share your data and code openly, other researchers do not have to download single files from your, say, OSF project, but can simply *clone* your GitHub project as a whole and store it locally.

Here are some helpful guides for using GitHub:

- [GitHub's Git Guides](https://github.com/git-guides/install-git)
- [Happy Git With R](https://happygitwithr.com/install-git.html) 

## Install Git

There seems to exist a difference between Git and GitHub, I guess the former refers to some tool for collaboration and the latter for the platform that uses this tool, but for our purposes, this is not important. For a start, first install Git and then sign up to GitHub.

To install Git, there are several ways to do so.

**On Windows** 

...<!-- @Christoph/Josephine: please add instructions -->

**On Mac**, the recommended way is as follows:

1. Install [Homebrew](https://brew.sh/index_de) as a general purpose tool to manage missing packages on macOS (this step may take some time)
2. Install Git from the terminal via the command `brew install git` (this step is quite fast)
3. To check whether it worked, type `git version` into your terminal, it should return some meaningful info. If not, well, then I do not know ...

Whether on a Windows machine or a Mac, then sign up to GitHub via  

- [GitHub](https://github.com)

You have to enter an email address, upon which you will receive a confirmation email. This may take some time. Do not try to create another account using a secondary email address because it seems that all this takes too long. Make yourself a coffee instead while you wait. When the email has arrived and you finished the process of signing up, you can create a new project (called repository) via clicking the *plus* button top right on the GitHub page. You can manage most if not all of your project via the browser, but some tasks (such as adding data to a project) may be easier to implement if you have a local mirror (or *clone*) of your repository. A convenient tool to manage your GitHub projects locally is GitHub Desktop.

- [GitHub Desktop](https://desktop.github.com)

GitHub Desktop is - from my experience - not well organized, i.e., you have no immediate access to your folder structure and cannot edit documents right away. Yet, judging from my (Mac) experience and having the [Sublime text editor](https://www.sublimetext.com) installed, you can open any GitHub project in the editor and edit *ad libitum* and then *push* the changes via GitHub Desktop to update everything on the server. If you have an R project attached to the GitHub repository (for details see below), GitHub Desktop will automatically detect changes made to your R code and will require you to *push* it onto the GitHub server and will also require you to at least label and ideally comment on your *commit*. Unless your *commit* is labeled, it cannot be *pushed*. This is one great advantage of GitHub over what I outlined initially in the "The Problem" section: You cannot *commit* anything without at least give it a label.

In an ideal world, you can even *commit* changes to your GitHub project via RStudio itself, as it comes with a Git integration (more on that below). Yet, this requires some sort of authentication, but (at least on my Mac) a user name/password authentication does not work. Instead, GitHub requires a so-called *personal access token*, the creation of which goes beyond my level of understanding. Which is why I continue to use GitHub Desktop to *push* changes to my repository.

## Integrate Git in RStudio

Now that Git is installed, you need to link it to RStudio. 
Open RStudio and go to `Tools > Global Options`. 
Navigate to `Git/SVN`, check `Enable version control interface for RStudio projects` and paste the path to your Git executable in the corresponding field, then click `OK`.
On a Mac, the Git executable will most likely be located at `usr/bin/git`. 
Under Windows, it will be located in the path you installed Git to (see [above](#Install-Git)).
Now, when creating a new project in RStudio, you can either create one locally as a GitHub repository via `New Directory` or clone an existing repository on GitHub via `Version Control`. 

## Collaborating on projects with GitHub

If you collaboratively work on a project/document, please create a new branch für major changes you are about to commit, e.g., when revising a manuscript. 
Then you work your changes into the branch.
- When revising, it is a good idea to work with many small commits. This gives the creator of the main branch a better overview of what has been changed.
- It is really essential that you always **pull first** and then **push your commits**. This ensures that you always have the current version locally and that possible conflicts can be detected and avoided at this point. It is recommended to use GitHub Desktop (https://desktop.github.com/), which does this automatically.
- Once you have contributed your changes, you then make a pull request to connect your branch to the main branch. After that the owner of the main branch can review, accept or reject your changes. Here, the many small commits are important, this makes it easier to do so.

Additionally, it is important to make sure that you always explicitly close all files when you are done editing! There can be problems if there are some project files – such as R-scripts - open somewhere in the background. Often these are opened in RStudio or VS Code when you start a new session in the background, if they were still open when you last closed the program. Example: A has commented on file 1 and pushed the changes. The next day A works on another file 2, pushes the changes, but in the background, file 1 is still open. At the same time, B wants to incorporate the changes made by A to file 1. This leads to conflicts, because the open file 1 does not correspond to the status that B pushes to Git.

...
