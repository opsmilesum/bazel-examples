config_setting(
    name = "bar_config",
    values = {
        "define" : "key=bar"
    }
)

config_setting(
    name = "baz_config",
    values = {
        "define" : "key=baz"
    }
)

filegroup(
    name = "foo_and_bar_or_baz",
    srcs = ["foo.txt"] + select({
        # bazel build //src/main/java/com/examplebuild/configsetting:foo_and_bar_or_baz --define key=baz
        ":bar_config": ["bar.txt"],
        ":baz_config": ["baz.txt"],
        "//conditions:default": ["bar.txt"]
    }),
)