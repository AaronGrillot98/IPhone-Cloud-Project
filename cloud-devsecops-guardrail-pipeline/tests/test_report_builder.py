from pathlib import Path

import pytest

from src.report_builder import build_markdown_report, load_findings, save_report, summarize_findings


def test_load_findings():
    findings = load_findings("sample-data/security_findings.json")
    assert len(findings) >= 4
    assert findings[0]["id"].startswith("FINDING-")


def test_summarize_findings():
    findings = load_findings("sample-data/security_findings.json")
    summary = summarize_findings(findings)
    assert summary["total"] == len(findings)
    assert summary["highest_severity"] == "CRITICAL"


def test_build_markdown_report_contains_key_sections():
    findings = load_findings("sample-data/security_findings.json")
    report = build_markdown_report(findings)
    assert "Executive Summary" in report
    assert "Findings" in report
    assert "Interview Talking Point" in report


def test_save_report(tmp_path):
    output = tmp_path / "report.md"
    result = save_report("# Test Report", str(output))
    assert Path(result).exists()
    assert output.read_text(encoding="utf-8") == "# Test Report"


def test_missing_findings_file_raises():
    with pytest.raises(FileNotFoundError):
        load_findings("sample-data/not-real.json")
