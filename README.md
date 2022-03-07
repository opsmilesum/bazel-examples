# bazel-examples

## Command
Query the targets
```shell script
bazel query @bazel_tools//tools/build_defs:all
```

### Generate maven_install.json
1. Remove the maven_install_json attribute from your `maven_install` declaration for `@maven`
2. Regenerate `maven_install.json` by running the command: `bazel run @maven//:pin`
3. Add `maven_install_json = "//:maven_install.json"` into your `maven_install` declaration
4. Run `bazel run @unpinned_maven//:pin` once dependencies changed.
