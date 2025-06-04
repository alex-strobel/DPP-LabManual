# Research manuals

## Table of Contents

- [Research manuals](#research-manuals)
  - [Table of Contents](#table-of-contents)
  - [Outline](#outline)
  - [Contribution and attribution](#contribution-and-attribution)
  - [Document structure](#document-structure)
  - [Inserting figures and other content](#inserting-figures-and-other-content)
  - [Recommended VS Code extensions for creating and editing manuals](#recommended-vs-code-extensions-for-creating-and-editing-manuals)
    - [Markdown All in One](#markdown-all-in-one)
    - [markdownlint](#markdownlint)

---

## Outline

This folder contains a collection of best-practice routines and guidelines for research @AG.DPP. To contribute, just edit existing documents or create new ones on your own. Make sure to adhere to the formatting guidelines outlined below.

## Contribution and attribution

If you created a manual or contributed to it in a substantial way, you are a contributor and the manual's content can and will be attributed to you (including all possibly erroneous statements and inaccuracies). If you are able and willing to take responsibility for a manual's content, list your name and contact info in the header of the document. If someone has helped you to understand the issues you are going to elaborate on but did not directly contribute to your manual, ask this person whether they want to be listed as contributor (with full attribution to its contents including its errors) or give credit:

```markdown
# Document title

[Contributor name](mailto:contributor@affiliation)<br>
Affiliation

Credit goes to<br> 
Name (Affiliation)

Date of last edit

---

## Table of contents

- [Document title](#document-title)
  - [Outline](#outline)
  - [Introduction](#introduction)

## Outline

...

## Introduction

...

```

## Document structure

If your manual is going to be rather short, a one page manual will most likely be the best option (see manual on [Meta-Analysis](https://github.com/alex-strobel/DPP-LabManual/blob/main/Research/Analysis/Methods/Meta-Analysis/Meta_Analysis.md)). If you assume it to be a longer document, consider to split it in several shorter documents (see manual on [Workflow research projects](https://github.com/alex-strobel/DPP-LabManual/blob/main/Research/Analysis/Methods/Meta-Analysis/Workflow_research_projects)). In both cases, provide a Table of Contents at the top of a one page manual or in the root page page of a multiple page manual. In the case of a one page manual, link the contents to anchors on the same page like this (and ideally provide some link that directs back to the Table of Contents):

```markdown
## Table of contents

- [Document title](#document-title)
  - [Section 1](#section-1)<br>
  - [Section 2](#section-2)

## Section 1

...


[up](#table-of-contents)

## Section 2

...

[up](#table-of-contents)


```

Having installed the [Markdown All in One](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one) extension, you can auto-generate a Table of Contents. Just add a second level heading Table of Contents to your markdown document, type the document title as first entry, then hit enter and save the document. This automatically inserts the document structure as Table of Contents. 

In the case of a multiple page manual, create a root document called `00_Manual_name.md` (or perhaps better create a `README.md` as root page), give a general outline of the manual and provide the Table of Contents, linking to the subdocuments like this:

```markdown
## Table of Contents

- [Section 1](01_Section-1.md)
- [Section 2](02_Section-2.md)
- [Section 3](03_Section-3.md)

...

```

At the end of each subdocument, insert links that lead back to the Table of Contents and ideally also to the previous and the next document of your manual. For the Section 2 document of your manual, this would look like this:

```markdown
---

[**Table of Contents**](00_Manual_name.md) | [back to **Section 1**](01_Section-1.md) | [next to **Section 3**](03_Section-2.md)

```

## Inserting figures and other content

To avoid indiosyncratic naming conventions for folders containing, e.g., images or other content that you want to display in or link to your manual, add a subfolder `Resources` to your manual's root folder.

## Recommended VS Code extensions for creating and editing manuals

### Markdown All in One

[Markdown All in One](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one) comes with a number of handy tools to make working on markdown documents easier. 
Its features include:

- auto-formatting of text and tables
- auto-completion of references
- including formulae in markdown documents

### markdownlint

[markdownlint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint) marks so-called markdownlint violations in a markdown document, i.e., instances that deviate from agreed-upon conventions on how to format markdown documents.
It also informs you what the respective issue is and offers you to fix the violation.
Using markdownlint greatly improves coding and collaboration in markdown documents.

<!-- main_AG
Außerdem hatten wir überlegt, für uns relevante Paper zu nennen oder Paper, die wir oft zitieren, kurz zu beschreiben (was ist das Wichtige für uns, warum beziehen wir uns darauf?) Vgl. annotated reading list
- Schönbrodt & Perugini (2013) At what sample size do correlations stabilize?
- Kretzschmar & Gignac (2019) At what sample size do latent variable correlations stabilize? 
- Campbell & Fiske (1959) CONVERGENT AND DISCRIMINANT VALIDATION BY THE MULTITRAIT-MULTIMETHOD MATRIX
- Cronbach & Meehl (1955) CONSTRUCT VALIDITY IN PSYCHOLOGICAL TESTS
-->

