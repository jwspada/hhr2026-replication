This is a replication package for the paper Hartley, Hassett, Rauh (2026) "Firm Investment and the User Cost of Capital: New U.S. Corporate Tax Reform Evidence".

Replication Steps:

1) from your root directory, in terminal run "python code/main.py", which calls upon
    - "prep_data.py" to clean and prepare BEA asset level investment and capital stock data
    - "run_ccc_baseline.py" to run the baseline CCC spec and output user costs
    - "run_ccc_qbi.py" to run the QBI CCC spec and output user costs
    - "run_ccc_tauonly.py" to run the tau only CCC spec and output user costs
    - "run_ccc_qbi_tauonly.py" to run the QBI tau only CCC spec and output user costs
    - "run_ccc_bonusonly.py" to run the bonus only CCC spec and output user costs
2) in STATA, run "main.do", which calls upon:
    - "clean_data.do" to build the final asset-level panel with user cost, tax, and investment/capital variables
    - "regressions.do" to run all regressions and create coefficent figures
    - "figures.do" to create descriptive figures
