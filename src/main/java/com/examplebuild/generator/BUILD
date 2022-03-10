load("@rules_java//java:defs.bzl", "java_library")

filegroup(
    name = "complex_generator",
    srcs = ["ComplexGenerator.java"],
)

java_binary(
    name = "ComplexGenerator",
    srcs = ["complex_generator"],
    deps = [
        "@maven//:org_apache_commons_commons_math3",
    ],
)