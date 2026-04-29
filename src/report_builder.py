"""Build a simple markdown security report from sample findings."""

from __future__ import annotations

import argparse
import json
from collections import Counter
from pathlib import Path
from typing import Dict, List


SEVERITY_ORDER = ["CRITICAL", "HIGH", "MEDIUM", "LOW"]


def load_findings(path: str) -> List[Dict[str, str]]:
    findings_path = Path(path)
    if not findings_path.exists():
        raise FileNotFoundError(f"Findings file not found: {path}")

    data = json.loads(findings_path.read_text(encoding="utf-8"))
    if not isinstance(data, list):
        raise ValueError("Findings JSON must contain a list of findings.")

    required = {"id", "title", "severity", "area", "risk", "remediation"}
    for finding in data:
        missing = required.difference(finding)
        if missing:
            raise ValueError(f"Finding is missing required fields: {sorted(missing)}")

    return data


def summarize_findings(findings: List[Dict[str, str]]) -> Dict[str, object]:
    severity_counts = Counter(finding["severity"].upper() for finding in findings)
    area_counts = Counter(finding["area"] for finding in findings)

    highest = "LOW"
    for severity in SEVERITY_ORDER:
        if severity_counts.get(severity, 0):
            highest = severity
            break

    return {
        "total": len(findings),
        "highest_severity": highest,
        "severity_counts": dict(severity_counts),
        "area_counts": dict(area_counts),
    }


def build_markdown_report(findings: List[Dict[str, str]]) -> str:
    summary = summarize_findings(findings)

    lines = [
        "# Generated Cloud Guardrail Report",
        "",
        "## Executive Summary",
        "",
        f"- Total findings: {summary['total']}",
        f"- Highest severity: {summary['highest_severity']}",
        f"- Severity counts: {summary['severity_counts']}",
        f"- Area counts: {summary['area_counts']}",
        "",
        "## Findings",
        "",
    ]

    for finding in findings:
        lines.extend([
            f"### {finding['id']} — {finding['title']}",
            "",
            f"- Severity: {finding['severity']}",
            f"- Area: {finding['area']}",
            f"- Source: {finding.get('insecure_file', 'N/A')}",
            f"- Risk: {finding['risk']}",
            f"- Remediation: {finding['remediation']}",
            "",
        ])

    lines.extend([
        "## Interview Talking Point",
        "",
        "This report shows how CI/CD guardrails turn cloud security checks into repeatable evidence. "
        "Instead of relying only on manual review, the pipeline can identify risky infrastructure patterns before deployment.",
    ])

    return "\\n".join(lines)


def save_report(markdown: str, output_path: str) -> str:
    output = Path(output_path)
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(markdown, encoding="utf-8")
    return str(output)


def main() -> None:
    parser = argparse.ArgumentParser(description="Generate a cloud guardrail markdown report.")
    parser.add_argument("--findings", default="sample-data/security_findings.json")
    parser.add_argument("--output", default="reports/generated-guardrail-report.md")
    args = parser.parse_args()

    findings = load_findings(args.findings)
    report = build_markdown_report(findings)
    output = save_report(report, args.output)

    print("Cloud Guardrail Report Generated")
    print("=" * 44)
    print(f"Findings loaded: {len(findings)}")
    print(f"Output: {output}")


if __name__ == "__main__":
    main()
