# Author: Joseph Spada
# Description: this is the main python file which calls upon the cleaing and cost of capital calculator scripts

import subprocess
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[1]

def run(script_relpath: str):
    script = REPO_ROOT / script_relpath
    print(f"\n=== Running: {script_relpath} ===")
    subprocess.run([sys.executable, str(script)], check=True)

def main():
    # 1) prepare bea capital and investment data
    run("code/prep_data.py")

    # 2) calculate UCC for each specification
    run("code/run_ccc_baseline.py")
    run("code/run_ccc_qbi.py")
    run("code/run_ccc_tauonly.py")
    run("code/run_ccc_qbi_tauonly.py")
    run("code/run_ccc_bonusonly.py")

if __name__ == "__main__":
    main()