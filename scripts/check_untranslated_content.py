#!/usr/bin/env python3

import re
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import Iterable


FORBIDDEN_PHRASES = [
    "Click Here for Video",
    "How should",
    "What should the referee",
    "The referee should",
    "When, in a match",
    "1st Referee",
    "2nd Referee",
]


@dataclass(frozen=True)
class Match:
    path: Path
    line_no: int
    phrase: str
    line: str


def iter_target_files() -> Iterable[Path]:
    roots = [
        Path("src-rules"),
        Path("docs"),
    ]

    exts = {".md"}

    for root in roots:
        if not root.exists():
            continue
        for p in root.rglob("*"):
            if p.is_file() and p.suffix in exts:
                yield p


def find_matches(path: Path, phrases: list[str]) -> list[Match]:
    try:
        content = path.read_text(encoding="utf-8")
    except UnicodeDecodeError:
        return []

    matches: list[Match] = []
    lines = content.splitlines()

    for i, line in enumerate(lines, start=1):
        for phrase in phrases:
            if phrase in line:
                matches.append(Match(path=path, line_no=i, phrase=phrase, line=line))

    return matches


def main() -> int:
    phrases = FORBIDDEN_PHRASES

    all_matches: list[Match] = []
    for path in iter_target_files():
        all_matches.extend(find_matches(path, phrases))

    if not all_matches:
        return 0

    print("Found untranslated/English markers:")
    for m in all_matches:
        snippet = re.sub(r"\s+", " ", m.line).strip()
        print(f"{m.path}:{m.line_no}: {m.phrase}: {snippet}")

    return 1


if __name__ == "__main__":
    raise SystemExit(main())
