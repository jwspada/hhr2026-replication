// Filename: main.do
// Author: Joseph Spada
// Description: main code file

clear all

*** INSTALLATIONS ***

*** GLOBALS ***
global path "C:\Users\jspada\Dropbox\tcja\tcja_project\hhr2026_replication" // update this with user's path
global code "${path}\code"
global data "${path}\data"
global output "${path}\output"

*** CLEAN DATA ***
do "${code}\clean_data.do"

*** REGRESSIONS ***
do "${code}\regressions.do"

*** ROBUSTNESS ***
do "${code}\robustness.do"

*** FIGURES AND TABLES ***
do "${code}\figures.do"


