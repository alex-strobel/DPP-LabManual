# Manuals @ AG.DPP

## Outline 

This folder contains a collection of best-practice routines and guidelines at AG.DPP. To contribute, just edit existing documents or create now ones on your own. Make sure to adhere to the formatting guidelines outlined below.

## Contribution and attribution

If you created a manual or contributed to it in a substantial way, you are a contributor and the manual's content can and will be attributed to you (including all possibly erroneous statements and inaccuracies). If you are able and willing to take responsibility for a manual's content, list your name and contact info in the header of the document, with the following header format:

```
# Document title

[Contributor name](mailto:contributor@affiliation)<br>
Affiliation

Date of last edit

---

## Table of contents

...

```

If someone has helped you to understand the issues you are going to elaborate on but did not directly contribute to your manual, ask this person whether they want to be listed as contributor (with full attribution to its contents including its errors). Otherwise list this person like this:

```
# Document title

[Contributor name](mailto:contributor@affiliation)<br>
Affiliation

Credit goes to<br> 
Name (Affiliation)

Date of last edit

---

## Table of contents

...

```

## Document structure

If your manual is going to be rather short, a one page manual will most likely be the best option (see manual on [Visual Studio code](https://github.com/alex-strobel/DPP-LabManual/blob/main/Manuals/Visual%20Studio%20Code/Basic_Functions.md)). If you assume it to be a longer document, consider to split it in several shorter documents (see manual on [Workflow research projects](https://github.com/alex-strobel/DPP-LabManual/tree/main/Manuals/Workflow_research_projects)). In both cases, provide a Table of Contents at the top of a one page manual or in the root page page of a multiple page manual. In the case of a one page manual, link the contents to anchors on the same page like this (and ideally provide some link that directs back to the Table of Contents):

```
## Table of contents

[Section 1](#section-1)<br>
[Section 2](#section-2)<br>
[Section 3](#section-3)

## Section 1

...

[up](#table-of-contents)

## Section 2

...

[up](#table-of-contents)

## Section 3

...

[up](#table-of-contents)

```

In the case of a multiple page manual, create a root document called `00_Manual_name.md`, give a general outline of the manual and provide the Table of Contents, linking to the subdocuments like this:

```
[Section 1](01_Section-1.md)
[Section 2](02_Section-2.md)
[Section 3](03_Section-3.md)

...

```

At the end of each subdocument, insert links that lead back to the Table of Contents and ideally also to the previous and the next document of your manual. For the Section 2 document of your manual, this would look like this:

```
---

[**Table of Contents**](00_Manual_name.md) | [back to **Section 1**](01_Section-1.md) | [next to **Section 3**](03_Section-2.md)

```

## Inserting figures and other content

To avoid indiosyncratic naming conventions for folders containing, e.g., images or other content that you want to display in or link to your manual, add a subfolder `Ressources` to your manual's root folder. <!-- we might also discuss whether we want to have a separate Ressources folder where we put in all the images etc. -->


