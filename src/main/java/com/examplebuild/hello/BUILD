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
    main_class = "com.examplebuild.hello.Hello",
    deps = [],
)