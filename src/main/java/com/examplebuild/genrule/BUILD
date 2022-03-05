genrule(
    name = "genrule",
    srcs = ["input.txt"],
    outs = ["output.txt"],
    cmd_bash = "cat $< >> $@ && echo \"\nAppend output\" >> $@"
)