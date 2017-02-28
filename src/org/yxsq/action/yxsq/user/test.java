package org.yxsq.action.yxsq.user;


import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class test {
public   static   void   main(String[]   args)   {   
        String   html   =   "<html>\r\n"   +   
                "<head><title>test</title><head>\r\n"   +   
                "<body>"   +   
                "<P><IMG   height=\"100\"       src='abc.png'   weight=\"30\">abcdefg"   +  
                "<img   src='http://abc.xyz.com/123/456.jpg'   /><br>"   +   
                "<IMG   height=\"100\"       \r\n"   +   
                "       src=\"abc.jpg\"   \r\n"   +   
                "   weight=\"30\">abcdefg         \r\n"   +   
                "   <img   src=ttt.jpg>"   +   
                "   <img   src=123.jpg   />"   +   
//                 "<img   alt=\"src='abc'\">"   +   //这种我也无能为力   
                "</body></html>";   
          
        System.out.println(getImgSrc(html));   
        System.out.println(html);
    }   

    public   static   final   Pattern   PATTERN   =   Pattern.compile("<img\\s+(?:[^>]*)src\\s*=\\s*([^>]+)",   Pattern.CASE_INSENSITIVE   |   Pattern.MULTILINE);  
      
    public   static   List   getImgSrc(String   html)   {   
        Matcher   matcher   =   PATTERN.matcher(html);   
        List   list   =   new   ArrayList();   
        while   (matcher.find())   {   
            String   group   =   matcher.group(1);   
            if   (group   ==   null)   {   
                continue;   
            }   
            //   这里可能还需要更复杂的判断,用以处理src="...."内的一些转义符   
            if   (group.startsWith("'"))   {   
                list.add(group.substring(1,   group.indexOf("'",   1)));   
            }   else   if   (group.startsWith("\""))   {   
                list.add(group.substring(1,   group.indexOf("\"",   1)));   
            }   else   {   
                list.add(group.split("\\s")[0]);  
            }   
        }   
        return   list;   
        
    }

}