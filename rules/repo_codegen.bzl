BUILD_FILE_TEMPLATE= """
codegen(
    name = "{key}gen",
    key = "{key}",
)

py_library(
    name = "{key}",
    srcs = [":{key}gen"],
    visibility = ["//visibility:public"],
)
"""

def _repo_codegen_impl(repository_ctx):
    content = """load("@//src/main/python/codegen:codegen.bzl", "codegen")"""
    for key in repository_ctx.attr.keys:
        content += BUILD_FILE_TEMPLATE.format(key = key)

    repository_ctx.file(
        "BUILD.bazel",
        content
    )

repo_codegen = repository_rule(
    implementation = _repo_codegen_impl,
    attrs = {
        "keys": attr.string_list(
            mandatory =  True,
        )
    }
)
