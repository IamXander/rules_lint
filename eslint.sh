#!/usr/bin/env bash
# Shows an end-to-end workflow for linting without failing the build

# Produce report files
bazel build //... --aspects //examples:lint.bzl%eslint --output_groups=report
# Process them
find $(bazel info bazel-bin) -type f -name "*eslint-report.txt" | xargs cat
