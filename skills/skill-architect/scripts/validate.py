#!/usr/bin/env python3
"""
Skill validation script.

Usage: python validate.py <skill-directory>

Validates:
- SKILL.md exists
- Frontmatter is properly formatted
- Required fields (name, description) are present
- Name follows conventions
- Description meets requirements
- Directory name matches skill name
"""

import re
import sys
from pathlib import Path


def parse_frontmatter(content: str) -> tuple[dict | None, str | None]:
    """Parse YAML frontmatter from SKILL.md content."""
    if not content.startswith("---"):
        return None, "SKILL.md must start with YAML frontmatter (---)"

    parts = content.split("---", 2)
    if len(parts) < 3:
        return None, "SKILL.md frontmatter not properly closed (missing second ---)"

    frontmatter_text = parts[1].strip()
    frontmatter = {}

    for line in frontmatter_text.split("\n"):
        if ":" in line:
            key, value = line.split(":", 1)
            frontmatter[key.strip()] = value.strip()

    return frontmatter, None


def validate_name(name: str, directory_name: str) -> list[str]:
    """Validate the skill name field."""
    errors = []

    if not name:
        errors.append("name field is required")
        return errors

    if len(name) > 64:
        errors.append(f"name must be <= 64 characters (got {len(name)})")

    if not re.match(r"^[a-z0-9][a-z0-9-]*[a-z0-9]$|^[a-z0-9]$", name):
        if name != name.lower():
            errors.append("name must be lowercase")
        elif name.startswith("-"):
            errors.append("name cannot start with hyphen")
        elif name.endswith("-"):
            errors.append("name cannot end with hyphen")
        elif "--" in name:
            errors.append("name cannot contain consecutive hyphens")
        elif not re.match(r"^[a-z0-9-]+$", name):
            errors.append("name can only contain lowercase letters, numbers, and hyphens")

    if name != directory_name:
        errors.append(f"name '{name}' must match directory name '{directory_name}'")

    reserved = ["anthropic", "claude"]
    for word in reserved:
        if word in name.lower():
            errors.append(f"name cannot contain reserved word '{word}'")

    return errors


def validate_description(description: str) -> list[str]:
    """Validate the skill description field."""
    errors = []

    if not description:
        errors.append("description field is required")
        return errors

    if len(description) > 1024:
        errors.append(f"description must be <= 1024 characters (got {len(description)})")

    if "<" in description or ">" in description:
        errors.append("description cannot contain angle brackets (< or >)")

    # Warnings (not errors, but worth noting)
    warnings = []

    if description.startswith("I ") or " I " in description:
        warnings.append("description should be third person (avoid 'I')")

    if description.startswith("You ") or " you " in description.lower():
        warnings.append("description should be third person (avoid 'you')")

    trigger_phrases = ["use when", "triggers on", "use for", "invoke when"]
    has_trigger = any(phrase in description.lower() for phrase in trigger_phrases)
    if not has_trigger:
        warnings.append("description should include when to use (e.g., 'Use when...')")

    return errors, warnings


def validate_frontmatter_keys(frontmatter: dict) -> list[str]:
    """Check for unknown frontmatter keys."""
    allowed_keys = {"name", "description", "license", "compatibility", "metadata", "allowed-tools"}
    unknown = set(frontmatter.keys()) - allowed_keys

    if unknown:
        return [f"unknown frontmatter keys: {', '.join(unknown)}"]
    return []


def validate_skill(skill_path: Path) -> tuple[list[str], list[str]]:
    """Validate a skill directory. Returns (errors, warnings)."""
    errors = []
    warnings = []

    # Check SKILL.md exists
    skill_md = skill_path / "SKILL.md"
    if not skill_md.exists():
        errors.append(f"SKILL.md not found in {skill_path}")
        return errors, warnings

    # Parse content
    content = skill_md.read_text()
    frontmatter, parse_error = parse_frontmatter(content)

    if parse_error:
        errors.append(parse_error)
        return errors, warnings

    # Validate frontmatter keys
    errors.extend(validate_frontmatter_keys(frontmatter))

    # Validate name
    name = frontmatter.get("name", "")
    directory_name = skill_path.name
    errors.extend(validate_name(name, directory_name))

    # Validate description
    description = frontmatter.get("description", "")
    desc_errors, desc_warnings = validate_description(description)
    errors.extend(desc_errors)
    warnings.extend(desc_warnings)

    # Check SKILL.md length
    body_lines = content.split("---", 2)[2].strip().split("\n") if "---" in content else []
    if len(body_lines) > 500:
        warnings.append(f"SKILL.md body is {len(body_lines)} lines (recommend < 500)")

    # Check for referenced files (skip those inside code blocks)
    # Remove code blocks before checking references
    content_no_codeblocks = re.sub(r'```[\s\S]*?```', '', content)
    content_no_codeblocks = re.sub(r'`[^`]+`', '', content_no_codeblocks)

    for match in re.finditer(r'\[.*?\]\((references/[^)]+)\)', content_no_codeblocks):
        ref_link = match.group(1)
        # Strip anchor fragments (e.g., #section-name) before checking file exists
        ref_file = ref_link.split("#")[0]
        ref_path = skill_path / ref_file
        if not ref_path.exists():
            errors.append(f"referenced file not found: {ref_file}")

    return errors, warnings


def main():
    if len(sys.argv) < 2:
        print("Usage: python validate.py <skill-directory>")
        print("\nValidates a skill directory for correctness.")
        sys.exit(1)

    skill_path = Path(sys.argv[1]).resolve()

    if not skill_path.is_dir():
        print(f"Error: {skill_path} is not a directory")
        sys.exit(1)

    print(f"Validating skill: {skill_path.name}")
    print("-" * 40)

    errors, warnings = validate_skill(skill_path)

    if errors:
        print("\nErrors (must fix):")
        for error in errors:
            print(f"  - {error}")

    if warnings:
        print("\nWarnings (consider fixing):")
        for warning in warnings:
            print(f"  - {warning}")

    if not errors and not warnings:
        print("All checks passed!")

    print("-" * 40)

    if errors:
        print(f"Result: FAILED ({len(errors)} errors, {len(warnings)} warnings)")
        sys.exit(1)
    elif warnings:
        print(f"Result: PASSED with warnings ({len(warnings)} warnings)")
        sys.exit(0)
    else:
        print("Result: PASSED")
        sys.exit(0)


if __name__ == "__main__":
    main()
