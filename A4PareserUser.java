import java . io .*;
class A4User {
    public static void main(String[] args) {
        try{
            File inputFile = new File ("A4.input");
            A4Parser parser = new A4Parser (new A4Scanner(new FileInputStream(inputFile)));
            String javaProgram = (String)(parser.debug_parse().value);
            FileWriter fw = new FileWriter("A4.java");
            fw.write(javaProgram);
            fw.close();
            System.out.println(javaProgram);
        }
        catch (Exception e){
            e.printStackTrace();
        }
    } 
}