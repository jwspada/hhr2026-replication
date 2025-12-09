This is a replication package for the paper Hartley, Hassett, Rauh (2026) "Firm Investment and the User Cost of Capital: New U.S. Corporate Tax Reform Evidence".

Replication Steps:

1) run "prep_data.py" to clean BEA asset level investment and capital stock data
2) run "main.do", which calls upon:
    a) "clean_data.do" to build the final asset-level panel with user cost, tax, and investment metrics
    b) "regressions.do" which runs all regressions and creates coefficent figures
    c) "figures.do" which creates descriptive figures
