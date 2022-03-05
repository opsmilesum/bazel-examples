genrule(
    name = "test_genrule",
    srcs = ["input.txt"],
    outs = ["output.txt"],
    cmd_bash = "cat $< >> $@ && echo \"Append output\" >> $@"
)