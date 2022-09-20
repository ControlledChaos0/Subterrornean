/**
 * Made by Jade Spooner
 * Anyone can use it, this is a program I made to help bitmap headaches for everyone
 *
 * Put this program in a folder that also has an image called "image.png" (unless you want to change the name of file in the code)
 * and then run the program.
 */

import java.io.*;
import java.awt.image.*;
import java.awt.*;
import javax.imageio.*;
import java.util.*;

public class ImageConverter {
    public static void main(String[] args) {
        try {
            ArrayList<String> colorMethods = new ArrayList<String>();
            int count = 0;
            int red5bit = 0;
            int green5bit = 0;
            int blue5bit = 0;

            FileWriter outFile = new FileWriter("output.txt");
            PrintWriter outWriter = new PrintWriter(outFile);

            File photo = new File("image.png");
            BufferedImage bi = ImageIO.read(photo);
            byte[] data = ((DataBufferByte) bi.getRaster().getDataBuffer()).getData();
            for ( int i = 0 ; i < data.length ; i++ ) {
                int colorValue = i % 4;
                int color = data[i];
                if (color < 0) {
                    color = color + 256;
                }

                switch(colorValue) {
                    case 99:
                        if (i != 0) {
                            String colorString = "COLOR(" + red5bit + ", " + green5bit + ", " + blue5bit + ")";

                            boolean duplicate = false;
                            int index = 0;
                            for (int j = 0; j < colorMethods.size(); j++) {
                                index = j;
                                if (colorMethods.get(j).equals(colorString)) {
                                    duplicate = true;
                                    j = colorMethods.size();
                                }
                            }
                            if (!duplicate) {
                                colorMethods.add(colorString);
                            }
                            if (count < bi.getWidth()) {
                                //System.out.print(colorMethods.indexOf(colorString) + ", ");
                                //System.out.print(colorMethods.get(index) + ", ");
                                //System.out.print(data[i] + ", ");
                                count++;
                            } else {
                                System.out.println();
                                count = 0;
                            }
                        }
                        break;
                    case 1:
                        //System.out.print(data[i] + ", ");
                        blue5bit = (int) Math.round((color / 255.0) * 31);
                        break;
                    case 2:
                        //System.out.print(data[i] + ", ");
                        green5bit = (int) Math.round((color / 255.0) * 31);
                        break;
                    case 3:
                        //System.out.print(data[i] + ", ");
                        red5bit = (int) Math.round((color / 255.0) * 31);
                        String colorString = "COLOR(" + red5bit + ", " + green5bit + ", " + blue5bit + ")";

                        boolean duplicate = false;
                        int index = 0;
                        for (int j = 0; j < colorMethods.size(); j++) {
                            index = j;
                            if (colorMethods.get(j).equals(colorString)) {
                                duplicate = true;
                                j = colorMethods.size();
                            }
                        }
                        if (!duplicate) {
                            colorMethods.add(colorString);
                        }
                        if (count < bi.getWidth()) {
                            outWriter.print(colorMethods.indexOf(colorString) + ", ");
                            //System.out.print(colorMethods.get(index) + ", ");
                            //System.out.print(data[i] + ", ");
                            count++;
                        } else {
                            outWriter.println();
                            outWriter.print(colorMethods.indexOf(colorString) + ", ");
                            count = 1;
                        }
                        break;
                }

            }
            outWriter.println();
            for (String s : colorMethods) {
                outWriter.println(s);
            }
            outWriter.close();
        } catch (IOException e) {
            System.out.println("Nice try buckaroo");
        }
    }
}