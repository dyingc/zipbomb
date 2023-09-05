import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

public class UnzipUtility {

    public static void main(String[] args) {
        if (args.length != 1) {
            System.out.println("Usage: java UnzipUtility <zipFilePath>");
            return;
        }

        String zipFilePath = args[0];
        String destDirectory = zipFilePath.substring(0, zipFilePath.lastIndexOf("."));

        File destDir = new File(destDirectory);
        if (!destDir.exists()) {
            destDir.mkdir();
        }

        try {
            unzip(zipFilePath, destDirectory);
            System.out.println("Unzipped successfully to: " + destDirectory);
        } catch (IOException e) {
            System.out.println("Error while unzipping: " + e.getMessage());
        }
    }

    public static void unzip(String zipFilePath, String destDirectory) throws IOException {
        try (FileInputStream fis = new FileInputStream(zipFilePath);
             ZipInputStream zis = new ZipInputStream(fis)) {

            ZipEntry entry = zis.getNextEntry();

            while (entry != null) {
                String filePath = destDirectory + File.separator + entry.getName();
                if (!entry.isDirectory()) {
                    extractFile(zis, filePath);
                } else {
                    File dir = new File(filePath);
                    dir.mkdir();
                }
                zis.closeEntry();
                entry = zis.getNextEntry();
            }
        }
    }

    private static void extractFile(ZipInputStream zipIn, String filePath) throws IOException {
        try (FileOutputStream fos = new FileOutputStream(filePath)) {
            byte[] bytesIn = new byte[4096];
            int read;
            while ((read = zipIn.read(bytesIn)) != -1) {
                fos.write(bytesIn, 0, read);
            }
        }
    }
}
