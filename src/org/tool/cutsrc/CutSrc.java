package org.tool.cutsrc;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class CutSrc {

	public static final Pattern PATTERN = Pattern.compile("<img\\s+(?:[^>]*)src\\s*=\\s*([^>]+)", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE);  
    public static List getImgSrc(String html)   {   
        Matcher matcher = PATTERN.matcher(html);   
        List list = new ArrayList(); 
        while (matcher.find()) {   
            String group = matcher.group(1);   
            if (group == null) {   
                continue;   
            }   
            if (group.startsWith("'")) {   
                list.add(group.substring(1, group.indexOf("'", 1)));   
            } else if (group.startsWith("\"")) {   
                list.add(group.substring(1, group.indexOf("\"", 1)));   
            } else {   
                list.add(group.split("\\s")[0]);  
            }   
        }   
        return list;   
    }
}
