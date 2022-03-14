package src.main.java.com.examplebuild.genrule.converter;

public class Converter {
    public static void main(String[] args) {
        System.out.printf("{the-key:%s}%n", args.length > 0 ? args[0] : "NULL");
    }
}
