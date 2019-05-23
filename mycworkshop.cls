%% mycworkshop.cls
%% Copyright 2019 David Purton
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
% 
% The Current Maintainer of this work is David Purton.
%
% This work consists of the file mycworkshop.cls
\ProvidesClass{mycworkshop}[2019/05/23 MYC Booklet Workshop Outline Class (DCP)]

% must be compiled with lualatex
\RequirePackage{ifluatex}
\ifluatex\else
  \ClassError{mycworkshop}{This class must be compiled with lualatex}
\fi

% set up PDF variables
\edef\pdfminorversion{\pdfvariable minorversion}
\edef\pdfcompresslevel{\pdfvariable compresslevel}
\edef\pdfobjcompresslevel{\pdfvariable objcompresslevel}
\edef\pdfpageattr{\pdfvariable pageattr}

% don't compress PDF
\pdfminorversion=3
\pdfcompresslevel=0
\pdfobjcompresslevel=0

\LoadClass[a5paper]{article}

% required packages
\RequirePackage[asymmetric,left=17mm,right=12mm,bindingoffset=6mm,top=12mm,bottom=17mm]{geometry}
\RequirePackage[protrusion=false]{microtype}
\RequirePackage[quiet]{fontspec}
\RequirePackage[default,light,semibold,tabular]{sourcesanspro}
\RequirePackage{realscripts}
\RequirePackage{titling}
\RequirePackage{titlesec}
\RequirePackage{bibleref-parse}
\RequirePackage{enumitem}
\RequirePackage{scrextend}
\RequirePackage{atbegshi}
\RequirePackage{silence}

% suppress font size related warning
\WarningFilter*{latexfont}{Size substitutions with differences}

% set spacing
\parskip 10.8bp plus 1.2bp minus 0.8bp
\parindent 0em
\frenchspacing
\flushbottom

% no page numbers
\pagestyle{empty}

% extra space in table rows
\renewcommand*{\arraystretch}{1.4}

% set up lists
\setlist[enumerate]{
  parsep=5.4bp plus 0.6bp minus 0.4bp,
  itemsep=0bp,
  topsep=0bp,
  partopsep=0bp}
\setlist[description]{
  nosep,
  leftmargin=5mm,
  parsep=5.4bp plus 0.6bp minus 0.4bp}

% set up headings
\newlength\titledp
\newlength\titleht
\settoheight{\titleht}{\sourcesanspro\fontsize{20.075}{24.18484}\selectfont\bfseries
  ig}
\settodepth{\titledp}{\sourcesanspro\fontsize{20.075}{24.18484}\selectfont\bfseries
  ig}
\newcommand{\subtitle}[1]{%
  \gdef\@subtitle{#1}}
\newcommand{\@subtitle}{}
\renewcommand{\maketitle}{%
  \begingroup
  \setlength{\parskip}{0bp}%
  \hskip -5mm\sourcesanspro\Huge\bfseries
  \@title\vrule width 0bp height \titleht depth \titledp\par
  \hskip -5mm\sourcesansprolight\huge\mdseries
  \@subtitle\par
  \endgroup
}
\titleformat
  {\section}
  {\sourcesanspro\large\bfseries}
  {\rlap{\thesection.}}
  {5mm}
  {}
\titleformat
  {\subsection}
  {\sourcesanspro\large}
  {\rlap{\thesubsection.}}
  {7.75mm}
  {}
\titlespacing*{\section}{-5mm}{0bp}{0bp}
\titlespacing*{\subsection}{0bp}{0bp}{0bp}
\titleclass{\question}{straight}[\section]
\newcounter{question}
\renewcommand{\thequestion}{\arabic{question}}
\titleformat
  {\question}
  [block]
  {\sourcesanspro\large\itshape}
  {Q\thequestion.}
  {1.824bp plus 0.912bp minus 0.608bp}
  {}
\titlespacing*{\question}{0bp}{0bp}{0bp}

% set up font sizes
\renewcommand\tiny{%
  \@setfontsize\tiny{4bp}{5bp}}
\renewcommand\scriptsize{%
  \@setfontsize\scriptsize{5bp}{6bp}}
\renewcommand\footnotesize{%
  \@setfontsize\footnotesize{7bp}{8bp}%
  \abovedisplayskip 5bp plus 2bp minus 3bp
  \abovedisplayshortskip 0bp plus 1bp
  \belowdisplayshortskip 2bp plus 1bp minus 1bp
  \def\@listi{%
    \leftmargin\leftmargini
    \topsep 2bp plus 1bp minus 1bp
    \parsep 1bp plus 1bp minus 1bp
    \itemsep\parsep}%
  \belowdisplayskip\abovedisplayskip}
\renewcommand\small{%
  \@setfontsize\small{8bp}{9.5bp}%
  \abovedisplayskip 6bp plus 2bp minus 4bp
  \abovedisplayshortskip 0bp plus 1bp
  \belowdisplayshortskip 3bp plus 1bp minus 2bp
  \def\@listi{%
    \leftmargin\leftmargini
    \topsep 3bp plus 1bp minus 1bp
    \parsep 2bp plus 1bp minus 1bp
    \itemsep\parsep}%
  \belowdisplayskip\abovedisplayskip}
\renewcommand\normalsize{%
  \@setfontsize\normalsize{9bp}{10.8bp}%
  \abovedisplayskip 9bp plus 2bp minus 4.5bp
  \abovedisplayshortskip 0bp plus 2bp
  \belowdisplayshortskip 4.5bp plus 2bp minus 3bp
  \belowdisplayskip\abovedisplayskip
  \let\@listi\@listI}
\renewcommand\large{%
  \@setfontsize\large{9.5bp}{11.4bp}}
\renewcommand\Large{%
  \@setfontsize\Large{10bp}{12bp}}
\renewcommand\LARGE{%
  \@setfontsize\LARGE{14bp}{17bp}}
\renewcommand\huge{%
  \@setfontsize\huge{16bp}{19bp}}
\renewcommand\Huge{%
  \@setfontsize\Huge{20bp}{24bp}}
\normalsize  

% indentation environments
\newenvironment{indentblock}{%
  \begin{addmargin}[7.5mm]{0mm}%
}{%
  \end{addmargin}%
}

% set up quotations
\renewenvironment{quote}[1][]%
  {%
    \def\mycquote@ref{#1}%
    \def\empty@mycquote@ref{}%
    \ifx\empty@mycquote@ref\mycquote@ref%
      \def\mycquote@ref{}%
    \else
      \def\mycquote@ref{%
        {\unskip\nobreak\hfill\penalty50\hskip2em\hbox{}\nobreak
            \hfill(#1)\parfillskip=0bp\finalhyphendemerits=0\par}}%
    \fi
  }{%
    \mycquote@ref
  }

% adjust default rule width
\arrayrulewidth 0.4bp

% Bible verse and refernce style
\newcommand{\vs}[1]{\textsuperscript{#1}~}
\braltabbrvname
\renewcommand*{\BRperiod}{}
\renewcommand*{\BRchsep}{;\space}
\renewcommand*{\BRvsep}{,\space}
\def\br@Ecclesiastes{Eccl\BRperiod}
\def\br@SongofSongs{Song\BRperiod}
\def\br@Titus{Titus}
\def\br@Philemon{Phlm\BRperiod}

% set up PDF page boxes
\AtBeginShipout{%
  \ifodd\c@page
    \pdfpageattr{
      /ArtBox  [51.023622 48.188976 385.51181 561.25984]
    }%
  \else
    \pdfpageattr{
      /ArtBox  [34.015748 48.188976 368.50394 561.25984]
    }%
  \fi
}

\endinput
