def remove_duplicates(name, src, out = "", **kwargs):
    if out == "":
        out = "output/" + name + "_output.csv"
    native.genrule(
        name = name,
        srcs = [src],
        outs = [out],
        cmd = "cat $< | awk '!a[$$0]++' | awk 'NF' > $@",
        **kwargs
    )

def compare_files_test(name, actual, expected, **kwargs):
    native.sh_test(
        name = name,
        size = "small",
        srcs = ["compare.sh"],
        args = [
            "$(rootpath %s)" %actual,
            "$(rootpath %s)" %expected,
        ],
        data = [actual, expected],
    )

def convert_csv_or_json(name, input, output):
    native.genrule(
       name = name,
       outs = [output],
       srcs = [input],
       cmd = "$(execpath //src/main/java/com/examplebuild/genrule/converter) Jack > $@",
       tools = ["//src/main/java/com/examplebuild/genrule/converter"]
   )