load(":defs.bzl", "compare_files_test", "remove_duplicates", "convert_csv_or_json")

# $@ is an alias for single-file output, instead of $(OUTS)
# $< is an alias for single-file input, instead of $(SRCS)
genrule(
    name = "genrule",
    srcs = ["input.txt"],
    outs = ["output.txt"],
    cmd_bash = "cat $< >> $@ && echo \"\nAppend output\" >> $@"
)

filegroup(
    name = "csv_data",
    srcs = ["data.csv"],
)

# bazel build //src/main/java/com/examplebuild/genrule:csv_sanitized
genrule(
    name = "csv_sanitized",
    srcs = [":csv_data"],
    outs = ["output/csv_sanitized.csv"],
    cmd_bash = "cat $< | awk '!a[$$0]++' | awk 'NF' > $@",
)

sh_test(
    name = "remove_deplicate_test",
    size = "small",
    srcs = ["compare.sh"],
    args = [
            "$(rootpath :csv_sanitized)",
            "$(rootpath //src/main/java/com/examplebuild/genrule/test:csv_expected)"
            ],
    data = [
            ":csv_sanitized",
            "//src/main/java/com/examplebuild/genrule/test:csv_expected"
            ]
)

#  MACRO---------------------------------------------------------------------
# bazel build //src/main/java/com/examplebuild/genrule:csv_sanitized_with_macro
remove_duplicates(
    name = "csv_sanitized_with_macro",
    src = ":csv_data",
)

compare_files_test(
    name = "remove_duplicates_macro_test",
    actual = ":csv_sanitized_with_macro",
    expected = "//src/main/java/com/examplebuild/genrule/test:csv_expected"
)

# Json-------------------------------------------------------------
convert_csv_or_json(
    name = "convert_csv",
    input = ":csv_sanitized_with_macro",
    output = "converted-data.json",
)

compare_files_test(
    name = "csvjson_convertion_test",
    actual = ":convert_csv",
    expected = "//src/main/java/com/examplebuild/genrule/test:json_exepected"
)

#convert_csv_or_json(
#    name = "convert_json",
#    input = ":convert_csv",
#    output = "converter-data-back.csv"
#)
#
#compare_files_test(
#    name = "jsoncsv_convertion_test",
#    actual = "convert_json",
#    expected = "//src/main/java/com/examplebuild/genrule/test:csv_expected"
#)