package com.common.util;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
 
import net.sf.json.JSONObject;

/**
 * 自定义菜单
 * @author Administrator
 *
 */
public class MenuUtil {
	
	private static String APPID = "wx84ee0f61c8ab5c10";
	private static String APPSECRET = "00a9b2f6be0f56a6c123b2e677a1d634";
	 /**
     * 获得ACCESS_TOKEN
    * @Title: getAccess_token
    * @Description: 获得ACCESS_TOKEN
    * @param @return    设定文件
    * @return String    返回类型
    * @throws
     */
    private static String getAccess_token(){  
          
          String url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid="+ APPID + "&secret=" +APPSECRET;
          String accessToken = null;
         try {
                URL urlGet = new URL(url);
                HttpURLConnection http = (HttpURLConnection) urlGet.openConnection();    
                  
                http.setRequestMethod("GET");      //必须是get方式请求    
                http.setRequestProperty("Content-Type","application/x-www-form-urlencoded");    
                http.setDoOutput(true);        
                http.setDoInput(true);
                System.setProperty("sun.net.client.defaultConnectTimeout", "30000");//连接超时30秒
                System.setProperty("sun.net.client.defaultReadTimeout", "30000"); //读取超时30秒
 
                http.connect();
              
                InputStream is =http.getInputStream();
                int size =is.available();
                byte[] jsonBytes =new byte[size];
                is.read(jsonBytes);
                String message=new String(jsonBytes,"UTF-8");
                  
                JSONObject demoJson = new JSONObject().fromObject(message);
                accessToken = demoJson.getString("access_token");
                  
                System.out.println(message);
                } catch (Exception e) {
                    e.printStackTrace();
                }
           return accessToken;
        }
     
    /**
     * 创建Menu
    * @Title: createMenu
    * @Description: 创建Menu
    * @param @return
    * @param @throws IOException    设定文件
    * @return int    返回类型
    * @throws
     */
    public static String createMenu() {
//      String menu = "{\"button\":[{\"type\":\"view\",\"name\":\"我的业务\",\"url\":\"http://rrgcll2mwr.proxy.qqbrowser.cc/diethealth/user/bindUser\"},{\"type\":\"click\",\"name\":\"健康资讯\",\"key\":\"healthMsg\"}]}";
        //此处改为自己想要的结构体，替换即可
        String access_token= getAccess_token();
        String menu = "{\"button\":[{\"type\":\"view\",\"name\":\"我的业务\",\"url\":\"https://open.weixin.qq.com/connect/oauth2/authorize?"
        		+ "appid="+APPID+"&redirect_uri=http://rrgcll2mwr.proxy.qqbrowser.cc/diethealth/user/bindUser&response_type=code&scope=snsapi_base"
        				+ "&state=STATE#wechat_redirect\"},{\"type\":\"click\",\"name\":\"健康资讯\",\"key\":\"healthMsg\"}]}";
        
        String action = "https://api.weixin.qq.com/cgi-bin/menu/create?access_token="+access_token;
        try {
           URL url = new URL(action);
           HttpURLConnection http =   (HttpURLConnection) url.openConnection();    
             
           http.setRequestMethod("POST");        
           http.setRequestProperty("Content-Type","application/x-www-form-urlencoded");    
           http.setDoOutput(true);        
           http.setDoInput(true);
           System.setProperty("sun.net.client.defaultConnectTimeout", "30000");//连接超时30秒
           System.setProperty("sun.net.client.defaultReadTimeout", "30000"); //读取超时30秒
 
           http.connect();
           OutputStream os= http.getOutputStream();    
           os.write(menu.getBytes("UTF-8"));//传入参数    
           os.flush();
           os.close();
         
           InputStream is =http.getInputStream();
           int size =is.available();
           byte[] jsonBytes =new byte[size];
           is.read(jsonBytes);
           String message=new String(jsonBytes,"UTF-8");
           return "返回信息"+message;
           } catch (MalformedURLException e) {
               e.printStackTrace();
           } catch (IOException e) {
               e.printStackTrace();
           }    
        return "createMenu 失败";
   }
     
    /**
     * 删除当前Menu
    * @Title: deleteMenu
    * @Description: 删除当前Menu
    * @param @return    设定文件
    * @return String    返回类型
    * @throws
     */
   public static String deleteMenu()
   {
       String access_token= getAccess_token();
       String action = "https://api.weixin.qq.com/cgi-bin/menu/delete? access_token="+access_token;
       try {
          URL url = new URL(action);
          HttpURLConnection http =   (HttpURLConnection) url.openConnection();    
            
          http.setRequestMethod("GET");        
          http.setRequestProperty("Content-Type","application/x-www-form-urlencoded");    
          http.setDoOutput(true);        
          http.setDoInput(true);
          System.setProperty("sun.net.client.defaultConnectTimeout", "30000");//连接超时30秒
          System.setProperty("sun.net.client.defaultReadTimeout", "30000"); //读取超时30秒
 
          http.connect();
          OutputStream os= http.getOutputStream();    
          os.flush();
          os.close();
        
          InputStream is =http.getInputStream();
          int size =is.available();
          byte[] jsonBytes =new byte[size];
          is.read(jsonBytes);
          String message=new String(jsonBytes,"UTF-8");
          return "deleteMenu返回信息:"+message;
          } catch (MalformedURLException e) {
              e.printStackTrace();
          } catch (IOException e) {
              e.printStackTrace();
          }
       return "deleteMenu 失败";   
   }
    
    public static void main(String[] args) {
        System.out.println(createMenu());
     
    }
}
