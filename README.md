This is a replication package for the paper Hartley, Hassett, Rauh (2026) "Firm Investment and the User Cost of Capital: New U.S. Corporate Tax Reform Evidence".

This paper uses the Cost-of-Capital-Calculator to generate user cost data (https://ccc.pslmodels.org/). Do not install the Cost-of-Capital-Calculator separately. This repository contains modified snapshots (code/ccc_models/) to implement the specifications used in the paper. Each CCC runner script prints the path of the imported ccc module for verification.

Replication Steps:

0) Create and set up environment (Windows)
    - From the repository root, run the following lines in the command prompt:
        - python -m venv .venv
        - .\\.venv\Scripts\activate
        - python -m pip install --upgrade pip
        - python -m pip install -r requirements.txt
    
1) Clean BEA investment and capital data and generate user cost data (Python)
    - from repository root, in the command prompt run "python code/main.py", which calls upon:
        - "prep_data.py" to clean and prepare BEA asset level investment and capital stock data
        - "run_ccc_baseline.py" to run the baseline CCC spec and output user costs
        - "run_ccc_qbi.py" to run the QBI CCC spec and output user costs
        - "run_ccc_tauonly.py" to run the tau only CCC spec and output user costs
        - "run_ccc_qbi_tauonly.py" to run the QBI tau only CCC spec and output user costs
        - "run_ccc_bonusonly.py" to run the bonus only CCC spec and output user costs

    Generated user cost outputs are written to: data/ucc/<spec_name>/
     
2) Run empirical analysis and generate tables/figures (Stata):  
    - in STATA, run "main.do", which calls upon:
        - "clean_data.do" to build the final asset-level panel with user cost, tax, and investment/capital variables
        - "regressions.do" to run all regressions and create coefficient figures
        - "figures.do" to create descriptive figures

    Outputs (tables/figures) are written to: output/
