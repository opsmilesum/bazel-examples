load("@rules_java//java:defs.bzl", "java_binary")

filegroup(
    name = "hello_file",
    srcs = ["Hello.java"],
)

alias(
    name = "hello_alias",
    actual = "hello_file",
)

java_binary(
    name = "hello",
    srcs = ["hello_alias"],
    main_class = "src.main.java.com.examplebuild.hello.Hello",
    deps = [
        "@maven//:org_apache_commons_commons_math3",
        "@maven//:org_slf4j_slf4j_api",
    ],
)