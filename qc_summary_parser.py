#!/usr/bin/env python3
"""
QC Log Parser
Author: Narendrareddy Munagala

Description:
    Summarizes pipeline QC logs into a CSV table.
    Reads all .log files in a directory and reports status and runtime.
"""

import os
import pandas as pd
import argparse

def parse_logs(log_dir):
    records = []
    for log_file in os.listdir(log_dir):
        if log_file.endswith(".log"):
            sample = log_file.replace(".log", "")
            with open(os.path.join(log_dir, log_file)) as f:
                lines = f.readlines()
                status = "PASS" if any("completed successfully" in l.lower() for l in lines) else "FAIL"
                runtime = next((l.split(":",1)[1].strip() for l in lines if "Runtime" in l), "NA")
                records.append({"Sample": sample, "Status": status, "Runtime": runtime})
    return pd.DataFrame(records)

def main():
    parser = argparse.ArgumentParser(description="Summarize QC logs")
    parser.add_argument("--log_dir", required=True, help="Directory with .log files")
    parser.add_argument("--output", default="qc_summary.csv", help="Output CSV filename")
    args = parser.parse_args()

    df = parse_logs(args.log_dir)
    df.to_csv(args.output, index=False)
    print(f"QC summary written to {args.output}")
    print(df)

if __name__ == "__main__":
    main()
