load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
RULES_JVM_EXTERNAL_TAG = "3.3"
RULES_JVM_EXTERNAL_SHA= "d85951a92c0908c80bd8551002d66cb23c3434409c814179c0ff026b53544dab"

http_archive(
    name = "rules_jvm_external",
    sha256 = RULES_JVM_EXTERNAL_SHA,
    strip_prefix = "rules_jvm_external-%s" % RULES_JVM_EXTERNAL_TAG,
    url = "https://github.com/bazelbuild/rules_jvm_external/archive/%s.zip" % RULES_JVM_EXTERNAL_TAG,
)

load("@rules_jvm_external//:defs.bzl", "maven_install")
#load("@rules_jvm_external//:specs.bzl", "maven")

maven_install(
    name = "maven",
    artifacts = [
        "org.apache.commons:commons-math3:3.2",
        "com.google.guava:guava:jar:sources:28.2-jre",
        "org.slf4j:slf4j-api:jar:sources:1.7.30",
        "junit:junit:4.8.1"
    ],
    maven_install_json = "//:maven_install.json",
    repositories = [
        "https://jcenter.bintray.com",
        "https://repo.spring.io/milestone/",
        "https://repo1.maven.org/maven2/",
        "https://packages.confluent.io/maven/",
        "https://repository.apache.org/"
    ]
)

load("@maven//:defs.bzl", "pinned_maven_install")
pinned_maven_install()