load(":codegen.bzl", "codegen")

# bazel run //src/main/python/codegen:main -- test ~/code_repository/bazel-examples/src/main/python/codegen/testByPyBinary.py
py_binary(
    name = "main",
    srcs = ["main.py"],
    visibility = ["//visibility:public"],
)

#  bazel build //src/main/python/codegen:testgen
codegen(
    name = "testgen",
    key = "test"
)

py_library(
    name = "test",
    srcs = [":testgen"],
)

# bazel run //src/main/python/codegen:testbin
py_binary(
    name = "testbin",
    srcs = ["testbin.py"],
    deps = [
        ":test",
        "@repo_gen//:foo",
        "@repo_gen//:bar",
        "@repo_gen//:baz",
    ],
)



