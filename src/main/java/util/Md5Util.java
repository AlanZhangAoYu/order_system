package util;

import java.io.IOException;
import java.io.InputStream;
import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * @author ZAY
 */
public class Md5Util {
    /**
     * 获取字符串的MD5值用于加密
     */
    public static String getMd5Str(String str) {
        if(str == null){
            return "";
        }
        byte[] digest = null;
        try {
            MessageDigest md5 = MessageDigest.getInstance("md5");
            digest  = md5.digest(str.getBytes(StandardCharsets.UTF_8));
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        //16是表示转换为16进制数
        return new BigInteger(1, digest).toString(16);
    }
    /**
     * 获取该输入流的MD5值
     */
    public static String getMd5InputStream(InputStream is) throws NoSuchAlgorithmException, IOException {
        StringBuilder md5 = new StringBuilder();
        MessageDigest md = MessageDigest.getInstance("MD5");
        byte[] dataBytes = new byte[1024];
        int nread = 0;
        while ((nread = is.read(dataBytes)) != -1) {
            md.update(dataBytes, 0, nread);
        }
        byte[] mdBytes = md.digest();
        // convert the byte to hex format
        for (byte mdByte : mdBytes) {
            md5.append(Integer.toString((mdByte & 0xff) + 0x100, 16).substring(1));
        }
        return md5.toString();
    }
}
