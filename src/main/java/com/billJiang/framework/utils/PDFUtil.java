package com.billJiang.framework.utils;

import com.itextpdf.text.pdf.BaseFont;
import org.xhtmlrenderer.pdf.ITextFontResolver;
import org.xhtmlrenderer.pdf.ITextRenderer;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
/**
 * Created by billJiang on 2016/12/9.
 * e-mail:jrn1012@petrochina.com.cn qq:475572229
 */
public class PDFUtil {


    public static boolean convertFileToPdf(String inputFile, String outputFile, String fontPath) throws Exception {
        File file=new File(outputFile);
        if(file.exists())
            file.delete();
        OutputStream os = new FileOutputStream(outputFile);
        ITextRenderer renderer = new ITextRenderer();
        String url = new File(inputFile).toURI().toURL().toString();
        renderer.setDocument(url);
        // 解决中文支持问题
        ITextFontResolver fontResolver = renderer.getFontResolver();

        fontResolver.addFont(fontPath + "/simsun.ttf",
                BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);
        fontResolver.addFont(fontPath + "/simsun.ttc",
                BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);
        // 解决图片的相对路径问题
        renderer.layout();
        renderer.createPDF(os);
        os.flush();
        os.close();
        return true;
    }

    public static boolean convertHtmlToPdf(String htmlCode, String outputFile, String fontPath) throws Exception {
        OutputStream os = new FileOutputStream(outputFile);
        ITextRenderer renderer = new ITextRenderer();
        renderer.setDocument(htmlCode);
        // 解决中文支持问题
        ITextFontResolver fontResolver = renderer.getFontResolver();

        fontResolver.addFont(fontPath + "/simsun.ttf",
                BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);
        fontResolver.addFont(fontPath + "/simsun.ttc",
                BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);
        // 解决图片的相对路径问题
        renderer.layout();
        renderer.createPDF(os);
        os.flush();
        os.close();
        return true;
    }

    public static void main(String[] args) {
        try {
            PDFUtil.convertFileToPdf(
                    "C:/work/github/AdminEAP/src/main/webapp/uploadPath/pdf/test.html",
                    "C:/work/github/AdminEAP/src/main/webapp/uploadPath/pdf/test1.pdf",
                    "C:/work/github/AdminEAP/src/main/webapp/uploadPath/pdf/font"
            );
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
