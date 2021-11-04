%%%%%%%%%%%%   CREDITS, ACKNOWLEDGMENTS, ETC.  %%%%%%%%%%
%%  This is adapted from file `report.cls', generated with the docstrip utility.
%%  The original source files were: classes.dtx  (with options: `report') which gave a generated file.
%%  Copyright 1993 1994 1995 1996 1997 1998 1999 2000
%%  The LaTeX3 Project and any individual authors listed elsewhere in this file.
%%  The file `report.cls' was generated from file(s) of the LaTeX base system.
%%  --------------------------------------------------------------
%%  This file, like `report.cls', may be distributed and/or modified under the
%%  conditions of the LaTeX Project Public License, either version 1.2 of this 
%%  license or (at your option) any later version. The current version is in
%%	http://www.latex-project.org/lppl.txt
%%  Version 1.2 or later is part in LaTeX distributions post-1999/12/01.
%%  This file may be distributed as you wish, if you include the above link.
%%  The list of the LaTeX base distribution is given in the file `manifest.txt'. 
%%  See also `legal.txt' for additional information.
%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}
%%%%%%
%%%%%%  Additions and modifications by David E. Kephart, starting July 15, 2004
%%%%%%
%%%%%%  [1] There is a macro, "\dissertation", which must occur before the body
%%%%%%       of the dissertation (after the titlepage, dedication, acknowledgements,
%%%%%%        tableofcontents, listoftables, listoffigures, and abstract, that is!)
%%%%%%  [2] The two-column option has been eliminated.
%%%%%%
%%%%%%  Options: 
%%%%%%	1) `draft` (single-spaced, hvy horiz overflow lines)
%%%%%%	2) `finaldraft` (1.5-spaced, light horiz overflows)
%%%%%%	3) `final` (1.5-spaced, no horiz overflows, the default)
%%%%%%	4) `showlabels` (auto for draft, displays labels in margin (showlabels pkg))
%%%%%%  5) `thrmdefs` (a bunch of predefined theorem-like environments, including
%%%%%%                 "theorem"--listed below--they use small caps)
%%%%%%  5) `ams` (calls all ams pkgs)
%%%%%%  6) `bbm` (black board math lettering)
%%%%%%  7) `rsfs` (script lettering (rsfs pkg, which requires special installing))
%%%%%%  8) `times` (the default, font for entire thing)
%%%%%%  9) `arial` (the alternative font for entire thing)
%%%%%% 10) `titlepage` (pretty much required for a dissertation, and the boxes used
%%%%%%                  are listed below//for use with the "\maketitle" macro)
%%%%%% 11) `oneside`/`twoside` (standard choice...hint: they will be looking at a
%%%%%%                          onesided version when you turn this in! 1-side=default)
%%%%%% 12) `openany`/`openright` (standard choice...hint: only makes sense with twoside!)
%%%%%%  
%%%%%%%%%%%%%%%%%%%%% TITLEPAGE ENTRIES
%%%%%%
%%%%%% In the preamble, set the following:
%%%%%%
%%%%%%   \title{`full length title`} 	     % of the dissertation!
%%%%%%   \author{`name`}       		     % you! do not blow it! (2 lines okay)
%%%%%%   \degree{`spelled out`}		     % what you are going for
%%%%%%   \department{`dept`} 		     % example: `Mathematics` (No Abbrev.!)
%%%%%%   \college{`college name`} 	     % example: `Arts and Sciences`
%%%%%%   \university[`U of ...`] 	     % defaults to USF. there MUST be one
%%%%%%   \majorprofessor{`name`}{`degree`}   % the major professor & his/her degree
%%%%%%   \chair{`name`}{`degree`}            % chairperson of your committee
%%%%%%   \committeemember{`name`}{`degree`}  % for each member of your committee
%%%%%%   \keyword{`key1`}{`key2`}...{`key5`} 
%%%%%% 		ALL keywords (at least 5). 
%%%%%%          If there are more than five, include them in `key5` in the form:
%%%%%%                  `key5, key6, ..., keyN`     
%%%%%%   \approvaldate{`date`} 		     % it ``was'' approved, wasn't it?
%%%%%%          Correct Format is Month Day, Year. Include it in your format check!
%%%%%%   \copyrightdate{`date`}              % intellectual property...as you wish...
%%%%%%          Correct Format is Year (only)... use the Gregorian calendar! }
%%%%%%%%%%%%%%%%%%%%% CLASS FILE STUFF
%%%%%% v.2.2b comments: cleaning up 2a, slightly, giving up on internal spacing of Table 
%%%%%%                  and Figure captions for right now...the mea culpa is included
%%%%%% v.2.2a comments: made bolding utterly consistent with USF's inconsistent
%%%%%%                  scheme, and made boldheadings affect Abstract, Chapter and 
%%%%%%                  section headings, and the labels of floats. Sorry for earlier
%%%%%%                  waffling on this, but bold is really the anathema of type-
%%%%%%                  setting!!
%%%%%% v.2.2 comments: fixed lists of tables and lists of figures to match USF's
%%%%%%                 strenuous standards; also fixed vertical spacing in lot, lof; 
%%%%%%                 also small bug (a missing \fi which hurt nothing but my 
%%%%%%                 feelings)
%%%%%% v.2.11b comments: returned "fixes" of v.2.1a to correct settings, added some noise
%%%%%% v 2.1a comments: fixed bottom page margin (should stay the same for 8.x11 _only_)
%%%%%% v 2.11 comments: fixed boldheadings to not bold ch ## in eqns
%%%%%%			added notes about tables, and a table to template file 
%%%%%% v 2.1 comments: added boldheadings option
%%%%%% v 2.0 comments: "final" made default, chapter entries in toc corrected, clean-up
%%%%%%                 generally...
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{USFDissertation}
              [2006/05/16 v2.2b University of South Florida Mathematics Department LaTeX dissertation class]
\def\men@me{USFDissertation }
\usepackage{ifthen}
\newlength{\@resetvalue}
\newlength{\h@rdreturn}
\newlength{\tempdim@}
\newcommand\@ptsize{}
\newif\if@final
\newif\if@restonecol
\newif\if@titlepage
\newif\if@showlabels
\newif\if@useams
\newif\if@usebbm
\newif\if@usersfs
\newif\if@usearial
\newif\if@thrmdefs
\newif\if@dissertation
\newif\if@openright
\newif\if@chair
\newif\if@boldabstract
\newif\if@boldchapters
\newif\if@boldsections
\newbox\tempbox@
\@dissertationfalse
%%%%%%  PAPER SIZES
\typeout{\men@me: Setting paper size}
\DeclareOption{a4paper}
   {\setlength\paperheight {297mm}%
    \setlength\paperwidth  {210mm}}
\DeclareOption{a5paper}
   {\setlength\paperheight {210mm}%
    \setlength\paperwidth  {148mm}}
\DeclareOption{b5paper}
   {\setlength\paperheight {250mm}%
    \setlength\paperwidth  {176mm}}
\DeclareOption{letterpaper}
   {\setlength\paperheight {11in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{legalpaper}
   {\setlength\paperheight {14in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{executivepaper}
   {\setlength\paperheight {10.5in}%
    \setlength\paperwidth  {7.25in}}
\DeclareOption{landscape}
   {\setlength\@tempdima   {\paperheight}%
    \setlength\paperheight {\paperwidth}%
    \setlength\paperwidth  {\@tempdima}}
\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{draft}{\setlength\overfullrule{5pt}\@finalfalse}
\DeclareOption{finaldraft}{\setlength\overfullrule{2pt}\@finaltrue}
\DeclareOption{final}{\@finaltrue\setlength\overfullrule{0pt}}
\DeclareOption{thrmdefs}{\@thrmdefstrue}
\DeclareOption{labels}{\@showlabelstrue\typeout{\men@me: Putting labels in marginpars}}%
\DeclareOption{ams}{\@useamstrue\typeout{\men@me: Using AMS option}}
\DeclareOption{bbm}{\@usebbmtrue\typeout{\men@me: Using blackboard font option}}
\DeclareOption{arial}{\@usearialtrue\typeout{\men@me: Using Arial font}}
\DeclareOption{times}{\@usearialfalse\typeout{\men@me: Using Times font}}
\DeclareOption{rsfs}{\@usersfstrue\typeout{\men@me: Enabling Ralph Smith Formal Script}}
\DeclareOption{titlepage}{\@titlepagetrue\typeout{\men@me: Enabling title page creation}}
\DeclareOption{notitlepage}{\@titlepagefalse\typeout{\men@me: NO titlepage creation}}
\DeclareOption{chair}{\@chairtrue\typeout{\men@me: Committee chair's name will appear}}
\DeclareOption{outsidechair}{\@chairfalse\typeout{\men@me: Committee chair's name will NOT appear}}
\DeclareOption{openright}{\@openrighttrue}
\DeclareOption{openany}{\@openrightfalse}
\DeclareOption{onecolumn}{\@twocolumnfalse}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{boldheadings}{\@boldabstracttrue\@boldchapterstrue\@boldsectionstrue%
\typeout{\men@me: Bolding Abstract, Chapters, Sections and Caption Labels}}
\DeclareOption{plainheadings}{\@boldabstractfalse\@boldchaptersfalse\@boldsectionsfalse%
\typeout{\men@me: NOT bolding Abstract, Chapters, Sections and Caption Labels}}
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@\relax
      }%
   \renewcommand\newblock{\par}}%
}
%%%%%%  DEFAULTS (``\ExecuteOption'' options)
\ExecuteOptions{final,letterpaper,oneside,openany,titlepage,11pt,outsidechair}
\typeout{\men@me: Processing options}
\ProcessOptions
\input{size1\@ptsize.clo}
%%%%%%  LAYOUT -- per USF Formatting
\setlength\h@rdreturn{.9\baselineskip}
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\setlength\topmargin{0 \p@}
\setlength\voffset{-.5in}
\setlength\hoffset{.5in}
\setlength\topmargin{0\p@}
\setlength\evensidemargin{0\p@}
\setlength\oddsidemargin{0\p@}
\setlength\marginparwidth{0\p@}
\setlength\marginparsep{0\p@}
\setlength\marginparpush{0\p@}
\setlength\textheight{8.562in}
\setlength\textwidth{6in}
\setlength\parskip{0\p@ \@plus \p@}
\setlength\leftmargin{0\p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{2}
\renewcommand\topfraction{.7}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.3}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}
\if@usersfs
  \DeclareFixedFont{\RS}{U}{rsfs}{m}{n}{10pt}
  \DeclareMathAlphabet{\mRS}{U}{rsfs}{m}{n}
\fi
\if@usearial\usepackage{arial}\else\usepackage{times}\fi
\if@useams\usepackage{amssymb,amsmath,amstext,amsopn,amsfonts}\fi
\if@usebbm\usepackage{bbm}\fi
\if@showlabels\usepackage{showlabels}\fi
%%%%%%  TWO-SIDED FULL HEADINGS
\if@twoside\typeout{\men@me: Creating twosided document}
  \def\ps@headings{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{\thepage\hfil\slshape\leftmark}%
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\markboth
    \def\chaptermark##1{%
      \markboth {
        \MakeUppercase{%
          \ifnum \c@secnumdepth >\m@ne
            \@chapapp\ \thechapter. \ %
          \fi
          ##1}}{}}%
    \def\sectionmark##1{%
      \markright {
        \MakeUppercase{%
          \ifnum \c@secnumdepth >\z@
            \thesection. \ %
          \fi
          ##1}}{}}}
%%%%%%  SINGLE-SIDED FULL HEADINGS
\else\typeout{\men@me: Using onesided page headings}
  \def\ps@headings{%
    \let\@oddfoot\@empty
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\markboth
    \def\chaptermark##1{%
      \markright {\MakeUppercase{%
        \ifnum \c@secnumdepth >\m@ne
            \@chapapp\ \thechapter. \ %
        \fi
        ##1}}}}
\fi
%%%%%%   PLAIN HEADINGS
\def\ps@myheadings{%
  \let\@oddfoot\@empty\let\@evenfoot\@empty
  \def\@evenhead{\thepage\hfil\slshape\leftmark}%
  \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
  \let\@mkboth\@gobbletwo
  \let\chaptermark\@gobble
  \let\sectionmark\@gobble
}
%%%%%% DOING A TITLE PAGE
\if@titlepage\typeout{\men@me: Creating titlepage}
  \newcommand\maketitle{%\tracingcommands=1
    \begin{titlepage}%
      \let\footnotesize\small
      \let\footnoterule\relax
      \begin{center}%
        \vspace*{\fill}%
	\begin{medoublespacing}
    	  \@title\par
	\end{medoublespacing}
  	\vspace{4\h@rdreturn}\par
    	by\par\vspace{4\h@rdreturn}\par
    	\@author\par\vspace{6\h@rdreturn}\par
    	{\small A dissertation submitted in partial fulfillment\\
          of the requirements for the degree of\\
	  \usebox{\Degree}\\
	  Department of \usebox{\Department}\\
	  College of \usebox{\College}\\
	  \usebox{\University}
	}\par\vspace{4\h@rdreturn}
	{\small	Major Professor:  \usebox{\MajorProfessor}\par%
	  \if@chair\usebox{\CommitteeChair}\par\fi%
	  \addtocounter{committeemembers}{1}
	  \whiledo{\value{usecommitteemember}<\value{committeemembers}}{%
            \ifcase\value{usecommitteemember}\or
	      \usebox{\CommitteeOne} \or\usebox{\CommitteeTwo}
	      \or\usebox{\CommitteeThree} \or \usebox{\CommitteeFour}
	      \or\usebox{\CommitteeFive} 
	      \or\usebox{\CommitteeMemberSix} 
	      \or\usebox{\CommitteeMemberSeven}
            \fi\par\addtocounter{usecommitteemember}{1}\relax
          }
	}\par\vspace{3\h@rdreturn}
	{\small	\if@showlabels Printed \par\today%
	   \else\if@final Date of Approval:\par
	     \usebox{\ApprovalDate}
	   \fi
         \fi
	}\par\vspace{4\h@rdreturn}
	{\small	\usebox{\Keywords}}\par\vspace{2\h@rdreturn}
	{\small	$\copyright$ Copyright \usebox{\CopyrightDate}, \@author}
      \end{center}
      %\vfill
    \end{titlepage}%
    \setcounter{footnote}{0}%
    \global\let\thanks\relax
    \global\let\maketitle\relax
    \global\let\@thanks\@empty
    \global\let\and\relax
  }
\else
\typeout{\men@me NO title page created}
\newcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \thispagestyle{plain}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\title\relax
  \global\let\and\relax
}
\def\@maketitle{%
  \newpage
  \null
  \vskip 1in%
  \begin{center}%
  \def\@thanks{Keywords: \usebox{\Keywords}. 
	$\copyright$ Copyright \usebox{\CopyrightDate}, \@author
	}
  \let\footnote\@thanks
  {	
		\@title \par%
    		\vskip 1.5em%
		\lineskip .5em%
      		\begin{tabular}[t]{c}%
		        \@author
		\end{tabular}\par}%
	 	\vskip 1em%
	{\small	A dissertation submitted in partial fulfillment
	of the requirements for the degree of \usebox{\Degree},
	Department of \usebox{\Department}, College of \usebox{\College}, 
	\usebox{\University}\par.

	Major Professor:  \usebox{\MajorProfessor}. Committee:\ 
	{\small	Major Professor:  \usebox{\MajorProfessor}\par
		\usebox{\CommitteeChair}\par
		\addtocounter{committeemembers}{1}
		\whiledo{\value{usecommitteemember}<\value{committeemembers}}
			{\ifcase\value{usecommitteemember}\or
			\usebox{\CommitteeOne} \or\usebox{\CommitteeTwo}
			\or\usebox{\CommitteeThree} \or \usebox{\CommitteeFour}
			\or\usebox{\CommitteeFive} 
			\or\usebox{\CommitteeMemberSix} 
			\or\usebox{\CommitteeMemberSeven}\fi
			\par%
			\addtocounter{usecommitteemember}{1}\relax}
	}\par
		\if@showlabels Printed \par\today\par%
		\else
			\if@final Date of Approval:\par\usebox{\ApprovalDate}\par\fi
		\fi
  }
  \end{center}
  \par
  \vskip 1.5em
}
\fi
%%%%% SAVEBOXES, COUNTERS and associated MACROS
\newsavebox{\MajorProfessor}
\newsavebox{\CommitteeChair}
\newsavebox{\CommitteeOne}
\newsavebox{\CommitteeTwo}
\newsavebox{\CommitteeThree}
\newsavebox{\CommitteeFour}
\newsavebox{\CommitteeFive}
\newsavebox{\CommitteeSix}
\newsavebox{\CommitteeSeven}
\newsavebox{\Degree}
\newsavebox{\Department}
\newsavebox{\College}
\newsavebox{\University}
\newsavebox{\Keywords}
\newsavebox{\ApprovalDate}
\newsavebox{\CopyrightDate}
\newcommand{\majorprofessor}[2]{\savebox{\MajorProfessor}{\small  #1, {#2}}}
\newcommand{\chair}[3][man]{\savebox{\CommitteeChair}{\small Chair#1:\ #2, {#3}}}
\newcommand{\committeemember}[2]{\ifthenelse{\value{committeemembers}=7}%
%%%%%%  NO MORE THAN SEVEN MEMBERS PER COMMITTEE!!
{\typeout{\men@ame WARNING: Too many committee members!}}%
{\ifthenelse{\value{committeemembers}=0}{\savebox{\CommitteeOne}{\small  #1,\ {#2}}}%
{\ifthenelse{\value{committeemembers}=1}{\savebox{\CommitteeTwo}{\small #1,\ {#2}}}%
{\ifthenelse{\value{committeemembers}=2}{\savebox{\CommitteeThree}{\small #1,\ {#2}}}%
{\ifthenelse{\value{committeemembers}=3}{\savebox{\CommitteeFour}{\small #1,\ {#2}}}%
{\ifthenelse{\value{committeemembers}=4}{\savebox{\CommitteeFive}{\small #1,\ {#2}}}%
{\ifthenelse{\value{committeemembers}=5}{\savebox{\CommitteeSix}{\small #1,\ {#2}}}%
{\savebox{\CommitteeSeven}{\small #1,\ {#2}}}}}}}}\addtocounter{committeemembers}{1}}}
\newcounter{committeemembers}
\newcounter{usecommitteemember}
\setcounter{committeemembers}{0}
\setcounter{usecommitteemember}{0}
\newcommand{\approvaldate}[1]{\savebox{\ApprovalDate}{\small #1}}
\newcommand{\keywords}[5]{\savebox{\Keywords}[\textwidth][l]{\parbox{\textwidth}{\small Keywords: #1, #2, #3, #4, #5}}}
\newcommand{\college}[1]{\savebox{\College}{\small #1}}
\newcommand{\department}[1]{\savebox{\Department}{\small #1}}
\newcommand{\university}[1][University of South Florida]{\savebox{\University}{\small #1}}
%%%%%% Default: University of South Florida, home of the Bulls... Right????
\newcommand{\degree}[1]{\savebox{\Degree}{\small #1}}
\newcommand{\copyrightdate}[1]{\savebox{\CopyrightDate}{\small #1}}
\newenvironment{medoublespacing}{%
  \begingroup
    \setlength{\tempdim@}{\baselineskip}
    \if@final%
      \setlength{\baselineskip}{1.66\tempdim@}
    \else
      \setlength{\baselineskip}{2\tempdim@}
    \fi
}
{\par\endgroup}
%%%%%%  SECTIONING COMMANDS
\newcommand*\chaptermark[1]{}
\setcounter{secnumdepth}{2}
\newcounter {part}
\newcounter {chapter}
\newcounter {section}[chapter]
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand \thepart {\@Roman\c@part}
\renewcommand \thechapter {\@arabic\c@chapter}
\renewcommand \thesection {\thechapter.\@arabic\c@section}
\renewcommand\thesubsection {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection .\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
\newcommand\@chapapp{\chaptername}
\newcommand\part{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \thispagestyle{plain}%
    \@tempswafalse
  \null\vfil
  \secdef\@part\@spart}
\def\@part[#1]#2{%
  \ifnum \c@secnumdepth >-2\relax
    \refstepcounter{part}%
    \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
  \else
    \addcontentsline{toc}{part}{#1}%
  \fi
  \markboth{}{}%
  {\centering
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >-2\relax
       \partname~\thepart
       \par
       \vskip 20\p@
     \fi
     \MakeUppercase{#2}\par
  }%
  \@endpart
}
\def\@spart#1{%
  {\centering
     \interlinepenalty \@M
     \normalfont
     #1\par
  }%
  \@endpart
}
\def\@endpart{%
  \vfil\newpage
  \if@twoside
     \if@openright
        \null
        \thispagestyle{empty}%
        \newpage
     \fi
  \fi
}
\newcommand\chapter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \thispagestyle{plain} % Alteration needed, here, I think
  \global\@topnum\z@
  \@afterindentfalse
  \secdef\@chapter\@schapter
}
\def\@chapter[#1]#2{%
  \ifnum \c@secnumdepth >\m@ne
    \refstepcounter{chapter}%
    \typeout{\men@me: Creating \@chapapp\space\thechapter.}%
    \addcontentsline{toc}{chapter}{\@chapapp~\thechapter\hspace{1.5em}{#1}}%
  \else
    \addcontentsline{toc}{chapter}{#1}%
  \fi
  \chaptermark{#1}%
  %\addtocontents{lof}{\protect\addvspace{10\p@}}%
  %\addtocontents{lot}{\protect\addvspace{10\p@}}%
  \@makechapterhead{#2}%
  \@afterheading
}
%%%%%%   Special Chapter Head required for a USF Dissertation...
%%%%%%       (headings in general altered to look more ``dissertation-like'')
\def\@makechapterhead#1{%
 \vspace*{3\h@rdreturn}
  \begingroup
     \begin{center}
     \ifnum \c@secnumdepth >\m@ne
     	\if@boldchapters\textbf{
          \@chapapp \space \thechapter}
          \else\@chapapp \space \thechapter\fi
          \par\nobreak
        \fi
        \interlinepenalty\@M
          \if@boldchapters\textbf{#1}\else
          #1\fi\par\nobreak 
       \end{center}\endgroup
	\vspace{2\h@rdreturn}}
\def\@schapter#1{%
  \@makeschapterhead{#1}%
  \@afterheading
}
\def\@makeschapterhead#1{%
\vspace*{3\h@rdreturn}%
  \begingroup
   \begin{center}
       \interlinepenalty\@M
       \if@boldchapters\textbf{#1}\else #1\fi\par\nobreak % 
   \end{center}\endgroup
    \vspace{2\h@rdreturn}%
}
\newcommand\section{\@startsection {section}{1}{\z@}{%
  -3.5ex \@plus -1ex \@minus -.2ex}{2.3ex \@plus.2ex}{\if@boldsections\bf\else\normalfont\fi}
} 
\newcommand\subsection{\@startsection{subsection}{2}{\z@}{%
  -3.25ex\@plus -1ex \@minus -.2ex}{1.5ex \@plus .2ex}{\if@boldsections\bf\else\normalfont\fi}
}   
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}{%
  -3.25ex\@plus -1ex \@minus -.2ex}{1.5ex \@plus .2ex}{\if@boldsections\bf\else\normalfont\fi}
}     
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}{%
3.25ex \@plus1ex \@minus.2ex}{-1em}{\if@boldsections\bf\else\normalfont\fi\normalsize}
}    
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}{%
3.25ex \@plus1ex \@minus .2ex}{-1em}{\if@boldsections\bf\else\normalfont\fi\normalsize}
}
\setlength\leftmargini  {.25in}
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\setlength\leftmarginv  {1em}
\setlength\leftmarginvi {1em}
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}
\newenvironment{description}{%
  \list{}{%
    \labelwidth\z@ \itemindent-\leftmargin\let\makelabel\descriptionlabel
  }
}
{\endlist}
\newcommand*\descriptionlabel[1]{%
  \hspace\labelsep \normalfont #1
}    
\if@titlepage
  \newenvironment{abstract}{%
    \if@openright\cleardoublepage\else\clearpage\fi
    \vspace*{3\h@rdreturn}
    \addtocontents{toc}{%
      \protect\contentsline{abstract}{\abstractname}{\thepage}
    }
    \begin{center}%
      {\if@boldabstract\bf\fi\@title}\par
      \vspace{\h@rdreturn}
      {\if@boldabstract\bf\fi\@author}\par
      \vspace{\h@rdreturn}
      \if@boldabstract\MakeBoldUppercase{\abstractname}\else\MakeUppercase\abstractname\fi%
    \end{center}
    \vspace{2\h@rdreturn}
    \begin{medoublespacing}
  }
  {\end{medoublespacing}}
\else
  \newenvironment{abstract}{%
    \begingroup\small
      \begin{center}%
        {\if@boldabstract\bf\fi\MakeUppercase\abstractname\vspace{-.5em}\vspace{\z@}}%  
      \end{center}%
      \quotation
  }
  {\endquotation\endgroup}%
\fi
\newenvironment{verse}{%
  \let\\\@centercr
  \list{}{%
    \itemsep \z@
    \itemindent   -1.5em%
    \listparindent\itemindent
    \rightmargin  \leftmargin
    \advance\leftmargin 1.5em
  }%
  \item\relax
}
{\endlist}
\newenvironment{quotation}{%
  \list{}{%
    \listparindent 1.5em%
    \itemindent    \listparindent
    \rightmargin   \leftmargin
    \parsep        \z@ \@plus\p@
  }%
  \item\relax
}
{\endlist}
\newenvironment{quote}{%
  \list{}{%
    \rightmargin\leftmargin}%
    \item\relax
  }
{\endlist}
\newenvironment{titlepage}{%
    \@restonecolfalse\newpage
    \thispagestyle{empty}%
    \setcounter{page}\@ne\relax
  }
  {\eject%\fi%\newpage \fi
       \if@twoside\else
          \setcounter{page}\@ne\relax
       \fi
}
\newcommand\appendix{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{\appendixname}%
  \gdef\thechapter{\@Alph\c@chapter}}
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\@addtoreset {equation}{chapter}
\renewcommand\theequation{%
  \ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@equation
}
\long\def\@caption#1[#2]#3{%
  \par
%  \stepcounter{\c@#1}
	\addcontentsline{\csname ext@#1\endcsname}{#1}%
    {\protect{\csname #1name\endcsname}~{\protect{\csname the#1\endcsname}}{\hspace{.15in} #2}}%
  \begingroup
    \@parboxrestore
    \if@minipage
      \@setminipage
    \fi
    \normalsize
    \@makecaption{\csname fnum@#1\endcsname}{\nobreakspace #3}\par
  \endgroup}
\newcounter{figure}
\renewcommand \thefigure{\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\nobreakspace\thefigure.}
\newenvironment{figure}{\@float{figure}}{\end@float}
\newenvironment{figure*}{\@dblfloat{figure}}{\end@dblfloat}
\newcounter{table}
\renewcommand \thetable{\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\nobreakspace\thetable}
\newenvironment{table}{\@float{table}}{\end@float}
\newenvironment{table*}{\@dblfloat{table}}{\end@dblfloat}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{\if@boldsections{\bf #1}\else #1\fi: #2}%
  \ifdim \wd\@tempboxa >\hsize
    \if@boldsections{\bf #1}\else #1\fi: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip
}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
\DeclareRobustCommand{\MakeBoldUppercase}[1]{{%
      \def\i{I}\def\j{J}%
      \def\reserved@a##1##2{\let##1##2\reserved@a}%
      \expandafter\reserved@a\@uclclist\reserved@b{\reserved@b\@gobble}%
      \protected@edef\reserved@a{\bf\uppercase{#1}}%
      \reserved@a
   }}
%%%%%% The TABLE OF CONTENTS and friends
%%%
%%% \@dottedtocline would be level (indentation), [width one]
%%% label, [width two]
%%% number, ... forming hbox to the left, [width three]
%%% title, and leaders forming vbox in the middle, [width four]
%%% page number, forming hbox to the right [width 5]
%%% it is decidedly simpler to accept \@dottedtocline as given,
%%% and instead add \hspace*'s in title to force proper alignment
%%%
%%%%%%
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{2}    \vskip 0.5em \@plus.2\p@
\newcommand\tableofcontents{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \pagenumbering{roman}
  \pagestyle{plain}
  \chapter*{\contentsname\@mkboth{\contentsname}{\contentsname}}
  \setlength\@tempparfillskip{\parfillskip}
  \setlength\@templeftskip{\leftskip}
  \setlength\@temprightskip{\rightskip}
  \@starttoc{toc}%
  \setlength\parfillskip{\@tempparfillskip}
  \setlength\leftskip{\@templeftskip}
    \vskip 0.5em \@plus.2\p@
  \setlength\rightskip{\@temprightskip}
  \typeout{\men@me: Bolded TOC}
  \newpage
}
\newcommand*\l@lot%[2]
  {%\vskip 0.5em \@plus.2\p@ -- since this is the first entry in the TOC
   \@dottedtocline{0}{0in}{2.3em}}
\newcommand*\l@lof{%
  \vskip 0.5em \@plus.2\p@\@dottedtocline{0}{0in}{2.3em}
  }
\newcommand*\l@abstract{%
  \vskip 0.5em \@plus.2\p@\@dottedtocline{0}{0in}{2.3em}
  }
\newcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{2.25em \@plus\p@}%
\newcommand\listoffigures{%
  \@restonecolfalse
  \chapter*{\listfigurename
    \addtocontents{toc}{\protect\contentsline{lof}{\listfigurename}{\thepage}}
  \@mkboth{\MakeUppercase\listfigurename}{\MakeUppercase\listfigurename}}
  \@starttoc{lof}%
  \typeout{\men@me: Bolded LOF}
}
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       { #1}\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
    \endgroup
  \fi}
\newlength{\@tempparfillskip}
\newlength{\@templeftskip}
\newlength{\@temprightskip}
\newcommand\l@chapter[2]{%
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode %\bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak%\hb@xt@\@pnumwidth{\hss #2}\par
     \leaders\hbox{$\m@th
        \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
        mu$}\hfill
     \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
}
\newcommand*\l@section{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand*\l@subsection{\@dottedtocline{2}{3.8em}{3.2em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{7.0em}{4.1em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{10em}{5em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{12em}{6em}}
\newcommand*\l@bibliography{%
  \vskip 0.5em \@plus.2\p@\@dottedtocline{0}{0in}{2.3em}
}
\newcommand*\l@bio[2]{%
  \vskip 0.5em \@plus.2\p@
  {\setlength{\parindent}{0in}{#1}\nobreak
     \leaders\hbox{$\m@th
        \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
        mu$}\hfill
     \nobreak\makebox[\width]{\normalfont #2}
   \par}
}
\newcommand*\l@table{%
  \vskip 0.5em \@plus.2\p@\@dottedtocline{0}{0in}{2.3em}
  }
\newcommand\listoftables{%
  \@restonecolfalse
  \chapter*{\listtablename
    \addtocontents{toc}{\protect\contentsline{lot}{\listtablename}{\thepage}}
  \@mkboth{\MakeUppercase\listtablename}{\MakeUppercase\listtablename}}
  \@starttoc{lot}%
  \typeout{\men@me: Bolded LOT}
}
\newcommand*\l@figure{%
  \vskip 0.5em \@plus.2\p@\@dottedtocline{0}{0in}{2.3em}
  }
\newcommand\listoffigures{%
  \@restonecolfalse
  \chapter*{\listfigurename
    \addtocontents{toc}{\protect\contentsline{lof}{\listfigurename}{\thepage}}
  \@mkboth{\MakeUppercase\listfigurename}{\MakeUppercase\listfigurename}}
  \@starttoc{lof}%
  \typeout{\men@me: Bolded LOF}
}
\newdimen\bibindent
\setlength\bibindent{1.5em}
\newenvironment{thebibliography}[1]{%
  \chapter*{\bibname
  \addtocontents{toc}{\protect\contentsline{bibliography}{\bibname}{\thepage}}
  \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}}%
  \list{\@biblabel{\@arabic\c@enumiv}}%
    {\settowidth\labelwidth{\@biblabel{#1}}%
       \leftmargin\labelwidth
       \advance\leftmargin\labelsep
       \@openbib@code
       \usecounter{enumiv}%
       \let\p@enumiv\@empty
       \renewcommand\theenumiv{\@arabic\c@enumiv}}%
     \sloppy
     \clubpenalty4000
     \@clubpenalty \clubpenalty
     \widowpenalty4000%
     \sfcode`\.\@m
    }
    {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
  \endlist
}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty
\newenvironment{theindex}{%
  \@restonecoltrue
  \columnseprule \z@
  \columnsep 35\p@
  \twocolumn[\@makeschapterhead{\indexname}]%
     \@mkboth{\MakeUppercase\indexname}{\MakeUppercase\indexname}%
     \thispagestyle{plain}\parindent\z@
     \parskip\z@ \@plus .3\p@\relax
     \let\item\@idxitem}
  {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}
\@addtoreset{footnote}{chapter}
\newcommand\@makefntext[1]{%
    \parindent 1em
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1%
}
%%%%%%%%%%%% NAMES
\newcommand\contentsname{Table of Contents}%\newcommand\contentsname{Contents}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
\newcommand\bibname{References}
\newcommand\indexname{Index}
\newcommand\figurename{Figure}
\newcommand\tablename{Table}
\newcommand\partname{Part}
\newcommand\chaptername{Chapter}
\newcommand\appendixname{Appendix}
\newcommand\abstractname{Abstract}
%%%%%%  The ones added by USFDissertation.cls
\newcommand\dedicationname{Dedication}
\newcommand\acknowledgmentsname{Acknowledgments}
\newcommand\bioname{About the Author}
%%%%%%  Environments required by USF layout:
%%%%%%    dedication (optional)		To, or In Memory Of
%%%%%%    acknowledgments (optional)	Thank yous
%%%%%%    bio (required)	        ``About the Author'' page	
\newenvironment{dedication}{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \thispagestyle{empty}
  \typeout{\men@me: Bolded \dedicationname}
  \vspace*{\h@rdreturn}
  \vfill
  \begin{center}
     \begin{minipage}{.6\textwidth}
        \begin{center}
           \bf\dedicationname
        \end{center}
        \vspace{\h@rdreturn}
%	\hspace*{\parindent}
}
{\end{minipage}\end{center}\vspace{3\h@rdreturn}\vfill\newpage}
\newenvironment{acknowledgment}{%
  \if@openright \cleardoublepage \else \clearpage \fi
  \thispagestyle{empty}
  \typeout{\men@me: Bolded \acknowledgmentsname}
  \vfill
  \begin{center}
    \bf\acknowledgmentsname
  \end{center}
  \begingroup
  \vspace{2\h@rdreturn}
}
{\endgroup}
\newenvironment{bio}{%
  \setlength{\tempdim@}{\textwidth}
  \addtolength{\tempdim@}{-\parindent}
  \newpage\thispagestyle{empty}
  \typeout{\men@me: Bolded \bioname}
  \addtocontents{toc}{\protect\contentsline{bio}{\bioname}{End Page}}
  \vspace*{\h@rdreturn}
  \vfill
  \begin{minipage}{\tempdim@}
    \begin{center}
    	\bf\bioname
    \end{center}
    \vspace{\h@rdreturn}\begin{medoublespacing}
 %   \hspace*{\parindent}
}
{\end{medoublespacing}\end{minipage}\vspace{3\h@rdreturn}\vfill}
\if@thrmdefs
\typeout{\men@me: Using stock theorem environments (see documentation)}
  \newtheorem{definition}{\normalfont\textsc{Definition}}[section]
  \newtheorem{varremark}{\normalfont\textsc{Remark}}
  \newenvironment{remark}{\begin{varremark}\em}{\em\end{varremark}}
  \newenvironment{conjecture}{\begin{varconjecture}\em}{\em\end{varconjecture}}
  \newtheorem{varproposition}{\normalfont\textsc{Proposition}}
  \newenvironment{proposition}{\begin{varproposition}\em}{\em\end{varproposition}}
  \newtheorem{varnote}{\normalfont\textsc{Note}}
  \newtheorem{varfact}{\normalfont\textsc{Fact}}
  \newenvironment{note}{\begin{varnote}\em}{\em\end{varnote}}
  \newtheorem{varconjecture}{\normalfont\textsc{Conjecture}}
  \newtheorem{varobservation}{\normalfont\textsc{Observation}}
  \newenvironment{observation}{\begin{varobservation}\em}{\em\end{varobservation}}
  \newenvironment{fact}{\begin{varfact}\em}{\em\end{varfact}}
  \newtheorem{theorem}{\normalfont\textsc{Theorem}}[chapter]
  \newtheorem{lemma}{\normalfont\textsc{Lemma}}[chapter]
  \newenvironment{proof}{%
    \noindent\textsl{Proof.}\ 
  }
  {\hspace*{\fill}\begin{math}\Box\end{math}\par\medskip}
  \newenvironment{proof*}[1]{
    \noindent\textsl{#1\ }
  }
  {\hspace*{\fill}\begin{math}\Box\end{math}\par\medskip}
  \newtheorem{corollary}{\normalfont\textsc{Corollary}}[lemma]
  \newtheorem{tcorollary}{\normalfont\textsc{Corollary}}[theorem]
  \newtheorem{pcorollary}{\normalfont\textsc{Corollary}}[varproposition]
  \newtheorem{varexample}{\normalfont\textsc{Example}}
  \newenvironment{example}{\begin{varexample}\em}{\em\end{varexample}}
\fi
%%%%%%  A REQUIRED MACRO - AT THE BEGINNING OF BODY
\newcommand{\dissertation}{\clearpage\@dissertationtrue%
  \if@final
    \renewcommand{\baselinestretch}{1.5}%
  \else
    \renewcommand{\baselinestretch}{1}%
  \fi
  \if@openright 
    \cleardoublepage%
  \else 
    \clearpage% 
  \fi
  \pagenumbering{arabic}\pagestyle{plain}
  \onecolumn\setlength\parindent{1em}\normalfont 
}
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
\endinput
%%
%% End of file `USFDissertation.cls'.
