% New NPS thesis and report style for modern LaTeX
% Simson L. Garfinkel, Dept. of Computer Science
% Modification log:
% 2011-sep-08 - slg - not many changes
% 2011-jul-10 - slg additional packages added;  caption font changed
%               to 11 on 12 rather 9 on 10
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{npsreport}[2008/10/01]

% These if statements describe the various options used by the
% npsreport package

\newif\ifnpstraditional\npstraditionalfalse
\newif\ifsignatureline\signaturelinefalse
\newif\ifnpstwoside\npstwosidefalse
\newif\ifnpsauthorindex\npsauthorindexfalse
\newif\ifnpsarticle\npsarticlefalse
\newif\ifnpsthesis\npsthesisfalse
\newif\iftwoauthors\twoauthorsfalse
\newif\ifthreeauthors\threeauthorsfalse
\newif\iffourauthors\fourauthorsfalse
\newif\iftwoadvisors\twoadvisorsfalse
\newif\iftwoadvisorsreader\twoadvisorsreaderfalse
\newif\ifnpssinglespace\npssinglespacefalse
\newif\ifclassified\classifiedfalse
\newif\ifnpsdissertation\npsdissertationfalse
\newif\iffontsizeset\fontsizesetfalse
\newif\iffontnameset\fontnamesetfalse
\newif\iffonttimesset\fonttimessetfalse
\newif\iffontarialset\fontarialsetfalse
\newif\iffontcourierset\fontcouriersetfalse
\newif\ifnpstight\npstightfalse
\newif\ifnpsindex\npsindexfalse
\newif\ifnpsacronym\npsacronymfalse

\DeclareOption{article}{\npsarticletrue}           % use article default, not report
\DeclareOption{traditional}{\npstraditionaltrue}   % make it look old way
\DeclareOption{signatureline}{\signaturelinetrue}
\DeclareOption{twoside}{\npstwosidetrue}
\DeclareOption{authorindex}{\npsauthorindextrue}   % generate an author index
\DeclareOption{thesis}{\npsthesistrue}             % is this a thesis?
\DeclareOption{twoauthors}{\twoauthorstrue}        % two students? 
\DeclareOption{threeauthors}{\threeauthorstrue}    % or three students?
\DeclareOption{fourauthors}{\fourauthorstrue}      % or four students? 
\DeclareOption{twoadvisors}{\twoadvisorstrue}      % two advisors? (but no second reader)
\DeclareOption{twoadvisorsreader}{\twoadvisorsreadertrue}      % two advisors? (AND also second reader)
\DeclareOption{classified}{\classifiedtrue}        % you're in the STBL or SCIF
\DeclareOption{singlespace}{\npssinglespacetrue}   % looks better
\DeclareOption{dissertation}{\npsdissertationtrue} % getting a phd!
\DeclareOption{tight}{\npstighttrue}               % Smaller paragraph spacing 
\DeclareOption{index}{\npsindextrue}               % have a keyword index page
\DeclareOption{acronym}{\npsacronymtrue}           % Use the acronym package

\DeclareOption{10pt}{
   \fontsizesettrue
}
\DeclareOption{11pt}{
  \PassOptionsToClass{11pt}{article}
  \PassOptionsToClass{11pt}{report}
  \fontsizesettrue
}
\DeclareOption{12pt}{
  \PassOptionsToClass{12pt}{article}
  \PassOptionsToClass{12pt}{report}
  \fontsizesettrue
}  
\iffontsizeset
  % Font size is set
\else
  \PassOptionsToClass{12pt}{article}
  \PassOptionsToClass{12pt}{report}
\fi  

\DeclareOption{times}{
  \fontnamesettrue
  \fonttimessettrue
}

\DeclareOption{arial}{
  \fontnamesettrue
  \fontarialsettrue
}

\DeclareOption{courier}{
  \fontnamesettrue
  \fontcouriersettrue
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
% Options Processing
\PassOptionsToClass{twoside}{geometry}
\PassOptionsToClass{twoside}{report}           % Options for report
\PassOptionsToClass{openright}{report}

\PassOptionsToClass{twoside}{article}          % Options for article
\PassOptionsToClass{openright}{article}

\ProcessOptions

% Now options can be used

\ifnpsdissertation              % a dissertation is automatically a thesis
  \npsthesistrue
\fi

\ifclassified
  \typeout{*********************************************}
  \typeout{******** MAKING CLASSIFIED THESIS ***********}
  \typeout{*********************************************}
  \def\ULABEL{ (U) }
\else
  \def\ULABEL{}
\fi

\ifnpsarticle
  \LoadClass{article}
\else
  \LoadClass{report}             % inherit from article so we can have
\fi

\usepackage[letterpaper,lmargin=1.10in,rmargin=1.10in,hoffset=.0in,tmargin=1in,bmargin=1.5in]{geometry}
\footskip = .5in                % margin goes from the page number
\usepackage[T1]{fontenc}        % http://tex.stackexchange.com/questions/664/why-should-i-use-usepackaget1fontenc
\usepackage{url}                % make\url work (be nice have [lowtidle])
\usepackage{eurosym}

%% Font selection
\iffontnameset
  % Font name is set
\else
  \fonttimessettrue
\fi 

\iffonttimesset
  \usepackage{mathptmx}           % print the thesis in Times
\fi

\iffontarialset
  \usepackage[scaled]{uarial}
  \renewcommand*\familydefault{\sfdefault} %% base font of the document is sans serif
\fi

\iffontcourierset
  \usepackage{courier}
  \renewcommand*\familydefault{\ttdefault} %% base font of the document is typewriter style
\fi

% Bring in the modern LaTeX packages; look at CTAN to see what each of
% these does.  Each package has a user's manual to reference for assistance.
\usepackage[utf8x]{inputenc}    % accented letters in tex files allowed
\usepackage{graphicx}           % better way to bring in graphics
\usepackage{tabularx}           % tables that expand to with width requested
\usepackage{titletoc}       % adds toc commands
\usepackage{titlesec}       % complete replacement for titles
\usepackage{fancyhdr}       % puts chapters names in footers
\usepackage{ccaption}       % control captions
\usepackage{setspace}           % enabled \doublespacing, \onehalfspacing, etc.
\usepackage{multicol}           % multiple columns; good for you!
\usepackage{fancyvrb}           % a better verbatim
\usepackage{varioref}       % provides \vref - smart referencing
\usepackage{xspace}             % provides \xspace
\usepackage{nps_sf298}           % Bring in SF298 for the documentation page
\usepackage{latexsym}           % gives \Box
\usepackage{graphicx}           % it's better
\usepackage{multirow}           % for table cells with multiple row   
\usepackage{pifont}             % fancy characters
\usepackage{remreset}           % prevent footnotes from being reset at each chapter
\usepackage{color}
\usepackage{xcolor}
\usepackage{paralist}       % {compactenum} {compactitem} environments
\usepackage{enumitem}       % No extra space before lists
\setlist{nolistsep}

%These packages recommended by students
\usepackage{float}                  % reimplementation of float package
\usepackage{cite}                   % for [5-8] reference style
\usepackage{amsmath}                % for many types of math equations
\usepackage{url}            % nice handling of URLs
% The following package allows for very nice graphics and figures
% proper usage requires additional information located at:
% http://asymptote.sourceforge.net/
% See gallery at this URL for examples
%\usepackage{asymptote}              % for graphics


% The mcode package must be separately downloaded
% we include it in the directory. It is turned off by default.
% If you turn it on, please make your own copy of npsreport.cls,
% because mcode.sty is not included in the standard LaTeX release
%\usepackage[numbered]{mcode}        % matlab code


\pagenumbering{roman}

% Control widows, orphans, and floats
\renewcommand{\topfraction}{0.90}
\renewcommand{\floatpagefraction}{0.90}
\setcounter{topnumber}{10}   % up to 10 floats at the top of the page; Should be enough
\setcounter{totalnumber}{10} % see above


% Here are some commands that will help you make more attractive LaTeX
% Notice that \etal is italicized, but not e.g., etc. , or i.e.
% Please see p. 5, Section VI, para. 3, of The IEEE Editorial Style Manual
\newcommand{\checkmark}{\Pisymbol{pzd}{52}}
\newcommand{\eg}{e.g.,\xspace}
\newcommand{\ie}{i.e.,\xspace}
\newcommand{\etc}{etc.\xspace}
\newcommand{\etal}{\emph{et al.}\xspace}
\newcommand{\naive}{na\"{\i}ve\xpsace}
\newcommand{\Naive}{Na\"{\i}ve\xspace}

% You can also insert this before paragraphs that have problems:
% \looseness -1 

\newcommand{\chapref}[1]{Chapter~\ref{#1}\xspace}
\newcommand{\chapvref}[1]{Chapter~\vref{#1}\xspace}
\newcommand{\secref}[1]{Section~\ref{#1}\xspace}
\newcommand{\secvref}[1]{Section~\vref{#1}\xspace}
\newcommand{\figref}[1]{Figure~\ref{#1}\xspace}
\newcommand{\figvref}[1]{Figure~\vref{#1}\xspace}
\newcommand{\tabref}[1]{Table~\ref{#1}\xspace}
\newcommand{\tabvref}[1]{Table~\vref{#1}\xspace}
\newcommand{\eqnref}[1]{Equation~(\ref{#1})\xspace}
\newcommand{\eqnvref}[1]{Equation~(\vref{#1})\xspace}
\newcommand{\eqnsref}[2]{Equations~(\ref{#1}) and (\ref{#2})\xspace}
\newcommand{\eqnsvref}[2]{Equations~(\vref{#1}) and (\ref{#2}) on page \pageref{#1}\xspace}
\newcommand{\appref}[1]{Appendix~\ref{#1}\xspace}
\newcommand{\appvref}[1]{Appendix~\vref{#1}\xspace}

% Good pages on LaTeX:
% http://www-h.eng.cam.ac.uk/help/tpl/textprocessing/extending_latex.html

% Define the pieces that go on the title page, abstract, SF298, and
% other pages. This is liberally borrowed from MIT Thesis guide
% 

\def\declassifydate#1{\gdef\@declassifydate{#1}} \gdef\@declassifydate{}
\def\degreedate#1{\date{#1}}
\def\prevdegrees#1{\gdef\@prevdegrees{#1}}
\def\@prevdegrees{}
\def\department#1{\gdef\@department{#1}}
\def\departmentchair#1{\gdef\@departmentchair{#1}}
\def\researchchair#1{\gdef\@researchchair{#1}}

% Provide reasonable defaults
\department{Computer Science}
\departmentchair{Peter Denning}
\researchchair{Jeffrey Paduan} % reasonable default

% If you are getting two degrees, use \and between the names.
\def\degree#1{\setbox0\hbox{#1}  %for side effect of setting \@degreeword
  \gdef\@degree{#1}}

% \and is used inside the \degree argument to separate two degrees
\def\and{\gdef\@degreeword{degrees} \par and \par}
\def\@degreeword{degree}

% Degree appreviation
\def\degreeabbreviation#1{\setbox0\hbox{#1}\gdef\@degreeabbreviation{#1}}

% \rank
\def\rank#1{\setbox0\hbox{#1}
  \gdef\@rank{#1}}
\rank{}                         % default is no rank

% \prevdegrees
\def\prevdegrees#1{\setbox0\hbox{#1}
  \gdef\@prevdegrees{#1}}

% For a second author
\def\authortwo#1{\setbox0\hbox{#1} \gdef\@authortwo{#1}} \authortwo{}
\def\ranktwo#1{\setbox0\hbox{#1} \gdef\@ranktwo{#1}} \ranktwo{}
\def\prevdegreestwo#1{\setbox0\hbox{#1} \gdef\@prevdegreestwo{#1}} \prevdegreestwo{}

% For a third author
\def\authorthree#1{\setbox0\hbox{#1} \gdef\@authorthree{#1}} \authorthree{}
\def\rankthree#1{\setbox0\hbox{#1} \gdef\@rankthree{#1}} \rankthree{}
\def\prevdegreesthree#1{\setbox0\hbox{#1} \gdef\@prevdegreesthree{#1}} \prevdegreesthree{}

% For a fourth author
\def\authorfour#1{\setbox0\hbox{#1} \gdef\@authorfour{#1}} \authorfour{}
\def\rankfour#1{\setbox0\hbox{#1} \gdef\@rankfour{#1}} \rankfour{}
\def\prevdegreesfour#1{\setbox0\hbox{#1} \gdef\@prevdegreesfour{#1}} \prevdegreesfour{}


%
% Security Banners
%

\def\securitybanner#1{\setbox0\hbox{#1} \gdef\@securitybanner{#1}}
\securitybanner{}               % default is no banner




% \distribution
\def\distribution#1{\setbox0\hbox{#1}
  \gdef\@distribution{#1}}    

% \SponsoringNotation
\def\SponsoringNotation#1{\setbox0\hbox{#1}
  \gdef\@SponsoringNotation{#1}}    

% \SignatureOne
\def\SignatureOne#1{\setbox0\hbox{#1}
  \gdef\@SignatureOne{#1}}    

% \SignatureTwo
\def\SignatureTwo#1{\setbox0\hbox{#1}
  \gdef\@SignatureTwo{#1}}    

% \SignatureThree
\def\SignatureThree#1{\setbox0\hbox{#1}
  \gdef\@SignatureThree{#1}}    

% \SignatureFour
\def\SignatureFour#1{\setbox0\hbox{#1}
  \gdef\@SignatureFour{#1}}    



% \RPTpreparedFor
\def\RPTpreparedFor#1{\setbox0\hbox{#1}
  \gdef\@RPTpreparedFor{#1}}    
\RPTpreparedFor{}               % default is prepared for nobody



% \abstract
\newcommand{\NPSabstract}{cough}
\def\abstract#1{\setbox0\hbox{#1}
  \gdef\@abstract{#1}\renewcommand{\NPSabstract}{#1}}

\def\SponsoringAgency#1{\setbox0\hbox{#1}
  \gdef\@sponsoringagency{#1}}

% \thesisadvisor
\def\thesisadvisor#1{\setbox0\hbox{#1}
   \gdef\@thesisadvisor{#1}}

% \co thesisadvisor1
\def\thesisadvisorone#1{\setbox0\hbox{#1}
   \gdef\@thesisadvisorone{#1}}

% \co thesisadvisor2
\def\thesisadvisortwo#1{\setbox0\hbox{#1}
   \gdef\@thesisadvisortwo{#1}}

\def\secondreader#1{\setbox0\hbox{#1}
   \gdef\@secondreader{#1}}

% Some useful defines
\newcommand{\tablefont}{\sffamily\fontsize{9}{10}\selectfont}


% Support for the Authorindex
% Authorindex
%
\ifnpsauthorindex
  \usepackage[small]{authorindex}
  \let\cite=\aicite
  \renewenvironment{theauthorindex}{%
    \raggedright%
    \setlength{\leftskip}{1em}%
    \setlength{\parindent}{-1em}%
    \setlength{\parskip}{0pt}%
    \def\item[##1]{\par\hspace{0mm}\ainame{##1}}
    \aisize}{\par}
  \aipagetypeorder{n}
  \def\theaipage{\arabic{page}}
\fi

% Support for the Index
\ifnpsindex
  \usepackage{makeidx}
  \makeindex
\fi

% Support for the acronym package
\ifnpsacronym
  \usepackage[printonlyused]{acronym}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% Common NPS requirements
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Table of contents control
\def\contentsname{Table of Contents}
\usepackage{tocloft}            % TOC Control
\setlength\cftparskip{2ex}
\ifnpsarticle
\else
  \setlength\cftchapindent{-3pt}
\fi

% This magic makes the word "Figure" appear in each line of the list of figures
\newlength\figurelen             % 
\settowidth\figurelen{Figure}
\addtolength\cftfignumwidth{\figurelen}
\renewcommand\cftfigpresnum{\hspace{-1.5pc}Figure }

% This magic makes the word "Table" appear in each line of the list of tables
\newlength\tablelen             % 
\settowidth\tablelen{Table}
\addtolength\cfttabnumwidth{\tablelen}
\renewcommand\cfttabpresnum{\hspace{-1.5pc}Table }

\ifnpstraditional
%
% Traditional NPS
%
  \typeout{Using traditional NPS thesis design}
  % Traditional numbering scheme
  \def\thepart          {\arabic{part}}
  \def\thechapter       {\Roman{chapter}}
  \def\thesection       {\Alph{section}}
  \def\thesubsection    {\arabic{subsection}}
  \def\thesubsubsection {\alph{subsubsection}}
  \def\theparagraph     {\arabic{paragraph}}
  \def\thesubparagraph  {\roman{subparagraph}}

  % Traditional labels to include punctuation, for toc, etc.
  \def\labelpart          {\thepart.}
  \def\labelchapter       {\thechapter.}
  \def\labelsection       {\thesection.}
  \def\labelsubsection    {\thesubsection.}
  \def\labelsubsubsection {\thesubsubsection.}
  \def\labelparagraph     {(\theparagraph)}
  \def\labelsubparagraph  {(\thesubparagraph)}
  \def\to@appendix{\global\def\ap@pen@dix{OK}% this is a flag, set at first app.
    \setcounter{chapter}{0}%
    \setcounter{section}{0}%
    \def\thechapter       {\Alph{chapter}}%
    \def\thesection       {\arabic{section}}%
    \def\thesubsection    {\alph{subsection}}%
    \def\thesubsubsection {\roman{subsubsection}}%
  }

  % Traditionally lots of things need to be in uppercase and boldL
  \def\contentsname{\textbf{TABLE OF CONTENTS}}
  \def\listfigurename{\textbf{LIST OF FIGURES}}
  \def\listtablename{\textbf{LIST OF TABLES}}
  \def\bibname{\textbf{LIST OF REFERENCES}}
  \def\indexname{\textbf{INDEX\ULABEL}}
  \def\abstractname{ABSTRACT}
  \def\figurename{Figure}
  \def\tablename{Table}
  \def\chaptername{CHAPTER}
  \def\appendixname{APPENDIX}
  \def\partname{PART}
  \def\distribname{INITIAL DISTRIBUTION LIST\ULABEL}

  \fancyhead{}                  % clear all header fields

  % Make traditional figures and tables not reset and not include the figure/table tag
  \usepackage{chngcntr}
  \@removefromreset{figure}{chapter}
  \@removefromreset{table}{chapter}
  \counterwithout{figure}{chapter}
  \counterwithout{table}{chapter}

  % Create all the heads and such
  % This is done with the titlesec package
  \titleformat{\chapter}[display] 
              {\normalfont\Large\filcenter} % {fmt}
              {\thechapter.\ }              % {label}
              {1pc}                         % {sep}
              {\vspace{-1in}\enlargethispage{-0.5in}}    % {before}

  \titleformat{\section}[block] 
              {\normalfont\Large} % {fmt}
              {\thesection.\ }    % {label}
              {1pc}               % {sep}
              {}%

  \titleformat{\subsection}[block] 
              {\normalfont} % {fmt}
              {\hspace{.5in}\thesubsection.\ }    % {label}
              {1pc}               % {sep}
              {}%

  % Control the way counters are printed
  % \renewcommand{\thefigure}{\arabic{figure}}             
  % \newcounter{figure}

  \newcommand{\NPSend}{}             

  % 
  % End Traditional NPS
  %
\else
% New NPS
  \typeout{Using new NPS thesis design}
  \setcounter{tocdepth}{1}  % only put chapters and sections in the TOC

  % These were in the {document}
  % Specify our spacings --- Turns out that we want to do this
  % after the first section is loaded
  % \titlespacing
  \titleformat{\section} {\normalfont\Large\bfseries}{\thesection}{1em}{} 
  \titleformat{\subsection} {\normalfont\large\bfseries}{\thesubsection}{1em}{} 
  \titleformat{\subsubsection} {\normalfont\normalsize\bfseries}{\thesubsubsection}{1em}{} 

  % ``The starred version kills the indention of the paragraph following the title.''
  % \titlespacing%{<command>}{<left>}{<beforesep>}{<aftersep>}[<right>]

  \titlespacing*{\chapter}{0pt}{-.5in plus 2ex}{.25in}
  \titlespacing*{\section}{0pt}{0pt plus 2ex}{-2ex plus .2ex} 
  \titlespacing*{\subsection}{0pt}{0pt plus 2ex}{-2ex plus .2ex} 
  \titlespacing*{\subsubsection}{0pt}{0pt plus 2ex}{-2ex plus .2ex} 
  \titlespacing*{\paragraph}{0pt}{0pt plus 2ex}{3pt}
  \setlength{\parskip}{2ex}
  \setlength{\parindent}{0pt}

  % Caption Control:
  % Put captions is a sanserif font, smaller, and tighter
  %
  \captionnamefont{\sffamily\fontsize{11}{12}\selectfont}
  \captiontitlefont{\sffamily\fontsize{11}{12}\selectfont}
  \setlength{\abovecaptionskip}{5pt}
  \setlength{\belowcaptionskip}{0pt}

  %
  % New, avant garde Titles (courtesy of titlesec)
  % 
  \titleformat{\chapter}[display]
              {\vskip 0\p@ \LARGE\filcenter\sffamily\titlerule[1pt]\vspace{1pt}\titlerule}
              {\MakeUppercase{\chaptertitlename} \thechapter:}     % label (not for * chapters)
              {-1pc}  % sep
              {}     % before
              [\titlerule]     % after

  %
  % table of contents
  %

  \ifnpsarticle
    \def\SECTIONBOLDFACE{\bf}
    \def\ARTICLESPACE{-1.0ex}
  \else
    \def\SECTIONBOLDFACE{} 
    \def\ARTICLESPACE{-1.8ex}
  \fi

  \contentsmargin{2.55em}
  \dottedcontents{section}[1.5em]{}{2.3em}{1pc}
  \titlecontents{section}                                 % section
            [25pt]                                    % left
            {\vspace{-1.2ex}}                         % above
            {\SECTIONBOLDFACE\contentslabel{2.3em}}   % before with label
            {\hspace*{-2.3em}}                        % before without label
            {\titlerule*[1pc]{.}\contentspage}        % filler and page

  \titlecontents{subsection}                              % section
            [25pt]                                    % left
            {\vspace{-1.8ex}}                         % above
            {\contentslabel{2.3em}}                   % before with label
            {\hspace*{-2.3em}}                        % before without label
            {\titlerule*[1pc]{.}\contentspage}        % filler and page

  \titlecontents{subsubsection}                           % subsection
            [52pt]                                    % left
            {\vspace{-1.8ex}}                         % above
            {\contentslabel{2.3em}}                   % before with label
            {\hspace*{-2.3em}}                        % before without label
            {\titlerule*[1pc]{.}\contentspage}        % filler and page

  \newcommand{\NPSend}{
    \ifnpsauthorindex
      \chapter*{Referenced Authors}
      %\addcontentsline{toc}{chapter}{Referenced Authors}
      \begin{multicols}{3}
        \printauthorindex
      \end{multicols}
    \fi
    \ifnpsindex
      \printindex
    \fi
   }

  % Sections will still be capped, but not in bold
  \def\bibname{List of References}
\fi
                

% Use this to change to appendix mode and insert ``Appendix'' into the Table of Contents
% The appendix needs to also call \chapter{title} after this command and it will have another TOC entry.
\newcommand{\NPSappendix}{
  \appendix                       % Appendix mode
  \clearpage
  \addcontentsline{toc}{chapter}{Appendix}  % Insert ``Appendix'' into TOC
  \def\chaptername{Appendix}  % not sure why this is needed, but it is
}

% Use this to change to appendix mode and insert ``Appendix: Title'' into the Table of Contents.
% The appendix does not need a \chapter (it is handled here) and the Appendix appears as a single, 
% non-numbered entry in the TOC.
\newcommand{\NPSappendixTOC}[1] {
  \appendix                       % Appendix mode
  \clearpage
  \addcontentsline{toc}{chapter}{Appendix:~#1}  % Insert ``Appendix: Title'' into TOC 
  \def\chaptername{Appendix}  % not sure why this is needed, but it is
  \chapter*{Appendix:~#1}
}

% Use this to change to appendix mode and insert ``Appendices'' into the Table of Contents.
% This is the best method to use for multiple appendices, and each will need a \chapter{title}.
% that will add additional entries into the TOC.
\newcommand{\NPSappendices}{
  \appendix                       % Appendix mode
  \clearpage
  \addcontentsline{toc}{chapter}{Appendices}  % Insert ``Appendices'' into TOC
  \def\chaptername{Appendix}  % not sure why this is needed, but it is
}


% handle THIS PAGE INTENTIONALLY LEFT BLANK if in twopage mode
% See http://www.ctan.org/tex-archive/macros/latex/contrib/fancyhdr/fancyhdr.pdf
\newcommand{\thisPageIntentionallyLeftBlank}{
  \ifnpstwoside
    \lhead{}\chead{}\rhead{}            % remove the headings 
    \vspace*{\fill} 
    \begin{center} 
      THIS PAGE INTENTIONALLY LEFT BLANK 
    \end{center} 
    \vspace*{\fill} 
    \newpage 
  \fi
}


\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else 
 \thispagestyle{fancy}
 \thisPageIntentionallyLeftBlank
 \if@twocolumn\hbox{}\newpage\fi\fi\fi
} 
\def\cleardoublepageEmpty{\clearpage\if@twoside \ifodd\c@page\else 
 \thispagestyle{empty}   
 \thisPageIntentionallyLeftBlank
 \if@twocolumn\hbox{}\newpage\fi\fi\fi
} 

\ifnpstight
  \parskip 3pt
  \parindent 1pc
\fi



%============================================
% Now let's make the cover page
%  HERE IS WHERE WE DRAW THE COVER PAGE
%============================================

\def\NPScover{
  % these commands are the first commands that run when printing
  % starts, because the \NPScover command appears first
  \pagestyle{fancy}
  \rhead{}
  \chead{}                              % Removing "\textsf{\@securitybanner}" from top banner
  \lhead{}
  \renewcommand{\headrulewidth}{0pt}
  \cfoot{\textsf{\@securitybanner} \\ \thepage}
  \renewcommand{\sf@ExtraPages}{2}                        % include for the NPS cover
  %
  % The first page; but note --- it's a title page, so it doesn't use
  % this page style
  %
  \begin{titlepage}
  \vfill
  \textbf{\sf@POReportNumber}   % if not defined, will be blank
  \begin{center}
  \includegraphics{nps_logo_3clr_cymk}
  \textbf{\huge\ifclassified\Large\fi{}\\NAVAL\\POSTGRADUATE\\SCHOOL\\}
  \vspace{2pc}
  \textbf{\large{}MONTEREY, CALIFORNIA\\}
  \vfill
  \ifnpsthesis
    \ifnpsdissertation
      \textbf{\huge DISSERTATION\\} 
    \else
      \textbf{\huge THESIS\\} 
    \fi
    ~
    \vfill
     \vspace*{\fill}
  \fi  

  % Print the box on the front page
  % 2013-05-14: Changed box rule thickness to 1pt
  \setlength{\fboxrule}{1pt}

  \framebox[4.5in][c]{
    \begin{minipage}{4.45in}
      \centering
        \textbf{\MakeUppercase{\@title}}\\
        \vspace{1pc}
        by\\
        \vspace{1pc}
        \@author\\
        \iftwoauthors
          \@authortwo\\
        \fi
        \ifthreeauthors
          \@authorthree\\
        \fi
        \iffourauthors
          \@authorfour\\
        \fi
        \vspace{1pc}
        \@date\\
        \vspace{1pc}
        \ifnpsthesis
          \begin{tabularx}{4.45in}{lXl}
            \ifnpsdissertation
                Dissertation Supervisor: & & \@thesisadvisor \\
            \else
                \iftwoadvisors
                    Thesis Co-Advisors: & \hspace{1in} & \@thesisadvisorone \\
                                        & \hspace{1in} & \@thesisadvisortwo \\
                \else
                        \iftwoadvisorsreader
                        Thesis Co-Advisors: & \hspace{1in} & \@thesisadvisorone \\
                                            & \hspace{1in} & \@thesisadvisortwo \\
                        Second Reader: &  \hspace{1in} & \@secondreader  \\
                        \else
                        Thesis Advisor: & \hspace{1in} & \@thesisadvisor \\
                        Second Reader: &  \hspace{1in} & \@secondreader  \\
                    \fi
                \fi
            \fi
          \end{tabularx}
        \fi

    \end{minipage}
  }

  \textbf{\small \@distribution}\\

  \ifnpsthesis
  \@RPTpreparedFor     %used for technical reports funded by a sponsor          
                       % define \RPTpreparedFor in main tex file when needed
  \fi
  \vfill
  \ifclassified 
     \enlargethispage{3pc}
     \vspace{-1pc}
     \begin{tabular}{p{1in}p{4in}p{1in}}
     & \center \textbf{\footnotesize DESTRUCTION NOTICE} & \\
     {\footnotesize Classified by: Multiple Sources. Declassify on \@declassifydate } &
     {\small For classified documents follow the procedure in
     DoD 5220.22m Industrial Security Manual or DoD 5220.1R Information
     Security Program Regulation (Ch. 17 of OPNAVINST 5510.1)} &
     {\footnotesize Copy \_\_\_\_ of \_\_\_\_ copies. This document contains 
     \newcounter{nps@page}{}
         {\@ifundefined{r@TotPages}%
          {{\bf ??}}%
          {\setcounter{nps@page}{\expandafter\@car\r@TotPages\@nil}
           \addtocounter{nps@page}{-\value{TotPages}}
           \addtocounter{nps@page}{\sf@ExtraPages}
           \arabic{nps@page}}}
     pages.}
     \end{tabular}
 \fi
\textsf{\@securitybanner}
  \end{center}
  \vfill
  \end{titlepage}

  \cleardoublepageEmpty
}

\def\NPSsftne{
  % Fill in items for the SF298
  \pagenumbering{roman}        % because they are weird
  \thispagestyle{empty}         % we will insert it manually
  \Title{\@title}
  \iffourauthors
    \Author{\@author, \@authortwo, \@authorthree, \@authorfour}
  \else
    \ifthreeauthors
      \Author{\@author, \@authortwo, \@authorthree}
    \else
      \iftwoauthors
        \Author{\@author, \@authortwo}
      \else
        \Author{\@author}
      \fi
    \fi
  \fi
  \PerformingOrg{Naval Postgraduate School \\ Monterey, CA 93943}  
  \DistributionStatement{\@distribution}
  \Abstract{\@abstract}
  \SponsoringAgencySF{\@sponsoringagency}
  \MakeRptDocPage
}

% LP -  bring in definitions for the disseratation signature page identifications
\def\comitteechair#1{\gdef\@comitteechair{#1}}
\def\advisorOne#1{\gdef\@advisorOne{#1}}
\def\advisorTwo#1{\gdef\@advisorTwo{#1}}
\def\advisorThree#1{\gdef\@advisorThree{#1}}
\def\advisorFour#1{\gdef\@advisorFour{#1}}
\def\assocprovost#1{\gdef\@assocprovost{#1}}

\def\NPSthesistitle{
  \setcounter{page}{3}          % do not reset to page 1
  \thispagestyle{fancy}
  \begin{center}
    \textbf{\@distribution}

    \vfill
    \textbf{\MakeUppercase{\@title}}

    \vfill
    \@author~\\
    \@rank~\\
    \@prevdegrees\\

    \iftwoauthors
      \vspace{1pc}
      \@authortwo~\\
      \@ranktwo~\\
      \@prevdegreestwo
    \fi

    \vfill
    Submitted in partial fulfillment of the\\
    requirements for the degree of\\
    \vfill
    \textbf{\MakeUppercase{\@degree}}\\
    \vfill
    from the\\
    \vfill
    \textbf{NAVAL POSTGRADUATE SCHOOL}\\
    \textbf{\@date}
  \end{center}

  \ifnpsdissertation 
     \newcommand{\sigspace}{1.5pc}
      \vspace{\sigspace}
      \begin{tabular}{p{1in}p{2in}p{0.25in}p{2in}}
      \cline{2-3}
        Author: & \@author & &\\
       \end{tabular}

      \vspace{\sigspace}
      \begin{tabular}{p{1in}p{2in}p{0.25in}p{2in}}
      \cline{2-2}
      \cline{4-4}
      Approved by: & \@thesisadvisor       &    & \@comitteechair \\
                   & Dissertation Advisor  &    & Dissertation Committee Chair \\
      \end{tabular}

      \vspace{\sigspace}
      \begin{tabular}{p{1in}p{2in}p{0.25in}p{2in}}
      \cline{2-2}
      \cline{4-4}
            & \@advisorOne  &   & \@advisorTwo\\
            & Advisor   &       & Advisor\\
      \end{tabular}

      \vspace{\sigspace}
      \begin{tabular}{p{1in}p{2in}p{0.25in}p{2in}}
      \cline{2-2}
      \cline{4-4}
            & \@advisorThree    &   & \@advisorFour\\
            & Advisor       &   & Advisor\\
      \end{tabular}

      \vspace{\sigspace}
      \begin{tabular}{p{1in}p{2in}p{0.25in}p{1.75in}}
      \cline{2-4}
       Approved by: & \@departmentchair  \\
            & \multicolumn{2}{l}{Chair, \@department} & \\
      \end{tabular}

      \vspace{\sigspace}
      \begin{tabular}{p{1in}p{2in}p{0.25in}p{1.75in}}
      \cline{2-4}
      Approved by: & \@assocprovost & &\\
                       & \multicolumn{2}{l}{Associate Provost for Academic Affairs} \\
      \end{tabular}
  \else  
    \iftwoadvisors
      \newcommand{\sigspace}{.4in}

      \begin{tabbing}
       \hspace{2.5in}\=\\[\sigspace]       % Set the tabs

      \iftwoauthors
      \hspace{.5in} Authors: \> \@author \\[\sigspace]
               \> \@authortwo\\[\sigspace]
      \else
      \hspace{.5in} Author: \> \@author \\[\sigspace]
      \fi
  
      \hspace{.5in} Approved by:   \> \@thesisadvisorone \\
                     \> Thesis Co-Advisor \\[\sigspace]

                     \> \@thesisadvisortwo \\
                     \> Thesis Co-Advisor \\[\sigspace]

                     \> \@departmentchair \\
                     \>  Chair, \@department \\
      \end{tabbing}
    \else
    \iftwoadvisorsreader
      \newcommand{\sigspace}{.4in}

      \begin{tabbing}
       \hspace{2.5in}\=\\[\sigspace]       % Set the tabs

      \iftwoauthors
      \hspace{.5in} Authors: \> \@author \\[\sigspace]
               \> \@authortwo\\[\sigspace]
      \else
      \hspace{.5in} Author: \> \@author \\[\sigspace]
      \fi

      \hspace{.5in} Approved by:   \> \@thesisadvisorone \\
                     \> Thesis Co-Advisor \\[\sigspace]

                     \> \@thesisadvisortwo \\
                     \> Thesis Co-Advisor \\[\sigspace]

                     \> \@secondreader \\
                     \> Second Reader \\[\sigspace]

                     \> \@departmentchair \\
                     \>  Chair, \@department \\
      \end{tabbing}
\else
      \newcommand{\sigspace}{.65in}

      \begin{tabbing}
       \hspace{2.5in}\=\\[\sigspace]       % Set the tabs

      \iftwoauthors
      \hspace{.5in} Authors: \> \@author \\[\sigspace]
               \> \@authortwo\\[\sigspace]
      \else
      \hspace{.5in} Author: \> \@author \\[\sigspace]
      \fi

      \hspace{.5in} Approved by:   \> \@thesisadvisor \\
                     \> Thesis Advisor \\[\sigspace]

                     \> \@secondreader \\
                     \> Second Reader \\[\sigspace]

                     \> \@departmentchair \\
                     \>  Chair, \@department \\
      \end{tabbing}
          \fi
  \fi
  \cleardoublepage
}

\newif\ifNPSabstractWasPrinted\NPSabstractWasPrintedfalse
\def\NPSabstractpage{
  \begin{center}
  \textbf{{\large ABSTRACT\ULABEL}}\\
  \end{center}
  \begin{minipage}{\textwidth}
  \vspace{2pc}
  \onehalfspacing                 % a really bad idea, but apparently required
  \ifnpstraditional\hspace{.5in}\fi % indent if traditional
  \@abstract
  \end{minipage}
  \singlespacing                % back to single spacing
  \NPSabstractWasPrintedtrue
  \cleardoublepage
}

\def\NPSfrontmatter{
  \ifnpstraditional
  \else
    \lhead{\nouppercase{\rightmark}} % don't use upper-case headers
    \rhead{\nouppercase{\leftmark}}  % must appear after \pagestyle command
  \fi
  \singlespacing
}

\newcommand{\NPSexecsummary}[1]{
  \chapter*{Executive Summary\ULABEL}
  \onehalfspacing
  #1
}


\newcommand{\NPSacknowledgements}[1]{
  \chapter*{Acknowledgements\ULABEL}
  \onehalfspacing
  #1
}

\newcommand{\NPSsignature}{
  \thispagestyle{empty}
  \renewcommand{\sf@ExtraPages}{4}      % include for the NPS cover
  \begin{center}
  \textbf{NAVAL POSTGRADUATE SCHOOL\\Monterey, California 93943-5000}
  \end{center}

  \begin{tabular}{p{2.5in}p{2.5in}}
  Daniel T. Oliver & Leonard A. Ferrari \\
  President        & Executive Vice President and Provost \\
  \\
  \\
  \multicolumn{2}{p{6.25in}}{\@SponsoringNotation}\\
  \\
  \multicolumn{2}{p{6.25in}}{\@distribution}\\
  \\
  This report was prepared by:\\
  \\
  \\
  \\
  \\
  \@SignatureOne   & \iftwoauthors \@SignatureTwo \fi \\[-2pc]
  \rule{2in}{1pt} & \iftwoauthors \rule{2in}{1pt} \fi\\
  \@author        & \@authortwo\\
  \@rank          & \@ranktwo\\
  \\
  \ifthreeauthors
  \@SignatureThree & \iffourauthors \@SignatureFour \fi \\[-2pc]
  \rule{2in}{1pt} & \iffourauthors \rule{2in}{1pt} \fi\\
  \@authorthree        & \@authorfour\\
  \@rankthree          & \@rankfour\\
  \fi

  \\
  \\
  Reviewed by: & Released by:\\
  \\
  \\
  \\
  \rule{2in}{1pt} & \rule{2in}{1pt}\\
  \@departmentchair        & \@researchchair\\
  Chairman of \@department & Vice President and Dean of Research
  \end{tabular}
  \newpage
  \thisPageIntentionallyLeftBlank
}

\newcommand{\NPSbody}{
  \renewcommand{\topfraction}{0.99}
  %\renewcommand{\textfracton}{0.10}
  \renewcommand{\floatpagefraction}{0.99}
  \ifnpssinglespace
     \singlespace
     \ifnpstight
        \titlespacing*{\section}{0pt}{6pt plus 1ex}{0pt}
        \titlespacing*{\subsection}{0pt}{6pt plus 1ex}{0pt}
        \titlespacing*{\subsubsection}{0pt}{6pt plus 1ex}{0pt}
     \fi
  \else
     \onehalfspacing
  \fi
  \cleardoublepage
  \pagenumbering{arabic}

  \ifNPSabstractWasPrinted
    % do not print the abstract
  \else
    \begin{center}\textbf{\abstractname\ULABEL}\end{center}
    \begin{quotation}
    \@abstract
    \end{quotation}
  \fi
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Special Commands Sections
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\NPStableOfContents}{
\ifnpsarticle
  \section*{\contentsname\ULABEL}
\else
  \chapter*{\contentsname\ULABEL}
\fi
  \lhead{}\rhead{}
  \def\contentsname{}           % clear, because it will be in the header
  \thispagestyle{fancy}\tableofcontents\cleardoublepage
}

\newcommand{\NPSlistOfFigures}{
  \chapter*{\listfigurename\ULABEL}
  %\addcontentsline{toc}{chapter}{List of Figures}
  \lhead{}\rhead{}
  \def\listfigurename{}
  \thispagestyle{fancy}\listoffigures\cleardoublepage
}

\newcommand{\NPSlistOfTables}{
  \lhead{}\rhead{}
  \chapter*{\listtablename\ULABEL}
  %\addcontentsline{toc}{chapter}{List of Tables}
  \def\listtablename{}
  \thispagestyle{fancy}\listoftables\cleardoublepage
}

\newcommand{\NPSlistOfAcronyms}[1]{
  \lhead{}\rhead{}
  \chapter*{List of Acronyms and Abbreviations\ULABEL}
  \addcontentsline{toc}{chapter}{List of Acronyms and Abbreviations}
  \def\listacronymname{List of Acronyms and Abbreviations}
  \thispagestyle{fancy}
  #1
  \cleardoublepage
}

\newcommand{\NPSlistOfAcronymsFromFile}[1]{
  \lhead{}\rhead{}
  \chapter*{List of Acronyms and Abbreviations\ULABEL}
  %\addcontentsline{toc}{chapter}{List of Acronyms and Abbreviations}
  \def\listacronymname{List of Acronyms and Abbreviations}
  \thispagestyle{fancy}\input{#1}\cleardoublepage
}

\def\bibname{\textbf{REFERENCES\ULABEL}}



%
% Simson Garfinkel's layout routines
% From this PhD Thesis

\newcommand{\minipagegraphic}[2]{
  \begin{minipage}{#1\textwidth}
  \includegraphics[width=\textwidth]{#2}
  \end{minipage}
}

% \sgraphic[optional width=8in]{filename}{caption}
% Then use \figref{filename} to get a reference to the figure
\newcommand{\sgraphic}[3][width=\linewidth]{
  \begin{figure}
  \begin{center}
  \fbox{\includegraphics[#1]{#2}}
  \end{center}
  \caption{#3\label{#2}}
  \end{figure}
}

% \sgraphicb[optional width=8in]{filename}{caption}
% \sgraphicb is like sgraphic, but may put it at the bottom of the page
\newcommand{\sgraphicb}[3][width=\linewidth]{
  \begin{figure}
  \begin{center}
  \fbox{\includegraphics[#1]{#2}}
  \end{center}
  \caption{#3\label{#2}}
  \end{figure}
}

% \sgraphicn[optional width=8in]{filename}{caption}
% \sgraphicn is like sgraphic, but does not put a box around the graphic
\newcommand{\sgraphicn}[3][width=\textwidth]{
  \begin{figure}
  \begin{center}
  \includegraphics[#1]{#2}
  \end{center}
  \caption{#3\label{#2}}
  \end{figure}
}

% \sgraphico[optional width=8in]{filename}{caption}
% \sgraphico is like sgraphic, but it doesn't create a figure
\newcommand{\sgraphico}[3][width=\textwidth]{
  \begin{center}
  \fbox{\includegraphics[#1]{#2}}
  \end{center}
%  \caption{#3\label{#2}}
}

% \sgraphicon[optional width=8in]{filename}{caption}
\newcommand{\sgraphicon}[3][width=\textwidth]{
  \begin{center}
  \includegraphics[#1]{#2}
  \end{center}
%  \caption{#3\label{#2}}
}


% \twofigures{width1}{imagefile1}{caption1}
%            {width2}{imagefile2}{caption2}
\newcommand{\twofigures}[6]{
  \begin{figure}
    \begin{tabularx}{\textwidth}{p{#1}Xp{#4}}
  \includegraphics[width=#1]{#2} &&
  \includegraphics[width=#4]{#5} \\
  \caption{#3\label{#2}} &&
  \caption{#6\label{#5}} \\
\end{tabularx}
\end{figure}
}

% \twoimages{imagefile1}{imagefile2}{caption}
\newcommand{\twoimages}[3]{
  \begin{figure}
  \includegraphics[width=.5\textwidth]{#1} 
  \hspace{1pc}
  \includegraphics[width=.5\textwidth]{#2} 
  \caption{#3\label{#1}}
  \end{figure}
}

% \sidebyside[placementidentifier]{contents1}{contents2}{caption}{label}
% figure side by side
% see http://en.wikibooks.org/wiki/LaTeX/Floats,_Figures_and_Captions#Figures
% for placement identifiers.
% Contents is a placeholder for an image, text, etc.
\newcommand{\sidebyside}[5][ht]{
  \begin{figure*}[#1]
    \begin{minipage}[t]{.45\columnwidth}
      #2
    \end{minipage}
    \hfill
    \begin{minipage}[t]{.45\columnwidth}
      #3
    \end{minipage}
    \caption{#4\label{#5}}
  \end{figure*}
}

% \tsidebyside[placementidentifier]{contents1}{contents2}{caption}{label}
% table side by side
% see http://en.wikibooks.org/wiki/LaTeX/Tables#The_table_environment_-_captioning_etc
% for placement identifiers.
% Contents is a placeholder for an image, text, etc.
\newcommand{\tsidebyside}[5][ht]{
  \begin{table*}[#1]
    \begin{minipage}[t]{.45\columnwidth}
      #2
    \end{minipage}
    \hfill
    \begin{minipage}[t]{.45\columnwidth}
      #3
    \end{minipage}
    \caption{#4\label{#5}}
  \end{table*}
}

% \threesidebyside[placementidentifier]{contents1}{contents2}{contents3}{caption}{label}
% figure side by side
% see http://en.wikibooks.org/wiki/LaTeX/Floats,_Figures_and_Captions#Figures
% for placement identifiers.
% Contents is a placeholder for an image, text, etc.
\newcommand{\threesidebyside}[6][ht]{
  \begin{figure*}[#1]
    \begin{minipage}[t]{.31\columnwidth}
      #2
    \end{minipage}
    \hfill
    \begin{minipage}[t]{.31\columnwidth}
      #3
    \end{minipage}
    \hfill
    \begin{minipage}[t]{.31\columnwidth}
      #4
    \end{minipage}
    \caption{#5\label{#6}}
  \end{figure*}
}


\endinput
