package org.yxsq.action.yxsq.user;

public class test2 {

    public static void main(String[] args) {
    	 
        String xx = "hdjksahdjkshj khkjdhsakj <img src=\"/ee/ads/blll/1.0.0/img/defineform.png\"/> dsadsajkdas";
 
        String regex = "<img src=\"/ee/ads/blll/1.0.0/img/defineform.png\"/>";
        xx = xx.replaceAll(regex, "");
        System.out.println(xx);
    }

}
