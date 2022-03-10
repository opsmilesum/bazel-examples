load("@rules_java//java:defs.bzl", "java_test")

filegroup(
    name = "files",
    srcs = ["ComplexGeneratorTest.java"],
)

java_test(
    name = "test",
    srcs = ["files"],
    test_class = "src.test.java.com.examplebuild.complex.ComplexGeneratorTest",
    deps = ["@maven//:junit_junit"]
)