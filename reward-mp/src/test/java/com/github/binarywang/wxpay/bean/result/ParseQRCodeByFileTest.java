package com.github.binarywang.wxpay.bean.result;

import com.google.common.collect.Maps;
import com.google.zxing.*;
import com.google.zxing.client.j2se.BufferedImageLuminanceSource;
import com.google.zxing.common.HybridBinarizer;
import org.junit.Test;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Map;

public class ParseQRCodeByFileTest {
    public static String parseQRCodeByFile(File file) {
        String resultStr = null;
        if (file == null || file.isDirectory() || !file.exists()) {
            return null;
        }
        try {
            /*ImageIO 的 BufferedImage read(URL input) 方法用于读取网络图片文件转为内存缓冲图像
             * 同理还有：read(File input)、read(InputStream input)、、read(ImageInputStream stream)
             */
            BufferedImage bufferedImage = ImageIO.read(file);
            /*
             * com.google.zxing.client.j2se.BufferedImageLuminanceSource：缓冲图像亮度源
             * 将 java.awt.image.BufferedImage 转为 zxing 的 缓冲图像亮度源
             * 关键就是下面这几句：HybridBinarizer 用于读取二维码图像数据，BinaryBitmap 二进制位图
             */
            BufferedImageLuminanceSource source = new BufferedImageLuminanceSource(bufferedImage);
            BinaryBitmap bitmap = new BinaryBitmap(new HybridBinarizer(source));
            Map<DecodeHintType, String> hints = Maps.newHashMap();
            hints.put(DecodeHintType.CHARACTER_SET, "UTF-8");
            /*
             * 如果图片不是二维码图片，则 decode 抛异常：com.google.zxing.NotFoundException
             * MultiFormatWriter 的 encode 用于对内容进行编码成 2D 矩阵
             * MultiFormatReader 的 decode 用于读取二进制位图数据
             */
            Result result = new MultiFormatReader().decode(bitmap, hints);
            resultStr = result.getText();
            System.out.println(resultStr);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (NotFoundException e) {
            e.printStackTrace();
            System.out.println("-----图片非二维码图片：" + file.getPath());
        }
        return resultStr;
    }

    @Test
    public void test02() {
        String path = "/Users/sunflower/Downloads/22.png";
        File file = new File(path);
        parseQRCodeByFile(file);
    }

}
